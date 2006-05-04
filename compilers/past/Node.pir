=head1 NAME

Node - a base class for syntax tree nodes

=head1 DESCRIPTION

All PAST and POST nodes subclass from this base type.

=cut

.namespace [ "Node" ]

.sub "__onload" :load
    .local pmc base
    newclass base, "Node"
    addattribute base, "source"           # the original source code
    addattribute base, "pos"              # offset position in source
    addattribute base, "children"         # child nodes
    .return ()
.end


.sub __init :method
    $P1 = new .Undef
    $P2 = new .Integer
    $P3 = new .ResizablePMCArray

    setattribute self, "source", $P1
    setattribute self, "pos", $P2
    setattribute self, "children", $P3
.end

=head1 Accessor Methods

These methods define the external interface of node objects.

=head2 source

Sets or gets the source code string that a particular node was parsed
from. (Useful for debugging output.)

    node.'source'($S1)
    $S2 = node.'source'()

=cut

.sub 'source' :method
    .param string source       :optional
    .param int passed_source   :opt_flag
    .return self.'accessor'('source', source, passed_source)
.end

=head2 pos

Sets or gets the position offset in the original source code file that a
particular node was parsed from. (Useful for debugging output.)

    node.'pos'($I1)
    $S2 = node.'pos'()

=cut

.sub 'pos' :method
    .param int pos             :optional
    .param int passed_pos      :opt_flag
    .return self.'accessor'('pos', pos, passed_pos)
.end

=head2 children

Returns a simple array of the children of a particular node.

    $P1 = node.'children'()

=cut

.sub 'children' :method
    $P2 = getattribute self, 'children'
    .return ($P2)
.end

=head2 child_iter

Returns an iterator for the children of a node.

    iter = node.'child_iter'()

=cut

.sub 'child_iter' :method
    $P1 = getattribute self, "children"
    $P2 = new Iterator, $P1    # setup iterator for node
    $P2 = 0
    .return($P2)
.end

=head2 add_child

Adds one child to the node's list of children. If the list doesn't exist
yet, it creates it.

    node.'add_child'($P1)

=cut

.sub 'add_child' :method
    .param pmc child
    .local pmc children
    children = getattribute self, 'children'
    $I0 = defined children
    if $I0 goto children_exist
      children = new .ResizablePMCArray
      setattribute self, "children", children
  children_exist:
    push children, child
    .return()
.end

=head2 elements

Check how many elements a node has by calling the C<elements> opcode on
it:

    $I1 = elements node

=cut

.sub '__elements' :method
    $P1 = getattribute self, 'children'
    $I1 = elements $P1
    .return ($I1)
.end

.sub '__get_bool' :method
	.return( 1 )
.end

=head2 Array interface

The children of a node can be directly accessed using array indexes on
the node object.

    $P2 = node[5]
    node[0] = $P1

=cut

.sub '__get_pmc_keyed_int' :method
    .param int key
    $P0 = getattribute self, 'children'
    $P0 = $P0[key]
    .return ($P0)
.end

.sub '__set_pmc_keyed_int' :method
    .param int key
    .param pmc val
    $P0 = getattribute self, 'children'
    $P0[key] = val
    .return ()
.end

=head2 clone

This method captures a few key elements from an existing node to
populate a new node.

    newnode.'clone'(oldnode)

=cut

.sub 'clone' :method
    .param pmc node
    $I0 = isa node, 'Node'
    if $I0 goto clone_past
  clone_pge:
    $S0 = node
    self.'source'($S0)
    $I0 = node.'from'()
    self.'pos'($I0)
    .return ()
  clone_past:
    $S0 = node.'source'()
    self.'source'($S0)
    $I0 = node.'pos'()
    self.'pos'($I0)
    .return ()
.end

=head2 dump

Recursively prints a formatted display of the contents of a node.

    node.'dump'()

=cut

.sub 'dump' :method
    .param int level :optional
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    level += 1 # set level for attributes
    $S0 = typeof self
    print indent
    print "<"
    print $S0
    print "> => { \n"

    # print attributes for this node
    .local pmc iter
    $P1 = self.'DUMPABLE'()
    iter = new Iterator, $P1 
    iter = 0
  iter_loop:
    unless iter, iter_end
    $S1 = shift iter
    if $S1 == 'children' goto children_dump
    self.dump_attribute($S1, level)
    goto iter_loop
  children_dump:
    self.dump_children(level)
    goto iter_loop
  iter_end:

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end

=head1 Utility Methods

These methods provide functionality for the Node class and its
subclasses, but aren't part of the external interface for the class.

=head2 DUMPABLE

This method returns a list of attributes that should be displayed in a
'dump' operation. Subclasses can override it to return a different list.

=cut

.sub 'DUMPABLE' :method
    $P1 = new .ResizableStringArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'children'
    .return($P1)
.end

=head2 accessor

Provides a generic accessor method that can be used by any subclass. It
takes three arguments: the name of the attribute to access, a value for
the attribute, and a binary flag that says whether to set the attribute.

    self.'accessor'('attrname', value, setflag)

=cut

.sub 'accessor' :method
    .param string attrname
    .param pmc value
    .param int setvalue
    if setvalue goto set
    value = getattribute self, attrname
    unless null value goto end
    value = new .Undef
  set:
    setattribute self, attrname, value
  end:
    .return (value)
.end

.sub 'dump_attribute' :method
    .param string name
    .param int level :optional
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    # print value for this attribute
    print indent
    print "'"
    print name
    print "' => "
    $P1 = getattribute self, name
    $I0 = defined $P1
    unless $I0 goto attribute_undef
    print "'"
    print $P1
    print "'"
    goto attribute_def
  attribute_undef:
    print "undef"
  attribute_def:
    print ",\n"
    .return ()
.end

.sub 'dump_children' :method
    .param int level :optional
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    level += 1 # set level to pass on to children
    # print children for this node
    print indent
    print "'children' => ["
    .local pmc iter
    iter = self.'child_iter'()
    unless iter goto no_children
    print "\n"

  loop_start:
    unless iter goto loop_end
    $P1 = shift iter
    $P1.dump(level)
    goto loop_start
  loop_end:
    print indent

  no_children:
    print "]\n"
    .return ()
.end
