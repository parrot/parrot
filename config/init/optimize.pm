# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

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
    my $optimize = $conf->options->get('optimize');

    if (! defined $optimize) {
        $self->set_result('no');
        $conf->debug("(none requested) ");
        return 1;
    }

    $self->set_result('yes');
    my $gccversion = $conf->data->get( 'gccversion' );

    my $options;
    if ( $optimize eq "1" ) {
        # start with perl5's flags ...
        $options = $conf->data->get('optimize_provisional');

        # ... but gcc 4.1 doesn't like -mcpu=xx, i.e. it's deprecated
        if ( defined $gccversion and $gccversion > 3.3 ) {
            $options =~ s/-mcpu=/-march=/;
        }
    }
    else {
        # use the command line verbatim
        $options = $optimize;
    }

    # save the options, however we got them.
    $conf->data->set( optimize => $options );
    $conf->debug("optimize options: ", $options, "\n");

    # disable debug flags.
    $conf->data->set( cc_debug => '' );
    $conf->data->add( ' ', ccflags => "-DDISABLE_GC_DEBUG=1 -DNDEBUG" );

    # TT #405
    if ($conf->data->get('cpuarch') eq 'amd64') {
        $conf->data->set('optimize::src/gc/system.c','');
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
