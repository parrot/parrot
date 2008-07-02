# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_html.pir - PHP html Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array get_html_translation_table([int table [, int quote_style]])>

Returns the internal translation table used by htmlspecialchars and htmlentities

NOT IMPLEMENTED.

=cut

.sub 'get_html_translation_table'
    not_implemented()
.end

=item C<string html_entity_decode(string string [, int quote_style][, string charset])>

Convert all HTML entities to their applicable characters

NOT IMPLEMENTED.

=cut

.sub 'html_entity_decode'
    not_implemented()
.end

=item C<string htmlentities(string string [, int quote_style[, string charset[, bool double_encode]]])>

Convert all applicable characters to HTML entities

NOT IMPLEMENTED.

=cut

.sub 'htmlentities'
    not_implemented()
.end

=item C<string htmlspecialchars(string string [, int quote_style[, string charset[, bool double_encode]]])>

Convert special characters to HTML entities

NOT IMPLEMENTED.

=cut

.sub 'htmlspecialchars'
    not_implemented()
.end

=item C<string htmlspecialchars_decode(string string [, int quote_style])>

Convert special HTML entities back to characters

NOT IMPLEMENTED.

=cut

.sub 'htmlspecialchars_decode'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
