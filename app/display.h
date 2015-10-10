#ifndef _DISPLAY_H_
#define _DISPLAY_H_

#include "stm8l15x_conf.h"


enum display_msg_type {
    DISPLAY_DATE,
    DISPLAY_CLOCK,
    DISPLAY_TYPE_MAX
};

struct display_msg {
    enum display_msg_type type;
    union {
        struct {
            uint8_t month;
            uint8_t day;
            uint8_t week;
        } date;
        struct {
            uint8_t hour;
            uint8_t minute;
            uint8_t pm;
        } clock;
    } u;
};


extern void *pt_display_queue;


void display_thread(uint32_t param);

#endif