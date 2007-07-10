=head1 Math Operations (continued)

The second common form of math operation takes one argument and performs the
operation on the result, modifying it in place.

=cut

.sub main :main

    $I0 = 3
    $I0 *= 2
    print $I0
    print "\n"

    $N0 = 22.44
    $N0 /= 0
    print $N0
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

