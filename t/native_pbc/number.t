#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::BuildUtil;
use t::native_pbc::Test;

use Parrot::Test tests => 7;

# Testmatrix for coverage overview (GH #394)
# float conversion src: left-side (pbc) to dest: upper-side (platform)
# 1: tested ok, 0: fails (skip), ?: not yet tested (todo)
# S4: skip on 4 byte platform, S8: skip on 8 byte (64bit)
# T4: skip 4 byte test, T8: skip 8 byte test (64bit) (number_8_xx_xe.pbc)
# Note that the corresponding cvt_num* functions in F<pf_items.c> have odd names.
# The _le there is for reading.
# 8_16_le=>4_8_le fails, but 8_16_le=>8_8_le passes
my $testmatrix = <<EOF;
        8_le 12_le 16_le 8_be 16_be  4_le 4_be
8_le     1     1    1     0     0     ?    ?
12_le    1     1    1     0     0     ?    ?
16_le    S4    1    1     0     0     ?    ?
8_be     1     1    1     1     1     ?    ?
16_be    ?     ?    ?     ?     1     ?    ?
4_le     ?     ?    ?     ?     ?     ?    ?
4_be     ?     ?    ?     ?     ?     ?    ?
EOF

my $arch = t::native_pbc::Test::num_arch();
# %todo and %skip lists of tests for your architecture.
#   e.g. for arch 8_le => 8_be => todo (4_8_le, 8_8_le )
sub generate_skip_list {
    my $arch = shift;
    my $check = shift;
    my %skip;
    my @lines = split /\n/, $testmatrix;
    my @dest  = split /\s+/, shift @lines;
    shift @dest unless $dest[0];
    my $i = 0;
    my %cols  = map { $_ => $i++ } @dest;
    my ($byte, $sarch) = $arch =~ m/^(\d)_(\d.+)$/;
    my $col = $cols{$sarch};  # the column for our arch
    for my $s (@lines) {
        my @s  = split /\s+/, $s;
        my $pbc = shift @s;
        if ($s[$col] eq $check) {
            $skip{"4_".$pbc}++;
            $skip{"8_".$pbc}++;
        }
        if (my ($b) = $s[$col] =~ /S(.)/) {
            if ($byte == $b) {
                $skip{"4_".$pbc}++;
                $skip{"8_".$pbc}++;
            }
        }
        if (my ($b) = $s[$col] =~ /T(.)/) {
            $skip{$b."_".$pbc}++;
        }
    }
    \%skip
}

my $todo = generate_skip_list($arch, '?');
my $skip = generate_skip_list($arch, '0');

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

sub test_pbc_number {
    my $id   = shift;
    my $desc = shift;
    test_native_pbc($id, "number", $output, $desc, $skip, $todo);
}

# execute t/native_pbc/number_*.pbc
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
test_pbc_number('4_8_le', "i386 32 bit opcode_t, 4 byte intval, 8 byte double");

# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 1   (interpreter's NUMVAL_SIZE     = 12)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_number('4_12_le', "i386 32 bit opcode_t, 4 byte intval, 12 byte long double");

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
test_pbc_number('4_8_be', "big-endian 32 bit opcode_t, 4 byte intval, 8 byte double");

# any ordinary 64-bit intel unix:
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 4.6.0, bytecode-version 12.0
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_number('8_8_le', "x86_64 64 bit opcode_t, 8 byte intval, 8 byte double");

# i86_64 with floatval='long double'
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 2   (interpreter's NUMVAL_SIZE     = 16)
#         parrot-version 4.6.0, bytecode-version 12.0
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_number('8_16_le', "x86_64 64 bit opcode_t, 8 byte intval, 16 byte long double");

# PowerPC64 -m64
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 1   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         *need* endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_number('8_8_be', "big-endian 64 bit opcode_t, 8 byte intval, 8 byte double");

# ppc/mips -m64 --floatval="long double"
# HEADER => [
#         wordsize  = 8   (interpreter's wordsize/INTVAL = 8/8)
#         byteorder = 1   (interpreter's byteorder       = 0)
#         floattype = 2   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.38
#         UUID type = 0, UUID size = 0
#         *need* endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_number('8_16_be', "big-endian 64 bit opcode_t, 8 byte intval, 16 byte long double");

# i386 --floatval=float
#test_pbc_number('4_4_le', "i386 32 bit opcode_t, 4 byte intval, 4 byte single float");

# ppc -m32 --floatval=float
#test_pbc_number('4_4_be', "big-endian 32 bit opcode_t, 4 byte intval, 4 byte single float");

=head1 NAME

t/native_pbc/number.t - Native Floating-Point Numbers

=head1 SYNOPSIS

        % prove t/native_pbc/number.t

=head1 DESCRIPTION

Tests word-size/float-type/endian-ness for different architectures.

These tests usually only work on updated native pbc test files.
See F<tools/dev/mk_native_pbc> to create the platform-specific
native pbcs on 4 different machines.

=head1 PLATFORMS

The id consists of ptrsize in byte, numvalsize in bytes and le/be for
little/big-endian.


  4_8_le: i386 32 bit opcode_t, 4 byte intval, 8 byte double
       (linux-gcc-i386, freebsd-gcc, cygwin, ...)

  4_8_be: PPC BE 32 bit opcode_t, 4 byte intval, 8 byte double
       (darwin-ppc or sparc32)

  8_8_le: x86_64 64 bit opcode_t, 8 byte intval, 8 byte double
       (linux-gcc-x86_64 resp. amd64, solaris-cc-64int)

  8_8_be: big-endian 64 bit opcode_t, 8 byte intval, 8 byte double
       (Sparc64/Solaris, MIPS irix or similar)

  4_12_le: i386 32 bit opcode_t, 4 byte intval, 12 byte long double
       (linux-gcc-i386 or cygwin with --floatval="long double")

  8_16_le: x86_64 64 bit opcode_t, 8 byte intval, 16 byte long double
       (linux-gcc-x86_64, solaris-cc-64int --floatval="long double")

  8_16_be: big-endian 64 bit opcode_t, 8 byte intval, 16 byte long double
       (Sparc64/Solaris --floatval="long double")

  4_4_le: i386 32 bit opcode_t, 4 byte intval, 4 byte single float
       (linux-gcc-i386 or cygwin with --floatval="float")

  4_4_be: big-endian 32 bit opcode_t, 4 byte intval, 4 byte single float
       (darwin or debian/ppc with --floatval="float")

=cut


=begin comment

# These are PBC files generated from F<t/native_pbc/testdata/number.pasm> with
# different architectures.
# If your wordsize/floattype/endianess is not covered here
# please add it:

  $ ./parrot -o n.pbc t/native_pbc/testdata/number.pasm
  $ make pbc_dump
  $ ./pbc_dump -h n.pbc
  $ mv n.pbc t/native_pbc/number_$(id).pbc

# then
# - increase number of tests
# - include the pbc_dump header info for reference
# - put the file into MANIFEST
# - then add the file with "git add" and commit it
# thanks -leo and reini

On test failures please add the output of

  $ ./pbc_dump -h t/native_pbc/number_${id}.pbc

into your report. We need your wordsize/floattype/endianess.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
