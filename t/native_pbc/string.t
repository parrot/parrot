#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use t::native_pbc::Test;

use Parrot::Test tests => 4;

# 4th string as utf8 "Ärger"
my $output = "
%Ec
\xC2\x80
ABCX
\xC3\x84rger
";

sub test_pbc_string {
    my $id   = shift;
    my $desc = shift;
    test_native_pbc($id, "string", $output, $desc, {}, {});
}

# execute t/native_pbc/string_1.pbc
#
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 4.6.0, bytecode-version 12.0
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_string("4_le","i386 32 bit opcode_t, 4 byte intval" );
test_pbc_string("4_be","big-endian 32 bit opcode_t, 4 byte intval");
test_pbc_string("8_le","x86_64 64 bit opcode_t, 8 byte intval");
test_pbc_string("8_be","big-endian 64 bit opcode_t, 8 byte intval");

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

        % prove t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/endian-ness for different architectures.

We test 4+8 byte opcode_t with le and be, binary and utf8 encoding.
More foreign encodings (TODO) and charsets are tested within F<t/op/strings.t>
and F<t/op/strings_cs.t>

These tests usually only work on updated native pbc test files.
See F<tools/dev/mk_native_pbc> to create the platform-specific
native pbcs.

=head1 PLATFORMS

The id consists of ptrsize=intvalsize in byte and le/be for
little/big-endian.
Systems with different ptrsize + intvalsize (i.e. perl -V:use64bitint) may not be
used to generate native pbc's.

  4_le: i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  4_be: PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc, sparc32 or mips32)
  8_le: x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  8_be: big-endian 64 bit opcode_t, 8 byte double (Sparc64, mips64, ppc64)

=cut

=begin comment

The PBC is generated from t/native_pbc/testdata/string.pasm for different architectures.

For adding tests, see the comments in t/native_pbc/number.t

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
