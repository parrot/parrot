/*
Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/vtables.c - Functions to build and manipulate vtables

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<VTABLE *
Parrot_new_vtable(Parrot_Interp interpreter)>

Creates and returns a pointer to the new C<VTABLE>.

=cut

*/

VTABLE *
Parrot_new_vtable(Parrot_Interp interpreter)
{
    return mem_sys_allocate_zeroed(sizeof(VTABLE));
}

/*

=item C<VTABLE *
Parrot_clone_vtable(Parrot_Interp interpreter, const VTABLE *base_vtable)>

Clones C<*base_vtable> and returns a pointer to the new C<VTABLE>.

=item C<void
Parrot_destroy_vtable(Parrot_Interp interpreter, VTABLE *vtable)>

Destroys C<*vtable>.
=cut

*/

VTABLE *
Parrot_clone_vtable(Parrot_Interp interpreter, const VTABLE *base_vtable)
{
    VTABLE * const new_vtable = mem_sys_allocate(sizeof(VTABLE));
    if (new_vtable) {
        memcpy(new_vtable, base_vtable, sizeof(VTABLE));
    }
    return new_vtable;
}


void
Parrot_destroy_vtable(Parrot_Interp interpreter, VTABLE *vtable)
{
    mem_sys_free(vtable);
}

void 
parrot_alloc_vtables(Interp *interpreter)
{
    interpreter->vtables =
        mem_sys_allocate_zeroed(sizeof(VTABLE *) * PARROT_MAX_CLASSES);
    interpreter->n_vtable_max = enum_class_core_max;
    interpreter->n_vtable_alloced = PARROT_MAX_CLASSES;
}

void 
parrot_realloc_vtables(Interp *interpreter)
{
    /* 16 bigger seems reasonable, though it's only a pointer
       table and we could get bigger without blowing much memory
       */
    const INTVAL new_max = interpreter->n_vtable_alloced + 16;
    const INTVAL new_size = new_max * sizeof(VTABLE *);
    INTVAL i;
    interpreter->vtables = mem_sys_realloc(interpreter->vtables, new_size);
    /* Should set all the empty slots to the null PMC's
       vtable pointer */
    for (i = interpreter->n_vtable_max; i < new_max; ++i)
        interpreter->vtables[i] = NULL;
    interpreter->n_vtable_alloced = new_max;
}

void 
parrot_free_vtables(Interp *interpreter)
{
    int i;

    for (i = 1; i < interpreter->n_vtable_max; i++)
        Parrot_destroy_vtable(interpreter, interpreter->vtables[i]);
    mem_sys_free(interpreter->vtables);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/vtables.h>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
