# Copyright (C) 2007, Parrot Foundation.
# $Id$

=head1 Parrot::Pmc2c::SharedRef Instance Methods

=over 4

=cut

package Parrot::Pmc2c::PMC::SharedRef;
use base 'Parrot::Pmc2c::PMC::Ref';
use strict;
use warnings;

=item C<prederef($method)>

Returns code that will lock the PMC for calling the underlying
implementation of $method.

=cut

sub prederef {
    my ( $self, $method ) = @_;
    return 'LOCK_PMC(interp, pmc);';
}

=item C<postderef($method)>

Returns the unlocking code.

=cut

sub postderef {
    my ( $self, $method ) = @_;
    return 'UNLOCK_PMC(interp, pmc);';
}

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
