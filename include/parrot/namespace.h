/* namespace.h
 *  Copyright (C) 2004-2010, Parrot Foundation.
 *  Overview:
 *      Contains accessor functions for globals
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_GLOBAL_H_GUARD
#define PARROT_GLOBAL_H_GUARD

/* HEADERIZER BEGIN: src/namespace.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_find_current_namespace_global(PARROT_INTERP,
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_find_global_from_op(PARROT_INTERP,
    ARGIN(PMC *ns),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(void *next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_find_named_item(PARROT_INTERP,
    ARGIN(STRING *name),
    ARGIN(void *next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_find_namespace_global(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_get_global(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_ns_get_name(PARROT_INTERP, ARGIN(PMC *_namespace))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_get_namespace_keyed(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN(PMC *pmc_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_get_namespace_keyed_str(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN_NULLOK(STRING *str_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_make_namespace_autobase(PARROT_INTERP, ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_make_namespace_keyed(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN(PMC *pmc_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ns_make_namespace_keyed_str(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN(STRING *str_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_ns_set_global(PARROT_INTERP,
    ARGIN(PMC *ns),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_ns_store_global(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_ns_store_sub(PARROT_INTERP, ARGIN(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_ns_find_current_namespace_global \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_ns_find_global_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ns))
#define ASSERT_ARGS_Parrot_ns_find_named_item __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(next_unused))
#define ASSERT_ARGS_Parrot_ns_find_namespace_global \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_ns_get_global __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_ns_get_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(_namespace))
#define ASSERT_ARGS_Parrot_ns_get_namespace_keyed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_ns) \
    , PARROT_ASSERT_ARG(pmc_key))
#define ASSERT_ARGS_Parrot_ns_get_namespace_keyed_str \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_ns))
#define ASSERT_ARGS_Parrot_ns_make_namespace_autobase \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_ns_make_namespace_keyed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_ns) \
    , PARROT_ASSERT_ARG(pmc_key))
#define ASSERT_ARGS_Parrot_ns_make_namespace_keyed_str \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_ns) \
    , PARROT_ASSERT_ARG(str_key))
#define ASSERT_ARGS_Parrot_ns_set_global __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ns))
#define ASSERT_ARGS_Parrot_ns_store_global __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_ns_store_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/namespace.c */

#endif /* PARROT_GLOBAL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

