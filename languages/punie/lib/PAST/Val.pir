=head1 NAME

PAST::Val - Nodes for literal values

=head1 DESCRIPTION

PAST::Val is a subclass of PAST::Node.

=cut

.namespace [ "PAST::Val" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Val'
    addattribute base, "value"             # the value of this leaf
    .return ()
.end

.sub "set_node" method
    .param string source
    .param int pos
    .param string value
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "pos"
    $P2 = pos
    $P3 = new PerlString
    $P3 = value
    setattribute self, "value", $P3
    .return ()
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
    self.dump_attribute("value", level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end
