# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1

plus.pir -- simple implementation of a plus function

=cut

.namespace

.sub 'plus' :outer(main)

    .local pmc accumulator
    accumulator = find_lex "$accumulator"

    inc accumulator

    .return( )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

