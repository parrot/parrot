/* events.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This api will handle parrot events
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_EVENT_H_GUARD)
#define PARROT_EVENT_H_GUARD

typedef void* (*event_func_t)(Parrot_Interp, void*);

typedef enum {
    EVENT_TYPE_NONE,
    EVENT_TYPE_EVENT,
    EVENT_TYPE_IO,
    EVENT_TYPE_MSG,
    EVENT_TYPE_ASYNC_IO,
    EVENT_TYPE_TIMER,
    EVENT_TYPE_CALL_BACK,
    EVENT_TYPE_SLEEP,
    EVENT_TYPE_TERMINATE,
    EVENT_TYPE_EVENT_TERMINATE,
    EVENT_TYPE_CLASS_CHANGED,
    EVENT_TYPE_SIGNAL
} parrot_event_type_enum;

/*
 * any timer event has 2 time fields in front
 */
typedef struct {
    FLOATVAL                    abs_time;
    FLOATVAL                    interval;
    int                         repeat; /* 0 = once, -1 = forever */
    PMC*                        sub;    /* handler sub */
} parrot_timer_event;

typedef struct {
    PMC*                        sub;
    PMC*                        user_data;
    void*                       external_data;
} _call_back_info;

typedef struct {
    parrot_event_type_enum      type;
    Parrot_Interp               interp;
    /* event_func_t                event_func; unused */
    void*                       data;
    union {
        STRING*                 msg;            /* for testing only */
        int                     signal;         /* for EVENT_TYPE_SIGNAL */
        parrot_timer_event      timer_event;    /* for EVENT_TYPE_TIMER */
        _call_back_info         call_back;      /* CALL_BACKs */
    } u;
} parrot_event;

struct QUEUE_ENTRY;
void Parrot_schedule_event(Parrot_Interp, parrot_event*);
void Parrot_schedule_interp_event(Parrot_Interp, parrot_event*);
void Parrot_schedule_interp_qentry(Parrot_Interp, struct QUEUE_ENTRY* entry);

#define CHECK_EVENTS(i, n)  Parrot_do_check_events(i, n)
#define HANDLE_EVENTS(i, n) Parrot_do_handle_events(i, 1, n)

void Parrot_init_signals(void);
void Parrot_init_events(Parrot_Interp);
void* Parrot_do_check_events(Parrot_Interp, void*);
void* Parrot_do_handle_events(Parrot_Interp, int, void*);

void Parrot_new_timer_event(Parrot_Interp, PMC*, FLOATVAL,
        FLOATVAL, int, PMC*, parrot_event_type_enum);
void Parrot_del_timer_event(Parrot_Interp, PMC* timer);
void Parrot_new_terminate_event(Parrot_Interp);
void disable_event_checking(Parrot_Interp);
void enable_event_checking(Parrot_Interp);

void Parrot_new_cb_event(Parrot_Interp, PMC*sub, void*ext);
void Parrot_run_callback(Parrot_Interp, PMC*sub, void*ext);

void Parrot_kill_event_loop(void);
void* Parrot_sleep_on_event(Parrot_Interp, FLOATVAL t, void* next);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
