=head1 NAME

PAST::Stmt - A single statement

=head1 DESCRIPTION

PAST::Stmt is an individual statement in the AST. It is a subclass of
PAST::Node.

=cut

.namespace [ "PAST::Stmt" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Stmt'
    .return ()
.end

