# Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

Leaf

=head1 DESCRIPTION

A sample leaf node for Language::AttributeGrammar.

=cut

.namespace [ "Leaf" ]

.sub "__onload" :load
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
