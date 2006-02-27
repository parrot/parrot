=head1 NAME

POST::Val - Nodes for literal values

=head1 DESCRIPTION

POST::Val is a literal value in the OST. It is a subclass of POST::Node.

=cut

.namespace [ "POST::Val" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'POST::Node'
    base = subclass $P0, 'POST::Val'
    addattribute base, "value"            # the value of this leaf
    addattribute base, "valtype"          # the value type of this leaf
    .return ()
.end

.sub "set_node" :method
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
    self.dump_attribute("value", level)
    self.dump_attribute("valtype", level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end

.sub value :method
    $P2 = getattribute self, "value"
    .return ($P2)
.end

.sub valtype :method
    .param string valtype :optional
    .param int got_valtype :opt_flag
    unless got_valtype goto get
  set:
    $P1 = new PerlString
    $P1 = valtype
    setattribute self, "valtype", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "valtype"
    .return ($P2)
.end
