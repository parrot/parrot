# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$

# the substr JaPH
    set S0, "Hacker\n"
    set S1, "Parrot "
    set S2, "another "
    set S3, "Just "
    replace S3, S3, 5,  1, S2
    replace S3, S3, 13, 1, S1
    replace S3, S3, 20, 1, S0
    print S3
    end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
