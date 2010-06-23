#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/instrument_probe.t - test Instrument::Probe.

=head1 SYNOPSIS

        % prove t/library/instrument_probe.t

=head1 DESCRIPTION

Tests the Instrument::Probe helper class.

=cut

.include 'except_severity.pasm'
.include 'except_types.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(17)

    setup()
    test_core_op()
    test_dyn_op()
    test_op_family()
    test_callback()
    test_finalize()
    test_enable()
    test_disable()
    cleanup()

    .return()
.end

.sub setup
    .local string program
    .local pmc fh

    ##
    # Dynop test file.
    ##
    program = <<'PROG'
.loadlib 'io_ops'
.sub main :main
    $S1 = 't/library/instrument_probe-dynop.pir'
    $P0 = open $S1, 'r'
    $S0 = read $P0, 1024
    close $P0
.end
PROG

    fh = new ['FileHandle']
    fh.'open'('t/library/instrument_probe-dynop.pir', 'w')
    fh.'puts'(program)
    fh.'close'()

    ##
    # Simple 2 op test file.
    ##
    program = <<'PROG'
.sub main :main
    say "2 Op test"
    end
.end
PROG

    fh = new ['FileHandle']
    fh.'open'('t/library/instrument_probe-2-op.pir', 'w')
    fh.'puts'(program)
    fh.'close'()
.end

.sub cleanup
    # Remove the op test program.
    .local pmc os
    os = new ['OS']
    os.'rm'('t/library/instrument_probe-dynop.pir')
    os.'rm'('t/library/instrument_probe-2-op.pir')
.end

.sub test_core_op
    .local pmc probe, probe_class, oplib
    oplib = new ['OpLib']

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()
    probe.'inspect'('say_sc')

    # Since say_sc is a single op and not a family of ops,
    # the op list should only have one entry.
    # Op number must also correspond to that from OpLib.

    # Check op count.
    $P0 = probe.'get_op_list'()
    $I0 = $P0
    is($I0, 1, 'Core op: One entry in op list.')

    # Check todo count.
    $P0 = probe.'get_op_todo_list'()
    $I0 = $P0
    is($I0, 0, 'Core op: No entry in todo list.')

    # Check opcode number
    $P0 = probe.'get_op_list'()
    $P1 = oplib['say_sc']
    $I1 = $P1
    $I0 = $P0[0]
    is($I0, $I1, 'Core op: Op number matches that of OpLib')
.end

.sub test_dyn_op
    .local pmc probe, probe_class, oplib, opcode, instr, args
    args = new ['ResizableStringArray']
    push args, 't/library/instrument_probe-dynop.pir'

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()
    probe.'inspect'('read_s_p_ic')

    # At this point, the dynop does not exist.

    # Check op count.
    $P0 = probe.'get_op_list'()
    $I0 = $P0
    is($I0, 0, 'Dyn op: (Before) No entry in op list.')

    # Check todo count.
    $P0 = probe.'get_op_todo_list'()
    $I0 = $P0
    is($I0, 1, 'Dyn op: (Before) One entry in todo list.')

    # Attach it to the instrument, run the dynop test file.
    # Then recheck the counts.
    instr = new ['Instrument']
    instr.'attach'(probe)
    instr.'run'('t/library/instrument_probe-dynop.pir', args)

    # Check op count.
    $P0 = probe.'get_op_list'()
    $I0 = $P0
    is($I0, 1, 'Dyn op: (After) One entry in op list.')

    # Check todo count.
    $P0 = probe.'get_op_todo_list'()
    $I0 = $P0
    is($I0, 0, 'Dyn op: (After) No entry in todo list.')
.end

.sub test_op_family
    .local pmc probe, probe_class, oplib
    oplib = new ['OpLib']

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()
    probe.'inspect'('set')

    # The set family of opcodes has 29 ops.
    # Ensure that all the ops in this set have the family
    # name of set.
    $I0 = 1
    $P1 = oplib.'op_family'('set')
    $P0 = probe.'get_op_list'()
    $I1 = $P0
    $I2 = $P1
    is($I1, $I2, 'Op Family: The op counts match')

    $P2 = iter $P0
    BEGIN:
      unless $P2 goto END
      $I1 = shift $P2
      $P3 = oplib[$I1]
      $S0 = $P3.'family_name'()

      if $S0 == 'set' goto BEGIN
      $I0 = 0
    END:
    is($I0, 1, 'Op Family: Ops in oplist belong to the "set" family.')
.end

.sub test_callback
    .local pmc probe, probe_class, oplib, opcode, instr, args, eh
    args = new ['ResizableStringArray']
    push args, 't/library/instrument_probe-2-op.pir'

    # Exception handler to catch exit.
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.CONTROL_ERROR, .CONTROL_EXIT)
    eh.'min_severity'(.EXCEPT_NORMAL)
    eh.'max_severity'(.EXCEPT_EXIT)

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()

    # Test pass by name.
    probe.'callback'('generic_callback')
    $P0 = probe.'callback'()
    $S0 = $P0
    is($S0, 'generic_callback', 'Callback: Pass by name ok.')

    # Test pass by reference.
    $P0 = get_global 'generic_callback2'
    probe.'callback'($P0)
    $P1 = probe.'callback'()
    is($P1, $P0, 'Callback: Pass by reference ok.')

    # Test bad pmc type.
    $P0 = new ['Hash']
    set_addr eh, BAD_PMC_OK
    push_eh eh
    probe.'callback'($P0)

    ok(0, 'Callback: Bad PMC not ok.')
    goto BAD_PMC_END

    BAD_PMC_OK:
        ok(1, 'Callback: Bad PMC ok.')
    BAD_PMC_END:

    pop_eh

    # Test non-existent sub.
    set_addr eh, NON_EX_SUB_OK
    push_eh eh
    probe.'callback'('non existent sub')

    ok(0, 'Callback: Non-existent sub not ok.')
    goto NON_EX_SUB_END

    NON_EX_SUB_OK:
        ok(1, 'Callback: Non-existent sub ok.')
    NON_EX_SUB_END:

    pop_eh

    # Test running. Only inspect the say op.
    probe.'callback'('test_callback_callback')
    probe.'inspect'('say_sc')

    instr = new ['Instrument']
    instr.'attach'(probe)
    instr.'run'('t/library/instrument_probe-2-op.pir', args)
.end

.sub test_callback_callback
    ok(1, 'Callback: Callback called.')
.end

.sub test_finalize
    .local pmc probe, probe_class, oplib, opcode, instr, args, eh
    args = new ['ResizableStringArray']
    push args, 't/library/instrument_probe-2-op.pir'

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()

    # Since finalize shares most of the lookup code with
    #  callback, only test calling of the finalize callback.
    probe.'finalize'('test_finalize_callback')

    instr = new ['Instrument']
    instr.'attach'(probe)
    instr.'run'('t/library/instrument_probe-2-op.pir', args)
.end

.sub test_finalize_callback
    ok(1, 'Finalize: Callback called.')
.end

.sub test_enable
    .local pmc probe, probe_class, oplib, opcode, instr, args, eh
    args = new ['ResizableStringArray']
    push args, 't/library/instrument_probe-2-op.pir'

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()

    # We only want the callback to be called once.
    # So set it to inspect end.
    probe.'inspect'('end')
    probe.'callback'('test_enable_callback')

    instr = new ['Instrument']
    instr.'attach'(probe)

    # On attach, the probe is enabled.
    # Disable and then reenable it.
    probe.'disable'()
    probe.'enable'()

    # Run
    instr.'run'('t/library/instrument_probe-2-op.pir', args)
.end

.sub test_enable_callback
    ok(1, 'Enable: Enable is ok.')
.end

.sub test_disable
    .local pmc probe, probe_class, oplib, opcode, instr, args, eh
    args = new ['ResizableStringArray']
    push args, 't/library/instrument_probe-2-op.pir'

    $P0 = box 0
    set_global "$test_disable_fail", $P0

    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe       = probe_class.'new'()

    # We only want the callback to be called once.
    # So set it to inspect end.
    probe.'inspect'('end')
    probe.'callback'('test_disable_callback')

    instr = new ['Instrument']
    instr.'attach'(probe)

    # On attach, the probe is enabled.
    # Disable it.
    probe.'disable'()

    # Run
    instr.'run'('t/library/instrument_probe-2-op.pir', args)

    $P0 = get_global "$test_disable_fail"
    is($P0, 0, 'Disable: Disable is ok.')
.end

.sub test_disable_callback
    $P0 = box 1
    set_global "$test_disable_fail", $P0
.end

# Stub callbacks.
.sub generic_callback
.end

.sub generic_callback2
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
