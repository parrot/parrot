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

PARROT_API VTABLE * Parrot_clone_vtable( Interp *interp,
    const VTABLE *base_vtable /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__malloc__
        __attribute__warn_unused_result__;

PARROT_API void Parrot_destroy_vtable( Interp *interp,
    VTABLE *vtable /*NULLOK*/ );

PARROT_API VTABLE * Parrot_new_vtable( Interp *interp )
        __attribute__malloc__
        __attribute__warn_unused_result__;

void parrot_alloc_vtables( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void parrot_free_vtables( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void parrot_realloc_vtables( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/vtables.c */

#endif /* PARROT_VTABLES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
