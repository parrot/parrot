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
static int Parrot_cx_handle_tasks(PARROT_INTERP, ARGINOUT(PMC *scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void* scheduler_runloop(ARGINOUT(PMC *scheduler))
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

/*

=head2 Interface Functions

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
Parrot_cx_handle_tasks(PARROT_INTERP, ARGINOUT(PMC *scheduler))
{
    while (VTABLE_get_integer(interp, scheduler) > 0) {
        PMC * const task = VTABLE_pop_pmc(interp, scheduler);
        const INTVAL tid = VTABLE_get_integer(interp, task);

#if CX_DEBUG
        fprintf(stderr, "Found task ID # %d\n", (int) tid);
#endif
        /* When sent a terminate task, notify the scheduler */
        if (TASK_terminate_runloop_TEST(task)) {
            SCHEDULER_terminate_runloop_SET(scheduler);
        }
        else {
            PMC * const handler = Parrot_cx_find_handler_for_task(interp, task);
            if (!PMC_IS_NULL(handler)) {
                PMC * handler_sub =
                    VTABLE_get_attr_str(interp, handler, CONST_STRING(interp, "code"));

#if CX_DEBUG
                fprintf(stderr, "Found a handler.\n");
#endif
            Parrot_runops_fromc_args_event(interp, handler_sub, "vPP", handler, task);
            }
        }

        VTABLE_delete_keyed_int(interp, scheduler, tid);
    } /* end of pending tasks */

    /* When there are no more pending tasks, if the scheduler received a
     * terminate event, end the scheduler runloop. */
    if (SCHEDULER_terminate_runloop_TEST(scheduler)) {
        return 0;
    }

    return 1;
}

/*

=item C<void Parrot_cx_runloop_sleep>

Pause the scheduler runloop. Called when there are no more pending tasks in the
scheduler's task list, to freeze the runloop until there are tasks to handle.

=cut

*/

void
Parrot_cx_runloop_sleep(ARGINOUT(PMC *scheduler))
{
    Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(scheduler);
    COND_WAIT(sched_struct->condition, sched_struct->lock);
}

/*

=item C<void Parrot_cx_runloop_wake>

Wake a sleeping scheduler runloop (generally called when new tasks are added to
the scheduler's task list).

=cut

*/

void
Parrot_cx_runloop_wake(PARROT_INTERP, ARGINOUT(PMC *scheduler))
{
    Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(scheduler);
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
        PMC * const term_event = pmc_new(interp, enum_class_Task);
#if CX_DEBUG
        fprintf(stderr, "terminating scheduler runloop\n");
#endif
        TASK_terminate_runloop_SET(term_event);
        Parrot_cx_schedule_task(interp, term_event);

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
scheduler_runloop(ARGINOUT(PMC *scheduler))
{
    Parrot_Scheduler * const sched_struct = PARROT_SCHEDULER(scheduler);
    int running = 1;

#if CX_DEBUG
    fprintf(stderr, "started scheduler runloop\n");
#endif
    LOCK(sched_struct->lock);

    while (running) {
        /* Process pending tasks, if there are any */
        if (VTABLE_get_integer(sched_struct->interp, scheduler) > 0) {
#if CX_DEBUG
            fprintf(stderr, "handling tasks in scheduler runloop\n");
#endif
            running = Parrot_cx_handle_tasks(sched_struct->interp, scheduler);
        }
        else {
            /* Otherwise, the runloop sleeps until a task is pending */
#if CX_DEBUG
            fprintf(stderr, "sleeping in scheduler runloop\n");
#endif
            Parrot_cx_runloop_sleep(scheduler);
#if CX_DEBUG
            fprintf(stderr, "waking in scheduler runloop\n");
#endif
            /*                LOCK(sched_struct->lock); */
        }
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
