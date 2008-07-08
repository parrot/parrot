# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1

hello.pir -- simple implementation of a hello function

=cut

.namespace []

.sub 'hello'

    print "Hello, world!\n"

    .return ( )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

