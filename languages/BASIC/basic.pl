#!/usr/bin/perl -w

#
# Test Harness...
#

open(T, ">test.pasm") || die;

$a=<<'EOF';

# I5 Stack Depth?

	new P20, 6     #PerlHash   # Numerics
	new P21, 6   # Alphabetics.

	set S22, "#"	    # Code

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
