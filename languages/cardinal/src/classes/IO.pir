# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 TITLE

IO - Cardinal IO class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the IO class

=cut

.namespace ['IO']

.const int DEFAULT_BLOCK_SIZE = 8129

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('IO', 'parent'=>'CardinalObject', 'attr'=>'!io')
.end

.sub 'ACCEPTS' :method
    .param pmc topic
    .local int i

    .local string what
    what = topic.'WHAT'()
    if what == "IO" goto match
    goto no_match
    match:
        .return(1)
    no_match:
        .return(0)
.end

#.sub 'get_string' :vtable
#   $S0 = 'IO'
#   .return ($S0)
#.end

.sub 'read' :method
        .param string path
        .param pmc end_offset :optional
        .param pmc start_offset :optional
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
