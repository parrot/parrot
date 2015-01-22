/*
Copyright (C) 2011-2012, Parrot Foundation.

=head1 NAME

src/thread.c - Native threads, posix or Win32

=head1 DESCRIPTION

Threads are created by creating new C<ParrotInterpreter> objects.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/thread.h"
#include "parrot/atomic.h"
#include "parrot/alarm.h"
#include "parrot/runcore_api.h"
#include "pmc/pmc_scheduler.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_task.h"
#include "pmc/pmc_proxy.h"
#include "pmc/pmc_parrotinterpreter.h"

/* HEADERIZER HFILE: include/parrot/thread.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CAN_RETURN_NULL
static PMC * Parrot_thread_make_local_args_copy(PARROT_INTERP,
    ARGIN(Parrot_Interp source),
    ARGIN_NULLOK(PMC *args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static void* Parrot_thread_outer_runloop(ARGIN_NULLOK(void *arg));

#define ASSERT_ARGS_Parrot_thread_make_local_args_copy \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_Parrot_thread_outer_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

static Interp * threads_array[MAX_THREADS];
static int      num_threads = -1;

/*

=item C<PMC * Parrot_thread_create(PARROT_INTERP, INTVAL type, INTVAL
clone_flags)>

Create a new thread (i.e. Task), cloning the current interpreter.

The argument C<type> is currently ignored.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_thread_create(PARROT_INTERP, SHIM(INTVAL type), INTVAL clone_flags)
{
    ASSERT_ARGS(Parrot_thread_create)
    PMC    * const new_interp_pmc = Parrot_interp_clone(interp, clone_flags);
    Interp * const new_interp     = (Interp *)VTABLE_get_pointer(interp, new_interp_pmc);

    /* Parrot_pmc_new sets parent_interpreter which would confuse the GC */
    new_interp->parent_interpreter = NULL;
    new_interp->thread_data = mem_internal_allocate_zeroed_typed(Thread_data);
    MUTEX_INIT(new_interp->thread_data->interp_lock);
    new_interp->thread_data->tid = 0;
    new_interp->thread_data->main_interp = interp;
    Interp_flags_SET(new_interp, PARROT_IS_THREAD);

    new_interp->wake_up = 0;
    COND_INIT(new_interp->sleep_cond);
    MUTEX_INIT(new_interp->sleep_mutex);

    if (! interp->thread_data) { /* first time we go multi threaded */
        interp->thread_data = mem_internal_allocate_zeroed_typed(Thread_data);
        interp->thread_data->tid = 0;
        interp->thread_data->main_interp = interp;
        MUTEX_INIT(interp->thread_data->interp_lock);
    }

    return new_interp_pmc;
}

/*

=item C<int Parrot_thread_run(PARROT_INTERP, PMC *thread_interp_pmc, PMC *sub,
PMC *arg)>

Run a Parrot_thread

The C<sub> argument is currently unused.

=cut

*/

int
Parrot_thread_run(PARROT_INTERP, ARGMOD(PMC *thread_interp_pmc), SHIM(PMC *sub),
        ARGIN_NULLOK(PMC *arg))
{
    ASSERT_ARGS(Parrot_thread_run)
    Interp * const thread_interp = (Interp *)VTABLE_get_pointer(interp, thread_interp_pmc);

    /*SETATTR_ParrotInterpreter_sub(interp, thread_interp_pmc,
                                  Parrot_thread_transfer_sub(thread_interp, interp, sub)); */
    VTABLE_set_pmc(interp, thread_interp_pmc,
                   Parrot_thread_make_local_args_copy(thread_interp, interp, arg));
    thread_interp->thread_data->state = THREAD_STATE_JOINABLE;

    THREAD_CREATE_JOINABLE(thread_interp->thread_data->thread,
                              Parrot_thread_outer_runloop, thread_interp_pmc);

    return thread_interp->thread_data->tid;
}

/*

=item C<PMC* Parrot_thread_create_proxy(PARROT_INTERP, Parrot_Interp const
thread, PMC *pmc)>

Create a local proxy in the thread interp for the pmc belonging to interp

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_thread_create_proxy(PARROT_INTERP, ARGIN(Parrot_Interp const thread), ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_thread_create_proxy)
    if (PMC_IS_NULL(pmc))
        return pmc;

    if (pmc->vtable->base_type == enum_class_Sub) {
        return Parrot_thread_create_local_sub(interp, thread, pmc);
    }
    else {
        PMC * const proxy = Parrot_pmc_new_init(thread, enum_class_Proxy, pmc);
        PARROT_ASSERT(interp != thread);
        PARROT_PROXY(proxy)->interp = interp;
        return proxy;
    }
}

/*

=item C<PMC* Parrot_thread_create_local_sub(PARROT_INTERP, Parrot_Interp const
thread, PMC *pmc)>

Create a local sub in the thread interp for the pmc belonging to interp

=cut

*/
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_thread_create_local_sub(PARROT_INTERP, ARGIN(Parrot_Interp const thread), ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_thread_create_local_sub)

    PMC                   * const local_sub       = Parrot_clone(thread, pmc);
    Parrot_Sub_attributes * const local_sub_attrs = PARROT_SUB(local_sub);
    Parrot_Sub_attributes * const sub_attrs       = PARROT_SUB(pmc);

    PARROT_ASSERT(interp != thread);

    local_sub_attrs->namespace_name  = sub_attrs->namespace_name ?
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->namespace_name) : NULL;
    local_sub_attrs->namespace_stash =
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->namespace_stash);
    local_sub_attrs->multi_signature = sub_attrs->multi_signature ?
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->multi_signature) : NULL;
    local_sub_attrs->lex_info        = sub_attrs->lex_info ?
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->lex_info) : NULL;
    local_sub_attrs->outer_sub       = sub_attrs->outer_sub ?
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->outer_sub) : NULL;
    local_sub_attrs->ctx             = sub_attrs->ctx ?
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->ctx) : NULL;
    local_sub_attrs->outer_ctx       = sub_attrs->outer_ctx ?
        Parrot_thread_maybe_create_proxy(interp, thread, sub_attrs->outer_ctx) : NULL;

    PARROT_GC_WRITE_BARRIER(thread, local_sub);

    return local_sub;
}

/*

=item C<PMC* Parrot_thread_create_local_task(PARROT_INTERP, Parrot_Interp const
thread_interp, PMC *task)>

Create a copy of the task coming from interp local to thread.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_thread_create_local_task(PARROT_INTERP, ARGIN(Parrot_Interp const thread_interp),
        ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_thread_create_local_task)

    PMC                    * const local_task  = Parrot_pmc_new(thread_interp, enum_class_Task);
    Parrot_Task_attributes * const new_struct  = PARROT_TASK(local_task),
                           * const old_struct  = PARROT_TASK(task);
    PMC                    * const shared      = old_struct->shared;
    INTVAL                         i, elements = VTABLE_get_integer(interp, shared);

    if (old_struct->code->vtable->base_type == enum_class_Proxy) {
        new_struct->code = PARROT_PROXY(old_struct->code)->target;
        PARROT_ASSERT_INTERP(new_struct->code, interp);
    }
    else
        new_struct->code = Parrot_thread_create_local_sub(interp, thread_interp, old_struct->code);

    if (old_struct->data && ! PMC_IS_NULL(old_struct->data)) {
        new_struct->data =
            Parrot_thread_maybe_create_proxy(interp, thread_interp, old_struct->data);
    }

    new_struct->partner = task;

    PARROT_GC_WRITE_BARRIER(thread_interp, local_task);

    old_struct->partner = local_task;
    /* no write barrier needed, since partner is not GCed */

    for (i = 0; i < elements; i++) {
        PMC * const data  = VTABLE_get_pmc_keyed_int(interp, shared, i);
        VTABLE_push_pmc(thread_interp, new_struct->shared,
            Parrot_thread_maybe_create_proxy(interp, thread_interp, data));
    }

    /* put the task in a list for GC and for the main thread to know there's still active tasks */
    VTABLE_push_pmc(interp, PARROT_SCHEDULER(interp->scheduler)->foreign_tasks, task);

    return local_task;
}

/*

=item C<void Parrot_thread_schedule_task(PARROT_INTERP, Interp *thread_interp,
PMC *task)>

Schedule a task with the thread's scheduler.

=cut

*/

void
Parrot_thread_schedule_task(PARROT_INTERP, ARGIN(Interp *thread_interp), ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_thread_schedule_task)

    /* don't run GC from the wrong thread since GC involves stack walking and we
     * don't want the foreign GC to find our objects */
    Parrot_block_GC_mark_locked(thread_interp);

    VTABLE_push_pmc(thread_interp, thread_interp->scheduler,
        Parrot_thread_create_local_task(interp, thread_interp, task));
    Parrot_thread_notify_thread(thread_interp);

    Parrot_unblock_GC_mark_locked(thread_interp);
}

/*

=item C<static void* Parrot_thread_outer_runloop(void *arg)>

Run a Parrot_thread

=cut

*/

PARROT_CAN_RETURN_NULL
static void*
Parrot_thread_outer_runloop(ARGIN_NULLOK(void *arg))
{
    ASSERT_ARGS(Parrot_thread_outer_runloop)
    PMC * const   self    = (PMC*) arg;
    PMC          *ret_val = PMCNULL;
    Interp * const interp = PARROT_PARROTINTERPRETER(self)->interp;

    PMC * const scheduler = interp->scheduler;
    Parrot_Scheduler_attributes * const sched = PARROT_SCHEDULER(scheduler);
    INTVAL foreign_count, i;
    int lo_var_ptr;

    /* need to set it here because argument passing can trigger GC */
    interp->lo_var_ptr = &lo_var_ptr;

    do {
        while (VTABLE_get_integer(interp, scheduler) > 0) {
            /* there can be no active runloops at this point, so it should be save
             * to start counting at 0 again. This way the continuation in the next
             * task will find a runloop with id 1 when encountering an exception */
            interp->current_runloop_level = 0;
            reset_runloop_id_counter(interp);

            Parrot_cx_next_task(interp, scheduler);

            foreign_count = VTABLE_get_integer(interp, sched->foreign_tasks);
            for (i = 0; i < foreign_count; i++) {
                PMC * const task = VTABLE_get_pmc_keyed_int(interp, sched->foreign_tasks, i);
                LOCK(PARROT_TASK(task)->waiters_lock);
                if (PARROT_TASK(task)->killed) {
                    VTABLE_delete_keyed_int(interp, sched->foreign_tasks, i);
                    i--;
                    foreign_count--;
                }
                UNLOCK(PARROT_TASK(task)->waiters_lock);
            }

            /* add expired alarms to the task queue */
            Parrot_cx_check_alarms(interp, interp->scheduler);
        }

        /* Nothing to do except to wait for the next alarm to expire */
        Parrot_thread_wait_for_notification(interp);
        Parrot_cx_check_alarms(interp, interp->scheduler);
    } while (1);

    return ret_val;
}

/*

=item C<void Parrot_thread_wait_for_notification(PARROT_INTERP)>

Sleep till notified by another thread or a signal.

=cut

*/

void
Parrot_thread_wait_for_notification(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_thread_wait_for_notification)

#ifdef PARROT_HAS_THREADS
    LOCK(interp->sleep_mutex);
    while (interp->wake_up == 0)
        COND_WAIT(interp->sleep_cond, interp->sleep_mutex);
    interp->wake_up = 0;
    UNLOCK(interp->sleep_mutex);
#else
    Parrot_alarm_wait_for_next_alarm(interp);
#endif
}

/*

=item C<void Parrot_thread_notify_thread(PARROT_INTERP)>

Poke the thread in case it's sleeping (waiting for a new task)

=cut

*/

void
Parrot_thread_notify_thread(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_thread_notify_thread)
    LOCK(interp->sleep_mutex);
    interp->wake_up = 1;
    COND_SIGNAL(interp->sleep_cond);
    UNLOCK(interp->sleep_mutex);
}

/*

=item C<void Parrot_thread_notify_threads(PARROT_INTERP)>

Give all threads a chance to check their alarms.

=cut

*/

void
Parrot_thread_notify_threads(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_thread_notify_threads)
    int i;
    Interp ** const tarray = Parrot_thread_get_threads_array(NULL);

    for (i = 0; i < num_threads; i++) {
        if (tarray[i])
            Parrot_thread_notify_thread(tarray[i]);
    }
}



/*

=back

=head2 Helper functions used also for running plain interpreters

=over 4

=item C<void Parrot_clone_code(Parrot_Interp d, Parrot_Interp s)>

Copies/clones the packfile/code from interpreter C<s> to C<d>. All
resources are created in C<d>.

=cut

*/


void
Parrot_clone_code(Parrot_Interp d, Parrot_Interp s)
{
    ASSERT_ARGS(Parrot_clone_code)
    Parrot_block_GC_mark(d);
    Interp_flags_SET(d, PARROT_EXTERN_CODE_FLAG);
    d->code = NULL;
    Parrot_pf_switch_to_cs(d, s->code, 1);
    Parrot_unblock_GC_mark(d);
}

/*

=item C<PMC * Parrot_thread_transfer_sub(Parrot_Interp destination,
Parrot_Interp source, PMC *sub)>

Clones the sub so that it's suitable for the other interpreter.

=cut

*/

PARROT_CAN_RETURN_NULL
PMC *
Parrot_thread_transfer_sub(ARGOUT(Parrot_Interp destination),
                           ARGIN(Parrot_Interp source), ARGIN(PMC *sub))
{
    ASSERT_ARGS(Parrot_thread_transfer_sub)

    Parrot_io_eprintf(source, "copying over subroutine [%Ss]\n",
        Parrot_sub_full_sub_name(source, sub));

    return Parrot_thread_make_local_copy(destination, source, sub);
}

/*

=item C<PMC * Parrot_thread_make_local_copy(PARROT_INTERP, Parrot_Interp from,
PMC *arg)>

Creates a local copy of the PMC. This includes workarounds for Parrot_clone()
not doing the Right Thing with subroutines (specifically, code segments aren't
preserved and it is difficult to do so as long as Parrot_clone() depends on
freezing).

=cut

*/

PARROT_CAN_RETURN_NULL
PMC *
Parrot_thread_make_local_copy(PARROT_INTERP, ARGIN(Parrot_Interp from), ARGIN(PMC *arg))
{
    ASSERT_ARGS(Parrot_thread_make_local_copy)
    PMC            *ret_val;
    STRING * const  _sub       = interp->vtables[enum_class_Sub]->whoami;
    STRING * const  _multi_sub = interp->vtables[enum_class_MultiSub]->whoami;

    if (PMC_IS_NULL(arg))
        ret_val = PMCNULL;
    else if (VTABLE_isa(from, arg, _multi_sub)) {
        INTVAL i = 0;
        const INTVAL n = VTABLE_elements(from, arg);
        ret_val  = Parrot_pmc_new(interp, enum_class_MultiSub);

        for (i = 0; i < n; ++i) {
            PMC *const orig = VTABLE_get_pmc_keyed_int(from, arg, i);
            PMC *const copy = Parrot_thread_make_local_copy(interp, from, orig);
            VTABLE_push_pmc(interp, ret_val, copy);
        }
    }
    else if (VTABLE_isa(from, arg, _sub)) {
        /* this is a workaround for cloning subroutines not actually
         * working as one might expect mainly because the segment is
         * not correctly copied
         */
        Parrot_Sub_attributes *ret_val_sub, *arg_sub;
        ret_val = Parrot_clone(interp, arg);

        PMC_get_sub(interp, ret_val, ret_val_sub);
        PMC_get_sub(interp, arg, arg_sub);
        ret_val_sub->seg = arg_sub->seg;
        /* Skip vtable overrides and methods. */
        if (ret_val_sub->vtable_index == -1
                && !(ret_val_sub->comp_flags & SUB_COMP_FLAG_METHOD)) {
            Parrot_ns_store_sub(interp, ret_val);
        }
    }
    else
        ret_val = Parrot_clone(interp, arg);
    return ret_val;
}

/*

=item C<static PMC * Parrot_thread_make_local_args_copy(PARROT_INTERP,
Parrot_Interp source, PMC *args)>

Make a local copy of the corresponding array of arguments.

=cut

*/

PARROT_CAN_RETURN_NULL
static PMC *
Parrot_thread_make_local_args_copy(PARROT_INTERP, ARGIN(Parrot_Interp source),
                                   ARGIN_NULLOK(PMC *args))
{
    ASSERT_ARGS(Parrot_thread_make_local_args_copy)
    INTVAL i;

    if (PMC_IS_NULL(args))
        return PMCNULL;
    else {
        const INTVAL old_size = VTABLE_get_integer(source, args);

        /* XXX should this be a different type? */
        PMC * const ret_val = Parrot_pmc_new(interp, enum_class_FixedPMCArray);
        VTABLE_set_integer_native(interp, ret_val, old_size);

        for (i = 0; i < old_size; ++i) {
            PMC * const copy = Parrot_thread_make_local_copy(interp, source,
                    VTABLE_get_pmc_keyed_int(source, args, i));

            VTABLE_set_pmc_keyed_int(interp, ret_val, i, copy);
        }

        return ret_val;
    }
}

/*

=item C<Interp** Parrot_thread_get_threads_array(PARROT_INTERP)>

Returns the threads array.

=cut

*/

PARROT_CANNOT_RETURN_NULL
Interp**
Parrot_thread_get_threads_array(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_thread_get_threads_array)
    return threads_array;
}

/*

=item C<void Parrot_thread_init_threads_array(PARROT_INTERP)>

Initialize the threads array.

=cut

*/

void
Parrot_thread_init_threads_array(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_thread_init_threads_array)

    int i;
    int nprocs;

    if (num_threads > 1) {   /* cmdline or API override */
        nprocs = num_threads;
    }
    else {                   /* or a useful default */
        nprocs = Parrot_get_num_cpus(interp);
        if (nprocs < 0 || nprocs > MAX_THREADS)
            nprocs = MAX_THREADS;
        else if (nprocs < 3)  /* need at least 2 threads, one for sleep */
            nprocs = 4;
        num_threads = nprocs;
    }

    for (i = 0; i < nprocs; i++)
        threads_array[i] = NULL;
}

/*

=item C<int Parrot_thread_get_free_threads_array_index(PARROT_INTERP)>

Returns an index of a free slot in the threads_array.
Returns -1 if no slot is available.

=cut

*/

int
Parrot_thread_get_free_threads_array_index(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_thread_get_free_threads_array_index)

    int i = 0;
    for (; i < num_threads; i++)
        if (threads_array[i] == NULL)
            return i;
    return -1;
}

/*

=item C<void Parrot_thread_insert_thread(PARROT_INTERP, Interp* thread, int
index)>

Insert the given thread into the threads_array at index i.

=cut

*/

void
Parrot_thread_insert_thread(SHIM_INTERP, ARGIN(Interp* thread), int index)
{
    ASSERT_ARGS(Parrot_thread_insert_thread)

    threads_array[index] = thread;
}


/*

=item C<int Parrot_set_num_threads(PARROT_INTERP, INTVAL number_of_threads)>

Overrides the default number of allocated threads, which defaults to
the number of online CPUs.

This function must be called before C<Parrot_thread_init_threads_array()>;

It returns the actual number of num_threads, which might -1 be if
numthreads is invalid, e.g. it exceeds the hard-coded constant
MAX_THREADS (16), or if Parrot_set_num_threads() was called too late
and threads were already initialized.

=cut

*/

int
Parrot_set_num_threads(SHIM_INTERP, INTVAL number_of_threads)
{
    ASSERT_ARGS(Parrot_set_num_threads)

    /* Ensure that threads are not already initialized */
    if (num_threads < 0 && number_of_threads > 1 && number_of_threads <= MAX_THREADS)
        num_threads = number_of_threads;
    return num_threads;
}


/*

=item C<int Parrot_get_num_threads(PARROT_INTERP)>

It returns the number of allocated C<num_threads>,
not the number of active threads and not the number
of maximum possible threads.

A return value of -1 means that threads were
not yet initialized.

=cut

*/

int
Parrot_get_num_threads(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_get_num_threads)

    return num_threads;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/thread.h>

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
