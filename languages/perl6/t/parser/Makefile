MYPERL=perl -I../.. -I../../../../lib

all: tests

tests:
	$(MYPERL) -MTest::Harness -e 'runtests(@ARGV)' *.t

dump:
	$(MYPERL) -e 'foreach (@ARGV) {system qq{$(MYPERL) $$_ --dump}}' *.t

clean:
	rm -f *.got

.PHONY: all tests
