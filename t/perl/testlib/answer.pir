# Copyright (C) 2001-2008, Parrot Foundation.
.sub _main :main
    print "The answer is\n"
    add $I0, 20, 23
    dec $I0
    print $I0
    print "\nsays Parrot!\n"
    end
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
