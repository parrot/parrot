#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/delegate.t - Method Delegation

=head1 SYNOPSIS

	% perl -Ilib t/pmc/delegate.t

=head1 DESCRIPTION

Tests method delegation.

=cut

use Parrot::Test tests => 9;
use Test::More;

# basic functionality - setting and getting types

output_is(<<'CODE', <<'OUTPUT', "delegate set_integer_native");
    new P0, .delegate
    set P0, 42
    end
.namespace ["delegate"]
.pcc_sub __set_integer_native:
    get_params "(0,0)", P2, I5
    # need a private store to keep state - we dont have that yet
    # for now check param passing
    print I5
    print "\n"
    # just return
    returncc
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate get_integer");
    new P0, .delegate
    set I0, P0
    print I0
    print "\n"
    end
.namespace ["delegate"]
.pcc_sub __get_integer:
    get_params "(0)", P2
    set I5, 42
    set_returns "(0)", I5
    returncc
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate set_string_native");
    new P0, .delegate
    set P0, "fortytwo"
    end
.namespace ["delegate"]
.pcc_sub __set_string_native:
    get_params "(0,0)", P2, S5
    print S5
    print "\n"
    returncc
CODE
fortytwo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate get_string");
    new P0, .delegate
    set S0, P0
    print S0
    print "\n"
    end
.namespace ["delegate"]
.pcc_sub __get_string:
    get_params "(0)", P2
    set S5, "fortytwo"
    set_returns "(0)", S5
    returncc
CODE
fortytwo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate set_number_native");
    new P0, .delegate
    set P0, 47.11
    end
.namespace ["delegate"]
.pcc_sub __set_number_native:
    get_params "(0,0)", P2,N5
    print N5
    print "\n"
    returncc
CODE
47.110000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate get_number");
    new P0, .delegate
    set N0, P0
    print N0
    print "\n"
    end
.namespace ["delegate"]
.pcc_sub __get_number:
    get_params "(0)", P2
    set N5, 47.11
    set_returns "(0)", N5
    returncc
CODE
47.110000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate assign_pmc");
    new P0, .delegate
    new P1, .Integer
    set P1, 42
    assign P0, P1
    end
.namespace ["delegate"]
.pcc_sub __assign_pmc:
    get_params "(0,0)", P2, P5
    print P5
    print "\n"
    # just return
    returncc
CODE
42
OUTPUT

# math
pir_output_is(<<'CODE', <<'OUTPUT', "delegate add_p_p_i");
.sub main
    new P0, .delegate
    set P0, 1
    new P2, .Integer
    add P2, P0, 1
    print P2	# yeah 1+1 = 3
    print "\n"
    end
.end
.namespace ["delegate"]
.sub __set_integer_native method
    .param int i
    # just return
    print i
    print "\n"
    returncc
.end
.sub __add @MULTI(pmc, int)
    .param pmc l
    .param int r
    .param pmc d
    print r
    print "\n"
    d = new .Integer
    d =  3
    .return(d)
.end
CODE
1
1
3
OUTPUT

# math
pir_output_is(<<'CODE', <<'OUTPUT', "delegate add_p_p_p");
.sub main
    new P0, .delegate
    set P0, 1
    new P1, .Integer
    set P1, 1
    new P2, .Integer
    set P2, 777
    add P2, P0, P1
    print P2	# yeah 1+1 = 3
    print "\n"
    end
.end
.namespace ["delegate"]
.sub __set_integer_native method
    .param int i
    # cant keep state yet
    # just print arg and return
    print i
    print "\n"
.end
.sub __add @MULTI(delegate, pmc)
    .param pmc l
    .param pmc r
    .param pmc d
    print "in __add\n"
    print l
    print "\n"
    print r
    print "\n"
    print d
    print "\n"
    d = 3
    .return (d)
.end
.sub __get_string method
    .return("one")
.end
CODE
1
in __add
one
1
777
3
OUTPUT

