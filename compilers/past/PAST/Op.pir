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

.sub 'DUMPABLE' :method
    $P1 = new .ResizableStringArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'op'
    push $P1, 'children'
    .return($P1)
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
