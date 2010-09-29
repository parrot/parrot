# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/timespec.pm - Timespec detection

=head1 DESCRIPTION

Determining if the system has C<struct timespec> defined.

=cut

package auto::timespec;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your system has timespec};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->cc_gen('config/auto/timespec/test_c.in');
    eval { $conf->cc_build(); };
    if ($@) {
        $conf->data->set( HAS_TIMESPEC => 0 );
        $self->set_result('no');
    }
    else {
        $conf->data->set( HAS_TIMESPEC => 1 );
        $self->set_result('yes');
    }
    $conf->cc_clean();

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

