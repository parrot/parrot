#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/object-meths.t - Object Methods

=head1 SYNOPSIS

	% perl t/pmc/object-meths.t

=head1 DESCRIPTION

Tests PMC object methods.

=cut

use Parrot::Test tests => 6;
use Test::More;

output_like(<<'CODE', <<'OUTPUT', "callmethod - unknown");
    newclass P2, "Foo"
    set S0, "nada"
    callmethod
    print "nope\n"
    end
CODE
/Method 'nada' not found/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "callmethod 1");
    newclass P2, "Foo"
    set S0, "meth"

    # cant mangle method names yet
    find_global P3, "meth"
    # so store ref to the sub with the real name
    store_global "Foo", "meth", P3

    print "main\n"
    callmethodcc
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

output_is(<<'CODE', <<'OUTPUT', "constructor");
    newclass P1, "Foo"
    find_global P2, "init"
    store_global "Foo", "__init", P2
    find_type I1, "Foo"
    new P3, I1
    print "ok 2\n"
    end
.pcc_sub init:
    print "ok 1\n"
    invoke P1
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "constructor - init attr");
    newclass P1, "Foo"
    addattribute P1, ".i"
    find_global P2, "Foo::init"
    store_global "Foo", "__init", P2
    find_global P2, "Foo::get_s"
    store_global "Foo", "__get_string", P2
    find_type I1, "Foo"
    new P3, I1
    print "ok 2\n"
    print P3
    print "\n"
    end
.pcc_sub Foo::init:
    print "ok 1\n"
    new P10, .PerlInt
    set P10, 42
    classoffset I0, P2, "Foo"
    setattribute P2, I0, P10
    invoke P1
.pcc_sub Foo::get_s:
    classoffset I0, P2, "Foo"
    getattribute P10, P2, I0
    set S5, P10
    invoke P1
CODE
ok 1
ok 2
42
OUTPUT
