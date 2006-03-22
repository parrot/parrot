=head1 NAME

POST::Op - An opcode

=head1 DESCRIPTION

POST::Op is a call to an opcode in the OST. It is a subclass of
POST::Node.

=cut

.namespace [ "POST::Op" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'POST::Node'
    base = subclass $P0, 'POST::Op'
    addattribute base, "op"         # the operator name
    .return ()
.end

.sub "set_node" :method
    .param string source
    .param int pos
    .param string op
    .param pmc children :optional
    .param int got_children :opt_flag
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "pos"
    $P2 = pos
    $P3 = new .String
    $P3 = op
    setattribute self, "op", $P3
    unless got_children goto no_children
      setattribute self, "children", children
    no_children:
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
    self.dump_attribute("op", level)
    self.dump_children(level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end

.sub op :method
    $P2 = getattribute self, "op"
    .return ($P2)
.end
