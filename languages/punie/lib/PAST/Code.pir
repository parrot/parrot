=head1 NAME

PAST::Code - A code block

=head1 DESCRIPTION

PAST::Code represents a block of code in the AST. It is a subclass of
PAST::Node.

=cut

.namespace [ "PAST::Code" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Code'
    .return ()
.end

