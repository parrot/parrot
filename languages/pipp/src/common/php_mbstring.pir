# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_mbstring.pir - PHP mbstring  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool mb_check_encoding([string var[, string encoding]])>

Check if the string is valid for the specified encoding

NOT IMPLEMENTED.

=cut

.sub 'mb_check_encoding'
    not_implemented()
.end

=item C<string mb_convert_case(string sourcestring, int mode [, string encoding])>

Returns a case-folded version of sourcestring

NOT IMPLEMENTED.

=cut

.sub 'mb_convert_case'
    not_implemented()
.end

=item C<string mb_convert_encoding(string str, string to-encoding [, mixed from-encoding])>

Returns converted string in desired encoding

NOT IMPLEMENTED.

=cut

.sub 'mb_convert_encoding'
    not_implemented()
.end

=item C<string mb_convert_kana(string str [, string option] [, string encoding])>

Conversion between full-width character and half-width character (Japanese)

NOT IMPLEMENTED.

=cut

.sub 'mb_convert_kana'
    not_implemented()
.end

=item C<string mb_convert_variables(string to-encoding, mixed from-encoding [, mixed ...])>

Converts the string resource in variables to desired encoding

NOT IMPLEMENTED.

=cut

.sub 'mb_convert_variables'
    not_implemented()
.end

=item C<string mb_decode_mimeheader(string string)>

Decodes the MIME "encoded-word" in the string

NOT IMPLEMENTED.

=cut

.sub 'mb_decode_mimeheader'
    not_implemented()
.end

=item C<string mb_decode_numericentity(string string, array convmap [, string encoding])>

Converts HTML numeric entities to character code

NOT IMPLEMENTED.

=cut

.sub 'mb_decode_numericentity'
    not_implemented()
.end

=item C<string mb_detect_encoding(string str [, mixed encoding_list [, bool strict]])>

Encodings of the given string is returned (as a string)

NOT IMPLEMENTED.

=cut

.sub 'mb_detect_encoding'
    not_implemented()
.end

=item C<bool|array mb_detect_order([mixed encoding-list])>

Sets the current detect_order or Return the current detect_order as a array

NOT IMPLEMENTED.

=cut

.sub 'mb_detect_order'
    not_implemented()
.end

=item C<string mb_encode_mimeheader(string str [, string charset [, string transfer-encoding [, string linefeed [, int indent]]]])>

Converts the string to MIME "encoded-word" in the format of =?charset?(B|Q)?encoded_string?=

NOT IMPLEMENTED.

=cut

.sub 'mb_encode_mimeheader'
    not_implemented()
.end

=item C<string mb_encode_numericentity(string string, array convmap [, string encoding])>

Converts specified characters to HTML numeric entities

NOT IMPLEMENTED.

=cut

.sub 'mb_encode_numericentity'
    not_implemented()
.end

=item C<int mb_ereg(string pattern, string string [, array registers])>

Regular expression match for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg'
    not_implemented()
.end

=item C<bool mb_ereg_match(string pattern, string string [,string option])>

Regular expression match for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_match'
    not_implemented()
.end

=item C<string mb_ereg_replace(string pattern, string replacement, string string [, string option])>

Replace regular expression for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_replace'
    not_implemented()
.end

=item C<bool mb_ereg_search([string pattern[, string option]])>

Regular expression search for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search'
    not_implemented()
.end

=item C<int mb_ereg_search_getpos(void)>

Get search start position

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search_getpos'
    not_implemented()
.end

=item C<array mb_ereg_search_getregs(void)>

Get matched substring of the last time

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search_getregs'
    not_implemented()
.end

=item C<bool mb_ereg_search_init(string string [, string pattern[, string option]])>

Initialize string and regular expression for search.

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search_init'
    not_implemented()
.end

=item C<array mb_ereg_search_pos([string pattern[, string option]])>

Regular expression search for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search_pos'
    not_implemented()
.end

=item C<array mb_ereg_search_regs([string pattern[, string option]])>

Regular expression search for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search_regs'
    not_implemented()
.end

=item C<bool mb_ereg_search_setpos(int position)>

Set search start position

NOT IMPLEMENTED.

=cut

.sub 'mb_ereg_search_setpos'
    not_implemented()
.end

=item C<int mb_eregi(string pattern, string string [, array registers])>

Case-insensitive regular expression match for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_eregi'
    not_implemented()
.end

=item C<string mb_eregi_replace(string pattern, string replacement, string string)>

Case insensitive replace regular expression for multibyte string

NOT IMPLEMENTED.

=cut

.sub 'mb_eregi_replace'
    not_implemented()
.end

=item C<mixed mb_get_info([string type])>

Returns the current settings of mbstring

NOT IMPLEMENTED.

=cut

.sub 'mb_get_info'
    not_implemented()
.end

=item C<mixed mb_http_input([string type])>

Returns the input encoding

NOT IMPLEMENTED.

=cut

.sub 'mb_http_input'
    not_implemented()
.end

=item C<string mb_http_output([string encoding])>

Sets the current output_encoding or returns the current output_encoding as a string

NOT IMPLEMENTED.

=cut

.sub 'mb_http_output'
    not_implemented()
.end

=item C<string mb_internal_encoding([string encoding])>

Sets the current internal encoding or Returns the current internal encoding as a string

NOT IMPLEMENTED.

=cut

.sub 'mb_internal_encoding'
    not_implemented()
.end

=item C<string mb_language([string language])>

Sets the current language or Returns the current language as a string

NOT IMPLEMENTED.

=cut

.sub 'mb_language'
    not_implemented()
.end

=item C<mixed mb_list_encodings()>

Returns an array of all supported entity encodings

NOT IMPLEMENTED.

=cut

.sub 'mb_list_encodings'
    not_implemented()
.end

=item C<array mb_list_encodings_alias_names([string encoding])>

Returns an array of all supported alias encodings

NOT IMPLEMENTED.

=cut

.sub 'mb_list_encodings_alias_names'
    not_implemented()
.end

=item C<mixed mb_list_mime_names([string encoding])>

Returns an array or string of all supported mime names

NOT IMPLEMENTED.

=cut

.sub 'mb_list_mime_names'
    not_implemented()
.end

=item C<string mb_output_handler(string contents, int status)>

Returns string in output buffer converted to the http_output encoding

NOT IMPLEMENTED.

=cut

.sub 'mb_output_handler'
    not_implemented()
.end

=item C<bool mb_parse_str(string encoded_string [, array result])>

Parses GET/POST/COOKIE data and sets global variables

NOT IMPLEMENTED.

=cut

.sub 'mb_parse_str'
    not_implemented()
.end

=item C<string mb_preferred_mime_name(string encoding)>

Return the preferred MIME name (charset) as a string

NOT IMPLEMENTED.

=cut

.sub 'mb_preferred_mime_name'
    not_implemented()
.end

=item C<string mb_regex_encoding([string encoding])>

Returns the current encoding for regex as a string.

NOT IMPLEMENTED.

=cut

.sub 'mb_regex_encoding'
    not_implemented()
.end

=item C<string mb_regex_set_options([string options])>

Set or get the default options for mbregex functions

NOT IMPLEMENTED.

=cut

.sub 'mb_regex_set_options'
    not_implemented()
.end

=item C<int mb_send_mail(string to, string subject, string message [, string additional_headers [, string additional_parameters]])>

*  Sends an email message with MIME scheme


NOT IMPLEMENTED.

=cut

.sub 'mb_send_mail'
    not_implemented()
.end

=item C<array mb_split(string pattern, string string [, int limit])>

split multibyte string into array by regular expression

NOT IMPLEMENTED.

=cut

.sub 'mb_split'
    not_implemented()
.end

=item C<string mb_strcut(string str, int start [, int length [, string encoding]])>

Returns part of a string

NOT IMPLEMENTED.

=cut

.sub 'mb_strcut'
    not_implemented()
.end

=item C<string mb_strimwidth(string str, int start, int width [, string trimmarker [, string encoding]])>

Trim the string in terminal width

NOT IMPLEMENTED.

=cut

.sub 'mb_strimwidth'
    not_implemented()
.end

=item C<int mb_stripos(string haystack, string needle [, int offset [, string encoding]])>

Finds position of first occurrence of a string within another, case insensitive

NOT IMPLEMENTED.

=cut

.sub 'mb_stripos'
    not_implemented()
.end

=item C<string mb_stristr(string haystack, string needle[, bool part[, string encoding]])>

Finds first occurrence of a string within another, case insensitive

NOT IMPLEMENTED.

=cut

.sub 'mb_stristr'
    not_implemented()
.end

=item C<int mb_strlen(string str [, string encoding])>

Get character numbers of a string

NOT IMPLEMENTED.

=cut

.sub 'mb_strlen'
    not_implemented()
.end

=item C<int mb_strpos(string haystack, string needle [, int offset [, string encoding]])>

Find position of first occurrence of a string within another

NOT IMPLEMENTED.

=cut

.sub 'mb_strpos'
    not_implemented()
.end

=item C<string mb_strrchr(string haystack, string needle[, bool part[, string encoding]])>

Finds the last occurrence of a character in a string within another

NOT IMPLEMENTED.

=cut

.sub 'mb_strrchr'
    not_implemented()
.end

=item C<string mb_strrichr(string haystack, string needle[, bool part[, string encoding]])>

Finds the last occurrence of a character in a string within another, case insensitive

NOT IMPLEMENTED.

=cut

.sub 'mb_strrichr'
    not_implemented()
.end

=item C<int mb_strripos(string haystack, string needle [, int offset [, string encoding]])>

Finds position of last occurrence of a string within another, case insensitive

NOT IMPLEMENTED.

=cut

.sub 'mb_strripos'
    not_implemented()
.end

=item C<int mb_strrpos(string haystack, string needle [, int offset [, string encoding]])>

Find position of last occurrence of a string within another

NOT IMPLEMENTED.

=cut

.sub 'mb_strrpos'
    not_implemented()
.end

=item C<string mb_strstr(string haystack, string needle[, bool part[, string encoding]])>

Finds first occurrence of a string within another

NOT IMPLEMENTED.

=cut

.sub 'mb_strstr'
    not_implemented()
.end

=item C<string mb_strtolower(string sourcestring [, string encoding])>

*  Returns a lowercased version of sourcestring


NOT IMPLEMENTED.

=cut

.sub 'mb_strtolower'
    not_implemented()
.end

=item C<string mb_strtoupper(string sourcestring [, string encoding])>

*  Returns a uppercased version of sourcestring


NOT IMPLEMENTED.

=cut

.sub 'mb_strtoupper'
    not_implemented()
.end

=item C<int mb_strwidth(string str [, string encoding])>

Gets terminal width of a string

NOT IMPLEMENTED.

=cut

.sub 'mb_strwidth'
    not_implemented()
.end

=item C<mixed mb_substitute_character([mixed substchar])>

Sets the current substitute_character or returns the current substitute_character

NOT IMPLEMENTED.

=cut

.sub 'mb_substitute_character'
    not_implemented()
.end

=item C<string mb_substr(string str, int start [, int length [, string encoding]])>

Returns part of a string

NOT IMPLEMENTED.

=cut

.sub 'mb_substr'
    not_implemented()
.end

=item C<int mb_substr_count(string haystack, string needle [, string encoding])>

Count the number of substring occurrences

NOT IMPLEMENTED.

=cut

.sub 'mb_substr_count'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
