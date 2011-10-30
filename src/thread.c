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

#define ASSERT_ARGS_Parrot_thread_make_local_args_copy \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_Parrot_thread_make_local_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(from) \
    , PARROT_ASSERT_ARG(arg))
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

    SETATTR_ParrotInterpreter_sub(interp, thread_interp_pmc,
                                  Parrot_thread_transfer_sub(thread_interp, interp, sub));
    VTABLE_set_pmc(interp, thread_interp_pmc,
                   Parrot_thread_make_local_args_copy(thread_interp, interp, arg));
    /* thread_interp->thread_data->state = THREAD_STATE_JOINABLE; */

    /* THREAD_CREATE_JOINABLE(thread_interp->thread_data->thread,
                              thread_func, thread_interp_pmc); */

    /* return thread_interp->thread_data->tid; */
    return 0;
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
