#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/ifunless.t - If/Unless

=head1 SYNOPSIS

	% perl t/op/ifunless.t

=head1 DECSRIPTION

Tests the conditional C<if> and C<unless> operations.

=cut

use Parrot::Test tests => 6;

output_is(<<CODE, <<OUTPUT, "if_i_ic");
	set	I0, 2147483647
	set	I1, -2147483648
	set	I2, 0

	if      I0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	if      I1, TWO
        branch ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	if      I2, ERROR
        branch  THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "if_n_ic");
	set	N0, 0.1
	set	N1, -0.1
	set	N2, 0.0

	if N0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	if	N1, TWO
        branch ERROR
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	if	N2, ERROR
        branch  THREE
	print	"bad\\n"

THREE:
	print	"ok 3\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<CODE, <<OUTPUT, "if_s_ic");
	set	S0, "Hello World"
	set	S1, ""

	if      S0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	if	S1, ERROR
        branch  TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "unless_i_ic");
	set	I0, 0
	set	I1, -2147483648

	unless	I0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	unless	I1, ERROR
        branch TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "unless_n_ic");
	set	N0, 0.0
	set	N1, -0.1

	unless N0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	unless	N1, ERROR
        branch TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT

output_is(<<CODE, <<OUTPUT, "unless_s_ic");
	set	S1, "Hello World"
	set	S0, ""

	unless S0, ONE
        branch  ERROR
	print	"bad\\n"

ONE:
	print	"ok 1\\n"
	unless	S1, ERROR
        branch TWO
	print	"bad\\n"

TWO:
	print	"ok 2\\n"
	end

ERROR:
	print	"bad\\n"
        end
CODE
ok 1
ok 2
OUTPUT
