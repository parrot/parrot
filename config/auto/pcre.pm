# Copyright (C) 2008, The Perl Foundation.
# $Id $

=head1 NAME

config/auto/pcre.pm - Probe for pcre library

=head1 DESCRIPTION

Determines whether the platform supports pcre library.

=cut

package auto::pcre;

use strict;
use warnings;
use File::Spec;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your platform support pcre};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $verbose, $without ) = $conf->options->get(
        qw|
            verbose
            without-pcre
        |
    );

    if ($without) {
        $conf->data->set( HAS_PCRE => 0 );
        $self->set_result('no');
        return 1;
    }

    my $cc        = $conf->data->get('cc');
    my $libs      = $conf->data->get('libs');
    my $linkflags = $conf->data->get('linkflags');
    my $ccflags   = $conf->data->get('ccflags');

    my $osname = $conf->data->get_p5('OSNAME');

    $self->_add_to_libs( {
        conf            => $conf,
        osname          => $osname,
        cc              => $cc,
        win32_nongcc    => 'pcre.lib',
        default         => '-lpcre',
    } );

    # On OS X check the presence of the pcre headers in the standard
    # Fink/macports locations.
    $self->_handle_darwin_for_fink    ($conf, $osname, 'pcre.h');
    $self->_handle_darwin_for_macports($conf, $osname, 'pcre.h');

    $conf->cc_gen('config/auto/pcre/pcre.in');
    eval { $conf->cc_build() };
    my $has_pcre = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_pcre = $self->_evaluate_cc_run($test, $verbose);
    }
    if (! $has_pcre) {
        # The Parrot::Configure settings might have changed while class ran
        $self->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
    }
    $conf->data->set( HAS_PCRE => $has_pcre);

    return 1;
}

sub _evaluate_cc_run {
    my $self = shift;
    my ($test, $verbose) = @_;
    my $has_pcre = 0;
    if ( $test =~ /pcre (\d+\.\d+)/ ) {
        my $pcre_version = $1;
        $has_pcre = 1;
        print " (yes, $pcre_version) " if $verbose;
        $self->set_result("yes, $pcre_version");
    }
    return $has_pcre;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
