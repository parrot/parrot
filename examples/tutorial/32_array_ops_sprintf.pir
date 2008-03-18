=head1

This demonstrates sprintf (provide some description of the options).
Particularly note the options for printing PMCs which C doesn't have.

=cut

.sub main :main

    .local pmc myarray
    myarray = new 'ResizablePMCArray'

    $P0 = new 'Integer'
    $P0 = 42
    push myarray, $P0

    $P1 = new 'Float'
    $P1 = 10.5
    push myarray, $P1

    $S0 = sprintf "int %#Px num %+2.2Pf\n", myarray
    print $S0     # prints "int 0x2a num +10.50"
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

