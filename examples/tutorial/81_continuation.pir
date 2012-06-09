# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's continuations.

=head1 CONTINUATIONS

Continuations are tricky and amazing things. Parrot uses continuations for
all sorts of things internally and you can use them too if you want. A
continuation is like a snapshot of the current execution environment.
If you invoke a continuation like a subroutine, it returns you to the
point where you created the continuation. Also, you can set the address
in the continuation to any label, so you can return to any arbitrary
point in your code that you want by invoking it.

=cut

.sub main :main
    .local pmc cont
    cont = new ['Continuation']
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

