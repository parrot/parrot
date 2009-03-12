=head1 String Operations

Some operations aren't mathematical at all. Concatenation is an example
of this type of operation that joins two strings together to form a
larger string. Like the other operations we've seen, concatenation also
has one form that returns the result, and one form that modifies the
result in place.

=cut

.sub main :main

    $S0 = "Hello"
    $S1 = $S0 . ", "

    $S1 .= "Zaphod!"
    say $S1

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

