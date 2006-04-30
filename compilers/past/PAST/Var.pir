=head1 NAME

PAST::Var - A variable

=head1 DESCRIPTION

PAST::Var is a node containing a variable in the AST. It is a subclass
of Node.

=cut

.namespace [ "PAST::Var" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Var'
    .return ()
.end

