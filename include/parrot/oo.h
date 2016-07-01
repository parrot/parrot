/* objects.h
 *  Copyright (C) 2007-2008, Parrot Foundation.
 *  Overview:
 *     Parrot class and object header stuff
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_OO_H_GUARD
#define PARROT_OO_H_GUARD

#include "parrot/parrot.h"

typedef enum {
    PCD_PARENTS,            /* An array of immediate parents */
    PCD_CLASS_NAME,         /* A String PMC */
    PCD_ATTRIBUTES,         /* class::attrib => offset hash */
    PCD_CLASS_ATTRIBUTES,   /* Class attribute array */
    PCD_OBJECT_VTABLE,      /* Vtable PMC that holds the vtable for objects of this class */
    PCD_MAX
} PARROT_CLASS_DATA_ENUM;


/*
 * The active destroy flag is necessary to free the malloced array.
 */
#define SLOTTYPE PMC*
#define get_attrib_num(x, y)    ((PMC **)(x))[(y)]
#define set_attrib_num(o, x, y, z) \
    do { \
        Parrot_gc_write_barrier(interp, (o), ((PMC **)(x))[y], (z)); \
        ((PMC **)(x))[(y)] = (z); \
    } while (0)

/*
 * class macros
 */

#define GET_CLASS(obj)          (obj)->vtable->pmc_class

/* HEADERIZER BEGIN: src/oo.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_ComposeRole(PARROT_INTERP,
    ARGIN(PMC *role),
    ARGIN(PMC *exclude),
    int got_exclude,
    ARGIN(PMC *alias),
    int got_alias,
    ARGIN(PMC *methods_hash),
    ARGIN(PMC *roles_list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        __attribute__nonnull__(7)
        __attribute__nonnull__(8);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_ComputeMRO_C3(PARROT_INTERP, ARGIN(PMC *_class))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_find_method_direct(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *method_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_find_method_with_cache(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *method_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
INTVAL Parrot_get_vtable_index(PARROT_INTERP, ARGIN(const STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
const char * Parrot_get_vtable_name(PARROT_INTERP, INTVAL idx);

PARROT_EXPORT
void Parrot_invalidate_method_cache(PARROT_INTERP,
    ARGIN_NULLOK(STRING *_class))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_find_vtable_override(PARROT_INTERP,
    ARGIN(PMC *classobj),
    ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_find_vtable_override_for_class(PARROT_INTERP,
    ARGIN(PMC *classobj),
    ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_class(PARROT_INTERP, ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_class_str(PARROT_INTERP, ARGIN_NULLOK(STRING *name))
        __attribute__nonnull__(1);

void destroy_object_cache(PARROT_INTERP)
        __attribute__nonnull__(1);

void init_object_cache(PARROT_INTERP)
        __attribute__nonnull__(1);

void mark_object_cache(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC * Parrot_oo_clone_object(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGMOD_NULLOK(PMC *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

void Parrot_oo_extract_methods_from_namespace(PARROT_INTERP,
    ARGIN(PMC *self),
    ARGIN(PMC *ns))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_newclass_from_str(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_oo_register_type(PARROT_INTERP,
    ARGIN(PMC *name),
    ARGIN(PMC *_namespace))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_ComposeRole __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(role) \
    , PARROT_ASSERT_ARG(exclude) \
    , PARROT_ASSERT_ARG(alias) \
    , PARROT_ASSERT_ARG(methods_hash) \
    , PARROT_ASSERT_ARG(roles_list))
#define ASSERT_ARGS_Parrot_ComputeMRO_C3 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(_class))
#define ASSERT_ARGS_Parrot_find_method_direct __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(_class) \
    , PARROT_ASSERT_ARG(method_name))
#define ASSERT_ARGS_Parrot_find_method_with_cache __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(_class) \
    , PARROT_ASSERT_ARG(method_name))
#define ASSERT_ARGS_Parrot_get_vtable_index __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_get_vtable_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_invalidate_method_cache \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_oo_find_vtable_override \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(classobj) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_oo_find_vtable_override_for_class \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(classobj) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_oo_get_class __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_oo_get_class_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_destroy_object_cache __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_init_object_cache __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_mark_object_cache __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_oo_clone_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_oo_extract_methods_from_namespace \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(ns))
#define ASSERT_ARGS_Parrot_oo_newclass_from_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_oo_register_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(_namespace))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/oo.c */

#endif /* PARROT_OO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
