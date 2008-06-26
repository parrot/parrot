# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_iconv.pir - PHP iconv  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string iconv(string in_charset, string out_charset, string str)>

Returns str converted to the out_charset character set

NOT IMPLEMENTED.

=cut

.sub 'iconv'
    not_implemented()
.end

=item C<mixed iconv_get_encoding([string type])>

Get internal encoding and output encoding for ob_iconv_handler()

NOT IMPLEMENTED.

=cut

.sub 'iconv_get_encoding'
    not_implemented()
.end

=item C<string iconv_mime_decode(string encoded_string [, int mode, string charset])>

Decodes a mime header field

NOT IMPLEMENTED.

=cut

.sub 'iconv_mime_decode'
    not_implemented()
.end

=item C<array iconv_mime_decode_headers(string headers [, int mode, string charset])>

Decodes multiple mime header fields

NOT IMPLEMENTED.

=cut

.sub 'iconv_mime_decode_headers'
    not_implemented()
.end

=item C<string iconv_mime_encode(string field_name, string field_value [, array preference])>

Composes a mime header field with field_name and field_value in a specified scheme

NOT IMPLEMENTED.

=cut

.sub 'iconv_mime_encode'
    not_implemented()
.end

=item C<bool iconv_set_encoding(string type, string charset)>

Sets internal encoding and output encoding for ob_iconv_handler()

NOT IMPLEMENTED.

=cut

.sub 'iconv_set_encoding'
    not_implemented()
.end

=item C<int iconv_strlen(string str [, string charset])>

Returns the character count of str

NOT IMPLEMENTED.

=cut

.sub 'iconv_strlen'
    not_implemented()
.end

=item C<int iconv_strpos(string haystack, string needle [, int offset [, string charset]])>

Finds position of first occurrence of needle within part of haystack beginning with offset

NOT IMPLEMENTED.

=cut

.sub 'iconv_strpos'
    not_implemented()
.end

=item C<int iconv_strrpos(string haystack, string needle [, string charset])>

Finds position of last occurrence of needle within part of haystack beginning with offset

NOT IMPLEMENTED.

=cut

.sub 'iconv_strrpos'
    not_implemented()
.end

=item C<string iconv_substr(string str, int offset, [int length, string charset])>

Returns specified part of a string

NOT IMPLEMENTED.

=cut

.sub 'iconv_substr'
    not_implemented()
.end

=item C<string ob_iconv_handler(string contents, int status)>

Returns str in output buffer converted to the iconv.output_encoding character set

NOT IMPLEMENTED.

=cut

.sub 'ob_iconv_handler'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
