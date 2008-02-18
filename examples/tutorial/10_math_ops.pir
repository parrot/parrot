=head1 Math Operations

Many common math operations have simple operator syntax in PIR.

Most operations have two forms: one that takes two arguments and returns the
result of the operation.

=cut

.sub main :main

    $I0 = 5
    $I1 = $I0 + 2
    print $I1
    print "\n"

    $N0 = 6.7
    $N1 = $N0 - 1.5
    print $N1
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

