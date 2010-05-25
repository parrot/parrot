# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Walker.pbc'
    $P0 = subclass ['PAST';'Walker'], ['PAST'; 'Transformer']
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
    .local int childIndex, resultIndex, max
    max = elements newChildren
    childIndex = 0
    resultIndex = 0
    ge childIndex, max, end
loop:
    $P0 = newChildren[childIndex]
    if null $P0 goto reloop
    node[resultIndex] = $P0
    inc resultIndex
reloop:
    inc childIndex
    lt childIndex, max, loop
end:
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
