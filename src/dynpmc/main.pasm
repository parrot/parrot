# Copyright (C) 2003-2009, Parrot Foundation.

# experimental subproxy class test
# the bytecode loading is deferred until the subproxy object is
# invoked. Then the subproxy acts as a normal sub

# running:
# $ export LD_LIBRARY_PATH=.:blib/lib
# $ make -C src/dynpmc
# $ parrot src/dynpmc/main.pasm

_main:
	loadlib P1, "subproxy"

        # set up which Sub should eventually be called
	new P3, 'Key'
	set P3, "src/dynpmc/ext.pir"	# file - FIXME path handling
	new P4, 'Key'
	set P4, "_ext_main"	# sub label
	push P3, P4

	new P0, "SubProxy"
	assign P0, P3

	invokecc P0
	print "back\n"
	invokecc P0
	print "back\n"
end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
