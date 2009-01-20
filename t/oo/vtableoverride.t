#! parrot
# Copyright (C) 2007, The Perl Foundation.
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
    plan(11)

    newclass_tests()
    subclass_tests()
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
    morph $P1, "String"
    $P0 = getattribute $P1, "message"
    $S0 = $P0
    is($S0, "Morphing [MyObject] to type String", "Morph VTABLE override 1")

    morph $P1, "Integer"
    $P0 = getattribute $P1, "message"
    $S0 = $P0
    is($S0, "Morphing [MyObject] to type Integer", "Morph VTABLE override 1")
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




# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
