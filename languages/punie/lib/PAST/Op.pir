=head1 NAME

PAST::Op - An operation, function call, or method call

=head1 DESCRIPTION

PAST::Op is a function call (or operation or method call) in the AST. It
is a subclass of PAST::Node.

=cut

.namespace [ "PAST::Op" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Op'
    addattribute base, "op"         # the operator name
    .return ()
.end

.sub "set_node" method
    .param string source
    .param int pos
    .param string op
    .param pmc children
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "pos"
    $P2 = pos
    $P3 = new PerlString
    $P3 = op
    setattribute self, "op", $P3
    setattribute self, "children", children
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
    self.dump_attribute("op", level)
    self.dump_children(level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end
