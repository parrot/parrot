=head1 NAME

PAST::Stmt - A single statement

=head1 DESCRIPTION

PAST::Stmt is an individual statement in the AST. It is a subclass of
Node.

=cut

.namespace [ "PAST::Stmt" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Stmt'
    .return ()
.end

