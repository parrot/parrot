#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test skip_all => 'ongoing PBC format changes'; # tests => 1;

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

        % prove t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/string/endian-ness for different architectures.

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
pbc_output_is( undef, $output, "i386 32 bit opcode_t, 32 bit intval" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
