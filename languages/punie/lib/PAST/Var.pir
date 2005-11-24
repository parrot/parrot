=head1 NAME

PAST::Var - A variable

=head1 DESCRIPTION

PAST::Var is a node containing a variable in the AST. It is a subclass
of PAST::Node.

=cut

.namespace [ "PAST::Var" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Var'
    .return ()
.end

