/* objects.h
 *  Copyright (C) 2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
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

/* HEADERIZER BEGIN: src/oo.c */

PARROT_API
INTVAL Parrot_add_attribute(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *attr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_class_lookup(PARROT_INTERP, ARGIN(STRING *class_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
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

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_ComputeMRO_C3(PARROT_INTERP, ARGIN(PMC *_class))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_find_method_direct(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *method_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_find_method_with_cache(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *method_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_CAN_RETURN_NULL
PMC* Parrot_find_vtable_meth(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(STRING *meth))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
INTVAL Parrot_get_vtable_index(PARROT_INTERP, ARGIN(const STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_instantiate_object(PARROT_INTERP, ARGMOD(PMC *object))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*object);

PARROT_API
void Parrot_instantiate_object_init(PARROT_INTERP,
    ARGIN(PMC *object),
    ARGIN(PMC *init))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void Parrot_invalidate_method_cache(PARROT_INTERP,
    ARGIN_NULLOK(STRING *_class),
    ARGIN(STRING *meth))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
PARROT_PURE_FUNCTION
INTVAL Parrot_MMD_method_idx(SHIM_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(2);

PARROT_API
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
const char* Parrot_MMD_method_name(SHIM_INTERP, INTVAL idx);

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_class_str(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_remove_parent(PARROT_INTERP,
    ARGIN(PMC *removed_class),
    ARGIN(PMC *existing_class))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_single_subclass(PARROT_INTERP,
    ARGIN(PMC *base_class),
    ARGIN_NULLOK(PMC *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING* readable_name(PARROT_INTERP, ARGIN(PMC *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void destroy_object_cache(PARROT_INTERP)
        __attribute__nonnull__(1);

void init_object_cache(PARROT_INTERP)
        __attribute__nonnull__(1);

void mark_object_cache(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_class_lookup_p(PARROT_INTERP, ARGIN(PMC *class_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_oo_extract_methods_from_namespace(PARROT_INTERP,
    ARGIN(PMC *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_find_vtable_override(PARROT_INTERP,
    ARGIN(PMC *classobj),
    ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_find_vtable_override_for_class(PARROT_INTERP,
    ARGIN(PMC *classobj),
    ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_class(PARROT_INTERP, ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_namespace(PARROT_INTERP, ARGIN(const PMC *classobj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_newclass_from_str(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/oo.c */

#endif /* PARROT_OO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
