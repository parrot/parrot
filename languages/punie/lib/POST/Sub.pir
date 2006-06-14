=head1 NAME

POST::Sub - A subroutine declaration

=head1 DESCRIPTION

POST::Sub is a subroutine declaration in the OST. It is a subclass of
Node.

=cut

.namespace [ "POST::Sub" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Sub'
    addattribute base, "name"        # the name of this subroutine
    addattribute base, "attribute"   # a PIR named attribute (such as :load or :main)
    .return ()
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizablePMCArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'name'
    push $P1, 'attribute'
    push $P1, 'children'
    .return ($P1)
.end

.sub 'name' :method
    .param string name       :optional
    .param int passed_name   :opt_flag
    .return self.'accessor'('name', name, passed_name)
.end

.sub 'attribute' :method
    .param string attribute       :optional
    .param int passed_attribute   :opt_flag
    .return self.'accessor'('attribute', attribute, passed_attribute)
.end
