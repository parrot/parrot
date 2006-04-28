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
    # First we create a temporary variable
    self.new_temp()
    # Then we create a fabricated op to create a new pmc of type
    # 'Undef'. It has 2 arguments: the temp variable and the type.
    .local pmc newop
    newop = new 'POST::Op'
    newop.'clone_node'(self)
    newop.'op'('new')

    newop.'add_child'(self)
    $I1 = find_type 'Undef'
    $S10 = $I1
    $P6 = new 'POST::Val'
    $P6.'value'($S10)
    $P6.'valtype'('int')
    newop.'add_child'($P6)
    .return (newop)
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
