# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/zlib.pm - Test for zlib library

=head1 DESCRIPTION

This library is linked to a dynamic PMC.

=cut

package auto::zlib;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your platform support zlib};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $without = $conf->options->get( qw| without-zlib | );

    if ($without) {
        $conf->data->set( has_zlib => 0 );
        $self->set_result('no');
        return 1;
    }

    my $osname = $conf->data->get('osname');

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $conf->data->get('cc'),
        win32_nongcc    => 'zlib.lib',
        default         => '-lz',
    } );

    $conf->cc_gen('config/auto/zlib/zlib_c.in');
    eval { $conf->cc_build( q{}, $extra_libs); };
    my $has_zlib = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_zlib = $self->_evaluate_cc_run($conf, $test, $has_zlib);
    }
    $conf->data->set( has_zlib => $has_zlib );
    $self->set_result($has_zlib ? 'yes' : 'no');

    return 1;
}

sub _evaluate_cc_run {
    my $self = shift;
    my ($conf, $test, $has_zlib) = @_;
    if ( $test =~ m/^(\d\.\d\.\d)/ ) {
        my $version = $1;
        $has_zlib = 1;
        $conf->debug(" (yes) ");
        $self->set_result("yes, $version");
    }
    return $has_zlib;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
