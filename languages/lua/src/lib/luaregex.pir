# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luaregex.pir - Lua regex compiler

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 5.4.1 "Patterns",
L<http://www.lua.org/manual/5.1/manual.html#5.4.1>.

=head2 Character Class:

A I<character class> is used to represent a set of characters. The following
combinations are allowed in describing a character class:

=over 4

=item B<x>

(where I<x> is not one of the I<magic characters> C<^$()%.[]*+-?)> represents
the character I<x> itself.

=item B<.>

(a dot) represents all characters.

=item B<%a>

represents all letters.

=item B<%c>

represents all control characters.

=item B<%d>

represents all digits.

=item B<%l>

represents all lowercase letters.

=item B<%p>

represents all punctuation characters.

=item B<%s>

represents all space characters.

=item B<%u>

represents all uppercase letters.

=item B<%w>

represents all alphanumeric characters.

=item B<%x>

represents all hexadecimal digits.

=item B<%z>

represents the character with representation 0.

=item B<%x>

(where I<x> is any non-alphanumeric character) represents the character I<x>.
This is the standard way to escape the magic characters. Any punctuation
character (even the non magic) can be preceded by a C<'%'> when used to
represent itself in a pattern.

=item B<[set]>

represents the class which is the union of all characters in I<set>. A range of
characters may be specified by separating the end characters of the range with
a C<'-'>. All classes C<%x> described above may also be used as components in
I<set>. All other characters in I<set> represent themselves. For example,
C<[%w_]> (or C<[_%w]>) represents all alphanumeric characters plus the
underscore, C<[0-7]> represents the octal digits, and C<[0-7%l%-]> represents
the octal digits plus the lowercase letters plus the C<'-'> character.

The interaction between ranges and classes is not defined. Therefore, patterns
like C<[%a-z]> or C<[a-%%]> have no meaning.

=item B<[^set]>

represents the complement of I<set>, where I<set> is interpreted as above.

=back

For all classes represented by single letters (C<%a>, C<%c>, etc.), the
corresponding uppercase letter represents the complement of the class. For
instance, C<%S> represents all non-space characters.

The definitions of letter, space, and other character groups depend on the
current locale. In particular, the class C<[a-z]> may not be equivalent to
C<%l>.

=head2 Pattern Item:

A I<pattern item> may be

=over 4

=item *

a single character class, which matches any single character in the class;

=item *

a single character class followed by C<'*'>, which matches 0 or more
repetitions of characters in the class. These repetition items will always
match the longest possible sequence;

=item *

a single character class followed by C<'+'>, which matches 1 or more
repetitions of characters in the class. These repetition items will always
match the longest possible sequence;

=item *

a single character class followed by C<'-'>, which also matches 0 or more
repetitions of characters in the class. Unlike C<'*'>, these repetition items
will always match the I<shortest> possible sequence;

=item *

a single character class followed by C<'?'>, which matches 0 or 1
occurrence of a character in the class;

=item *

C<%n>, for I<n> between 1 and 9; such item matches a substring equal to
the i<n>-th captured string (see below);

=item *

C<%bxy>, where I<x> and I<y> are two distinct characters; such item
matches strings that start with I<x>, end with I<y>, and where the I<x> and
I<y> are I<balanced>. This means that, if one reads the string from left to
right, counting I<+1> for an I<x> and I<-1> for a I<y>, the ending I<y> is the
first I<y> where the count reaches 0. For instance, the item C<%b()> matches
expressions with balanced parentheses.

=back

=head2 Pattern:

A I<pattern> is a sequence of pattern items. A C<'^'> at the beginning of a
pattern anchors the match at the beginning of the subject string. A C<'$'> at
the end of a pattern anchors the match at the end of the subject string. At
other positions, C<'^'> and C<'$'> have no special meaning and represent
themselves.

=head2 Captures:

A pattern may contain sub-patterns enclosed in parentheses; they describe
I<captures>. When a match succeeds, the substrings of the subject string that
match captures are stored (I<captured>) for future use. Captures are numbered
according to their left parentheses. For instance, in the pattern
C<"(a*(.)%w(%s*))">, the part of the string matching C<"a*(.)%w(%s*)"> is
stored as the first capture (and therefore has number 1); the character
matching C<"."> is captured with number 2, and the part matching C<"%s*"> has
number 3.

As a special case, the empty capture C<()> captures the current string
position (a number). For instance, if we apply the pattern C<"()aa()"> on the
string C<"flaaap">, there will be two captures: 3 and 5.

A pattern cannot contain embedded zeros. Use C<%z> instead.

=head1 HISTORY

Mostly taken from F<compilers/pge/PGE/P5Regex.pir>.

=cut

.sub '__onload' :anon :load :init
    load_bytecode 'PGE.pbc'

    .local pmc p6meta
    p6meta = get_hll_global 'P6metaclass'
    $P0 = p6meta.'new_class'('PGE::Exp::LuaCCShortcut', 'parent'=>'PGE::Exp::CCShortcut')
    $P0 = p6meta.'new_class'('PGE::Exp::LuaCGroup', 'parent'=>'PGE::Exp::CGroup')
    $P0 = p6meta.'new_class'('PGE::Exp::LuaBalanced', 'parent'=>'PGE::Exp')
    $P0 = p6meta.'new_class'('PGE::Cache', 'parent'=>'Hash')
.end

.namespace [ 'PGE';'LuaRegex' ]

.sub 'compile_luaregex'
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $I0 = exists adverbs['grammar']
    if $I0 goto have_grammar
    adverbs['grammar'] = 'PGE::Grammar'
  have_grammar:

    .local string target
    target = adverbs['target']
    target = downcase target

    unless target == '' goto no_cache
    .local pmc cache
    cache = get_hll_global ['PGE';'LuaRegex'], 'cache_compile'
    $P0 = cache[source]
    if null $P0 goto no_cache
    .return ($P0)
  no_cache:

    .local pmc match
    match = luaregex(source)
    if target != 'parse' goto check
    .return (match)

  check:
    unless match goto check_1
    $S0 = source
    $S1 = match
    if $S0 == $S1 goto analyze
  check_1:
    null $P0
    .return ($P0)

  analyze:
    .local pmc expr, pad, code
    expr = match['expr']
    new pad, 'Hash'
    pad['subpats'] = 0
    expr = expr.'luaanalyze'(pad)
    code = expr.'compile'(adverbs :flat :named)
    cache[source] = code
    .return (code)
.end


.sub 'luaregex'
    .param pmc mob
    .local pmc optable
    optable = get_hll_global ['PGE';'LuaRegex'], '$optable'
    $P0 = optable.'parse'(mob)
    .return ($P0)
.end


.include 'cclass.pasm'


.sub '__onload' :anon :load :init
    .local pmc optable
    optable = new ['PGE';'OPTable']
    set_hll_global ['PGE';'LuaRegex'], '$optable', optable

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_literal'
    optable.'newtok'('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_anchor'
    optable.'newtok'('term:^', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:$', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('term:%a', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%A', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%c', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%C', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%d', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%D', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%l', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%L', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%p', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%P', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%s', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%S', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%u', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%U', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%w', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%W', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%x', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.'newtok'('term:%X', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_backref'
    optable.'newtok'('term:%1', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%2', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%3', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%4', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%5', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%6', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%7', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%8', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%9', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('circumfix:( )', 'equiv'=>'term:', 'nows'=>1, 'nullterm'=>1, 'match'=>'PGE::Exp::LuaCGroup')

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_enumclass'
    optable.'newtok'('term:[', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)
    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_enumclass2'
    optable.'newtok'('term:.', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%z', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:%Z', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_balanced'
    optable.'newtok'('term:%b', 'equiv'=>'term:', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'parse_quantifier'
    optable.'newtok'('postfix:*', 'looser'=>'term:', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('postfix:+', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('postfix:?', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('postfix:-', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('infix:', 'looser'=>'postfix:*', 'right'=>1, 'nows'=>1, 'match'=>'PGE::Exp::Concat')

    .local pmc cache, mt
    cache = new ['PGE';'Cache']
    set_hll_global ['PGE';'LuaRegex'], 'cache_compile', cache

    $P0 = get_hll_global ['PGE';'LuaRegex'], 'compile_luaregex'
    compreg 'PGE::LuaRegex', $P0
.end


.sub 'parse_error'
    .param pmc mob
    .param int pos
    .param string message
    $P0 = getattribute mob, '$.pos'
    $P0 = pos
    $S0 = 'luaregex parse error: '
    $S0 .= message
    $S0 .= ' at offset '
    $S1 = pos
    $S0 .= $S1
    $S0 .= ", found '"
    $P1 = getattribute mob, '$.target'
    $S1 = $P1
    $S1 = substr $S1, pos, 1
    $S0 .= $S1
    $S0 .= "'"
    die $S0
.end


.sub 'parse_literal'
    .param pmc mob
    .local string target
    .local int pos, lastpos
    .local int litstart, litlen
    .local string initchar
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
    lastpos = length target
    initchar = substr target, pos, 1
    if initchar == ')' goto end
    inc pos
  term_percent:
    if initchar != '%' goto term_literal
    if pos < lastpos goto term_percent_ok
    parse_error(mob, pos, "malformed pattern (ends with '%')")
  term_percent_ok:
    initchar = substr target, pos, 1
    inc pos
  term_literal:
    litstart = pos
    litlen = 0
  term_literal_loop:
    if pos >= lastpos goto term_literal_end
    $S0 = substr target, pos, 1
    $I0 = index '()%.[]*+-?', $S0
    # if not in circumfix:( ) throw error on end paren
    if $I0 >= 0 goto term_literal_end
    inc pos
    inc litlen
    goto term_literal_loop
  term_literal_end:
    if litlen < 1 goto term_literal_one
    dec pos
  term_literal_one:
    $I0 = pos - litstart
    $S0 = substr target, litstart, $I0
    $S0 = concat initchar, $S0
    mob.'result_object'($S0)
    goto end
  end:
    mob.'to'(pos)
    .return (mob)
.end

.const int PGE_INF = 2147483647
.const int PGE_BACKTRACK_GREEDY = 1
.const int PGE_BACKTRACK_EAGER = 2

.sub 'parse_quantifier'
    .param pmc mob
    .local string target
    .local int min, max, backtrack
    .local int pos, lastpos
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Quant')
    lastpos = length target
    min = 0
    max = PGE_INF
    backtrack = PGE_BACKTRACK_GREEDY
    if key != '+' goto quant_max
    min = 1
  quant_max:
    if key != '?' goto quant_eager
    max = 1
  quant_eager:
    if key != '-' goto end
    backtrack = PGE_BACKTRACK_EAGER
  end:
    mob['min'] = min
    mob['max'] = max
    mob['backtrack'] = backtrack
    mob.'to'(pos)
    .return (mob)
.end


.sub 'parse_enumclass'
    .param pmc mob
    .local string target
    .local int pos, lastpos
    .local int isrange
    .local string charlist
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::EnumCharList')
    lastpos = length target
    charlist = ''
    mob['isnegated'] = 0
    isrange = 0
    $S0 = substr target, pos, 1
    if $S0 != '^' goto scan_first
    mob['isnegated'] = 1
    inc pos
  scan_first:
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == '%' goto percent
    goto addchar
  scan:
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == ']' goto endclass
    if $S0 == '-' goto hyphenrange
    if $S0 != '%' goto addchar
  percent:
    $S0 = substr target, pos, 1
    inc pos
  addchar:
    if isrange goto addrange
    charlist .= $S0
    goto scan
  addrange:
    isrange = 0
    $I2 = ord charlist, -1
    $I0 = ord $S0
    if $I0 < $I2 goto err_range
  addrange_1:
    inc $I2
    if $I2 > $I0 goto scan
    $S1 = chr $I2
    charlist .= $S1
    goto addrange_1
  hyphenrange:
    if isrange goto addrange
    isrange = 1
    goto scan
  endclass:
    if isrange == 0 goto end
    charlist .= '-'
  end:
    mob.'to'(pos)
    mob.'result_object'(charlist)
    .return (mob)

  err_close:
    parse_error(mob, pos, "malformed pattern (missing ']')")
  err_range:
    $S0 = 'Invalid [] range "'
    $S1 = chr $I2
    $S0 .= $S1
    $S0 .= '-'
    $S1 = chr $I0
    $S0 .= $S1
    $S0 .= '"'
    parse_error(mob, pos, $S0)
.end


.sub 'parse_enumclass2'
    .param pmc mob
    .local string target
    .local int pos
    .local string charlist
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::EnumCharList')
    unless key == '.' goto zero
    charlist = ''
    mob['isnegated'] = 1
    goto end
  zero:
    charlist = "\0"
    mob['isnegated'] = 0
    unless key == '%Z' goto end
    mob['isnegated'] = 1
  end:
    mob.'to'(pos)
    mob.'result_object'(charlist)
    .return (mob)
.end


.sub 'parse_balanced'
    .param pmc mob
    .local string target
    .local int pos, lastpos
    .local string xy
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::LuaBalanced')
    lastpos = length target
    if lastpos < 2 goto err
    xy = substr target, pos, 2
    pos += 2
    mob.'to'(pos)
    mob.'result_object'(xy)
    .return (mob)

  err:
    parse_error(mob, pos, "unbalanced pattern")
.end


.sub 'parse_backref'
    .param pmc mob
    .local string target
    .local int pos
    .local string cname
    $P0 = getattribute mob, '$.target'
    target = $P0
    $P0 = getattribute mob, '$.pos'
    pos = $P0
    $I0 = pos - 1
    $S0 = substr target, $I0, 1
    (mob, $I1, $S1) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Scalar')
    $I0 = $S0
    dec $I0
    mob['cname'] = $I0
    mob.'to'(pos)
    .return (mob)
.end


.sub 'parse_anchor'
    .param pmc mob
    .local string target
    .local int pos, lastpos
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Anchor')
    lastpos = length target
    unless key == '$' goto start
    unless pos == lastpos goto end
    mob.'to'(pos)
  start:
    unless pos == 1 goto end
    mob.'to'(pos)
  end:
    .return (mob)
.end


.namespace [ 'PGE';'Exp' ]

.sub 'luaanalyze' :method
    .param pmc pad
    .local pmc expr
    $I0 = 0
  loop:
    $I1 = defined self[$I0]
    if $I1 == 0 goto end
    $P0 = self[$I0]
    $P0 = $P0.'luaanalyze'(pad)
    self[$I0] = $P0
    inc $I0
    goto loop
  end:
    .return (self)
.end


.namespace [ 'PGE';'Exp';'LuaCGroup' ]

.sub 'luaanalyze' :method
    .param pmc pad
    .local pmc expr

    self['iscapture'] = 0
    if self != '(' goto end
    self['iscapture'] = 1
    self['isscope'] = 0
    self['isarray'] = 0
    $I0 = pad['subpats']
    self['cname'] = $I0
    inc $I0
    pad['subpats'] = $I0
  end:
    expr = self[0]
    expr = expr.'luaanalyze'(pad)
    self[0] = expr
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    $P0 = self[0]
    $I0 = isa $P0, ['PGE';'Exp';'Literal']
    unless $I0 goto super
    $S0 = $P0
    unless $S0 == '' goto super

    .local pmc args
    args = self.'getargs'(label, next)

    .local string captgen, captsave, captback
    (captgen, captsave, captback) = self.'gencapture'(label)

    code.'emit'(<<"        CODE", captgen, captsave, captback, args :flat :named)
        %L: # empty capture
          %0
          push ustack, captscope
          new captob, 'Integer'
          set captob, pos
          inc captob
          %1
          bsr %S
          %2
          captscope = pop ustack
          goto fail\n
        CODE
    .return ()

  super:
    $P0 = get_hll_global ['PGE';'Exp';'CGroup'], 'pir'
    .tailcall $P0(self, code, label, next)
.end


.namespace [ 'PGE';'Exp';'LuaCCShortcut' ]

.sub 'reduce' :method
    .param pmc next

    .local string token
    token = self
    self['negate'] = 1
    if token == '%A' goto letter
    if token == '%C' goto ctrl
    if token == '%D' goto digit
    if token == '%L' goto lower
    if token == '%P' goto ponct
    if token == '%S' goto space
    if token == '%U' goto upper
    if token == '%W' goto word
    if token == '%X' goto hexa
    self['negate'] = 0
    if token == '%a' goto letter
    if token == '%c' goto ctrl
    if token == '%d' goto digit
    if token == '%l' goto lower
    if token == '%p' goto ponct
    if token == '%s' goto space
    if token == '%u' goto upper
    if token == '%w' goto word
    if token == '%x' goto hexa
    self['cclass'] = .CCLASS_ANY
    goto end
  letter:
    self['cclass'] = .CCLASS_ALPHABETIC
    goto end
  ctrl:
    self['cclass'] = .CCLASS_CONTROL
    goto end
  digit:
    self['cclass'] = .CCLASS_NUMERIC
    goto end
  lower:
    self['cclass'] = .CCLASS_LOWERCASE
    goto end
  ponct:
    self['cclass'] = .CCLASS_PUNCTUATION
    goto end
  space:
    self['cclass'] = .CCLASS_WHITESPACE
    goto end
  upper:
    self['cclass'] = .CCLASS_UPPERCASE
    goto end
  word:
    self['cclass'] = .CCLASS_WORD
    goto end
  hexa:
    self['cclass'] = .CCLASS_HEXADECIMAL
  end:
    .return (self)
.end


.namespace [ 'PGE';'Exp';'LuaBalanced' ]

.sub 'reduce' :method
    .param pmc next
    .return (self)
.end

.sub 'pir' :method
    .param pmc code
    .param string label
    .param string next

    .local string begin, end
    $S0 = self
    begin = substr $S0, 0, 1
    begin = code.'escape'(begin)
    end = substr $S0, 1, 1
    end = code.'escape'(end)

    code.'emit'(<<"        CODE", label, begin, end, next)
        %0: # balanced
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          if $S0 != %1 goto fail
          $I1 = 1
        %0_1:
          inc pos
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          if $S0 != %2 goto %0_2
          dec $I1
          if $I1 != 0 goto %0_1
          inc pos
          goto %3
        %0_2:
          if $S0 != %1 goto %0_1
          inc $I1
          goto %0_1
        CODE
    .return ()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
