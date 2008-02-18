=head1

This example demonstrates the split opcode.

=cut

.sub main :main
    .local pmc words

    split words, " ", "the quick brown fox"
    $P1 = words[0]
    say $P1              # 'the'

    $P2 = words[2]
    say $P2              # 'brown'

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

