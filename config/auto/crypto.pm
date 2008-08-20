# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/crypto.pm - Test for crypto library (libssl)

=head1 DESCRIPTION

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

    my $cc        = $conf->data->get('cc');
    my $libs      = $conf->data->get('libs');
    my $linkflags = $conf->data->get('linkflags');
    my $ccflags   = $conf->data->get('ccflags');

    my $osname = $conf->data->get_p5('OSNAME');

    $self->_add_to_libs( {
        conf            => $conf,
        osname          => $osname,
        cc              => $cc,
        win32_nongcc    => 'libcrypto.lib',
        default         => '-lcrypto',
    } );

    $conf->cc_gen('config/auto/crypto/crypto.in');
    eval { $conf->cc_build(); };
    my $has_crypto = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_crypto = $self->_evaluate_cc_run($conf, $test, $has_crypto, $verbose);
    }
    unless ($has_crypto) {
        # The Parrot::Configure settings might have changed while class ran
        $self->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
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
