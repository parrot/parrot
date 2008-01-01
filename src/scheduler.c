/*
Copyright (C) 2007, The Perl Foundation.
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

#include "scheduler.str"

#define CX_DEBUG 0

/* HEADERIZER HFILE: include/parrot/scheduler.h */

/* HEADERIZER BEGIN: static */

PARROT_WARN_UNUSED_RESULT
static int Parrot_cx_handle_tasks(PARROT_INTERP, ARGMOD(PMC *scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*scheduler);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void* scheduler_runloop(ARGMOD(PMC *scheduler))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*scheduler);

/* HEADERIZER END: static */

/*

=head2 Scheduler Interface Functions

Functions that are used to interface with the concurrency scheduler.

=over 4

=item C<void Parrot_cx_init_scheduler>

Initalize the concurrency scheduler for the interpreter.

=cut

*/

typedef void *(pt_start_routine_f)(void *);

void
Parrot_cx_init_scheduler(PARROT_INTERP)
{
#if CX_DEBUG
        fprintf(stderr, "call to Parrot_cx_init_scheduler\n");
#endif
    if (!interp->parent_interpreter) {
        PMC *scheduler;
        Parrot_Scheduler *sched_struct;

        /* Add the very first interpreter to the list of interps. */
        pt_add_to_interpreters(interp, NULL);

#if CX_DEBUG
        fprintf(stderr, "initializing scheduler runloop\n");
#endif

        scheduler = pmc_new(interp, enum_class_Scheduler);
        scheduler = VTABLE_share_ro(interp, scheduler);
        sched_struct = PARROT_SCHEDULER(scheduler);
        COND_INIT(sched_struct->condition);
        MUTEX_INIT(sched_struct->lock);

        interp->scheduler = scheduler;

        /* Start the scheduler runloop */
        THREAD_CREATE_JOINABLE(sched_struct->runloop_handle,
            (pt_start_routine_f *)scheduler_runloop, (void *) scheduler);

    }
}

/*

=item C<static int Parrot_cx_handle_tasks>

Handle the pending tasks in the scheduler's task list. Returns when there are
no more pending tasks. Returns 0 to terminate the scheduler runloop, or 1 to
continue the runloop.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
Parrot_cx_handle_tasks(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
#if CX_DEBUG
    fprintf(stderr, "Handling tasks\n");
#endif
    Parrot_cx_refresh_task_list(interp);

    while (VTABLE_get_integer(interp, scheduler) > 0) {
        PMC * const task = VTABLE_pop_pmc(interp, scheduler);
        if (!PMC_IS_NULL(task)) {
        PMC *type_pmc = VTABLE_get_attr_str(interp, task, CONST_STRING(interp, "type"));
        STRING *type = VTABLE_get_string(interp, type_pmc);

#if CX_DEBUG
        const INTVAL tid = VTABLE_get_integer(interp, task);
        fprintf(stderr, "Found task ID # %d\n", (int) tid);
#endif
        if (string_equal(interp, type, CONST_STRING(interp, "suspend_for_gc")) == 0) {
            Parrot_Task *task_struct = PARROT_TASK(task);
            pt_suspend_self_for_gc(task_struct->interp);
        }
        else if (string_equal(interp, type, CONST_STRING(interp, "callback")) == 0) {
            Parrot_cx_invoke_callback(interp, task);
        }
        else if (string_equal(interp, type, CONST_STRING(interp, "timer")) == 0) {
#if CX_DEBUG
            fprintf(stderr, "have a timer event\n");
#endif
            Parrot_cx_timer_invoke(interp, task);
        }
        else if (string_equal(interp, type, CONST_STRING(interp, "event")) == 0) {
            PMC * const handler = Parrot_cx_find_handler_for_task(interp, task);
            if (!PMC_IS_NULL(handler)) {
                PMC * handler_sub =
                    VTABLE_get_attr_str(interp, handler, CONST_STRING(interp, "code"));
                Parrot_runops_fromc_args_event(interp, handler_sub,
                    "vPP", handler, task);
            }
        }
        else {
            real_exception(interp, NULL, INVALID_OPERATION,
                    "Unknown task type '%s'.\n", string_to_cstring(interp, type));
        }
        Parrot_cx_delete_task(interp, task);
        }

    } /* end of pending tasks */

    Parrot_cx_refresh_task_list(interp);

    /* When there are no more pending tasks, if the scheduler received a
     * terminate event, end the scheduler runloop. */
    if (SCHEDULER_terminate_runloop_TEST(scheduler)
            && (VTABLE_get_integer(interp, scheduler) <= 0)) {
        return 0;
    }

    return 1;
}

/*

=item C<void Parrot_cx_refresh_task_list>

Tell the scheduler to perform maintenance on the priority task list.

=cut

*/

void
Parrot_cx_refresh_task_list(PARROT_INTERP)
{
    if (interp->scheduler)
        Parrot_PCCINVOKE(interp, interp->scheduler,
                CONST_STRING(interp, "refresh_task_list"), "->");
    else
        real_exception(interp, NULL, INVALID_OPERATION,
                "Scheduler was not initialized for this interpreter.\n");
    return;
}

/*

=item C<void Parrot_cx_runloop_sleep>

Pause the scheduler runloop. Called when there are no more pending tasks in the
scheduler's task list, to freeze the runloop until there are tasks to handle.

Sleep is skipped if a wake signal was received since the last sleep, indicating
more tasks to process. Sleep is also skipped if the scheduler is in the process
of terminating, instead processing any remaining tasks as quickly as possible
before finalization.

=cut

*/

void
Parrot_cx_runloop_sleep(ARGMOD(PMC *scheduler))
{
    Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(scheduler);
    if (SCHEDULER_terminate_runloop_TEST(scheduler))
        return;

    if (!SCHEDULER_wake_flag_TEST(scheduler))
        COND_WAIT(sched_struct->condition, sched_struct->lock);
    SCHEDULER_wake_flag_CLEAR(scheduler);
}

/*

=item C<void Parrot_cx_runloop_wake>

Wake a sleeping scheduler runloop (generally called when new tasks are added to
the scheduler's task list).

=cut

*/

void
Parrot_cx_runloop_wake(PARROT_INTERP, ARGMOD(PMC *scheduler))
{
    Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(scheduler);
    SCHEDULER_wake_flag_SET(scheduler);
    COND_SIGNAL(sched_struct->condition);
}


/*

=item C<void Parrot_cx_runloop_end>

Schedule an event to terminate the scheduler runloop.

=cut

*/

PARROT_API
void
Parrot_cx_runloop_end(PARROT_INTERP)
{
#if CX_DEBUG
        fprintf(stderr, "call to Parrot_cx_runloop_end\n");
#endif
    if (!interp->parent_interpreter) {
        Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(interp->scheduler);
        void *raw_retval = NULL;


        /*
        PMC * const term_event = pmc_new(interp, enum_class_Task);
#if CX_DEBUG
        fprintf(stderr, "terminating scheduler runloop\n");
#endif
        TASK_terminate_runloop_SET(term_event);
        Parrot_cx_schedule_task(interp, term_event);
        */

        LOCK(sched_struct->lock);
        SCHEDULER_terminate_runloop_SET(interp->scheduler);
        Parrot_cx_runloop_wake(interp, interp->scheduler);
        UNLOCK(sched_struct->lock);

        JOIN(sched_struct->runloop_handle, raw_retval);
    }
}

/*

=item C<void Parrot_cx_schedule_task>

Add a task to scheduler's task list.

=cut

*/

PARROT_API
void
Parrot_cx_schedule_task(PARROT_INTERP, ARGIN(PMC *task))
{
    if (interp->scheduler)
        VTABLE_push_pmc(interp, interp->scheduler, task);
    else
        real_exception(interp, NULL, INVALID_OPERATION,
                "Scheduler was not initialized for this interpreter.\n");
}

/*

=item C<void Parrot_schedule_timer>

Create a new timer event due at C<diff> from now, repeated at C<interval>
and running the passed C<sub>.

=cut

*/

PARROT_API
void
Parrot_cx_schedule_timer(PARROT_INTERP,
        ARGIN_NULLOK(STRING *type), FLOATVAL duration, FLOATVAL interval,
        INTVAL repeat, ARGIN_NULLOK(PMC *sub))
{
    PMC *timer = pmc_new(interp, enum_class_Timer);

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

=item C<void Parrot_cx_schedule_repeat>

Add a repeat task to scheduler's task list.

=cut

*/

PARROT_API
void
Parrot_cx_schedule_repeat(PARROT_INTERP, ARGIN(PMC *task))
{
    INTVAL repeat = VTABLE_get_integer_keyed_int(interp, task,
            PARROT_TIMER_REPEAT);
    FLOATVAL duration = VTABLE_get_number_keyed_int(interp, task,
            PARROT_TIMER_INTERVAL);
    if (repeat != 0) {
        PMC *repeat_task = VTABLE_clone(interp, task);
        VTABLE_set_number_keyed_int(interp, repeat_task, PARROT_TIMER_NSEC, duration);

        if (repeat > 0)
            VTABLE_set_integer_keyed_int(interp, repeat_task,
                PARROT_TIMER_REPEAT, repeat - 1);

        Parrot_cx_schedule_task(interp, repeat_task);
    }
}

/*

=item C<void Parrot_schedule_callback>

Create a new callback event, with an argument for the call.

=cut

*/

PARROT_API
void
Parrot_cx_schedule_callback(PARROT_INTERP,
        ARGIN(PMC *user_data), ARGIN(char *ext_data))
{
    PMC *callback = pmc_new(interp, enum_class_Task);
    Parrot_Task * const task_struct = PARROT_TASK(callback);

    task_struct->type    = CONST_STRING(interp, "callback");
    task_struct->data    = user_data;
    task_struct->cb_data = ext_data;

    Parrot_cx_schedule_task(interp, callback);
}

/*

=item C<void Parrot_schedule_suspend_for_gc>

Create a new timer event due at C<diff> from now, repeated at C<interval>
and running the passed C<sub>.

=cut

*/

PARROT_API
void
Parrot_cx_schedule_suspend_for_gc(PARROT_INTERP)
{
    PMC *event = pmc_new(interp, enum_class_Task);

    VTABLE_set_string_native(interp, event, CONST_STRING(interp, "suspend_for_gc"));

    Parrot_cx_schedule_task(interp, event);
}

/*

=item C<void Parrot_cx_delete_task>

Remove a task from the scheduler's task list.

=cut

*/

PARROT_API
void
Parrot_cx_delete_task(PARROT_INTERP, ARGIN(PMC *task))
{
    if (interp->scheduler) {
        const INTVAL tid = VTABLE_get_integer(interp, task);
        VTABLE_delete_keyed_int(interp, interp->scheduler, tid);
    }
    else
        real_exception(interp, NULL, INVALID_OPERATION,
                "Scheduler was not initialized for this interpreter.\n");
}


/*

=item C<PMC * Parrot_cx_delete_suspend_for_gc>

Remove a task that would suspend GC from the task list. (Provided for backward
compatibility in the threads implementation.)

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_delete_suspend_for_gc(PARROT_INTERP)
{
    if (interp->scheduler) {
        Parrot_Scheduler * sched_struct = PARROT_SCHEDULER(interp->scheduler);
        INTVAL num_tasks, index;

        /* Search the task index for GC suspend tasks */
        num_tasks = VTABLE_elements(interp, sched_struct->task_index);
        for (index = 0; index < num_tasks; index++) {
            INTVAL tid = VTABLE_get_integer_keyed_int(interp, sched_struct->task_index, index);
            if (tid > 0) {
                PMC *task = VTABLE_get_pmc_keyed_int(interp, sched_struct->task_list, tid);
                if (!PMC_IS_NULL(task)) {
                    PMC *type = VTABLE_get_attr_str(interp, task,
                            CONST_STRING(interp, "type"));
                    if (string_equal(interp, VTABLE_get_string(interp, type),
                                CONST_STRING(interp, "suspend_for_gc")) == 0) {
                        Parrot_cx_delete_task(interp, task);
                        return task;
                    }
                }
            }
        }
    }
    else
        real_exception(interp, NULL, INVALID_OPERATION,
                "Scheduler was not initialized for this interpreter.\n");

    return PMCNULL;
}

/*

=item C<void Parrot_cx_add_handler>

Add a task handler to scheduler's list of handlers.

=cut

*/

PARROT_API
void
Parrot_cx_add_handler(PARROT_INTERP, ARGIN(PMC *handler))
{
    if (interp->scheduler)
        Parrot_PCCINVOKE(interp, interp->scheduler,
                CONST_STRING(interp, "add_handler"), "P->", handler);
    else
        real_exception(interp, NULL, INVALID_OPERATION,
                "Scheduler was not initialized for this interpreter.\n");
    return;
}

/*

=back

=head2 Task Interface Functions

Functions that are used to interface with a specific task in the concurrency scheduler.

=over 4

=item C<PMC * Parrot_cx_find_handler_for_task>

Retrieve a handler appropriate to a given task. If the scheduler has no
appropriate handler, returns PMCNULL.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_find_handler_for_task(PARROT_INTERP, ARGIN(PMC *task))
{
    PMC *handler = PMCNULL;
#if CX_DEBUG
    fprintf(stderr, "searching for handler\n");
#endif

    if (interp->scheduler)
        Parrot_PCCINVOKE(interp, interp->scheduler,
                CONST_STRING(interp, "find_handler"), "P->P", task, &handler);
    else
        real_exception(interp, NULL, INVALID_OPERATION,
                "Scheduler was not initialized for this interpreter.\n");

#if CX_DEBUG
    fprintf(stderr, "done searching for handler\n");
#endif
    return handler;
}

/*

=item C<void Parrot_cx_timer_invoke>

Run the associated code block for a timer event, when the timer fires.

=cut

*/

void
Parrot_cx_timer_invoke(PARROT_INTERP, ARGIN(PMC *timer))
{
    Parrot_Timer * const timer_struct = PARROT_TIMER(timer);
#if CX_DEBUG
    fprintf(stderr, "current timer time: %f, %f\n",
                    timer_struct->birthtime + timer_struct->duration,
                    Parrot_floatval_time());
#endif
    if (!PMC_IS_NULL(timer_struct->codeblock)) {
        Parrot_runops_fromc_args_event(interp,
                timer_struct->codeblock, "v");
    }
}

/*

=item C<void Parrot_cx_invoke_callback>

Run the associated code block for a callback event.

=cut

*/

void
Parrot_cx_invoke_callback(PARROT_INTERP, ARGIN(PMC *callback))
{
    Parrot_Task * const task_struct = PARROT_TASK(callback);
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


=item C<opcode_t * Parrot_cx_schedule_sleep>

Add a sleep timer to the scheduler. This function is called by the C<sleep>
opcode.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_cx_schedule_sleep(PARROT_INTERP, FLOATVAL time, ARGIN_NULLOK(opcode_t *next))
{
#if PARROT_HAS_THREADS
    Parrot_cond condition;
    Parrot_mutex lock;
    FLOATVAL timer_end = time + Parrot_floatval_time();
    struct timespec time_struct;

    /* Tell the scheduler runloop to wake, this is a good time to process
     * pending tasks. */
    Parrot_cx_runloop_wake(interp, interp->scheduler);

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
#else
    /* A more primitive, platform-specific, non-threaded form of sleep. */
    Parrot_sleep((UINTVAL) ceil(time));
#endif
    return next;
}


/*

=back

=head2 Internal Functions

Functions that are only used within the scheduler.

=over 4

=item C<static void* scheduler_runloop>

The scheduler runloop is started by the interpreter. It manages the flow of
concurrent scheduling for the parent interpreter, and for lightweight
concurrent tasks running within that interpreter. More complex concurrent tasks
have their own runloop.

Currently the runloop is implented as a mutex/lock thread.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void*
scheduler_runloop(ARGMOD(PMC *scheduler))
{
    Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(scheduler);
    int running = 1;

#if CX_DEBUG
    fprintf(stderr, "started scheduler runloop\n");
#endif
    LOCK(sched_struct->lock);

    while (running) {
#if CX_DEBUG
        fprintf(stderr, "Before sleep\n");
#endif
        /* Sleep until a task is pending */
        Parrot_cx_runloop_sleep(scheduler);

#if CX_DEBUG
        fprintf(stderr, "After sleep, before handling tasks\n");
#endif
        /* Process pending tasks, if there are any */
        running = Parrot_cx_handle_tasks(sched_struct->interp, scheduler);
#if CX_DEBUG
        fprintf(stderr, "After handling tasks\n");
#endif

    } /* end runloop */

#if CX_DEBUG
    fprintf(stderr, "ended scheduler runloop\n");
#endif

    UNLOCK(sched_struct->lock);

    COND_DESTROY(sched_struct->condition);
    MUTEX_DESTROY(sched_struct->lock);

    return NULL;
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
