/*
Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/thread.c - Thread handling stuff

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
#include "parrot/runcore_api.h"
#include "pmc/pmc_scheduler.h"
#include "pmc/pmc_sub.h"
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
static PMC * Parrot_thread_make_local_copy(PARROT_INTERP,
    ARGIN(Parrot_Interp from),
    ARGIN(PMC *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
static void* Parrot_thread_outer_runloop(ARGIN_NULLOK(void *arg));

#define ASSERT_ARGS_Parrot_thread_make_local_args_copy \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_Parrot_thread_make_local_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(from) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_Parrot_thread_outer_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<PMC * Parrot_thread_create(PARROT_INTERP, INTVAL type, INTVAL
clone_flags)>

Create a new thread, cloning the current interpreter

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_thread_create(PARROT_INTERP, INTVAL type, INTVAL clone_flags)
{
    ASSERT_ARGS(Parrot_thread_create)
    PMC    * const new_interp_pmc = pmc_new(interp, type);
    Interp * const new_interp     = (Interp *)VTABLE_get_pointer(interp, new_interp_pmc);

    clone_interpreter(new_interp, interp, clone_flags);
    new_interp->thread_data = mem_internal_allocate_zeroed_typed(Thread_data);
    new_interp->thread_data->tid = 0;
    PARROT_GC_WRITE_BARRIER(interp, new_interp);

    return new_interp_pmc;
}

/*

=item C<int Parrot_thread_run(PARROT_INTERP, PMC *thread_interp_pmc, PMC *sub,
PMC *arg)>

Run a Parrot_thread

=cut

*/

int
Parrot_thread_run(PARROT_INTERP, ARGMOD(PMC *thread_interp_pmc), ARGIN(PMC *sub),
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

=item C<void Parrot_thread_schedule_task(PARROT_INTERP, PMC *thread, PMC *task)>

Schedule a task with the thread's scheduler.

=cut

*/

void
Parrot_thread_schedule_task(PARROT_INTERP, ARGIN(PMC *thread), ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_thread_schedule_task)
    PMC * const   self                        = (PMC*) thread;
    Parrot_Interp thread_interp               =
       (Parrot_Interp)((Parrot_ParrotInterpreter_attributes *)PMC_data(self))->interp;
    PMC * const scheduler                     = thread_interp->scheduler;
    Parrot_Scheduler_attributes * const sched = PARROT_SCHEDULER(thread_interp->scheduler);

    VTABLE_push_pmc(thread_interp, sched->task_queue, task);
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
    PMC * const      self    = (PMC*) arg;
    PMC             *ret_val = PMCNULL;
    Parrot_Interp    interp  =
       (Parrot_Interp)((Parrot_ParrotInterpreter_attributes *)PMC_data(self))->interp;

    PMC * const scheduler = interp->scheduler;
    Parrot_Scheduler_attributes * const sched = PARROT_SCHEDULER(scheduler);
    INTVAL alarm_count;

    /* need to set it here because argument passing can trigger GC */
    /* interp->lo_var_ptr = &lo_var_ptr; */

    while (VTABLE_get_integer(interp, sched->task_queue) > 0) {
        /* there can be no active runloops at this point, so it should be save
         * to start counting at 0 again. This way the continuation in the next
         * task will find a runloop with id 1 when encountering an exception */
        interp->current_runloop_level = 0;
        reset_runloop_id_counter(interp);

        Parrot_cx_next_task(interp, scheduler);
    }

    return ret_val;
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
    Parrot_switch_to_cs(d, s->code, 1);
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

=item C<static PMC * Parrot_thread_make_local_copy(PARROT_INTERP, Parrot_Interp
from, PMC *arg)>

Creates a local copy of the PMC. This includes workarounds for Parrot_clone()
not doing the Right Thing with subroutines (specifically, code segments aren't
preserved and it is difficult to do so as long as Parrot_clone() depends on
freezing).

=cut

*/

PARROT_CAN_RETURN_NULL
static PMC *
Parrot_thread_make_local_copy(PARROT_INTERP, ARGIN(Parrot_Interp from), ARGIN(PMC *arg))
{
    ASSERT_ARGS(Parrot_thread_make_local_copy)
    PMC            *ret_val;
    STRING * const  _sub       = interp->vtables[enum_class_Sub]->whoami;
    STRING * const  _multi_sub = interp->vtables[enum_class_MultiSub]->whoami;

    if (PMC_IS_NULL(arg)) {
        ret_val = PMCNULL;
    }
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

        ret_val               = Parrot_clone(interp, arg);
        PMC_get_sub(interp, ret_val, ret_val_sub);
        PMC_get_sub(interp, arg,     arg_sub);
        ret_val_sub->seg = arg_sub->seg;
        /* Skip vtable overrides and methods. */
        if (ret_val_sub->vtable_index == -1
                && !(ret_val_sub->comp_flags & SUB_COMP_FLAG_METHOD)) {
            Parrot_ns_store_sub(interp, ret_val);
        }
    }
    else {
        ret_val = Parrot_clone(interp, arg);
    }
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
    PMC   *ret_val;
    INTVAL old_size;
    INTVAL i;

    if (PMC_IS_NULL(args))
        return PMCNULL;

    old_size = VTABLE_get_integer(source, args);

    /* XXX should this be a different type? */
    ret_val = Parrot_pmc_new(interp, enum_class_FixedPMCArray);
    VTABLE_set_integer_native(interp, ret_val, old_size);

    for (i = 0; i < old_size; ++i) {
        PMC * const copy = Parrot_thread_make_local_copy(interp, source,
                VTABLE_get_pmc_keyed_int(source, args, i));

        VTABLE_set_pmc_keyed_int(interp, ret_val, i, copy);
    }

    return ret_val;
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
