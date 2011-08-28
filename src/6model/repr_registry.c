/*
Copyright (C) 2011, Parrot Foundation.
*/

/* This is an implementation of a representation registry. It keeps track of
 * all of the available representations, and is responsible for building them
 * at startup. */

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/6model/sixmodelobject.h"
#include "parrot/6model/repr/KnowHOWREPR.h"
#include "parrot/6model/repr/P6opaque.h"
#include "parrot/6model/repr/P6int.h"
#include "parrot/6model/repr/P6num.h"
#include "parrot/6model/repr/P6str.h"
#include "parrot/6model/repr/HashAttrStore.h"
#include "parrot/6model/repr/Uninstantiable.h"
#include "parrot/6model/repr_registry.h"

/* HEADERIZER HFILE: none */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void register_repr(PARROT_INTERP, STRING *name, REPROps *repr)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_register_repr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* An array mapping representation IDs to function tables. */
static REPROps **repr_registry = NULL;

/* Number of representations registered so far. */
static INTVAL num_reprs = 0;

/* Hash mapping representation names to IDs. */
static PMC *repr_name_to_id_map = NULL;

/* Registers a representation. It this is ever made public, it should first be
 * made thread-safe. */
static void
register_repr(PARROT_INTERP, STRING *name, REPROps *repr)
{
    INTVAL ID = num_reprs;
    num_reprs++;
    if (repr_registry)
        mem_realloc_n_typed(repr_registry, num_reprs, REPROps *);
    else
        repr_registry = mem_allocate_n_typed(num_reprs, REPROps *);
    repr_registry[ID] = repr;
    VTABLE_set_integer_keyed_str(interp, repr_name_to_id_map, name, ID);
}

/* Initializes the representations registry, building up all of the various
 * representations. */
void
REPR_initialize_registry(PARROT_INTERP)
{
    /* Allocate name to ID map, and anchor it with the GC. */
    repr_name_to_id_map = Parrot_pmc_new(interp, enum_class_Hash);
    Parrot_pmc_gc_register(interp, repr_name_to_id_map);

    /* Add all representations. */
    register_repr(interp, Parrot_str_new_constant(interp, "KnowHOWREPR"),
        KnowHOWREPR_initialize(interp));
    register_repr(interp, Parrot_str_new_constant(interp, "P6opaque"),
        P6opaque_initialize(interp));
    register_repr(interp, Parrot_str_new_constant(interp, "P6int"),
        P6int_initialize(interp));
    register_repr(interp, Parrot_str_new_constant(interp, "P6num"),
        P6num_initialize(interp));
    register_repr(interp, Parrot_str_new_constant(interp, "P6str"),
        P6str_initialize(interp));
    register_repr(interp, Parrot_str_new_constant(interp, "HashAttrStore"),
        HashAttrStore_initialize(interp));
    register_repr(interp, Parrot_str_new_constant(interp, "Uninstantiable"),
        Uninstantiable_initialize(interp));
}

/* Get a representation's ID from its name. Note that the IDs may change so
 * it's best not to store references to them in e.g. the bytecode stream. */
INTVAL
REPR_name_to_id(PARROT_INTERP, STRING *name)
{
    return VTABLE_get_integer_keyed_str(interp, repr_name_to_id_map, name);
}

/* Gets a representation by ID. */
REPROps *
REPR_get_by_id(PARROT_INTERP, INTVAL id)
{
    return repr_registry[id];
}

/* Gets a representation by name. */
REPROps *
REPR_get_by_name(PARROT_INTERP, STRING *name)
{
    return repr_registry[VTABLE_get_integer_keyed_str(interp, repr_name_to_id_map, name)];
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
