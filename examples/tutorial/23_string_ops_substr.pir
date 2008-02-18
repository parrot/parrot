=head1 String Operations (continued)

C<substr> selects the requested number of characters starting at
the offset.  If the requested number of characters is left out,
then all characters to the end of the string are removed.
An optional fourth argument may be a string that will replace the
selected characters.

=cut

.sub main :main

    $S0 = substr "abcde", 1, 2    # "bc"
    say $S0

    set $S1, "abcde"
    $S0 = substr $S1, 1, 2
    say $S0                   # "bc"
    say $S1                   # "abcde"

    set $S1, "abcde"
    $S0 = substr $S1, 1, 2, "XYZ"
    say $S0                       # "bc"
    say $S1                       # "aXYZde"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

