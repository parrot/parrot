/* events.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This api will handle parrot events
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_EVENTS_H_GUARD
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
typedef struct parrot_timer_event {
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

typedef struct parrot_io_event {
    parrot_io_event_enum        action; /* read, write, ... */
    PMC*                        pio;
    PMC*                        handler;
    PMC*                        user_data;
} parrot_io_event;

typedef struct _call_back_info {
    PMC*                        cbi;    /* callback info */
    char*                       external_data;
} _call_back_info;

typedef struct parrot_event {
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

#define CHECK_EVENTS(i, n)  (opcode_t *)Parrot_do_check_events(i, n)
#define HANDLE_EVENTS(i, n) (opcode_t *)Parrot_do_handle_events(i, 1, n)

/* HEADERIZER BEGIN: src/events.c */

PARROT_API void Parrot_del_timer_event( Interp *interp, PMC *timer );
PARROT_API opcode_t * Parrot_do_check_events( Interp *interp, opcode_t *next );
PARROT_API opcode_t * Parrot_do_handle_events( Interp *interp /*NN*/,
    int restore,
    opcode_t *next )
        __attribute__nonnull__(1);

PARROT_API void Parrot_event_add_io_event( Interp *interp,
    PMC *pio,
    PMC *sub,
    PMC *data,
    INTVAL which );

PARROT_API void Parrot_init_events( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_init_signals( void );
PARROT_API void Parrot_kill_event_loop( void );
PARROT_API void Parrot_new_cb_event( Interp *interp /*NN*/,
    PMC *cbi,
    char *ext )
        __attribute__nonnull__(1);

PARROT_API void Parrot_new_terminate_event( Interp *interp );
PARROT_API void Parrot_new_timer_event( Interp *interp,
    PMC *timer,
    FLOATVAL diff,
    FLOATVAL interval,
    int repeat,
    PMC *sub,
    parrot_event_type_enum typ );

PARROT_API void Parrot_schedule_event( Interp *interp,
    parrot_event* ev /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API void Parrot_schedule_interp_qentry( Interp *interp /*NN*/,
    struct QUEUE_ENTRY *entry /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API opcode_t * Parrot_sleep_on_event( Interp *interp /*NN*/,
    FLOATVAL t,
    opcode_t *next )
        __attribute__nonnull__(1);

void Parrot_schedule_broadcast_qentry( struct QUEUE_ENTRY *entry );
/* HEADERIZER END: src/events.c */

/* &gen_from_enum(io_thr_msg.pasm) */
typedef enum {
    IO_THR_MSG_NONE,
    IO_THR_MSG_TERMINATE,
    IO_THR_MSG_ADD_SELECT_RD
} io_thread_msg_type;
/* &end_gen */

#endif /* PARROT_EVENTS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
