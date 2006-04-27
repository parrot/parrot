=head1 NAME

POST::Var - A variable

=head1 DESCRIPTION

POST::Var is a node containing a variable in the OST. It is a subclass
of Node.

=cut

.namespace [ "POST::Var" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Var'
    addattribute base, "varname"     # the PIR name of this variable
    .return ()
.end

.sub "set_node" :method
    .param string source
    .param int pos
    .param string varname :optional
    .param int got_varname :opt_flag
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "pos"
    $P2 = pos

    unless got_varname goto no_varname
      $P3 = new .String
      $P3 = varname
      setattribute self, "varname", $P3
    no_varname:
    .return ()
.end

.sub generate_temp :method
    .local string temp
       temp = "$P"
     $I1 = _new_temp_id()
     $S1 = $I1
     temp .= $S1
     .return (temp)
.end

# Autoincrementing id generator
.sub _new_temp_id
    .local int id
    id = 0
loop:
    inc id 
    .yield(id)
    goto loop
.end

.sub new_temp :method
    $S1 = self.generate_temp()
    self.varname($S1)
.end

.sub new_dummy :method
    .param string nodesource
    .param string nodepos
    # First we create a temporary variable
    self.set_node(nodesource,nodepos)
    self.new_temp()
    # Then we create a child array for a fabricated op to create a new
    # pmc of type 'Undef'. It has 2 arguments: the temp variable and
    # the type.
    $P5 = new .ResizablePMCArray
    push $P5, self
    $I1 = find_type 'Undef'
    $S10 = $I1
    $P6 = new 'POST::Val'
    $P6.set_node(nodesource,nodepos,$S10)
    $P6.valtype('int')
    push $P5, $P6
    # Then we create the 'new' op.
    $P7 = new 'POST::Op'
    $P7.set_node(nodesource,nodepos,'new',$P5)
    .return ($P7)
.end

.sub varname :method
    .param string varname :optional
    .param int got_varname :opt_flag
    unless got_varname goto get
  set:
    $P1 = new .String
    $P1 = varname
    setattribute self, "varname", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "varname"
    .return ($P2)
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
    self.dump_attribute("varname", level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end
