default:
	@echo "to run <foo>.tcl, type 'make <foo>'"

%:%.tcl
	../../../parrot ../tcl.pbc $@.tcl

foo-t:
	../../../parrot -t ../tcl.pbc foo.tcl
