#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/native_pbc/number.t - Floating-Point Numbers

=head1 SYNOPSIS

	% perl t/native_pbc/number.t

=head1 DESCRIPTION

Tests word-size/float-type/endian-ness for different architectures.

=cut

=begin comment

# these are PBC files generated from t/op/number_1.pasm with
# different architectures
# if your wordsize/floattype/endianess is not covered here
# please add it:

$ ./parrot -o n.pbc t/op/number_1.pasm
$ make pdump
$ ./pdump -h n.pbc
$ mv n.pbc t/native_pbc/number_$(N).pbc

# then
# - increase number of tests
# - include the pdump header info for reference
# - put the file into MANIFEST
# - add the file as binary (cvs add -kb) and commit it
# thanks -leo

=cut

# use Parrot::Test tests => 1;
use Parrot::Test;
 plan  skip_all => 'Ongoing PBC format changes';

my $output = << 'END_OUTPUT';
1.000000
4.000000
16.000000
64.000000
256.000000
1024.000000
4096.000000
16384.000000
65536.000000
262144.000000
1048576.000000
4194304.000000
16777216.000000
67108864.000000
268435456.000000
1073741824.000000
4294967296.000000
17179869184.000000
68719476736.000000
274877906944.000000
1099511627776.000000
4398046511104.000000
17592186044416.000000
70368744177664.000000
281474976710656.000000
1125899906842620.000000
END_OUTPUT

# execute t/native_pbc/number_1.pbc
#
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize    = 4)
#         int_size  = 4   (interpreter's INTVAL size = 4)
#         byteorder = 0   (interpreter's byteorder   = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE = 8)
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
pbc_output_is(undef, $output, "i386 double float 32 bit opcode_t");


# Formerly there were tests for:
# pbc_output_is(undef, <<OUTPUT, "i386 long double float 32 bit opcode_t");
# pbc_output_is(undef, <<OUTPUT, "PPC double float 32 bit BE opcode_t");
# pbc_output_is(undef, <<OUTPUT, "little-endian 64-bit tru64");
# pbc_output_is(undef, <<OUTPUT, "big-endian 64-bit irix");
