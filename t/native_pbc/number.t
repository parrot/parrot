#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;

use Parrot::Test skip_all => "Ongoing work in TT #254";

=head1 NAME

t/native_pbc/number.t - Floating-Point Numbers

=head1 SYNOPSIS

        % prove t/native_pbc/number.t

=head1 DESCRIPTION

Tests word-size/float-type/endian-ness for different architectures.

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
local $TODO = "Known problem on 64bit with reading 32bit dirs. See TT #254"
  if $PConfig{ptrsize} == 8;

pbc_output_is( undef, $output, "i386 double float 32 bit opcode_t" )
    or diag "May need to regenerate t/native_pbc/number_1.pbc; read test file";

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
pbc_output_is(undef, $output, "PPC double float 32 bit BE opcode_t")
    or diag "May need to regenerate t/native_pbc/number_2.pbc; read test file";
}

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
TODO: {
local $TODO = "Known problem on 64bit double-float gentoo-amd64, but not solaris-64int. See TT #254"
  if $PConfig{ptrsize} == 8;

pbc_output_is(undef, $output, "x86_64 double float 64 bit opcode_t")
    or diag "May need to regenerate t/native_pbc/number_3.pbc; read test file";
}

# Formerly there were tests for:
# pbc_output_is(undef, <<OUTPUT, "i386 long double float 32 bit opcode_t"); #_2
# pbc_output_is(undef, <<OUTPUT, "little-endian 64-bit tru64");             #_4
# pbc_output_is(undef, <<OUTPUT, "big-endian 64-bit irix");                 #_5

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
