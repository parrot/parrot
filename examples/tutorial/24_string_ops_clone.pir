=head1

This code example illustrates cloning with PMC strings. A simple copy is just
another way of accessing the same variable, while a true clone creates a deep
copy.

  Ford
  Zaphod
  Zaphod

=cut

.sub main :main
    .local pmc firstname

    firstname = new 'String'
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

