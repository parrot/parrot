# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/crypto.pm - Test for crypto library (libssl)

=head1 DESCRIPTION

This library is linked to a dynamic PMC.

See L<http://www.openssl.org>

=cut

package auto::crypto;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your platform support crypto};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $verbose, $without ) = $conf->options->get(
        qw|
            verbose
            without-crypto
        |
    );

    if ($without) {
        $conf->data->set( has_crypto => 0 );
        $self->set_result('no');
        return 1;
    }

    my $osname = $conf->data->get_p5('OSNAME');

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $conf->data->get('cc'),
        win32_nongcc    => 'libcrypto.lib',
        default         => '-lcrypto',
    } );

    $conf->cc_gen('config/auto/crypto/crypto_c.in');
    eval { $conf->cc_build( q{}, $extra_libs); };
    my $has_crypto = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_crypto = $self->_evaluate_cc_run($conf, $test, $has_crypto, $verbose);
    }
    $conf->data->set( has_crypto => $has_crypto );    # for dynpmc.in & digest.t

    return 1;
}

sub _evaluate_cc_run {
    my $self = shift;
    my ($conf, $test, $has_crypto, $verbose) = @_;
    if ( $test =~ m/^OpenSSL (\d\.\d\.\d\w?)/ ) {
        my $version = $1;
        $has_crypto = 1;
        $conf->data->set( openssl_version => $version );
        print " (yes) " if $verbose;
        $self->set_result("yes, $version");
    }
    return $has_crypto;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
