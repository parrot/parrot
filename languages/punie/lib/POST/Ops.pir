=head1 NAME

POST::Ops - A series of opcodes

=head1 DESCRIPTION

POST::Ops is the top-level of the AST and contains a sequence of
opcodes. (Ultimately these are flattened out, but they're a convenient
fiction when a single HLL statement generates a sequence of opcodes.)
POST::Ops is a subclass of POST::Node.

=cut

.namespace [ "POST::Ops" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'POST::Node'
    base = subclass $P0, 'POST::Ops'
    .return ()
.end

