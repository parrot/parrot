# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

lib/luastring.pir - Lua String Library

=head1 DESCRIPTION

This library provides generic functions for string manipulation, such as
finding and extracting substrings, and pattern matching. When indexing a
string in Lua, the first character is at position 1 (not at 0, as in C).
Indices are allowed to be negative and are interpreted as indexing backwards,
from the end of the string. Thus, the last character is at position I<-1>,
and so on.

The string library provides all its functions inside the table C<string>.
It also sets a metatable for strings where the C<__index> field points to
the metatable itself. Therefore, you can use the string functions in
object-oriented style. For instance, C<string.byte(s, i)> can be written as
C<s:byte(i)>. 

See "Lua 5.1 Reference Manual", section 5.4 "String Manipulation".

=head2 Functions

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luaaux.pbc"
    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua String\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global "_G"
    $P1 = new .LuaString

    .local pmc _string
    _string = new .LuaTable
    $P1 = "string"
    _lua__GLOBAL[$P1] = _string

    .const .Sub _string_byte = "_string_byte"
    $P1 = "byte"
    _string[$P1] = _string_byte

    .const .Sub _string_char = "_string_char"
    $P1 = "char"
    _string[$P1] = _string_char

    .const .Sub _string_dump = "_string_dump"
    $P1 = "dump"
    _string[$P1] = _string_dump

    .const .Sub _string_find = "_string_find"
    $P1 = "find"
    _string[$P1] = _string_find

    .const .Sub _string_format = "_string_format"
    $P1 = "format"
    _string[$P1] = _string_format

    .const .Sub _string_gmatch = "_string_gmatch"
    $P1 = "gmatch"
    _string[$P1] = _string_gmatch

    .const .Sub _string_gsub = "_string_gsub"
    $P1 = "gsub"
    _string[$P1] = _string_gsub

    .const .Sub _string_len = "_string_len"
    $P1 = "len"
    _string[$P1] = _string_len

    .const .Sub _string_lower = "_string_lower"
    $P1 = "lower"
    _string[$P1] = _string_lower

    .const .Sub _string_match = "_string_match"
    $P1 = "match"
    _string[$P1] = _string_match

    .const .Sub _string_rep = "_string_rep"
    $P1 = "rep"
    _string[$P1] = _string_rep

    .const .Sub _string_reverse = "_string_reverse"
    $P1 = "reverse"
    _string[$P1] = _string_reverse

    .const .Sub _string_sub = "_string_sub"
    $P1 = "sub"
    _string[$P1] = _string_sub

    .const .Sub _string_upper = "_string_upper"
    $P1 = "upper"
    _string[$P1] = _string_upper


    .local pmc _lua_mt_string
    _lua_mt_string = new .LuaTable
    global "mt_string" = _lua_mt_string
    $P1 = "__index"
    _lua_mt_string[$P1] = _string

.end


.sub posrelat :anon
    .param int pos
    .param int len
    if pos >= 0 goto L0
    pos = len + pos
    inc pos
L0:
    .return (pos)
.end


=item C<string.byte (s [, i [, j]])>

Returns the internal numerical codes of the characters C<s[i]>, C<s[i+1]>,...,
C<s[j]>. The default value for C<i> is 1; the default value for C<j> is C<i>.

Note that numerical codes are not necessarily portable across platforms.

=cut

.sub _string_byte :anon
    .param pmc s :optional
    .param pmc i :optional
    .param pmc j :optional
    $S0 = checkstring(s)
    .local int l
    l = length $S0
    .local int posi
    posi = optint(i, 1)
    posi = posrelat(posi, l)
    .local int pose
    pose = optint(j, posi)
    pose = posrelat(pose, l)
    unless posi <= 0 goto L0
    posi = 1
L0:
    unless pose > l goto L1
    pose = l
L1:    
    unless posi > pose goto L2
    .return ()
L2:
    .local int n
    n = pose - posi
    inc n
    .local pmc ret
    new ret, .Array
    set ret, n
    .local int i
    i = 0
L3:
    unless i < n goto L4
    $I0 = posi + i
    dec $I0
    $I1 = ord $S0, $I0
    new $P0, .LuaNumber
    $P0 = $I1 
    ret[i] = $P0
    inc i
    goto L3
L4:
    .return (ret :flat)
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
    inc i
    goto L1
L2:
    new ret, .LuaString
    ret = b
    .return (ret)
.end


=item C<string.dump (function)>

Returns a string containing a binary representation of the given function,
so that a later C<loadstring> on this string returns a copy of the function.
C<function> must be a Lua function without upvalues.

NOT YET IMPLEMENTED.

=cut

.sub _string_dump :anon
    .param pmc function :optional
    checktype(function, "function")
    not_implemented()
.end


=item C<string.find (s, pattern [, init [, plain]])>

Looks for the first I<match> of C<pattern> in the string C<s>. If it finds a match,
then C<find> returns the indices of C<s> where this occurrence starts and ends;
otherwise, it returns B<nil>. A third, optional numerical argument C<init>
specifies where to start the search; its default value is 1 and may be negative.
A value of B<true> as a fourth, optional argument C<plain> turns off the
pattern matching facilities, so the function does a plain "find substring"
operation, with no characters in C<pattern> being considered "magic". Note
that if C<plain> is given, then C<init> must be given as well.

If the pattern has captures, then in a successful match the captured values
are also returned, after the two indices. 

NOT YET IMPLEMENTED.

=cut

.sub _string_find :anon
    .param pmc s :optional
    .param pmc pattern :optional
    .param pmc init :optional
    .param pmc plain :optional
    $S0 = checkstring(s)
    $I0 = length $S0
    $S1 = checkstring(pattern)
    $I1 = length $S1
    $I2 = optint(init, 1)
    not_implemented()
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
and C<x> all expect a number as argument, whereas C<q> and C<s> expect a string.

This function does not accept string values containing embedded zeros. 

NOT YET IMPLEMENTED.

=cut

.sub _string_format :anon
    .param pmc formatstring :optional
    .param pmc argv :slurpy
    $S0 = checkstring(formatstring)
    $I0 = length $S0
    not_implemented()
.end


=item C<string.gmatch (s, pattern)>

Returns an iterator function that, each time it is called, returns the next
captures from pattern C<pattern> over string C<s>.

If C<pattern> specifies no captures, then the whole match is produced in each
call.

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

.sub _string_gmatch :anon
    .param pmc s :optional
    .param pmc pattern :optional
    $S0 = checkstring(s)
    $S1 = checkstring(pattern)
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
    .param pmc s :optional
    .param pmc pat :optional
    .param pmc repl :optional
    .param pmc n :optional
    $S0 = checkstring(s)
    $I0 = length $S0
    $S1 = checkstring(pat)
    $I1 = $I0 + 1
    $I2 = optint(n, $I1)
    not_implemented()
.end


=item C<string.len (s)>

Receives a string and returns its length. The empty string C<""> has length 0.
Embedded zeros are counted, so C<"a\000b\000c"> has length 5.

=cut

.sub _string_len :anon
    .param pmc s :optional
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
    .param pmc s :optional
    .local pmc ret
    $S0 = checkstring(s)
    downcase $S0
    new ret, .LuaString
    ret = $S0
    .return (ret)
.end


=item C<string.match (s, pattern [, init])>

Looks for the first I<match> of C<pattern> in the string C<s>. If it finds
one, then C<match> returns the captures from the pattern; otherwise it
returns B<nil>. If C<pattern> specifies no captures, then the whole match is
returned. A third, optional numerical argument C<init> specifies where to
start the search; its default value is 1 and may be negative.

NOT YET IMPLEMENTED.

=cut

.sub _string_match :anon
    .param pmc s :optional
    .param pmc pattern :optional
    .param pmc init :optional
    $S0 = checkstring(s)
    $I0 = length $S0
    $S1 = checkstring(pattern)
    $I1 = length $S1
    $I2 = optint(init, 1)
    not_implemented()
.end


=item C<string.rep (s, n)>

Returns a string that is the concatenation of C<n> copies of the string C<s>.

=cut

.sub _string_rep :anon
    .param pmc s :optional
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


=item C<string.reverse (s)>

Returns a string that is the string C<s> reversed.

=cut

.sub _string_reverse :anon
    .param pmc s :optional
    .local pmc ret
    $S0 = checkstring(s)
    $I0 = 0
    $I1 = length $S0
    dec $I1
    $P0 = split "", $S0
L1:
    unless $I0 < $I1 goto L2
    $S2 = $P0[$I0]
    $S3 = $P0[$I1]
    $P0[$I0] = $S3
    $P0[$I1] = $S2
    inc $I0
    dec $I1
    goto L1
L2:    
    $S1 = join "", $P0
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
    .param pmc s :optional
    .param pmc i :optional
    .param pmc j :optional
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
    dec $I1
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
    .param pmc s :optional
    .local pmc ret
    $S0 = checkstring(s)
    upcase $S0
    new ret, .LuaString
    ret = $S0
    .return (ret)
.end

=back

=head1 AUTHORS

Francois Perrad

=cut

