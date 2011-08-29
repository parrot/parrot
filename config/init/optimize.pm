# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

config/init/optimize.pm - Optimization

=head1 DESCRIPTION

Enables optimization by adding the appropriate flags for the local platform to
the C<CCFLAGS>. Should this be part of config/inter/progs.pm ? XXX

=cut

package init::optimize;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    return {
        'description', 'Enable optimization',
        'result',      '',
    };
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->debug("\n");

    $conf->debug("(optimization options: init::optimize)\n");

    my $request_optimize = $conf->options->get('optimize') || '';

    if (! $request_optimize) {
        $self->set_result('no');
    }

    # A plain --optimize will mean: use -O2.  If an argument
    # is given, however, use that verbatim instead.
    my $optimization_level;
    if ( $request_optimize eq '1' ) {
        $optimization_level = '-O2';
    }
    else {
        $optimization_level = $request_optimize;
    }

    # save the options, however we got them.
    $conf->data->set( optimize => $optimization_level );
    $conf->debug("optimize options: ", $optimization_level, "\n");

    # disable debug flags.
    if ($conf->data->get('optimize')) {
        $conf->data->set( cc_debug => '' );
        $conf->data->add( ' ', ccflags => "-DDISABLE_GC_DEBUG=1 -DNDEBUG" );
    }

    # TT #405
    if ($conf->data->get('cpuarch') eq 'amd64') {
        $conf->data->set('optimize::src/gc/system.c','');
    }
    $self->set_result('yes');

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
