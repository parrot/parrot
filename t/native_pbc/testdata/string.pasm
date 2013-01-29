# Copyright (C) 2012, Parrot Foundation.

    set S1, binary:"%Ec"
    set S2, binary:"\xC2\x80"
    set S3, binary:"ABCX"
    set S4, utf8:"\xC4rger"
    print S0
    print "\n"
    print S1
    print "\n"
    print S2
    print "\n"
    print S3
    print "\n"
    print S4
    print "\n"
    end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
