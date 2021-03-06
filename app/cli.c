#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "atom.h"
#include "atomqueue.h"
#include "display.h"
#include "cli.h"


extern struct thread_info threads_info[];

typedef void (* cli_func)(int32_t argc, char **argv);

struct CLI_TAB {
    const char *name;
    const char *info;
    cli_func   func;
};


static void stack_info(int32_t argc, char **argv)
{
#ifdef ATOM_STACK_CHECKING
    uint32_t used_bytes, free_bytes;
    int8_t i;

    printf("Stack Info:\n");
    for (i = 0; i < ARRAY_SIZE(threads_info); i++) {
        if (atomThreadStackCheck (&threads_info[i].tcb, &used_bytes, &free_bytes) != ATOM_OK) {
            printf("StackCheck error\n");
            continue;
        }

        printf("%s:\tTotal:%d\tUse:%d\tFree%d\n"), threads_info[i].name, threads_info[i].stack_size,
            (uint16_t)used_bytes, (uint16_t)free_bytes);
        if (free_bytes == 0) {
            printf("StackOverflow!!!\n");
            failures++;
        }
    }
#else
    printf("If use this function, need open ATOM_STACK_CHECKING macro!\n");
#endif
}

static void set_date(int32_t argc, char **argv)
{
    RTC_DateTypeDef rtc_date = {};
    struct display_msg msg;
    CRITICAL_STORE;

    if (argc < 4) {
        printf("set_date year month day [week]\n");
        return;
    }

    rtc_date.RTC_Year = atoi((char *)argv[1]);
    rtc_date.RTC_Month = atoi((char *)argv[2]);
    rtc_date.RTC_Date = atoi((char *)argv[3]);
    if (argc >= 5) {
        rtc_date.RTC_WeekDay = atoi((char *)argv[4]);
    }

    CRITICAL_START();
    if (RTC_SetDate(RTC_Format_BIN, &rtc_date) != SUCCESS) {
        CRITICAL_END();
        printf("set_date fail!\n");
        return;
    }
    CRITICAL_END();

    msg.type = DISPLAY_DATE;
    msg.u.date.month = rtc_date.RTC_Month;
    msg.u.date.day = rtc_date.RTC_Date;
    printf("set_date send to diapQ [%d-%d-%d]\n", (uint16_t)rtc_date.RTC_Year,
           (uint16_t)rtc_date.RTC_Month, (uint16_t)rtc_date.RTC_Date);
    atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);
}

static void get_date(int32_t argc, char **argv)
{
    RTC_DateTypeDef rtc_date;
    CRITICAL_STORE;

    CRITICAL_START();
    RTC_GetDate(RTC_Format_BIN, &rtc_date);
    CRITICAL_END();

    printf("current date: %d/%d/%d %d\n", rtc_date.RTC_Year,
           rtc_date.RTC_Month, rtc_date.RTC_Date, rtc_date.RTC_WeekDay);
}

static void set_clock(int32_t argc, char **argv)
{
    RTC_TimeTypeDef rtc_clock = {};
    struct display_msg msg;
    CRITICAL_STORE;

    if (argc < 4) {
        printf("set_clock hour minute second\n");
        return;
    }

    rtc_clock.RTC_Hours = atoi((char *)argv[1]);
    rtc_clock.RTC_Minutes = atoi((char *)argv[2]);
    rtc_clock.RTC_Seconds = atoi((char *)argv[3]);
    rtc_clock.RTC_H12 = (rtc_clock.RTC_Hours < 12) ? RTC_H12_AM : RTC_H12_PM;
    if (rtc_clock.RTC_Hours > 12) {
        rtc_clock.RTC_Hours -= 12;
    }

    CRITICAL_START();
    if (RTC_SetTime(RTC_Format_BIN, &rtc_clock) != SUCCESS) {
        CRITICAL_END();
        printf("set_date fail!\n");
        return;
    }
    CRITICAL_END();

    msg.type = DISPLAY_CLOCK;
    msg.u.clock.hour = rtc_clock.RTC_Hours;
    msg.u.clock.minute = rtc_clock.RTC_Minutes;
    msg.u.clock.pm = rtc_clock.RTC_H12;
    atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);;
}

static void get_clock(int32_t argc, char **argv)
{
    RTC_TimeTypeDef rtc_clock;
    CRITICAL_STORE;

    CRITICAL_START();
    RTC_GetTime(RTC_Format_BIN, &rtc_clock);
    CRITICAL_END();

    printf("current clock: %02d:%02d:%02d (%s)\n",
           rtc_clock.RTC_Hours, rtc_clock.RTC_Minutes, rtc_clock.RTC_Seconds,
           (rtc_clock.RTC_H12 == RTC_H12_AM) ? "AM" : "PM");
}

static cli_func find_cli_cmd(struct CLI_TAB *cli_tab, char *cmd)
{
    while (cli_tab->name) {
        if (!strcmp(cli_tab->name, cmd)) {
            return cli_tab->func;
        }
        cli_tab++;
    }
    return NULL;
}

static void print_cli_cmd(struct CLI_TAB *cli_tab)
{
    printf("cli:\n");
    while (cli_tab->name) {
        printf("%s\t\t%s\n", cli_tab->name, cli_tab->info);
        cli_tab++;
    }
}

static char *get_string(char *str)
{
    char *head = str;
    char c;

    while (1) {
        c = getchar();

        if (c == '\r') {
            putchar('\n');
        }
        putchar(c);

        if (c == '\n' || c == '\r') {
            *str = '\0';
            break;
        } else if (c == ' ' || c == '\t') {
            if (head != str) {
                *str++ = '\0';
                return str;
            }
        } else {
            *str++ = c;
        }
    }

    return NULL;
}


static const struct CLI_TAB cli_tab[] = {
    {"stack_info", "", stack_info},
    {"set_date", "", set_date},
    {"get_date", "", get_date},
    {"set_clock", "", set_clock},
    {"get_clock", "", get_clock},
    {NULL, NULL}
};


#define CLI_PARA_NUM_MAX    5
#define CLI_STRING_MAX      64

static NEAR char *cli_para[CLI_PARA_NUM_MAX + 1];
static NEAR char cli_string[CLI_STRING_MAX];

void cli_thread(uint32_t param)
{
    int i;
    cli_func f;
    int32_t argc;
    char **argv = cli_para;

    argv[0] = cli_string;

    //printf("cli_string = %x\n", (uint16_t)cli_string);
    //printf("argv = %x %x %x %x %x\n", argv[0], argv[1], argv[2], argv[3], argv[4]);

    while (1) {
        printf("> ");
        for (i=0; i<CLI_PARA_NUM_MAX; i++) {
            argv[i+1] = get_string(argv[i]);
            if (!argv[i+1]) {
                break;
            }
        }
        argc = 0;
        while ((argv[argc] != NULL) && ((int16_t)argv[argc][0] != 0)) {
            argc++;
        }

        //printf("argv = %x %x %x %x %x\n", argv[0], argv[1], argv[2], argv[3], argv[4]);
        //printf("rcv(%d): %s %s %s %s %s\n", (int16_t)argc, argv[0], argv[1], argv[2], argv[3], argv[4]);

        f = find_cli_cmd(cli_tab, (char *)argv[0]);
        if (f) {
            f(argc, argv);
        } else {
            print_cli_cmd(cli_tab);
        }
    }
}

