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

    plan(4)

    test_loadlib()
    test_gc()

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

    # data['library'] is the library name.
    $P0 = get_global '%test_loadlib_res'
    $S0 = data['library']
    $P0[$S0] = 1
.end

.sub test_gc
    .local pmc fh, os, instr, args
    .local string program

    # Test Instrument::Event::GC
    # 1. Test instrumenting a single function ('do_gc_mark')
    # 2. Test instrumenting by groups ('allocate')
    # 3. Test disabling to ensure it works and the callback is not called.

    ##
    # PIR program files to test gc.
    ##
    program = <<'PROG1'
.sub main :main
    # Test allocation.
    $P0 = new ['String']
    $P0 = "this is a string"
    $S0 = $P0

    $P0 = new ['Undef']

    # Test single function.
    sweep 1
    collect
.end
PROG1

    fh = new ['FileHandle']
    fh.'open'('t/library/instrument_eventlibrary-gc.pir', 'w')
    fh.'puts'(program)
    fh.'close'()


    # Setup the test.
    $P0 = new ['Hash']
    $P0['Sc 2: Function Ok?'] = 1
    set_global '%test_gc_res', $P0
    args = new ['ResizableStringArray']

    instr = new ['Instrument']

    # Scenario 1.
    $P1 = get_hll_global ['Instrument';'Event'], 'GC'
    $P2 = $P1.'new'()
    $P2.'callback'('test_gc_scenario_1')
    $P2.'inspect'('do_gc_mark')
    instr.'attach'($P2)

    # Scenario 2.
    $P3 = $P1.'new'()
    $P3.'callback'('test_gc_scenario_2')
    $P3.'inspect'('allocate')
    instr.'attach'($P3)

    # Scenario 3.
    $P4 = $P1.'new'()
    $P4.'callback'('test_gc_scenario_3')
    $P4.'inspect'('free')
    instr.'attach'($P4)
    $P4.'disable'()

    # Run the test.
    instr.'run'('t/library/instrument_eventlibrary-gc.pir', args)

    # Check the result.
    $P5 = get_global '%test_gc_res'

    # Scenario 1.
    $I0 = $P5['Sc 1: Called']
    $S0 = $P5['Sc 1: Function']
    is($I0, 1, 'GC: Singular called')
    is($S0, "do_gc_mark", 'GC: Singular name')

    # Scenario 2.
    $I0 = $P5['Sc 2: Called']
    $I1 = $P5['Sc 2: Function Ok?']
    is($I0, 1, 'GC: Group called')
    is($I1, 1, 'GC: Group all belongs to allocate.')

    # Scenario 3.
    $I0 = $P5['Sc 3: Called']
    is($I0, 0, 'GC: Disabled callback not called.')

    # Cleanup.
    os = new ['OS']
    os.'rm'('t/library/instrument_eventlibrary-gc.pir')
.end

.sub test_gc_scenario_1
    .param pmc data

    # Test that a singular function was instrumented.
    # Record the function name.
    $P0 = get_global '%test_gc_res'
    $S0 = data['type']
    $P0['Sc 1: Called']   = 1
    $P0['Sc 1: Function'] = $S0
.end

.sub test_gc_scenario_2
    .param pmc data

    # Test that a group function was instrumented.
    # Ensure that the function is of type allocate.
    $P0 = get_global '%test_gc_res'
    $S0 = data['type']
    $P1 = split '_', $S0
    $S1 = $P1[0]
    $I1 = iseq $S1, 'allocate'
    $I2 = $P0['Sc 2: Function Ok?']
    $I3 = and $I1, $I2

    $P0['Sc 2: Called']   = 1
    $P0['Sc 2: Function Ok?'] = $I3
.end

.sub test_gc_scenario_3
    .param pmc data

    # Since the probe was disabled, this should not be called.
    $P0 = get_global '%test_gc_res'
    $S0 = data['type']
    $P0['Sc 1: Called']   = 1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
