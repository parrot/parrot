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
Parrot_clone_vtable(Parrot_Interp interpreter, VTABLE *base_vtable)>

Clones C<*base_vtable> and returns a pointer to the new C<VTABLE>.

=cut

*/

VTABLE *
Parrot_clone_vtable(Parrot_Interp interpreter, VTABLE *base_vtable) {
    VTABLE *new_vtable = mem_sys_allocate(sizeof(VTABLE));
    if (new_vtable) {
        memcpy(new_vtable, base_vtable, sizeof(VTABLE));
    }
    return new_vtable;
}

/*

=item C<void
Parrot_vtable_set_type(Parrot_Interp interpreter, VTABLE *vtable, INTVAL type)>

Sets the type of C<*vtable> to C<type>.

=cut

*/

void
Parrot_vtable_set_type(Parrot_Interp interpreter, VTABLE *vtable, INTVAL type) {
    vtable->base_type = type;
}

/*

=item C<void
Parrot_vtable_set_name(Parrot_Interp interpreter, VTABLE *vtable, 
                       STRING *whoami)>

Sets the name of C<*vtable> to C<*whoami>.

=cut

*/

void
Parrot_vtable_set_name(Parrot_Interp interpreter, VTABLE *vtable, STRING *whoami) {
    vtable->whoami = whoami;
}

/*

=item C<void
Parrot_vtable_set_data(Parrot_Interp interpreter, VTABLE *vtable, void *stuff)>

Sets the data of C<*vtable> to C<*stuff>.

=cut

*/

void
Parrot_vtable_set_data(Parrot_Interp interpreter, VTABLE *vtable, void *stuff) {
    vtable->data = stuff;
}

/*

=item C<void
Parrot_destroy_vtable(Parrot_Interp interpreter, VTABLE *vtable)>

Destroys C<*vtable>.

=cut

*/

void
Parrot_destroy_vtable(Parrot_Interp interpreter, VTABLE *vtable) {
    mem_sys_free(vtable);
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
