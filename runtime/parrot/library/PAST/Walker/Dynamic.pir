# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Walker.pbc'
    load_bytecode 'P6object.pbc'
    .local pmc p6meta, base
    .local string name, attrs
    p6meta = new 'P6metaclass'
    base = get_class ['PAST'; 'Walker']
    name = 'PAST::Walker::Dynamic'
    attrs = 'block op stmts val var'
    p6meta.'new_class'(name, 'parent'=>base, 'attr'=>attrs)
.end

.namespace ['PAST'; 'Walker'; 'Dynamic']

.sub 'block' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'block'
    .return ($P0)
setter:
    setattribute self, 'block', value
.end

.sub 'op' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'op'
    .return ($P0)
setter:
    setattribute self, 'op', value
.end

.sub 'stmts' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'stmts'
    .return ($P0)
setter:
    setattribute self, 'stmts', value
.end

.sub 'val' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'val'
    .return ($P0)
setter:
    setattribute self, 'val', value
.end

.sub 'var' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'var'
    .return ($P0)
setter:
    setattribute self, 'var', value
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
