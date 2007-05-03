# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

t/configure/testlib/init/zeta.pm - Module used in configuration tests

=cut

package init::zeta;
use strict;
use warnings;
use vars qw($description @args);
# use vars qw($description @args $step);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = 'Determining if your computer does zeta';
@args = ();

my $result = q|Hello world|;
sub runstep {
    my ( $self, $conf ) = @_;
    $self->set_result( $result );
    return $self;
#    $self->result();
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
