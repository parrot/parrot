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

void Parrot_oo_extract_methods_from_namespace(PARROT_INTERP,
    NOTNULL(PMC *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_find_vtable_override(PARROT_INTERP,
    NOTNULL(PMC *classobj),
    NOTNULL(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_find_vtable_override_for_class(PARROT_INTERP,
    NOTNULL(PMC *classobj),
    NOTNULL(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_class(PARROT_INTERP, NOTNULL(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_class_str(PARROT_INTERP, NOTNULL(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_get_namespace(PARROT_INTERP, NOTNULL(PMC *classobj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_oo_newclass_from_str(PARROT_INTERP, NOTNULL(STRING *name))
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
