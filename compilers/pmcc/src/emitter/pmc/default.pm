# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 C<PMC::Emitter::PMC::default>

Specialised emitter for default PMC.

=over 4

=cut

class PMC::Emitter::PMC::default;

=item C<get_vtable_func>

Generate C-code for C<Parrot_default_get_vtable> and
C<Parrot_default_ro_get_vtable> functions.

=cut

method get_vtable_func() {
}

=item C<update_vtable_func>

Sorry, no update_vtable for default

=cut
method update_vtable_func() {
    "";
}


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
