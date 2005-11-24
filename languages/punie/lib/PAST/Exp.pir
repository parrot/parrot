=head1 NAME

PAST::Exp - An expression

=head1 DESCRIPTION

PAST::Exp is an expression in the AST. It is a subclass of
PAST::Node.

=cut

.namespace [ "PAST::Exp" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Exp'
    .return ()
.end

