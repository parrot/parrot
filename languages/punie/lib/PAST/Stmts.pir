=head1 NAME

PAST::Stmts - A series of statements

=head1 DESCRIPTION

PAST::Stmts is the top-level of the AST and contains a series of
statements. It is a subclass of PAST::Node.

=cut

.namespace [ "PAST::Stmts" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Stmts'
    .return ()
.end

