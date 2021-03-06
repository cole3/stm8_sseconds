#include <stdio.h>
#include <stddef.h>

#include "stm8l15x_conf.h"

#include "atom.h"
#include "atommutex.h"
#include "atomqueue.h"
#include "uart.h"


#define UART_REV_Q_MSG_MAX      8


NEAR static ATOM_MUTEX uart_send_mutex;
NEAR static ATOM_QUEUE uart_rev_queue;
NEAR static uint8_t uart_rev_q_msg[UART_REV_Q_MSG_MAX];

/*
 * Initialize the UART to requested baudrate, tx/rx, 8N1.
 */
int uart_init(uint32_t baudrate)
{
    int status = 0;

    SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
    CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
    GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
    GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);

    USART_Init(USART1, baudrate,
               USART_WordLength_8b,
               USART_StopBits_1,
               USART_Parity_No,
               (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));

    if (atomMutexCreate (&uart_send_mutex) != ATOM_OK) {
        status = -1;
        goto uart_init_err;
    }

    if (atomQueueCreate(&uart_rev_queue, (uint8_t *)uart_rev_q_msg,
                        sizeof(uart_rev_q_msg[0]), UART_REV_Q_MSG_MAX) != ATOM_OK) {
        status = -1;
        goto uart_init_err;
    }

    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);

uart_init_err:
    /* Finished */
    return (status);
}


/**
 * \b uart_putchar
 *
 * Write a char out via UART2
 *
 * @param[in] c Character to send
 *
 * @return Character sent
 */
char uart_putchar (char c)
{
    /* Block on private access to the UART */
    if (atomMutexGet(&uart_send_mutex, 0) == ATOM_OK) {
        /* Convert \n to \r\n */
        if (c == '\n')
            putchar('\r');

        /* Write a character to the UART2 */
        USART_SendData8(USART1, c);

        /* Loop until the end of transmission */
        while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);

        /* Return mutex access */
        atomMutexPut(&uart_send_mutex);

    }

    return (c);
}

char uart_getchar (void)
{
    uint8_t msg;

    if (atomQueueGet(&uart_rev_queue, 0, (uint8_t *)&msg) != ATOM_OK) {
        return (char)-1;
    }

    return msg;
}


/* COSMIC: Requires putchar() routine to override stdio */
#if defined(__CSMC__)
/**
 * \b putchar
 *
 * Retarget putchar() to use UART2
 *
 * @param[in] c Character to send
 *
 * @return Character sent
 */
char putchar (char c)
{
    return (uart_putchar(c));
}

char getchar (void)
{
    return (uart_getchar());
}

#endif /* __CSMC__ */


/* RAISONANCE: Requires putchar() routine to override stdio */
#if defined(__RCSTM8__)
/**
 * \b putchar
 *
 * Retarget putchar() to use UART2
 *
 * @param[in] c Character to send
 *
 * @return 1 on success
 */
int putchar (char c)
{
    uart_putchar(c);
    return (1);
}
#endif /* __RCSTM8__ */


/* IAR: Requires __write() routine to override stdio */
#if defined(__IAR_SYSTEMS_ICC__)
/**
 * \b __write
 *
 * Override for IAR stream output
 *
 * @param[in] handle Stdio handle. -1 to flush.
 * @param[in] buf Pointer to buffer to be written
 * @param[in] bufSize Number of characters to be written
 *
 * @return Number of characters sent
 */
size_t __write(int handle, const unsigned char *buf, size_t bufSize)
{
    size_t chars_written = 0;

    /* Ignore flushes */
    if (handle == -1) {
        chars_written = (size_t)0;
    }
    /* Only allow stdout/stderr output */
    else if ((handle != 1) && (handle != 2)) {
        chars_written = (size_t)-1;
    }
    /* Parameters OK, call the low-level character output routine */
    else {
        while (chars_written < bufSize) {
            uart_putchar (buf[chars_written]);
            chars_written++;
        }
    }

    return (chars_written);
}
#endif /* __IAR_SYSTEMS_ICC__ */

INTERRUPT void UART_RcvISR (void)
{
    uint8_t temp;

    atomIntEnter();

    temp = USART_ReceiveData8(USART1);
    atomQueuePut(&uart_rev_queue, 0, &temp);

    atomIntExit(FALSE);
}

