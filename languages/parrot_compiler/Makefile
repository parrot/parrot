all :
	../../parrot -o parrot.pbc parrot.pasm
	../../parrot parrot.pbc < sample.pasm > sample.pbc
	../../parrot sample.pbc

clean :
	rm -f core
	rm -f *.pbc
