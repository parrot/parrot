/*
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.

=head1 NAME

src/6model/repr_registry.c - representation registry

=head1 DESCRIPTION

This is an implementation of a representation registry. It keeps track of
all of the available representations, and is responsible for building them
at startup.

TODO:
- This should be a PMC,
- made thread-safe,
- allow registration of external representations, like all 4 P6xxx.

=head2 Internal Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "repr_registry.str"
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

static void register_repr(PARROT_INTERP, const STRING *name, REPROps *repr)
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

/*

=item C<static void register_repr(PARROT_INTERP, const STRING *name, REPROps
*repr)>

Register a sixmodel representation.

TODO: make it public, make it thread-safe.

=cut

*/
static void
register_repr(PARROT_INTERP, const STRING *name, REPROps *repr)
{
    ASSERT_ARGS(register_repr)
    INTVAL ID = num_reprs;
    num_reprs++;
    if (repr_registry)
        mem_realloc_n_typed(repr_registry, num_reprs, REPROps *);
    else
        repr_registry = mem_allocate_n_typed(num_reprs, REPROps *);
    repr_registry[ID] = repr;
    VTABLE_set_integer_keyed_str(interp, repr_name_to_id_map, name, ID);
}

/*

=back

=head2 Functions

=over 4

=item C<void REPR_initialize_registry(PARROT_INTERP)>

Initializes the representations registry, building up all of the P6
various representations.

TODO: Allow other user-repr.

=cut

*/
void
REPR_initialize_registry(PARROT_INTERP)
{
    const STRING * s_KnowHOWREPR = CONST_STRING(interp, "KnowHOWREPR");
    const STRING * s_P6opaque    = CONST_STRING(interp, "P6opaque");
    const STRING * s_P6int       = CONST_STRING(interp, "P6int");
    const STRING * s_P6num       = CONST_STRING(interp, "P6num");
    const STRING * s_P6str       = CONST_STRING(interp, "P6str");
    const STRING * s_HashAttrStore  = CONST_STRING(interp, "HashAttrStore");
    const STRING * s_Uninstantiable = CONST_STRING(interp, "Uninstantiable");

    /* Allocate name to ID map, and anchor it with the GC. */
    repr_name_to_id_map = Parrot_pmc_new(interp, enum_class_Hash);
    Parrot_pmc_gc_register(interp, repr_name_to_id_map);

    /* Add all representations. */
    register_repr(interp, s_KnowHOWREPR, KnowHOWREPR_initialize(interp));
    register_repr(interp, s_P6opaque, P6opaque_initialize(interp));
    register_repr(interp, s_P6int, P6int_initialize(interp));
    register_repr(interp, s_P6num, P6num_initialize(interp));
    register_repr(interp, s_P6str, P6str_initialize(interp));
    register_repr(interp, s_HashAttrStore, HashAttrStore_initialize(interp));
    register_repr(interp, s_Uninstantiable, Uninstantiable_initialize(interp));
}

/*

=item C<INTVAL REPR_name_to_id(PARROT_INTERP, STRING *name)>

Get a representation's ID from its name. Note that the IDs may change so
it's best not to store references to them in e.g. the bytecode stream.

=cut

*/
PARROT_WARN_UNUSED_RESULT
INTVAL
REPR_name_to_id(PARROT_INTERP, STRING *name)
{
    return VTABLE_get_integer_keyed_str(interp, repr_name_to_id_map, name);
}

/*

=item C<REPROps * REPR_get_by_id(PARROT_INTERP, INTVAL id)>

Gets a representation by ID.

TODO: thread-safe (per interp)

=cut

*/
PARROT_WARN_UNUSED_RESULT
REPROps *
REPR_get_by_id(SHIM_INTERP, INTVAL id)
{
    return repr_registry[id];
}

/*

=item C<REPROps * REPR_get_by_name(PARROT_INTERP, STRING *name)>

Gets a representation by name.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
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
