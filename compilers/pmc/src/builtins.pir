# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 Builtins

Variour helper builtins.

=cut
.namespace []

.sub 'uc'
    .param string arg
    $S0 = upcase arg
    .return ($S0)
.end

.sub 'join'
    .param string joiner
    .param pmc args

    $S0 = join joiner, args
    .return ($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
