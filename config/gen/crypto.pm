# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

config/gen/crypto.pm - Digest PMC Files

=head1 DESCRIPTION

Generates Digest PMC files.

=cut

package gen::crypto;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generate Digest PMC files};
    $data{result}      = q{};
    $data{digest}      = {
        MD2         => {},
        MD4         => {},
        MD5         => {},
        RIPEMD160   => {
            md_inc => 'ripemd',
        },
        SHA         => {},
        SHA1        => {
            md_inc => 'sha',
            md_ctx => 'SHA_CTX',
            md_digest => 'SHA_DIGEST',
        },
        SHA256      => {
            md_inc => 'sha',
            version_needed => '0.9.8a',
        },
        SHA512      => {
            md_inc => 'sha',
            version_needed => '0.9.8a',
        },
    };
    $data{digest_pmc_template} = 'config/gen/crypto/digest_pmc.in';
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    if ( ! $conf->data->get('has_crypto') ) {
        $self->set_result('skipped');
        return 1;
    }

    my $openssl_version  = $conf->data->get('openssl_version');

    while (my ($md, $val) = each %{ $self->{digest} } ) {
        my $file = lc $md;
        $conf->data->set( md_name => $md );
        $conf->data->set( md_file => $file );
        $conf->data->set( md_inc => $val->{md_inc} || $file );
        $conf->data->set( md_ctx => $val->{md_ctx} || $md . '_CTX' );
        $conf->data->set( md_digest => $val->{md_digest} || $md . '_DIGEST' );
        $conf->data->set( md_guard => (
                ( exists $val->{version_needed} )
                    and
                ( $openssl_version lt $val->{version_needed} )
            )
            ? '#if 0'
            : '#ifndef OPENSSL_NO_' . $md
        );
        $conf->genfile( $self->{digest_pmc_template} => "src/dynpmc/${file}.pmc" );
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
