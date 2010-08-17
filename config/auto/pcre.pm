# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/pcre.pm - Probe for pcre library

=head1 DESCRIPTION

Determines whether the platform supports pcre library.

This library is used via NCI mechanism.

=cut

package auto::pcre;

use strict;
use warnings;

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

    my $without = $conf->options->get( qw| without-pcre | );

    if ($without) {
        $conf->data->set( HAS_PCRE => 0 );
        $self->set_result('no');
        return 1;
    }

    my $osname = $conf->data->get('osname');

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $conf->data->get('cc'),
        win32_nongcc    => 'pcre.lib',
        default         => '-lpcre',
    } );

    $conf->cc_gen('config/auto/pcre/pcre_c.in');
    eval { $conf->cc_build( q{}, $extra_libs ) };
    my $has_pcre = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_pcre = $self->_evaluate_cc_run($conf, $test);
    }
    $conf->data->set( HAS_PCRE => $has_pcre);

    return 1;
}

sub _evaluate_cc_run {
    my $self = shift;
    my ($conf, $test) = @_;
    my $has_pcre = 0;
    if ( $test =~ /pcre (\d+\.\d+)/ ) {
        my $pcre_version = $1;
        $has_pcre = 1;
        $conf->debug(" (yes, $pcre_version) ");
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
