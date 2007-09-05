=head1 exists

The C<exists> opcode tells you if the contents of a PMC, such as an array or
hash, exists.  It differs from C<defined>, because C<defined> will return false
on undefined values, which are valid entries.

In the example below, C<my_array[0]> exists and is defined, but C<my_array[1]> only
exists.  Similar to C<defined>, the behavior of C<exists> for a given PMC depends
on how that PMC implements vtable functions.

=cut

.sub main :main

    .local pmc my_array
    my_array = new 'ResizablePMCArray'
    $P0 = new 'String'
    $P0  = "Hello"
    $P1 = new 'Undef'
    push my_array, $P0
    push my_array, $P1

    $I0 = defined my_array[0]
    $I1 = exists my_array[0]
    $I2 = $I0 && I1

    unless $I2 goto not_def_not_exists
    say "my_array[0] is defined and it exists"
  not_def_not_exists:

    $I0 = defined my_array[1]
    $I1 = exists my_array[1]

    unless $I0 goto not_def
    say "my_array[1] is defined"
  not_def:
    unless $I1 goto not_exists
    say "my_array[1] exists"
  not_exists:
       
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

