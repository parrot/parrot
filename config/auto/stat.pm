# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/stat.pm - stat extension detection

=head1 DESCRIPTION

Determining if the system has BSD stat extensions.

=cut

package auto::stat;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Detect stat type};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $bsd_stat = 0;

    $conf->cc_gen('config/auto/stat/test_c.in');
    eval { $conf->cc_build(); };
    if (!$@) {
        my $output = eval { $conf->cc_run() };
        if (!$@ && $output =~ /OK/) {
	    $bsd_stat = 1;
	}
    }
    $conf->cc_clean();

    if ($bsd_stat) {
        $conf->data->set( HAS_BSD_STAT_EXTN => 1 );
        $self->set_result('bsd');
    }
    else {
	$conf->data->set( HAS_BSD_STAT_EXTN => 0 );
	$self->set_result('posix');
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

