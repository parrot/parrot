#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/pmc/pmcproxy.t - test the PMCProxy PMC

=head1 SYNOPSIS

    % prove t/pmc/pmcproxy.t

=head1 DESCRIPTION

Tests the PMCProxy PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, 'PMCProxy'
    say "ok 1 - $P0 = new 'PMCProxy'"

    $I0 = isa $P0, 'PMCProxy'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'PMCProxy'"
.end
CODE
ok 1 - $P0 = new 'PMCProxy'
ok 2 - isa $P0, 'PMCProxy'
OUT

pir_output_is( <<'CODE', <<'OUT', 'get_class gives back Proxy PMC' );
.sub 'test' :main
push_eh nok_1
    $P0 = get_class 'NameSpace'
    clear_eh
    goto ok_1
nok_1:
    print "not "
ok_1:
    print "ok 1 - get_class returned something\n"

    $I0 = isa $P0, 'PMCProxy'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'PMCProxy'"
.end
CODE
ok 1 - get_class returned something
ok 2 - isa $P0, 'PMCProxy'
OUT

pir_output_is( <<'CODE', <<'OUT', 'Proxy PMC supplies name, namespace' );
.sub 'test' :main
push_eh nok_1
    $P0 = get_class 'NameSpace'
    clear_eh
    goto ok_1
nok_1:
    print "not "
ok_1:
    print "ok 1 - get_class returned something\n"

    $S1 = $P0.'name'()
    print $S1
    print "\n"
    print "ok 2 - got name\n"

    $P1 = $P0.'pmc_namespace'()
    $S1 = $P1
    print $S1
    print "\n"
    print "ok 3 - got namespace\n"
.end
CODE
ok 1 - get_class returned something
NameSpace
ok 2 - got name
NameSpace
ok 3 - got namespace
OUT

pir_output_is( <<'CODE', <<'OUT', 'Proxy PMC allows introspection of methods' );
.sub 'test' :main
push_eh nok_1
    $P0 = get_class 'NameSpace'
    clear_eh
    goto ok_1
nok_1:
    print "not "
ok_1:
    print "ok 1 - get_class returned something\n"

    $P1 = $P0.'methods'()
    print "ok 2 - got methods\n"

    $I0 = exists $P1['export_to']
    if $I0 goto ok_3
    print "not "
ok_3:
    print "ok 3 - export_to method in the list\n"

    $I0 = exists $P1['get_name']
    if $I0 goto ok_4
    print "not "
ok_4:
    print "ok 4 - get_name method in the list\n"
.end
CODE
ok 1 - get_class returned something
ok 2 - got methods
ok 3 - export_to method in the list
ok 4 - get_name method in the list
OUT

pir_output_is( <<'CODE', <<'OUT', '.new() creates a PMC' );
.sub 'test' :main
push_eh nok_1
    $P0 = get_class 'ResizablePMCArray'
    clear_eh
    goto ok_1
nok_1:
    print "not "
ok_1:
    print "ok 1 - get_class returned something\n"

    $P1 = $P0.'new'()
    print "ok 2 - created a PMC\n"

    $I0 = isa $P1, 'ResizablePMCArray'
    if $I0 goto ok_3
    print "not "
ok_3:
    print "ok 3 - created the Right Thing\n"
.end
CODE
ok 1 - get_class returned something
ok 2 - created a PMC
ok 3 - created the Right Thing
OUT

pir_output_is( <<'CODE', <<'OUT', 'can add_parent a ProxyPMC in a PDD15 class' );
.sub 'test' :main
    $P0 = new 'Class'
    print "ok 1 - created a PDD15 class\n"

    $P1 = get_class 'Hash'
    print "ok 2 - got the PMCProxy for Hash\n"

    addparent $P0, $P1
    print "ok 3 - added Hash's PMCProxy as a parent of the PDD15 class\n"

    $P2 = $P0.'new'()
    print "ok 4 - instantiated the class\n"
.end
CODE
ok 1 - created a PDD15 class
ok 2 - got the PMCProxy for Hash
ok 3 - added Hash's PMCProxy as a parent of the PDD15 class
ok 4 - instantiated the class
OUT

pir_output_is( <<'CODE', <<'OUT', 'can call and override non-vtable methods of the PMC' );
.sub 'test' :main
    $P0 = new 'Class'
    print "ok 1 - created a PDD15 class\n"

    $P1 = get_class 'Class'
    print "ok 2 - got the PMCProxy for Class\n"

    addparent $P0, $P1
    print "ok 3 - added Class's PMCProxy as a parent of the PDD15 class\n"

    # We'll override the add_role method.
    $P2 = find_global 'no_add_role'
    $P0.'add_method'('add_role', $P2)

    $P2 = $P0.'new'()
    print "ok 4 - instantiated the class\n"

    $P2.'add_attribute'('foo')
    print "ok 5 - called the add_attribute method of the PMC parent\n"

    $P3 = new 'Role'
    $P2.'add_role'($P3)
    print "ok 6 - overridden add_role method called\n"
.end
.sub no_add_role
    print "No, you can't add a role!\n"
.end
CODE
ok 1 - created a PDD15 class
ok 2 - got the PMCProxy for Class
ok 3 - added Class's PMCProxy as a parent of the PDD15 class
ok 4 - instantiated the class
ok 5 - called the add_attribute method of the PMC parent
No, you can't add a role!
ok 6 - overridden add_role method called
OUT

pir_output_is( <<'CODE', <<'OUT', 'can call and override vtable methods of the PMC' );
.sub 'test' :main
    $P0 = new 'Class'
    print "ok 1 - created a PDD15 class\n"

    $P1 = get_class 'Class'
    print "ok 2 - got the PMCProxy for Class\n"

    addparent $P0, $P1
    print "ok 3 - added Class's PMCProxy as a parent of the PDD15 class\n"

    # We will override the add_role vtable method.
    $P2 = find_global 'no_add_role'
    $P0.'add_method'('add_role', $P2, 'vtable' => 1)
    print "ok 4 - overridden a vtable method\n"

    $P2 = $P0.'new'()
    print "ok 5 - instantiated the class\n"

    addattribute $P2, 'foo'
    print "ok 6 - called the add_attribute v-table method of the PMC parent\n"

    $P3 = inspect $P2, "attributes"
    $I0 = elements $P3
    if $I0 == 1 goto ok_7
    print "not "
ok_7:
    print "ok 7 - the attribute was actually added\n"

    $P3 = new 'Role'
    addrole $P2, $P3
    print "ok 8 - overridden add_role v-table method called\n"
.end
.sub no_add_role
    print "No, you can't add a role by v-table either!\n"
.end
CODE
ok 1 - created a PDD15 class
ok 2 - got the PMCProxy for Class
ok 3 - added Class's PMCProxy as a parent of the PDD15 class
ok 4 - overridden a vtable method
ok 5 - instantiated the class
ok 6 - called the add_attribute v-table method of the PMC parent
ok 7 - the attribute was actually added
No, you can't add a role by v-table either!
ok 8 - overridden add_role v-table method called
OUT

pir_output_is( <<'CODE', <<'OUT', 'DYNSELF in a PMC will call methods overridden in high level classes' );
.sub 'test' :main
    $P0 = new 'Class'
    print "ok 1 - created a PDD15 class\n"

    $P1 = get_class 'Class'
    print "ok 2 - got the PMCProxy for Class\n"

    addparent $P0, $P1
    print "ok 3 - added Class's PMCProxy as a parent of the PDD15 class\n"

    # We will override the inspect_str vtable method.
    $P2 = find_global 'always42'
    $P0.'add_method'('inspect_str', $P2, 'vtable' => 1)
    print "ok 4 - overridden inspect_str method\n"

    $P2 = $P0.'new'()
    print "ok 5 - instantiated the class\n"

    $P3 = $P2.inspect('methods')
    print $P3
    print "\nok 6 - Called non-overridden method, which called overridden vtable method\n"
.end
.sub always42 :method
    .param string what
    $P0 = new 'Integer'
    $P0 = 42
    .return($P0)
.end
CODE
ok 1 - created a PDD15 class
ok 2 - got the PMCProxy for Class
ok 3 - added Class's PMCProxy as a parent of the PDD15 class
ok 4 - overridden inspect_str method
ok 5 - instantiated the class
42
ok 6 - Called non-overridden method, which called overridden vtable method
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
