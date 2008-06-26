# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_url.pir - PHP url Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array get_headers(string url[, int format])>

fetches all the headers sent by the server in response to a HTTP request

NOT IMPLEMENTED.

=cut

.sub 'get_headers'
    not_implemented()
.end

=item C<mixed parse_url(string url, [int url_component])>

Parse a URL and return its components

NOT IMPLEMENTED.

=cut

.sub 'parse_url'
    not_implemented()
.end

=item C<string rawurldecode(string str)>

Decodes URL-encodes string

NOT IMPLEMENTED.

=cut

.sub 'rawurldecode'
    not_implemented()
.end

=item C<string rawurlencode(string str)>

URL-encodes string

NOT IMPLEMENTED.

=cut

.sub 'rawurlencode'
    not_implemented()
.end

=item C<string urldecode(string str)>

Decodes URL-encoded string

NOT IMPLEMENTED.

=cut

.sub 'urldecode'
    not_implemented()
.end

=item C<string urlencode(string str)>

URL-encodes string

NOT IMPLEMENTED.

=cut

.sub 'urlencode'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
