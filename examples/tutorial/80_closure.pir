=head1 Closures

This example demonstrates creating a closure.

=cut

.sub main :main
    .lex "$n", $P0
    $P0 = new 'Integer'
    $P0 = 22

    .local pmc base_sub, myclosure
    .const 'Sub' base_sub = "closure_sub"

    newclosure myclosure, base_sub
    $P1 = myclosure(5)
    say $P1
.end

.sub closure_sub :outer('main')
    .param int increment
    find_lex $P0, "$n"      # invoking the closure pushes the lexical pad
                            # of the closure on the pad stack
    $P0 += increment
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

