# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's arrays (continued).

=head1 USING SPLIT TO CREATE AN ARRAY

C<split> is an operation that breaks up a string at certain marker
characters, and puts the resulting parts into an array. The first
argument to C<split> is the pattern to search for, and the second
argument is the string to search. The result is an array PMC.

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

