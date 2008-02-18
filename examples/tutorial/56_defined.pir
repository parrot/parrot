=head1 defined

The C<defined> opcode tells you if the contents of a PMC is defined or not.  Using
C<defined> on a temporary C<Integer>, C<Number>, or C<String> register may generate an error,
depending on whether the temporary register has been used before and freed, or newly
created.

=cut

.sub main :main

    $P1 = new 'String'
    $I0 = defined $P1
    if $I0 goto defined_P1
        say "$P1 is undefined"
        goto end_defined_P1
  defined_P1:
    say "$P1 is defined"

=pod

Most PMC's, but not all, should return true for C<defined>.  It all depends on
how the PMC implements its vtable method for C<defined>.  For example, the C<Undef>
PMC, returns false (0) for C<defined>.

=cut

  end_defined_P1:
    $P3 = new 'Undef'
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

