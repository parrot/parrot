#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/delegate.t - Method Delegation

=head1 SYNOPSIS

	% perl t/pmc/delegate.t

=head1 DECSRIPTION

Tests method delegation.

=cut

use Parrot::Test tests => 9;
use Test::More;

# basic functionality - setting and getting types

output_is(<<'CODE', <<'OUTPUT', "delegate set_integer_native");
    new P0, .delegate
    set P0, 42
    end
.pcc_sub __set_integer_native:
    # need a private store to keep state - we dont have that yet
    # for now check param passing
    print I5
    print "\n"
    # just return
    invoke P1
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate get_integer");
    new P0, .delegate
    set I0, P0
    print I0
    print "\n"
    end
.pcc_sub __get_integer:
    set I5, 42
    invoke P1
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate set_string_native");
    new P0, .delegate
    set P0, "fortytwo"
    end
.pcc_sub __set_string_native:
    print S5
    print "\n"
    invoke P1
CODE
fortytwo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate get_string");
    new P0, .delegate
    set S0, P0
    print S0
    print "\n"
    end
.pcc_sub __get_string:
    set S5, "fortytwo"
    invoke P1
CODE
fortytwo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate set_number_native");
    new P0, .delegate
    set P0, 47.11
    end
.pcc_sub __set_number_native:
    print N5
    print "\n"
    invoke P1
CODE
47.110000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate get_number");
    new P0, .delegate
    set N0, P0
    print N0
    print "\n"
    end
.pcc_sub __get_number:
    set N5, 47.11
    invoke P1
CODE
47.110000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate set_pmc");
    new P0, .delegate
    new P1, .PerlInt
    set P1, 42
    assign P0, P1
    end
.pcc_sub __set_pmc:
    print P5
    print "\n"
    # just return
    invoke P1
CODE
42
OUTPUT

# math
output_is(<<'CODE', <<'OUTPUT', "delegate add_p_p_i");
    new P0, .delegate
    set P0, 1
    new P2, .PerlInt
    add P2, P0, 1
    print P2	# yeah 1+1 = 3
    print "\n"
    end
.pcc_sub __set_integer_native:
    # cant keep state yet
    # just return
    print I5
    print "\n"
    invoke P1
.pcc_sub __add_int:
    print I5
    print "\n"
    set P5, 3
    invoke P1
CODE
1
1
3
OUTPUT

# math
output_is(<<'CODE', <<'OUTPUT', "delegate add_p_p_p");
    new P0, .delegate
    set P0, 1
    new P1, .PerlInt
    set P1, 1
    new P2, .PerlInt
    set P2, 777
    add P2, P0, P1
    print P2	# yeah 1+1 = 3
    print "\n"
    end
.pcc_sub __set_integer_native:
    # cant keep state yet
    # just print arg and return
    print I5
    print "\n"
    invoke P1
.pcc_sub __add:
    print "in __add\n"
    print P2	# self - this triggers __get_string
    print "\n"
    print P5	# value
    print "\n"
    print P6	# dest
    print "\n"
    set P6, 3
    invoke P1
.pcc_sub __get_string:
    set S5, "one"
    invoke P1
CODE
1
in __add
one
1
777
3
OUTPUT
