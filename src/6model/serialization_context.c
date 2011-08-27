/* This implements a little bit of support for serialization contexts.
 * At the moment, its main role is to just be a global lookup table for
 * serialization contexts; it'll need to get much smarter. */

#define PARROT_IN_EXTENSION
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "serialization_context.h"

/* Hash of serialization context objects */
static PMC *scs = NULL;

/* Initializes the store and register with the GC. */
static void setup_sc_stores(PARROT_INTERP) {
    scs = pmc_new(interp, enum_class_Hash);
    Parrot_pmc_gc_register(interp, scs);
}

/* Gets the serialization context - if any - associated with the
 * specified handle. */
PMC * SC_get_sc(PARROT_INTERP, STRING *handle) {
    if (!scs)
        setup_sc_stores(interp);
    return VTABLE_get_pmc_keyed_str(interp, scs, handle);
}

/* Stashes a serialization context with the specified handle. */
void SC_set_sc(PARROT_INTERP, STRING *handle, PMC *sc) {
    if (!scs)
        setup_sc_stores(interp);
    VTABLE_set_pmc_keyed_str(interp, scs, handle, sc);
}
