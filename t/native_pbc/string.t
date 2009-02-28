#! perl
# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::BuildUtil;

use Parrot::Test tests => 1;

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

        % prove t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/endian-ness for different architectures.
TODO: Test foreign charsets and encodings.

These tests usually only work on updated native pbc test files.
See F<tools/dev/mk_native_pbc> to create the platform-specific
native pbcs.

=head1 PLATFORMS

  _1   i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  _2   i386 32 bit opcode_t, 32 bit intval, 12 bit long double (linux-gcc-ix86)
  _3   PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc)
  _4   x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  _5   x86_64 16 bit long double 64 bit opcode_t (linux-gcc-x86_64, solaris-cc-64int)
  _6   big-endian 64 bit opcode_t, 8 byte double (Sparc64/Solaris, MIPS irix)
  _7   big-endian 64 bit opcode_t, 16 byte long double (Sparc64/Solaris, MIPS irix)

=cut

=begin comment

The PBC is generated from t/op/string_133.pasm for different architectures.
Actually, there is a single architecture right now.

For adding tests, see the comments in t/native_pbc/number.t

=cut

sub bc_version($) {
    my $f = shift;
    my $b;
    open my $F, "<", "$f" or return "Can't open $f: $!";
    binmode $F;
    seek $F, 14, 0;
    read $F, $b, 8;
    my ($bc_major, $bc_minor) = unpack "cc", $b;
    return ($bc_major . "." . $bc_minor);
}
my ( $bc_major, $bc_minor ) = Parrot::BuildUtil::get_bc_version();
my $bc = ($bc_major . "." . $bc_minor);

my $output = << 'END_OUTPUT';
%Ec
Dw
ABCX
   X
END_OUTPUT

# execute t/native_pbc/string_1.pbc
#
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.36
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
SKIP: {
    skip "Need to regenerate t/native_pbc/string_1.pbc; read test file", 1
      if ($bc ne bc_version("t/native_pbc/string_1.pbc"));

    pbc_output_is( undef, $output, "i386 LE 32 bit opcode_t" );
}
#pbc_output_is( undef, $output, "i386 LE 32 bit opcode_t, 12-byte long double" );
#pbc_output_is( undef, $output, "PPC BE 32 bit opcode_t" );
#pbc_output_is( undef, $output, "i86_64 LE 64 bit opcode_t" );
#pbc_output_is( undef, $output, "i86_64 LE 64 bit opcode_t, 16-byte long double" );
#pbc_output_is( undef, $output, "64bit BE 64 bit opcode_t" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
