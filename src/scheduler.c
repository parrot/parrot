/*
Copyright (C) 2007-2011, Parrot Foundation.

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


static int enable_scheduling = 0;

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
    interp->quantum_done = Parrot_floatval_time() + PARROT_TASK_SWITCH_QUANTUM;

    if (!interp->parent_interpreter) {
        interp->scheduler = Parrot_pmc_new(interp, enum_class_Scheduler);

        /* Make sure the program can handle alarm signals */
        Parrot_alarm_init();
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
    INTVAL alarm_count;
    INTVAL task_count  = 1;

    PMC* main_task = Parrot_pmc_new(interp, enum_class_Task);
    Parrot_Task_attributes *tdata = PARROT_TASK(main_task);

    tdata->code = main;
    tdata->data = argv;

    Parrot_cx_schedule_immediate(interp, main_task);
    Parrot_cx_outer_runloop(interp);

    task_count = VTABLE_get_integer(interp, sched->all_tasks);
    if (task_count > 0)
        Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                    "Exiting with %d active tasks.\n", task_count);
}

/*

=item C<void Parrot_cx_outer_runloop(PARROT_INTERP)>

This is the core loop performed by each active OS thread. If it's the
thread that needs to be running, it invokes the Scheduler to pick a
task.

=cut

*/

void
Parrot_cx_outer_runloop(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_outer_runloop)
    PMC* scheduler = interp->scheduler;
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);
    INTVAL next_thread, task_count, alarm_count;

    do {
        while ((task_count = VTABLE_get_integer(interp, sched->task_queue))) {
            /* there can be no active runloops at this point, so it should be save
             * to start counting at 0 again. This way the continuation in the next
             * task will find a runloop with id 1 when encountering an exception */
            interp->current_runloop_level = 0;
            reset_runloop_id_counter(interp);

            Parrot_cx_next_task(interp, scheduler);

            /* add expired alarms to the task queue */
            Parrot_cx_check_alarms(interp, interp->scheduler);
        }

        alarm_count = VTABLE_get_integer(interp, sched->alarms);
        if (alarm_count > 0) {
            pause;
            Parrot_cx_check_alarms(interp, interp->scheduler);
        }
    } while (alarm_count);
}

/*

=item C<void Parrot_cx_set_scheduler_alarm(PARROT_INTERP)>

Set the task switch alarm for the scheduler.

*/

void
Parrot_cx_set_scheduler_alarm(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_set_scheduler_alarm)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    FLOATVAL  time_now = Parrot_floatval_time();

    interp->quantum_done = time_now + PARROT_TASK_SWITCH_QUANTUM;

    Parrot_alarm_set(interp->quantum_done);
    enable_scheduling = 1;
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

    opcode_t *dest;

    PMC *task = VTABLE_shift_pmc(interp, sched->task_queue);

    if (!VTABLE_isa(interp, task, CONST_STRING(interp, "Task")))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Found a non-Task in the task queue.\n");

    interp->cur_task = task;

    if (VTABLE_get_integer(interp, sched->task_queue) > 0) {
        Parrot_cx_set_scheduler_alarm(interp);
    }
    else
        if (VTABLE_get_integer(interp, sched->alarms) == 0)
            enable_scheduling = 0;

    Parrot_ext_call(interp, task, "->");
}

/*

=item C<opcode_t* Parrot_cx_check_scheduler(PARROT_INTERP, opcode_t* next)>

Does the scheduler need to wake up and do anything? If so, do that now.

=cut

*/

PARROT_CANNOT_RETURN_NULL
opcode_t*
Parrot_cx_check_scheduler(PARROT_INTERP, ARGIN(opcode_t* next))
{
    ASSERT_ARGS(Parrot_cx_check_scheduler)
    PMC *scheduler = interp->scheduler;

    if (Parrot_alarm_check(&(interp->last_alarm))
        || SCHEDULER_wake_requested_TEST(scheduler)) {
        SCHEDULER_wake_requested_CLEAR(scheduler);
        return Parrot_cx_run_scheduler(interp, scheduler, next);
    }

    return next;
}

/*

=item C<opcode_t* Parrot_cx_run_scheduler(PARROT_INTERP, PMC *scheduler,
opcode_t *next)>

Checks to see if any tasks need to be scheduled or if the current task
needs to be pre-empted.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
opcode_t*
Parrot_cx_run_scheduler(PARROT_INTERP, ARGMOD(PMC *scheduler), ARGIN(opcode_t *next))
{
    ASSERT_ARGS(Parrot_cx_run_scheduler)

    Parrot_cx_check_alarms(interp, scheduler);
    Parrot_cx_check_quantum(interp, scheduler);

    if (SCHEDULER_resched_requested_TEST(scheduler)) {
        SCHEDULER_resched_requested_CLEAR(scheduler);

        /* A task switch will only work in the outer runloop of a fully
           booted Parrot. In a Parrot that hasn't called begin_execution,
           or in a nested runloop, we silently ignore task switches. */
        if (enable_scheduling && interp->current_runloop_level <= 1)
            return Parrot_cx_preempt_task(interp, scheduler, next);
    }

    Parrot_alarm_set(interp->quantum_done);

    return next;
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
=item C<PMC* Parrot_cx_stop_task(PARROT_INTERP, opcode_t *next)>

Stop the current task and pack it up into a PMC what can be used to resume later.

=cut
*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_cx_stop_task(PARROT_INTERP, ARGIN(opcode_t *next))
{
    ASSERT_ARGS(Parrot_cx_stop_task)

    PMC *task = Parrot_task_current(interp);
    Parrot_Task_attributes *tdata = PARROT_TASK(task);

    PMC *cont = Parrot_pmc_new(interp, enum_class_Continuation);
    VTABLE_set_pointer(interp, cont, next);

    if (PMC_IS_NULL(task) || !VTABLE_isa(interp, task, CONST_STRING(interp, "Task")))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Attempt to stop invalid interp->current_task.\n");

    tdata->code = cont;
    TASK_in_preempt_SET(task);

    return task;
}

/*
=item C<opcode_t* Parrot_cx_preempt_task(PARROT_INTERP, PMC *scheduler, opcode_t
*next)>

Pre-empt the current task. It goes on the foot of the task queue,
and then we jump all the way back to the task scheduling loop.

=cut
*/

PARROT_CANNOT_RETURN_NULL
opcode_t*
Parrot_cx_preempt_task(PARROT_INTERP, ARGMOD(PMC *scheduler), ARGIN(opcode_t *next))
{
    ASSERT_ARGS(Parrot_cx_preempt_task)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);

    PMC* task = Parrot_cx_stop_task(interp, next);
    VTABLE_push_pmc(interp, sched->task_queue, task);

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

void
Parrot_cx_runloop_end(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_runloop_end)
    SCHEDULER_terminate_requested_SET(interp->scheduler);
    /* Chandon TODO: Why is this here? */
    /* Parrot_cx_handle_tasks(interp, interp->scheduler); */
}

/*

=item C<void Parrot_cx_schedule_task(PARROT_INTERP, PMC *task_or_sub)>

Add a task to to the task queue for execution.

Probably cannot be called across interpreters/threads, must instead be
called from within the interpreter's runloop.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_task(PARROT_INTERP, ARGIN(PMC *task_or_sub))
{
    ASSERT_ARGS(Parrot_cx_schedule_task)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    PMC *task = PMCNULL;

    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    if (VTABLE_isa(interp, task_or_sub, CONST_STRING(interp, "Task"))) {
        task = task_or_sub;
    }
    else if (VTABLE_isa(interp, task_or_sub, CONST_STRING(interp, "Sub"))) {
        Parrot_Task_attributes *tdata;
        task  = Parrot_pmc_new(interp, enum_class_Task);
        tdata = PARROT_TASK(task);
        tdata->code = task_or_sub;
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Can only schedule Tasks and Subs.\n");
    }

    VTABLE_push_pmc(interp, sched->task_queue, task);

    /* going from single to multi-tasking? */
    if (VTABLE_get_integer(interp, sched->task_queue) == 1)
        Parrot_cx_set_scheduler_alarm(interp);
}

/*

=item C<void Parrot_cx_schedule_immediate(PARROT_INTERP, PMC *task_or_sub)>

Add a task to the task queue for immediate execution.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_schedule_immediate(PARROT_INTERP, ARGIN(PMC *task_or_sub))
{
    ASSERT_ARGS(Parrot_cx_schedule_immediate)
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    PMC *task;

    if (VTABLE_isa(interp, task_or_sub, CONST_STRING(interp, "Task"))) {
        task = task_or_sub;
    }
    else if (VTABLE_isa(interp, task_or_sub, CONST_STRING(interp, "Sub"))) {
        Parrot_Task_attributes *tdata;
        task  = Parrot_pmc_new(interp, enum_class_Task);
        tdata = PARROT_TASK(task);
        tdata->code = task_or_sub;
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Can only schedule Tasks and Subs.\n");
    }

    VTABLE_unshift_pmc(interp, sched->task_queue, task);
    SCHEDULER_wake_requested_SET(interp->scheduler);
    SCHEDULER_resched_requested_SET(interp->scheduler);

    /* going from single to multi-tasking? */
    if (VTABLE_get_integer(interp, sched->task_queue) == 1)
        Parrot_cx_set_scheduler_alarm(interp);
}

/*

=item C<PMC* Parrot_task_current(PARROT_INTERP)>

Returns the task that is currently running.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_task_current(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_task_current)
    return interp->cur_task;
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
        /* Search the task index for GC suspend tasks */
        num_tasks = VTABLE_elements(interp, sched_struct->messages);
        for (index = 0; index < num_tasks; ++index) {
            PMC *message = VTABLE_get_pmc_keyed_int(interp, sched_struct->messages, index);
            if (!PMC_IS_NULL(message)
            &&   STRING_equal(interp, VTABLE_get_string(interp, message),
                        suspend_str)) {
                VTABLE_delete_keyed_int(interp, sched_struct->messages, index);
                return message;
            }
        }
#if CX_DEBUG
    fprintf(stderr, "unlocking msg_lock (delete) [interp=%p]\n", interp);
#endif

    }
    else
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    return PMCNULL;
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

#if CX_DEBUG
    fprintf(stderr, "sending message[interp=%p]\n", interp);
#endif

#if CX_DEBUG
    fprintf(stderr, "locking msg_lock (send) [interp=%p]\n", interp);
#endif
        VTABLE_push_pmc(interp, sched_struct->messages, message);
#if CX_DEBUG
    fprintf(stderr, "unlocking msg_lock (send) [interp=%p]\n", interp);
#endif
        Parrot_cx_runloop_wake(interp, interp->scheduler);

    }

}

/*


/*

=item C<void Parrot_cx_schedule_alarm(PARROT_INTERP, PMC *alarm)>

Schedule an alarm.

=cut

*/

void
Parrot_cx_schedule_alarm(PARROT_INTERP, ARGIN(PMC *alarm))
{
    ASSERT_ARGS(Parrot_cx_schedule_alarm)

    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(interp->scheduler);
    FLOATVAL alarm_time = VTABLE_get_number(interp, alarm);
    Parrot_alarm_set(alarm_time);
    enable_scheduling = 1;

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
            Parrot_cx_schedule_immediate(interp, data->alarm_task);
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

    PMC *task = Parrot_cx_stop_task(interp, next);
    enable_scheduling = 1;

    adata->alarm_time = done_time;
    adata->alarm_task = task;
    (void) VTABLE_invoke(interp, alarm, 0);

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
        message = VTABLE_pop_pmc(interp, sched_struct->messages);
#if CX_DEBUG
    fprintf(stderr, "unlocking msg_lock (process) [interp=%p]\n", interp);
#endif
        if (!PMC_IS_NULL(message)
         && STRING_equal(interp, VTABLE_get_string(interp, message),
                suspend_str)) {
#if CX_DEBUG
    fprintf(stderr, "found a suspend, suspending [interp=%p]\n", interp);
#endif
        }
    }

}

/*

=back

=head1 SEE ALSO

F<include/parrot/scheduler.h>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
