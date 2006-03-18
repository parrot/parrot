/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
Parrot_new_vtable(Parrot_Interp interpreter) {
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
Parrot_clone_vtable(Parrot_Interp interpreter, const VTABLE *base_vtable) {
    VTABLE *new_vtable = mem_sys_allocate(sizeof(VTABLE));
    if (new_vtable) {
        memcpy(new_vtable, base_vtable, sizeof(VTABLE));
    }
    return new_vtable;
}


void
Parrot_destroy_vtable(Parrot_Interp interpreter, VTABLE *vtable) {
    mem_sys_free(vtable);
}

void 
parrot_alloc_vtables(Interp *interpreter)
{
    if (!Parrot_base_vtables) {
        Parrot_base_vtables =
            mem_sys_allocate_zeroed(sizeof(VTABLE *) * PARROT_MAX_CLASSES);
        enum_class_max = enum_class_core_max;
        class_table_size = PARROT_MAX_CLASSES;
    }
}

void 
parrot_realloc_vtables(Interp *interpreter)
{
    VTABLE **new_vtable_table;
    /* 10 bigger seems reasonable, though it's only a pointer
       table and we could get bigger without blowing much memory
       */
    INTVAL new_max = class_table_size + 10;
    INTVAL new_size = new_max * sizeof(VTABLE *);
    INTVAL i;
    new_vtable_table = mem_sys_realloc(Parrot_base_vtables, new_size);
    /* Should set all the empty slots to the null PMC's
       vtable pointer */
    for (i = class_table_size; i < new_max; ++i)
        new_vtable_table[i] = NULL;
    Parrot_base_vtables = new_vtable_table;
    class_table_size = new_max;
}

void 
parrot_free_vtables(Interp *interpreter)
{
    int i;

    if (!interpreter->parent_interpreter)
        for (i = 1; i < (int)enum_class_max; i++)
            Parrot_destroy_vtable(interpreter, Parrot_base_vtables[i]);
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
