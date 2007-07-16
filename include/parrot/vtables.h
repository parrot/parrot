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

PARROT_API
PARROT_MALLOC
VTABLE * Parrot_clone_vtable( SHIM_INTERP,
    NOTNULL(const VTABLE *base_vtable) )
        __attribute__nonnull__(2);

PARROT_API
void Parrot_destroy_vtable( SHIM_INTERP, NULLOK(VTABLE *vtable) );

PARROT_API
PARROT_MALLOC
VTABLE * Parrot_new_vtable( SHIM_INTERP );

void parrot_alloc_vtables( PARROT_INTERP )
        __attribute__nonnull__(1);

void parrot_free_vtables( PARROT_INTERP )
        __attribute__nonnull__(1);

void parrot_realloc_vtables( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/vtables.c */

#endif /* PARROT_VTABLES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
