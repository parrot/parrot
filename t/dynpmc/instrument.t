#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/instrument.t - test the Instrument dynpmc

=head1 SYNOPSIS

        % prove t/dynpmc/instrument.t

=head1 DESCRIPTION

Tests the low level interface provided by instrument.pmc.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(5)
    test_loadlib()
    test_instantiate()
    test_attach()
    
    .return()
.end

.sub 'test_loadlib'
    .local pmc lib
    
    lib = loadlib 'instrument'
    $I0 = defined lib
    ok($I0, 'Instrument dynpmc loaded')
    
    .return()
    
.end

.sub 'test_instantiate'
    .local pmc instr
    
    instr = new ['Instrument']
    $I0 = defined instr
    ok($I0, 'Instrument object instantiated')
    
.end

.sub 'test_attach'    
    .local pmc mock_probe, instr
    .local pmc class, enable_method, ins, it, type

    class = newclass ['MockProbe']
    addattribute class, 'instr_obj'
    
    mock_probe = new class
    instr      = new ['Instrument']
    
    instr.'attach'(mock_probe)
    
.end

.namespace ['MockProbe']
.sub 'enable' :method
    ok(1, 'Enable is called')
    
    .local pmc instr_obj
    .local string instr_obj_type
    instr_obj = getattribute self, 'instr_obj'
    $I0 = defined instr_obj
    ok($I0, 'Attribute instr_obj is defined')
    
    instr_obj_type = typeof instr_obj
    is(instr_obj_type, 'Instrument', 'Attribute instr_obj is the correct type')
    
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
