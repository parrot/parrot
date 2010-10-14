# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/ipv6.pm - determine ipv6 capabilities of local machine

=head1 DESCRIPTION

This configuration step probes the local machine to determine if it capable of
running an ipv6 stack.

=cut

package auto::ipv6;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine IPV6 capabilities};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->cc_gen('config/auto/ipv6/test.in');
    $conf->cc_clean();
    $self->set_result();
    $conf->data->set( ipv6 => undef );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
