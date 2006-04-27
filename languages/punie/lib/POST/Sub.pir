=head1 NAME

POST::Sub - A subroutine declaration

=head1 DESCRIPTION

POST::Sub is a subroutine declaration in the OST. It is a subclass of
Node.

=cut

.namespace [ "POST::Sub" ]

.sub "__onload" :load
    .local pmc base
    $P0 = getclass 'Node'
    base = subclass $P0, 'POST::Sub'
    .return ()
.end

