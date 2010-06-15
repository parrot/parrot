#!./parrot
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/vtableoverride.t - test various vtable overrides from PIR

=head1 SYNOPSIS

    % prove t/oo/vtableoverride.t

=head1 DESCRIPTION

Tests the behavior of VTABLE interfaces that have been overriden from PIR.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(15)

    newclass_tests()
    subclass_tests()
    vtable_implies_self_tests()
    anon_vtable_tests()
    invalid_vtable()
    get_pmc_keyed_int_Null()
.end

.sub invalid_vtable
    throws_substring(<<'CODE',' but was used with ', 'invalid :vtable throws an exception')
    .namespace [ "Test" ]
    .sub monkey :method :vtable("not_in_the_vtable")
        .param int key
        .return("monkey")
    .end
CODE
.end

.sub 'newclass_tests'
    $P1 = new 'MyObject'

    # Test get_string
    $S0 = $P1
    is($S0, "[MyObject]", "get_string VTABLE override")
    $P0 = getattribute $P1, "message"
    $S0 = $P0
    is($S0, "[MyObject]", "attribute sideeffect of get_string")

    # Test does
    $I0 = does $P1, 'this_dress_make...'
    is ($I0, 1, "check first does, ok")
    $I0 = does $P1, 'a_body_good'
    is ($I0, 1, "check second does, ok")
    $I0 = does $P1, 'it_better'
    is ($I0, 0, "no it doesn't")

    # Test morph (doesn't actually perform a morph)
    $P2 = get_class 'String'
    morph $P1, $P2
    $P0 = getattribute $P1, "message"
    $S0 = $P0
    is($S0, "Morphing [MyObject] to type String", "Morph VTABLE override 1")

    $P2 = get_class 'Integer'
    morph $P1, $P2
    $P0 = getattribute $P1, "message"
    $S0 = $P0
    is($S0, "Morphing [MyObject] to type Integer", "Morph VTABLE override 1")

    # Test invoke. Doesn't currently work so we need to fix that.
    #$P0 = $P1("invoked!")
    #$S0 = $P0
    #is($S0, "invoked!", "Invoke VTABLE override return value")

    #$P0 = getattribute $P1, "message"
    #$S0 = $P0
    #is($S0, "invoked!", "Invoke VTABLE override sideeffects")
.end

.sub 'subclass_tests'
    $P1 = new 'MySubObject'

    # Test does, same as newclass.
    $I0 = does $P1, 'this_dress_make...'
    is ($I0, 1, "check first does, ok")
    $I0 = does $P1, 'a_body_good'
    is ($I0, 1, "check second does, ok")
    $I0 = does $P1, 'it_better'
    is ($I0, 0, "no it doesn't")
    # Also verify we does what our parent does
    $I0 = does $P1, 'array'
    is ($I0, 1, "inherited does")
.end

.sub 'vtable_implies_self_tests'
  $P1 = get_class 'MyVtableObject'
  $P2 = $P1.'new'()
  $I0 = does $P2, 'frobulate'
  ok( $I0, ':vtable should imply the self parameter' )
.end


.sub 'anon_vtable_tests'
    $P0 = newclass "AnonVtableType"
    $P1 = new 'AnonVtableType'
    push_eh anon_does_not_work
    $S0 = $P1
    is($S0, "foo", "can have :vtable :anon")
    goto anon_end
  anon_does_not_work:
    ok(0, "can not have :anon :vtable")
  anon_end:
    pop_eh
.end

.sub 'get_pmc_keyed_int_Null'
    $P0 = newclass [ 'NoReturn_get_pmc_keyed_int' ]
    $P1 = new $P0
    $P2 = $P1[0]
    $I0 = isnull $P2
    ok($I0, "Override get_pmc_keyed_int without .return - TT #1593")
.end

.namespace [ 'MyObject' ]

.sub '__onload' :anon :init
    $P0 = newclass "MyObject"
    addattribute $P0, "message"
.end

.sub 'get_string' :vtable
    $S0 = "[MyObject]"
    $P0 = box $S0
    setattribute self, "message", $P0
    .return($S0)
.end

.sub 'morph' :vtable
    .param pmc class
    .local string type
    $S0 = self
    $S1 = "Morphing " . $S0
    $S1 = $S1 . " to type "
    type = class.'name'()
    $S1 = $S1 . type
    $P0 = box $S1
    setattribute self, "message", $P0
.end

.sub 'does' :vtable
    .param string query
    $S0 = 'does I do '
    $S0 .= query
    $P0 = box $S0
    setattribute self, "message", $P0
    if query == 'this_dress_make...'   goto yes
    if query == 'a_body_good' goto yes
    .return(0)
yes:
    .return (1)
.end

.sub 'invoke' :vtable
    .param string msg
    $P0 = box msg
    setattribute self, "message", $P0
    .return($P0)
.end

.namespace [ 'MySubObject' ]

.sub '__onload' :anon :init
    $P1 = get_class 'ResizablePMCArray'
    $P0 = subclass $P1, 'MySubObject'
    addattribute $P0, "submessage"
.end

.sub 'does' :vtable
    .param string query
    $S0 = 'does I do '
    $S0 .= query
    $P0 = box $S0
    setattribute self, "submessage", $P0
    if query == 'this_dress_make...'   goto yes
    if query == 'a_body_good' goto yes
    .return(0)
yes:
    .return (1)
.end

.namespace [ 'MyVtableObject' ]

.sub '__onload' :anon :init
  $P1 = get_class 'String'
  $P2 = subclass $P1, 'MyVtableObject'
.end

.sub 'does' :vtable
    .param string what
    eq what, 'frobulate', true
    .return( 0 )

  true:
    .return( 1 )
.end


.namespace [ 'AnonVtableType' ]

.sub '' :vtable('get_string') :method :anon
    .return("foo")
.end


.namespace [ 'NoReturn_get_pmc_keyed_int' ]

.sub 'get_pmc_keyed_int' :vtable
    .param int i
    # No .return
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
