/*
Copyright (C) 2007-2010, Parrot Foundation.
$Id$

=head1 NAME

src/scheduler.c - The core routines for the concurrency scheduler

=head1 DESCRIPTION

Each interpreter has a concurrency scheduler element in its core struct. The
scheduler is responsible for receiveing, dispatching, and monitoring events,
exceptions, async I/O, and concurrent tasks (threads).

=cut

*/

#include "parrot/parrot.h"
#include "parrot/scheduler_private.h"
#include "parrot/runcore_api.h"
#include "parrot/alarm.h"
#include "parrot/scheduler.h"

#include "pmc/pmc_scheduler.h"
#include "pmc/pmc_task.h"
#include "pmc/pmc_timer.h"
#include "pmc/pmc_alarm.h"
#include "pmc/pmc_pmclist.h"
#include "pmc/pmc_continuation.h"

#include "scheduler.str"

#define CX_DEBUG 0

/* HEADERIZER HFILE: include/parrot/scheduler.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void scheduler_process_messages(PARROT_INTERP,
    ARGMOD(PMC *scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*scheduler);

#define ASSERT_ARGS_scheduler_process_messages __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head2 Scheduler Interface Functions

Functions to interface with the concurrency scheduler.

=over 4

=item C<void Parrot_cx_init_scheduler(PARROT_INTERP)>

Initalize the concurrency scheduler for the interpreter.

=cut

*/

static int interp_count = 0;

void
Parrot_cx_init_scheduler(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_init_scheduler)

    interp->quantum_done = Parrot_floatval_time() + PARROT_TASK_SWITCH_QUANTUM;

    if (interp_count++ > 1) {
        fprintf(stderr, "More than one interp?\n");
        exit(0);
    }

    if (!interp->parent_interpreter) {
        PMC *scheduler;

        /* Add the very first interpreter to the list of interps. */
        pt_add_to_interpreters(interp, NULL);

        scheduler = Parrot_pmc_new(interp, enum_class_Scheduler);
        scheduler = VTABLE_share_ro(interp, scheduler);

        interp->scheduler = scheduler;
    }
}

/*

=item C<void Parrot_cx_begin_execution(PARROT_INTERP, PMC *main, PMC *argv)>

Construct the main task, add it to the task queue, and then execute tasks
until the task queue becomes empty.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_begin_execution(PARROT_INTERP, ARGMOD(PMC *main), ARGMOD(PMC *argv))
{
    ASSERT_ARGS(Parrot_cx_begin_execution)
    PMC *scheduler = interp->scheduler;
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);
    INTVAL task_count = 1;

    PMC* main_task = Parrot_pmc_new(interp, enum_class_Task);
    Parrot_Task_attributes *tdata = PARROT_TASK(main_task);
    tdata->codeblock = main;
    tdata->data      = argv;

    Parrot_cx_schedule_task(interp, main_task);

    do {
        Parrot_cx_next_task(interp, scheduler);
        task_count = VTABLE_get_integer(interp, sched->task_queue);

        if (task_count == 0) {
            INTVAL alarm_count = VTABLE_get_integer(interp, sched->alarms);

            if (alarm_count > 0) {
                PMC     *alarm      = VTABLE_shift_pmc(interp, sched->alarms);
                FLOATVAL alarm_time = VTABLE_get_number(interp, alarm);
                FLOATVAL now_time   = Parrot_floatval_time();
                FLOATVAL sleep_time = now_time - alarm_time;
                VTABLE_unshift_pmc(interp, sched->alarms, alarm);

                if (sleep_time > 0.0)
                    Parrot_floatval_sleep(sleep_time);

                Parrot_cx_check_alarms(interp, interp->scheduler);
                task_count = 1;
            }
        }
    } while (task_count > 0);
}


/*

=item C<opcode_t* Parrot_cx_check_tasks(PARROT_INTERP, opcode_t* next)>

If a wake request has been received or an OS timer has expired
then deal with that.

=cut

*/

PARROT_CANNOT_RETURN_NULL
opcode_t*
Parrot_cx_check_tasks(PARROT_INTERP, ARGIN(opcode_t* next))
{
    ASSERT_ARGS(Parrot_cx_check_tasks)
    PMC *scheduler = interp->scheduler;

    if  (Parrot_alarm_check(&(interp->last_alarm))
          || SCHEDULER_wake_requested_TEST(scheduler)) {
        SCHEDULER_wake_requested_CLEAR(scheduler);
        return Parrot_cx_handle_tasks(interp, scheduler, next);
    }

    return next;
}

/*

=item C<opcode_t* Parrot_cx_handle_tasks(PARROT_INTERP, PMC *scheduler, opcode_t
*next)>

Checks to see if any tasks need to be scheduled or if the current task
needs to be pre-empted.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
opcode_t*
Parrot_cx_handle_tasks(PARROT_INTERP, ARGMOD(PMC *scheduler), ARGIN(opcode_t *next))
{
    ASSERT_ARGS(Parrot_cx_handle_tasks)

    Parrot_cx_check_alarms(interp, scheduler);
    Parrot_cx_check_quantum(interp, scheduler);

    if (SCHEDULER_resched_requested_TEST(scheduler)) {
        SCHEDULER_resched_requested_CLEAR(scheduler);

        /* Exiting the runloop to swap tasks doesn't play
           nice with nested runloops */
        if (interp->current_runloop_level <= 1)
            return Parrot_cx_reschedule(interp, scheduler, next);
    }

    return next;

#ifdef PARROT_CX_BUILD_OLD_STUFF
    Parrot_cx_refresh_task_list(interp, scheduler);

    while (VTABLE_get_integer(interp, scheduler) > 0) {
        PMC * const task = VTABLE_pop_pmc(interp, scheduler);
        if (!PMC_IS_NULL(task)) {
            PMC    * const type_pmc = VTABLE_get_attr_str(interp, task, CONST_STRING(interp, "type"));
            STRING * const type     = VTABLE_get_string(interp, type_pmc);

            if (Parrot_str_equal(interp, type, CONST_STRING(interp, "callback"))) {
                Parrot_cx_invoke_callback(interp, task);
            }
            else if (Parrot_str_equal(interp, type, CONST_STRING(interp, "timer"))) {
                Parrot_cx_timer_invoke(interp, task);
            }
            else if (Parrot_str_equal(interp, type, CONST_STRING(interp, "event"))) {
                PMC * const handler = Parrot_cx_find_handler_for_task(interp, task);
                if (!PMC_IS_NULL(handler)) {
                    PMC * const handler_sub = VTABLE_get_attr_str(interp, handler, CONST_STRING(interp, "code"));
                    Parrot_pcc_invoke_sub_from_c_args(interp, handler_sub,
                            "PP->", handler, task);
                }
            }
            else {
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "Unknown task type '%Ss'.\n", type);
            }

            Parrot_cx_delete_task(interp, task);
        }

        /* If the scheduler was flagged to terminate, make sure you process all
         * tasks. */
        if (SCHEDULER_terminate_requested_TEST(scheduler))
            Parrot_cx_refresh_task_list(interp, scheduler);

    } /* end of pending tasks */
#endif
}

/*

=item C<void Parrot_cx_check_quantum(PARROT_INTERP, PMC *scheduler)>

If the quantum has expired, schedule the next task.

=cut

*/

void
Parrot_cx_check_quantum(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_check_quantum)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);
    FLOATVAL time_now = Parrot_floatval_time();

    if (time_now >= interp->quantum_done)
        SCHEDULER_resched_requested_SET(scheduler);
}

/*
=item C<void Parrot_cx_next_task(PARROT_INTERP, PMC *scheduler)>

Run the task at the head of the task queue until it ends or is
pre-empted.

=cut
*/

void
Parrot_cx_next_task(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_next_task)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);
    INTVAL task_count;

    task_count = VTABLE_get_integer(interp, sched->task_queue);

    if (task_count > 0) {
        FLOATVAL  time_now = Parrot_floatval_time();
        PMC      *task     = VTABLE_shift_pmc(interp, sched->task_queue);
        opcode_t *dest;

        interp->quantum_done = time_now + PARROT_TASK_SWITCH_QUANTUM;
        Parrot_alarm_set(interp->quantum_done);

        Parrot_pcc_invoke_sub_from_c_args(interp, task, "->");
    }
}

/*
=item C<opcode_t* Parrot_cx_reschedule(PARROT_INTERP, PMC *scheduler, opcode_t
*next)>

Pre-empt the current task. It goes on the foot of the task queue,
and then we jump all the way back to the task scheduling loop.

=cut
*/

PARROT_CANNOT_RETURN_NULL
opcode_t*
Parrot_cx_reschedule(PARROT_INTERP, ARGMOD(PMC *scheduler), ARGIN(opcode_t *next))
{
    ASSERT_ARGS(Parrot_cx_reschedule)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);

    PMC *cont = Parrot_pmc_new(interp, enum_class_Continuation);
    VTABLE_set_pointer(interp, cont, next);

    if (!PMC_IS_NULL(cont))
          VTABLE_push_pmc(interp, sched->task_queue, cont);

    return (opcode_t*) 0;
}

/*

=item C<void Parrot_cx_runloop_wake(PARROT_INTERP, PMC *scheduler)>

Wake a sleeping scheduler runloop (generally called when new tasks are added to
the scheduler's task list).

=cut

*/

void
Parrot_cx_runloop_wake(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_runloop_wake)
    enable_event_checking(interp);
    SCHEDULER_wake_requested_SET(scheduler);
}


/*

=item C<void Parrot_cx_runloop_end(PARROT_INTERP)>

Schedule an event to terminate the scheduler runloop.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_runloop_end(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_runloop_end)
    SCHEDULER_terminate_requested_SET(interp->scheduler);
    /* Chandon TODO: Why is this here? */
    /* Parrot_cx_handle_tasks(interp, interp->scheduler); */
}

/*

=item C<void Parrot_cx_schedule_task(PARROT_INTERP, PMC *task)>

Add a task to to the task queue for execution.

Probably cannot be called across interpreters/threads, must instead be
called from within the interpreter's runloop.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_task(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_schedule_task)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);

    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    VTABLE_push_pmc(interp, sched->task_queue, task);
}

/*

=item C<void Parrot_cx_schedule_immediate(PARROT_INTERP, PMC *task)>

Add a task to the task queue for immediate execution.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_immediate(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_schedule_immediate)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    VTABLE_unshift_pmc(interp, sched->task_queue, task);
    SCHEDULER_wake_requested_SET(interp->scheduler);
    SCHEDULER_resched_requested_SET(interp->scheduler);
}

/*

=item C<void Parrot_cx_request_suspend_for_gc(PARROT_INTERP)>

Tell the scheduler to suspend for GC at the next safe pause.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_request_suspend_for_gc(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_request_suspend_for_gc)
#if CX_DEBUG
    fprintf(stderr, "requesting gc suspend [interp=%p]\n", interp);
#endif
    Parrot_cx_send_message(interp, CONST_STRING(interp, "suspend_for_gc"), PMCNULL);
}

/*

=item C<PMC * Parrot_cx_delete_suspend_for_gc(PARROT_INTERP)>

Remove a message that would suspend GC from the message queue. (Provided for
backward compatibility in the threads implementation.)

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_delete_suspend_for_gc(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_delete_suspend_for_gc)
    if (interp->scheduler) {
        STRING *suspend_str = CONST_STRING(interp, "suspend_for_gc");
        Parrot_Scheduler_attributes * sched_struct = PARROT_SCHEDULER(interp->scheduler);
        INTVAL num_tasks, index;

#if CX_DEBUG
    fprintf(stderr, "called delete_suspend_for_gc\n");
#endif

#if CX_DEBUG
    fprintf(stderr, "locking msg_lock (delete) [interp=%p]\n", interp);
#endif
        LOCK(sched_struct->msg_lock);
        /* Search the task index for GC suspend tasks */
        num_tasks = VTABLE_elements(interp, sched_struct->messages);
        for (index = 0; index < num_tasks; ++index) {
            PMC *message = VTABLE_get_pmc_keyed_int(interp, sched_struct->messages, index);
            if (!PMC_IS_NULL(message)
            &&   Parrot_str_equal(interp, VTABLE_get_string(interp, message),
                        suspend_str)) {
                VTABLE_delete_keyed_int(interp, sched_struct->messages, index);
                UNLOCK(sched_struct->msg_lock);
                return message;
            }
        }
#if CX_DEBUG
    fprintf(stderr, "unlocking msg_lock (delete) [interp=%p]\n", interp);
#endif
        UNLOCK(sched_struct->msg_lock);

    }
    else
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    return PMCNULL;
}

/*

=item C<void Parrot_cx_add_handler_local(PARROT_INTERP, PMC *handler)>

Add a handler to the current context's list of handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_add_handler_local(PARROT_INTERP, ARGIN(PMC *handler))
{
    ASSERT_ARGS(Parrot_cx_add_handler_local)
    if (PMC_IS_NULL(Parrot_pcc_get_handlers(interp, interp->ctx)))
        Parrot_pcc_set_handlers(interp, interp->ctx,
                                Parrot_pmc_new(interp, enum_class_ResizablePMCArray));

    VTABLE_unshift_pmc(interp, Parrot_pcc_get_handlers(interp, interp->ctx), handler);

}

/*

=item C<void Parrot_cx_delete_handler_local(PARROT_INTERP, STRING
*handler_type)>

Remove the top task handler of a particular type from the context's list of
handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_handler_local(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_delete_handler_local)
    PMC *handlers  = Parrot_pcc_get_handlers(interp, interp->ctx);

    if (PMC_IS_NULL(handlers))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "No handler to delete.");

    if (STRING_IS_NULL(handler_type) || STRING_IS_EMPTY(handler_type))
        VTABLE_shift_pmc(interp, handlers);
    else {
        /* Loop from newest handler to oldest handler. */
        STRING      *exception_str = CONST_STRING(interp, "exception");
        STRING      *event_str     = CONST_STRING(interp, "event");
        STRING      *handler_str   = CONST_STRING(interp, "ExceptionHandler");
        const INTVAL elements      = VTABLE_elements(interp, handlers);
        INTVAL       index;
        typedef enum { Hunknown,  Hexception, Hevent } Htype;

        const Htype htype =
            Parrot_str_equal(interp, handler_type, exception_str) ?
            Hexception :
            Parrot_str_equal(interp, handler_type, event_str) ?
                Hevent :
                Hunknown;
        STRING * const handler_name = (htype == Hexception) ? handler_str : (STRING *)NULL;

        for (index = 0; index < elements; ++index) {
            PMC * const handler = VTABLE_get_pmc_keyed_int(interp, handlers, index);
            if (!PMC_IS_NULL(handler)) {
                switch (htype) {
                  case Hexception:
                    if (VTABLE_isa(interp, handler, handler_name)) {
                        VTABLE_set_pmc_keyed_int(interp, handlers, index, PMCNULL);
                        return;
                    }
                    break;
                  case Hevent:
                    if (handler->vtable->base_type == enum_class_EventHandler) {
                        VTABLE_set_pmc_keyed_int(interp, handlers, index, PMCNULL);
                        return;
                    }
                    break;
                  default:
                    break;
                }
            }
        }

        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_OPERATION, "No handler to delete.");
    }
}


/*

=item C<INTVAL Parrot_cx_count_handlers_local(PARROT_INTERP, STRING
*handler_type)>

Count the number of active handlers of a particular type from the
context's list of handlers.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_cx_count_handlers_local(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_count_handlers_local)
    PMC * const handlers = Parrot_pcc_get_handlers(interp, interp->ctx);
    INTVAL elements;

    if (PMC_IS_NULL(handlers))
        return 0;

    elements = VTABLE_elements(interp, handlers);

    if (STRING_IS_NULL(handler_type) || STRING_IS_EMPTY(handler_type))
        return elements;

    /* Loop from newest handler to oldest handler. */
    {
        STRING      *exception_str = CONST_STRING(interp, "exception");
        STRING      *event_str     = CONST_STRING(interp, "event");
        STRING      *handler_str   = CONST_STRING(interp, "ExceptionHandler");
        INTVAL       count = 0;
        INTVAL       index;
        typedef enum { Hunknown,  Hexception, Hevent } Htype;

        const Htype htype =
            (Parrot_str_equal(interp, handler_type, exception_str)) ?
            Hexception :
            (Parrot_str_equal(interp, handler_type, event_str)) ?
                Hevent :
                Hunknown;
        STRING * const handler_name = (htype == Hexception) ? handler_str : (STRING *)NULL;

        for (index = 0; index < elements; ++index) {
            PMC * const handler = VTABLE_get_pmc_keyed_int(interp, handlers, index);
            if (!PMC_IS_NULL(handler)) {
                switch (htype) {
                  case Hexception:
                    if (VTABLE_isa(interp, handler, handler_name))
                        ++count;
                    break;
                  case Hevent:
                    if (handler->vtable->base_type == enum_class_EventHandler)
                        ++count;
                    break;
                  default:
                    break;
                }
            }
        }
        return count;
    }
}


/*

=item C<void Parrot_cx_add_handler(PARROT_INTERP, PMC *handler)>

Add a task handler to scheduler's list of handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_add_handler(PARROT_INTERP, ARGIN(PMC *handler))
{
    ASSERT_ARGS(Parrot_cx_add_handler)
    STRING * const add_handler = CONST_STRING(interp, "add_handler");
    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, add_handler, "P->", handler);
}

/*

=item C<void Parrot_cx_delete_handler_typed(PARROT_INTERP, STRING
*handler_type)>

Remove the top task handler of a particular type from the scheduler's list of
handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_handler_typed(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_delete_handler_typed)
    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, CONST_STRING(interp, "delete_handler"), "S->", handler_type);
}

/*

=item C<INTVAL Parrot_cx_count_handlers_typed(PARROT_INTERP, STRING
*handler_type)>

Count the number of active handlers of a particular type (event, exception) in
the concurrency scheduler.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_cx_count_handlers_typed(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_count_handlers_typed)
    INTVAL count = 0;

    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, CONST_STRING(interp, "count_handlers"), "S->I", handler_type, &count);

    return count;
}

/*

=back

=head2 Scheduler Message Interface Functions

Functions that are used to interface with the message queue in the concurrency
scheduler.

=over 4

=item C<void Parrot_cx_send_message(PARROT_INTERP, STRING *messagetype, PMC
*payload)>

Send a message to a scheduler in a different interpreter/thread.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_send_message(PARROT_INTERP, ARGIN(STRING *messagetype), SHIM(PMC *payload))
{
    ASSERT_ARGS(Parrot_cx_send_message)
    if (interp->scheduler) {
        Parrot_Scheduler_attributes * sched_struct = PARROT_SCHEDULER(interp->scheduler);
        PMC *message = Parrot_pmc_new(interp, enum_class_SchedulerMessage);
        VTABLE_set_string_native(interp, message, messagetype);
        message = VTABLE_share_ro(interp, message);

#if CX_DEBUG
    fprintf(stderr, "sending message[interp=%p]\n", interp);
#endif

#if CX_DEBUG
    fprintf(stderr, "locking msg_lock (send) [interp=%p]\n", interp);
#endif
        LOCK(sched_struct->msg_lock);
        VTABLE_push_pmc(interp, sched_struct->messages, message);
#if CX_DEBUG
    fprintf(stderr, "unlocking msg_lock (send) [interp=%p]\n", interp);
#endif
        UNLOCK(sched_struct->msg_lock);
        Parrot_cx_runloop_wake(interp, interp->scheduler);

    }

}

/*

=item C<void Parrot_cx_broadcast_message(PARROT_INTERP, STRING *messagetype, PMC
*data)>

Send a message to the schedulers in all interpreters/threads linked to this
one.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_broadcast_message(PARROT_INTERP, ARGIN(STRING *messagetype), ARGIN_NULLOK(PMC *data))
{
    ASSERT_ARGS(Parrot_cx_broadcast_message)
    UINTVAL i;
    LOCK(interpreter_array_mutex);
    for (i = 0; i < n_interpreters; ++i) {
        Parrot_Interp other_interp = interpreter_array[i];
        if (interp == other_interp)
            continue;
        Parrot_cx_send_message(other_interp, messagetype, data);
    }
    UNLOCK(interpreter_array_mutex);

}

/*

=back

=head2 Task Interface Functions

Functions that are used to interface with a specific task in the concurrency scheduler.

=over 4

=item C<PMC * Parrot_cx_find_handler_for_task(PARROT_INTERP, PMC *task)>

Retrieve a handler appropriate to a given task. If the scheduler has no
appropriate handler, returns PMCNULL.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_find_handler_for_task(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_find_handler_for_task)
    PMC *handler = PMCNULL;
#if CX_DEBUG
    fprintf(stderr, "searching for handler\n");
#endif

    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, CONST_STRING(interp, "find_handler"), "P->P", task, &handler);

#if CX_DEBUG
    fprintf(stderr, "done searching for handler\n");
#endif

    return handler;
}

/*

=item C<PMC * Parrot_cx_find_handler_local(PARROT_INTERP, PMC *task)>

Retrieve a handler appropriate to a given task from the local context. If the
context has no appropriate handler, returns PMCNULL.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_find_handler_local(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_find_handler_local)

    /*
     * Quick&dirty way to avoid infinite recursion
     * when an exception is thrown while looking
     * for a handler
     */
    static int already_doing = 0;
    static PMC * keep_context = NULL;

    PMC            *context;
    PMC            *iter        = PMCNULL;
    STRING * const  handled_str = CONST_STRING(interp, "handled");
    STRING * const  iter_str    = CONST_STRING(interp, "handler_iter");

    if (already_doing) {
        Parrot_io_eprintf(interp,
            "** Exception caught while looking for a handler, trying next **\n");
        if (! keep_context)
            return NULL;
        /*
         * Note that we are now trying to handle the new exception,
         * not the initial task argument (exception or whatever).
         */
        context = Parrot_pcc_get_caller_ctx(interp, keep_context);
        keep_context = NULL;
        if (context && !PMC_IS_NULL(Parrot_pcc_get_handlers(interp, context)))
            iter = VTABLE_get_iter(interp, Parrot_pcc_get_handlers(interp, context));
        else
            iter = PMCNULL;
    }
    else {
        ++already_doing;

        /* Exceptions store the handler iterator for rethrow, other kinds of
         * tasks don't (though they could). */
        if (task->vtable->base_type == enum_class_Exception
        && VTABLE_get_integer_keyed_str(interp, task, handled_str) == -1) {
            iter    = VTABLE_get_attr_str(interp, task, iter_str);
            context = (PMC *)VTABLE_get_pointer(interp, task);
        }
        else {
            context = CURRENT_CONTEXT(interp);
            if (!PMC_IS_NULL(Parrot_pcc_get_handlers(interp, context)))
                iter = VTABLE_get_iter(interp, Parrot_pcc_get_handlers(interp, context));
        }
    }

    while (context) {
        keep_context = context;
        /* Loop from newest handler to oldest handler. */
        while (!PMC_IS_NULL(iter) && VTABLE_get_bool(interp, iter)) {
            PMC * const handler = VTABLE_shift_pmc(interp, iter);

            if (!PMC_IS_NULL(handler)) {
                INTVAL valid_handler = 0;
                if (handler->vtable->base_type == enum_class_Object)
                    Parrot_pcc_invoke_method_from_c_args(interp, handler, CONST_STRING(interp, "can_handle"),
                        "P->I", task, &valid_handler);
                else
                    Parrot_pcc_invoke_method_from_c_args(interp, handler, CONST_STRING(interp, "can_handle"),
                        "P->I", task, &valid_handler);

                if (valid_handler) {
                    if (task->vtable->base_type == enum_class_Exception) {
                        /* Store iterator and context for a later rethrow. */
                        VTABLE_set_attr_str(interp, task, CONST_STRING(interp, "handler_iter"), iter);
                        VTABLE_set_pointer(interp, task, context);
                    }
                    --already_doing;
                    keep_context = NULL;
                    return handler;
                }
            }
        }

        /* Continue the search in the next context up the chain. */
        context = Parrot_pcc_get_caller_ctx(interp, context);
        if (context && !PMC_IS_NULL(Parrot_pcc_get_handlers(interp, context)))
            iter = VTABLE_get_iter(interp, Parrot_pcc_get_handlers(interp, context));
        else
            iter = PMCNULL;
    }

    /* Reached the end of the context chain without finding a handler. */

    --already_doing;
    return PMCNULL;
}

/*

=item C<void Parrot_cx_schedule_alarm(PARROT_INTERP, PMC *alarm)>

Schedule an alarm.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_alarm(PARROT_INTERP, ARGIN(PMC *alarm))
{
    ASSERT_ARGS(Parrot_cx_schedule_alarm)

    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    FLOATVAL alarm_time = VTABLE_get_number(interp, alarm);
    Parrot_alarm_set(alarm_time);

    /* Insert new alarm at correct (ordered by time) position in array. */
    Parrot_pmc_list_insert_by_number(interp, sched->alarms, alarm);
}

/*

=item C<void Parrot_cx_check_alarms(PARROT_INTERP, PMC *scheduler)>

Add the subs attached to any expired alarms to the task queue.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_check_alarms(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_check_alarms)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);
    INTVAL   alarm_count = VTABLE_get_integer(interp, sched->alarms);
    FLOATVAL now_time    = Parrot_floatval_time();

    while (alarm_count) {
        PMC *alarm = VTABLE_shift_pmc(interp, sched->alarms);
        FLOATVAL alarm_time = VTABLE_get_number(interp, alarm);

        if (alarm_time < now_time) {
            Parrot_Alarm_attributes *data = PARROT_ALARM(alarm);
            Parrot_cx_schedule_immediate(interp, data->alarm_sub);
        }
        else {
            Parrot_alarm_set(alarm_time);
            VTABLE_unshift_pmc(interp, sched->alarms, alarm);
            break;
        }

        alarm_count--;
    }
}

/*

=back

=head2 Opcode Functions

Functions that are called from within opcodes, that take and return an
opcode_t* to allow for changing the code flow.

=over 4


=item C<opcode_t * Parrot_cx_schedule_sleep(PARROT_INTERP, FLOATVAL time,
opcode_t *next)>

Add a sleep timer to the scheduler. This function is called by the C<sleep>
opcode.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_cx_schedule_sleep(PARROT_INTERP, FLOATVAL time, ARGIN_NULLOK(opcode_t *next))
{
    ASSERT_ARGS(Parrot_cx_schedule_sleep)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    FLOATVAL now_time  = Parrot_floatval_time();
    FLOATVAL done_time = now_time + time;

    PMC *alarm = Parrot_pmc_new(interp, enum_class_Alarm);
    Parrot_Alarm_attributes *adata = PARROT_ALARM(alarm);

    PMC *cont = Parrot_pmc_new(interp, enum_class_Continuation);
    VTABLE_set_pointer(interp, cont, next);

    adata->alarm_time = done_time;
    adata->alarm_sub  = cont;
    VTABLE_invoke(interp, alarm, 0);

    return (opcode_t*) 0;
}

/*

=item C<static void scheduler_process_messages(PARROT_INTERP, PMC *scheduler)>

Scheduler maintenance, scan the list of messages sent from other schedulers and
take appropriate action on any received.

=cut

*/

static void
scheduler_process_messages(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(scheduler_process_messages)
    Parrot_Scheduler_attributes * sched_struct = PARROT_SCHEDULER(scheduler);

    PMC    *message;
    STRING *suspend_str = CONST_STRING(interp, "suspend_for_gc");

#if CX_DEBUG
    fprintf(stderr, "processing messages [interp=%p]\n", interp);
#endif

    while (VTABLE_elements(interp, sched_struct->messages) > 0) {
#if CX_DEBUG
    fprintf(stderr, "locking msg_lock (process) [interp=%p]\n", interp);
#endif
        LOCK(sched_struct->msg_lock);
        message = VTABLE_pop_pmc(interp, sched_struct->messages);
#if CX_DEBUG
    fprintf(stderr, "unlocking msg_lock (process) [interp=%p]\n", interp);
#endif
        UNLOCK(sched_struct->msg_lock);
        if (!PMC_IS_NULL(message)
         && Parrot_str_equal(interp, VTABLE_get_string(interp, message),
                suspend_str)) {
#if CX_DEBUG
    fprintf(stderr, "found a suspend, suspending [interp=%p]\n", interp);
#endif
            pt_suspend_self_for_gc(interp);
        }
    }

}

/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
