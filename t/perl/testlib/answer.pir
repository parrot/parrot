# Copyright (C) 2001-2008, The Perl Foundation.
# $Id: hello-dwim.pir 25819 2008-02-18 00:16:21Z coke $
.sub _main
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
