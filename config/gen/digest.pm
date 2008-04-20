# Copyright (C) 2008, The Perl Foundation.
# $Id: $

=head1 NAME

config/gen/digest.pm - Digest PMC Files

=head1 DESCRIPTION

Generates Digest PMC files.

=cut

package gen::digest;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generating Digest PMC files};
    $data{result}      = q{};
    return \%data;
}

my %digest = (
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
    SHA256      => {},
    SHA512      => {},
);

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose  = $conf->options->get('verbose');
    unless ( $conf->data->get('has_crypto') ) {
        $self->set_result('skipped');
        return 1;
    }

#    for my $md (keys %digest) {
    while (my ($md, $val) = each(%digest)) {
        my $file = lc $md;
        $conf->data->set( md_name => $md );
        $conf->data->set( md_file => $file );
        $conf->data->set( md_inc => $val->{md_inc} || $file );
        $conf->data->set( md_ctx => $val->{md_ctx} || $md . '_CTX' );
        $conf->data->set( md_digest => $val->{md_digest} || $md . '_DIGEST' );
        $conf->genfile(
            'config/gen/digest/digest_pmc.in' => "src/dynpmc/${file}.pmc",
            comment_type => '/*',
        );
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
