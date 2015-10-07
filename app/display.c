#include <stdio.h>
#include "atom.h"
#include "display.h"

/*
 * 18月88日 上午/下午 18:88
 * ++ +---+ +---+ +---+  ++
 * || |   | |   | |   |  ||
 * || +---+ +---+ +---+  ++
 * || |   | |   | |   |
 * ++ +---+.+---+.+---+ 888
 * 校正插入进血等待结果错误
 */


enum display_type {
    MonthDate,
    Colon,
    tempo,
    AM,
    PM,
    Battery,
    Dot1,
    Dot2,
    Ten1,
    Ten2,
    Correction,
    Insert,
    IntoBlood,
    Wait,
    Result,
    Error,
    MAX_ENUM
};

enum { Date, Clock };

enum { Num1 = 6, Num2, Num3, Num4, Num5, Num6 };

// 12 number frome A to G
const uint8_t LCD_NUM_BIT[][8] = {
    {14, 42, 70, 98, 69, 13, 41},
    {16, 44, 72, 100, 71, 15, 43},
    {20, 48, 76, 104, 75, 19, 47, 0},
    {117, 133, 149, 165, 148, 116, 132},
    {119, 135, 151, 167, 150, 118, 134},
    {24, 52, 80, 108, 79, 23, 51},
    {95, 67, 39, 12, 40, 96, 68},
    {91, 63, 35, 10, 38, 94, 66},
    {89, 61, 33, 06, 34, 90, 62},
    {27, 103, 1, 0, 21, 0, 0},
    {85, 57, 29, 115, 131, 163, 147},
    {87, 59, 31, 2, 30, 86, 58},
};

const uint8_t LCD_CHAR_BIT[16] = {
    99, 166, 105, 49, 77, 107, 11, 7, 97, 164, 5, 4, 88, 60, 32, 3
};

// 0,1,2,3,4,5,6,7,8,9,A,b,C,d,E,F,Null bit7-bit0 cast to A-H
const uint8_t SEG8[]={
    0xFC,0x60,0xDA,0xF2,0x66,0xB6,0xBE,0xE0,0xFE,
    0xF6,0xEE,0x3E,0x9C,0x7A,0x9E,0x8E,0x00
};


static void display_num(uint8_t pos, uint8_t val)
{
    uint8_t i,j,k,L;

    i = SEG8[val];
    for (j=0; j<8; j++)
    {
        k = LCD_NUM_BIT[pos][j];
        L = k & 0x07;
        L = 1 << L;
        k = k >> 3;
        if (i & 0x80)
            LCD->RAM[k] |= L;
        else
            LCD->RAM[k] &= ~L;
        i = i << 1;
    }
}

static void display_char(enum display_type type, bool on)
{
    uint8_t k,L;

    k = LCD_CHAR_BIT[type];
    L = k & 0x7;
    L = 1 << L;
    k = k >> 3;

    if (on)
        LCD->RAM[k] |= L;
    else
        LCD->RAM[k] &= ~L;
}

static void display_time(uint8_t type, uint8_t num1, uint8_t num2, bool on)
{
    uint8_t base = (type == Date) ? 0 : 3;

    if (!on)
    {
        display_char((type == Date) ? Ten1 : Ten2, 0);
        display_num(base, 16);
        display_num(base + 1, 16);
        display_num(base + 2, 16);
        return;
    }

    display_char((type == Date) ? Ten1 : Ten2, (_Bool)(num1 / 10));
    display_num(base, num1 % 10);
    display_num(base + 1, num2 / 10);
    display_num(base + 2, num2 % 10);
}

static void display_date(uint8_t month, uint8_t day, bool on)
{
    display_char(MonthDate, on);
    display_time(Date, month, day, on);
}

static void display_clock(uint8_t hour, uint8_t minute, bool on)
{
    display_char(Colon, on);
    display_time(Clock, hour, minute, on);
}

static void display_am_pm(bool pm, bool on)
{
    display_char(AM, on && !pm);
    display_char(PM, on && pm);
}

static void display_update_time(void)
{
    RTC_DateTypeDef date;
    RTC_TimeTypeDef time;

    RTC_GetDate(RTC_Format_BIN, &date);
    display_date((uint8_t)date.RTC_Month, date.RTC_Date, TRUE);

    RTC_GetTime(RTC_Format_BIN, &time);
    display_clock(time.RTC_Hours, time.RTC_Minutes, TRUE);
    display_am_pm(time.RTC_H12, TRUE);
}

static void lcd_glass_init(void)
{
    /* Enable LCD clock */
    CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);

    /* Initialize the LCD */
    LCD_Init(LCD_Prescaler_4, LCD_Divider_18, LCD_Duty_1_4,
           LCD_Bias_1_3, LCD_VoltageSource_External);

    /* Mask register*/
    LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFE); // 1~7
    LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFC); // 10~15
    LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xB9); // 16 19~21 23
    LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x89); // 24 27 31
    LCD_PortMaskConfig(LCD_PortMaskRegister_4, 0x0F); // 32~35
    LCD_PortMaskConfig(LCD_PortMaskRegister_5, 0x00);

    LCD_ContrastConfig(LCD_Contrast_Level_7);
    LCD_DeadTimeConfig(LCD_DeadTime_0);
    LCD_PulseOnDurationConfig(LCD_PulseOnDuration_7);

    LCD_Cmd(ENABLE); /*!< Enable LCD peripheral */
}

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


void display_thread(uint32_t param)
{
    int32_t cnt = 0;

    lcd_glass_init();
    rtc_alarm_init();

    while (1) {
        display_update_time();
        atomTimerDelay(10 * SYSTEM_TICKS_PER_SEC);
    }
}

