# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

runtime/parrot/library/Instrument/Instrument.pir - Loads all libraries required by Instrument.

=head1 SYNOPSIS

   # Load the instrument dynpmc and required libraries.
   load_bytecode 'Instrument/Instrument.pbc'
   
=cut

.sub '__instrument_lib_init' :init :load :anon
    .local pmc lib

    lib = loadlib 'instrument'
    $I0 = defined lib
    if $I0 goto END
    
    die 'Could not load the instrument dynpmc'

END:
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
