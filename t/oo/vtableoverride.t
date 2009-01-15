#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id: vtableoverride.t 35599 2009-01-10 02:01:58Z whiteknight $

=head1 NAME

t/oo/vtableoverride.t - test various vtable overrides from PIR

=head1 SYNOPSIS

    % prove t/oo/vtableoverride.t

=head1 DESCRIPTION

Tests the behavior of VTABLE interfaces that have been overriden from PIR.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(2)
    $P0 = newclass "MyObject"
    $P1 = new $P0
    
    # Test get_string
    $S0 = $P1
    is($S0, "[MyObject]", "get_string VTABLE override")
    
    # Test morph (doesn't actually perform a morph)
    morph $P1, "String"

.end

.namespace [ 'MyObject' ]

.sub 'get_string' :vtable
    $S0 = "[MyObject]"
    .return($S0)
.end

.sub 'morph' :vtable
    .param string type
    $S0 = self
    $S1 = "Morphing " . $S0
    $S1 = $S1 . " to type "
    $S1 = $S1 . type
    is($S1, "Morphing [MyObject] to type String", "Morph vtable override")
.end
    

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
