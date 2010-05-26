# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

examples/library/tracer.pir - A simple op tracing example for the Instrument dynpmc

=head1 SYNOPSIS

    % ./parrot examples/library/tracer.pir <file>

=head1 DESCRIPTION

A simple example of how to use the Instrument dynpmc
and associated libraries.

=cut

.sub '_init' :anon :load :init
    # Load the Instrument libraries.
    load_bytecode 'Instrument/Instrument.pbc'
    load_bytecode 'Instrument/Probe.pbc'
.end

.sub 'main' :main
    .param pmc args
	.local pmc instr, probe, probe2
	.local string me, file
    
    # Create a catchall probe which will be called for
    #  each op.
    probe = new ['Instrument';'Probe';'Catchall']
    probe.'set_callback'('catchall_callback')
    probe.'set_finalize'('catchall_finalize')
    
    # Create a probe that will be called whenever the
    #  specified ops are encountered.
    probe2 = new ['Instrument';'Probe']
    probe2.'inspect'('lt')
    probe2.'inspect'('gt')
    probe2.'set_callback'('specific_callback')
    probe2.'set_finalize'('specific_finalize')

    # Create an instance of Instrument and
    #  attach the probes to it.
	instr = new ['Instrument']
	instr.'attach'(probe)
	instr.'attach'(probe2)
	
	# Shift this file out of the command line argument list.
	me = shift args
	file = args[0]
	
	# Create globals for the counters.
	$P0 = new ['Integer']
	$P0 = 0
	set_global '$INSTR_CNT', $P0
	
	$P0 = new ['Integer']
	$P0 = 0
	set_global '$GT_CNT', $P0
	
	$P0 = new ['Integer']
	$P0 = 0
	set_global '$LT_CNT', $P0
	
	# Execute the file.
	instr.'run'(file, args)

	.return()
.end

.sub 'catchall_callback'
    .param string op_name
    
    # Update instruction counter.
    .local pmc counter
    counter = get_global '$INSTR_CNT'
    counter += 1
    set_global '$INSTR_CNT', counter
    
    .return()
.end

.sub 'catchall_finalize'
    # Print the total instructions executed.
    print 'Total Instruction count: '
    $P0 = get_global '$INSTR_CNT'
    say $P0

    .return()
.end

.sub 'specific_callback'
    .param string op_name
    .local int ind
    .local pmc counter
    
    # Check if it is lt or gt
    #  and update accordingly.
    ind = index op_name, 'gt'
    if ind == 0 goto GT_OP

LT_OP:
    counter = get_global '$LT_CNT'
    counter += 1
    set_global '$LT_CNT', counter
    goto DONE

GT_OP:
    counter = get_global '$GT_CNT'
    counter += 1
    set_global '$GT_CNT', counter

DONE:
    .return()
.end


.sub 'specific_finalize'
    .local pmc gt_cnt, lt_cnt
    
    gt_cnt = get_global '$GT_CNT'
    lt_cnt = get_global '$LT_CNT'
    
    print 'gt encountered '
    print gt_cnt
    say ' times'
    
    print 'lt encountered '
    print lt_cnt
    say ' times'

    .return()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
