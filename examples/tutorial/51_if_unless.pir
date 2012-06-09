# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's control flow (continued).

=head1 IF AND UNLESS

Both the if and unless conditionals are supported in PIR.  When the
tested condition matches the sense of the conditional (true for if,
false for unless), then the following C<goto> statement is executed.

Truth is fairly simple to determine, depending on the data type being
considered.

=over 4

=item Integers

0 is false, any other number is true.

=item Strings

The empty string is false, all other strings are true.

=item Numbers

0.0 is false, whether it is positive or negative.  All other numbers
are true, including NaN. NaN is the value you get if you try to divide
by zero, or do other illegal operations.

=item PMCs

The "truthiness" of a PMC depends on how it implements its vtable
method C<get_boolean>. This changes for each different type of PMC,
but is usually straight-forward.

=back

=cut

.sub main :main

    say "before if"
    $I0 = 1

    if $I0 goto branch_to_here
      say "never printed"
  branch_to_here:

    say "after if\n"

    say "before unless"

    unless $I0 goto dont_branch_to_here
      say "is printed"
  dont_branch_to_here:

    say "after unless"

    $N0 = -0.0
    if $N0 goto branch1
    say "-0.0 was false"
    branch1:

    $N0 = 'NaN'
    if $N0 goto branch2
    say "NaN was false"
    branch2:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

