/* vtables.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Vtable manipulation code. Not to be confused with vtable.h
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_VTABLES_H_GUARD
#define PARROT_VTABLES_H_GUARD


/* HEADERIZER BEGIN: src/vtables.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
VTABLE * Parrot_clone_vtable(PARROT_INTERP,
    ARGIN(const VTABLE *base_vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_destroy_vtable(PARROT_INTERP, ARGMOD(VTABLE *vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*vtable);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
VTABLE * Parrot_new_vtable(SHIM_INTERP);

void mark_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

void parrot_alloc_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

void parrot_free_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

void parrot_realloc_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/vtables.c */

#endif /* PARROT_VTABLES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
