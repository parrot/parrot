#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/oo/ops.t - test OO related ops

=head1 SYNOPSIS

    % prove t/oo/ops.t

=head1 DESCRIPTION

Tests opcodes related to the OO implementation.

=cut

pir_output_is( <<'CODE', <<'OUT', 'addrole_p_p' );
.sub 'test' :main
    $P0 = new 'Role'
    $P1 = new 'Class'
    addrole $P1, $P0
    print "ok 1 - addrole op executed\n"

    $P2 = $P1.'roles'()
    $I0 = elements $P2
    if $I0 == 1 goto ok_2
    print "not "
ok_2:
    print "ok 2 - addrole op actually added the role\n"
.end
CODE
ok 1 - addrole op executed
ok 2 - addrole op actually added the role
OUT

pir_output_is( <<'CODE', <<'OUT', 'inspect_p_p' );
.sub 'test' :main
    $P0 = new 'Class'

    $P1 = inspect $P0
    print "ok 1 - inspect_p_p op executed\n"

    $I0 = elements $P1
    if $I0 == 7 goto ok_2
    print "not "
ok_2:
    print "ok 2 - returned hash had correct number of elements\n"
.end
CODE
ok 1 - inspect_p_p op executed
ok 2 - returned hash had correct number of elements
OUT

pir_output_is( <<'CODE', <<'OUT', 'inspect_p_p_s' );
.sub 'test' :main
    $P0 = new 'Class'
    $P0.'name'('foo')
    $P0.'add_attribute'('a')

    $P1 = inspect $P0, 'name'
    say $P1
    print "ok 1 - inspect_p_p_s with $3='name'\n"

    $P1 = inspect $P0, 'flags'
    $I0 = $P1
    $I1 = 1 << 29 # flag 29 is PObj_is_class_FLAG

    $I2 = $I0 & $I1
    if $I2 goto flags_ok
      print "not "
    flags_ok:
    print "ok 2 - inspect_p_p_s with $3='flags'\n"

    $P1 = inspect $P0, 'attributes'
    $I0 = elements $P1
    if $I0 == 1 goto ok_2
    print "not "
ok_2:
    print "ok 3 - inspect_p_p_s with $3='attributes'\n"
.end
CODE
foo
ok 1 - inspect_p_p_s with $3='name'
ok 2 - inspect_p_p_s with $3='flags'
ok 3 - inspect_p_p_s with $3='attributes'
OUT

pir_output_is( <<'CODE', <<'OUT', 'get_class_p_s' );
.sub main :main
    $P0 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'Monkey'
    $P0['name'] = $P4

    $P1 = new 'Class', $P0
    print "ok 1 - created new class named Monkey\n"

    push_eh nok_2
    $P2 = get_class 'Monkey'
    pop_eh
    goto ok_2
nok_2:
    print "not "
ok_2:
    print "ok 2 - get_class found a class\n"

    $P3 = $P2.'inspect'('name')
    print $P3
    print "\nok 3 - got name of found class\n"
.end
CODE
ok 1 - created new class named Monkey
ok 2 - get_class found a class
Monkey
ok 3 - got name of found class
OUT

pir_output_is( <<'CODE', <<'OUT', 'get_class_p_p' );
.sub main :main
    $P0 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'Monkey'
    $P0['name'] = $P4

    $P1 = new 'Class', $P0
    print "ok 1 - created new class named Monkey\n"

    push_eh nok_2
    $P2 = get_class [ 'Monkey' ]
    pop_eh
    goto ok_2
nok_2:
    print "not "
ok_2:
    print "ok 2 - get_class with a Key found a class\n"

    $P3 = $P2.'inspect'('name')
    print $P3
    print "\nok 3 - got name of found class\n"

    push_eh nok_4
    $P3 = get_namespace [ 'Monkey' ]
    $P2 = get_class $P3
    pop_eh
    goto ok_4
nok_4:
    print "not "
ok_4:
    print "ok 4 - get_class with a NameSpace found a class\n"

    $P3 = $P2.'inspect'('name')
    print $P3
    print "\nok 5 - got name of found class\n"
.end
CODE
ok 1 - created new class named Monkey
ok 2 - get_class with a Key found a class
Monkey
ok 3 - got name of found class
ok 4 - get_class with a NameSpace found a class
Monkey
ok 5 - got name of found class
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'addattribute_p_s' );
.sub main :main
    $P0 = new 'Class'
    addattribute $P0, 'foo'

    $P1 = $P0.'new'()

    $P2 = new 'Integer'
    $P2 = 100
    setattribute $P1, 'foo', $P2
    getattribute $P2, $P1, 'foo'

    print $P2
    print "\n"

    $P0 = new 'Hash'
    addattribute $P0, 'oops'
    print "Not here!\n"
.end
CODE
/100
Cannot add attribute to non-class
current instr\.: 'main'/
OUT

pir_output_is( <<'CODE', <<'OUT', 'new_p_s works with string register arg' );
.sub main :main
#    $P0 = newclass "Foo"
    $P0 = newclass "Foo"
    addattribute $P0, 'foo'

    $S0 = "Foo"
    $P1 = new $S0

    $P2 = new 'Integer'
    $P2 = 100
    setattribute $P1, 'foo', $P2
    getattribute $P2, $P1, 'foo'

    print $P2
    print "\n"

.end
CODE
100
OUT

pir_output_is( <<'CODE', <<'OUT', 'can_i_p_s' );
.sub main :main
    $P0 = newclass "Foo"
    $P1 = new $P0

    can $I0, $P1, "bar"

    if $I0 goto can_bar
    print "not "
  can_bar:
    print "ok 1\n"

    $P1.'bar'()
.end

.namespace ["Foo"]
.sub bar :method
    print "called bar\n"
.end

CODE
ok 1
called bar
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
