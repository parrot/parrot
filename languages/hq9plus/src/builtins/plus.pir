# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1

plus.pir -- simple implementation of a plus function

=cut

.namespace []

.sub 'postfix:++' :multi(_)
    .param pmc a
    $P0 = clone a
    inc a
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

