/*
Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

src/scheduler.c - The core routines for the concurrency scheduler

=head1 DESCRIPTION

Each interpreter has a concurrency scheduler element in its core struct. The
scheduler is responsible for receiving, dispatching, and monitoring events,
exceptions, async I/O, and concurrent tasks (threads).

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/scheduler_private.h"
#include "parrot/runcore_api.h"

#include "pmc/pmc_scheduler.h"
#include "pmc/pmc_task.h"
#include "pmc/pmc_timer.h"

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

static void scheduler_process_wait_list(PARROT_INTERP,
    ARGMOD(PMC *scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*scheduler);

#define ASSERT_ARGS_scheduler_process_messages __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
#define ASSERT_ARGS_scheduler_process_wait_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(scheduler))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head2 Scheduler Interface Functions

Functions to interface with the concurrency scheduler.

=over 4

=item C<void Parrot_cx_init_scheduler(PARROT_INTERP)>

Initialize the concurrency scheduler for the interpreter.

=cut

*/

void
Parrot_cx_init_scheduler(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_init_scheduler)
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

=item C<void Parrot_cx_check_tasks(PARROT_INTERP, PMC *scheduler)>

If a wake request has been received, handle tasks.

=cut

*/

void
Parrot_cx_check_tasks(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_check_tasks)
    if (SCHEDULER_wake_requested_TEST(scheduler))
        Parrot_cx_handle_tasks(interp, interp->scheduler);
}

/*

=item C<void Parrot_cx_handle_tasks(PARROT_INTERP, PMC *scheduler)>

Handle the pending tasks in the scheduler's task list. Returns when there are
no more pending tasks.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_handle_tasks(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_handle_tasks)

    /* avoid recursive calls */
    if (SCHEDULER_in_handler_TEST(scheduler))
        return;

    SCHEDULER_in_handler_SET(scheduler);
    SCHEDULER_wake_requested_CLEAR(scheduler);
    Parrot_cx_refresh_task_list(interp, scheduler);

    while (VTABLE_get_integer(interp, scheduler) > 0) {
        PMC * const task = VTABLE_pop_pmc(interp, scheduler);
        if (!PMC_IS_NULL(task)) {
            PMC    * const type_pmc = VTABLE_get_attr_str(interp, task, CONST_STRING(interp, "type"));
            STRING * const type     = VTABLE_get_string(interp, type_pmc);

            if (STRING_equal(interp, type, CONST_STRING(interp, "callback"))) {
                Parrot_cx_invoke_callback(interp, task);
            }
            else if (STRING_equal(interp, type, CONST_STRING(interp, "timer"))) {
                Parrot_cx_timer_invoke(interp, task);
            }
            else if (STRING_equal(interp, type, CONST_STRING(interp, "event"))) {
                PMC * const handler = Parrot_cx_find_handler_for_task(interp, task);
                if (!PMC_IS_NULL(handler)) {
                    PMC * const handler_sub = VTABLE_get_attr_str(interp, handler, CONST_STRING(interp, "code"));
                    Parrot_ext_call(interp, handler_sub, "PP->", handler, task);
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

    SCHEDULER_in_handler_CLEAR(scheduler);
}

/*

=item C<void Parrot_cx_refresh_task_list(PARROT_INTERP, PMC *scheduler)>

Tell the scheduler to perform maintenance on its list of active tasks, checking
for completed timers or sleep events, sorting for priority, checking for
messages, etc.

=cut

*/

void
Parrot_cx_refresh_task_list(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(Parrot_cx_refresh_task_list)
    scheduler_process_wait_list(interp, scheduler);
    scheduler_process_messages(interp, scheduler);

    /* TODO: Sort the task list index */

    SCHEDULER_cache_valid_SET(scheduler);
    return;
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
    Parrot_cx_handle_tasks(interp, interp->scheduler);
}

/*

=item C<void Parrot_cx_schedule_task(PARROT_INTERP, PMC *task)>

Add a task to scheduler's task list. Cannot be called across
interpreters/threads, must be called from within the interpreter's runloop.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_task(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_schedule_task)
    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    VTABLE_push_pmc(interp, interp->scheduler, task);
}

/*

=item C<PMC * Parrot_cx_peek_task(PARROT_INTERP)>

Retrieve the the top task on the scheduler's task list, but don't remove it
from the list.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_peek_task(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_peek_task)
    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    return VTABLE_pop_pmc(interp, interp->scheduler);
}

/*

=item C<void Parrot_cx_schedule_timer(PARROT_INTERP, STRING *type, FLOATVAL
duration, FLOATVAL interval, INTVAL repeat, PMC *sub)>

Create a new timer event due at C<diff> from now, repeated at C<interval>
and running the passed C<sub>.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_timer(PARROT_INTERP,
        ARGIN_NULLOK(STRING *type), FLOATVAL duration, FLOATVAL interval,
        INTVAL repeat, ARGIN_NULLOK(PMC *sub))
{
    ASSERT_ARGS(Parrot_cx_schedule_timer)
    PMC * const timer = Parrot_pmc_new(interp, enum_class_Timer);

    VTABLE_set_number_keyed_int(interp, timer, PARROT_TIMER_NSEC, duration);
    VTABLE_set_number_keyed_int(interp, timer, PARROT_TIMER_INTERVAL, interval);
    VTABLE_set_integer_keyed_int(interp, timer, PARROT_TIMER_REPEAT, repeat);

    if (!PMC_IS_NULL(sub))
        VTABLE_set_pmc_keyed_int(interp, timer, PARROT_TIMER_HANDLER, sub);

    if (!STRING_IS_NULL(type))
        VTABLE_set_string_native(interp, timer, type);

    if (repeat && FLOAT_IS_ZERO(interval))
        VTABLE_set_number_keyed_int(interp, timer, PARROT_TIMER_INTERVAL, duration);

    Parrot_cx_schedule_task(interp, timer);
}

/*

=item C<void Parrot_cx_schedule_repeat(PARROT_INTERP, PMC *task)>

Add a repeat task to scheduler's task list.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_repeat(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_schedule_repeat)
    INTVAL repeat = VTABLE_get_integer_keyed_int(interp, task,
            PARROT_TIMER_REPEAT);
    FLOATVAL duration = VTABLE_get_number_keyed_int(interp, task,
            PARROT_TIMER_INTERVAL);
    if (repeat != 0) {
        PMC * const repeat_task = VTABLE_clone(interp, task);
        VTABLE_set_number_keyed_int(interp, repeat_task, PARROT_TIMER_NSEC, duration);

        if (repeat > 0)
            VTABLE_set_integer_keyed_int(interp, repeat_task,
                PARROT_TIMER_REPEAT, repeat - 1);

        Parrot_cx_schedule_task(interp, repeat_task);
    }
}

/*

=item C<void Parrot_cx_schedule_callback(PARROT_INTERP, PMC *user_data, char
*ext_data)>

Create a new callback event, with an argument for the call.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_callback(PARROT_INTERP,
        ARGIN(PMC *user_data), ARGIN(char *ext_data))
{
    ASSERT_ARGS(Parrot_cx_schedule_callback)
    PMC * const callback = Parrot_pmc_new(interp, enum_class_Task);
    Parrot_Task_attributes * const task_struct = PARROT_TASK(callback);

    task_struct->type    = CONST_STRING(interp, "callback");
    task_struct->data    = user_data;
    task_struct->cb_data = ext_data;

    Parrot_cx_schedule_task(interp, callback);
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

=item C<void Parrot_cx_delete_task(PARROT_INTERP, PMC *task)>

Remove a task from the scheduler's task list.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_task(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_delete_task)
    if (interp->scheduler) {
        const INTVAL tid = VTABLE_get_integer(interp, task);
        VTABLE_delete_keyed_int(interp, interp->scheduler, tid);
    }
    else if (interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");
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
            &&   STRING_equal(interp, VTABLE_get_string(interp, message),
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
    PMC *handlers = Parrot_pcc_get_handlers(interp, interp->ctx);
    if (PMC_IS_NULL(handlers)) {
        handlers = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
        Parrot_pcc_set_handlers(interp, interp->ctx, handlers);
    }
    VTABLE_unshift_pmc(interp, handlers, handler);

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
Parrot_cx_delete_handler_local(PARROT_INTERP, ARGIN_NULLOK(STRING *handler_type))
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
            STRING_equal(interp, handler_type, exception_str) ?
            Hexception :
            STRING_equal(interp, handler_type, event_str) ?
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
            (STRING_equal(interp, handler_type, exception_str)) ?
            Hexception :
            (STRING_equal(interp, handler_type, event_str)) ?
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
Parrot_cx_send_message(PARROT_INTERP, ARGIN(STRING *messagetype), ARGIN(SHIM(PMC *payload)))
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
    PMC            *iter             = PMCNULL;
    STRING * const  handled_str      = CONST_STRING(interp, "handled");
    STRING * const  handler_iter_str = CONST_STRING(interp, "handler_iter");
    STRING * const  exception_str    = CONST_STRING(interp, "Exception");
    const Parrot_Int is_exception = VTABLE_does(interp, task, exception_str);

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
        if (context) {
            PMC * const handlers = Parrot_pcc_get_handlers(interp, context);
            if (!PMC_IS_NULL(handlers))
                iter = VTABLE_get_iter(interp, handlers);
        }
    }
    else {
        ++already_doing;

        /* Exceptions store the handler iterator for rethrow, other kinds of
         * tasks don't (though they could). */
        if (is_exception &&
            VTABLE_get_integer_keyed_str(interp, task, handled_str) == -1) {
            iter    = VTABLE_get_attr_str(interp, task, handler_iter_str);
            context = (PMC *)VTABLE_get_pointer(interp, task);
        }
        else {
            PMC * handlers;
            context = CURRENT_CONTEXT(interp);
            handlers = Parrot_pcc_get_handlers(interp, context);
            if (!PMC_IS_NULL(handlers))
                iter = VTABLE_get_iter(interp, handlers);
        }
    }

    while (context) {
        keep_context = context;
        /* Loop from newest handler to oldest handler. */
        while (!PMC_IS_NULL(iter) && VTABLE_get_bool(interp, iter)) {
            PMC * const handler = VTABLE_shift_pmc(interp, iter);

            if (!PMC_IS_NULL(handler)) {
                INTVAL valid_handler = 0;
                Parrot_pcc_invoke_method_from_c_args(interp, handler, CONST_STRING(interp, "can_handle"),
                        "P->I", task, &valid_handler);

                if (valid_handler) {
                    if (is_exception) {
                        /* Store iterator and context for a later rethrow. */
                        VTABLE_set_attr_str(interp, task, handler_iter_str, iter);
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
        if (context) {
            PMC * const handlers = Parrot_pcc_get_handlers(interp, context);
            iter = PMC_IS_NULL(handlers) ? PMCNULL :
                    VTABLE_get_iter(interp, handlers);
        }
        else
            iter = PMCNULL;
    }

    /* Reached the end of the context chain without finding a handler. */

    --already_doing;
    return PMCNULL;
}

/*

=item C<void Parrot_cx_timer_invoke(PARROT_INTERP, PMC *timer)>

Run the associated code block for a timer event, when the timer fires.

=cut

*/

void
Parrot_cx_timer_invoke(PARROT_INTERP, ARGIN(PMC *timer))
{
    ASSERT_ARGS(Parrot_cx_timer_invoke)
    Parrot_Timer_attributes * const timer_struct = PARROT_TIMER(timer);
#if CX_DEBUG
    fprintf(stderr, "current timer time: %f, %f\n",
                    timer_struct->birthtime + timer_struct->duration,
                    Parrot_floatval_time());
#endif
    if (!PMC_IS_NULL(timer_struct->codeblock)) {
        Parrot_ext_call(interp, timer_struct->codeblock, "->");
    }
}

/*

=item C<void Parrot_cx_invoke_callback(PARROT_INTERP, PMC *callback)>

Run the associated code block for a callback event.

=cut

*/

void
Parrot_cx_invoke_callback(PARROT_INTERP, ARGIN(PMC *callback))
{
    ASSERT_ARGS(Parrot_cx_invoke_callback)
    Parrot_Task_attributes * const task_struct = PARROT_TASK(callback);
    if (!PMC_IS_NULL(task_struct->data)) {
        Parrot_run_callback(interp, task_struct->data,
                task_struct->cb_data);
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

    /* Tell the scheduler runloop to wake, this is a good time to process
     * pending tasks. */
    Parrot_cx_runloop_wake(interp, interp->scheduler);

#ifdef PARROT_HAS_THREADS
    {
        Parrot_cond condition;
        Parrot_mutex lock;
        const FLOATVAL timer_end = time + Parrot_floatval_time();
        struct timespec time_struct;

        /* Tell this thread to sleep for the requested time. */
        COND_INIT(condition);
        MUTEX_INIT(lock);
        LOCK(lock);
        time_struct.tv_sec = (time_t) timer_end;
        time_struct.tv_nsec = (long)((timer_end - time_struct.tv_sec)*1000.0f) *1000L*1000L;
        COND_TIMED_WAIT(condition, lock, &time_struct);
        UNLOCK(lock);
        COND_DESTROY(condition);
        MUTEX_DESTROY(lock);
    }
#else
    /* A more primitive, platform-specific, non-threaded form of sleep. */
    if (time > 1000) {
        /* prevent integer overflow when converting to microseconds */
        const int seconds = floor(time);
        Parrot_sleep(seconds);
        time -= seconds;
    }
    Parrot_usleep((UINTVAL) time*1000000);
#endif
    return next;
}


/*

=back

=head2 Internal Functions

Functions that are only used within the scheduler.

=over 4

=item C<static void scheduler_process_wait_list(PARROT_INTERP, PMC *scheduler)>

Scheduler maintenance, scan the list of waiting tasks to see if any are ready
to become active tasks.

=cut

*/

static void
scheduler_process_wait_list(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    ASSERT_ARGS(scheduler_process_wait_list)
    Parrot_Scheduler_attributes * sched_struct = PARROT_SCHEDULER(scheduler);
    INTVAL num_tasks, index;

    /* Sweep the wait list for completed timers */
    num_tasks = VTABLE_elements(interp, sched_struct->wait_index);
    for (index = 0; index < num_tasks; ++index) {
        INTVAL tid = VTABLE_get_integer_keyed_int(interp, sched_struct->wait_index, index);
        if (tid > 0) {
            PMC *task = VTABLE_get_pmc_keyed_int(interp, sched_struct->task_list, tid);
            if (PMC_IS_NULL(task)) {
                /* Cleanup expired tasks. */
                VTABLE_set_integer_keyed_int(interp, sched_struct->wait_index, index, 0);
            }
            else {
                /* Move the timer to the active task list if the timer has
                 * completed. */
                FLOATVAL timer_end_time = VTABLE_get_number_keyed_int(interp,
                        task, PARROT_TIMER_NSEC);
                if (timer_end_time <= Parrot_floatval_time()) {
                    VTABLE_push_integer(interp, sched_struct->task_index, tid);
                    VTABLE_set_integer_keyed_int(interp, sched_struct->wait_index, index, 0);
                    Parrot_cx_schedule_repeat(interp, task);
                    SCHEDULER_cache_valid_CLEAR(scheduler);
                }
            }
        }
    }
}

/*

=over 4

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
         && STRING_equal(interp, VTABLE_get_string(interp, message),
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
