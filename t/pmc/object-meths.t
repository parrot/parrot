#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/object-meths.t - Object Methods

=head1 SYNOPSIS

	% perl t/pmc/object-meths.t

=head1 DECSRIPTION

Tests PMC object methods.

=cut

use Parrot::Test tests => 4;
use Test::More;

output_like(<<'CODE', <<'OUTPUT', "callmeth - unknown");
    newclass P2, "Foo"
    set S0, "nada"
    callmeth
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "callmeth 1");
    newclass P2, "Foo"
    set S0, "meth"

    # cant mangle method names yet
    find_global P3, "meth"
    # so store ref to the sub with the real name
    store_global "Foo", "meth", P3

    print "main\n"
    callmethcc
    print "back\n"
    end

# .mangle "::" "\x00"
# .pcc_sub Foo::meth:
#  or some such

.pcc_sub meth:
    print "in meth\n"
    invoke P1
CODE
main
in meth
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "can class");
    newclass P2, "Foo"
    set S0, "meth"

    new P3, .Sub
    # store the sub with the real name
    store_global "Foo", "meth", P3

    can I0, P2, "meth"
    print I0
    print "\n"
    can I0, P2, "no_such_meth"
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "can object");
    newclass P2, "Foo"
    find_type I0, "Foo"
    new P2, I0

    set S0, "meth"

    new P3, .Sub
    # store the sub with the real name
    store_global "Foo", "meth", P3

    can I0, P2, "meth"
    print I0
    print "\n"
    can I0, P2, "no_such_meth"
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

