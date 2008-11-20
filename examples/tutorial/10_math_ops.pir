=head1 Math Operations

Many common math operations have simple operator syntax in PIR. Operators
like C<+>, C<->, C</> and C<*> are all implemented in PIR, but so are a
few others: C<<< << >>>, C<<< >> >>>, C<|>, C<&>, C<^>  and C<%> are some
examples.

These math operation symbols are all I<infix operators> and are used the
way most people would expect.

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

