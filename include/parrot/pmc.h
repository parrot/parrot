/* pmc.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_PMC_H_GUARD
#define PARROT_PMC_H_GUARD

#include "parrot/core_pmcs.h"
#include "parrot/pobj.h"
#include "parrot/thread.h"

#define PARROT_MAX_CLASSES 100

/* HEADERIZER BEGIN: src/pmc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * constant_pmc_new(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * constant_pmc_new_init(PARROT_INTERP,
    INTVAL base_type,
    ARGIN_NULLOK(PMC *init))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * constant_pmc_new_noinit(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
void gc_register_pmc(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void gc_unregister_pmc(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_create_mro(PARROT_INTERP, INTVAL type)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_pmc_destroy(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
INTVAL Parrot_pmc_is_null(SHIM_INTERP, ARGIN_NULLOK(const PMC *pmc));

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * pmc_new(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * pmc_new_init(PARROT_INTERP, INTVAL base_type, ARGOUT(PMC *init))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*init);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * pmc_new_noinit(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL pmc_register(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
PMC * pmc_reuse(PARROT_INTERP,
    ARGIN(PMC *pmc),
    INTVAL new_type,
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
PMC * pmc_reuse_by_class(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGIN(PMC *class_),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
PMC * pmc_reuse_init(PARROT_INTERP,
    ARGIN(PMC *pmc),
    INTVAL new_type,
    ARGIN(PMC *init),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL pmc_type(PARROT_INTERP, ARGIN_NULLOK(STRING *name))
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL pmc_type_p(PARROT_INTERP, ARGIN(PMC *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL get_new_vtable_index(PARROT_INTERP)
        __attribute__nonnull__(1);

void temporary_pmc_free(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_CANNOT_RETURN_NULL
PMC * temporary_pmc_new(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_constant_pmc_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_constant_pmc_new_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_constant_pmc_new_noinit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_register_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_unregister_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_create_mro __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_pmc_is_null __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pmc_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pmc_new_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(init))
#define ASSERT_ARGS_pmc_new_noinit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pmc_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_pmc_reuse __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_pmc_reuse_by_class __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(class_))
#define ASSERT_ARGS_pmc_reuse_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(init))
#define ASSERT_ARGS_pmc_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pmc_type_p __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_get_new_vtable_index __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_temporary_pmc_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_temporary_pmc_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/pmc.c */

#endif /* PARROT_PMC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
