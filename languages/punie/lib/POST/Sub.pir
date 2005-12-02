=head1 NAME

POST::Sub - A subroutine declaration

=head1 DESCRIPTION

POST::Sub is a subroutine declaration in the OST. It is a subclass of
POST::Node.

=cut

.namespace [ "POST::Sub" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'POST::Node'
    base = subclass $P0, 'POST::Sub'
    .return ()
.end

