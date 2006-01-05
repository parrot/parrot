# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: luastring.pir $

=head1 NAME

lib/luastring.pir - Lua String Library

=head1 DESCRIPTION

This library provides generic functions for string manipulation, such as
finding and extracting substrings, and pattern matching. When indexing a
string in Lua, the first character is at position 1 (not at 0, as in C).
Indices are allowed to be negative and are interpreted as indexing backwards,
from the end of the string. Thus, the last character is at position -1, and
so on.

The string library provides all its functions inside the table C<string>.

See "Lua 5.0 Reference Manual", section 5.3 "String Manipulation".

=head2 Functions

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luapir.pbc"
    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua String\n"

    .local pmc _lua__G
    _lua__G = global "_G"
    $P1 = new .LuaString

    .local pmc _string
    _string = new .LuaTable
    $P1 = "string"
    _lua__G[$P1] = _string

    .const .Sub _string_byte = "_string_byte"
    $P0 = _string_byte
    $P1 = "byte"
    _string[$P1] = $P0

    .const .Sub _string_char = "_string_char"
    $P0 = _string_char
    $P1 = "char"
    _string[$P1] = $P0

    .const .Sub _string_dump = "_string_dump"
    $P0 = _string_dump
    $P1 = "dump"
    _string[$P1] = $P0

    .const .Sub _string_find = "_string_find"
    $P0 = _string_find
    $P1 = "find"
    _string[$P1] = $P0

    .const .Sub _string_len = "_string_len"
    $P0 = _string_len
    $P1 = "len"
    _string[$P1] = $P0

    .const .Sub _string_lower = "_string_lower"
    $P0 = _string_lower
    $P1 = "lower"
    _string[$P1] = $P0

    .const .Sub _string_rep = "_string_rep"
    $P0 = _string_rep
    $P1 = "rep"
    _string[$P1] = $P0

    .const .Sub _string_sub = "_string_sub"
    $P0 = _string_sub
    $P1 = "sub"
    _string[$P1] = $P0

    .const .Sub _string_upper = "_string_upper"
    $P0 = _string_upper
    $P1 = "upper"
    _string[$P1] = $P0

    .const .Sub _string_format = "_string_format"
    $P0 = _string_format
    $P1 = "format"
    _string[$P1] = $P0

    .const .Sub _string_gfind = "_string_gfind"
    $P0 = _string_gfind
    $P1 = "gfind"
    _string[$P1] = $P0

    .const .Sub _string_gsub = "_string_gsub"
    $P0 = _string_gsub
    $P1 = "gsub"
    _string[$P1] = $P0

.end


.sub posrelat :anon
    .param int pos
    .param int len
    if pos >= 0 goto L0
    pos = len + pos
    pos = pos + 1
L0:
    .return (pos)
.end


=item C<string.byte (s [, i])>

Returns the internal numerical code of the C<i>-th character of C<s>, or
B<nil> if the index is out of range. If C<i> is absent, then it is assumed
to be 1. C<i> may be negative.

Note that numerical codes are not necessarily portable across platforms.

=cut

.sub _string_byte :anon
    .param pmc s
    .param pmc n
    .local pmc ret
    $S0 = checkstring(s)
    $I0 = length $S0
    $I1 = optint(n, 1)
    $I1 = posrelat($I1, $I0)
    if $I1 == 0 goto L0
    if $I1 > $I0 goto L0
    $I1 = $I1 - 1
    $I2 = ord $S0, $I1
    new ret, .LuaNumber
    ret = $I2
    .return (ret)
L0:    
    new ret, .LuaNil
    .return (ret)
.end

=item C<string.char (i1, i2, ...)>

Receives 0 or more integers. Returns a string with length equal to the number
of arguments, in which each character has the internal numerical code equal
to its correspondent argument.

Note that numerical codes are not necessarily portable across platforms.

=cut

.sub _string_char :anon
    .param pmc argv :slurpy
    .local pmc ret
    .local int argc
    .local int i
    .local int c
    .local pmc curr
    .local string b
    .local string s
    b = ""
    argc = argv
    i = 0
L1:
    if i >= argc goto L2
    curr = argv[i]
    c = checknumber(curr)
    s = chr c
    b = concat b, s
    i = i + 1
    goto L1
L2:
    new ret, .LuaString
    ret = b
    .return (ret)
.end

=item C<string.dump (function)>

Returns a binary representation of the given function, so that a later
C<loadstring> on that string returns a copy of the function. C<function> must
be a Lua function without upvalues.

NOT YET IMPLEMENTED.

=cut

.sub _string_dump :anon
    not_implemented()
.end

=item C<string.find (s, pattern [, init [, plain]])>

Looks for the first I<match> of C<pattern> in the string C<s>. If it finds one,
then C<find> returns the indices of C<s> where this occurrence starts and ends;
otherwise, it returns B<nil>. If the C<pattern> specifies captures (see
C<string.gsub> below), the captured strings are returned as extra results.
A third, optional numerical argument C<init> specifies where to start the
search; its default value is 1 and may be negative. A value of B<true> as a
fourth, optional argument C<plain> turns off the pattern matching facilities,
so the function does a plain "find substring" operation, with no characters
in C<pattern> being considered "magic". Note that if C<plain> is given, then
C<init> must be given too.

NOT YET IMPLEMENTED.

=cut

.sub _string_find :anon
    not_implemented()
.end

=item C<string.len (s)>

Receives a string and returns its length. The empty string C<""> has length 0.
Embedded zeros are counted, so C<"a\000b\000c"> has length 5.

=cut

.sub _string_len :anon
    .param pmc s
    .local pmc ret
    $S0 = checkstring(s)
    $I0 = length $S0
    new ret, .LuaNumber
    ret = $I0
    .return (ret)
.end

=item C<string.lower (s)>

Receives a string and returns a copy of that string with all uppercase letters
changed to lowercase. All other characters are left unchanged. The definition
of what is an uppercase letter depends on the current locale.

=cut

.sub _string_lower :anon
    .param pmc s
    .local pmc ret
    $S0 = checkstring(s)
    downcase $S0
    new ret, .LuaString
    ret = $S0
    .return (ret)
.end

=item C<string.rep (s, n)>

Returns a string that is the concatenation of C<n> copies of the string C<s>.

=cut

.sub _string_rep :anon
    .param pmc s
    .param pmc n
    .local pmc ret
    $S0 = checkstring(s)
    $I0 = checknumber(n)
    if $I0 >= 0 goto L0
    $I0 = 0
L0:
    $S1 = repeat $S0, $I0
    new ret, .LuaString
    ret = $S1
    .return (ret)
.end

=item C<string.sub (s, i [, j])>

Returns the substring of C<s> that starts at C<i> and continues until C<j>;
C<i> and C<j> may be negative. If C<j> is absent, then it is assumed to be
equal to -1 (which is the same as the string length). In particular, the call
C<string.sub(s,1,j)> returns a prefix of C<s> with length C<j>, and
C<string.sub(s, -i)> returns a suffix of C<s> with length C<i>.

=cut

.sub _string_sub :anon
    .param pmc s
    .param pmc i
    .param pmc j
    .local pmc ret
    $S0 = checkstring(s)
    $I0 = length $S0
    $I1 = checknumber(i)
    $I1 = posrelat($I1, $I0)
    $I2 = optint(j, -1)
    $I2 = posrelat($I2, $I0)
    unless $I1 < 1 goto L0
    $I1 = 1
L0:
    unless $I2 > $I0 goto L1
    $I2 = $I0
L1:
    unless $I1 <= $I2 goto L2
    $I1 = $I1 - 1
    $S1 = substr $S0, $I1, $I2
    goto L3
L2:
    $S1 = ""
L3:    
    new ret, .LuaString
    ret = $S1
    .return (ret)
.end

=item C<string.upper (s)>

Receives a string and returns a copy of that string with all lowercase letters
changed to uppercase. All other characters are left unchanged. The definition
of what is a lowercase letter depends on the current locale.

=cut

.sub _string_upper :anon
    .param pmc s
    .local pmc ret
    $S0 = checkstring(s)
    upcase $S0
    new ret, .LuaString
    ret = $S0
    .return (ret)
.end

=item C<string.format (formatstring, e1, e2, ...)>

Returns a formatted version of its variable number of arguments following the
description given in its first argument (which must be a string). The format
string follows the same rules as the C<printf> family of standard C functions.
The only differences are that the options/modifiers C<*>, C<l>, C<L>, C<n>,
C<p>, and C<h> are not supported, and there is an extra option, C<q>. The C<q>
option formats a string in a form suitable to be safely read back by the Lua
interpreter: The string is written between double quotes, and all double
quotes, newlines, and backslashes in the string are correctly escaped when
written. For instance, the call

    string.format(’%q’, ’a string with "quotes" and \n new line’)

will produce the string:

    "a string with \"quotes\" and \
    new line"

The options C<c>, C<d>, C<E>, C<e>, C<f>, C<g>, C<G>, C<i>, C<o>, C<u>, C<X>,
and C<x> all expect a number as argument, whereas C<q> and C<s> expect a
string. The C<*> modifier can be simulated by building the appropriate format
string. For example, C<"%*g"> can be simulated with C<"%"..width.."g">.

String values to be formatted with C<%s> cannot contain embedded zeros.

NOT YET IMPLEMENTED.

=cut

.sub _string_format :anon
    not_implemented()
.end

=item C<string.gfind (s, pat)>

Returns an iterator function that, each time it is called, returns the next
captures from pattern C<pat> over string C<s>.

If C<pat> specifies no captures, then the whole match is produced in each call.

As an example, the following loop

    s = "hello world from Lua"
    for w in string.gfind(s, "%a+") do
        print(w)
    end

will iterate over all the words from string C<s>, printing one per line. The
next example collects all pairs C<key=value> from the given string into a
table:

    t = {}
    s = "from=world, to=Lua"
    for k, v in string.gfind(s, "(%w+)=(%w+)") do
        t[k] = v
    end

NOT YET IMPLEMENTED.

=cut

.sub _string_gfind :anon
    not_implemented()
.end

=item C<string.gsub (s, pat, repl [, n])>

Returns a copy of C<s> in which all occurrences of the pattern C<pat> have
been replaced by a replacement string specified by C<repl>. C<gsub> also
returns, as a second value, the total number of substitutions made.

If C<repl> is a string, then its value is used for replacement. Any sequence
in C<repl> of the form %I<n>, with I<n> between 1 and 9, stands for the value
of the I<n>-th captured substring.

If C<repl> is a function, then this function is called every time a match
occurs, with all captured substrings passed as arguments, in order; if the
pattern specifies no captures, then the whole match is passed as a sole
argument. If the value returned by this function is a string, then it is used
as the replacement string; otherwise, the replacement string is the empty
string.

The optional last parameter C<n> limits the maximum number of substitutions
to occur. For instance, when C<n> is 1 only the first occurrence of C<pat>
is replaced.

NOT YET IMPLEMENTED.

=cut

.sub _string_gsub :anon
    not_implemented()
.end

=back

=head1 AUTHORS

Francois Perrad

=cut

