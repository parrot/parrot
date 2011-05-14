/* pmc.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
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
PMC * Parrot_pmc_box_c_string_array(PARROT_INTERP,
    int count,
    ARGIN(const char **s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_HOT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_pmc_box_integer(PARROT_INTERP, INTVAL value)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_HOT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_pmc_box_number(PARROT_INTERP, FLOATVAL value)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_HOT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_box_string(PARROT_INTERP, ARGIN_NULLOK(STRING *string))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_pmc_create_mro(PARROT_INTERP, INTVAL type)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_pmc_destroy(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
void Parrot_pmc_gc_register(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pmc_gc_unregister(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_pmc_get_type(PARROT_INTERP, ARGIN(PMC *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_pmc_get_type_str(PARROT_INTERP, ARGIN_NULLOK(STRING *name))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_HOT
INTVAL Parrot_pmc_is_null(PARROT_INTERP, ARGIN_NULLOK(const PMC *pmc));

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_pmc_new(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_constant(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_constant_init(PARROT_INTERP,
    INTVAL base_type,
    ARGIN_NULLOK(PMC *init))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_constant_init_int(PARROT_INTERP,
    INTVAL base_type,
    INTVAL init)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_pmc_new_constant_noinit(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_init(PARROT_INTERP,
    INTVAL base_type,
    ARGOUT(PMC *init))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*init);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_init_int(PARROT_INTERP, INTVAL base_type, INTVAL init)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_noinit(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_pmc_register_new_type(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
PMC * Parrot_pmc_reuse(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    INTVAL new_type,
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
PMC * Parrot_pmc_reuse_by_class(PARROT_INTERP,
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
PMC * Parrot_pmc_reuse_init(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    INTVAL new_type,
    ARGIN(PMC *init),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pmc);

void Parrot_pmc_free_temporary(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

INTVAL Parrot_pmc_get_new_vtable_index(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pmc_new_temporary(PARROT_INTERP, INTVAL base_type)
        __attribute__nonnull__(1);

INTVAL Parrot_pmc_type_does(PARROT_INTERP,
    ARGIN(const STRING *role),
    INTVAL type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_pmc_box_c_string_array __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_pmc_box_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_box_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_box_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_create_mro __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_pmc_gc_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_pmc_gc_unregister __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_pmc_get_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_pmc_get_type_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_is_null __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_pmc_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_constant_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_constant_init_int \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_constant_noinit \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(init))
#define ASSERT_ARGS_Parrot_pmc_new_init_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_noinit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_register_new_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_pmc_reuse __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_pmc_reuse_by_class __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(class_))
#define ASSERT_ARGS_Parrot_pmc_reuse_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(init))
#define ASSERT_ARGS_Parrot_pmc_free_temporary __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_pmc_get_new_vtable_index \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_new_temporary __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pmc_type_does __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(role))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/pmc.c */

/* Allows compatibility with old name (see r44190) */
#define Parrot_create_mro       Parrot_pmc_create_mro
#define PMC_is_null             Parrot_pmc_is_null
#define constant_pmc_new        Parrot_pmc_new_constant
#define constant_pmc_new_init   Parrot_pmc_new_constant_init
#define gc_register_pmc         Parrot_pmc_gc_register
#define gc_unregister_pmc       Parrot_pmc_gc_unregister
#define pmc_new                 Parrot_pmc_new
#define pmc_new_init            Parrot_pmc_new_init
#define pmc_new_noinit          Parrot_pmc_new_noinit
#define pmc_register            Parrot_pmc_register_new_type
#define pmc_reuse               Parrot_pmc_reuse
#define pmc_reuse_by_class      Parrot_pmc_reuse_by_class
#define pmc_reuse_init          Parrot_pmc_reuse_init
#define pmc_reuse_no_init       Parrot_pmc_reuse_noinit
#define pmc_type                Parrot_pmc_get_type_str
#define pmc_type_p              Parrot_pmc_get_type

#define PMC_IS_TYPE(p, t) ((p)->vtable->base_type == enum_class_ ## t)
#define PMC_IS_TYPE_ENUM(p, e) ((p)->vtable->base_type == (e))

#endif /* PARROT_PMC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
