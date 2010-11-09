# Copyright (C) 2003-2009, Parrot Foundation.

.sub _ext_main
    print "in ext.pir\n"
    new P2, 'Undef'
    print P2
    .begin_return
    .end_return
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
