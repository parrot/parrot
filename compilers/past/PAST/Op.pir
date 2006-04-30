=head1 NAME

PAST::Op - An operation, function call, or method call

=head1 DESCRIPTION

PAST::Op is a function call (or operation or method call) in the AST. It
is a subclass of Node.

=cut

.namespace [ "PAST::Op" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Op'
    addattribute base, "op"         # the operator name
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

.sub 'op' :method
    .param string op :optional
    .param int got_op :opt_flag
    unless got_op goto get
  set:
    $P1 = new .String
    $P1 = op
    setattribute self, "op", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "op"
    .return ($P2)
.end
