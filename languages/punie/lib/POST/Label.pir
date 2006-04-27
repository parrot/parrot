=head1 NAME

POST::Label - A PIR label

=head1 DESCRIPTION

POST::Label is a node containing a label in the OST. It is a subclass of
Node. Labels can either be a destination or an argument for an
opcode.

=cut

.namespace [ "POST::Label" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Label'
    addattribute base, "name"     # the PIR name of this label
    addattribute base, "dest"     # whether label is a destination 
                                  # or a call argument
    .return ()
.end

.sub "set_node" :method
    .param string source
    .param int pos
    .param string name :optional
    .param int got_name :opt_flag
    $P1 = getattribute self, "source"
    $P1 = source
    $P2 = getattribute self, "pos"
    $P2 = pos

    unless got_name goto no_name
      $P3 = new .String
      $P3 = name
      setattribute self, "name", $P3
    no_name:
    .return ()
.end


.sub name :method
    .param string name :optional
    .param int got_name :opt_flag
    unless got_name goto get
  set:
    $P1 = new .String
    $P1 = name
    setattribute self, "name", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "name"
    .return ($P2)
.end

.sub dest :method
    .param int dest :optional
    .param int got_dest :opt_flag
    unless got_dest goto get
  set:
    $P1 = new Integer
    $P1 = dest
    setattribute self, "dest", $P1 
    .return ($P1)
  get:
    $P2 = getattribute self, "dest"
    unless null $P2 goto got_it
    $P2 = new Integer
    $P2 = 0
  got_it:
    .return ($P2)
.end

.sub __clone :method
    .local pmc result
    result = new 'POST::Label'
    $P1 = self.'name'()
    result.'name'($P1)
    $P2 = self.'dest'()
    result.'dest'($P2)
    .return (result)
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
    self.dump_attribute("name", level)
    self.dump_attribute("dest", level)

    # close off current node display
    print indent
    print "}\n"
    .return ()
.end

.sub generate_label :method
    .param string name :optional
    .param int got_name :opt_flag
    .local string label
     unless got_name goto no_name
       label = name . "_"
  no_name:
     label .= "label_"
     $I1 = _new_label_id()
     $S1 = $I1
     label .= $S1
     .return (label)
.end

# Autoincrementing id generator
.sub _new_label_id
    .local int id
    id = 0
loop:
    inc id 
    .yield(id)
    goto loop
.end

.sub new_dummy :method
    .param string name :optional
    .param int got_name :opt_flag
    # First we create a temporary variable
  if got_name goto with_name
    $S1 = self.generate_label()
    goto endif
  with_name:
    $S1 = self.generate_label(name)
  endif:
    self.'name'($S1)
    .return ()
.end
