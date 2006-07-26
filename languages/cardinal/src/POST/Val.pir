=head1 NAME

POST::Val - Nodes for literal values

=head1 DESCRIPTION

POST::Val is a literal value in the OST. It is a subclass of Node.

=cut

.HLL 'Ruby', 'ruby_group'
.namespace [ "POST::Val" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Val'
    addattribute base, "value"            # the value of this leaf
    addattribute base, "valtype"          # the value type of this leaf
    .return ()
.end

.sub 'value' :method
    .param string value       :optional
    .param int passed_value   :opt_flag
    .return self.'accessor'('value', value, passed_value)
.end

.sub 'valtype' :method
    .param string valtype       :optional
    .param int passed_valtype   :opt_flag
    .return self.'accessor'('valtype', valtype, passed_valtype)
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizablePMCArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'value'
    push $P1, 'valtype'
    .return ($P1)
.end
