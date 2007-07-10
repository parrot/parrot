.sub main :main

    $I0 = 1               # product
    $I1 = 5               # counter

  REDO:                   # start of loop
    $I0 = $I0 * $I1
    dec $I1
    if $I1 > 0 goto REDO  # end of loop

    print $I0
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

