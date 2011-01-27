all: lib/YAML/Tiny.pbc

lib/YAML/Tiny.pbc: lib/YAML/Tiny.pir
	parrot -o $@ $^

lib/YAML/Tiny.pir: lib/YAML/Tiny.pm
	parrot-nqp --target=pir -o $@ $^

test: lib/YAML/Tiny.pbc
	prove -e parrot-nqp -r -v t/*.t
