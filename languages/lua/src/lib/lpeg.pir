# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/lpeg.pir - Parsing Expression Grammar for Lua, version 0.9

=head1 DESCRIPTION

See original on L<http://www.inf.puc-rio.br/~roberto/lpeg.html>

=head2 Introduction

See on L<http://www.inf.puc-rio.br/~roberto/lpeg.html#intro>

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'lpeg' ]

.sub '__onload' :anon :load
#    print "__onload lpeg\n"
    .const 'Sub' entry = 'luaopen_lpeg'
    set_hll_global 'luaopen_lpeg', entry
.end

.const string VERSION = '0.9'
.const string PATTERN_T = 'pattern'

.sub 'luaopen_lpeg'

#    print "luaopen_lpeg\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _lpeg
    new _lpeg, 'LuaTable'
    set $P1, 'lpeg'
    _lua__GLOBAL[$P1] = _lpeg

    $P2 = split "\n", <<'LIST'
match
print
locale
C
Cf
Cc
Cg
Cp
Cb
Carg
Cmt
Cs
Ct
P
R
S
V
span
type
version
LIST
    lua_register($P1, _lpeg, $P2)

    .local pmc _pattern
    _pattern = lua_newmetatable(PATTERN_T)

    new $P1, 'LuaString'
    set $P1, '__index'
    _pattern[$P1] = _pattern

    null $P1
    $P2 = split "\n", <<'LIST'
__add
__pow
__sub
__mul
__div
__unm
__len
LIST
    .local pmc _env
    new _env, 'LuaTable'
    lua_register($P1, _pattern, $P2, _env)

    .return (_lpeg)
.end


# Virtual Machine's instructions
.const int IAny = 0
.const int IChar = 1
.const int ISet = 2
.const int ISpan = 3
.const int IRet = 4
.const int IEnd = 5
.const int IChoice = 6
.const int IJmp = 7
.const int ICall = 8
.const int IOpenCall = 9
.const int ICommit = 10
.const int IPartialCommit = 11
.const int IBackCommit = 12
.const int IFailTwice = 13
.const int IFail = 14
.const int IGiveup = 15
.const int IFunc = 16
.const int IFullCapture = 17
.const int IEmptyCapture = 18
.const int IEmptyCaptureIdx = 19
.const int IOpenCapture = 20
.const int ICloseCapture = 21
.const int ICloseRunTime = 22

# kinds of captures
.const int Cclose = 0
.const int Cposition = 1
.const int Cconst = 2
.const int Cbackref = 3
.const int C_arg = 4
.const int Csimple = 5
.const int Ctable = 6
.const int Cfunction = 7
.const int Cquery = 8
.const int Cstring = 9
.const int Csubst = 10
.const int Cfold = 11
.const int Cruntime = 12
.const int Cgroup = 13


.sub 'newpatt' :anon
    .param int n
    .local pmc res
    new $P0, 'lpeg::Pattern'
    $I0 = n + 1
    set $P0, $I0
    .local pmc mt
    mt = lua_getmetatable(PATTERN_T)
    res = lua_newuserdata($P0, mt)
    $P0.'setinst'(n, IEnd, 0)
    .return (res, $P0)
.end


.sub 'newcharset' :anon
    .local pmc res
    (res, $P0) = newpatt() ###
    .return (res, $P0)
.end


.sub 'any' :anon
    .param int n
    .param int extra
    .param int offset
    .local pmc res
    $I0 = n - 1
    $I0 /= 255
    $I0 += extra
    $I0 += 1
    (res, $P0) = newpatt($I0)
    $I1 = offset
  L1:
    unless n > 255 goto L2
    $P0.'setinstaux'($I1, IAny, 0, 255)
    inc $I1
    n -= 255
    goto L1
  L2:
    $P0.'setinstaux'($I1, IAny, 0, n)
    inc $I1
    .return (res, $P0, $I1)
.end


.sub 'getpatt' :anon
    .param int idx
    .param pmc patt
    .local pmc res
    .local int size
    if null patt goto L_other
  L_string:
    $I0 = isa patt, 'LuaString'
    unless $I0 goto L_number
    .local string str
    str = patt
    .local int len
    len = length str
    (res, $P0) = newpatt(len)
    $I0 = 0
  L1:
    unless $I0 < len goto L2
    $S0 = substr str, $I0, 1
    $P0.'setinstaux'($I0, IChar, 0, $S0)
    inc $I0
    goto L1
  L_number:
    $I0 = isa patt, 'LuaNumber'
    unless $I0 goto L_boolean
    .local int n
    n = patt
    unless n == 0 goto L3
    (res, $P0) = newpatt(0) # empty pattern
    goto L2
  L3:
    unless n > 0 goto L4
    (res, $P0) = any(n, 0, 0)
    goto L2
  L4:
    $I0 = - n
    unless $I0 <= 255 goto L5
    (res, $P0) = newpatt(2)
    $P0.'setinstaux'(0, IAny, 2, $I0)
    $P0.'setinst'(1, IFail, 0)
    goto L2
  L5:
    .local int offset
    $I0 -= 255
    (res, $P0, offset) = any($I0, 3, 2)
    $I1 = offset + 1
    $P0.'setinstaux'(0, IAny, $I1, 255)
    $P0.'setinstaux'(1, IFailTwice, offset, 255)
    $P0.'setinst'(offset, IFailTwice, 0)
    goto L2
  L_boolean:
    $I0 = isa patt, 'LuaBoolean'
    unless $I0 goto L_table
    $I0 = istrue patt
    unless $I0 goto L6
    (res, $P0) = newpatt(0) # empty pattern (always succeeds)
    goto L2
  L6:
    (res, $P0) = newpatt(1)
    $P0.'setinst'($I0, IFail, 0)
    goto L2
  L_table:
    $I0 = isa patt, 'LuaTable'
    unless $I0 goto L_function
    (res, $P0) = fix(idx, patt)
    goto L2
  L_function:
    $I0 = isa patt, 'LuaClosure'
    if $I0 goto L7
    $I0 = isa patt, 'LuaFunction'
    unless $I0 goto L_other
  L7:
    (res, $P0) = newpatt(2)
    $I0 = 0 # value2fenv(L, idx)
    $P0.'setinstcap'(0, IOpenCapture, $I0, Cruntime, 0)
    $P0.'setinstcap'(1, ICloseRunTime, 0, Cclose, 0)
    goto L2
  L_other:
    $P0 = lua_checkudata(idx, patt, PATTERN_T)
    res = patt
  L2:
    .return (res, $P0)
.end


.sub 'testpattern'
    .param int narg
    .param pmc arg
    .local int res
    res = 0
    $I0 = isa arg, 'LuaUserdata'
    unless $I0 goto L1
    .local pmc _lua__REGISTRY
    .local pmc key
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    new key, 'LuaString'
    set key, PATTERN_T
    $P0 = _lua__REGISTRY[key]
    $P1 = arg.'get_metatable'()
    unless $P0 == $P1 goto L1
    res = 1
  L1:
    .return (res)
.end


=item C<lpeg.match (pattern, subject [, init])>

The matching function. It attempts to match the given pattern against the
subject string. If the match succeeds, returns the index in the subject of
the first character after the match, or the values of
L<captured values|/Captures> (if the pattern captured any value).

An optional numeric argument C<init> makes the match starts at that position
in the subject string. As usual in Lua libraries, a negative value counts
from the end.

Unlike typical pattern-matching functions, C<match> works only in I<anchored>
mode; that is, it tries to match the pattern with a prefix of the given
subject string (at position C<init>), not with an arbitrary substring of the
subject. So, if we want to find a pattern anywhere in a string, we must
either write a loop in Lua or write a pattern that matches anywhere.
This second approach is easy and quite efficient;
see L<examples|/"Some Examples">.

NOT YET IMPLEMENTED.

=cut

.sub 'match'
    .param pmc pattern :optional
    .param pmc subject :optional
    .param pmc init :optional
    .param pmc extra :slurpy
    ($P1, $P0) = getpatt(1, pattern)
    $S2 = lua_checkstring(2, subject)
    $I3 = lua_optint(3, init, 1)
    not_implemented()
.end


=item C<lpeg.print (pattern)>

UNDOCUMENTED.

=cut

.sub 'print'
    .param pmc pattern :optional
    .param pmc extra :slurpy
    ($P1, $P0) = getpatt(1, pattern)
    $S0 = $P0
    print $S0
.end


=item C<lpeg.span (string)>

NOT YET IMPLEMENTED.

=cut

.sub 'span'
    .param pmc str :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, str)
    not_implemented()
.end


=item C<lpeg.type (value)>

If the given value is a pattern, returns the string C<"pattern">.
Otherwise returns B<nil>.

=cut

.sub 'type'
    .param pmc value :optional
    .param pmc extra :slurpy
    .local pmc res
    $I0 = testpattern(1, value)
    unless $I0 goto L1
    new res, 'LuaString'
    set res, 'pattern'
    goto L2
  L1:
    new res, 'LuaNil'
  L2:
    .return (res)
.end


=item C<lpeg.version ()>

Returns a string with the running version of LPEG.

=cut

.sub 'version'
    .param pmc extra :slurpy
    .local pmc res
    new res, 'LuaString'
    set res, VERSION
    .return (res)
.end


=back

=head2 Basic Constructions

The following operations build patterns. All operations that expect a
pattern as an argument may receive also strings, tables, numbers, booleans,
or functions, which are translated to patterns according to the rules of
function C<lpeg.P>.

=over 4

=item C<lpeg.P (value)>

Converts the given value into a proper pattern, according to the following
rules:

* If the argument is a pattern, it is returned unmodified.

* If the argument is a string, it is translated to a pattern that matches
literally the string.

* If the argument is a non-negative number I<n>, the result is a pattern
that matches exactly I<n> characters.

* If the argument is a negative number I<-n>, the result is a pattern
that succeeds only if the input string does not have I<n> characters:
It is equivalent to the unary minus operation applied over the pattern
corresponding to the (non-negative) value I<n>.

* If the argument is a boolean, the result is a pattern that always succeeds
or always fails (according to the boolean value), without consuming any input.

* If the argument is a table, it is interpreted as a grammar (see
L</Grammars>).

* If the argument is a function, returns a pattern equivalent to a match-time
capture over the empty string.

NOT YET IMPLEMENTED (see getpatt).

=cut

.sub 'P'
    .param pmc value :optional
    .param pmc extra :slurpy
    $P1 = getpatt(1, value)
    .return ($P1)
.end


=item C<lpeg.R ({range})>

Returns a pattern that matches any single character belonging to one of the
given I<ranges>. Each C<range> is a string I<xy> of length 2, representing
all characters with code between the codes of I<x> and I<y> (both inclusive).

As an example, the pattern C<lpeg.R("09")> matches any digit,
and C<lpeg.R("az", "AZ")> matches any ASCII letter.

NOT YET IMPLEMENTED.

=cut

.sub 'R'
    .param pmc vararg :slurpy
    not_implemented()
.end


=item C<lpeg.S (string)>

Returns a pattern that matches any single character that appears in the given
string. (The C<S> stands for I<Set>.)

As an example, the pattern C<lpeg.S("+-*/")> matches any arithmetic operator.

Note that, if I<s> is a character (that is, a string of length 1),
then C<lpeg.P(s)> is equivalent to C<lpeg.S(s)> which is equivalent to
C<lpeg.R(s..s)>. Note also that both C<lpeg.S("")> and C<lpeg.R()> are
patterns that always fail.

NOT YET IMPLEMENTED.

=cut

.sub 'S'
    .param pmc str :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, str)
    $I1 = length $S1
    unless $I1 == 1 goto L1
    # a unit set is equivalent to a literal
    $P1 = getpatt(1, str)
    .return ($P1)
  L1:
    not_implemented()
.end


=item C<lpeg.V (v)>

This operation creates a non-terminal (a I<variable>) for a grammar.
The created non-terminal refers to the rule indexed by C<v> in the enclosing
grammar. (See L</Grammars> for details.)

NOT YET IMPLEMENTED.

=cut

.sub 'V'
    .param pmc v :optional
    .param pmc extra :slurpy
    if null v goto L1
    $I0 = isa v, 'LuaNil'
    unless $I0 goto L2
  L1:
    lua_argerror(1, "non-nil value expected")
  L2:
    .local pmc res
    (res, $P0) = newpatt(1)
    $I0 = 0 # value2fenv
    $P0.'setinst'(0, IOpenCall, $I0)
    .return (res)
.end


=item C<locale ([table])>

Returns a table with patterns for matching some character classes according
to the current locale. The table has fields named C<alnum>, C<alpha>,
C<cntrl>, C<digit>, C<graph>, C<lower>, C<print>, C<punct>, C<space>,
C<upper>, and C<xdigit>, each one containing a correspondent pattern.
Each pattern matches any single character that belongs to its class.

If called with an argument C<table>, then it creates those fields inside the
given table and returns that table.

NOT YET IMPLEMENTED.

=cut

.sub 'locale'
    .param pmc t :optional
    .param pmc extra :slurpy
    if null t goto L1
    $I0 = isa t, 'LuaNil'
    unless $I0 goto L2
  L1:
    new t, 'LuaTable'
    goto L3
  L2:
    lua_checktype(1, t, 'table')
  L3:
    not_implemented()
    .return (t)
.end

=item C<#patt>

Returns a pattern that matches only if the input string matches C<patt>,
but without consuming any input, independently of success or failure.
(This pattern is equivalent to I<&patt> in the original PEG notation.)

When it succeeds, C<#patt> produces all captures produced by C<patt>.

NOT YET IMPLEMENTED.

=cut

.sub '__len' :method
    .param pmc patt
    ($P1, $P0) = getpatt(1, patt)
    $I1 = $P0
    not_implemented()
.end


=item C<-patt>

Returns a pattern that matches only if the input string does not match
C<patt>. It does not consume any input, independently of success or failure.
(This pattern is equivalent to I<!patt> in the original PEG notation.)

As an example, the pattern C<-lpeg.P(1)> matches only the end of string.

This pattern never produces any captures, because either C<patt> fails or
C<-patt> fails. (A failing pattern never produces captures.)

NOT YET IMPLEMENTED.

=cut

.sub '__unm' :method
    .param pmc patt
    ($P1, $P0) = getpatt(1, patt)
    $I1 = $P0
    not_implemented()
.end


=item C<patt1 + patt2>

Returns a pattern equivalent to an I<ordered choice> of C<patt1> and C<patt2>.
(This is denoted by I<patt1 / patt2> in the original PEG notation, not to be
confused with the C</> operation in LPeg.) It matches either C<patt1> or
C<patt2>, with no backtracking once one of them succeeds. The identity
element for this operation is the pattern C<lpeg.P(false)>, which always fails.

If both C<patt1> and C<patt2> are character sets, this operation is equivalent
to set union:

 lower = lpeg.R("az")
 upper = lpeg.R("AZ")
 letter = lower + upper

NOT YET IMPLEMENTED.

=cut

.sub '__add' :method
    .param pmc patt1
    .param pmc patt2
    $P1 = getpatt(1, patt1)
    $P2 = getpatt(2, patt2)
    not_implemented()
.end


=item C<patt1 - patt2>

Returns a pattern equivalent to I<!patt2 patt1>. This pattern asserts that
the input does not match C<patt2> and then matches C<patt1>.

If both C<patt1> and C<patt2> are character sets, this operation is equivalent
to set difference. Note that C<-patt> is equivalent to C<"" - patt>
(or C<0 - patt>). If C<patt> is a character set, C<1 - patt> is its complement.

NOT YET IMPLEMENTED.

=cut

.sub '__sub' :method
    .param pmc patt1
    .param pmc patt2
    $P1 = getpatt(1, patt1)
    $P2 = getpatt(2, patt2)
    not_implemented()
.end


=item C<patt1 * patt2>

Returns a pattern that matches C<patt1> and then matches C<patt2>, starting
where C<patt1> finished. The identity element for this operation is the
pattern C<lpeg.P(true)>, which always succeeds.

(LPeg uses the C<*> operator [instead of the more obvious C<..>] both because
it has the right priority and because in formal languages it is common to use
a dot for denoting concatenation.)

NOT YET IMPLEMENTED.

=cut

.sub '__mul' :method
    .param pmc patt1
    .param pmc patt2
    $P1 = getpatt(1, patt1)
    $P2 = getpatt(2, patt2)
    not_implemented()
.end


=item C<patt^n>

If C<n> is nonnegative, this pattern is equivalent to I<pattn patt*>.
It matches at least C<n> occurrences of C<patt>.

Otherwise, when C<n> is negative, this pattern is equivalent to I<(patt?)-n>.
That is, it matches at most C<-n> occurrences of C<patt>.

In particular, C<patt^0> is equivalent to I<patt*>, C<patt^1> is equivalent to
I<patt+>, and C<patt^-1> is equivalent to I<patt?> in the original PEG notation.

In all cases, the resulting pattern is greedy with no backtracking. That is,
it matches only the longest possible sequence of matches for C<patt>.

In all cases, the resulting pattern is greedy with no backtracking (also
called a I<possessive> repetition). That is, it matches only the longest
possible sequence of matches for C<patt>.

NOT YET IMPLEMENTED.

=cut

.sub '__pow' :method
    .param pmc patt
    .param pmc n
    $P1 = getpatt(1, patt)
    $I2 = lua_checknumber(2, n)
    not_implemented()
.end


=back

=head2 Grammars

With the use of Lua variables, it is possible to define patterns incrementally,
with each new pattern using previously defined ones. However, this technique
does not allow the definition of recursive patterns. For recursive patterns,
we need real grammars.

LPeg represents grammars with tables, where each entry is a rule.

The call C<lpeg.V(v)> creates a pattern that represents the nonterminal
(or I<variable>) with index C<v> in a grammar. Because the grammar still does
not exist when this function is evaluated, the result is an I<open reference>
to the respective rule.

A table is I<fixed> when it is converted to a pattern (either by calling
C<lpeg.P> or by using it wherein a pattern is expected). Then every open
reference created by C<lpeg.V(v)> is corrected to refer to the rule indexed
by C<v> in the table.

When a table is fixed, the result is a pattern that matches its I<initial rule>.
The entry with index 1 in the table defines its initial rule. If that entry is
a string, it is assumed to be the name of the initial rule. Otherwise,
LPeg assumes that the entry 1 itself is the initial rule.

As an example, the following grammar matches strings of a's and b's that have
the same number of a's and b's:

 equalcount = lpeg.P{
  "S";   -- initial rule name
  S = "a" * lpeg.V"B" + "b" * lpeg.V"A" + "",
  A = "a" * lpeg.V"S" + "b" * lpeg.V"A" * lpeg.V"A",
  B = "b" * lpeg.V"S" + "a" * lpeg.V"B" * lpeg.V"B",
 } * -1

=head2 Captures

Captures specify what a match operation should return (the so called
I<semantic information>). LPeg offers several kinds of captures, which
produces values based on matches and combine them to produce new values.

A capture pattern produces its values every time it succeeds. For instance,
a capture inside a loop produces as many values as matched by the loop.
A capture produces a value only when it succeeds. For instance, the pattern
C<lpeg.C(lpeg.P"a"^-1)> produces the empty string when there is no C<"a">
(because the pattern C<"a"?> succeeds), while the pattern C<lpeg.C("a")^-1>
does not produce any value when there is no C<"a"> (because the pattern C<"a">
fails).

Usually, LPEG evaluates all captures only after (and if) the entire match
succeeds. At I<match time> it only gathers enough information to produce the
capture values later. As a particularly important consequence, most captures
cannot affect the way a pattern matches a subject. The only exception to this
rule is the so-called I<match-time capture>. When a match-time capture matches,
it forces the immediate evaluation of all its nested captures and then calls
its corresponding function, which tells whether the match succeeds and also
what values are produced.

=over 4

=cut

.sub 'capture_aux' :anon
    .param pmc patt
    .param int kind
    .param int labelidx
    ($P1, $P0) = getpatt(1, patt)
    $I1 = $P0
    not_implemented()
.end


=item C<lpeg.C (patt)>

Creates a I<simple capture>, which captures the substring of the subject that
matches C<patt>. The captured value is a string. If C<patt> has other captures,
their values are returned after this one.

NOT YET IMPLEMENTED (see capture_aux).

=cut

.sub 'C'
    .param pmc patt :optional
    .param pmc extra :slurpy
    .tailcall capture_aux(patt, Csimple, 0)
.end


=item C<lpeg.Carg (n)>

Creates an I<argument capture>. This pattern matches the empty string and
produces the value given as the nth extra argument given in the call to
C<lpeg.match>.

NOT YET IMPLEMENTED.

=cut

.sub 'Carg'
    .param pmc n :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, n)
    not_implemented()
.end


=item C<lpeg.Cb (name)>

Creates a I<back capture>. This pattern matches the empty string and produces
the values produced by the I<most recent> group capture named C<name>.

I<Most recent> means the last I<complete outermost> group capture with the
given name. A I<Complete> capture means that the entire pattern corresponding
to the capture has matched. An I<Outermost> capture means that the capture
is not inside another complete capture.

NOT YET IMPLEMENTED.

=cut

.sub 'Cb'
    .param pmc name :optional
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<lpeg.Cc ({value})>

Creates a I<constant capture>. This pattern matches the empty string
and produces all given values as its captured values.

NOT YET IMPLEMENTED.

=cut

.sub 'Cc'
    .param pmc vararg :optional
    not_implemented()
.end


=item C<lpeg.Cf (patt, func)>

Creates an I<fold capture>. If C<patt> produces a list of captures
I<C1 C2 ... Cn>, this capture will produce the value
I<func(...func(func(C1, C2), C3)..., Cn)>, that is, it will I<fold>
(or I<accumulate>, or I<reduce>) the captures from C<patt> using function
<func>.

This capture assumes that C<patt> should produce at least one capture with
at least one value (of any type), which becomes the initial value of an
I<accumulator>. (If you need a specific initial value, you may prefix a
constant capture to C<patt>.) For each subsequent capture LPeg calls C<func>
with this accumulator as the first argument and all values produced by the
capture as extra arguments; the value returned by this call becomes the new
value for the accumulator. The final value of the accumulator becomes the
captured value.

As an example, the following pattern matches a list of numbers separated by
commas and returns their addition:

 -- matches a numeral and captures its value
 number = lpeg.R"09"^1 / tonumber
 --
 -- matches a list of numbers, captures their values
 list = number * ("," * number)^0
 --
 -- auxiliary function to add two numbers
 function add (acc, newvalue) return acc + newvalue end
 --
 -- folds the list of numbers adding them
 sum = lpeg.Cf(list, add)
 --
 -- example of use
 print(sum:match("10,30,43"))   --> 83

NOT YET IMPLEMENTED (see capture_aux).

=cut

.sub 'Cf'
    .param pmc patt :optional
    .param pmc func :optional
    .param pmc extra :slurpy
    lua_checktype(2, func, 'function')
    .tailcall capture_aux(patt, Cfold, 0)
.end


=item C<lpeg.Cg (patt [, name])>

Creates a I<group capture>. It groups all values returned by C<patt> into a
single capture. The group may be anonymous (if no name is given) or named with
the given name.

An anonymous group serves to join values from several captures into a single
capture. A named group has a different behavior. In most situations, a named
group returns no values at all. Its values are only relevant for a following
back capture or when used inside a table capture.

NOT YET IMPLEMENTED (see capture_aux).

=cut

.sub 'Cg'
    .param pmc patt :optional
    .param pmc name :optional
    .param pmc extra :optional
    if null name goto L1
    $I0 = isa name, 'LuaNil'
    unless $I0 goto L2
  L1:
    .tailcall capture_aux(patt, Cgroup, 0)
  L2:
    lua_checkstring(2, name)
    .tailcall capture_aux(patt, Cgroup, 2)
.end


=item C<lpeg.Cp ()>

Creates a I<position capture>. It matches the empty string and captures
the position in the subject where the match occurs. The captured value
is a number.

NOT YET IMPLEMENTED.

=cut

.sub 'Cp'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<lpeg.Cs (patt)>

Creates a I<substitution capture>, which captures the substring of the subject
that matches C<patt>, with I<substitutions>. For any capture inside C<patt>
with a value, the substring that matched the capture is replaced by the capture
value (which should be a string). The final captured value is the string
resulting from all replacements.

NOT YET IMPLEMENTED (see capture_aux).

=cut

.sub 'Cs'
    .param pmc patt :optional
    .param pmc extra :slurpy
    .tailcall capture_aux(patt, Csubst, 0)
.end


=item C<lpeg.Ct (patt)>

Creates a I<table capture>. This capture creates a table and puts all values
from all anonymous captures made by C<patt> inside this table in successive
integer keys, starting at 1. Moreover, for each named capture group created by
C<patt>, the first value of the group is put into the table with the group
name as its key. The captured value is only the table.

NOT YET IMPLEMENTED (see capture_aux).

=cut

.sub 'Ct'
    .param pmc patt :optional
    .param pmc extra :slurpy
    .tailcall capture_aux(patt, Ctable, 0)
.end


=item C<patt / string>

Creates a I<string capture>. It creates a capture string based on C<string>.
The captured value is a copy of C<string>, except that the character C<%>
works as an escape character: any sequence in C<string> of the form I<%n>,
with I<n> between 1 and 9, stands for the match of the I<n>-th capture in
C<patt>. The sequence C<%0> stands for the whole match. The sequence C<%%>
stands for a single C<%>.

=item C<patt / table>

Creates a I<query capture>. It indexes the given table using as key the first
value captured by C<patt>, or the whole match if C<patt> produced no value.
The value at that index is the final value of the capture. If the table does
not have that key, there is no captured value.

=item C<patt / function>

Creates a I<function capture>. It calls the given function passing all
captures made by C<patt> as arguments, or the whole match if C<patt> made
no capture. The values returned by the C<function> are the final values
of the capture. In particular, if C<function> returns no value, there is
no captured value.

NOT YET IMPLEMENTED (see capture_aux).

=cut

.sub '__div' :method
    .param pmc patt
    .param pmc arg
    $I0 = isa arg, 'LuaClosure'
    if $I0 goto L1
    $I0 = isa arg, 'LuaFunction'
    if $I0 goto L1
    goto L2
  L1:
    .tailcall capture_aux(patt, Cfunction, 2)
  L2:
    $I0 = isa arg, 'LuaTable'
    unless $I0 goto L3
    .tailcall capture_aux(patt, Cquery, 2)
  L3:
    $I0 = isa arg, 'LuaString'
    unless $I0 goto L4
    .tailcall capture_aux(patt, Cstring, 2)
  L4:
    lua_argerror(2, "invalid replacement value")
.end


=item C<lpeg.Cmt (patt, function)>

Creates a I<match-time capture>. Unlike all other captures, this one is
evaluated immediately when a match occurs. It forces the immediate
evaluation of all its nested captures and then calls C<function>.

The function gets as arguments the entire subject, the current position
(after the match of C<patt>), plus any capture values produced by C<patt>.

The first value returned by C<function> defines how the match happens.
If the call returns a number, the match succeeds and the returned number
becomes the new current position. (Assuming a subject I<s> and current
position I<i>, the returned number must be in the range I<[i, len(s) + 1]>.)
If the call returns B<false>, B<nil>, or no value, the match fails.

Any extra values returned by the function become the values produced by the
capture.

NOT YET IMPLEMENTED.

=cut

.sub 'Cmt'
    .param pmc patt :optional
    .param pmc func :optional
    .param pmc extra :slurpy
    ($P1, $P0) = getpatt(1, patt)
    $I1 = $P0
    lua_checktype(2, func, 'function')
    not_implemented()
.end


.namespace [ 'lpeg::Pattern' ]

.sub '__onload' :anon :load :init
    $P0 = subclass 'FixedPMCArray', 'lpeg::Pattern'
.end

.sub 'get_string' :vtable :method
    $S0 = "[]\n"
    new $P0, 'Iterator', self
    $I0 = 0
    new $P1, 'FixedIntegerArray'
    set $P1, 1
  L1:
    unless $P0 goto L2
    $P2 = shift $P0
    $P1[0] = $I0
    $S1 = sprintf "%02d: ", $P1
    concat $S0, $S1
    $S2 = $P2
    concat $S0, $S2
    inc $I0
    goto L1
  L2:
    .return ($S0)
.end

.sub 'setinstaux' :method
    .param int i
    .param int op
    .param int offset
    .param int aux
    new $P0, 'lpeg::Instruction'
    new $P1, 'Integer'
    set $P1, op
    setattribute $P0, 'code', $P1
    new $P1, 'Integer'
    set $P1, offset
    setattribute $P0, 'offset', $P1
    new $P1, 'Integer'
    set $P1, aux
    setattribute $P0, 'aux', $P1
    self[i] = $P0
.end

.sub 'setinst' :method
    .param int i
    .param int op
    .param int offset
    self.'setinstaux'(i, op, offset, 0)
.end

.sub 'setinstcap' :method
    .param int i
    .param int op
    .param int idx
    .param int k
    .param int n
    $I0 = n << 4
    $I0 |= k
    self.'setinstaux'(i, op, idx, $I0)
.end


.namespace [ 'lpeg::Instruction' ]

.sub '__onload' :anon :load :init
    $P0 = newclass 'lpeg::Instruction'
    addattribute $P0, 'code'
    addattribute $P0, 'aux'
    addattribute $P0, 'offset'
    addattribute $P0, 'f'
    addattribute $P0, 'buff'
.end

.const string names = <<'LIST'
any
char
set
zset
testany
testchar
testset
testzset
span
spanz
ret
end
choice
jmp
call
open_call
commit
partial_commit
back_commit
failtwice
fail
giveup
func
fullcapture
emptycapture
emptycaptureidx
opencapture
closecapture
closeruntime
LIST

.sub 'get_string' :vtable :method
    $P0 = split "\n", names
    .local pmc code
    code = getattribute self, 'code'
    $S0 = $P0[code]
    concat $S0, " \n"
    .return ($S0)
.end


=back

=head2 Some Examples

L<http://www.inf.puc-rio.br/~roberto/lpeg.html#ex>

=head1 LINKS

=over 4

=item Parsing Expression Grammars

L<http://pdos.csail.mit.edu/%7Ebaford/packrat/>

=item Wikipedia Entry for PEG

L<http://en.wikipedia.org/wiki/Parsing_expression_grammar>

=item Parsing Expression Grammars: A Recognition-Based Syntactic Foundation

L<http://pdos.csail.mit.edu/%7Ebaford/packrat/popl04/peg-popl04.pdf>

=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
