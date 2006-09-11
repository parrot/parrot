# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

runtime/wmlsstring.pir - WMLScript String library

=head1 DESCRIPTION

This library contains a set of string functions. A string is an array of
characters. Each of the characters has an index. The first character in a
string has an index zero (0). The length of the string is the number of
characters in the array.

The user of the String library can specify a special separator by which
elements in a string can be separated. These elements can be accessed
by specifying the separator and the element index. The first element in a
string has an index zero (0). Each occurrence of the separator in the string
separates two elements (no escaping of separators is allowed).

A White space character is one of the following characters:

=over 4

=item * TAB : Horizontal Tabulation

=item * VT : Vertical Tabulation

=item * FF : Form Feed

=item * SP : Space

=item * LF : Line Feed

=item * CR : Carriage Return

=back

See "WMLScript Standard Libraries Specification", section 9 "String".

=head1 FUNCTIONS

=cut

.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'


.sub 'getString'
    new $P0, .Hash

    .const .Sub _string_length = '_string_length'
    $P0[0]  = _string_length
    .const .Sub _string_isEmpty = '_string_isEmpty'
    $P0[1]  = _string_isEmpty
    .const .Sub _string_charAt = '_string_charAt'
    $P0[2]  = _string_charAt
    .const .Sub _string_subString = '_string_subString'
    $P0[3]  = _string_subString
    .const .Sub _string_find = '_string_find'
    $P0[4]  = _string_find
    .const .Sub _string_replace = '_string_replace'
    $P0[5]  = _string_replace
    .const .Sub _string_elements = '_string_elements'
    $P0[6]  = _string_elements
    .const .Sub _string_elementAt = '_string_elementAt'
    $P0[7]  = _string_elementAt
    .const .Sub _string_removeAt = '_string_removeAt'
    $P0[8]  = _string_removeAt
    .const .Sub _string_replaceAt = '_string_replaceAt'
    $P0[9]  = _string_replaceAt
    .const .Sub _string_insertAt = '_string_insertAt'
    $P0[10] = _string_insertAt
    .const .Sub _string_squeeze = '_string_squeeze'
    $P0[11] = _string_squeeze
    .const .Sub _string_trim = '_string_trim'
    $P0[12] = _string_trim
    .const .Sub _string_compare = '_string_compare'
    $P0[13] = _string_compare
    .const .Sub _string_toString = '_string_toString'
    $P0[14] = _string_toString
    .const .Sub _string_format = '_string_format'
    $P0[15] = _string_format

    .return ($P0)
.end


=head2 C<length(string)>

=head3 DESCRIPTION

Returns the length (number of characters) of the given string.

=head3 PARAMETERS

string = String

=head3 RETURN VALUE

Integer or invalid.

=cut

.sub '_string_length' :anon
    .param pmc str
    .local pmc ret
    $I0 = isa str, 'WmlsInvalid'
    if $I0 goto L1
    $S0 = str
    $I0 = length $S0
    new ret, .WmlsInteger
    ret = $I0
    goto L2
L1:
    new ret, .WmlsInvalid
L2:
    .return (ret)
.end


=head2 C<isEmpty(string)>

=head3 DESCRIPTION

Returns a boolean true if the string length is zero and boolean false
otherwise.

=head3 PARAMETERS

string = String

=head3 RETURN VALUE

Boolean or invalid.

=cut

.sub '_string_isEmpty' :anon
    .param pmc str
    .local pmc ret
    $I0 = isa str, 'WmlsInvalid'
    if $I0 goto L1
    $S0 = str
    $I0 = length $S0
    new ret, .WmlsBoolean
    ret = 0
    if $I0 goto L2
    ret = 1
L2:
    goto L3
L1:
    new ret, .WmlsInvalid
L3:
    .return (ret)
.end


=head2 C<charAt(string, index)>

=head3 DESCRIPTION

Returns a new string of length one containing the character at the specified
index of the given string.

If the index is of type floating-point, Float.int() is first used to calculate the
actual integer index.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

string = String

index = Number (the index of the character to be returned)

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

If index is out of range then an empty string (C<"">) is returned.

=cut

.sub '_string_charAt' :anon
    .param pmc str
    .param pmc index
    not_implemented()
.end


=head2 C<subString(string, startIndex, length)>

=head3 DESCRIPTION

Returns a new string that is a substring of the given string. The substring
begins at the specified startIndex and its length (number of characters) is
the given length. If the startIndex is less than 0 then 0 is used for the
startIndex. If the length is larger than the remaining number of characters in
the string, the length is replaced with the number of remaining characters.

If the startIndex or the length is of type floating-point, Float.int() is first used to
calculate the actual integer value.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

string = String

startIndex = Number (the beginning index, inclusive)

length = Number (the length of the substring)

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

If startIndex is larger than the last index an empty string (C<"">) is returned.

If length <= 0 an empty string (C<"">) is returned.

=cut

.sub '_string_subString' :anon
    .param pmc String
    .param pmc startIndex
    .param pmc length
    not_implemented()
.end


=head2 C<find(string, subString)>

=head3 DESCRIPTION

Returns the index of the first character in the string that matches the
requested subString. If no match is found integer value -1 is returned.

Two strings are defined to match when they are identical. Characters with
multiple possible representations match only if they have the same
representation in both strings. No case folding is performed.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

string = String

subString = String

=head3 RETURN VALUE

Integer or invalid.

=head3 EXCEPTIONS

If subString is an empty string (C<"">), an invalid value is returned.

=cut

.sub '_string_find' :anon
    .param pmc String
    .param pmc subString
    not_implemented()
.end


=head2 C<replace(string, oldSubString, newSubString)>

=head3 DESCRIPTION

Returns a new string resulting from replacing all occurrences of
oldSubString in this string with newSubString.

Two strings are defined to match when they are identical. Characters with
multiple possible representations match only if they have the same
representation in both strings. No case folding is performed.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

string = String

oldSubString = String

newSubString = String

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

If oldSubString is an empty string an C<invalid> value is returned.

=cut

.sub '_string_replace' :anon
    .param pmc String
    .param pmc oldSubString
    .param pmc newSubString
    not_implemented()
.end


=head2 C<elements(string, separator)>

=head3 DESCRIPTION

Returns the number of elements in the given string separated by the given
separator. Empty string ("") is a valid element (thus, this function can never
return a value that is less or equal to zero).

NOT YET IMPLEMENTED.

=head3 PARAMETERS

string = String

separator = String (the first character of the string used as separator)

=head3 RETURN VALUE

Integer or invalid.

=head3 EXCEPTIONS

Returns C<invalid> if the separator is an empty string.

=cut

.sub '_string_elements' :anon
    .param pmc str
    .param pmc separator
    not_implemented()
.end


=head2 C<elementAt(string, index, separator)>

=head3 DESCRIPTION

Search string for index'th element, elements being separated by separator
and return the corresponding element. If the index is less than 0 then the first
element is returned. If the index is larger than the number of elements then
the last element is returned. If the string is an empty string then an empty
string is returned.

If the index is of type floating-point, Float.int() is first used to calculate the
actual index value.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

string = String

index = Number (the index of the element to be returned)

separator = String (the first character of the string used as separator)

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

Returns C<invalid> if the separator is an empty string.

=cut

.sub '_string_elementAt' :anon
    .param pmc str
    .param pmc index
    .param pmc separator
    not_implemented()
.end


=head2 C<removeAt(string, index, separator)>

=head3 DESCRIPTION

Returns a new string where the element and the corresponding separator (if
existing) with the given index are removed from the given string. If the index
is less than 0 then the first element is removed. If the index is larger than the
number of elements then the last element is removed. If the string is empty,
the function returns a new empty string.

If the index is of type floating-point, Float.int() is first used to calculate the
actual index value.

=head3 PARAMETERS

string = String

index = Number (the index of the element to be deleted)

separator = String (the first character of the string used as separator)

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

Returns C<invalid> if the separator is an empty string.

=cut

.sub '_string_removeAt' :anon
    .param pmc str
    .param pmc index
    .param pmc separator
    not_implemented()
.end


=head2 C<replaceAt(string, element, index, separator)>

=head3 DESCRIPTION

Returns a string with the current element at the specified index replaced with
the given element. If the index is less than 0 then the first element is
replaced. If the index is larger than the number of elements then the last
element is replaced. If the string is empty, the function returns a new string
with the given element.

If the index is of type floating-point, Float.int() is first used to calculate the
actual index value.

=head3 PARAMETERS

string = String

element = String

index = Number (the index of the element to be replaced)

separator = String (the first character of the string used as separator)

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

Returns C<invalid> if the separator is an empty string.

=cut

.sub '_string_replaceAt' :anon
    .param pmc str
    .param pmc element
    .param pmc index
    .param pmc separator
    not_implemented()
.end


=head2 C<insertAt(string, element, index, separator)>

=head3 DESCRIPTION

Returns a string with the element and the corresponding separator (if
needed) inserted at the specified element index of the original string. If the
index is less than 0 then 0 is used as the index. If the index is larger than the
number of elements then the element is appended at the end of the string. If
the string is empty, the function returns a new string with the given element.

If the index is of type floating-point, Float.int() is first used to calculate the
actual index value.

=head3 PARAMETERS

string = String (original string)

element = String (element to be inserted)

index = Number (the index of the element to be added)

separator = String (the first character of the string used as separator)

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

Returns C<invalid> if the separator is an empty string.

=cut

.sub '_string_insertAt' :anon
    .param pmc str
    .param pmc element
    .param pmc index
    .param pmc separator
    not_implemented()
.end


=head2 C<squeeze(string)>

=head3 DESCRIPTION

Returns a string where all consecutive series of white spaces within the
string are reduced to single inter-word space.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

String = String

=head3 RETURN VALUE

String or invalid.

=cut

.sub '_string_squeeze' :anon
    .param pmc str
    not_implemented()
.end


=head2 C<trim(string)>

=head3 DESCRIPTION

Returns a string where all trailing and leading white spaces in the given
string have been trimmed.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

String = String

=head3 RETURN VALUE

String or invalid.

=cut

.sub '_string_trim' :anon
    .param pmc str
    not_implemented()
.end


=head2 C<compare(string1, string2)>

=head3 DESCRIPTION

The return value indicates the lexicographic relation of string1 to string2. The
relation is based on the relation of the character codes in the native
character set. The return value is -1 if string1 is less than string2, 0 if string1
is identical to string2 or 1 if string1 is greater than string2.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

String1 = String

String2 = String

=head3 RETURN VALUE

Integer or invalid.

=cut

.sub '_string_compare' :anon
    .param pmc string1
    .param pmc string2
    not_implemented()
.end


=head2 C<toString(value)>

=head3 DESCRIPTION

Returns a string representation of the given value. This function performs
exactly the same conversions as supported by the [WMLScript] language
(automatic conversion from boolean, integer and floating-point values to
strings) except that C<invalid> value returns the string C<"invalid">.

=head3 PARAMETERS

value = Any

=head3 RETURN VALUE

String.

=cut

.sub '_string_toString' :anon
    .param pmc value
    $S0 = value
    .local pmc ret
    new ret, .WmlsString
    ret = $S0
    .return (ret)
.end


=head2 C<format(format, value)>

=head3 DESCRIPTION

Converts the given value to a string by using the given formatting provided as
a format string. The format string can contain only one format specifier,
which can be located anywhere inside the string. If more than one is
specified, only the first one (leftmost) is used and the remaining specifiers
are replaced by an empty string. The format specifier has the following form:

 % [width] [.precision] type

The C<width> argument is a nonnegative decimal integer controlling the
minimum number of characters printed. If the number of characters in the
output value is less than the specified width, blanks are added to the left until
the minimum width is reached. The C<width> argument never causes the
value to be truncated. If the number of characters in the output value is
greater than the specified width or, if width is not given, all characters of the
value are printed (subject to the precision argument).

The C<precision> argument specifies a nonnegative decimal integer,
preceded by a period (.), which can be used to set the precision of the output
value. The interpretation of this value depends on the given C<type>:

=over 4

=item d

Specifies the minimum number of digits to be printed. If the number
of digits in the value is less than precision, the output value is
padded on the left with zeroes. The value is not truncated when the
number of digits exceeds precision. Default precision is 1. If
precision is specified as 0 and the value to be converted is 0, the
result is an empty string.

=item f

Specifies the number of digits after the decimal point. If a decimal
point appears, at least one digit appears before it. The value is
rounded to the appropriate number of digits. Default precision is 6; if
precision is 0 or if the period (.) appears without a number following
it, no decimal point is printed.

=item s

Specifies the maximum number of characters to be printed. By
default, all characters are printed.

=back

Unlike the C<width> argument, the C<precision> argument can cause either
truncation of the output value or rounding of a floating-point value.

The C<type> argument is the only required format argument; it appears after
any optional format fields. The type character determines whether the given
value is interpreted as integer, floating-point or string. If the value argument
is of a different type than is specified by the type argument, it is converted
according to WMLScript standard automatic conversion rules, with the
addition that if value is of type floating-point and type is B<d>, Float.int() is called
to convert the value. The supported C<type> arguments are:

=over 4

=item d

Integer: The output value has the form [-]dddd, where dddd is one
or more decimal digits.

=item f

Floating-point: The output value has the form [-]dddd.dddd, where
dddd is one or more decimal digits. The number of digits before the
decimal point depends on the magnitude of the number and the
number of digits after the decimal point depends on the requested
precision. When the number of digits after the decimal point in the value
is less than the precision, letter 0 should be padded to fill columns
(e.g. the result of String.format("%2.3f", 1.2) will be
"1.200")

=item s

String: Characters are printed up to the end of the string or until the
precision value is reached. When the width is larger than
precision, the width should be ignored.

=back

A literal percent character (%) may be included in the format string by
preceding it with another percent character (%%).

=head3 PARAMETERS

format = String

value = Any

=head3 RETURN VALUE

String or invalid.

=head3 EXCEPTIONS

Illegal format specifier results in an C<invalid> return value.

=cut

.sub '_string_format' :anon
    .param pmc format
    .param pmc value
    not_implemented()
.end


=head1 AUTHORS

Francois Perrad.

=cut

