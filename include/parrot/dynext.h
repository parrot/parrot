/*
 * Copyright (C) 2003-2010, Parrot Foundation.
 */

/* dynext.h
*
* $Id$
*
*   Parrot dynamic extensions
*/

#ifndef PARROT_DYNEXT_H_GUARD
#define PARROT_DYNEXT_H_GUARD

typedef PMC *(*dynext_load_func)(PARROT_INTERP);
typedef void (*dynext_init_func)(PARROT_INTERP, ARGIN_NULLOK(PMC *));

/* HEADERIZER BEGIN: src/dynext.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_clone_lib_into(
    ARGMOD(Interp *d),
    ARGMOD(Interp *s),
    ARGIN(PMC *lib_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*d)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_init_lib(PARROT_INTERP,
    NOTNULL(dynext_load_func load_func),
    NOTNULL(dynext_init_func init_func))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_load_lib(PARROT_INTERP,
    ARGIN_NULLOK(STRING *lib),
    ARGIN_NULLOK(PMC *parameters))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_clone_lib_into __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(d) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(lib_pmc))
#define ASSERT_ARGS_Parrot_init_lib __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(load_func) \
    , PARROT_ASSERT_ARG(init_func))
#define ASSERT_ARGS_Parrot_load_lib __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/dynext.c */

#endif /* PARROT_DYNEXT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
