#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

	% perl -Ilib t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/string/endian-ness for different architectures.

=cut

use Parrot::Test tests => 1;

=begin comment

The PBC is generated from t/op/strings_133.pasm for different architectures.
Actually, there is a single architecture right now.

For adding tests, see the comments in t/native_pbc/number.t

=cut

SKIP: {
  skip("string changes", 1);

my $output = << 'END_OUTPUT';
a2c
Í
Í
a2c
END_OUTPUT

# execute t/native_pbc/string_1.pbc
#
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize    = 4)
#         int_size  = 4   (interpreter's INTVAL size = 4)
#         byteorder = 0   (interpreter's byteorder   = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE = 8)
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
pbc_output_is( undef, $output, "i386 32 bit opcode_t, 32 bit intval");

}
