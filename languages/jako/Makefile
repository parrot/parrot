#
# Makefile
#
# $Id$
#

DIR=languages/jako
TOOL_DIR=../..
ASM=./assemble.pl
JAKOC=./jakoc
INTERP=./test_prog


#
# Default target:
#

default:
	echo "make: Makefile: no default target"


#
# Compilation:
#

bench.pasm: bench.jako jakoc
	$(JAKOC) bench.jako > bench.pasm

euclid.pasm: euclid.jako jakoc
	$(JAKOC) euclid.jako > euclid.pasm

fact.pasm: fact.jako jakoc
	$(JAKOC) fact.jako > fact.pasm

fib.pasm: fib.jako jakoc
	$(JAKOC) fib.jako > fib.pasm

hello.pasm: hello.jako jakoc
	$(JAKOC) hello.jako > hello.pasm

leibniz.pasm: leibniz.jako jakoc
	$(JAKOC) leibniz.jako > leibniz.pasm

mandelbrot.pasm: mandelbrot.jako jakoc
	$(JAKOC) mandelbrot.jako > mandelbrot.pasm

mops.pasm: mops.jako jakoc
	$(JAKOC) mops.jako > mops.pasm

primes.pasm: primes.jako jakoc
	$(JAKOC) primes.jako > primes.pasm

sub.pasm: sub.jako jakoc
	$(JAKOC) sub.jako > sub.pasm


#
# Assembly:
#

bench.pbc: bench.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/bench.pasm > $(DIR)/bench.pbc

euclid.pbc: euclid.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/euclid.pasm > $(DIR)/euclid.pbc

fact.pbc: fact.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/fact.pasm > $(DIR)/fact.pbc

fib.pbc: fib.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/fib.pasm > $(DIR)/fib.pbc

hello.pbc: hello.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/hello.pasm > $(DIR)/hello.pbc

leibniz.pbc: leibniz.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/leibniz.pasm > $(DIR)/leibniz.pbc

mandelbrot.pbc: mandelbrot.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/mandelbrot.pasm > $(DIR)/mandelbrot.pbc

mops.pbc: mops.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/mops.pasm > $(DIR)/mops.pbc

primes.pbc: primes.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/primes.pasm > $(DIR)/primes.pbc

sub.pbc: sub.pasm
	cd $(TOOL_DIR); $(ASM) $(DIR)/sub.pasm > $(DIR)/sub.pbc


#
# Other targets:
#

all: bench.pbc euclid.pbc fact.pbc fib.pbc hello.pbc leibniz.pbc mandelbrot.pbc mops.pbc primes.pbc sub.pbc

clean:
	rm -f bench.pasm bench.pbc \
euclid.pasm euclid.pbc \
fact.pasm fact.pbc \
fib.pasm fib.pbc \
hello.pasm hello.pbc \
leibniz.pasm leibniz.pbc \
mandelbrot.pasm mandelbrot.pbc \
mops.pasm mops.pbc \
primes.pasm primes.pbc \
sub.pasm sub.pbc

over:
	@make clean
	@make all

test: all
	cd $(TOOL_DIR); $(INTERP) $(DIR)/bench.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/euclid.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/fact.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/fib.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/hello.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/leibniz.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/mandelbrot.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/mops.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/primes.pbc
	cd $(TOOL_DIR); $(INTERP) $(DIR)/sub.pbc

#
# End of file.
#
