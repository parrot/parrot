/* nci.c
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Native Call Interface routines. The code needed to build a
 *     parrot to C call frame is in here
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/nci.h"
#include "api.str"

/* HEADERIZER HFILE: include/parrot/nci.h */
/* HEADERIZER STOP */

static void
init_nci_funcs(PARROT_INTERP) {
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_NCI_FUNCS,
        Parrot_pmc_new(interp, enum_class_Hash));
    Parrot_nci_load_core_thunks(interp);
    Parrot_nci_load_extra_thunks(interp);
}

/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */

void *
build_call_func(PARROT_INTERP, SHIM(PMC *pmc_nci), NOTNULL(STRING *signature), SHIM(int *jitted)) {
    PMC *iglobals;
    PMC *nci_funcs;
    PMC *thunk;

    /* fixup empty signatures */
    if (STRING_IS_EMPTY(signature))
        signature = CONST_STRING(interp, "v");

    iglobals = interp->iglobals;
    if (PMC_IS_NULL(iglobals))
        PANIC(interp, "iglobals isn't created yet");

    nci_funcs = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS);
    if (PMC_IS_NULL(nci_funcs)) {
        init_nci_funcs(interp);
        nci_funcs = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS);
    }

    thunk = VTABLE_get_pmc_keyed_str(interp, nci_funcs, signature);

    PARROT_ASSERT(PMC_IS_NULL(thunk) || thunk->vtable);

    if ((!PMC_IS_NULL(thunk)) && thunk->vtable->base_type == enum_class_UnManagedStruct)
        return F2DPTR(VTABLE_get_pointer(interp, thunk));

    /*
      These lines have been added to aid debugging. I want to be able to
      see which signature has an unknown type. I am sure someone can come up
      with a neater way to do this.
     */
    {
        STRING *ns = CONST_STRING(interp, " is an unknown signature type");
        STRING *message = Parrot_str_concat(interp, signature, ns, 0);

        ns = CONST_STRING(interp, ".\nCAN_BUILD_CALL_FRAMES is disabled, add the signature to src/nci/extra_thunks.nci");
        message = Parrot_str_concat(interp, message, ns, 0);

        /*
         * I think there may be memory issues with this but if we get to here we are
         * aborting.
         */
        PANIC(interp, Parrot_str_to_cstring(interp, message));
    }
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
