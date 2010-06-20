#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id: instrument.t 47641 2010-06-15 16:38:51Z khairul $

=head1 NAME

t/dynpmc/instrumentop.t - test the InstrumentOp dynpmc

=head1 SYNOPSIS

        % prove t/dynpmc/instrumentop.t

=head1 DESCRIPTION

Tests the op information interface provided by the InstrumentOp.pmc.

=cut

.include 'call_bits.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(10)

    setup()
    test_one_op()
    cleanup()

    .return()
.end


.sub setup
    # Create a simple 1 op program.
    .local string program
    program = <<'PROG'
.namespace ['TestNS']
.sub main :main
    say 'In test program'
.end
PROG

    # Write to file.
    .local pmc fh
    fh = new ['FileHandle']
    fh.'open'('t/dynpmc/instrumentop-test1.pir', 'w')
    fh.'puts'(program)
    fh.'close'()
.end

.sub cleanup
    # Remove the op test program.
    .local pmc os
    os = new ['OS']
    os.'rm'('t/dynpmc/instrumentop-test1.pir')
.end

.sub test_one_op
    # Test a single opcode.
    .local pmc instr, probe, probe_class, args

    # Set up the program args.
    args = new ['ResizableStringArray']
    args.'push'('t/dynpmc/instrumentop-test1.pir')

    # Create a catchall probe.
    probe_class = get_hll_global ['Instrument'], 'Probe'
    probe = probe_class.'new'()
    probe.'inspect'('say_sc')
    probe.'set_callback'('test_one_op_callback')

    # Create the Instrument instance and run it
    #  against t/dynpmc/instrumentop-test1.pir.
    instr = new ['Instrument']
    instr.'attach'(probe)
    instr.'run'('t/dynpmc/instrumentop-test1.pir', args)
.end

.sub test_one_op_callback
    .param pmc op
    .param pmc instr

    # Test op name.
    $S0 = op.'name'()
    is($S0, 'say_sc', 'Op name correct.')
    
    # Test op family name.
    $S0 = op.'family'()
    is($S0, 'say', 'Op family name correct.')
    
    # Test op argument count.
    $I0 = op.'count'()
    is($I0, 1, 'Op argument count correct.')
    
    # Test op arg type.
    $I1 = .PARROT_ARG_STRING + .PARROT_ARG_CONSTANT
    $I0 = op.'arg_type'(0)
    is($I0, $I1, 'Op argument type correct.')
    
    # Test op arg value.
    $S0 = op.'get_arg'(0)
    is($S0, 'In test program', 'Op argument value correct.')
    
    # Test pc. Op is the first op, so pc is 0.
    $I0 = op.'pc'()
    is($I0, 0, 'Op pc value correct.')
    
    # Test file.
    $S0 = op.'file'()
    is($S0, 't/dynpmc/instrumentop-test1.pir', 'Op filename correct.')
    
    # Test line.
    $I0 = op.'line'()
    is($I0, 3, 'Op line correct.')
    
    # Test subroutine.
    $S0 = op.'sub'()
    is($S0, 'main', 'Op sub correct.')
    
    # Test namespace.
    $S0 = op.'namespace'()
    is($S0, 'TestNS', 'Op namespace correct.')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
