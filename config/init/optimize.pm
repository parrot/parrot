# Copyright (C) 2001-2005, The Perl Foundation.
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
    my %data;
    $data{description} = q{Enable optimization};
    $data{result}      = q{};
    return \%data;
}

our $verbose;

sub runstep {
    my ( $self, $conf ) = @_;

    $verbose = $conf->options->get( 'verbose' );
    print "\n" if $verbose;

    print "(optimization options: init::optimize)\n"
        if $verbose;

    # A plain --optimize means use perl5's $Config{optimize}.  If an argument
    # is given, however, use that instead.
    my $optimize = $conf->options->get('optimize');
    if ( defined $optimize ) {
        $self->set_result('yes');

        # disable debug flags
        $conf->data->set( cc_debug => '' );
        $conf->data->add( ' ', ccflags => "-DDISABLE_GC_DEBUG=1 -DNDEBUG" );
        if ( $optimize eq "1" ) {

            # use perl5's value
            # gcc 4.1 doesn't like -mcpu=xx, i.e. it's deprecated
            my $opts = $conf->data->get_p5('optimize');
            my $gccversion = $conf->data->get( 'gccversion' );
            my $arch_opt = 'cpu';
            if ( defined $gccversion and $gccversion > 3.3 ) {
                $arch_opt = 'arch';
            }
            $opts =~ s/-mcpu=/-m$arch_opt=/;
            $conf->data->add( ' ', ccflags => $opts );
            print "opts: ", $opts, "\n" if $verbose;

            # record what optimization was enabled
            $conf->data->set( optimize => $opts );
        }
        else {

            # use what was passed to --optimize on the CLI
            $conf->data->add( ' ', ccflags => $optimize );

            # record what optimization was enabled
            $conf->data->set( optimize => $optimize );
        }
    }
    else {
        $self->set_result('no');
        print "(none requested) " if $conf->options->get('verbose');
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
