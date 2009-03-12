=head1

The unconditional jump is the simplest of all flow control devices in any
language, and PIR is no exception. Using the C<goto> command, control flow
can jump to any location with a label. Labels are named just like named
variables, except they have a colon C<:> at the end.

=cut

.sub main :main

    say "before branch"

    goto branch_to_here
      say "never printed"
  branch_to_here:

    say "after branch"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

