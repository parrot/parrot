# $Id$

=head1 iterators

An iterator is a type of PMC that helps with looping operations
involving arrays. The C<shift> and C<pop> operations on the iterator
return items from the array. The iterator itself provides a truth
value to determine if all elements in the array have been acted
upon. If the iterator is true, there are more items in the array to
deal with.

This example also demonstrates a technique for easily creating an
array of strings, by creating a string literal and using the C<split>
opcode on it.

=cut

.sub main :main
    .local pmc myarray, iter

    myarray = split " ", "foo bar baz boz"

    iter = new 'Iterator', myarray
  iter_loop:
    unless iter goto iter_end

    $P0 = shift iter
    say $P0

    goto iter_loop
  iter_end:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

