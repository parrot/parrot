/* multidispatch.h
 *  Copyright (C) 2003-2007, Parrot Foundation.
 *  Overview:
 *     This is the API header for the mmd subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_MMD_H_GUARD
#define PARROT_MMD_H_GUARD

#include "parrot/config.h"
#include "parrot/compiler.h"
#include "parrot/parrot.h"

#define PARROT_MMD_MAX_CLASS_DEPTH 1000
#define Parrot_mmd_cache_destroy(x, y)

/* function typedefs */
typedef PMC*    (*mmd_f_p_ppp)(PARROT_INTERP, PMC *, PMC *, PMC *);
typedef PMC*    (*mmd_f_p_pip)(PARROT_INTERP, PMC *, INTVAL, PMC *);
typedef PMC*    (*mmd_f_p_pnp)(PARROT_INTERP, PMC *, FLOATVAL, PMC *);
typedef PMC*    (*mmd_f_p_psp)(PARROT_INTERP, PMC *, STRING *, PMC *);

typedef void (*mmd_f_v_pp)(PARROT_INTERP, PMC *, PMC *);
typedef void (*mmd_f_v_pi)(PARROT_INTERP, PMC *, INTVAL);
typedef void (*mmd_f_v_pn)(PARROT_INTERP, PMC *, FLOATVAL);
typedef void (*mmd_f_v_ps)(PARROT_INTERP, PMC *, STRING *);

typedef INTVAL (*mmd_f_i_pp)(PARROT_INTERP, PMC *, PMC *);

typedef struct _MMD_init {
    INTVAL func_nr;
    INTVAL left, right;
    funcptr_t func_ptr;
} MMD_init;

typedef struct _MMD_table {
    funcptr_t *mmd_funcs;     /* The functions for the MMD table */
    UINTVAL x;               /* The x coord for each table */
    UINTVAL y;               /* The y coord for each table */
} MMD_table;

typedef struct _multi_func_list {
    /* TT #646
     * This STRING ideally must be const but actually can't.
     */
    STRING *multi_name;
    STRING *short_sig;
    STRING *full_sig;
    STRING *ns_name;
    funcptr_t func_ptr;
} multi_func_list;

#define MMD_Cache PMC

/* HEADERIZER BEGIN: src/multidispatch.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_mmd_add_multi_from_c_args(PARROT_INTERP,
    ARGIN(const char *sub_name),
    ARGIN(const char *short_sig),
    ARGIN(const char *long_sig),
    ARGIN(funcptr_t multi_func_ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
void Parrot_mmd_add_multi_from_long_sig(PARROT_INTERP,
    ARGIN(STRING *sub_name),
    ARGIN(STRING *long_sig),
    ARGIN(PMC *sub_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_EXPORT
void Parrot_mmd_add_multi_list_from_c_args(PARROT_INTERP,
    ARGIN(const multi_func_list *mmd_info),
    INTVAL elements)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* Parrot_mmd_build_type_tuple_from_sig_obj(PARROT_INTERP,
    ARGIN(PMC *sig_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
MMD_Cache * Parrot_mmd_cache_create(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_mmd_cache_lookup_by_types(PARROT_INTERP,
    ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name),
    ARGIN(PMC *types))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cache);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_mmd_cache_lookup_by_values(PARROT_INTERP,
    ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name),
    ARGIN(PMC *values))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cache);

PARROT_EXPORT
void Parrot_mmd_cache_mark(PARROT_INTERP, ARGMOD(MMD_Cache *cache))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*cache);

PARROT_EXPORT
void Parrot_mmd_cache_store_by_types(PARROT_INTERP,
    ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name),
    ARGIN(PMC *types),
    ARGIN(PMC *chosen))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*cache);

PARROT_EXPORT
void Parrot_mmd_cache_store_by_values(PARROT_INTERP,
    ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name),
    ARGIN(PMC *values),
    ARGIN(PMC *chosen))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*cache);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_mmd_find_multi_from_long_sig(PARROT_INTERP,
    ARGIN(STRING *name),
    ARGIN(STRING *long_sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_mmd_find_multi_from_sig_obj(PARROT_INTERP,
    ARGIN(STRING *name),
    ARGIN(PMC *invoke_sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void Parrot_mmd_multi_dispatch_from_c_args(PARROT_INTERP,
    ARGIN(const char *name),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_mmd_sort_manhattan_by_sig_pmc(PARROT_INTERP,
    ARGIN(PMC *candidates),
    ARGIN(PMC *invoke_sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_mmd_add_multi_from_c_args \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_name) \
    , PARROT_ASSERT_ARG(short_sig) \
    , PARROT_ASSERT_ARG(long_sig) \
    , PARROT_ASSERT_ARG(multi_func_ptr))
#define ASSERT_ARGS_Parrot_mmd_add_multi_from_long_sig \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_name) \
    , PARROT_ASSERT_ARG(long_sig) \
    , PARROT_ASSERT_ARG(sub_obj))
#define ASSERT_ARGS_Parrot_mmd_add_multi_list_from_c_args \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mmd_info))
#define ASSERT_ARGS_Parrot_mmd_build_type_tuple_from_sig_obj \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig_obj))
#define ASSERT_ARGS_Parrot_mmd_cache_create __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_mmd_cache_lookup_by_types \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cache) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(types))
#define ASSERT_ARGS_Parrot_mmd_cache_lookup_by_values \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cache) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(values))
#define ASSERT_ARGS_Parrot_mmd_cache_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cache))
#define ASSERT_ARGS_Parrot_mmd_cache_store_by_types \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cache) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(types) \
    , PARROT_ASSERT_ARG(chosen))
#define ASSERT_ARGS_Parrot_mmd_cache_store_by_values \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cache) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(values) \
    , PARROT_ASSERT_ARG(chosen))
#define ASSERT_ARGS_Parrot_mmd_find_multi_from_long_sig \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(long_sig))
#define ASSERT_ARGS_Parrot_mmd_find_multi_from_sig_obj \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(invoke_sig))
#define ASSERT_ARGS_Parrot_mmd_multi_dispatch_from_c_args \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(sig))
#define ASSERT_ARGS_Parrot_mmd_sort_manhattan_by_sig_pmc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(candidates) \
    , PARROT_ASSERT_ARG(invoke_sig))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/multidispatch.c */


#endif /* PARROT_MMD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
