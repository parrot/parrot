=head1 NAME

PAST::List - Nodes for lists and the programmers who love them

=head1 DESCRIPTION

PAST::List is a subclass of PAST::Node.

=cut

.namespace [ 'PAST::List' ]

.sub '__onload' :load
    .local pmc base
    $P0  = getclass 'PAST::Node'
    base = subclass $P0, 'PAST::List'
    .return ()
.end
