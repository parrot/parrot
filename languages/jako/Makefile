#
# Makefile
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

euclid.pasm: euclid.jako jako_compiler.pl
	jako_compiler.pl euclid.jako > euclid.pasm

fact.pasm: fact.jako jako_compiler.pl
	jako_compiler.pl fact.jako > fact.pasm

fib.pasm: fib.jako jako_compiler.pl
	jako_compiler.pl fib.jako > fib.pasm

hello.pasm: hello.jako jako_compiler.pl
	jako_compiler.pl hello.jako > hello.pasm


#
# Assembly:
#

euclid.pbc: euclid.pasm ../assemble.pl
	cd ..; assemble.pl $(DIR)/euclid.pasm > $(DIR)/euclid.pbc

fact.pbc: fact.pasm ../assemble.pl
	cd ..; assemble.pl $(DIR)/fact.pasm > $(DIR)/fact.pbc

fib.pbc: fib.pasm ../assemble.pl
	cd ..; assemble.pl $(DIR)/fib.pasm > $(DIR)/fib.pbc

hello.pbc: hello.pasm ../assemble.pl
	cd ..; assemble.pl $(DIR)/hello.pasm > $(DIR)/hello.pbc


#
# Other targets:
#

all: euclid.pbc fact.pbc fib.pbc hello.pbc

clean:
	rm -f euclid.pasm euclid.pbc fact.pasm fact.pbc fib.pasm fib.pbc hello.pasm hello.pbc

over:
	@make clean
	@make all

test: euclid.pbc fact.pbc fib.pbc hello.pbc
	cd ..; test_prog $(DIR)/euclid.pbc
	cd ..; test_prog $(DIR)/fact.pbc
	cd ..; test_prog $(DIR)/fib.pbc
	cd ..; test_prog $(DIR)/hello.pbc

#
# End of file.
#
