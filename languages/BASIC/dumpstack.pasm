# User Stack Dump (Debugging.)
#  Inputs: Top of stack should contain the depth
# Outputs: Top of stack should (still) contain the depth.  :)
# Types
#      1 is an int
#      2 is a  num
#      3 is a  string
#      4 is a  PMC
#
# $Id$
# $Log$
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
#
# Revision 1.3  2002/03/31 05:15:31  Clinton
# Adjusted
#
# Revision 1.2  2002/03/31 05:13:39  Clinton
# Id Keywords
#
#
DUMPSTACK:
	pushi
	pushn
	pushs
	pushp
	puts "Stack Dump: (top to bottom)\n"
	restore I5
	set I0, I5
	gt I5, 0, DUMPLOOP
	puts "  -empty-\n"
	branch DUMPEND
DUMPLOOP: 
	entrytype I1, 0
	puts "   "
	sub I2, I5, I0

	save I2
	bsr ITOA
	restore S31	 # Convert for puts
	puts S31

	puts "  "
	ne I1, 1, DUMPNOTINT
	puts "Int "
	restore I1
	save I1

	save I1
	bsr ITOA
	restore S31	# Convert for puts
	puts S31


	branch DUMPANOTHER
DUMPNOTINT:
	ne I1, 2, DUMPNOTNUM
	puts "Num "
	restore N0
	save N0
	#print N0
	branch DUMPANOTHER
DUMPNOTNUM: 
	ne I1, 3, DUMPNOTSTRING
	puts "Str "
	restore S1
	save S1
	puts S1
	branch DUMPANOTHER
DUMPNOTSTRING:
	ne I1, 4, DUMPERR
	puts "PMC "
	restore P0
	save P0
	#print P0
	branch DUMPANOTHER
DUMPANOTHER:
	puts "\n"
	rotate_up I5
	dec I0
	eq I0, 0, DUMPEND
	branch DUMPLOOP
DUMPEND:
	save I5
	popi
	popn
	pops
	popp
	ret
DUMPERR:
	puts "UNKNOWN TYPE\n"
	end
