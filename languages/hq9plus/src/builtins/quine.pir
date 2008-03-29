# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1

quine.pir -- simple implementation of a quine function

=cut

.namespace

.sub 'quine'  :outer(main)

    .local pmc code_string
    code_string = find_lex "$code_string"

    print code_string

    .return ( )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

