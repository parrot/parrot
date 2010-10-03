# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/infnan.pm - detect INFINITY and NAN

=head1 DESCRIPTION

Determining if the system has INFINITY and NAN defined in headers.

=cut

package auto::infnan;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Are INFINITY and NAN defined};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $infnan = 0;

    $conf->cc_gen('config/auto/infnan/test_c.in');
    eval { $conf->cc_build(); };
    if (!$@) {
        my $output = eval { $conf->cc_run() };
        if (!$@ && $output =~ /OK/) {
            $infnan = 1;
        }
    }
    $conf->cc_clean();

    if ($infnan) {
        $conf->data->set( HAS_INF_NAN => 1 );
        $self->set_result('yes');
    }
    else {
        $conf->data->set( HAS_INF_NAN => 0 );
        $self->set_result('no');
    }

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

