# User Stack Dump (Debugging.)
#  Inprint: Top of stack should contain the depth
# Outprint: Top of stack should (still) contain the depth.  :)
# Types
#      1 is an int
#      2 is a  num
#      3 is a  string
#      4 is a  PMC
#
# $Id$
# $Log$
# Revision 1.1  2003/03/09 23:08:58  clintp
# Re-organized the languages\BASIC area into two areas, one for the older
# interpreted GW-type BASIC and one for the newer compiled QB-like BASIC.
#
# Revision 1.2  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.5  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
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
	print "Stack Dump: (top to bottom)\n"
	depth I5
	set I0, I5
	gt I5, 0, DUMPLOOP
	print "  -empty-\n"
	branch DUMPEND
DUMPLOOP: 
	entrytype I1, 0
	print "   "
	sub I2, I5, I0

	print I2

	print "  "
	ne I1, 1, DUMPNOTINT
	print "Int "
	restore I1
	save I1

	print I1

	branch DUMPANOTHER
DUMPNOTINT:
	ne I1, 2, DUMPNOTNUM
	print "Num "
	restore N0
	save N0
	#print N0
	branch DUMPANOTHER
DUMPNOTNUM: 
	ne I1, 3, DUMPNOTSTRING
	print "Str "
	restore S1
	save S1
	print S1
	branch DUMPANOTHER
DUMPNOTSTRING:
	ne I1, 4, DUMPERR
	print "PMC "
	restore P0
	save P0
	#print P0
	branch DUMPANOTHER
DUMPANOTHER:
	print "\n"
	rotate_up I5
	dec I0
	eq I0, 0, DUMPEND
	branch DUMPLOOP
DUMPEND:
	popi
	popn
	pops
	popp
	ret
DUMPERR:
	print "UNKNOWN TYPE\n"
	end
