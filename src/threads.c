/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/threads.c - Functions supporting hybrid threads.

=head1 DESCRIPTION

These functions transparently manage OS threads in the Parrot interpreter.

=head2 Functions

=over 4

=cut

*/

#include "parrot/threads.h"
#include "parrot/alarm.h"
#include "pmc/pmc_scheduler.h"
#include "pmc/pmc_task.h"

/* HEADERIZER HFILE: include/parrot/threads.h */

/*

=item C<void Parrot_threads_init(PARROT_INTERP)>

Initialize the interpreter to support worker threads.

=cut

*/


void
Parrot_threads_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_init)
    Thread_table *tbl;
    INTVAL *zero = (INTVAL*) malloc(sizeof (INTVAL));
    *zero = 0;

    MUTEX_INIT(interp->interp_lock);
    PARROT_ATOMIC_INT_INIT(interp->thread_signal);
    PARROT_ATOMIC_INT_SET(interp->thread_signal, 0);

    MUTEX_INIT(interp->thread_lock);

    interp->thread_table = (Thread_table*) malloc(sizeof (Thread_table));
    tbl = interp->thread_table;

    tbl->size    = 8; /* arbitrarily */
    tbl->count   = 1;
    tbl->threads = (Thread_info*) malloc(sizeof (Thread_info) * tbl->size);
    TLS_KEY_INIT(tbl->tid_key);
    TLS_SET(tbl->tid_key, zero);

    tbl->threads[0].id    = THREAD_SELF();
    tbl->threads[0].state = 0;
    THREAD_STATE_SET(interp, 0, INITIALIZED);
    COND_INIT(tbl->threads[0].cvar);

    Parrot_threads_setup_signal_handler(interp);

    LOCK_INTERP(interp);
}

/*

=item C<void Parrot_threads_cleanup(PARROT_INTERP)>

Clean up the threads stuff in this interpreter.

=cut

*/

void
Parrot_threads_cleanup(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_cleanup)

    Thread_table *tbl = interp->thread_table;

    COND_DESTROY(tbl->threads[0].cvar);
    free(tbl->threads);
    TLS_KEY_FREE(tbl->tid_key);

    free(interp->thread_table);
}

/*

=item C<void* Parrot_threads_main(void *args_ptr)>

When an interpreter spawns a new worker thread, that thread starts
here.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
Parrot_threads_main(ARGMOD(void *args_ptr))
{
    ASSERT_ARGS(Parrot_threads_main)
    Thread_args *args = (Thread_args*) args_ptr;
    Interp    *interp = args->interp;
    INTVAL      *tidx = (INTVAL*) malloc(sizeof (INTVAL));
    Thread_table *tbl = interp->thread_table;
    free(args_ptr);

    Parrot_alarm_mask(interp);
    *tidx = args->idx;

    Parrot_threads_setup_signal_handler(interp);

    /* Yay stack scanning */
    LOCK(interp->thread_lock);
    tbl->threads[*tidx].lo_var_ptr = &tidx;
    UNLOCK(interp->thread_lock);

    TLS_SET(tbl->tid_key, tidx);

    Parrot_threads_outer_runloop(interp, *tidx);

    return 0;
}

/*

=item C<void Parrot_threads_outer_runloop(PARROT_INTERP, INTVAL tidx)>

This is the core loop performed by each active OS thread. If it's the
thread that needs to be running, it invokes the Scheduler to pick a
task.

=cut

*/

void
Parrot_threads_outer_runloop(PARROT_INTERP, INTVAL tidx)
{
    ASSERT_ARGS(Parrot_threads_outer_runloop)
    PMC* scheduler = interp->scheduler;
    Parrot_Scheduler_attributes *sched = PARROT_SCHEDULER(scheduler);
    INTVAL next_thread, task_count;

    for (;;) {
        LOCK_INTERP(interp);
        interp->current_runloop_level = 0;

        LOCK(interp->thread_lock);
        if (THREAD_STATE_TEST(interp, tidx, DEATH_MARK)) {
            UNLOCK(interp->thread_lock);
            UNLOCK_INTERP(interp);
            return;
        }
        UNLOCK(interp->thread_lock);

        /* Are we the best thread to be running right now? */
        next_thread = Parrot_threads_next_to_run(interp, tidx);
        task_count  = VTABLE_get_integer(interp, sched->task_queue);

        if (next_thread == tidx && task_count > 0) {
            Parrot_cx_next_task(interp, scheduler);
        }
        else {
            /* Wake up the main thread to check if we're done before
               going idle. */
            Parrot_alarm_now();
            Parrot_threads_idle(interp, tidx);
        }

        UNLOCK(interp->interp_lock);
    }
}

/*

=item C<void Parrot_threads_block(PARROT_INTERP, INTVAL *tidx)>

The current thread is about to block. Make sure there's another thread ready
to do work once we release the interpreter lock.

Use macros BLOCK_THREAD and UNBLOCK_THREAD rather than
calling this directly.

=cut

*/

void
Parrot_threads_block(PARROT_INTERP, ARGOUT(INTVAL *tidx))
{
    ASSERT_ARGS(Parrot_threads_block)
    Thread_table *tbl = interp->thread_table;
    int next, i, have_runnable;

    *tidx = Parrot_threads_current(interp);
    next  = Parrot_threads_next_to_run(interp, *tidx);

    LOCK(interp->thread_lock);

    /* While we're blocked, we might have PMCs on stack */
    tbl->threads[*tidx].hi_var_ptr = &next;
    THREAD_STATE_CLEAR(interp, *tidx, RUNNABLE);
    THREAD_STATE_SET(interp, *tidx, SCAN_STACK);

    /* Maybe spawn more threads */
    have_runnable = 0;
    for (i = 1; i < tbl->count; ++i) {
        if (THREAD_STATE_TEST(interp, i, RUNNABLE)) {
            have_runnable = 1;
            break;
        }
    }

    if (!have_runnable) {
        Parrot_threads_spawn(interp);
    }

    COND_SIGNAL(tbl->threads[*tidx].cvar);
    UNLOCK(interp->thread_lock);

    UNLOCK_INTERP(interp);
}

/*

=item C<void Parrot_threads_unblock(PARROT_INTERP, INTVAL *tidx_ptr)>

The current thread has completed a blocking operation.
It's going to have to wait for someone else to finish.

Use macros BLOCK_THREAD and UNBLOCK_THREAD rather than
calling this directly.

=cut

*/

void
Parrot_threads_unblock(PARROT_INTERP, ARGIN(INTVAL *tidx_ptr))
{
    ASSERT_ARGS(Parrot_threads_unblock)
    Thread_table *tbl;
    const INTVAL tidx = *tidx_ptr;

    /* We need to signal that we want the interpreter back. */
    Parrot_alarm_now();

    LOCK(interp->thread_lock);

    tbl = interp->thread_table;
    THREAD_STATE_SET(interp, tidx, RESTLESS);

    UNLOCK(interp->thread_lock);

    Parrot_threads_set_signal(interp);

    LOCK_INTERP(interp);
    THREAD_STATE_CLEAR(interp, tidx, SCAN_STACK);
    THREAD_STATE_CLEAR(interp, tidx, RESTLESS);
}

/*

=item C<INTVAL Parrot_threads_count_active(PARROT_INTERP)>

Scan the interpreter's thread table to find how many threads currently
have an active task.

=cut

*/

INTVAL
Parrot_threads_count_active(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_count_active)

    Thread_table *tbl = interp->thread_table;
    int i;
    INTVAL count = 0;

    /* An active thread will have its SCAN_STACK flag set */

    LOCK(interp->thread_lock);
    for (i = 1; i < tbl->count; ++i) {
        if (THREAD_STATE_TEST(interp, i, SCAN_STACK))
            ++count;
    }
    UNLOCK(interp->thread_lock);

    return count;
}

/*

=item C<void Parrot_threads_spawn(PARROT_INTERP)>

Someone needs another thread. Add one at the end of table.

Important: You must have interp->thread_lock before calling
    this function.

=cut

*/

void
Parrot_threads_spawn(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_spawn)
    Thread_table *tbl = interp->thread_table;
    INTVAL    new_idx = tbl->count;
    Thread_args *args = (Thread_args*) malloc(sizeof (Thread_args));


    tbl->count += 1;

    /* Maybe grow table */
    if (tbl->count > tbl->size) {
        tbl->size *= 2;
        tbl->threads = (Thread_info*) realloc(tbl, sizeof (Thread_info) * tbl->size);
    }

    args->interp = interp;
    args->idx    = new_idx;

    tbl->threads[new_idx].state = 0;
    THREAD_STATE_SET(interp, new_idx, INITIALIZED);
    THREAD_STATE_SET(interp, new_idx, RUNNABLE);
    COND_INIT(tbl->threads[new_idx].cvar);

    THREAD_CREATE_JOINABLE(tbl->threads[new_idx].id, Parrot_threads_main, args);
}

/*

=item C<void Parrot_threads_reap(PARROT_INTERP)>

Clean up any excess threads at the end of table.

Important: You must have the interpreter lock to call this function.

=cut

*/

void
Parrot_threads_reap(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_reap)
    Thread_table *tbl = interp->thread_table;
    INTVAL tidx = Parrot_threads_current(interp);
    int i;

    LOCK(interp->thread_lock);
    for (i = tbl->count - 1; i > tidx; --i) {
        void *rv;

        if (THREAD_STATE_TEST(interp, i, SCAN_STACK))
            break;

        if (THREAD_STATE_TEST(interp, i, RUNNABLE)) {
            THREAD_STATE_SET(interp, i, DEATH_MARK);
            THREAD_STATE_SET(interp, i, RESTLESS);

            COND_SIGNAL(tbl->threads[i].cvar);

            UNLOCK_INTERP(interp);
            UNLOCK(interp->thread_lock);

            JOIN(tbl->threads[i].id, rv);

            LOCK_INTERP(interp);
            LOCK(interp->thread_lock);

            tbl->threads[i].state = 0;
            COND_DESTROY(tbl->threads[i].cvar);

            tbl->count -= 1;
        }

    }

    if (i < (long)tbl->size / 3) {
        /* Shrink that table */
        tbl->size /= 2;
        tbl->threads = (Thread_info*) realloc(
            tbl->threads, sizeof (Thread_info) * tbl->size);
    }

    UNLOCK(interp->thread_lock);
}

/*

=item C<void Parrot_threads_idle(PARROT_INTERP, INTVAL tidx)>

Bored thread waits for work to do.

=cut

*/

void
Parrot_threads_idle(PARROT_INTERP, INTVAL tidx)
{
    ASSERT_ARGS(Parrot_threads_idle)
    Thread_table *tbl = interp->thread_table;
    THREAD_STATE_SET(interp, tidx, RUNNABLE);
    COND_WAIT(tbl->threads[tidx].cvar, interp->interp_lock);
}

/*

=item C<INTVAL Parrot_threads_check_and_reset(PARROT_INTERP)>

Sees if a thread signal has occured and, if so, resets the
signal flag.

=cut

*/

INTVAL
Parrot_threads_check_and_reset(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_check_and_reset)

    INTVAL flag;
    PARROT_ATOMIC_INT_GET(flag, interp->thread_signal);

    /* If we reset thread_signal unconditionally here
       then there would be a race and we could miss
       the flag being set. */
    if (flag) {
        PARROT_ATOMIC_INT_SET(interp->thread_signal, 0);
    }

    return flag;
}

/*

=item C<void Parrot_threads_set_signal(PARROT_INTERP)>

Set the thread signal, indicating that a thread reschedule
wants to occur.

=cut

*/

void
Parrot_threads_set_signal(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_set_signal)
    PARROT_ATOMIC_INT_SET(interp->thread_signal, 1);
}

/*

=item C<INTVAL Parrot_threads_current(PARROT_INTERP)>

Scan the table for the current thread index.

=cut

*/

INTVAL
Parrot_threads_current(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_current)
    Thread_table *tbl = interp->thread_table;
    INTVAL *tidp = (INTVAL*) TLS_GET(tbl->tid_key);
    return *tidp;
}

/*

=item C<INTVAL Parrot_threads_next_to_run(PARROT_INTERP, INTVAL cur_idx)>

Scan the thread table for the best thread to run now.

=cut

*/

INTVAL
Parrot_threads_next_to_run(PARROT_INTERP, INTVAL cur_idx)
{
    ASSERT_ARGS(Parrot_threads_next_to_run)

    Thread_table *tbl = interp->thread_table;
    int i;

    LOCK(interp->thread_lock);

    /* Pick threads to run to try to fill the thread table
       at the beginning, so we can shrink it at the end. */


    /* If there's a restless thread, run the last one. */
    for (i = tbl->count - 1; i > 0; --i) {
        if (THREAD_STATE_TEST(interp, i, RESTLESS)) {
            COND_SIGNAL(tbl->threads[i].cvar);
            UNLOCK(interp->thread_lock);
            return i;
        }
    }

    /* Otherwise there's a runnable thread, run the first one. */
    for (i = 1; i < tbl->count; ++i) {
        if (THREAD_STATE_TEST(interp, i, RUNNABLE)) {
            COND_SIGNAL(tbl->threads[i].cvar);
            UNLOCK(interp->thread_lock);
            return i;
        }
    }

    UNLOCK(interp->thread_lock);

    /* Otherwise, the current thread is fine. */
    return cur_idx;
}

/*

=item C<void Parrot_threads_print_table(PARROT_INTERP)>

Print the current thread table, which hopefully shows what's horribly
broken this time.

=cut

*/

void
Parrot_threads_print_table(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_print_table)
    Thread_table *tbl = interp->thread_table;
    INTVAL i;

    fprintf(stderr, " === Thread Info ===\n");
    fprintf(stderr, "Table count/size: %ld / %ld.\n", tbl->count, tbl->size);
    fprintf(stderr, "Current thread: %ld\n", Parrot_threads_current(interp));

    for (i = 0; i < tbl->count; ++i) {
        fprintf(stderr, " %ld\t", i);
        if (THREAD_STATE_TEST(interp, i, INITIALIZED))
            fprintf(stderr, "init ");
        if (THREAD_STATE_TEST(interp, i, RUNNABLE))
            fprintf(stderr, "runnable ");
        if (THREAD_STATE_TEST(interp, i, SCAN_STACK))
            fprintf(stderr, "scan_stack ");
        if (THREAD_STATE_TEST(interp, i, RESTLESS))
            fprintf(stderr, "restless ");
        fprintf(stderr, "\n");
    }
}

/*

=item C<void Parrot_threads_task_killed(PARROT_INTERP, INTVAL tidx)>

Send a signal to a thread notifying it that its active task has been killed.

=cut

*/

void
Parrot_threads_task_killed(PARROT_INTERP, INTVAL tidx)
{
    ASSERT_ARGS(Parrot_threads_task_killed)

    Thread_table *tbl = interp->thread_table;
    pthread_kill(tbl->threads[tidx].id, SIGUSR2);
}

/*

=item C<void Parrot_threads_task_killed_handler(int sig_number)>

Signal handler that does the stuff when the thing happens.

=cut

*/

void
Parrot_threads_task_killed_handler(SHIM(int sig_number))
{
    ASSERT_ARGS(Parrot_threads_task_killed_handler)

    /* interrupt_blocking_system_calls_from_a_comment(); */
}

/*

=item C<void Parrot_threads_setup_signal_handler(PARROT_INTERP)>

Prepare the current thread to handle a signal notifying it that its active
task has been killed.

=cut

*/

void
Parrot_threads_setup_signal_handler(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_setup_signal_handler)

    struct sigaction sa;
    memset(&sa, 0, sizeof (struct sigaction));
    sa.sa_handler = Parrot_threads_task_killed_handler;
    sa.sa_flags   = ~SA_RESTART;

    if (sigaction(SIGUSR2, &sa, 0) == -1) {
        perror("sigaction failed in Parrot_threads_setup-signal_handler");
        exit(EXIT_FAILURE);
    }
}

/*

=item C<void Parrot_check_if_task_killed(PARROT_INTERP)>

If the current task has been killed, longjmp back to the task
entry point.

=cut

*/

void
Parrot_check_if_task_killed(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_check_if_task_killed)

    PMC *current_task = Parrot_task_current(interp);
    Parrot_Task_attributes *const tdata = PARROT_TASK(current_task);

    if (tdata->killed) {
        longjmp(tdata->abort_jump, 1);
    }
}

/*

=item C<void Parrot_threads_gc_mark(PARROT_INTERP)>

Marks any PMCs in the thread table alive.

=cut

*/

void
Parrot_threads_gc_mark(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_gc_mark)
    Thread_table *tbl = interp->thread_table;
    INTVAL i;
    for (i = 0; i < tbl->count; ++i) {
        Parrot_gc_mark_PMC_alive(interp, tbl->threads[i].cur_task);
    }
}

/*

=back

=head1 SEE ALSO

L<include/parrot/threads.h>, L<src/scheduler.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
