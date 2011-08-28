# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

PCT::Dumper - various dumper formats for PCT

=head1 DESCRIPTION

This file implements a dumper that attempts to output PAST,
Match, and Capture objects in a format that can be easily
consumed by syntax highlighters (such as Padre).
Yes, the code is probably much uglier and convoluted than
it should be.  No, I'm not proud of it, but it works for now.

=cut

.namespace ['PCT';'Dumper']

.sub 'padre'
    .param pmc obj
    .param string name
    .param pmc options         :slurpy :named

    'padre_item'(obj, name)
.end


.sub 'padre_item' :multi(_)
    .param pmc obj
    .param pmc name
.end


.sub 'padre_item' :multi(['PGE';'Match'])
    .param pmc obj
    .param pmc name

    .local string str
    str = obj.'Str'()
    $I0 = length str
    if $I0 < 48 goto have_str
    str = substr str, 0, 48
    str = concat str, '...'
  have_str:
    str = escape str

    $S0 = obj['type']
    unless $S0 goto have_name
    name = $S0
  have_name:

    $P0 = new 'ResizablePMCArray'
    $I1 = obj.'from'()
    push $P0, $I1
    $I2 = obj.'to'()
    $I2 -= $I1
    push $P0, $I2
    push $P0, name
    push $P0, str

    $S0 = sprintf ' %4d %4d  %-20s "%s"', $P0
    say $S0

    .local pmc hash, hash_it
    hash = obj.'hash'()
    hash_it = iter hash
  hash_it_loop:
    unless hash_it goto hash_it_done
    .local string key
    key = shift hash_it
    $P0 = hash[key]
    'padre_item'($P0, key)
    goto hash_it_loop
  hash_it_done:

    $P0 = obj.'list'()
    'padre_item'($P0, name)

.end


.sub 'padre_item' :multi(['ResizablePMCArray'])
    .param pmc obj
    .param pmc name

    .local pmc list_it
    list_it = iter obj
  list_it_loop:
    unless list_it goto list_it_done
    $P0 = shift list_it
    'padre_item'($P0, name)
    goto list_it_loop
  list_it_done:
.end

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

