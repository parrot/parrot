# Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

Leaf - a sample leaf node for Language::AttributeGrammar

=head1 DESCRIPTION

=cut

.namespace [ "Leaf" ]

.sub "__onload" :tag('load')
    .local pmc base
    newclass base, "Leaf"
    addattribute base, "value"   # the value of the leaf node
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
