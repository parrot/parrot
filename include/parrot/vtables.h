/* vtables.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Vtable manipulation code. Not to be confused with vtable.h
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
void Parrot_destroy_vtable(PARROT_INTERP, ARGFREE_NOTNULL(VTABLE *vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_initialize_core_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

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

#define ASSERT_ARGS_Parrot_clone_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_vtable))
#define ASSERT_ARGS_Parrot_destroy_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_initialize_core_vtables \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_new_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_mark_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_alloc_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_free_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_realloc_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/vtables.c */

#endif /* PARROT_VTABLES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
