# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Transformer.pbc'
    load_bytecode 'PAST/Walker/Dynamic.pbc'
    $P1 = get_class ['PAST'; 'Walker'; 'Dynamic']
    $P2 = get_class ['PAST'; 'Transformer']
    $P0 = subclass $P1, ['PAST'; 'Transformer'; 'Dynamic']
    addparent $P0, $P2
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Dynamic'], ['PAST'; 'Block'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'block'
    unless null $P0 goto has_handler
    $P1 = 'walkChildren'(walker, node)
    'replaceChildren'(node, $P1)
    .return (node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Dynamic'], ['PAST'; 'Op'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'op'
    unless null $P0 goto has_handler
    $P1 = 'walkChildren'(walker, node)
    'replaceChildren'(node, $P1)
    .return (node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Dynamic'], ['PAST'; 'Stmts'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'stmts'
    unless null $P0 goto has_handler
    $P1 = 'walkChildren'(walker, node)
    'replaceChildren'(node, $P1)
    .return (node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Dynamic'], ['PAST'; 'Val'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'val'
    unless null $P0 goto has_handler
    $P1 = 'walkChildren'(walker, node)
    'replaceChildren'(node, $P1)
    .return (node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Dynamic'], ['PAST'; 'Var'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'var'
    unless null $P0 goto has_handler
    $P1 = 'walkChildren'(walker, node)
    'replaceChildren'(node, $P1)
    .return (node)
has_handler:
    .tailcall $P0(walker, node)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
