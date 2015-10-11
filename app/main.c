#include <stdio.h>

#include "atom.h"
#include "atomqueue.h"
#include "atomport-private.h"
#include "stm8l15x_conf.h"
#include "uart.h"
#include "display.h"
#include "cli.h"



#define MAIN_THREAD_PRIO            15
#define CLI_THREAD_PRIO             17
#define DISPLAY_THREAD_PRIO         16


#define IDLE_STACK_SIZE             128
#define MAIN_STACK_SIZE             256
#define CLI_STACK_SIZE              256
#define DISPLAY_STACK_SIZE          256



NEAR static uint8_t idle_thread_stack[IDLE_STACK_SIZE];
NEAR static uint8_t main_thread_stack[MAIN_STACK_SIZE];
NEAR static uint8_t cli_thread_stack[CLI_STACK_SIZE];
NEAR static uint8_t display_thread_stack[DISPLAY_STACK_SIZE];

static ATOM_TCB main_tcb;
static ATOM_TCB cli_tcb;
static ATOM_TCB display_tcb;



void delay(uint16_t nCount);


static void rtc_alarm_init(void)
{
    CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);

    /* Enable RTC clock */
    CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);

    /* Configures the RTC */
    RTC_WakeUpClockConfig(RTC_WakeUpClock_CK_SPRE_16bits);

    RTC_ITConfig(RTC_IT_WUT, ENABLE);

    while (RTC_WaitForSynchro() != SUCCESS);
}

int32_t count = 0;

static void main_thread(uint32_t param)
{
    CRITICAL_STORE;
    RTC_DateTypeDef date;
    RTC_TimeTypeDef clock;
    struct display_msg msg;
    int32_t count_main = 0;
    int i;

    rtc_alarm_init();

    //printf("[main_thread] enter\n");

    while (1) {
        count++;
        //printf("[main_thread] count = %d\n", (int16_t)count);
        {
            CRITICAL_START();
            RTC_GetDate(RTC_Format_BIN, &date);
            CRITICAL_END();

            msg.type = DISPLAY_DATE;
            msg.u.date.month = date.RTC_Month;
            msg.u.date.day = date.RTC_Date;
            atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);
        }
        {
            CRITICAL_START();
            RTC_GetTime(RTC_Format_BIN, &clock);
            CRITICAL_END();

            msg.type = DISPLAY_CLOCK;
            msg.u.clock.hour = clock.RTC_Hours;
            msg.u.clock.minute = clock.RTC_Minutes;
            msg.u.clock.pm = clock.RTC_H12;
            atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);
        }
        atomTimerDelay(4 * SYSTEM_TICKS_PER_SEC);
    }
}


void main(void)
{
    int8_t status;
    uint8_t c = 0;

    CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);

    enableInterrupts();

    uart_init(115200);

    printf("main start.\n");

    status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE - 1], IDLE_STACK_SIZE);
    if (status != ATOM_OK) {
        printf("atomOSInit failed!\n");
        goto err;
    }

    archInitSystemTickTimer();

    status = atomThreadCreate(&main_tcb,
                              MAIN_THREAD_PRIO, main_thread, 0,
                              &main_thread_stack[MAIN_STACK_SIZE - 1],
                              MAIN_STACK_SIZE);
    if (status != ATOM_OK) {
        printf("atomThreadCreate main_thread failed!\n");
        goto err;
    }

    status = atomThreadCreate(&display_tcb,
                              DISPLAY_THREAD_PRIO, display_thread, 0,
                              &display_thread_stack[DISPLAY_STACK_SIZE - 1],
                              DISPLAY_STACK_SIZE);
    if (status != ATOM_OK) {
        printf("atomThreadCreate display_thread failed!\n");
        goto err;
    }

    status = atomThreadCreate(&cli_tcb,
                              CLI_THREAD_PRIO, cli_thread, 0,
                              &cli_thread_stack[CLI_STACK_SIZE - 1],
                              CLI_STACK_SIZE);
    if (status != ATOM_OK) {
        printf("atomThreadCreate cli_thread failed!\n");
        goto err;
    }

    /**
     * First application thread successfully created. It is
     * now possible to start the OS. Execution will not return
     * from atomOSStart(), which will restore the context of
     * our application thread and start executing it.
     *
     * Note that interrupts are still disabled at this point.
     * They will be enabled as we restore and execute our first
     * thread in archFirstThreadRestore().
     */
    atomOSStart();

err:
    printf("Oops!\n");
    while (1);
}

void delay(__IO uint16_t nCount)
{
    while (nCount) {
        nCount--;
    }
}

#ifdef  USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{
    /* User can add his own implementation to report the file name and line number,
       ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
    /* Infinite loop */
    while (1) {
    }
}
#endif

