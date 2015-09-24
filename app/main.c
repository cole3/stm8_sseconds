/**
  ******************************************************************************
  * @file    GPIO/GPIO_Toggle/main.c
  * @author  MCD Application Team
  * @version V1.5.0
  * @date    13-May-2011
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>

#include "atom.h"
#include "atomport-private.h"
#include "stm8l15x_conf.h"

/** @addtogroup STM8L15x_StdPeriph_Examples
  * @{
  */

/** @addtogroup GPIO_Toggle
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* define the GPIO port and pins connected to Leds mounted on STM8L152X-EVAL board */
#define LED_GPIO_PORT  GPIOE
#define LED_GPIO_PINS  GPIO_Pin_7


/* Private macro -------------------------------------------------------------*/
#define IDLE_STACK_SIZE_BYTES       128
#define MAIN_STACK_SIZE_BYTES       256
#define TEST_THREAD_PRIO            16

/* Private variables ---------------------------------------------------------*/
NEAR static uint8_t main_thread_stack[MAIN_STACK_SIZE_BYTES];
NEAR static uint8_t idle_thread_stack[IDLE_STACK_SIZE_BYTES];
static ATOM_TCB main_tcb;

/* Private function prototypes -----------------------------------------------*/
void Delay (uint16_t nCount);
/* Private functions ---------------------------------------------------------*/

#define TIM1_PERIOD                  4095
#define TIM1_PRESCALER                  0
#define TIM1_REPTETION_COUNTER          0

#define CCR1_VAL                     2047
#define CCR2_VAL                     1023
#define CCR3_VAL                      511
#define DEADTIME                        1

static void TIM1_Config(void)
{
    /* Time Base configuration */
    TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);

    /* Channels 1, 2 and 3 Configuration in TIMING mode */
    TIM1_OC1Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR1_VAL,
               TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
    TIM1_OC2Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR2_VAL,
               TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
    TIM1_OC3Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR3_VAL,
               TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);

    /* Automatic Output Enable, Break, dead time and lock configuration*/
    TIM1_BDTRConfig(TIM1_OSSIState_Enable, TIM1_LockLevel_Off, DEADTIME,
                  TIM1_BreakState_Enable, TIM1_BreakPolarity_Low, TIM1_AutomaticOutput_Disable);

    TIM1_CCPreloadControl(ENABLE);
    TIM1_ITConfig(TIM1_IT_COM, ENABLE);
    /* Main Output Enable */
    TIM1_CtrlPWMOutputs(ENABLE);
    /* TIM1 counter enable */
    TIM1_Cmd(ENABLE);
}

static void TIM4_Config(void)
{
    /* TIM4 configuration:
    - TIM4CLK is set to 16 MHz, the TIM4 Prescaler is equal to 128 so the TIM1 counter
    clock used is 16 MHz / 128 = 125 000 Hz
    - With 125 000 Hz we can generate time base:
    max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 125000 = 2.048 ms
    min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 125000 = 0.016 ms
    - In this example we need to generate a time base equal to 1 ms
    so TIM4_PERIOD = (0.001 * 125000 - 1) = 124 */

    /* Time base configuration */
    TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
    /* Clear TIM4 update flag */
    TIM4_ClearFlag(TIM4_FLAG_Update);
    /* Enable update interrupt */
    TIM4_ITConfig(TIM4_IT_Update, ENABLE);
    /* enable interrupts */
    enableInterrupts();

    /* Enable TIM4 */
    TIM4_Cmd(ENABLE);
}

static void main_thread_func (uint32_t param)
{
    int cnt = 0;

    /* Test finished, flash slowly for pass, fast for fail */
    while (1)
    {
        printf("main_thread_func cnt=%d\n", cnt++);

        /* Sleep then toggle LED again */
        atomTimerDelay(SYSTEM_TICKS_PER_SEC);
    }
}

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
	int8_t status;

	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);

	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);

    /* Enable USART clock */
    CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);

    /* Configure USART Tx as alternate function push-pull  (software pull up)*/
    GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);

    /* Configure USART Rx as alternate function push-pull  (software pull up)*/
    GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);

    /* USART configuration */
    USART_Init(USART1, 115200,
             USART_WordLength_8b,
             USART_StopBits_1,
             USART_Parity_No,
             (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));

    /* Initialize LEDs mounted on STM8L152X-EVAL board */
    GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);

	enableInterrupts();

	status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
	if (status == ATOM_OK)
	{
			/* Enable the system tick timer */
			archInitSystemTickTimer();

			/* Create an application thread */
			status = atomThreadCreate(&main_tcb,
									 TEST_THREAD_PRIO, main_thread_func, 0,
									 &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
									 MAIN_STACK_SIZE_BYTES);
			if (status == ATOM_OK)
			{
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
			}
	}

  while (1)
  {
		unsigned char c;

		while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);

		c = USART_ReceiveData8(USART1);

		USART_SendData8(USART1, c);
		/* Loop until the end of transmission */
		while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);

    /* Toggle LEDs LD1..LD4 */
    GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);
    //Delay(0xFFFF);
  }
}

/**
  * @brief  Inserts a delay time.
  * @param  nCount: specifies the delay time length.
  * @retval None
  */
void Delay(__IO uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* Infinite loop */
  while (1)
  {}
}
#endif

/**
  * @}
  */

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
