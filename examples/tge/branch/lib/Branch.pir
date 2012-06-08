# Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

Branch

=head1 DESCRIPTION

A sample branch node for Language::AtributeGrammar.

=cut

.namespace [ "Branch" ]

.sub "__onload" :load
    .local pmc base
    newclass base, "Branch"
    addattribute base, "left"            # left child
    addattribute base, "right"           # right child
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
