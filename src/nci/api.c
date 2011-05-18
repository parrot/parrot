/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/nci/api.c - Native Call Interface routines

=head1 DESCRIPTION

This file implements the interface to the Parrot Native Call Interface system,
which builds parrot to C call frames.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/nci.h"
#include "api.str"

/* HEADERIZER HFILE: include/parrot/nci.h */

/*

=item C<PMC * build_call_func(PARROT_INTERP, PMC *sig)>

This function serves a single purpose. It takes the function signature for a
C function we want to call and returns a PMC with a pointer to a function
that can call it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
build_call_func(PARROT_INTERP, ARGIN(PMC *sig))
{
    ASSERT_ARGS(build_call_func)

    PMC    * const iglobals = interp->iglobals;
    PMC    *nci_funcs;
    PMC    *thunk;

    if (PMC_IS_NULL(iglobals))
        PANIC(interp, "iglobals isn't created yet");

    nci_funcs = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS);
    if (PMC_IS_NULL(nci_funcs))
        PANIC(interp, "iglobals.nci_funcs isn't created_yet");

    /* signatures are FIA internally */
    if (sig->vtable->base_type != enum_class_FixedIntegerArray) {
        size_t  i;
        size_t  n       = VTABLE_elements(interp, sig);
        PMC    *new_sig = Parrot_pmc_new_init_int(interp, enum_class_FixedIntegerArray, n);
        for (i = 0; i < n; i++)
            VTABLE_set_integer_keyed_int(interp, new_sig, i,
                                            VTABLE_get_integer_keyed_int(interp, sig, i));
        sig = new_sig;
    }

    thunk = VTABLE_get_pmc_keyed(interp, nci_funcs, sig);

    if (PMC_IS_NULL(thunk)) {
        /* try to dynamically build a thunk */
        PMC * const nci_fb_cb = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FB_CB);
        if (!PMC_IS_NULL(nci_fb_cb)) {
            void * const cb_ptr = VTABLE_get_pointer(interp, nci_fb_cb);
            const nci_fb_func_t cb = (nci_fb_func_t)D2FPTR(cb_ptr);
            if (cb_ptr) {
                PMC * const nci_fb_ud =
                    VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FB_UD);
                thunk = cb(interp, nci_fb_ud, sig);
            }
        }
    }

    if (!PMC_IS_NULL(thunk)) {
        PARROT_ASSERT(thunk->vtable);
        return thunk;
    }

    Parrot_ex_throw_from_c_args(interp, NULL,
        EXCEPTION_UNIMPLEMENTED,
        "No NCI thunk available for signature `%Ss'", Parrot_nci_describe_sig(interp, sig));
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
