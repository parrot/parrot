=head1 NAME

POST::Call - An subroutine call

=head1 DESCRIPTION

POST::Call is a call to a subroutine (consistent with the Parrot calling
conventions) in the OST. It is a subclass of Node.

=cut

.HLL 'Ruby', 'ruby_group'
.namespace [ "POST::Call" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Call'
    addattribute base, "name"         # the subroutine name
    .return ()
.end

.sub 'name' :method
    .param string name       :optional
    .param int passed_name   :opt_flag
    .return self.'accessor'('name', name, passed_name)
.end

.sub 'DUMPABLE' :method
    $P1 = new .ResizablePMCArray
    push $P1, 'source'
    push $P1, 'pos'
    push $P1, 'name'
    push $P1, 'children'
    .return ($P1)
.end
