=head1 NAME

POST::Node - a base class for POST opcode syntax tree nodes

=head1 DESCRIPTION

All POST nodes subclass from this base type.

=cut

.namespace [ "POST::Node" ]

.sub "__onload" :load
    .local pmc base
    newclass base, "POST::Node"
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

.sub "set_node" :method
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

.sub source :method
    $P2 = getattribute self, "source"
    .return ($P2)
.end

.sub pos :method
    $P2 = getattribute self, "pos"
    .return ($P2)
.end

.sub children :method
    $P2 = getattribute self, "children"
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
    iter = new .Iterator, $P3 # loop over the array
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
