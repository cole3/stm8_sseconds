#include <stdio.h>
#include <stdlib.h>
#include "atom.h"
#include "cli.h"


struct CLI_TAB {
    const char *name;
    void (* func)(int32_t argc, int32_t **argv);
};


static void set_date(int32_t argc, int32_t **argv)
{
    RTC_DateTypeDef rtc_date = {};

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

    if (RTC_SetDate(RTC_Format_BIN, &rtc_date) != SUCCESS)
    {
        printf("set_date fail!\n");
        return;
    }
}

static void get_date(int32_t argc, int32_t **argv)
{
    RTC_DateTypeDef rtc_date;

    RTC_GetDate(RTC_Format_BIN, &rtc_date);

    printf("current date: %d/%d/%d %d\n", rtc_date.RTC_Year,
        rtc_date.RTC_Month, rtc_date.RTC_Date, rtc_date.RTC_WeekDay);
}

static void set_clock(int32_t argc, int32_t **argv)
{
    RTC_TimeTypeDef rtc_clock = {};

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

    if (RTC_SetTime(RTC_Format_BIN, &rtc_clock) != SUCCESS) {
        printf("set_date fail!\n");
        return;
    }
}

static void get_clock(int32_t argc, int32_t **argv)
{
    RTC_TimeTypeDef rtc_clock;

    RTC_GetTime(RTC_Format_BIN, &rtc_clock);

    printf("current clock: %02d:%02d:%02d (%s)\n",
        rtc_clock.RTC_Hours, rtc_clock.RTC_Minutes, rtc_clock.RTC_Seconds,
        (rtc_clock.RTC_H12 == RTC_H12_AM) ? "AM" : "PM");
}


static struct CLI_TAB cli_tab[] = {
    {"set_date", set_date},
    {"get_date", get_date},
    {"set_clock", set_clock},
    {"get_clock", get_clock},
    {"", NULL}
};


void cli_thread(uint32_t param)
{
    while (1) {
        //scanf("");
        atomTimerDelay(SYSTEM_TICKS_PER_SEC);
    }
}

