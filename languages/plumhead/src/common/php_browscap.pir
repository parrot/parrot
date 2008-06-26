# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_browscap.pir - PHP browscap Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<mixed get_browser([string browser_name [, bool return_array]])>

Get information about the capabilities of a browser. If browser_name is omitted
or null, HTTP_USER_AGENT is used. Returns an object by default; if return_array
is true, returns an array.

NOT IMPLEMENTED.

=cut

.sub 'get_browser'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
