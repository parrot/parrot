#!/usr/bin/perl -w
# BASIC in PASM build harness program
#
# $Id$
# $Log$
# Revision 1.4  2002/05/12 15:00:44  clintp
# Removed temporary print statements for GC workaround
#
# Revision 1.3  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.8  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
#
# Revision 1.6  2002/04/14 20:51:17  Clinton
# Fixed pathname for inclusion as languages\basic
#
# Revision 1.2  2002/04/11 02:21:15  jgoff
# Altered system() calls to point to the correct directory.
#
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
#
# Revision 1.5  2002/04/07 04:10:07  Clinton
# Debugging
#
# Revision 1.4  2002/04/01 22:16:54  Clinton
# Seed Random Number generator with time
#
# Revision 1.3  2002/03/31 05:14:02  Clinton
# Id Keywords
#
# Revision 1.2  2002/03/31 05:09:57  Clinton
# *** empty log message ***
#
# Revision 1.1  2002/03/31 04:54:21  Clinton
# Initial revision
#
# $Id$
# $Log$
# Revision 1.4  2002/05/12 15:00:44  clintp
# Removed temporary print statements for GC workaround
#
# Revision 1.3  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.8  2002/04/28 01:09:36  Clinton
# Added speedups by using set Ix, Sx and avoiding a lot of
# STRIPSPACE calls.  Compensated for weird read-data bug.
#
# Revision 1.6  2002/04/14 20:51:17  Clinton
# Fixed pathname for inclusion as languages\basic
#
# Revision 1.2  2002/04/11 02:21:15  jgoff
# Altered system() calls to point to the correct directory.
#
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
#
# Revision 1.5  2002/04/07 04:10:07  Clinton
# Debugging
#
# Revision 1.4  2002/04/01 22:16:54  Clinton
# Seed Random Number generator with time
#
# Revision 1.3  2002/03/31 05:14:02  Clinton
# Id Keywords
#
#

open(T, ">test.pasm") || die;

$a=<<'EOF';

# I5 Stack Depth?

	set S20, "#"
	set S21, "#"
	set S22, "#"
	time I24      # Seed the random number generator

	branch MAIN

.include stackops.pasm
.include alpha.pasm
.include dumpstack.pasm
.include tokenize.pasm
.include basicvar.pasm
.include basic.pasm
.include instructions.pasm
.include expr.pasm


MAIN:
	save 0  # Initialize the runtime stack!

MAINLOOPR:
	print "\n\nReady\n"
	bsr CLEAR  # This should keep the runtime stack clean

MAINLOOPNR:
	set I20, 0    # Interactive mode
	set S0, ""
	
	set S0, ""
	read S0, 256
	length I1, S0
	eq I1, 1, MAINLOOPR
	save S0
	bsr STRIPSPACE
	bsr TOKENIZER
	bsr REVERSESTACK
	restore I5
	eq I5, 0, ENDMAINLOOPNR  # No tokens!

	# When the I/O GC bug gets fixed
	# remove the next three print lines. 
	#  They're magic.
	#print "Got and processing "
	#print S0
	#print "\n"

	bsr ISNUM
	restore I1
	dec I5
	save I5
	bsr CLEAR
	restore I0 # dummy

	eq I1, 0, DOLINE
	save S0
	bsr CSTORE
	branch ENDMAINLOOPNR

DOLINE:
	save S0
	bsr RUNLINE
	restore I0
	branch ENDMAINLOOP
	end

ENDMAINLOOP:
	branch MAINLOOPR 
ENDMAINLOOPNR:
	branch MAINLOOPNR

EOF

# Includes and constant substitutions
$a=~s/^\.include (.*)/open(F,$1) and print STDERR "Including $1\n" and join('', <F>)/mge;
$tab{$2}=$3 while($a=~s/^(\.const\s+([^\s]+)\s+([^\s]+))/#$1/m);
for (keys %tab) {
	$a=~s/\b${_}\b/$tab{$_}/g ;
}
$b=()=$a=~m/\n/g;
print "  $b lines\n";
$a=~s/\bputs\b/print/g;   # puts() breaks things.
print T $a;

close(T);
unlink "out.pbc";
system("perl -I../../lib ../../assemble.pl test.pasm > out.pbc");

system("../../parrot out.pbc");

