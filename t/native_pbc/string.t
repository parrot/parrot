#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

	% perl -Ilib t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/string/endian-ness for different architectures.

=cut

use Parrot::Test tests => 2;

SKIP:
{
  skip("utf8 IO changes", 2);

output_is(<<CODE, <<OUTPUT, "angstrom 32 bit PPC BE");
# string_1.pbc s. t/op/string_133
CODE
\xe2\x84\xab
OUTPUT

output_is(<<CODE, <<OUTPUT, "angstrom 32 bit x86 LE");
# string_2.pbc s. t/op/string_133
CODE
\xe2\x84\xab
OUTPUT

}
