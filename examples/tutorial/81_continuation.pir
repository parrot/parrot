=head1 Continuations

This example demonstrates creating a continuation, and using it as your own form of return.

=cut

.sub main :main
    .local pmc cont
    cont = new 'Continuation'
    set_addr cont, continued

    test_call(4, cont)
    say "should never be printed"
continued:
    say "continuation called"
.end

.sub test_call
    .param pmc argument
    .param pmc cont
    print "got argument: "
    say argument
    cont()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

