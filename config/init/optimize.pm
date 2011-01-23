# Copyright (C) 2001-2010, Parrot Foundation.

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

    # A plain --optimize means use perl5's $Config{optimize}.  If an argument
    # is given, however, use that instead.
    my $request_optimize = $conf->options->get('optimize') || '';

    if (! $request_optimize) {
        $self->set_result('no');
        $conf->debug("(none requested) ");
        return 1;
    }

    my $optimization_level;
    if ( $request_optimize eq '1' ) {
        # i.e., if command-line has '--optimize',
        # start with perl5's flags ...
        $optimization_level = $conf->data->get('optimize_provisional');

        # ... but gcc 4.1 doesn't like -mcpu=xx, i.e. it's deprecated
        my $gccversion = $conf->data->get( 'gccversion' );
        if ( defined $gccversion and $gccversion > 3.3 ) {
            $optimization_level =~ s/-mcpu=/-march=/;
        }
    }
    else {
        # Otherwise, use the command-line verbatim, e.g. '--optimize=O3'
        $optimization_level = $request_optimize;
    }

    # save the options, however we got them.
    $conf->data->set( optimize => $optimization_level );
    $conf->debug("optimize options: ", $optimization_level, "\n");

    # disable debug flags.
    $conf->data->set( cc_debug => '' );
    $conf->data->add( ' ', ccflags => "-DDISABLE_GC_DEBUG=1 -DNDEBUG" );

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
