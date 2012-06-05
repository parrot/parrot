# Copyright (C) 2010, Parrot Foundation.

=head1 TITLE

squaak.pir - A Squaak compiler.

=head1 DESCRIPTION

This is the entry point for the Squaak compiler.

=head2 Functions

=over 4

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the Squaak compiler.

=cut

.sub 'main' :main
    .param pmc args

    load_language 'squaak'

    $P0 = compreg 'Squaak'
    $P1 = $P0.'command_line'(args)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

