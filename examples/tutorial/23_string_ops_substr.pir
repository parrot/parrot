.sub main :main

    $S0 = substr "abcde", 1, 2    # "bc"
    say $S0

    set $S1, "abcde"
    $S0 = substr $S1, 1, 2, "XYZ"
    say $S0                       # "bc"
    say $S1                       # "aXYZde"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

