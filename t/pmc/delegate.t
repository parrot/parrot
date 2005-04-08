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
    set I5, 42
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
    set S5, "fortytwo"
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
    set N5, 47.11
    returncc
CODE
47.110000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "delegate assign_pmc");
    new P0, .delegate
    new P1, .PerlInt
    set P1, 42
    assign P0, P1
    end
.namespace ["delegate"]
.pcc_sub __assign_pmc:
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
    new P2, .PerlInt
    add P2, P0, 1
    print P2	# yeah 1+1 = 3
    print "\n"
    end
.end
.namespace ["delegate"]
.sub __set_integer_native
    # cant keep state yet
    # just return
    print I5
    print "\n"
    returncc
.end
.sub __add @MULTI(pmc, int)
    .param pmc l
    .param int r
    .param pmc d
    print I5
    print "\n"
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
    new P1, .PerlInt
    set P1, 1
    new P2, .PerlInt
    set P2, 777
    add P2, P0, P1
    print P2	# yeah 1+1 = 3
    print "\n"
    end
.end
.namespace ["delegate"]
.sub __set_integer_native
    # cant keep state yet
    # just print arg and return
    print I5
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
.sub __get_string
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

