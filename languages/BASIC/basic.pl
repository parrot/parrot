#!/usr/bin/perl -w
# BASIC in PASM build harness program
#
# $Id$
# $Log$
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
	clone S1, S0
	set S0, S1
	save S0
	bsr STRIPSPACE

	restore S0  # This *should* be a no-op, it's not.  *puzzle*
	save S0     #   without it the string retains a trailing CR

	bsr TOKENIZER
	bsr REVERSESTACK
	restore I5
	eq I5, 0, ENDMAINLOOPNR  # No tokens!
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
system("perl assemble.pl test.pasm > out.pbc");

system("parrot out.pbc");


