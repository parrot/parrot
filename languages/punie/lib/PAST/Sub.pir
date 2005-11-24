=head1 NAME

PAST::Sub - A subroutine declaration

=head1 DESCRIPTION

PAST::Sub is a subroutine declaration in the AST. It is a subclass of
PAST::Node.

=cut

.namespace [ "PAST::Sub" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::Sub'
    .return ()
.end

