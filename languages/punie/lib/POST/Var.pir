=head1 NAME

POST::Var - A variable

=head1 DESCRIPTION

POST::Var is a node containing a variable in the OST. It is a subclass
of POST::Node.

=cut

.namespace [ "POST::Var" ]

.sub "__onload" @LOAD
    .local pmc base
    $P0 = getclass 'POST::Node'
    base = subclass $P0, 'POST::Var'
    .return ()
.end

