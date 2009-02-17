#! perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/dynpmc/digest.t - test the digest_group (MDx, RIPEMD, SHAx PMC)

=head1 SYNOPSIS

        % perl -Ilib t/dynpmc/digest.t

=head1 DESCRIPTION

Tests the C<digest_group> a libcrypto wrapper.

=cut

if ( $PConfig{has_crypto} ) {
    plan tests => 9;
}
else {
    plan skip_all => "No crypto library available";
}

pir_output_is( << 'CODE', << 'OUTPUT', 'MD2 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'MD2'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
MD2
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'MD4 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'MD4'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
MD4
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'MD5 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'MD5'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
MD5
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'RIPEMD160 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'RIPEMD160'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
RIPEMD160
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'SHA typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'SHA'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
SHA
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'SHA1 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'SHA1'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
SHA1
OUTPUT

SKIP: {
    skip( "Only with OpenSSL 0.9.8", 2 ) if ($PConfig{openssl_version} lt '0.9.8a');

pir_output_is( << 'CODE', << 'OUTPUT', 'SHA256 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'SHA256'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
SHA256
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'SHA512 typeof' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'SHA512'
    $S0 = typeof md
    print $S0
    print "\n"
.end
CODE
SHA512
OUTPUT
}

pir_output_is( << 'CODE', << 'OUTPUT', 'MD5 digest' );
.sub test :main
    $P0 = loadlib 'digest_group'
    .local pmc md
    md = new 'MD5'
    md.'Init'()
    $S0 = 'message digest'
    md.'Update'($S0)
    $S0 = md.'Final'()
    $P0 = split '', $S0
    new $P1, 'FixedPMCArray'
    set $P1, 1
  L1:
    unless $P0 goto L2
    $S1 = shift $P0
    $I1 = ord $S1
    $P1[0] = $I1
    $S2 = sprintf '%2x', $P1
    print $S2
    goto L1
  L2:
    print "\n"
.end
CODE
f96b697d7cb7938d525a2f31aaf161d0
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
