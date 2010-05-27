# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Walker.pbc'
    $P0 = subclass ['PAST'; 'Walker'], ['PAST'; 'Walker'; 'Dynamic']
    addattribute $P0, 'block'
    addattribute $P0, 'op'
    addattribute $P0, 'stmts'
    addattribute $P0, 'val'
    addattribute $P0, 'var'
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST'; 'Walker'; 'Dynamic'], ['PAST'; 'Block'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'block'
    unless null $P0 goto has_handler
    .tailcall 'walkChildren'(walker, node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Walker'; 'Dynamic'], ['PAST'; 'Op'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'op'
    unless null $P0 goto has_handler
    .tailcall 'walkChildren'(walker, node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Walker'; 'Dynamic'], ['PAST'; 'Stmts'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'stmts'
    unless null $P0 goto has_handler
    .tailcall 'walkChildren'(walker, node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Walker'; 'Dynamic'], ['PAST'; 'Val'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'val'
    unless null $P0 goto has_handler
    .tailcall 'walkChildren'(walker, node)
has_handler:
    .tailcall $P0(walker, node)
.end

.sub 'walk' :multi(['PAST'; 'Walker'; 'Dynamic'], ['PAST'; 'Var'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'var'
    unless null $P0 goto has_handler
    .tailcall 'walkChildren'(walker, node)
has_handler:
    .tailcall $P0(walker, node)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
