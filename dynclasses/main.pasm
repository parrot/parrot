# experimental subproxy class test
# the bytecode loading is deferred until the subproxy object is
# invoked. Then the subproxy acts as a normal sub

# running:
# $ export LD_LIBRARY_PATH=.:blib/lib
# $ make -C dynclasses
# $ parrot dynclasses/main.pasm

_main:
	loadlib P1, "subproxy"
	new P3, .Key
	set P3, "dynclasses/ext.imc"	# file - FIXME path handling
	new P4, .Key
	set P4, "_ext_main"	# sub label
	push P3, P4
	find_type I0, "SubProxy"
	new P0, I0
	assign P0, P3

	invokecc
	print "back\n"
	invokecc
	print "back\n"
	end
