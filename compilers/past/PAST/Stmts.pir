=head1 NAME

PAST::Stmts - A series of statements

=head1 DESCRIPTION

PAST::Stmts is the top-level of the AST and contains a series of
statements. It is a subclass of Node.

=cut

.namespace [ "PAST::Stmts" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Stmts'
    .return ()
.end

