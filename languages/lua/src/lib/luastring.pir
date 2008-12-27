# Copyright (C) 2005-2008, The Perl Foundation.
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

See "Lua 5.1 Reference Manual", section 5.4 "String Manipulation",
L<http://www.lua.org/manual/5.1/manual.html#5.4>.

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'string' ]

.sub 'luaopen_string'
#    print "init Lua String\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _string
    new _string, 'LuaTable'
    set $P1, 'string'
    _lua__GLOBAL[$P1] = _string

    $P2 = split "\n", <<'LIST'
byte
char
dump
find
format
gmatch
gsub
len
lower
match
rep
reverse
sub
upper
LIST
    lua_register($P1, _string, $P2)

    # LUA_COMPAT_GFIND
    set $P1, 'gmatch'
    $P0 = _string[$P1]
    set $P1, 'gfind'
    _string[$P1] = $P0

    .local pmc _lua_mt_string
    new _lua_mt_string, 'LuaTable'
    set_global 'mt_string', _lua_mt_string
    set $P1, '__index'
    _lua_mt_string[$P1] = _string

.end


.sub 'posrelat' :anon
    .param int pos
    .param int len
    unless pos >= 0 goto L1
    .return (pos)
  L1:
    $I1 = - pos
    if pos == $I1 goto L2
    if $I1 > len goto L2
    goto L3
  L2:
    .return (0)
  L3:
    $I0 = len - $I1
    inc $I0
    .return ($I0)
.end


=item C<string.byte (s [, i [, j]])>

Returns the internal numerical codes of the characters C<s[i]>, C<s[i+1]>,...,
C<s[j]>. The default value for C<i> is 1; the default value for C<j> is C<i>.

Note that numerical codes are not necessarily portable across platforms.

=cut

.sub 'byte'
    .param pmc s :optional
    .param pmc i :optional
    .param pmc j :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, s)
    .local int l
    l = length $S1
    .local int posi
    posi = lua_optint(2, i, 1)
    posi = posrelat(posi, l)
    .local int pose
    pose = lua_optint(3, j, posi)
    pose = posrelat(pose, l)
    unless posi < 1 goto L1
    posi = 1
  L1:
    unless pose > l goto L2
    pose = l
  L2:
    unless posi > pose goto L3
    # empty interval
    .return ()
  L3:
    .local int n
    n = pose - posi
    inc n
    .local pmc res
    new res, 'FixedPMCArray'
    set res, n
    .local int i
    i = 0
  L4:
    unless i < n goto L5
    $I0 = posi + i
    dec $I0
    $I1 = ord $S1, $I0
    new $P0, 'LuaNumber'
    set $P0, $I1
    res[i] = $P0
    inc i
    goto L4
  L5:
    .return (res :flat)
.end


=item C<string.char (i1, i2, ...)>

Receives 0 or more integers. Returns a string with length equal to the number
of arguments, in which each character has the internal numerical code equal
to its correspondent argument.

Note that numerical codes are not necessarily portable across platforms.

=cut

.sub 'char'
    .param pmc argv :slurpy
    .local pmc res
    .local int argc
    .local int i
    .local int c
    .local pmc curr
    .local string b
    .local string s
    b = ''
    argc = argv
    i = 0
  L1:
    if i >= argc goto L2
    curr = argv[i]
    inc i
    c = lua_checknumber(i, curr)
    s = chr c
    b = concat b, s
    goto L1
  L2:
    new res, 'LuaString'
    set res, b
    .return (res)
.end


=item C<string.dump (function)>

Returns a string containing a binary representation of the given function,
so that a later C<loadstring> on this string returns a copy of the function.
C<function> must be a Lua function without upvalues.

NOT YET IMPLEMENTED.

=cut

.sub 'dump'
    .param pmc function :optional
    .param pmc extra :slurpy
    lua_checktype(1, function, 'function')
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

=cut

.sub 'find'
    .param pmc argv :slurpy
    .tailcall str_find_aux(1, argv :flat)
.end

.sub 'str_find_aux' :anon
    .param int find
    .param pmc s :optional
    .param pmc pattern :optional
    .param pmc init :optional
    .param pmc plain :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, s)
    $I1 = length $S1
    $S2 = lua_checkstring(2, pattern)
    $I2 = length $S2
    $I3 = lua_optint(3, init, 1)
    $I3 = posrelat($I3, $I1)
    dec $I3
    unless $I3 < 0 goto L1
    $I3 = 0
    goto L2
  L1:
    unless $I3 > $I1 goto L2
    $I3 = $I1
  L2:
    $S1 = substr $S1, $I3
    unless find goto L3
    if null plain goto L4
    $I0 = istrue plain
    if $I0 goto L5
  L4:
    .const string specials = "^$*+?.([%-"
    $P0 = split '', specials
  L6:
    $I0 = $P0
    unless $I0 goto L5
    $S0 = shift $P0
    $I0 = index $S2, $S0
    if $I0 >= 0 goto L3
    goto L6
  L5:
    # do a plain search
    .local int idx
    idx = index $S1, $S2
    if idx < 0 goto L7
    .local pmc start
    .local pmc end
    new start, 'LuaNumber'
    $I0 = $I3 + idx
    inc $I0
    set start, $I0
    new end, 'LuaNumber'
    $I0 = $I3 + idx
    $I0 += $I2
    set end, $I0
    .return (start, end)
  L3:
    .local pmc regex_comp
    regex_comp = compreg 'PGE::LuaRegex'
    .local pmc rulesub
    rulesub = regex_comp($S2)
    .local pmc match
    match = rulesub($S1)
    unless match goto L7
    unless find goto L8
    .local pmc start
    .local pmc end
    new start, 'LuaNumber'
    $I0 = match.'from'()
    $I0 += $I3
    inc $I0
    set start, $I0
    new end, 'LuaNumber'
    $I0 = match.'to'()
    $I0 += $I3
    set end, $I0
    $P0 = captures(match, 0)
    .return (start, end, $P0 :flat)
  L8:
    $P0 = captures(match, 1)
    .return ($P0 :flat)
  L7:
    # not found
    .local pmc res
    new res, 'LuaNil'
    .return (res)
.end

.sub 'captures' :anon
    .param pmc match
    .param int whole
    .local pmc res
    new res, 'FixedPMCArray'
    .local pmc capts
    capts = match.'list'()
    unless capts goto L1
    $I1 = capts
    set res, $I1
    $I0 = 0
  L2:
    unless $I0 < $I1 goto L3
    $P0 = capts[$I0]
    $I10 = can $P0, 'text'
    if $I10 goto L4
    $I10 = $P0
    new $P1, 'LuaNumber'
    set $P1, $I10
    goto L5
  L4:
    $S0 = $P0.'text'()
    $I2 = index $S0, "\0"
    if $I2 < 0 goto L6
    # sorry, strictly compatible
    $S0 = substr $S0, 0, $I2
  L6:
    new $P1, 'LuaString'
    set $P1, $S0
  L5:
    res[$I0] = $P1
    inc $I0
    goto L2
  L3:
    .return (res)
  L1:
    unless whole == 1 goto L7
    set res, 1
    $S0 = match.'text'()
    $I2 = index $S0, "\0"
    if $I2 < 0 goto L8
    # sorry, strictly compatible
    $S0 = substr $S0, 0, $I2
  L8:
    new $P1, 'LuaString'
    set $P1, $S0
    res[0] = $P1
  L7:
    .return (res)
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

=cut

.sub 'format'
    .param pmc formatstring :optional
    .param pmc argv :slurpy
    .local string strfrmt
    .local string b
    .local int arg
    .local int idx
    .local int narg
    strfrmt = lua_checkstring(1, formatstring)
    $I1 = length strfrmt
    b = ''
    arg = 0
    new $P1, 'FixedPMCArray'
    set $P1, 1
    idx = 0
  L1:
    unless idx < $I1 goto L2
    $S0 = substr strfrmt, idx, 1
    unless $S0 != '%' goto L3
    b .= $S0
    inc idx
    goto L1
  L3:
    inc idx
    $S0 = substr strfrmt, idx, 1
    unless $S0 == '%' goto L4
    b .= $S0
    inc idx
  L4:
    .local string form
    .local string buff
    $P0 = argv[arg]
    inc arg
    (idx, form) = scanformat(strfrmt, idx)
    $S0 = substr strfrmt, idx, 1
    unless $S0 == 'c' goto L5
    narg = arg + 1
    $I0 = lua_checknumber(narg, $P0)
    $P1[0] = $I0
    buff = sprintf form, $P1
    goto L6
  L5:
    $I0 = index 'diouxX', $S0
    unless $I0 >= 0 goto L7
    narg = arg + 1
    $I0 = lua_checknumber(narg, $P0)
    $P1[0] = $I0
    buff = sprintf form, $P1
    goto L6
  L7:
    $I0 = index 'eEfgG', $S0
    unless $I0 >= 0 goto L8
    narg = arg + 1
    $N0 = lua_checknumber(narg, $P0)
    $P1[0] = $N0
    buff = sprintf form, $P1
    goto L6
  L8:
    unless $S0 == 'q' goto L9
    narg = arg + 1
    $S0 = lua_checkstring(narg, $P0)
    buff = quoted($S0)
    goto L6
  L9:
    unless $S0 == 's' goto L10
    narg = arg + 1
    buff = lua_checkstring(narg, $P0)
    $I0 = index form, '.'
    if $I0 >= 0 goto L11
    $I0 = length $S0
    unless $I0 >= 100 goto L11
    goto L6
  L11:
    $P1[0] = $P0
    buff = sprintf form, $P1
    goto L6
  L10:
    lua_error("invalid option '%", $S0, "' to 'format'")
  L6:
    b .= buff
    inc idx
    goto L1
  L2:
    .local pmc res
    new res, 'LuaString'
    set res, b
    .return (res)
.end

.const string digits = '0123456789'

.sub 'scanformat' :anon
    .param string strfrmt
    .param int start
    .const string flags = '-+ #0'
    .local int idx
    $I1 = length strfrmt
    idx = start
  L1:
    unless idx < $I1 goto L2
    $S0 = substr strfrmt, idx, 1
    $I0 = index flags, $S0
    unless $I0 >= 0 goto L2
    inc idx
    goto L1
  L2:
    $I0 = idx - start
    unless $I0 > 5 goto L3
    lua_error("invalid format (repeated flags)")
  L3:
    $S0 = substr strfrmt, idx, 1
    $I0 = index digits, $S0
    unless $I0 >= 0 goto L4
    inc idx
  L4:
    $S0 = substr strfrmt, idx, 1
    $I0 = index digits, $S0
    unless $I0 >= 0 goto L5
    inc idx
  L5:
    unless $S0 == '.' goto L6
    inc idx
    $S0 = substr strfrmt, idx, 1
    $I0 = index digits, $S0
    unless $I0 >= 0 goto L7
    inc idx
  L7:
    $S0 = substr strfrmt, idx, 1
    $I0 = index digits, $S0
    unless $I0 >= 0 goto L6
    inc idx
  L6:
    $S0 = substr strfrmt, idx, 1
    $I0 = index digits, $S0
    unless $I0 >= 0 goto L8
    lua_error("invalid format (width or precision too long)")
  L8:
    .local string form
    $I0 = idx - start
    inc $I0
    $S0 = substr strfrmt, start, $I0
    form = '%' . $S0
    .return (idx, form)
.end

.sub 'quoted' :anon
    .param string s
    .local string b
    .local int idx
    $I1 = length s
    b = '"'
    idx = 0
  L1:
    unless idx < $I1 goto L2
    $S0 = substr s, idx, 1
    inc idx
    $I0 = index "\"\\\n", $S0
    unless $I0 >= 0 goto L3
    b .= "\\"
    b .= $S0
    goto L1
  L3:
    unless $S0 == "\r" goto L4
    b .= "\\r"
    goto L1
  L4:
    unless $S0 == "\0" goto L5
    b .= "\\000"
    goto L1
  L5:
    b .= $S0
    goto L1
  L2:
    b .= '"'
    .return (b)
.end

=item C<string.gmatch (s, pattern)>

Returns an iterator function that, each time it is called, returns the next
captures from pattern C<pattern> over string C<s>.

If C<pattern> specifies no captures, then the whole match is produced in each
call.

As an example, the following loop

    s = "hello world from Lua"
    for w in string.gmatch(s, "%a+") do
        print(w)
    end

will iterate over all the words from string C<s>, printing one per line. The
next example collects all pairs C<key=value> from the given string into a
table:

    t = {}
    s = "from=world, to=Lua"
    for k, v in string.gmatch(s, "(%w+)=(%w+)") do
        t[k] = v
    end

=cut

.sub 'gmatch' :lex
    .param pmc s :optional
    .param pmc pattern :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkstring(1, s)
    $S2 = lua_checkstring(2, pattern)
    .local pmc regex_comp
    regex_comp = compreg 'PGE::LuaRegex'
    .local pmc rulesub
    rulesub = regex_comp($S2)
    .lex 'upvar_rulesub', rulesub
    $P0 = clone s
    .lex 'upvar_s', $P0
    .const 'Sub' gmatch_aux = 'gmatch_aux'
    res = newclosure gmatch_aux
    .return (res)
.end

.sub 'gmatch_aux' :anon :lex :outer(gmatch)
    .local pmc s
    .local pmc rulesub
    .local pmc match
    .local pmc res
    s = find_lex 'upvar_s'
    rulesub = find_lex 'upvar_rulesub'
    $S1 = s
    match = rulesub($S1)
    unless match goto L1
    $I0 = match.'to'()
    $S1 = substr $S1, $I0
    set s, $S1
    $P0 = captures(match, 1)
    .return ($P0 :flat)
  L1:
    .local pmc res
    new res, 'LuaNil'
    .return (res)
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

=cut

.sub 'gsub'
    .param pmc s :optional
    .param pmc pat :optional
    .param pmc repl :optional
    .param pmc max :optional
    .param pmc extra :slurpy
    .local string src
    src = lua_checkstring(1, s)
    $I1 = length src
    $S2 = lua_checkstring(2, pat)
    $I0 = $I1 + 1
    $I4 = lua_optint(4, max, $I0)
    $I0 = isa repl, 'LuaNumber'
    if $I0 goto L1
    $I0 = isa repl, 'LuaString'
    if $I0 goto L1
    $I0 = isa repl, 'LuaFunction'
    if $I0 goto L1
    $I0 = isa repl, 'LuaTable'
    if $I0 goto L1
    lua_argerror(3, "string/function/table expected")
  L1:
    .local int anchor
    anchor = 0
    $S0 = substr $S2, 0, 1
    unless $S0 == '^' goto L2
    anchor = 1
  L2:
    .local int n
    n = 0
    .local pmc regex_comp
    regex_comp = compreg 'PGE::LuaRegex'
    .local pmc rulesub
    rulesub = regex_comp($S2)
    .local pmc b
    new b, 'LuaString'
  L3:
    unless n < $I4 goto L4
    .local pmc match
    match = rulesub(src)
    unless match goto L4
    inc n
    add_value(b, src, match, repl)
    $I0 = match.'to'()
    src = substr src, $I0
    if anchor goto L4
    goto L3
  L4:
    $S0 = b
    $S0 .= src
    set b, $S0
    new $P0, 'LuaNumber'
    set $P0, n
    .return (b, $P0)
.end

.sub 'add_value' :anon
    .param pmc b
    .param string s
    .param pmc match
    .param pmc repl
    $I0 = isa repl, 'LuaNumber'
    unless $I0 goto L1
    $P0 = repl.'tostring'()
    .tailcall add_s(b, s, match, $P0)
  L1:
    $I0 = isa repl, 'LuaString'
    unless $I0 goto L2
    .tailcall add_s(b, s, match, repl)
  L2:
    $I0 = isa repl, 'LuaFunction'
    unless $I0 goto L4
    $P0 = captures(match, 1)
    ($P1) = repl($P0 :flat)
    goto L5
  L4:
    # isa 'LuaTable'
    $P0 = onecapture(match, 0)
    $P1 = repl[$P0]
  L5:
    if $P1 goto L7  # nil or false?
    # keep original text
    $S1 = b
    $I0 = match.'to'()
    $S0 = substr s, 0, $I0
    $S1 .= $S0
    set b, $S1
    .return ()
  L7:
    $I0 = isa $P1, 'LuaString'
    if $I0 goto L8
    $I0 = isa $P1, 'LuaNumber'
    if $I0 goto L8
    $S1 = typeof $P1
    lua_error("invalid replacement value (a ", $S1, ")")
  L8:
    $S1 = b
    $I0 = match.'from'()
    $S0 = substr s, 0, $I0
    $S1 .= $S0
    $S0 = $P1
    $S1 .= $S0
    set b, $S1
    .return ()
.end

.sub 'add_s' :anon
    .param pmc b
    .param string s
    .param pmc match
    .param pmc repl
    $S1 = b
    $I0 = match.'from'()
    $S0 = substr s, 0, $I0
    $S1 .= $S0
    $S4 = repl
    $I4 = length $S4
    .local int i
    i = 0
  L1:
    unless i < $I4 goto L2
    $S0 = substr $S4, i, 1
    if $S0 != '%' goto L3
    inc i
    $S0 = substr $S4, i, 1
    $I0 = index digits, $S0
    if $I0 < 0 goto L3
    unless $S0 == '0' goto L4
    $S0 = match.'text'()
    goto L3
  L4:
    dec $I0
    $S0 = onecapture(match, $I0)
  L3:
    $S1 .= $S0
    inc i
    goto L1
  L2:
    set b, $S1
.end

.sub 'onecapture' :anon
    .param pmc match
    .param int i
    $P0 = match.'list'()
    $I0 = exists $P0[i]
    unless $I0 goto L1
    $P1 = $P0[i]
    $I0 = can $P1, 'text'
    if $I0 goto L2
    $I0 = $P1
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
  L2:
    $S0 = $P1.'text'()
    $I0 = index $S0, "\0"
    if $I0 < 0 goto L3
    # sorry, strictly compatible
    $S0 = substr $S0, 0, $I0
  L3:
    new $P0, 'LuaString'
    set $P0, $S0
    .return ($P0)
  L1:
    lua_error("invalid capture index")
.end

=item C<string.len (s)>

Receives a string and returns its length. The empty string C<""> has length 0.
Embedded zeros are counted, so C<"a\000b\000c"> has length 5.

=cut

.sub 'len'
    .param pmc s :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, s)
    $I0 = length $S1
    new res, 'LuaNumber'
    set res, $I0
    .return (res)
.end


=item C<string.lower (s)>

Receives a string and returns a copy of that string with all uppercase letters
changed to lowercase. All other characters are left unchanged. The definition
of what is an uppercase letter depends on the current locale.

=cut

.sub 'lower'
    .param pmc s :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, s)
    downcase $S1
    new res, 'LuaString'
    set res, $S1
    .return (res)
.end


=item C<string.match (s, pattern [, init])>

Looks for the first I<match> of C<pattern> in the string C<s>. If it finds
one, then C<match> returns the captures from the pattern; otherwise it
returns B<nil>. If C<pattern> specifies no captures, then the whole match is
returned. A third, optional numerical argument C<init> specifies where to
start the search; its default value is 1 and may be negative.

=cut

.sub 'match'
    .param pmc argv :slurpy
    .tailcall str_find_aux(0, argv :flat)
.end


=item C<string.rep (s, n)>

Returns a string that is the concatenation of C<n> copies of the string C<s>.

=cut

.sub 'rep'
    .param pmc s :optional
    .param pmc n
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, s)
    $I2 = lua_checknumber(2, n)
    if $I2 >= 0 goto L1
    $I2 = 0
  L1:
    $S0 = repeat $S1, $I2
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<string.reverse (s)>

Returns a string that is the string C<s> reversed.

=cut

.sub 'reverse'
    .param pmc s :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, s)
    $I0 = 0
    $I1 = length $S1
    dec $I1
    $P0 = split '', $S1
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
    $S0 = join '', $P0
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<string.sub (s, i [, j])>

Returns the substring of C<s> that starts at C<i> and continues until C<j>;
C<i> and C<j> may be negative. If C<j> is absent, then it is assumed to be
equal to -1 (which is the same as the string length). In particular, the call
C<string.sub(s,1,j)> returns a prefix of C<s> with length C<j>, and
C<string.sub(s, -i)> returns a suffix of C<s> with length C<i>.

=cut

.sub 'sub'
    .param pmc s :optional
    .param pmc i :optional
    .param pmc j :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, s)
    $I1 = length $S1
    $I2 = lua_checknumber(2, i)
    $I2 = posrelat($I2, $I1)
    $I3 = lua_optint(2, j, -1)
    $I3 = posrelat($I3, $I1)
    unless $I2 < 1 goto L1
    $I2 = 1
  L1:
    unless $I3 > $I1 goto L2
    $I3 = $I1
  L2:
    unless $I2 <= $I3 goto L3
    dec $I2
    $I3 -= $I2
    $S0 = substr $S1, $I2, $I3
    goto L4
  L3:
    $S0 = ''
  L4:
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<string.upper (s)>

Receives a string and returns a copy of that string with all lowercase letters
changed to uppercase. All other characters are left unchanged. The definition
of what is a lowercase letter depends on the current locale.

=cut

.sub 'upper'
    .param pmc s :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, s)
    upcase $S1
    new res, 'LuaString'
    set res, $S1
    .return (res)
.end

=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
