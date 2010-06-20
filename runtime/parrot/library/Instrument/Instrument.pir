# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

runtime/parrot/library/Instrument/Instrument.pir - Loads all libraries required by Instrument.

=head1 SYNOPSIS

   # Load the instrument dynpmc and required libraries.
   load_bytecode 'Instrument/InstrumentLib.pbc'

=cut

.include 'call_bits.pasm'
.loadlib 'bit_ops'
.loadlib 'instrument_group'

.sub '__instrument_lib_init' :init :load :anon
    .local pmc lib
    load_bytecode 'P6object.pbc'

    .return()
.end

.sub 'say'
    .param pmc msg
    say msg
.end

.sub 'die'
    .param pmc msg
    die msg
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
