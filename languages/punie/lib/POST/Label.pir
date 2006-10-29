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

.sub 'name' :method
    .param string name       :optional
    .param int passed_name   :opt_flag
    .return self.'accessor'('name', name, passed_name)
.end

.sub 'dest' :method
    .param int dest       :optional
    .param int passed_dest   :opt_flag
    .return self.'accessor'('dest', dest, passed_dest)
.end

.sub 'clone' :method :anon :vtable
    .local pmc result
    result = new 'POST::Label'
    $P1 = self.'name'()
    result.'name'($P1)
    $P2 = self.'dest'()
    result.'dest'($P2)
    .return (result)
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizablePMCArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'name'
    push $P1, 'dest'
    .return ($P1)
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
