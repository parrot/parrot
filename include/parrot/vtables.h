/* vtables.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
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
VTABLE * Parrot_vtbl_clone_vtable(PARROT_INTERP,
    ARGIN(const VTABLE *base_vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_vtbl_destroy_vtable(PARROT_INTERP,
    ARGFREE_NOTNULL(VTABLE *vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_vtbl_initialize_core_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
VTABLE * Parrot_vtbl_new_vtable(PARROT_INTERP);

void Parrot_vtbl_alloc_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_vtbl_free_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_vtbl_mark_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_vtbl_realloc_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_vtbl_clone_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_vtable))
#define ASSERT_ARGS_Parrot_vtbl_destroy_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_vtbl_initialize_core_vtables \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_vtbl_new_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_vtbl_alloc_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_vtbl_free_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_vtbl_mark_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_vtbl_realloc_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/vtables.c */

#endif /* PARROT_VTABLES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
