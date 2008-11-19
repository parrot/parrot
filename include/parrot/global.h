/* global.h
 *  Copyright (C) 2004, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *      Contains accessor functions for globals
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_GLOBAL_H_GUARD
#define PARROT_GLOBAL_H_GUARD

/* HEADERIZER BEGIN: src/global.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_cur(PARROT_INTERP,
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_k(PARROT_INTERP,
    ARGIN_NULLOK(PMC *pmc_key),
    ARGIN(STRING *globalname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_n(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_find_global_op(PARROT_INTERP,
    ARGIN(PMC *ns),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(void *next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_s(PARROT_INTERP,
    ARGIN_NULLOK(STRING *str_key),
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_name_op(PARROT_INTERP,
    ARGIN(STRING *name),
    SHIM(void *next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_global(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_namespace_autobase(PARROT_INTERP, ARGIN_NULLOK(PMC *key))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_namespace_keyed(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN_NULLOK(PMC *pmc_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_namespace_keyed_str(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN_NULLOK(STRING *str_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_make_namespace_autobase(PARROT_INTERP, ARGIN_NULLOK(PMC *key))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_make_namespace_keyed(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN_NULLOK(PMC *pmc_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_make_namespace_keyed_str(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN_NULLOK(STRING *str_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_ns_get_name(PARROT_INTERP, ARGIN(PMC *_namespace))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_set_global(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_store_global_cur(PARROT_INTERP,
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_store_global_k(PARROT_INTERP,
    ARGIN(PMC *pmc_key),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_store_global_n(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ns),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_store_global_s(PARROT_INTERP,
    ARGIN_NULLOK(STRING *str_key),
    ARGIN_NULLOK(STRING *globalname),
    ARGIN_NULLOK(PMC *val))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_store_sub_in_namespace(PARROT_INTERP, ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/global.c */

#endif /* PARROT_GLOBAL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

