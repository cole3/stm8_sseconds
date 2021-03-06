#include <stdio.h>

#include "atom.h"
#include "atomqueue.h"
#include "atomport-private.h"
#include "stm8l15x_conf.h"
#include "uart.h"
#include "display.h"
#include "cli.h"


#define ARRAY_SIZE(a)   (sizeof(a)/sizeof(a[0]))

struct thread_info {
    const char *name;
    ATOM_TCB *tcb_ptr;
    uint8_t priority;
    void (*entry_point)(uint32_t);
    uint32_t entry_param;
    uint8_t *stack_bottom;
    uint32_t stack_size;
};


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

#define KEY_QUEUE_ENTRIES           5
NEAR ATOM_QUEUE key_queue;
NEAR static uint8_t key_queue_storage[KEY_QUEUE_ENTRIES];



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

static void key_init(void)
{
    int8_t status;

    GPIO_Init(GPIOF, GPIO_Pin_4, GPIO_Mode_In_FL_IT);
    EXTI_SelectPort(EXTI_Port_F);
    EXTI_SetPinSensitivity(EXTI_Pin_4, EXTI_Trigger_Falling);

    GPIO_Init(GPIOF, GPIO_Pin_5, GPIO_Mode_In_FL_IT);
    EXTI_SelectPort(EXTI_Port_F);
    EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling);

    status = atomQueueCreate(&key_queue, (uint8_t *)key_queue_storage,
                             sizeof(key_queue_storage[0]), KEY_QUEUE_ENTRIES);
    if (status != ATOM_OK) {
        printf("atomQueueCreate keyqueue failed!\n");
        return;
    }
}

int32_t count = 0;

static void main_thread(uint32_t param)
{
    CRITICAL_STORE;
    RTC_DateTypeDef date;
    RTC_TimeTypeDef clock;
    struct display_msg msg;
    int32_t count_main = 0;
    int8_t status;
    uint8_t key_val;
    int i;

    rtc_alarm_init();
    key_init();

    //printf("[main_thread] enter\n");

    while (1) {
        count++;
        //printf("[main_thread] count = %d\n", (int16_t)count);

        status = atomQueueGet(pt_display_queue, -1, &key_val);
        //printf("[main_thread] receive key = %d\n", (int16_t)key_val);
        if (status != ATOM_OK) {
            continue;
        }

        switch (key_val) {
        case 0:
            printf("[main_thread] key = %d\n", (int16_t)key_val);
            break;
        case 1:
            printf("[main_thread] key = %d\n", (int16_t)key_val);
            break;
        default:
            break;
        }

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
        atomTimerDelay(SYSTEM_TICKS_PER_SEC);
    }
}


struct thread_info threads_info[] = {
/*   name,          tcb_ptr,       priority,   entry_point,        entry_param,    stack_top,              stack_size*/
    {"main",        &main_tcb,     15,         main_thread,        0,              main_thread_stack,      MAIN_STACK_SIZE},
    {"cli",         &cli_tcb,      16,         display_thread,     0,              cli_thread_stack,       DISPLAY_STACK_SIZE},
    {"display",     &display_tcb,  17,         cli_thread,         0,              display_thread_stack,   CLI_STACK_SIZE},
};

void main(void)
{
    int8_t i, status;
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

    for (i = 0; i < ARRAY_SIZE(threads_info); i++) {
        status = atomThreadCreate(threads_info[i].tcb_ptr,
                                  threads_info[i].priority,
                                  threads_info[i].entry_point,
                                  0,
                                  threads_info[i].stack_bottom + threads_info[i].stack_size - 1,
                                  threads_info[i].stack_size);
        if (status != ATOM_OK) {
            printf("atomThreadCreate %s failed!\n", threads_info[i].name);
            goto err;
        }
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

INTERRUPT void EXTI_Key0ISR (void)
{
    uint8_t key_val;

    atomIntEnter();

    printf("EXTI_Key1ISR rcv key\n");
    key_val = 0;
    atomQueuePut(&key_queue, -1, &key_val);

    atomIntExit(TRUE);
}

INTERRUPT void EXTI_Key1ISR (void)
{
    uint8_t key_val;

    atomIntEnter();

    printf("EXTI_Key2ISR rcv key\n");
    key_val = 1;
    atomQueuePut(&key_queue, -1, &key_val);

    atomIntExit(TRUE);
}


#ifdef  USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{
    /* User can add his own implementation to report the file name and line number,
       ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
    /* Infinite loop */
    printf("Assert @%s:%d!\n", file, line);
    while (1) {
    }
}
#endif

