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
    $P3 = new .Undef

    setattribute self, "source", $P1
    setattribute self, "pos", $P2
    setattribute self, "children", $P3
.end

.sub '__elements' :method
    $P1 = getattribute self, 'children'
    $I1 = elements $P1
    .return ($I1)
.end

.sub source :method
    .param string source :optional
    .param int got_source :opt_flag
    unless got_source goto get
  set:
    $P1 = new .String
    $P1 = source
    setattribute self, "source", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "source"
    .return ($P2)
.end

.sub pos :method
    .param int pos :optional
    .param int got_pos :opt_flag
    unless got_pos goto get
  set:
    $P1 = new .Integer
    $P1 = pos
    setattribute self, "pos", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "pos"
    .return ($P2)
.end

.sub children :method
    $P2 = getattribute self, "children"
    .return ($P2)
.end

# Get the source string and position offset from start of source
# code for a PGE match node.
.sub clone_pge :method
    .param pmc node
    $S1 = node
    self."source"($S1)
    $I1 = node.from()
    self."pos"($I1)
    .return ()
.end

# Get the source string and position offset from start of source
# code for a tree node.
.sub clone_node :method
    .param pmc node
    $S1 = node.'source'()
    self.'source'($S1)
    $I1 = node.'pos'()
    self.'pos'($I1)
    .return ()
.end

.sub "dump" :method
    .param int level :optional
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    level += 1 # set level for attributes
    $S0 = typeof self
    print indent
    print "<"
    print $S0
    print "> => { \n"

    # print source for this node
    self.dump_attribute("source", level)
    self.dump_attribute("pos", level)
    self.dump_children(level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end

.sub "dump_attribute" :method
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

.sub "dump_children" :method
    .param int level :optional
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    level += 1 # set level to pass on to children
    # print children for this node
    print indent
    print "'children' => ["
    $P3 = getattribute self, "children"
    $I0 = defined $P3
    unless $I0 goto no_children
    print "\n"
    .local pmc iter
    iter = new Iterator, $P3 # loop over the array
    iter = 0 # start at the beginning
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
