/* nci.c
Copyright (C) 2001-2009, Parrot Foundation.

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
    INTVAL  hv;

    if (PMC_IS_NULL(iglobals))
        PANIC(interp, "iglobals isn't created yet");

    nci_funcs = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS);
    if (PMC_IS_NULL(nci_funcs))
        PANIC(interp, "iglobals.nci_funcs isn't created_yet");

    thunk = VTABLE_get_pmc_keyed(interp, nci_funcs, sig);

    if (PMC_IS_NULL(thunk)) {
        /* try to dynamically build a thunk */
        PMC *nci_fb_cb = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FB_CB);
        if (!PMC_IS_NULL(nci_fb_cb)) {
            void *cb_ptr = VTABLE_get_pointer(interp, nci_fb_cb);
            nci_fb_func_t cb = (nci_fb_func_t)D2FPTR(cb_ptr);
            if (cb_ptr) {
                PMC *nci_fb_ud = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FB_UD);
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
        "No NCI thunk available for signature '%Ss'", VTABLE_get_repr(interp, sig));
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
