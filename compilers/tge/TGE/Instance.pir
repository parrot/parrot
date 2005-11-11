# Copyright 2005, The Perl Foundation.

=head1 NAME

TGE::Instance - the runtime engine for TGE

=head1 DESCRIPTION

=cut

.namespace [ "TGE::Instance" ]

.sub "__onload" :load
    # define the class
    .local pmc base
    newclass base, "TGE::Instance"
    addattribute base, "cell"  # a hash for storing values of tree nodes
    addattribute base, "visit" # arrays of rules that apply to each node type
    addattribute base, "data"  # the original unmodified tree
    .return ()
.end

=head2 new

Returns a simple initialized TGE::Instance object. Doesn't accept any
constructor parameters.

=cut

.sub __init method
    $P0 = new PerlHash
    $P1 = new PerlHash
    $P2 = new PerlUndef
    setattribute self, "cell", $P0
    setattribute self, "visit", $P1
    setattribute self, "data", $P2
.end

# Call all visitors for a given node
.sub _scan_node method
    .param pmc node
    .param pmc name
    .local string type

    # If the user passed in a special name, look up visit actions for that one,
    # otherwise look them up for the type name of the node.
    $I1 = defined name
    if $I1 goto name_from_arg
    type = typeof node
    goto name_set
name_from_arg:
    type = name
name_set:

    # Iterate over the elements of the visit hash for the given type
    .local pmc actions
    .local int index
    .local pmc currule
    $P2 = getattribute self, 'visit'
    actions = $P2[type]
    $I2 = defined actions
    unless $I2 goto end_loop
    index = actions
loop:
    dec index
    if index < 0 goto end_loop
    currule = actions[index]
    self._install_action(node, currule)
    goto loop
end_loop:
    .return()
.end

=head2 get

  value = AGI.get('attrname')

Fetches the value of a particular attribute from the root node of the
grammar.

  value = AGI.get('attrname', node)
  value = AGI.get('attrname', node, 'type')

Fetches the value of a particular attribute from the node passed in.
When working with a tree where the nodes don't know their type (PGE
match objects, for example), you must also tell C<get> the type of the
node.

=cut

.sub get method
    .param pmc name
    .param pmc node
    .param pmc type

    # If no node was passed in, use top level node.
    unless null node goto node_exists
    node = getattribute self, 'data'
node_exists:

    .local pmc id
    id = _lookup_id(node)

    .local pmc cell
    $P1 = getattribute self, "cell"
    # First check to see if cell is defined
    $P2 = $P1[name]
    $I1 = defined $P2
    if $I1 goto name_hash_exists
    $P2 = new PerlHash
    $P1[name] = $P2
    goto scan_name
name_hash_exists:
    cell = $P2[id]
    $I0 = defined cell
    if $I0 goto eval_cell
scan_name:
    self._scan_node(node,type)
    # Second check to see if _scan_node defined the cell
    cell = $P2[id]
    $I0 = defined cell
    if $I0 goto eval_cell
    # Cell still not defined, grammar is unresolvable.
    print "Cannot find the attribute '"
    print name
    print "' ("
    $S1 = typeof node
    print $S1
    print ") that you asked for.\n"
    .return ()
eval_cell:
    $P3 = self._eval_cell(cell,node)
    .return($P3)
.end

# Evaluate a thunk.
.sub _eval_cell method
    .param pmc cell
    .param pmc node
    .local pmc value
    $I0 = cell['thunk']
    if $I0 goto run_thunk_action
    goto return_value
run_thunk_action:
    # the stored node (parent for inherited attributes, self for
    # synthesized attributes)
    $P1 = cell['node']
    $P0 = cell['action']
    value = $P0(self, $P1)
    cell['value'] = value
    cell['thunk'] = 0

return_value:
    value = cell['value']
    .return (value)
.end

# Install a thunk in a particular attribute slot of a particular object.
.sub _install_action method
    .param pmc node
    .param pmc rule

    # Grab the 'cell' hash from the grammar object.
    .local pmc cell_hash
    cell_hash = getattribute self, 'cell'

    # Retrieve the hash within 'cell' keyed by the name of the attribute.
    # If the hash doesn't exist, create it.
    .local pmc name
    .local pmc cellattr
    name = getattribute rule, "name"
    cellattr = cell_hash[name]
    $I1 = defined cellattr
    if $I1 goto name_hash_exists
    cellattr = new PerlHash
    cell_hash[name] = cellattr
name_hash_exists:

    # Decide which node to operate on. If 'parent' was '.', then operate on
    # the node passed in, otherwise, operate on a child node named in
    # 'parent'.
    .local pmc id
    .local pmc parent
    parent = getattribute rule, 'parent'
    if parent == '.' goto use_parent_id
    .local pmc child_node
    child_node = self._lookup_child(node, parent)
    id = _lookup_id(child_node)
    goto use_child_id
use_parent_id:
    id = _lookup_id(node)
use_child_id:

    # Check that the entry (by attribute name and id) in the "cell" hash
    # doesn't already exist (the grammar should only create one entry
    # for each unique node id).
    $P3 = cellattr[id]
    $I2 = defined $P3
    if $I2 goto error_defined

    # Create the entry in the "cell" tree that stores the action to
    # calculate the value of a given attribute in a given node. Also
    # store an empty space for the value after it has been calculated,
    # and a flag ("thunk") noting whether the action has been run.
    .local pmc thunk
    thunk = new PerlHash
    thunk['thunk'] = 1
    $P4 = getattribute rule, "action"
    thunk['action'] = $P4
    $P5 = new PerlUndef
    thunk['value'] = $P5
    thunk['node'] = node
    cellattr[id] = thunk

    .return()
error_defined:
    print "Nonlinear attribute: you have two or more ways to "
    print "assign a value to the attribute '"
    print name
    print "' near grammar line "
    $P7 = getattribute rule, "line"
    print $P7
    print "\n"
    end
.end

# This determines the semantics of .attr.
.sub _lookup_child method
    .param pmc node
    .param pmc name
    $S0 = name
    $S1 = substr $S0, 1
    $P1 = getattribute node, $S1
    .return($P1)
.end

.sub _lookup_id
    .param pmc node
    .local pmc id
    # Get the id of the node, or if it doesn't exist, generate one.
    id = getprop "agid", node
    $I0 = defined id
    if $I0 goto got_id
    id = new PerlInt
    id = _new_id()
    setprop node, "agid", id
got_id:
    .return (id)
.end

# Autoincrementing id generator
.sub _new_id
    .local int id
    id = 0
loop:
    inc id 
    .yield(id)
    goto loop
.end


=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
