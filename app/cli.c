#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "atom.h"
#include "atomqueue.h"
#include "display.h"
#include "cli.h"


typedef void (* cli_func)(int32_t argc, char **argv);

struct CLI_TAB {
    const char *name;
    cli_func   func;
};


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

static struct CLI_TAB cli_tab[] = {
    {"set_date", set_date},
    {"get_date", get_date},
    {"set_clock", set_clock},
    {"get_clock", get_clock},
    {NULL, NULL}
};

#define CLI_PARA_NUM_MAX        5
#define CLI_PARA_STRING_MAX     16

static char string[CLI_PARA_NUM_MAX][CLI_PARA_STRING_MAX];

void cli_thread(uint32_t param)
{
    cli_func f;
    int32_t argc;
    char **argv = (char **)string;

    while (1) {
        argc = scanf("%s %s %s %s %s", string[0], string[1], string[2], string[3], string[4]);
        f = find_cli_cmd(cli_tab, (char *)string[0]);
        if (f) {
            f(argc, argv);
        }
        //atomTimerDelay(SYSTEM_TICKS_PER_SEC);
    }
}

