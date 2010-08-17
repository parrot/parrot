# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 File Operations

This example demonstrates basic file operations.

=cut

.sub main :main
    .local pmc fileout, filein

    fileout = new ['FileHandle']
    fileout.'open'('40_file_ops_data.txt', 'w')
    fileout.'print'("The quick brown fox jumps over the lazy dog.\n")
    fileout.'close'()

    filein = new ['FileHandle']
    filein.'open'('40_file_ops_data.txt', 'r')
    $S0 = filein.'readline'()
    say $S0
    filein.'close'()

    # Be nice and remove the temporary file we created.
    $P0 = loadlib 'os'
    $P1 = new ['OS']
    $P1.'rm'('40_file_ops_data.txt')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

