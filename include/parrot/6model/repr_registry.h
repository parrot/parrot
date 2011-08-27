/* Various functions related to representation and representation
 * registry handling. */

#ifndef REPRREGISTRY_H_GUARD
#define REPRREGISTRY_H_GUARD

void      REPR_initialize_registry(PARROT_INTERP);
INTVAL    REPR_name_to_id         (PARROT_INTERP, STRING *name);
REPROps * REPR_get_by_id          (PARROT_INTERP, INTVAL id);
REPROps * REPR_get_by_name        (PARROT_INTERP, STRING *name);

#endif
