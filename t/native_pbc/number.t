#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;

use Parrot::Test tests => 4;

=head1 NAME

t/native_pbc/number.t - Floating-Point Numbers

=head1 SYNOPSIS

        % prove t/native_pbc/number.t

=head1 DESCRIPTION

Tests word-size/float-type/endian-ness for different architectures.

These tests usually only work on releases, not on svn checkouts
and if every release has updated native pbc test files.

See F<tools/dev/mk_native_pbc> to create the platform-specific native pbcs.

=head1 PLATFORMS

  _1   i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  _2   i386 32 bit opcode_t, 32 bit intval, long double (linux-gcc-ix86)
  _3   PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc)
  _4   x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  _5   big-endian 64-bit                     (irix or similar)

=cut

=begin comment

# these are PBC files generated from t/op/number_1.pasm with
# different architectures
# if your wordsize/floattype/endianess is not covered here
# please add it:

  $ ./parrot -o n.pbc t/op/number_1.pasm
  $ make pbc_dump
  $ ./pbc_dump -h n.pbc
  $ mv n.pbc t/native_pbc/number_$(N).pbc

# then
# - increase number of tests
# - include the pbc_dump header info for reference
# - put the file into MANIFEST
# - add the file as binary (svn add) and commit it
# thanks -leo

On test failures please add the output of

  $ ./pbc_dump -h t/native_pbc/number_${N}.pbc

into your report. We need your wordsize/floattype/endianess.

=cut

my $output = << 'END_OUTPUT';
1
4
16
64
256
1024
4096
16384
65536
262144
1048576
4194304
16777216
67108864
268435456
1073741824
4294967296
17179869184
68719476736
274877906944
1099511627776
4398046511104
17592186044416
70368744177664
281474976710656
1.12589990684262e+15
END_OUTPUT

# execute t/native_pbc/number_1.pbc
#
# any ordinary intel 386 linux, cygwin, mingw, MSWin32, ...
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.0, bytecode-version 3.34
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
TODO: {
    local $TODO;
    if ($PConfig{ptrsize} == 8) {
        $TODO = "Known problem on 64bit with reading 32bit dirs. See TT #254"
    } elsif ($PConfig{DEVEL}) {
        $TODO = "devel versions are not guaranteed to succeed";
    }

pbc_output_is( undef, $output, "i386 double float 32 bit opcode_t" )
    or diag "May need to regenerate t/native_pbc/number_1.pbc; read test file";

pbc_output_is( undef, $output, "i386 long double float 32 bit opcode_t")
    or diag "May need to regenerate t/native_pbc/number_2.pbc; read test file";

}

# darwin/ppc:
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 1   (interpreter's byteorder       = 1)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.0, bytecode-version 3.34
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]

TODO: {
local $TODO = "devel versions are not guaranteed to succeed"
  if $PConfig{DEVEL};

pbc_output_is(undef, $output, "PPC double float 32 bit BE opcode_t")
    or diag "May need to regenerate t/native_pbc/number_3.pbc; read test file";

# any ordinary 64-bit intel unix:
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.0, bytecode-version 3.34
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]

pbc_output_is(undef, $output, "i86_64 LE 64 bit opcode_t, 64 bit intval")
    or diag "May need to regenerate t/native_pbc/number_4.pbc; read test file";

# Formerly there were also a test for:
# pbc_output_is(undef, $output, "big-endian 64-bit irix")
#   or diag "May need to regenerate t/native_pbc/number_5.pbc; read test file";

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
