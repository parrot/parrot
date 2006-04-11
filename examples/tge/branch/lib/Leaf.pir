=head1 NAME

Leaf - a sample leaf node for Language::AttributeGrammar

=head1 DESCRIPTION

=cut

.namespace [ "Leaf" ]

.sub "__onload" :load
    .local pmc base
    newclass base, "Leaf"
    addattribute base, "value"   # the value of the leaf node
    .return ()
.end
