# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/thread.pm - Thread support

=head1 DESCRIPTION

Determining if the system has a Thread support.

=cut

package auto::thread;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your system has thread};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $without = $conf->options->get( qw| without-threads |);

    if ($without) {
        $conf->data->set( HAS_THREADS => 0 );
        $self->set_result('no');
        return 1;
    }

    if ($conf->data->get('osname') eq 'MSWin32'
     || $conf->data->get('i_pthread') eq 'define') {
        $conf->data->set( HAS_THREADS => 1 );
        $self->set_result('yes');
    }
    else {
        $conf->data->set( HAS_THREADS => 0 );
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
