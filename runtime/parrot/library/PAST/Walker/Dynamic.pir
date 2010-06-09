# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

PAST::Walker::Dynamic - A PAST::Walker subclass that doesn't require creating a new subclass to change its behavior.

=head1 DESCRIPTION

PAST::Walker's behavior can only be customized by subclassing. This subclass determines its behavior based on Subs stored in its attributes, allowing modification of its behavior without creating a new class, including at runtime.

=cut

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Walker.pbc'
    load_bytecode 'P6object.pbc'
    .local pmc p6meta, base
    .local string name, attrs
    p6meta = new 'P6metaclass'
    base = get_class ['PAST'; 'Walker']
    name = 'PAST::Walker::Dynamic'
    attrs = 'block op stmts val var varlist'
    p6meta.'new_class'(name, 'parent'=>base, 'attr'=>attrs)
.end

.namespace ['PAST'; 'Walker'; 'Dynamic']

=head1 PAST::Walker::Dynamic

=head2 Attribute accessors

Each attribute should hold a sub that takes a walker and a PAST::Node.

It will be called when the appropriate node type is traversed.

As with PAST::Walker, the sub must explicitly call 'walkChildren' in order to traverse the children.

=over 4

=item block([sub])

Gets/sets the sub to be called when traversing a PAST::Block node.

=cut

.sub 'block' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'block'
    .return ($P0)
setter:
    setattribute self, 'block', value
.end

=item op([sub])

Gets/sets the sub to be called when traversing a PAST::Op node.

=cut

.sub 'op' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'op'
    .return ($P0)
setter:
    setattribute self, 'op', value
.end

=item stmts([sub])

Gets/sets the sub to be called when traversing a PAST::Stmts node.

=cut

.sub 'stmts' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'stmts'
    .return ($P0)
setter:
    setattribute self, 'stmts', value
.end

=item val([sub])

Gets/sets the sub to be called when traversing a PAST::Val node.

=cut

.sub 'val' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'val'
    .return ($P0)
setter:
    setattribute self, 'val', value
.end

=item var([sub])

Gets/sets the sub to be called when traversing a PAST::Var node.

=cut

.sub 'var' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'var'
    .return ($P0)
setter:
    setattribute self, 'var', value
.end

=item varlist([sub])

Gets/sets the sub to be called when traversing a PAST::VarList node.

=cut

.sub 'varlist' :method
    .param pmc value :optional
    .param int has_value :opt_flag
    if has_value goto setter
    $P0 = getattribute self, 'varlist'
    .return ($P0)
setter:
    setattribute self, 'varlist', value
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

.sub 'walk' :multi(['PAST'; 'Walker'; 'Dynamic'], ['PAST'; 'VarList'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'varlist'
    unless null $P0 goto has_handler
    .tailcall 'walkChildren'(walker, node)
has_handler:
    .tailcall $P0(walker, node)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
