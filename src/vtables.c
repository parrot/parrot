/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/vtables.c - Functions to build and manipulate vtables

=head1 DESCRIPTION

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/vtables.h"

/* HEADERIZER TARGET: include/parrot/vtables.h */

/*

FUNCDOC: Parrot_new_vtable

Creates and returns a pointer to the new C<VTABLE>.

*/

PARROT_API
VTABLE *
Parrot_new_vtable(Interp *interp)
    /* MALLOC, WARN_UNUSED */
{
    return mem_allocate_zeroed_typed(VTABLE);
}

/*

FUNCDOC: Parrot_clone_vtable

Clones C<*base_vtable> and returns a pointer to the new C<VTABLE>.

*/

PARROT_API
VTABLE *
Parrot_clone_vtable(Interp *interp, const VTABLE *base_vtable /*NN*/)
    /* MALLOC, WARN_UNUSED */
{
    VTABLE * const new_vtable = mem_allocate_typed(VTABLE);
    if (new_vtable) {
        STRUCT_COPY(new_vtable, base_vtable);
    }
    return new_vtable;
}


/*

FUNCDOC: Parrot_destroy_vtable

Destroys C<*vtable>.

*/

PARROT_API
void
Parrot_destroy_vtable(Interp *interp, VTABLE *vtable /*NULLOK*/)
{
    /* XXX We sometimes get a type number allocated without any corresponding
     * vtable. E.g. if you load perl_group, perlscalar is this way.
     */
    if (!vtable)
        return;
    if (vtable->ro_variant_vtable)
        mem_sys_free(vtable->ro_variant_vtable);
    mem_sys_free(vtable);
}

void
parrot_alloc_vtables(Interp *interp /*NN*/)
{
    interp->vtables =
        (VTABLE **)mem_sys_allocate_zeroed(sizeof (VTABLE *) * PARROT_MAX_CLASSES);
    interp->n_vtable_max = enum_class_core_max;
    interp->n_vtable_alloced = PARROT_MAX_CLASSES;
}

void
parrot_realloc_vtables(Interp *interp /*NN*/)
{
    /* 16 bigger seems reasonable, though it's only a pointer
       table and we could get bigger without blowing much memory
       */
    const INTVAL new_max = interp->n_vtable_alloced + 16;
    const INTVAL new_size = new_max              * sizeof (VTABLE *);
    const INTVAL old_size = interp->n_vtable_max * sizeof (VTABLE *);
    interp->vtables = (VTABLE **)mem_sys_realloc_zeroed(interp->vtables, new_size, old_size);
    interp->n_vtable_alloced = new_max;
}

void
parrot_free_vtables(Interp *interp /*NN*/)
{
    int i;

    for (i = 1; i < interp->n_vtable_max; i++)
        Parrot_destroy_vtable(interp, interp->vtables[i]);
    mem_sys_free(interp->vtables);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
