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
    if (PMC_IS_NULL(nci_funcs))
        PANIC(interp, "iglobals.nci_funcs isn't created_yet");

    thunk = VTABLE_get_pmc_keyed_str(interp, nci_funcs, signature);

    if (!PMC_IS_NULL(thunk)) {
        PARROT_ASSERT(thunk->vtable);
        PARROT_ASSERT(thunk->vtable->base_type == enum_class_UnManagedStruct);
        return F2DPTR(VTABLE_get_pointer(interp, thunk));
    }

    Parrot_ex_throw_from_c_args(interp, NULL,
        EXCEPTION_UNIMPLEMENTED,
        "No NCI thunk available for signature '%S'", signature);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
