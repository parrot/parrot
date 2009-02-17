# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

t/configure/testlib/init/mu.pm - Module used in configuration tests

=cut

package init::mu;
use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining if your computer does mu};
    $data{args}        = [ qw( ) ];
    $data{result}      = q{};
    return \%data;
}

my $result = undef;

sub runstep {
    my ( $self, $conf ) = @_;
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
