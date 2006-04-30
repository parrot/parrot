=head1 NAME

PAST::Exp - An expression

=head1 DESCRIPTION

PAST::Exp is an expression in the AST. It is a subclass of
Node.

=cut

.namespace [ "PAST::Exp" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'PAST::Exp'
    .return ()
.end

