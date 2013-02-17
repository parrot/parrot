#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::BuildUtil;
use t::native_pbc::Test;

use Parrot::Test tests => 4;

=head1 NAME

t/native_pbc/integer.t - Integers

=head1 SYNOPSIS

        % prove t/native_pbc/integer.t

=head1 DESCRIPTION

Tests word-size/float-type/endian-ness for different architectures.

These tests usually only work on updated native pbc test files.
See F<tools/dev/mk_native_pbc> to create the platform-specific
native pbcs.

=head1 PLATFORMS

The id consists of ptrsize+intvalsize in byte and le/be for
little/big-endian.
Systems with different ptrsize + intvalsize (i.e. perl -V:use64bitint) may not be
used to generate native pbc's.

  4_le: i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  4_be: PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc, sparc32 or mips32)
  8_le: x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  8_be: big-endian 64 bit opcode_t, 8 byte double (Sparc64, mips64, ppc64)

=cut

=begin comment

See t/native_pbc/number.t for additional comments.
See tools/dev/mk_native_pbc to create the platform-specific native pbc's.

Test files on different architectures are generated by:

  $ parrot -o t/native_pbc/integer_${id}.pbc t/native_pbc/testdata/integer.pasm

The output of

  $ pbc_dump -h t/native_pbc/integer_${id}.pbc

should be included for reference.

On test failures please add the output of

  $ ./pbc_dump -h t/native_pbc/integer_${id}.pbc

into your report. We need your wordsize/floattype/endianess.

=cut

# expected result
my $output = '270544960';

sub test_pbc_integer {
    my $id   = shift;
    my $desc = shift;
    test_native_pbc($id, "integer", $output, $desc, {}, {});
}

# execute the file t/native_pbc/integer_1.pbc
#
# any ordinary intel 386 linux, cygwin, mingw, MSWin32, ...
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_integer('4_le', "i386 32 bit opcode_t, 4 byte intval, 8 byte double");

# darwin/ppc:
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 1   (interpreter's byteorder       = 1)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_integer('4_be', "big-endian 32 bit opcode_t, 4 byte intval, 8 byte double");

# any ordinary 64-bit intel unix:
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_integer('8_le', "x86_64 64 bit opcode_t, 8 byte intval, 8 byte double");

# sparc64/ppc64/mips64
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 1   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         *need* endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_integer('8_be', "big-endian 64 bit opcode_t, 8 byte intval, 8 byte double");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
