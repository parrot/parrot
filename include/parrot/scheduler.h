/* scheduler.h
 *  Copyright (C) 2007, Parrot Foundation.
 *  Overview:
 *     Parrot concurrency scheduler header stuff
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_SCHEDULER_H_GUARD
#define PARROT_SCHEDULER_H_GUARD

#include "parrot/parrot.h"

#define PARROT_TASK_SWITCH_QUANTUM 0.02

/* HEADERIZER BEGIN: src/scheduler.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_cx_begin_execution(PARROT_INTERP,
    ARGIN(PMC * const main),
    ARGIN(PMC * const argv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_cx_check_alarms(PARROT_INTERP, ARGIN(PMC * const scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC * Parrot_cx_delete_suspend_for_gc(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_cx_request_suspend_for_gc(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
opcode_t* Parrot_cx_run_scheduler(PARROT_INTERP,
    ARGIN(PMC * const scheduler),
    ARGIN(opcode_t * const next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_cx_schedule_immediate(PARROT_INTERP,
    ARGIN(PMC * const task_or_sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * Parrot_cx_schedule_sleep(PARROT_INTERP,
    FLOATVAL time,
    ARGIN_NULLOK(opcode_t * const next))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_cx_schedule_task(PARROT_INTERP, ARGIN(PMC * const task_or_sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_cx_send_message(PARROT_INTERP,
    ARGIN(STRING *messagetype),
    ARGIN(PMC *payload))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_cx_stop_task(PARROT_INTERP, ARGIN(opcode_t * const next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_check_quantum(PARROT_INTERP, ARGIN(PMC * const scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
opcode_t* Parrot_cx_check_scheduler(PARROT_INTERP,
    ARGIN(opcode_t * const next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_init_scheduler(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_cx_next_task(PARROT_INTERP, ARGIN(PMC * const scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_outer_runloop(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
opcode_t* Parrot_cx_preempt_task(PARROT_INTERP,
    ARGIN(PMC * const scheduler),
    ARGIN(opcode_t * const next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_cx_runloop_end(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_cx_runloop_wake(PARROT_INTERP, ARGIN(PMC * const scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_schedule_alarm(PARROT_INTERP, ARGIN(PMC * const alarm))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_set_scheduler_alarm(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC* Parrot_task_current(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_cx_begin_execution __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(main) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_Parrot_cx_check_alarms __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
#define ASSERT_ARGS_Parrot_cx_delete_suspend_for_gc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_request_suspend_for_gc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_run_scheduler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler) \
    , PARROT_ASSERT_ARG(next))
#define ASSERT_ARGS_Parrot_cx_schedule_immediate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(task_or_sub))
#define ASSERT_ARGS_Parrot_cx_schedule_sleep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_schedule_task __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(task_or_sub))
#define ASSERT_ARGS_Parrot_cx_send_message __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(messagetype) \
    , PARROT_ASSERT_ARG(payload_unused))
#define ASSERT_ARGS_Parrot_cx_stop_task __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(next))
#define ASSERT_ARGS_Parrot_cx_check_quantum __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
#define ASSERT_ARGS_Parrot_cx_check_scheduler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(next))
#define ASSERT_ARGS_Parrot_cx_init_scheduler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_next_task __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
#define ASSERT_ARGS_Parrot_cx_outer_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_preempt_task __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler) \
    , PARROT_ASSERT_ARG(next))
#define ASSERT_ARGS_Parrot_cx_runloop_end __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_runloop_wake __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
#define ASSERT_ARGS_Parrot_cx_schedule_alarm __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(alarm))
#define ASSERT_ARGS_Parrot_cx_set_scheduler_alarm __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_task_current __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/scheduler.c */

/* Timer PMC interface constants */
/* &gen_from_enum(timer.pasm) */
typedef enum {
    PARROT_TIMER_SEC,
    PARROT_TIMER_USEC,
    PARROT_TIMER_NSEC,
    PARROT_TIMER_REPEAT,
    PARROT_TIMER_INTERVAL,
    PARROT_TIMER_RUNNING,
    PARROT_TIMER_HANDLER,
    PARROT_TIMER_MAX,
    PARROT_ALARM_TIME,
    PARROT_ALARM_TASK
} parrot_timer_enum_t;
/* &end_gen */

/* Alarm PMC interface constants */
/* &gen_from_enum(alarm.pasm) */
/* TODO: Figure out how to actually gen alarm.pasm
typedef enum {
    PARROT_ALARM_TIME,
    PARROT_ALARM_SUB
} parrot_alarm_enum_t;
*/
/* &end_gen */



#endif /* PARROT_SCHEDULER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
