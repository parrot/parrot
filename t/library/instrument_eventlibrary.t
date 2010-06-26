#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/instrument_eventlibrary.t - test the classes in Instrument/EventLibrary.nqp.

=head1 SYNOPSIS

        % prove t/library/instrument_eventlibrary.t

=head1 DESCRIPTION

Tests the various provided event classes in Instrument/EventLibrary.nqp.

=head1 TODO

Class::* is not complete. Holding off until InstrumentPMC is done.

=cut

.include 'except_severity.pasm'
.include 'except_types.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(0)

    test_loadlib()

    .return()
.end

.sub test_loadlib
    .local pmc fh, os, event, instr, args
    .local string program1, program2

    # Dynlib loading has 4 scenarios.
    # 1. .loadlib directive
    # 2. loadlib opcode
    # 3. load_bytecode which then has a loadlib directive
    # 4. load_bytecode a file which has a :load sub that executes a loadlib opcode.

    ##
    # PIR program files to test loadlib.
    ##
    program1 = <<'PROG1'
.loadlib 'io_ops'
.sub main :main
    $P0 = loadlib 'os'
    load_bytecode 't/library/instrument_eventlibrary-loadlib-2.pir'
.end
PROG1

    fh = new ['FileHandle']
    fh.'open'('t/library/instrument_eventlibrary-loadlib-1.pir', 'w')
    fh.'puts'(program1)
    fh.'close'()

    program2 = <<'PROG2'
.loadlib 'bit_ops'
.sub '' :init :load :anon
    $P0 = loadlib 'file'
.end
PROG2

    fh = new ['FileHandle']
    fh.'open'('t/library/instrument_eventlibrary-loadlib-2.pir', 'w')
    fh.'puts'(program2)
    fh.'close'()

    # Run the test.
    $P0 = new ['Hash']
    set_global '%test_loadlib_res', $P0
    args = new ['ResizableStringArray']
    push args, 't/library/instrument_eventlibrary-loadlib-2.pir'

    $P1 = get_hll_global ['Instrument';'Event';'Internal'], 'loadlib'
    event = $P1.'new'()
    event.'callback'('test_loadlib_callback')

    instr = new ['Instrument']
    instr.'attach'(event)
    instr.'run'('t/library/instrument_eventlibrary-loadlib-1.pir', args)

    # Check the result.
    $P0 = get_global '%test_loadlib_res'
    $I0 = $P0['io_ops']
    is($I0, 1, 'Loadlib: Scenario 1 ok.')

    $I0 = $P0['os']
    is($I0, 1, 'Loadlib: Scenario 2 ok.')

    $I0 = $P0['bit_ops']
    is($I0, 1, 'Loadlib: Scenario 3 ok.')

    $I0 = $P0['file']
    is($I0, 1, 'Loadlib: Scenario 4 ok.')

    # Cleanup.
    os = new ['OS']
    os.'rm'('t/library/instrument_eventlibrary-loadlib-1.pir')
    os.'rm'('t/library/instrument_eventlibrary-loadlib-2.pir')
.end

.sub test_loadlib_callback
    .param pmc data

    # data[0] is the library name.
    $P0 = get_global '%test_loadlib_res'
    $S0 = data[0]
    $P0[$S0] = 1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
