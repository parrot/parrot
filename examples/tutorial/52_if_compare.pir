# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's control flow (continued).

=head1 COMPARISON BRANCHING

A simple C<goto> is the most simple version of flow control, but its
usefulness is very limited. In most cases, branches should be
conditional. The C<if> statement implements a conditional branch,
jumping only if a given condition is satisfied. These conditions can
use various boolean relational operators C<=>, C<< < >>, C<< > >> and
C<!=> to determine truth value. If the condition is satisfied, the jump
occurs.

In the C<if> statement, the jump is taken if the condition given is
true. In the C<unless> statement, the jump is taken if the condition is
false.

The commented-out code below shows how to use the relational opcodes like
C<islt> directly instead of using the relational operators.

=cut

.sub main :main

    say "before if"

    $I0 = 42
    $I1 = 43

#   $I2 = islt $I0, $I1                # The long way
#   if $I2 goto branch_to_label

    if $I0 < $I1 goto branch_to_label  # The short way
      say "never printed"
  branch_to_label:

    say "after if"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

