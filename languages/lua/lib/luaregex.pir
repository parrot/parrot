# Copyright (C) 2007, The Perl Foundation.
# $Id: luaregex.pir 16887 2007-02-03 18:28:40Z fperrad $

=head1 NAME

lib/luaregex.pir - Lua regex compiler

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 5.4.1 "Patterns",
L<http://www.lua.org/manual/5.1/manual.html#5.4.1>.

=head1 HISTORY

Mostly taken from F<compilers/pge/PGE/P5Regex.pir>.

=head1 AUTHOR

Francois Perrad

=cut

.sub "__onload" :load
    load_bytecode 'PGE.pbc'

    $P0 = getclass "PGE::Exp::CCShortcut"
    $P1 = subclass $P0, "PGE::Exp::LuaCCShortcut"
.end

.namespace [ "PGE::LuaRegex" ]

.sub "compile_luaregex"
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $I0 = exists adverbs['name']
    if $I0 goto adverbs_1
    adverbs['name'] = '_luaregex'
  adverbs_1:
    $I0 = exists adverbs['grammar']
    if $I0 goto adverbs_2
    adverbs['grammar'] = 'PGE::Grammar'
  adverbs_2:

    .local string target
    target = adverbs['target']
    target = downcase target

    .local pmc match
    $P0 = get_global "luaregex"
    match = $P0(source)
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
    .local pmc exp, pad
    exp = match['expr']
    pad = new .Hash
    pad['subpats'] = 0
    exp = exp.'luaanalyze'(pad)
    .return exp.'compile'(adverbs :flat :named)
.end


.sub "luaregex"
    .param pmc mob
    .local pmc optable
    optable = get_hll_global ["PGE::LuaRegex"], "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end


.include "cclass.pasm"


.sub "__onload" :load
    .local pmc optable

    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    set_hll_global ["PGE::LuaRegex"], "$optable", optable

    $P0 = get_hll_global ["PGE::LuaRegex"], "parse_lit"
    optable.newtok('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('term:^',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:$',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')

    optable.newtok('term:%a', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%A', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%c', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%C', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%d', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%D', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%l', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%L', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%p', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%P', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%s', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%S', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%u', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%U', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%w', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%W', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%x', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
    optable.newtok('term:%X', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
#    optable.newtok('term:%z', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')
#    optable.newtok('term:%Z', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::LuaCCShortcut')

    optable.newtok('circumfix:( )',   'equiv'=>'term:', 'nows'=>1, 'nullterm'=>1, 'match'=>'PGE::Exp::CGroup')

    $P0 = get_hll_global ['PGE::LuaRegex'], 'parse_enumclass'
    optable.newtok('term:[', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:.', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_hll_global ['PGE::LuaRegex'], 'parse_quant'
    optable.newtok('postfix:*', 'looser'=>'term:', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('postfix:+', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('postfix:?', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('postfix:-', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('infix:',  'looser'=>'postfix:*', 'right'=>1, 'nows'=>1, 'match'=>'PGE::Exp::Concat')

    $P0 = get_hll_global ["PGE::LuaRegex"], "compile_luaregex"
    compreg "PGE::LuaRegex", $P0
.end


.sub 'parse_error'
    .param pmc mob
    .param int pos
    .param string message
    $P0 = getattribute mob, '$.pos'
    $P0 = pos
    $P0 = new .Exception
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
    $P0['_message'] = $S0
    throw $P0
    .return ()
.end


.sub "parse_lit"
    .param pmc mob
    .local pmc newfrom
    .local string target
    .local int pos, lastpos
    .local int litstart, litlen
    .local string initchar
    newfrom = get_hll_global ["PGE::Match"], "newfrom"
    (mob, target, $P0, $P1) = newfrom(mob, 0, "PGE::Exp::Literal")
    pos = $P0
    lastpos = length target
    initchar = substr target, pos, 1
    unless initchar == '*' goto initchar_ok
    parse_error(mob, pos, "Quantifier follows nothing")

  initchar_ok:
    if initchar == ')' goto end
    inc pos
    if initchar != "\\" goto term_literal
  term_backslash:
    initchar = substr target, pos, 1
    inc pos
    if pos <= lastpos goto term_backslash_ok
    parse_error(mob, pos, "Search pattern not terminated")
  term_backslash_ok:
    $I0 = index "abfnrtv", initchar
    if $I0 < 0 goto term_literal
    initchar = substr "\a\b\f\n\r\t\x0b", $I0, 1
  term_literal:
    litstart = pos
    litlen = 0
  term_literal_loop:
    if pos >= lastpos goto term_literal_end
    $S0 = substr target, pos, 1
    $I0 = index "^$()%.[]*+-?", $S0
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
    $P0 = getattribute mob, "PGE::Match\x0$.pos"
    $P0 = pos
    .return (mob)
.end

.const int PGE_INF = 2147483647
.const int PGE_BACKTRACK_GREEDY = 1
.const int PGE_BACKTRACK_EAGER = 2
.const int PGE_BACKTRACK_NONE = 3

.sub "parse_quant"
    .param pmc mob
    .local string target
    .local int min, max, backtrack
    .local int pos, lastpos
    .local pmc mfrom, mpos
    .local string key
    key = mob['KEY']
    $P0 = get_hll_global ["PGE::Match"], "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Quant")
    pos = mfrom
    lastpos = length target
    min = 0
    max = PGE_INF
    backtrack = PGE_BACKTRACK_NONE
    if key != '+' goto quant_max
    min = 1
  quant_max:
    if key != "?" goto quant_eager
    max = 1
  quant_eager:
    if key != "-" goto end
    backtrack = PGE_BACKTRACK_EAGER
  end:
    mob["min"] = min
    mob["max"] = max
    mob["backtrack"] = backtrack
    mpos = pos
    .return (mob)
  err_range:
    parse_error(mob, pos, "Error in quantified range")
.end


.sub "parse_enumclass"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    .local int isrange
    .local string charlist
    .local string key
    key = mob['KEY']
    $P0 = get_hll_global ["PGE::Match"], "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::EnumCharList")
    pos = mfrom
    if key == '.' goto dot
    lastpos = length target
    charlist = ""
    mob["isnegated"] = 0
    isrange = 0
    $S0 = substr target, pos, 1
    if $S0 != "^" goto scan_first
    mob["isnegated"] = 1
    inc pos
  scan_first:
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == "\\" goto backslash
    goto addchar
  scan:
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == "]" goto endclass
    if $S0 == "-" goto hyphenrange
    if $S0 != "\\" goto addchar
  backslash:
    $S0 = substr target, pos, 1
    inc pos
    $I0 = index "nrtfae0b", $S0
    if $I0 == -1 goto addchar
    $S0 = substr "\n\r\t\f\a\e\0\b", $I0, 1
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
    charlist .= "-"
    goto end
  dot:
    charlist = "\n"
    mob["isnegated"] = 1
  end:
    mpos = pos
    mob.'result_object'(charlist)
    .return (mob)

  err_close:
    parse_error(mob, pos, "Unmatched [")
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


.namespace [ "PGE::Exp" ]

.sub "luaanalyze" :method
    .param pmc pad
    .local pmc exp
    $I0 = 0
  loop:
    $I1 = defined self[$I0]
    if $I1 == 0 goto end
    $P0 = self[$I0]
    $P0 = $P0."luaanalyze"(pad)
    self[$I0] = $P0
    inc $I0
    goto loop
  end:
    .return (self)
.end

.namespace [ "PGE::Exp::CGroup" ]

.sub "luaanalyze" :method
    .param pmc pad
    .local pmc exp

    self["iscapture"] = 0
    if self != "(" goto end
    self["iscapture"] = 1
    self["isscope"] = 0
    self["isarray"] = 0
    $I0 = pad["subpats"]
    self["cname"] = $I0
    inc $I0
    pad["subpats"] = $I0
  end:
    exp = self[0]
    exp = exp."luaanalyze"(pad)
    self[0] = exp
    .return (self)
.end

.namespace [ 'PGE::Exp::LuaCCShortcut' ]

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
#    if token == '%Z' goto z
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
#    if token == '%z' goto z
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

