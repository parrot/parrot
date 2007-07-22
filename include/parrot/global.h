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
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_global_s( PARROT_INTERP,
    NULLOK(STRING *str_key),
    NULLOK(STRING *globalname) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_find_name_op( PARROT_INTERP, NOTNULL(STRING *name), void *next )
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
void Parrot_store_global_s(
    NOTNULL(Interp *inter),
    NULLOK(STRING *str_key),
    NULLOK(STRING *globalname),
    NULLOK(PMC *val) )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_store_sub_in_namespace( PARROT_INTERP, NOTNULL(PMC *sub) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_find_global_op( PARROT_INTERP,
    NOTNULL(PMC *ns),
    NOTNULL(STRING *globalname),
    NULLOK(void *next) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: src/global.c */

PARROT_API PMC *Parrot_get_namespace_keyed(Interp *, PMC *base_ns, PMC *pmc_key);
PARROT_API PMC *Parrot_get_namespace_keyed_str(Interp *, PMC *base_ns, STRING *str_key);

PARROT_API PMC *Parrot_make_namespace_keyed(Interp *, PMC *base_ns, PMC *pmc_key);
PARROT_API PMC *Parrot_make_namespace_keyed_str(Interp *, PMC *base_ns, STRING *str_key);

PARROT_API PMC *Parrot_get_namespace_autobase(PARROT_INTERP, PMC *key);
PARROT_API PMC *Parrot_make_namespace_autobase(PARROT_INTERP, PMC *key);

/*
 * {get,set}_global.
 *
 * Parrot_get_global allows a null namespace without throwing an exception; it
 * simply returns PMCNULL in that case.
 *
 * NOTE: At present the use of the {get,set}_global functions is mandatory due to the
 *       wacky namespace typing of the default Parrot namespace.  Eventually it will be
 *       safe to just use the standard hash interface (if desired).
 */

PARROT_API PMC *Parrot_get_global(Interp *, PMC *ns, STRING *globalname);
PARROT_API void Parrot_set_global(Interp *, PMC *ns, STRING *globalname, PMC *val);



/*
 * OLD API FOLLOWS.
 * The below functions may be deprecated soon.
 */

PARROT_API PMC *Parrot_find_global_cur(Interp *,                STRING *globalname);
PARROT_API PMC *Parrot_find_global_n(Interp *, PMC    *ns,      STRING *globalname);
PARROT_API PMC *Parrot_find_global_k(Interp *, PMC    *pmc_key, STRING *globalname);
PARROT_API PMC *Parrot_find_global_s(Interp *, STRING *str_key, STRING *globalname);

PARROT_API void Parrot_store_global_cur(Interp *,                STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_n(Interp *, PMC    *ns,      STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_k(Interp *, PMC    *pmc_key, STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_s(Interp *, STRING *str_key, STRING *globalname, PMC *val);

/* helpers for opcode implementation */

PARROT_API PMC *Parrot_find_global_op(Interp *, PMC *ns, STRING *globalname, void *next);
PARROT_API PMC *Parrot_find_name_op(Interp *, STRING *name, void *next);

/* TODO - review the rest - Chip */
PARROT_API void Parrot_store_sub_in_namespace(Interp *, PMC *sub_pmc);

#endif /* PARROT_GLOBAL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

