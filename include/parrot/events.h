/* events.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This api will handle parrot events
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_EVENTS_H_GUARD)
#define PARROT_EVENTS_H_GUARD

typedef void* (*event_func_t)(Parrot_Interp, void*);

typedef enum {
    EVENT_TYPE_NONE,
    EVENT_TYPE_EVENT,
    EVENT_TYPE_IO,
    EVENT_TYPE_MSG,
    EVENT_TYPE_TIMER,
    EVENT_TYPE_CALL_BACK,
    EVENT_TYPE_SLEEP,
    EVENT_TYPE_TERMINATE,
    EVENT_TYPE_EVENT_TERMINATE,
    EVENT_TYPE_CLASS_CHANGED,
    EVENT_TYPE_SIGNAL,
    EVENT_TYPE_SUSPEND_FOR_GC
} parrot_event_type_enum;

/*
 * any timer event has 2 time fields in front
 */
typedef struct {
    FLOATVAL                    abs_time;
    FLOATVAL                    interval;
    int                         repeat; /* 0 = once, -1 = forever */
    PMC*                        sub;    /* handler sub */
    PMC*                        timer;  /* a .Timer PMC */
} parrot_timer_event;

/* TODO export to pasm */
typedef enum {
    EV_IO_NONE,                 /* invalidated */
    EV_IO_SELECT_RD,            /* rd is ready for read */
    EV_IO_SELECT_WR             /* rd is ready for write */
} parrot_io_event_enum;

typedef struct {
    parrot_io_event_enum        action; /* read, write, ... */
    PMC*                        pio;
    PMC*                        handler;
    PMC*                        user_data;
} parrot_io_event;

typedef struct {
    PMC*                        cbi;    /* callback info */
    void*                       external_data;
} _call_back_info;

typedef struct {
    parrot_event_type_enum      type;
    Parrot_Interp               interp;
    /* event_func_t                event_func; unused */
    union {
        STRING*                 msg;            /* for testing only */
        int                     signal;         /* for EVENT_TYPE_SIGNAL */
        parrot_timer_event      timer_event;    /* for EVENT_TYPE_TIMER */
        _call_back_info         call_back;      /* CALL_BACKs */
        parrot_io_event         io_event;       /* EVENT_TYPE_IO */
    } u;
} parrot_event;

struct QUEUE_ENTRY;
PARROT_API void Parrot_schedule_event(Parrot_Interp, parrot_event*);
PARROT_API void Parrot_schedule_interp_event(Parrot_Interp, parrot_event*);
PARROT_API void Parrot_schedule_interp_qentry(Parrot_Interp, struct QUEUE_ENTRY* entry);

#define CHECK_EVENTS(i, n)  Parrot_do_check_events(i, n)
#define HANDLE_EVENTS(i, n) Parrot_do_handle_events(i, 1, n)

PARROT_API void Parrot_init_signals(void);
PARROT_API void Parrot_init_events(Parrot_Interp);
PARROT_API void* Parrot_do_check_events(Parrot_Interp, void*);
PARROT_API void* Parrot_do_handle_events(Parrot_Interp, int, void*);

PARROT_API void Parrot_new_timer_event(Parrot_Interp, PMC*, FLOATVAL,
        FLOATVAL, int, PMC*, parrot_event_type_enum);
PARROT_API void Parrot_del_timer_event(Parrot_Interp, PMC* timer);
PARROT_API void Parrot_new_terminate_event(Parrot_Interp);
PARROT_API void Parrot_new_suspend_for_gc_event(Parrot_Interp);
PARROT_API void disable_event_checking(Parrot_Interp);
PARROT_API void enable_event_checking(Parrot_Interp);

PARROT_API void Parrot_new_cb_event(Parrot_Interp, PMC* cbi, void*ext);
PARROT_API void Parrot_run_callback(Parrot_Interp, PMC* cbi, void*ext);

PARROT_API void Parrot_kill_event_loop(void);
PARROT_API void* Parrot_sleep_on_event(Parrot_Interp, FLOATVAL t, void* next);

/* &gen_from_enum(io_thr_msg.pasm) */
typedef enum {
    IO_THR_MSG_NONE,
    IO_THR_MSG_TERMINATE,
    IO_THR_MSG_ADD_SELECT_RD
} io_thread_msg_type;
/* &end_gen */

PARROT_API void Parrot_event_add_io_event(Interp*,
        PMC* pio, PMC* sub, PMC* data, INTVAL which);

#endif /* PARROT_EVENTS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
