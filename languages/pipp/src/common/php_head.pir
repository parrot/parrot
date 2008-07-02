# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_head.pir - PHP head Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void header(string header [, bool replace, [int http_response_code]])>

Sends a raw HTTP header

NOT IMPLEMENTED.

=cut

.sub 'header'
    not_implemented()
.end

=item C<array headers_list(void)>

Return list of headers to be sent / already sent

NOT IMPLEMENTED.

=cut

.sub 'headers_list'
    not_implemented()
.end

=item C<bool headers_sent([string &$file [, int &$line]])>

Returns true if headers have already been sent, false otherwise

NOT IMPLEMENTED.

=cut

.sub 'headers_sent'
    not_implemented()
.end

=item C<bool setcookie(string name [, string value [, int expires [, string path [, string domain [, bool secure[, bool httponly]]]]]])>

Send a cookie

NOT IMPLEMENTED.

=cut

.sub 'setcookie'
    not_implemented()
.end

=item C<bool setrawcookie(string name [, string value [, int expires [, string path [, string domain [, bool secure[, bool httponly]]]]]])>

Send a cookie with no url encoding of the value

NOT IMPLEMENTED.

=cut

.sub 'setrawcookie'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
