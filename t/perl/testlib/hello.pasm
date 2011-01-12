# Copyright (C) 2001-2008, Parrot Foundation.
.pcc_sub :main main:

    # Get @ARGV as a ResizableStringArray
    get_params "0", P0

    # Discard the program name
    shift S0, P0

    # Look for additional args
    if P0, FOUND_EXTRA_ARG
        print "Hello World\n"
        end

FOUND_EXTRA_ARG:
    shift S1, P0
    print "Hello "
    print S1
    print "\n"
    end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
