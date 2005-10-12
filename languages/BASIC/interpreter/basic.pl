#! perl -w
#
# $Id$
# $Log: basic.pl,v 
# Revision 1.11  2002/06/16 21:23:28  clint
# Floating Point BASI
#
# Revision 1.10  2002/06/03 03:51:53  clintp
# Minor edits for compilation
#
# Revision 1.9  2002/06/01 18:23:01  clintp
# For new assembler
#
# Revision 1.8  2002/05/25 02:36:14  clintp
# Added autorun.bas, removed LOAD message, renamed intermediate compile files
#
# Revision 1.7  2002/05/24 03:59:46  clintp
# Screwed up ID strings
#

# Loads and runs the BASIC interpreter.
#
# Subsequent runs can be done with:
#    parrot.exe out.pbc
#
open(T, ">merged_basic.pasm") || die;

print T <<'EOF';
	branch MAIN

.include "stackops.pasm"
.include "alpha.pasm"
.include "dumpstack.pasm"
.include "tokenize.pasm"
.include "basicvar.pasm"
.include "basic.pasm"
.include "instructions.pasm"
.include "expr.pasm"


MAIN:
	new P20, .PerlHash     # PerlHash   # Numerics
	new P21, .PerlHash     # Alphabetics.
	new P22, .PerlHash     # ??
	new P23, .PerlHash     # ??
	new P24, .PerlArray    # Line numbers
	time I24  	       # Seed the random number generator

	save 0  # Initialize the runtime stack!
	save "LOAD autorun"
	bsr RUNLINE
	restore I0
	save "RUN"
	bsr RUNLINE
	restore I0

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
	restore S0	# Mystery bug.
	save S0		# CAP 7/31/02
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
close(T);

unlink "basic.pbc";
system("../../../parrot -o basic.pbc merged_basic.pasm");
system("../../../parrot basic.pbc");
