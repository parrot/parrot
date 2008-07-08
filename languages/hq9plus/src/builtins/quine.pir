# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1

quine.pir -- a simple print, the code is passed in

=cut

.namespace []

.sub 'quine'

    .param pmc code_string

    print code_string

    .return ( )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
