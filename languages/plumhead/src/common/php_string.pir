# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_string.pir - PHP string Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string addcslashes(string str, string charlist)>

Escapes all chars mentioned in charlist with backslash. It creates octal representations if asked to backslash characters with 8th bit set or with an ascii valeu less than 32 (except '\n', '\r', '\t' etc...).

=cut

.sub 'addcslashes'
    not_implemented()
.end

=item C<string addslashes(string str)>

Escapes single quote, double quotes and backslash characters in a string with backslashes

=cut

.sub 'addslashes'
    not_implemented()
.end

=item C<string basename(string path [, string suffix])>

Returns the filename component of the path

=cut

.sub 'basename'
    not_implemented()
.end

=item C<string bin2hex(string data)>

Converts the binary representation of data to hex

=cut

.sub 'bin2hex'
    not_implemented()
.end

=item C<string chr(int ascii)>

Converts ASCII code to a character

=cut

.sub 'chr'
    not_implemented()
.end

=item C<string chunk_split(string str [, int chunklen [, string ending]])>

Returns split line

=cut

.sub 'chunk_split'
    not_implemented()
.end

=item C<mixed count_chars(string input [, int mode])>

Returns info about what characters are used in input

=cut

.sub 'count_chars'
    not_implemented()
.end

=item C<string dirname(string path)>

Returns the directory name component of the path

=cut

.sub 'dirname'
    not_implemented()
.end

=item C<array explode(string separator, string str [, int limit])>

Splits a string on string separator and return array of components. If limit is positive only limit number of components is returned. If limit is negative all components except the last abs(limit) are returned.

=cut

.sub 'explode'
    not_implemented()
.end

=item C<string hebrev(string str [, int max_chars_per_line])>

Converts logical Hebrew text to visual text

=cut

.sub 'hebrev'
    not_implemented()
.end

=item C<string hebrevc(string str [, int max_chars_per_line])>

Converts logical Hebrew text to visual text with newline conversion

=cut

.sub 'hebrevc'
    not_implemented()
.end

=item C<string implode([string glue,] array pieces)>

Joins array elements placing glue string between items and return one string

=cut

.sub 'implode'
    not_implemented()
.end

=item C<string join(array src, string glue)>

An alias for implode

=cut

.sub 'join'
    not_implemented()
.end

=item C<array localeconv(void)>

Returns numeric formatting information based on the current locale

=cut

.sub 'localeconv'
    not_implemented()
.end

=item C<string ltrim(string str [, string character_mask])>

Strips whitespace from the beginning of a string

=cut

.sub 'ltrim'
    not_implemented()
.end

=item C<string money_format(string format , float value)>

Convert monetary value(s) to string

=cut

.sub 'money_format'
    not_implemented()
.end

=item C<string nl2br(string str)>

Converts newlines to HTML line breaks

=cut

.sub 'nl2br'
    not_implemented()
.end

=item C<string nl_langinfo(int item)>

Query language and locale information

=cut

.sub 'nl_langinfo'
    not_implemented()
.end

=item C<int ord(string character)>

Returns ASCII value of character

=cut

.sub 'ord'
    not_implemented()
.end

=item C<void parse_str(string encoded_string [, array result])>

Parses GET/POST/COOKIE data and sets global variables

=cut

.sub 'parse_str'
    not_implemented()
.end

=item C<array pathinfo(string path[, int options])>

Returns information about a certain string

=cut

.sub 'pathinfo'
    not_implemented()
.end

=item C<string quotemeta(string str)>

Quotes meta characters

=cut

.sub 'quotemeta'
    not_implemented()
.end

=item C<string rtrim(string str [, string character_mask])>

Removes trailing whitespace

=cut

.sub 'rtrim'
    not_implemented()
.end

=item C<string setlocale(mixed category, string locale [, string ...])>

Set locale information

=cut

.sub 'setlocale'
    not_implemented()
.end

=item C<int similar_text(string str1, string str2 [, float percent])>

Calculates the similarity between two strings

=cut

.sub 'similar_text'
    not_implemented()
.end

=item C<mixed sscanf(string str, string format [, string ...])>

Implements an ANSI C compatible sscanf

=cut

.sub 'sscanf'
    not_implemented()
.end

=item C<mixed str_ireplace(mixed search, mixed replace, mixed subject [, int &replace_count])>

Replaces all occurrences of search in haystack with replace / case-insensitive

=cut

.sub 'str_ireplace'
    not_implemented()
.end

=item C<string str_pad(string input, int pad_length [, string pad_string [, int pad_type]])>

Returns input string padded on the left or right to specified length with pad_string

=cut

.sub 'str_pad'
    not_implemented()
.end

=item C<string str_repeat(string input, int mult)>

Returns the input string repeat mult times

=cut

.sub 'str_repeat'
    not_implemented()
.end

=item C<mixed str_replace(mixed search, mixed replace, mixed subject [, int &replace_count])>

Replaces all occurrences of search in haystack with replace

=cut

.sub 'str_replace'
    not_implemented()
.end

=item C<string str_rot13(string str)>

Perform the rot13 transform on a string

=cut

.sub 'str_rot13'
    not_implemented()
.end

=item C<void str_shuffle(string str)>

Shuffles string. One permutation of all possible is created

=cut

.sub 'str_shuffle'
    not_implemented()
.end

=item C<array str_split(string str [, int split_length])>

Convert a string to an array. If split_length is specified, break the string down into chunks each split_length characters long.

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


=cut

.sub 'str_word_count'
    not_implemented()
.end

=item C<string strchr(string haystack, string needle)>

An alias for strstr

=cut

.sub 'strchr'
    not_implemented()
.end

=item C<int strcoll(string str1, string str2)>

Compares two strings using the current locale

=cut

.sub 'strcoll'
    not_implemented()
.end

=item C<int strcspn(string str, string mask [, start [, len]])>

Finds length of initial segment consisting entirely of characters not found in mask. If start or/and length is provide works like strcspn(substr($s,$start,$len),$bad_chars)

=cut

.sub 'strcspn'
    not_implemented()
.end

=item C<string strip_tags(string str [, string allowable_tags])>

Strips HTML and PHP tags from a string

=cut

.sub 'strip_tags'
    not_implemented()
.end

=item C<string stripcslashes(string str)>

Strips backslashes from a string. Uses C-style conventions

=cut

.sub 'stripcslashes'
    not_implemented()
.end

=item C<int stripos(string haystack, string needle [, int offset])>

Finds position of first occurrence of a string within another, case insensitive

=cut

.sub 'stripos'
    not_implemented()
.end

=item C<string stripslashes(string str)>

Strips backslashes from a string

=cut

.sub 'stripslashes'
    not_implemented()
.end

=item C<string stristr(string haystack, string needle)>

Finds first occurrence of a string within another, case insensitive

=cut

.sub 'stristr'
    not_implemented()
.end

=item C<int strnatcasecmp(string s1, string s2)>

Returns the result of case-insensitive string comparison using 'natural' algorithm

=cut

.sub 'strnatcasecmp'
    not_implemented()
.end

=item C<int strnatcmp(string s1, string s2)>

Returns the result of string comparison using 'natural' algorithm

=cut

.sub 'strnatcmp'
    not_implemented()
.end

=item C<array strpbrk(string haystack, string char_list)>

Search a string for any of a set of characters

=cut

.sub 'strpbrk'
    not_implemented()
.end

=item C<int strpos(string haystack, string needle [, int offset])>

Finds position of first occurrence of a string within another

=cut

.sub 'strpos'
    not_implemented()
.end

=item C<string strrchr(string haystack, string needle)>

Finds the last occurrence of a character in a string within another

=cut

.sub 'strrchr'
    not_implemented()
.end

=item C<string strrev(string str)>

Reverse a string

=cut

.sub 'strrev'
    not_implemented()
.end

=item C<int strripos(string haystack, string needle [, int offset])>

Finds position of last occurrence of a string within another string

=cut

.sub 'strripos'
    not_implemented()
.end

=item C<int strrpos(string haystack, string needle [, int offset])>

Finds position of last occurrence of a string within another string

=cut

.sub 'strrpos'
    not_implemented()
.end

=item C<int strspn(string str, string mask [, start [, len]])>

Finds length of initial segment consisting entirely of characters found in mask. If start or/and length is provided works like strspn(substr($s,$start,$len),$good_chars)

=cut

.sub 'strspn'
    not_implemented()
.end

=item C<string strstr(string haystack, string needle)>

Finds first occurrence of a string within another

=cut

.sub 'strstr'
    not_implemented()
.end

=item C<string strtok([string str,] string token)>

Tokenize a string

=cut

.sub 'strtok'
    not_implemented()
.end

=item C<string strtolower(string str)>

Makes a string lowercase

=cut

.sub 'strtolower'
    not_implemented()
.end

=item C<string strtoupper(string str)>

Makes a string uppercase

=cut

.sub 'strtoupper'
    not_implemented()
.end

=item C<string strtr(string str, string from[, string to])>

Translates characters in str using given translation tables

=cut

.sub 'strtr'
    not_implemented()
.end

=item C<string substr(string str, int start [, int length])>

Returns part of a string

=cut

.sub 'substr'
    not_implemented()
.end

=item C<int substr_compare(string main_str, string str, int offset [, int length [, bool case_sensitivity]])>

Binary safe optionally case insensitive comparison of 2 strings from an offset, up to length characters

=cut

.sub 'substr_compare'
    not_implemented()
.end

=item C<int substr_count(string haystack, string needle [, int offset [, int length]])>

Returns the number of times a substring occurs in the string

=cut

.sub 'substr_count'
    not_implemented()
.end

=item C<mixed substr_replace(mixed str, mixed repl, mixed start [, mixed length])>

Replaces part of a string with another string

=cut

.sub 'substr_replace'
    not_implemented()
.end

=item C<string trim(string str [, string character_mask])>

Strips whitespace from the beginning and end of a string

=cut

.sub 'trim'
    not_implemented()
.end

=item C<string ucfirst(string str)>

Makes a string's first character uppercase

=cut

.sub 'ucfirst'
    not_implemented()
.end

=item C<string ucwords(string str)>

Uppercase the first character of every word in a string

=cut

.sub 'ucwords'
    not_implemented()
.end

=item C<string wordwrap(string str [, int width [, string break [, boolean cut]]])>

Wraps buffer to selected number of characters using string break char

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
