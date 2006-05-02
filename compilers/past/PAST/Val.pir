=head1 NAME

PAST::Val - Nodes for literal values

=head1 DESCRIPTION

PAST::Val is a subclass of Node.

=cut

.namespace [ "PAST::Val" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Val'
    addattribute base, "value"            # the value of this leaf
    addattribute base, "valtype"          # the value type of this leaf
    .return ()
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizableStringArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'value'
    push $P1, 'valtype'
    .return($P1)
.end

.sub value :method
    .param string value  :optional
    .param int got_value :opt_flag
    unless got_value goto get
  set:
    $P1 = new .String
    $P1 = value
    setattribute self, "value", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "value"
    .return ($P2)
.end

.sub valtype :method
    .param string valtype :optional
    .param int got_valtype :opt_flag
    unless got_valtype goto get
  set:
    $P1 = new .String
    $P1 = valtype
    setattribute self, "valtype", $P1
    .return ($P1)
  get:
    $P2 = getattribute self, "valtype"
    .return ($P2)
.end
