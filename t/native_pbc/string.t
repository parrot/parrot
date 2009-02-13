#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;

use Parrot::Test tests => 1;

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

        % prove t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/string/endian-ness for different architectures.

These tests usually only work on releases, not on svn checkouts
and if every release has updated native pbc test files.

See F<tools/dev/mk_native_pbc> to create the platform-specific native pbcs.

=head1 PLATFORMS

  _1   i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  _2   i386 32 bit opcode_t, 32 bit intval, 12 bit long double (linux-gcc-ix86)
  _3   PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc)
  _4   x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  _5   x86_64 16 bit long double 64 bit opcode_t (linux-gcc-x86_64, solaris-cc-64int)
  _6   big-endian 64-bit                     (MIPS irix or similar)

=cut

=begin comment

The PBC is generated from t/op/string_133.pasm for different architectures.
Actually, there is a single architecture right now.

For adding tests, see the comments in t/native_pbc/number.t

=cut

my $output = << 'END_OUTPUT';
a2c
Í
Í
a2c
END_OUTPUT

# execute t/native_pbc/string_1.pbc
#
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
local $TODO = "devel versions are not guaranteed to succeed"
  if $PConfig{DEVEL};

pbc_output_is( undef, $output, "i386 32 bit opcode_t, 32 bit intval" );

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
