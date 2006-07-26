=head1 NAME

POST::Ops - A series of opcodes

=head1 DESCRIPTION

POST::Ops is the top-level of the AST and contains a sequence of
opcodes. (Ultimately these are flattened out, but they're a convenient
fiction when a single HLL statement generates a sequence of opcodes.)
POST::Ops is a subclass of Node.

=cut

.HLL 'Ruby', 'ruby_group'
.namespace [ "POST::Ops" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Ops'
    addattribute base, "tmpvar"      # temp variable for result of ops
    .return ()
.end

.sub 'tmpvar' :method
    .param pmc tmpvar       :optional
    .param int passed_tmpvar   :opt_flag
    .return self.'accessor'('tmpvar', tmpvar, passed_tmpvar)
.end
