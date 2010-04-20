# Copyright (C) 2008-2010, Parrot Foundation.
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
        MD4         => {
            md_result => 'd9130a8164549fe818874806e1c7014b',
        },
        MD5         => {
            md_result => 'f96b697d7cb7938d525a2f31aaf161d0',
        },
        RIPEMD160   => {
            md_result => '5d0689ef49d2fae572b881b123a85ffa21595f36',
            md_inc => 'ripemd',
        },
        SHA         => {
            md_result => 'c1b0f222d150ebb9aa36a40cafdc8bcbed830b14',,
        },
        SHA1        => {
            md_result => 'c12252ceda8be8994d5fa0290a47231c1d16aae3',
            md_inc => 'sha',
            md_ctx => 'SHA_CTX',
            md_digest => 'SHA_DIGEST',
        },
        SHA256      => {
            md_result => 'f7846f55cf23e14eebeab5b4e1550cad5b509e3348fbc4efa3a1413d393cb650',
            md_inc => 'sha',
            version_needed => '0.9.8a',
        },
        SHA512      => {
            md_result => '107dbf389d9e9f71a3a95f6c055b9251bc5268c2be16d6c13492ea45b0199f3309e16455ab1e96118e8a905d5597b72038ddb372a89826046de66687bb420e7c',
            md_inc => 'sha',
            version_needed => '0.9.8a',
        },
    };
    $data{digest_pmc_template} = 'config/gen/crypto/digest_pmc.in';
    $data{digest_t_template} = 'config/gen/crypto/digest_t.in';
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
        $conf->data->set( TEMP_md_name => $md );
        $conf->data->set( TEMP_md_file => $file );
        $conf->data->set( TEMP_md_inc => $val->{md_inc} || $file );
        $conf->data->set( TEMP_md_ctx => $val->{md_ctx} || $md . '_CTX' );
        $conf->data->set( TEMP_md_digest => $val->{md_digest} || $md . '_DIGEST' );
        $conf->data->set( TEMP_md_guard => (
                ( exists $val->{version_needed} )
                    and
                ( $openssl_version lt $val->{version_needed} )
            )
            ? '#if 0'
            : '#ifndef OPENSSL_NO_' . $md
        );
        $conf->data->set( TEMP_md_skip => $val->{version_needed} || '0.9' );
        $conf->data->set( TEMP_md_result => $val->{md_result} );
        $conf->genfile( $self->{digest_pmc_template} => "src/dynpmc/${file}.pmc" );
        $conf->genfile( $self->{digest_t_template} => "t/dynpmc/${file}.t" );
    }
    $conf->cc_clean();

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
