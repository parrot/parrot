# Copyright (C) 2001-2007, Parrot Foundation.

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

    my $ipv6_status = 0;

    $conf->cc_gen('config/auto/ipv6/test.in');
    eval { $conf->cc_build(); };
    if (!$@) {
        my $output = eval { $conf->cc_run_capture() };
        if (!$@ && $output =~ /OK/) {
            $ipv6_status = 1;
        }
        else {
            $conf->debug("ipv6 not detected: <$@> <$output>");
        }
    }
    $conf->cc_clean();
    $self->_handle_ipv6_status($conf, $ipv6_status);

    return 1;
}

sub _handle_ipv6_status {
    my ($self, $conf, $ipv6_status) = @_;
    $conf->data->set( HAS_IPV6 => 1) if $ipv6_status;
    $ipv6_status
        ? $self->set_result('yes')
        : $self->set_result('no');
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
