# Copyright (C) 2005-2006, The Perl Foundation.

=head1 NAME

TGE::Tree - The top-level node of every tree.

=head1 DESCRIPTION

A TGE::Tree is the core object at the center of every tree transformation. You
can think of it as something like a PGE::Match object. The first step of
applying every tree grammar is to create a TGE::Tree object and wrap it around
the tree being transformed. The TGE::Tree object handles result caching for
particular transform rules on particular nodes, maintains connections between
particular nodes and the transforms that can apply to those nodes, and will
eventually handle indexing for faster tree searches.

=cut

.namespace [ "TGE::Tree" ]

.sub "__onload" :load
    # define the class
    .local pmc base
    newclass base, "TGE::Tree"
    addattribute base, "cell"  # a hash for storing values of tree nodes
    addattribute base, "visit" # arrays of rules that apply to each node type
    addattribute base, "data"  # the original unmodified tree
    addattribute base, "agid"  # a hash of node address => node id
    .return ()
.end

=head2 new

Returns a simple initialized TGE::Tree object. Doesn't accept any
constructor parameters.

=cut

.sub __init :method
    $P0 = new .Hash
    $P1 = new .Hash
    $P2 = new .Undef
    setattribute self, "cell", $P0
    setattribute self, "visit", $P1
    setattribute self, "data", $P2
    $P3 = new .AddrRegistry 
    setattribute self, "agid", $P3
.end

# Call all visitors for a given node
.sub _scan_node :method
    .param pmc node
    .param pmc name     :optional
    .param int got_name :opt_flag
    .local string type

    # If the user passed in a special name, look up visit actions for that one,
    # otherwise look them up for the type name of the node.
    if got_name goto name_from_arg
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
    $I2 = exists $P2[type]
    unless $I2 goto end_loop
    actions = $P2[type]
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

  value = Tree.get('attrname')

Fetches the value of a particular attribute from the root node of the
grammar.

  value = Tree.get('attrname', node)
  value = Tree.get('attrname', node, 'type')

Fetches the value of a particular attribute from the node passed in.
When working with a tree where the nodes don't know their type (PGE
match objects, for example), you must also tell C<get> the type of the
node.

=cut

.sub get :method
    .param pmc name
    .param pmc node     :optional
    .param int got_node :opt_flag
    .param pmc type     :optional
    .param int got_type :opt_flag

    # If no node was passed in, use top level node.
    if got_node goto node_exists
    node = getattribute self, 'data'
node_exists:

    .local pmc id
    id = self.'_lookup_id'(node)

    .local pmc cell
    $P1 = getattribute self, "cell"
    # First check to see if cell exists
    $P2 = $P1[name]
    $I1 = exists $P1[name]
    if $I1 goto name_hash_exists
    $P2 = new .Hash
    $P1[name] = $P2
    goto scan_name
name_hash_exists:
    $I0 = exists $P2[id]
    cell = $P2[id]
    if $I0 goto eval_cell
scan_name:
    if got_type goto scan_with_type
    self._scan_node(node)
    goto done_scan
scan_with_type:
    self._scan_node(node,type)
done_scan:
    # Second check to see if _scan_node defined the cell
    cell = $P2[id]
    $I0 = exists $P2[id]
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
.sub _eval_cell :method
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
.sub _install_action :method
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
    $I1 = exists cell_hash[name]
    if $I1 goto name_hash_exists
    cellattr = new .Hash
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
    id = self.'_lookup_id'(child_node)
    goto use_child_id
use_parent_id:
    id = self.'_lookup_id'(node)
use_child_id:

    # Check that the entry (by attribute name and id) in the "cell" hash
    # doesn't already exist (the grammar should only create one entry
    # for each unique node id).
    $P3 = cellattr[id]
    $I2 = exists cellattr[id]
    if $I2 goto error_defined

    # Create the entry in the "cell" tree that stores the action to
    # calculate the value of a given attribute in a given node. Also
    # store an empty space for the value after it has been calculated,
    # and a flag ("thunk") noting whether the action has been run.
    .local pmc thunk
    thunk = new .Hash
    thunk['thunk'] = 1
    $P4 = getattribute rule, "action"
    thunk['action'] = $P4
    $P5 = new .Undef
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
.sub _lookup_child :method
    .param pmc node
    .param pmc name
    $S0 = name
    $P1 = getattribute node, $S0
    .return($P1)
.end

.sub _lookup_id :method
    .param pmc node

    .local pmc id_hash
    .local int id
    # Get the id of the node, or if it doesn't exist, generate one.
    id_hash = getattribute self, 'agid'
    id = id_hash[node]
    if id goto got_id          # 0 means, doesn't exist
    id = elements id_hash
    inc id
    id_hash[node] = id
got_id:
    .return (id)
.end


=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
