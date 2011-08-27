/* This is an implementation of a representation registry. It keeps track of
 * all of the available representations, and is responsible for building them
 * at startup. */

#define PARROT_IN_EXTENSION
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "sixmodelobject.h"
#include "reprs/KnowHOWREPR.h"
#include "reprs/P6opaque.h"
#include "reprs/P6int.h"
#include "reprs/P6num.h"
#include "reprs/P6str.h"
#include "reprs/HashAttrStore.h"
#include "reprs/Uninstantiable.h"
#include "repr_registry.h"

/* An array mapping representation IDs to function tables. */
static REPROps **repr_registry = NULL;

/* Number of representations registered so far. */
static INTVAL num_reprs = 0;

/* Hash mapping representation names to IDs. */
static PMC *repr_name_to_id_map = NULL;

/* Registers a representation. It this is ever made public, it should first be
 * made thread-safe. */
static void register_repr(PARROT_INTERP, STRING *name, REPROps *repr) {
    INTVAL ID = num_reprs;
    num_reprs++;
    if (repr_registry)
        repr_registry = mem_sys_realloc(repr_registry, num_reprs * sizeof(REPROps *));
    else
        repr_registry = mem_sys_allocate(num_reprs * sizeof(REPROps *));
    repr_registry[ID] = repr;
    VTABLE_set_integer_keyed_str(interp, repr_name_to_id_map, name, ID);
}

/* Initializes the representations registry, building up all of the various
 * representations. */
void REPR_initialize_registry(PARROT_INTERP) {
    /* Allocate name to ID map, and anchor it with the GC. */
    repr_name_to_id_map = pmc_new(interp, enum_class_Hash);
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
INTVAL REPR_name_to_id(PARROT_INTERP, STRING *name) {
    return VTABLE_get_integer_keyed_str(interp, repr_name_to_id_map, name);
}

/* Gets a representation by ID. */
REPROps * REPR_get_by_id(PARROT_INTERP, INTVAL id) {
    return repr_registry[id];
}

/* Gets a representation by name. */
REPROps * REPR_get_by_name(PARROT_INTERP, STRING *name) {
    return repr_registry[VTABLE_get_integer_keyed_str(interp, repr_name_to_id_map, name)];
}
