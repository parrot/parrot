# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's cloning operations.

=head1 CLONING WITH PMC STRINGS

This code example illustrates cloning with PMC strings. Simple copying
operations create two pointers to the same underlying memory structure.
A C<clone> operation actually creates two separate but identical
objects in memory. In this example, notice how C<$P1> and C<firstname>
both reference the same location in memory, but C<$P2> doesn't.

=cut

.sub main :main
    .local pmc firstname

    firstname = new ['String']
    firstname = "Ford"
    say firstname

    $P1 = firstname
    $P1 = "Zaphod"
    say firstname


    $P2 = clone firstname
    $P2 = "Trillian"
    say firstname

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

