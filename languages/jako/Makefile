#
# Makefile
#
# $Id$
#

DIR=little_languages


#
# Default target:
#

default:
	echo "make: Makefile: no default target"


#
# Compilation:
#

bench.pasm: bench.jako jakoc
	./jakoc bench.jako > bench.pasm

euclid.pasm: euclid.jako jakoc
	./jakoc euclid.jako > euclid.pasm

fact.pasm: fact.jako jakoc
	./jakoc fact.jako > fact.pasm

fib.pasm: fib.jako jakoc
	./jakoc fib.jako > fib.pasm

hello.pasm: hello.jako jakoc
	./jakoc hello.jako > hello.pasm

leibniz.pasm: leibniz.jako jakoc
	jakoc leibniz.jako > leibniz.pasm

mandelbrot.pasm: mandelbrot.jako jakoc
	jakoc mandelbrot.jako > mandelbrot.pasm

mops.pasm: mops.jako jakoc
	jakoc mops.jako > mops.pasm

primes.pasm: primes.jako jakoc
	jakoc primes.jako > primes.pasm

sub.pasm: sub.jako jakoc
	jakoc sub.jako > sub.pasm


#
# Assembly:
#

bench.pbc: bench.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/bench.pasm > $(DIR)/bench.pbc

euclid.pbc: euclid.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/euclid.pasm > $(DIR)/euclid.pbc

fact.pbc: fact.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/fact.pasm > $(DIR)/fact.pbc

fib.pbc: fib.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/fib.pasm > $(DIR)/fib.pbc

hello.pbc: hello.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/hello.pasm > $(DIR)/hello.pbc

leibniz.pbc: leibniz.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/leibniz.pasm > $(DIR)/leibniz.pbc

mandelbrot.pbc: mandelbrot.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/mandelbrot.pasm > $(DIR)/mandelbrot.pbc

mops.pbc: mops.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/mops.pasm > $(DIR)/mops.pbc

primes.pbc: primes.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/primes.pasm > $(DIR)/primes.pbc

sub.pbc: sub.pasm ../assemble.pl
	cd ..; ./assemble.pl $(DIR)/sub.pasm > $(DIR)/sub.pbc


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
	cd ..; ./test_prog $(DIR)/bench.pbc
	cd ..; ./test_prog $(DIR)/euclid.pbc
	cd ..; ./test_prog $(DIR)/fact.pbc
	cd ..; ./test_prog $(DIR)/fib.pbc
	cd ..; ./test_prog $(DIR)/hello.pbc
	cd ..; ./test_prog $(DIR)/leibniz.pbc
	cd ..; ./test_prog $(DIR)/mandelbrot.pbc
	cd ..; ./test_prog $(DIR)/mops.pbc
	cd ..; ./test_prog $(DIR)/primes.pbc
	cd ..; ./test_prog $(DIR)/sub.pbc

#
# End of file.
#
