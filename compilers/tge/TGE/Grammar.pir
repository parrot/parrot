# Copyright (C) 2005-2008, Parrot Foundation.

=head1 NAME

TGE::Grammar - The base class for all tree grammars.

=head1 DESCRIPTION

TGE::Grammar is the base class for all of the tree grammars for the Tree
Grammar Engine

=cut

.namespace [ 'TGE'; 'Grammar' ]

.sub '__onload' :load
    # define the class
    .local pmc base
    newclass base, ['TGE';'Grammar']
    addattribute base, 'rules'   # the rules in the grammar (an array)
    addattribute base, 'symbols' # used for tracking symbols parsed
                                 # (often a hash, but grammar chooses
                                 # implementation)
    .return ()
.end

=head2 new

Create a new grammar object. [Not implemented: Optionally pass it a
grammar specification in a string.] The grammar object holds an array
of TGE::Rule objects, which are the semantics defined by the grammar.

=cut

.sub init :vtable :method
    $P1 = new 'ResizablePMCArray'
    setattribute self, 'rules', $P1
    $P2 = new 'Hash'
    setattribute self, 'symbols', $P2
.end

=head2 add_rule

Add a rule to the current attribute grammar.

=cut

.sub 'add_rule' :method
    .param pmc type
    .param pmc name
    .param pmc parent
    .param pmc action

    # create a new attribute grammar rule
    .local pmc rule
    rule = new ['TGE';'Rule']
    setattribute rule, 'type', type
    setattribute rule, 'name', name
    setattribute rule, 'parent', parent
    setattribute rule, 'action', action

    # add the new rule to the grammar object
    $P3 = getattribute self, 'rules'
    push $P3, rule
.end


=head2 apply

Use a precompiled grammar on a data structure. This returns an
object on which you can call methods to fetch attributes on the
I<top node> of the data structure.

=cut

.sub 'apply' :method
    .param pmc tree
    .local pmc newtree
    .local pmc visit
    newtree = new ['TGE';'Tree']
    setattribute newtree, 'data', tree
    setattribute newtree, 'grammar', self
    visit = getattribute newtree, 'visit'
    # Build up the visit hash
    .local pmc rules
    .local int index
    .local pmc currule
    .local pmc cell
    .local pmc typename
    rules = getattribute self, 'rules'

    index = rules
loop:
    dec index
    if index < 0 goto end_loop
    currule = rules[index]
    typename = getattribute currule, 'type'
    $P2 = visit[typename]
    $I1 = does $P2, 'array'
    if $I1 goto array_exists
    $P2 = new 'ResizablePMCArray'
    visit[typename] = $P2
array_exists:
    push $P2, currule
    goto loop
end_loop:

    newtree.'_scan_node'(tree, 'ROOT')
    .return (newtree)
.end

=head2 add_symbol

Add a symbol to the lookup table.

=cut

.sub 'add_symbol' :method
    .param pmc name
    .param pmc value

    # add the new symbol
    .local pmc symbols
    symbols = getattribute self, 'symbols'

    $I0 = defined symbols[name]
    if $I0 goto no_set
    symbols[name] = value
  no_set:
    .return(1)
.end

=head2 symbol_iter

Return an iterator for the symbol lookup table.

=cut

.sub 'symbol_iter' :method
    $P1 = getattribute self, 'symbols'
    $P2 = iter $P1

    .return($P2)
.end

=head2 dump

Produce a data dump of the current contents of the grammar object.

=cut

.sub 'dump' :method
    $P0 = getattribute self, 'rules'
    $I1 = $P0

    print "VAR1 => { \n\t  'rules' =>\n"
LOOP:
    dec $I1
    $P1 = $P0[$I1]
    print "\t\t     [\n"
    $P1.'dump'()
    print "\t\t     ],\n"
    if $I1 > 0 goto LOOP


    print "\t}\n"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
