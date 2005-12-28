.sub _DEBUGGER_STOP_FOR_REAL	# void Debugger_stop(int line, PerlHash local_values)
	.param int line
	.param pmc locals
	find_global $P25, "DEBUGGER"

	set $P0, $P25["code"]
	set $S0, $P0[line]
	print "\n"
	print $S0
	print "\n"
	bsr DEBUGGER_PRINTWATCH
	branch DEBUGGER_COMMAND

	# Commands are:
	#  \n		-- Step once, or no-op if not stepping
	#  c		-- Continue  (clears step mode)
	#  s 		-- Step      (sets step mode)
	#  b,xxx	-- set breakpoint at x
	#  d,xxx	-- delete breakpoint at x
	#  p,var	-- display var's value (no arrays yet)
	#  aw,var	-- add var to watchlist
	#  dw,var	-- delete var from watchlist
	#  pw		-- print watches
	#  daw		-- delete all watches
DEBUGGER_COMMAND:
	print line
	print "->"

	$S0 = _READLINE(0)
	$S0 = _CHOMP($S0)

	length $I0, $S0
	set $I1, $P25["step"]
	add $I0, $I0, $I1
	eq $I0, 0, DEBUGGER_COMMAND  # If no step mode, and no input, re-prompt

	$P1 = _SPLITLINE($S0,1)	# P1 will have array of values

	set $I0, $P1
	add $I0, $I0, $I1
	eq $I0, 0, DEBUGGER_COMMAND # If no values, re-prompt

	shift $S0, $P1
	eq $S0, "c", DEBUGGER_CONT
	eq $S0, "s", DEBUGGER_STEPON
	eq $S0, "b", DEBUGGER_ARG
	eq $S0, "d", DEBUGGER_ARG
	eq $S0, "p", DEBUGGER_PRINT
	eq $S0, "q", DEBUGGER_QUIT
	eq $S0, "aw", DEBUGGER_ADDWATCH
	eq $S0, "dw", DEBUGGER_DELWATCH
	eq $S0, "daw", DEBUGGER_DELALLWATCH
	eq $S0, "pw", DEBUGGER_PRINTWATCH1
	set $I1, $P25["step"]
	eq $I1, 0, DEBUGGER_UNK
	ret

DEBUGGER_PRINT:
	set $I0, $P1
	eq $I0, 0, DEBUGGER_PARG

	shift $S0, $P1
	set $S1, locals[$S0]	
	print $S1
	print "\n"
	branch DEBUGGER_COMMAND

DEBUGGER_PRINTWATCH1:
	bsr DEBUGGER_PRINTWATCH
	branch DEBUGGER_COMMAND

DEBUGGER_PARG:
	print "Expected variable name argument"
	branch DEBUGGER_COMMAND

DEBUGGER_UNK:
	print "Unknown command\n"
	branch DEBUGGER_COMMAND

DEBUGGER_QUIT:
	print "Debugger exiting\n"
	end

DEBUGGER_ADDWATCH:
	set $I0, $P1
	eq $I0, 0, DEBUGGER_PARG

	shift $S0, $P1
	bsr DEBUG_ADD
	print "Watch for "
	print $S0
	print " added\n"
	branch DEBUGGER_COMMAND

DEBUGGER_DELWATCH:
	set $I0, $P1
	eq $I0, 0, DEBUGGER_PARG

	shift $S0, $P1
	bsr DEBUG_CLEAR
	print "Watch for "
	print $S0
	print " cleared\n"
	branch DEBUGGER_COMMAND

DEBUGGER_DELALLWATCH:
	$P0=new PerlArray
	set $P25["watch"], $P0
	print "All watches cleared.\n"
	branch DEBUGGER_COMMAND

DEBUGGER_ARG:
	set $I0, $P1
	eq $I0, 0, DEBUGGER_ERR
	shift $I0, $P1
	set $S1, $I0
	set $P0, $P25["break"]
	eq $S0, "b", DEBUGGER_SET
	branch DEBUGGER_DEL
DEBUGGER_SET:
	set $P0[$S1], 1
	print "Breakpoint set at line "
	print $S1
	print "\n"
	branch DEBUGGER_COMMAND
DEBUGGER_DEL:
	delete $P0[$S1]
	print "Breakpoint cleared from line "
	print $S1
	print "\n"
	branch DEBUGGER_COMMAND
DEBUGGER_CONT:
	set $P25["step"], 0
	branch DEBUGGER_DONE
DEBUGGER_STEPON:
	set $P25["step"], 1
	branch DEBUGGER_DONE

DEBUGGER_ERR:
	print "Numeric argument expected\n"
	branch DEBUGGER_COMMAND



DEBUG_CLEAR:  
	set P0, P25["watch"]
	set I0, P0
        eq I0, 0, DEBUG_CLEAREND
        set I1, 0
DEBUG_CLEARLOOP:
        eq I1, I0, DEBUG_CLEAREND
        set S1, P0[I1]
        eq S1, S0, DEBUG_CLEARBLANK
        inc I1
        branch DEBUG_CLEARLOOP
DEBUG_CLEARBLANK:
        set P0[I1], ""
        branch DEBUG_CLEAREND
DEBUG_CLEAREND:
        ret

DEBUG_ADD:
	set $P0, $P25["watch"]
        set $I0, $P0
        eq $I0, 0, DEBUG_ADDNEW
        set $I1, 0
DEBUG_ADDLOOP:eq $I1, $I0, DEBUG_ADDNEW
        set $S1, $P0[$I1]
        eq $S1, "", DEBUG_ADDSLOT
        eq $S1, $S0, DEBUG_ADDEND
        inc $I1
        branch DEBUG_ADDLOOP

DEBUG_ADDSLOT:set $P0[$I1], $S0
        branch DEBUG_ADDEND
DEBUG_ADDNEW: push $P0, $S0
DEBUG_ADDEND: ret

DEBUGGER_PRINTWATCH:  
	set $P0, $P25["watch"]
	set $I0, $P0
        eq $I0, 0, DEBUG_PRINTEND
	print "Watches: "
        set $I1, 0
DEBUG_PRINTLOOP:
        eq $I1, $I0, DEBUG_PRINTEND
        set $S0, $P0[$I1]
        inc $I1
        eq $S0, "", DEBUG_PRINTLOOP
	print $S0
	print "="
	set $S1, locals[$S0]	
	print $S1
	print "\t"
        branch DEBUG_PRINTLOOP

DEBUG_PRINTEND:
        print "\n"
	ret

DEBUGGER_DONE:
	store_global "DEBUGGER", $P25
	ret
.end
