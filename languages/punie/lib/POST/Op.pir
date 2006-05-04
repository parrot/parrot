=head1 NAME

POST::Op - An opcode

=head1 DESCRIPTION

POST::Op is a call to an opcode in the OST. It is a subclass of
Node.

=cut

.namespace [ "POST::Op" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Op'
    addattribute base, "op"         # the operator name
    .return ()
.end

.sub 'op' :method
    .param string op       :optional
    .param int passed_op   :opt_flag
    .return self.'accessor'('op', op, passed_op)
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizablePMCArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'op'
    push $P1, 'children'
    .return ($P1)
.end
