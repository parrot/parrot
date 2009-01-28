# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

=head1 NAME

php_string.pir - PHP string Standard Library

=head1 DESCRIPTION

See L<http://www.php.net/manual/en/book.strings.php>.

=head1 TODO

Implement functions.
Rename file to extensions/strings.pir.

=head2 Functions

=over 4

=cut

.sub '_bin2hex' :anon
    .param string old
    .const string hexconvtab = '0123456789abcdef'
    $P0 = split '', old
    $S0 = ''
  L1:
    unless $P0 goto L2
    $S1 = shift $P0
    $I1 = ord $S1
    $I2 = $I1 >> 4
    $S1 = substr hexconvtab, $I2, 1
    $S0 .= $S1
    $I2 = $I1 & 0x0f
    $S1 = substr hexconvtab, $I2, 1
    $S0 .= $S1
    goto L1
  L2:
    .return ($S0)
.end

.sub '_trim' :anon
    .param string str
    .param string what
    .param int mode
    .local int idx, len
    $I0 = mode & 1
    unless $I0 goto L1
    idx = 0
    len = length str
  L2:
    unless idx < len goto L3
    $S0 = substr str, idx, 1
    $I0 = index what, $S0
    if $I0 < 0 goto L3
    inc idx
    goto L2
  L3:
    str = substr str, idx
  L1:
    $I0 = mode & 2
    unless $I0 goto L4
    len = length str
    idx = len - 1
  L5:
    unless idx >= 0 goto L6
    $S0 = substr str, idx, 1
    $I0 = index what, $S0
    if $I0 < 0 goto L6
    dec idx
    goto L5
  L6:
    inc idx
    str = substr str, 0, idx
  L4:
    .RETURN_STRING(str)
.end

.macro DO_TRIM(args, mode)
    .local int argc
    argc = .args
    if argc < 1 goto L1
    if argc > 2 goto L1
    goto L2
  L1:
    wrong_param_count()
    .RETURN_NULL()
  L2:
    $P1 = shift args
    $S1 = $P1
    unless argc > 1 goto L3
    $P2 = shift args
    $S2 = $P2
    .tailcall _trim($S1, $S2, .mode)
  L3:
    .tailcall _trim($S1, " \n\r\t\v\0", .mode)
.endm

=item C<string addcslashes(string str, string charlist)>

Escapes all chars mentioned in charlist with backslash. It creates octal representations if asked to backslash characters with 8th bit set or with an ascii valeu less than 32 (except '\n', '\r', '\t' etc...).

NOT IMPLEMENTED.

=cut

.sub 'addcslashes'
    not_implemented()
.end

=item C<string addslashes(string str)>

Escapes single quote, double quotes and backslash characters in a string with backslashes

NOT IMPLEMENTED.

=cut

.sub 'addslashes'
    not_implemented()
.end

=item C<string bin2hex(string data)>

Converts the binary representation of data to hex

=cut

.sub 'bin2hex'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    $S0 = _bin2hex($S1)
    .RETURN_STRING($S0)
.end

=item C<string chop(string str [, string character_mask])>

Alias of C<rtrim>.

=cut

.sub 'chop'
    .param pmc args :slurpy

    .tailcall rtrim(args :flat)
.end

=item C<string chr(int ascii)>

Converts ASCII code to a character

=cut

.sub 'chr'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I1 = $P1
    $S0 = chr $I1
    .RETURN_STRING($S0)
.end

=item C<string chunk_split(string str [, int chunklen [, string ending]])>

Inserts the string C<ending> every C<chunklen> characters into the string C<str>.
Default for C<chunklen> is 76. Default for C<ending> is '\r\n'.

NOT IMPLEMENTED.

=cut

.sub 'chunk_split'
    .param pmc args :slurpy

    .local int argc
    argc = args
    unless argc > 3 goto L1
    wrong_param_count()
    unless argc == 0 goto L1
    wrong_param_count()
  L1:
    .local string ending
    ending = "\r\n"   # TODO: the windows case
    unless argc == 3 goto L2
    ending = pop args
    argc = args
  L2:
    .local int chunk_len
    chunk_len = 76
    unless argc == 2 goto L3
       chunk_len = pop args
  L3:
    .local string str
    str = pop args
    argc = args

    # compute number of complete chunks and length of the rest
    .local int str_len
    str_len = length str
    .local int num_chunks
    num_chunks = str_len / chunk_len
    .local int rest_len
    rest_len = mod str_len, chunk_len

    # assemble the output
    .local string res, chunk
    .local int i, cursor
    i = 0
    cursor = 0
  L4:
    unless i < num_chunks goto L5
    chunk = substr str, cursor, chunk_len
    concat res, chunk
    concat res, ending
    inc i
    cursor = cursor + chunk_len
    goto L4
  L5:

    unless rest_len > 0 goto L6
    chunk = substr str, cursor
    concat res, chunk
    concat res, ending
  L6:

    .RETURN_STRING(res)
.end

=item C<mixed count_chars(string input [, int mode])>

Returns info about what characters are used in input

NOT IMPLEMENTED.

=cut

.sub 'count_chars'
    not_implemented()
.end

=item C<array explode(string separator, string str [, int limit])>

Splits a string on string separator and return array of components. If limit is positive only limit number of components is returned. If limit is negative all components except the last abs(limit) are returned.

NOT IMPLEMENTED.

=cut

.sub 'explode'
    not_implemented()
.end

=item C<string hebrev(string str [, int max_chars_per_line])>

Converts logical Hebrew text to visual text

NOT IMPLEMENTED.

=cut

.sub 'hebrev'
    not_implemented()
.end

=item C<string hebrevc(string str [, int max_chars_per_line])>

Converts logical Hebrew text to visual text with newline conversion

NOT IMPLEMENTED.

=cut

.sub 'hebrevc'
    not_implemented()
.end

=item C<string implode([string glue,] array pieces)>

Joins array elements placing glue string between items and return one string

NOT IMPLEMENTED.

=cut

.sub 'implode'
    not_implemented()
.end

=item C<string join(array src, string glue)>

An alias for implode

=cut

.sub 'join'
    .param pmc args :slurpy

    .tailcall implode(args :flat)
.end

=item C<array localeconv(void)>

Returns numeric formatting information based on the current locale

NOT IMPLEMENTED.

=cut

.sub 'localeconv'
    not_implemented()
.end

=item C<string ltrim(string str [, string character_mask])>

Strips whitespace from the beginning of a string

=cut

.sub 'ltrim'
    .param pmc args :slurpy
    .DO_TRIM(args, 1)
.end

=item C<string money_format(string format , float value)>

Convert monetary value(s) to string

NOT IMPLEMENTED.

=cut

.sub 'money_format'
    not_implemented()
.end

=item C<string nl2br(string str)>

Converts newlines to HTML line breaks

NOT IMPLEMENTED.

=cut

.sub 'nl2br'
    not_implemented()
.end

=item C<string nl_langinfo(int item)>

Query language and locale information

NOT IMPLEMENTED.

=cut

.sub 'nl_langinfo'
    not_implemented()
.end

=item C<int ord(string character)>

Returns ASCII value of character

=cut

.sub 'ord'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    $I1 = length $S1
    unless $I1 goto L2
    $I0 = ord $S1
    .RETURN_LONG($I0)
  L2:
    .RETURN_LONG(0)
.end

=item C<void parse_str(string encoded_string [, array result])>

Parses GET/POST/COOKIE data and sets global variables

NOT IMPLEMENTED.

=cut

.sub 'parse_str'
    not_implemented()
.end

=item C<string quotemeta(string str)>

Quotes meta characters

NOT IMPLEMENTED.

=cut

.sub 'quotemeta'
    not_implemented()
.end

=item C<string rtrim(string str [, string character_mask])>

Removes trailing whitespace

=cut

.sub 'rtrim'
    .param pmc args :slurpy
    .DO_TRIM(args, 2)
.end

=item C<string setlocale(mixed category, string locale [, string ...])>

Set locale information

NOT IMPLEMENTED.

=cut

.sub 'setlocale'
    not_implemented()
.end

=item C<int similar_text(string str1, string str2 [, float percent])>

Calculates the similarity between two strings

NOT IMPLEMENTED.

=cut

.sub 'similar_text'
    not_implemented()
.end

=item C<mixed sscanf(string str, string format [, string ...])>

Implements an ANSI C compatible sscanf

NOT IMPLEMENTED.

=cut

.sub 'sscanf'
    not_implemented()
.end

=item C<mixed str_ireplace(mixed search, mixed replace, mixed subject [, int &replace_count])>

Replaces all occurrences of search in haystack with replace / case-insensitive

NOT IMPLEMENTED.

=cut

.sub 'str_ireplace'
    not_implemented()
.end

=item C<string str_pad(string input, int pad_length [, string pad_string [, int pad_type]])>

Returns input string padded on the left or right to specified length with pad_string

NOT IMPLEMENTED.

=cut

.sub 'str_pad'
    not_implemented()
.end

=item C<string str_repeat(string input, int mult)>

Returns the input string repeat mult times

=cut

.sub 'str_repeat'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    $P2 = shift args
    $I2 = $P2
    unless $I2 < 0 goto L2
    error(E_WARNING, "Second argument has to be greater than or equal to 0")
    .RETURN_NULL()
  L2:
    $S0 = repeat $S1, $I2
    .RETURN_STRING($S0)
.end

=item C<mixed str_replace(mixed search, mixed replace, mixed subject [, int &replace_count])>

Replaces all occurrences of search in subject with replace.

TODO: search and replace may be arrays.
TODO: Passing back the number of replacements in replace_count.
TODO: error and parameter checking

=cut

.sub 'str_replace'
    .param pmc search
    .param pmc replace
    .param pmc subject

    $S1 = subject
    $S2 = search
    $I2 = length $S2
    $S3 = replace
    $P0 = split $S2, $S1
    $S0 = join $S3, $P0

    .RETURN_STRING($S0)
.end


=item C<string str_rot13(string str)>

Perform the rot13 transform on a string

NOT IMPLEMENTED.

=cut

.sub 'str_rot13'
    not_implemented()
.end

=item C<void str_shuffle(string str)>

Shuffles string. One permutation of all possible is created

NOT IMPLEMENTED.

=cut

.sub 'str_shuffle'
    not_implemented()
.end

=item C<array str_split(string str [, int split_length])>

Convert a string to an array. If split_length is specified, break the string down into chunks each split_length characters long.

NOT IMPLEMENTED.

=cut

.sub 'str_split'
    not_implemented()
.end

=item C<mixed str_word_count(string str, [int format [, string charlist]])>

Counts the number of words inside a string. If format of 1 is specified,
then the function will return an array containing all the words
found inside the string. If format of 2 is specified, then the function
will return an associated array where the position of the word is the key
and the word itself is the value.

For the purpose of this function, 'word' is defined as a locale dependent
string containing alphabetic characters, which also may contain, but not start
with "'" and "-" characters.


NOT IMPLEMENTED.

=cut

.sub 'str_word_count'
    not_implemented()
.end

=item C<string strchr(string haystack, string needle)>

An alias for strstr

=cut

.sub 'strchr'
    .param pmc args :slurpy
    .tailcall strstr(args :flat)
.end

=item C<int strcoll(string str1, string str2)>

Compares two strings using the current locale

NOT IMPLEMENTED.

=cut

.sub 'strcoll'
    not_implemented()
.end

=item C<int strcspn(string str, string mask [, start [, len]])>

Finds length of initial segment consisting entirely of characters not found in mask. If start or/and length is provide works like strcspn(substr($s,$start,$len),$bad_chars)

NOT IMPLEMENTED.

=cut

.sub 'strcspn'
    not_implemented()
.end

=item C<string strip_tags(string str [, string allowable_tags])>

Strips HTML and PHP tags from a string

NOT IMPLEMENTED.

=cut

.sub 'strip_tags'
    not_implemented()
.end

=item C<string stripcslashes(string str)>

Strips backslashes from a string. Uses C-style conventions

NOT IMPLEMENTED.

=cut

.sub 'stripcslashes'
    not_implemented()
.end

=item C<int stripos(string haystack, string needle [, int offset])>

Finds position of first occurrence of a string within another, case insensitive

NOT IMPLEMENTED.

=cut

.sub 'stripos'
    not_implemented()
.end

=item C<string stripslashes(string str)>

Strips backslashes from a string

NOT IMPLEMENTED.

=cut

.sub 'stripslashes'
    not_implemented()
.end

=item C<string stristr(string haystack, string needle)>

Finds first occurrence of a string within another, case insensitive

NOT IMPLEMENTED.

=cut

.sub 'stristr'
    not_implemented()
.end

=item C<int strnatcasecmp(string s1, string s2)>

Returns the result of case-insensitive string comparison using 'natural' algorithm

NOT IMPLEMENTED.

=cut

.sub 'strnatcasecmp'
    not_implemented()
.end

=item C<int strnatcmp(string s1, string s2)>

Returns the result of string comparison using 'natural' algorithm

NOT IMPLEMENTED.

=cut

.sub 'strnatcmp'
    not_implemented()
.end

=item C<array strpbrk(string haystack, string char_list)>

Search a string for any of a set of characters

NOT IMPLEMENTED.

=cut

.sub 'strpbrk'
    not_implemented()
.end

=item C<int strpos(string haystack, string needle [, int offset])>

Finds position of first occurrence of a string within another

=cut

.sub 'strpos'
    .param pmc args :slurpy
    .local int argc
    argc = args
    if argc < 2 goto L1
    if argc > 3 goto L1
    goto L2
  L1:
    wrong_param_count()
    .RETURN_NULL()
  L2:
    $P1 = shift args
    $S1 = $P1
    $P2 = shift args
    $I3 = 0
    unless argc > 2 goto L3
    $P3 = shift args
    $I3 = $P3
  L3:
    $I1 = length $S1
    if $I3 < 0 goto L4
    if $I3 > $I1 goto L4
    goto L5
  L4:
    error(E_WARNING, "Offset not contained in string")
    .RETURN_FALSE()
  L5:
    $S2 = $P2
    unless $S2 == '' goto L6
    error(E_WARNING, "Empty delimiter")
    .RETURN_FALSE()
  L6:
    $I0 = index $S1, $S2, $I3
    if $I0 < 0 goto L7
    .RETURN_LONG($I0)
  L7:
    .RETURN_FALSE()
.end

=item C<string strrchr(string haystack, string needle)>

Finds the last occurrence of a character in a string within another

NOT IMPLEMENTED.

=cut

.sub 'strrchr'
    not_implemented()
.end

=item C<string strrev(string str)>

Reverse a string

NOT IMPLEMENTED.

=cut

.sub 'strrev'
    not_implemented()
.end

=item C<int strripos(string haystack, string needle [, int offset])>

Finds position of last occurrence of a string within another string

NOT IMPLEMENTED.

=cut

.sub 'strripos'
    not_implemented()
.end

=item C<int strrpos(string haystack, string needle [, int offset])>

Finds position of last occurrence of a string within another string

NOT IMPLEMENTED.

=cut

.sub 'strrpos'
    not_implemented()
.end

=item C<int strspn(string str, string mask [, start [, len]])>

Finds length of initial segment consisting entirely of characters found in mask. If start or/and length is provided works like strspn(substr($s,$start,$len),$good_chars)

NOT IMPLEMENTED.

=cut

.sub 'strspn'
    not_implemented()
.end

=item C<string strstr(string haystack, string needle)>

Finds first occurrence of a string within another

=cut

.sub 'strstr'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    $P2 = shift args
    $S2 = $P2
    unless $S2 == '' goto L2
    error(E_WARNING, "Empty delimiter")
    .RETURN_FALSE()
  L2:
    $I0 = index $S1, $S2
    if $I0 < 0 goto L3
    $S0 = substr $S1, $I0
    .RETURN_STRING($S0)
  L3:
    .RETURN_FALSE()
.end

=item C<string strtok([string str,] string token)>

Tokenize a string

NOT IMPLEMENTED.

=cut

.sub 'strtok'
    not_implemented()
.end

=item C<string strtolower(string str)>

Makes a string lowercase

=cut

.sub 'strtolower'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S0 = $P1
    downcase $S0
    .RETURN_STRING($S0)
.end

=item C<string strtoupper(string str)>

Makes a string uppercase

=cut

.sub 'strtoupper'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S0 = $P1
    upcase $S0
    .RETURN_STRING($S0)
.end

=item C<string strtr(string str, string from[, string to])>

Translates characters in str using given translation tables

NOT IMPLEMENTED.

=cut

.sub 'strtr'
    not_implemented()
.end

=item C<string substr(string str, int start [, int length])>

Returns part of a string

=cut

.sub 'substr'
    .param pmc args :slurpy
    .local int argc
    argc = args
    if argc < 2 goto L1
    if argc > 3 goto L1
    goto L2
  L1:
    wrong_param_count()
    .RETURN_NULL()
  L2:
    $P1 = shift args
    $S1 = $P1
    $P2 = shift args
    $I2 = $P2
    $I3 = 0
    unless argc > 2 goto L3
    $P3 = shift args
    $I3 = $P3
    $S0 = substr $S1, $I2, $I3
    .RETURN_STRING($S0)
  L3:
    $S0 = substr $S1, $I2
    .RETURN_STRING($S0)
.end

=item C<int substr_compare(string main_str, string str, int offset [, int length [, bool case_sensitivity]])>

Binary safe optionally case insensitive comparison of 2 strings from an offset, up to length characters

NOT IMPLEMENTED.

=cut

.sub 'substr_compare'
    not_implemented()
.end

=item C<int substr_count(string haystack, string needle [, int offset [, int length]])>

Returns the number of times a substring occurs in the string

NOT IMPLEMENTED.

=cut

.sub 'substr_count'
    not_implemented()
.end

=item C<mixed substr_replace(mixed str, mixed repl, mixed start [, mixed length])>

Replaces part of a string with another string

NOT IMPLEMENTED.

=cut

.sub 'substr_replace'
    not_implemented()
.end

=item C<string trim(string str [, string character_mask])>

Strips whitespace from the beginning and end of a string

=cut

.sub 'trim'
    .param pmc args :slurpy
    .DO_TRIM(args, 3)
.end

=item C<string ucfirst(string str)>

Makes a string's first character uppercase

=cut

.sub 'ucfirst'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    unless $S1 == '' goto L2
    .RETURN_EMPTY_STRING()
  L2:
    $S2 = substr $S1, 0, 1
    upcase $S2
    $S3 = substr $S1, 1
    $S0 = concat $S2, $S3
    .RETURN_STRING($S0)
.end

=item C<string ucwords(string str)>

Uppercase the first character of every word in a string

NOT IMPLEMENTED.

=cut

.sub 'ucwords'
    not_implemented()
.end

=item C<string wordwrap(string str [, int width [, string break [, boolean cut]]])>

Wraps buffer to selected number of characters using string break char

NOT IMPLEMENTED.

=cut

.sub 'wordwrap'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
