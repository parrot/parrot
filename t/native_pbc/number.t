#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::BuildUtil;
use t::native_pbc::Test;

use Parrot::Test tests => 12;

# Testmatrix for coverage overview (GH #394)
# float conversion src: left-side (pbc) to dest: upper-side (platform)
# 1: tested ok, 0: fails (skip), ?: not yet tested (todo)
# S4: skip on 4 byte platform, S8: skip on 8 byte (64bit)
# T4: skip 4 byte test, T8: skip 8 byte test (64bit) (number_8_xx_xe.pbc)
# Note that the corresponding cvt_num* functions in F<pf_items.c> have odd names.
# The _le there is for reading.
# 8_16_le=>4_8_le fails, but 8_16_le=>8_8_le passes
my $testmatrix = <<EOF;
        8_le 10_le 16_le 8_be 16_be  4_le 4_be 16PPC_be
8_le     1     1    1     ?     0     ?    ?    ?
10_le    1     1    1     ?     0     ?    ?    ?
16_le    S4    1    1     ?     0     ?    ?    ?
8_be     1     1    1     1     1     ?    ?    ?
16_be    ?     ?    ?     ?     1     ?    ?    ?
4_le     ?     ?    ?     ?     ?     ?    ?    ?
4_be     ?     ?    ?     ?     ?     ?    ?    ?
16PPC_be 0     ?    ?     ?     ?     ?    ?    1
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
0
-0
-1
1
4
16
64
256
1024
4096
16384
-65536
-262144
-10.48576
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
4.398046511104
17592186044416
70368744177664
281474976710656
END_OUTPUT

$output =~ s/(\.\d{1,5})\d+/$1.'\d+'/eg;
# $output =~ s/(\d{7,9})\d+/$1.'[\d\.]+'/eg;
# $output =~ s/(\d{4,5})\d+/$1.'[\d\.]+'/eg;
my $qr = qr/$output/m;

sub test_pbc_number {
    my $id   = shift;
    my $desc = shift;
    test_native_pbc($id, "number", $qr, $desc, $skip, $todo);
}

# execute t/native_pbc/number_*.pbc
#
# any ordinary intel 386 linux, cygwin, mingw, MSWin32, ...
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
test_pbc_number('4_8_le', "little-endian 32 bit opcode_t, 4 byte intval, 8 byte double");

#         floattype = 1   (interpreter's NUMVAL_SIZE     = 12)
test_pbc_number('4_10_le', "i386 32 bit opcode_t, 4 byte intval, 80bit/12 byte long double");

# darwin/ppc:
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
test_pbc_number('4_8_be', "big-endian 32 bit opcode_t, 4 byte intval, 8 byte double");

# any ordinary 64-bit intel unix:
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
test_pbc_number('8_8_le', "little-endian 64 bit opcode_t, 8 byte intval, 8 byte double");

# x86_64 with floatval='long double'
#         floattype = 1   (interpreter's NUMVAL_SIZE     = 16)
test_pbc_number('8_10_le', "x86_64 64 bit opcode_t, 8 byte intval, 80bit/16 byte long double");

# x86_64 with floatval='__float128'
#         floattype = 2   (interpreter's NUMVAL_SIZE     = 16)
test_pbc_number('8_16_le', "little-endian 64 bit opcode_t, 8 byte intval, 16 byte __float128");

# PowerPC64 -m64
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
test_pbc_number('8_8_be', "big-endian 64 bit opcode_t, 8 byte intval, 8 byte double");

# sparc64/__float128 --floatval="long double"
#         floattype = 2   (interpreter's NUMVAL_SIZE     = 8)
test_pbc_number('8_16_be', "big-endian 64 bit opcode_t, 8 byte intval, 16 byte long double");
test_pbc_number('4_16_be', "big-endian 32 bit opcode_t, 4 byte intval, 16 byte long double");

# i386 --floatval=float
#         floattype = 3   (interpreter's NUMVAL_SIZE     = 4)
test_pbc_number('4_4_le', "little-endian 32 bit opcode_t, 4 byte intval, 4 byte single float");

# ppc --floatval=float
#         floattype = 3   (interpreter's NUMVAL_SIZE     = 4)
test_pbc_number('4_4_be', "big-endian 32 bit opcode_t, 4 byte intval, 4 byte single float");

# ppc --floatval="long double" -mlong-double-128
#         floattype = 4   (interpreter's NUMVAL_SIZE     = 16)
test_pbc_number('4_16PPC_be', "big-endian 32 bit opcode_t, 4 byte intval, 16 byte double double");

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

  4_10_le: i386 32 bit opcode_t, 4 byte intval, 12 byte long double
       (i386 with --floatval="long double")

  8_10_le: x86_64 64 bit opcode_t, 8 byte intval, 16 byte long double
       (--floatval="long double")

  8_16_le: x86_64 64 bit opcode_t, 8 byte intval, 16 byte long double
       (--floatval="__float128")

  8_16_be: big-endian 64 bit opcode_t, 8 byte intval, 16 byte long double
       (Sparc64/Solaris --floatval="long double")

  8_16PPC_be: powerpc 64 bit opcode_t, 8 byte intval, 16 byte double double
       (--floatval="long double")

  4_4_le: i386 32 bit opcode_t, 4 byte intval, 4 byte single float
       (i386 --floatval="float")

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

into your report. We need your wordsize/floattype/endianness.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
