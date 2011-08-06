/*
Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

src/vtables.c

=head1 DESCRIPTION

Functions to build and manipulate vtables

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* This function is defined in the auto-generated file core_pmcs.c */
/* XXX Get it into some public place */
extern void Parrot_gbl_initialize_core_pmcs(PARROT_INTERP, int pass);

/* HEADERIZER HFILE: include/parrot/vtables.h */

/*

=item C<VTABLE * Parrot_vtbl_new_vtable(PARROT_INTERP)>

Creates and returns a pointer to the new C<VTABLE>.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
VTABLE *
Parrot_vtbl_new_vtable(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_vtbl_new_vtable)
    return mem_internal_allocate_zeroed_typed(VTABLE);
}

/*

=item C<VTABLE * Parrot_vtbl_clone_vtable(PARROT_INTERP, const VTABLE
*base_vtable)>

Clones C<*base_vtable> and returns a pointer to the new C<VTABLE>.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
VTABLE *
Parrot_vtbl_clone_vtable(PARROT_INTERP, ARGIN(const VTABLE *base_vtable))
{
    ASSERT_ARGS(Parrot_vtbl_clone_vtable)
    VTABLE * const new_vtable = mem_internal_allocate_typed(VTABLE);

    STRUCT_COPY(new_vtable, base_vtable);

    /* when called from global PMC initialization, not all vtables have isa_hash
     * when called at runtime, they do */
    if (base_vtable->isa_hash) {
        new_vtable->isa_hash = Parrot_hash_new(interp);
        Parrot_hash_clone(interp, base_vtable->isa_hash, new_vtable->isa_hash);
    }


    return new_vtable;
}


/*

=item C<void Parrot_vtbl_destroy_vtable(PARROT_INTERP, VTABLE *vtable)>

Destroys C<*vtable>.

=cut

*/

PARROT_EXPORT
void
Parrot_vtbl_destroy_vtable(PARROT_INTERP, ARGFREE_NOTNULL(VTABLE *vtable))
{
    ASSERT_ARGS(Parrot_vtbl_destroy_vtable)
    /* We sometimes get a type number allocated without any corresponding
     * vtable. E.g. if you load perl_group, perlscalar is this way.  */

    if (vtable->ro_variant_vtable) {
        VTABLE * const ro_vtable = vtable->ro_variant_vtable;

        if (ro_vtable->isa_hash) {
            Parrot_hash_destroy(interp, ro_vtable->isa_hash);
            if (ro_vtable->isa_hash == vtable->isa_hash)
                vtable->isa_hash = NULL;

            ro_vtable->isa_hash = NULL;
        }

        mem_internal_free(ro_vtable);
        vtable->ro_variant_vtable = NULL;
    }

    if (vtable->isa_hash) {
        Parrot_hash_destroy(interp, vtable->isa_hash);
        vtable->isa_hash = NULL;
    }

    mem_internal_free(vtable);
}

/*

=item C<void Parrot_vtbl_alloc_vtables(PARROT_INTERP)>

Allocate memory for the vtables for all known classes (PMC types).

=cut

*/

void
Parrot_vtbl_alloc_vtables(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_vtbl_alloc_vtables)
    interp->vtables          = mem_internal_allocate_n_zeroed_typed(PARROT_MAX_CLASSES, VTABLE *);
    interp->n_vtable_max     = enum_class_core_max;
    interp->n_vtable_alloced = PARROT_MAX_CLASSES - 1;
}

/*

=item C<void Parrot_vtbl_realloc_vtables(PARROT_INTERP)>

Reallocate memory for vtables, increasing the number of vtables by 16.

=cut

*/

void
Parrot_vtbl_realloc_vtables(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_vtbl_realloc_vtables)
    /* 16 bigger seems reasonable, though it's only a pointer
       table and we could get bigger without blowing much memory
       */
    const INTVAL new_max     = interp->n_vtable_alloced + 16;
    const INTVAL new_size    = new_max              * sizeof (VTABLE *);
    const INTVAL old_size    = interp->n_vtable_max * sizeof (VTABLE *);

    /* arrays start at zero, but we compare type numbers starting at 1 */
    interp->n_vtable_alloced = new_max - 1;
    interp->vtables          = (VTABLE **)mem_internal_realloc_zeroed(
        interp->vtables, new_size, old_size);
}

/*

=item C<void Parrot_vtbl_free_vtables(PARROT_INTERP)>

Free memory allocated for the vtables. Each vtable is destroyed
through its destructor Parrot_vtbl_destroy_vtable, after which the list
of pointers to these vtables is freed.

=cut

*/

void
Parrot_vtbl_free_vtables(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_vtbl_free_vtables)
    int i;

    for (i = 0; i < interp->n_vtable_max; ++i)
        Parrot_vtbl_destroy_vtable(interp, interp->vtables[i]);

    mem_internal_free(interp->vtables);
}

/*

=item C<void Parrot_vtbl_mark_vtables(PARROT_INTERP)>

Mark all vtables as being alive for the garbage collector.

=cut

*/

void
Parrot_vtbl_mark_vtables(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_vtbl_mark_vtables)
    INTVAL i;

    for (i = 1; i < interp->n_vtable_max; ++i) {
        const VTABLE * const vtable = interp->vtables[i];

        /* XXX dynpmc groups have empty slots for abstract objects */
        if (!vtable)
            continue;

        Parrot_gc_mark_PMC_alive(interp, vtable->mro);
        Parrot_gc_mark_PMC_alive(interp, vtable->_namespace);
        Parrot_gc_mark_STRING_alive(interp, vtable->whoami);
        Parrot_gc_mark_STRING_alive(interp, vtable->provides_str);
        Parrot_gc_mark_PMC_alive(interp, vtable->pmc_class);
    }
}

/*

=item C<void Parrot_vtbl_initialize_core_vtables(PARROT_INTERP)>

Initialize vtables for the core PMCs.

=cut

*/

PARROT_EXPORT
void
Parrot_vtbl_initialize_core_vtables(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_vtbl_initialize_core_vtables)

    if (! interp->vtables) {
        Parrot_vtbl_alloc_vtables(interp);
        Parrot_gbl_initialize_core_pmcs(interp, 0);
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/vtables.h>

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
