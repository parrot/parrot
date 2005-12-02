=head1 NAME

POST::Node - a base class for POST opcode syntax tree nodes

=head1 DESCRIPTION

All POST nodes subclass from this base type.

=cut

.namespace [ "POST::Node" ]

.sub "__onload" @LOAD
    .local pmc base
    newclass base, "POST::Node"
    addattribute base, "source"           # the original source code
    addattribute base, "pos"              # offset position in source
    addattribute base, "children"         # child nodes
    .return ()
.end


.sub __init method
    $P1 = new PerlUndef
    $P2 = new Integer
    $P3 = new PerlUndef

    setattribute self, "source", $P1
    setattribute self, "pos", $P2
    setattribute self, "children", $P3
.end

.sub "set_node" method
    .param string source
    .param int pos
    .param pmc children
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "pos"
    $P2 = pos
    setattribute self, "children", children
    .return ()
.end

.sub source method
    $P2 = getattribute self, "source"
    .return ($P2)
.end

.sub pos method
    $P2 = getattribute self, "pos"
    .return ($P2)
.end

.sub children method
    $P2 = getattribute self, "children"
    .return ($P2)
.end


.sub "dump" method
    .param int level
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

.sub "dump_attribute" method
    .param string name
    .param int level
    .local string indent
    indent = repeat "    ", level # tab is 4 spaces here
    # print value for this attribute
    print indent
    print "'"
    print name
    print "' => '"
    $P1 = getattribute self, name
    print $P1
    print "',\n"
    .return ()
.end

.sub "dump_children" method
    .param int level
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
