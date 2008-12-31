## $Id$

=head1 TITLE

Object - Pipp Object class

=head1 DESCRIPTION

This file sets up the base classes and methods for Pipp's
object system.  Differences (and conflicts) between Parrot's
object model and the PHP model means we have to do a little
name and method trickery here and there, and this file takes
care of much of that.

This is heavily based on Rakudo's Object.pir

=cut

.namespace []
.sub '' :anon :init :load
    load_bytecode 'PCT.pbc'

    $P0 = get_root_global ['parrot'], 'P6metaclass'
    $P0.'new_class'('PippObject', 'name'=>'Object')

    .local pmc p6meta
    p6meta = $P0.'HOW'()
    set_hll_global ['PippObject'], '$!P6META', p6meta
.end

.namespace ['PippObject']

=head2 Methods

=over 4

=item WHENCE()

Return the invocant's auto-vivification closure.

=cut

.sub 'WHENCE' :method
    $P0 = self.'WHAT'()
    $P1 = $P0.'WHENCE'()
    .return ($P1)
.end

=back

=head2 Private methods

=over 4

=back

=head2 Vtable functions

=cut

.namespace ['PippObject']

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
