	# Runtime Debugger
	# Odd, that a compiled program would have a debugger.
DEBUGGER:
	set P0, P25["code"]
	set S0, P0[.LINE]
	print S0
	print "\n"
	print .LINE
	print "->"
	set I1, 0
	bsr READLINE
	ret