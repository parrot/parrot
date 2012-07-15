# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's control flow (continued).

=head1 LOOPS

PIR has no built-in looping structures such as C<for>, C<while>,
C<repeat> or C<until>. All loops are built by using conditionals
and C<goto>.

The loop below calculates 5 factorial, stored in C<$I0>.  C<$I1>
is the loop counter. In each loop iteration we decrement the counter
to see if we've done the loop enough times. The conditional jump
moves control flow back to the top of the loop if more iterations
are needed.

=cut

.sub main :main

    $I0 = 1               # product
    $I1 = 5               # counter

  REDO:                   # start of loop
    $I0 = $I0 * $I1
    dec $I1               # decrement counter
    if $I1 > 0 goto REDO  # end of loop

    print $I0
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

