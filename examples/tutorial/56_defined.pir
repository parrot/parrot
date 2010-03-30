# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 defined

The C<defined> opcode tells you if the contents of a PMC is defined or not.
Using C<defined> on a C<int>, C<num>, or C<string> register may generate
an error if the register has been used before and freed or is newly created.

C<defined> is a great way to test a PMC to ensure it's been set to a proper
value before attempting to use it. Attempting to use a PMC that has not
been defined may throw an exception or cause a bigger problem.

=cut

.sub main :main

    $P1 = new ['String']
    $I0 = defined $P1
    if $I0 goto defined_P1
        say "$P1 is undefined"
        goto end_defined_P1
  defined_P1:
    say "$P1 is defined"

=pod

Most PMC's, but not all, should return true for C<defined>.  It all
depends on how the PMC implements its vtable function for C<defined>.
For example the C<Undef> PMC always returns false (0) for C<defined>.

=cut

  end_defined_P1:
    $P3 = new ['Undef']
    $I0 = defined $P3
    if $I0 goto defined_P3
        say "$P3 is undefined"
        goto end_defined_P3
  defined_P3:
    say "$P3 is defined"
  end_defined_P3:


.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

