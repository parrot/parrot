# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1

say.pir -- simple implementation of a say function

=cut

.namespace []

.sub '!array'
    .param pmc args            :slurpy
    .return (args)
.end

.sub '!hash'
    .param pmc args            :slurpy :named
    .return (args)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
