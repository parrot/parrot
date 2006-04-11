=head1 NAME

Branch - a sample branch node for Language::AttributeGrammar

=head1 DESCRIPTION

=cut

.namespace [ "Branch" ]

.sub "__onload" :load
    .local pmc base
    newclass base, "Branch"
    addattribute base, "left"            # left child
    addattribute base, "right"           # right child
    .return ()
.end
