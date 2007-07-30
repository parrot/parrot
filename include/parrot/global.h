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

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_cur( PARROT_INTERP, NULLOK(STRING *globalname) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_k( PARROT_INTERP,
    NULLOK(PMC *pmc_key),
    NOTNULL(STRING *globalname) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_n( PARROT_INTERP,
    NULLOK(PMC *ns),
    NULLOK(STRING *globalname) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_find_global_op( PARROT_INTERP,
    NOTNULL(PMC *ns),
    NOTNULL(STRING *globalname),
    NULLOK(void *next) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_s( PARROT_INTERP,
    NULLOK(STRING *str_key),
    NULLOK(STRING *globalname) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_name_op( PARROT_INTERP,
    NOTNULL(STRING *name),
    SHIM(void *next) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_global( PARROT_INTERP,
    NULLOK(PMC *ns),
    NULLOK(STRING *globalname) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_namespace_autobase( PARROT_INTERP, NULLOK(PMC *key) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_namespace_keyed( PARROT_INTERP,
    NOTNULL(PMC *base_ns),
    NULLOK(PMC *pmc_key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_get_namespace_keyed_str( PARROT_INTERP,
    NOTNULL(PMC *base_ns),
    NULLOK(STRING *str_key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_make_namespace_autobase( PARROT_INTERP, NULLOK(PMC *key) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_make_namespace_keyed( PARROT_INTERP,
    NOTNULL(PMC *base_ns),
    NULLOK(PMC *pmc_key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_make_namespace_keyed_str( PARROT_INTERP,
    NOTNULL(PMC *base_ns),
    NULLOK(STRING *str_key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_set_global( PARROT_INTERP,
    NULLOK(PMC *ns),
    NULLOK(STRING *globalname),
    NULLOK(PMC *val) )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_store_global_cur( PARROT_INTERP,
    NULLOK(STRING *globalname),
    NULLOK(PMC *val) )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_store_global_k( PARROT_INTERP,
    NOTNULL(PMC *pmc_key),
    NULLOK(STRING *globalname),
    NULLOK(PMC *val) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_store_global_n( PARROT_INTERP,
    NULLOK(PMC *ns),
    NULLOK(STRING *globalname),
    NULLOK(PMC *val) )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_store_global_s( PARROT_INTERP,
    NULLOK(STRING *str_key),
    NULLOK(STRING *globalname),
    NULLOK(PMC *val) )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_store_sub_in_namespace( PARROT_INTERP, NOTNULL(PMC *sub) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/global.c */

#endif /* PARROT_GLOBAL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

