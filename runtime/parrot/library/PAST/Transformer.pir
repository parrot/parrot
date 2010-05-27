# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Walker.pbc'
    load_bytecode 'P6object.pbc'
    .local pmc p6meta, base
    p6meta = new 'P6metaclass'
    base = get_class ['PAST'; 'Walker']
    p6meta.'new_class'('PAST::Transformer', 'parent'=> base)
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST';'Transformer'], ['PAST';'Node'])
    .param pmc walker
    .param pmc node
    .local pmc newChildren, result
    result = node
    newChildren = 'walkChildren'(walker, node)
    'replaceChildren'(result, newChildren)
    .return (result)
.end

.sub 'walkChildren' :multi(['PAST';'Transformer'], ['PAST';'Node'])
    .param pmc walker
    .param pmc node
    .local pmc result
    .local int index, max
    result = new 'ResizablePMCArray'
    index = 0
    max = elements node
    ge index, max, end
loop:
    $P0 = node[index]
    $P1 = 'walk'(walker, $P0)
    result[index] = $P1
    inc index
    lt index, max, loop
end:
    .return (result)
.end

.sub 'replaceChildren'
    .param pmc node
    .param pmc newChildren
    .local int childIndex, max
    .local pmc ignore
    max = elements newChildren
    $I0 = elements node
    unless $I0 > 0 goto clear_done
clear_loop:
    ignore = pop node
    dec $I0
    if $I0 > 0 goto clear_loop
clear_done:
    childIndex = 0
    ge childIndex, max, end
add_loop:
    $P0 = newChildren[childIndex]
    if null $P0 goto add_reloop
    push node, $P0
add_reloop:
    inc childIndex
    lt childIndex, max, add_loop
end:
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
