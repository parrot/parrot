# Copyright (C) 2005-2009, Parrot Foundation.

.namespace [ "PGE";"P5Regex" ]

.sub "compile_p5regex"
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $I0 = exists adverbs['grammar']
    if $I0 goto have_grammar
    adverbs['grammar'] = 'PGE::Grammar'
  have_grammar:

    .local string target
    target = adverbs['target']
    target = downcase target

    ##  If we're passed the results of a previous parse, use it.
    .local pmc match
    $I0 = isa source, ['PGE';'Match']
    if $I0 == 0 goto parse
    $P0 = source['expr']
    if null $P0 goto parse
    $I0 = isa $P0, ['PGE';'Exp']
    if $I0 == 0 goto parse
    match = source
    goto analyze

  parse:
    $P0 = get_global "p5regex"
    match = $P0(source, adverbs :flat :named)
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
    pad = new 'Hash'
    pad['subpats'] = 0
    exp = exp.'p5analyze'(pad)
    .tailcall exp.'compile'(adverbs :flat :named)
.end


.sub "p5regex"
    .param pmc mob
    .param pmc adverbs        :slurpy :named

    .local string stop, tighter
    .local pmc stopstack, optable

    stopstack = get_hll_global ['PGE';'P5Regex'], '@!stopstack'
    optable = get_hll_global ["PGE";"P5Regex"], "$optable"

    stop = adverbs['stop']
    tighter = adverbs['tighter']
    push stopstack, stop
    $P0 = optable."parse"(mob, 'stop'=>stop, 'tighter'=>tighter)
    $S0 = pop stopstack

    .return ($P0)
.end


.include "cclass.pasm"

.const int PGE_INF = 2147483647

.sub "__onload" :tag('load')
    .local pmc optable

    optable = new ['PGE';'OPTable']
    set_hll_global ["PGE";"P5Regex"], "$optable", optable

    $P0 = get_hll_global ["PGE";"P5Regex"], "parse_lit"
    optable.'newtok'('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('term:\b', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:\B', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:^',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.'newtok'('term:$',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')

    optable.'newtok'('term:\d', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\D', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\s', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\S', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\w', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.'newtok'('term:\W', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')

    optable.'newtok'('circumfix:( )',   'equiv'=>'term:', 'nows'=>1, 'nullterm'=>1, 'match'=>'PGE::Exp::CGroup')
    optable.'newtok'('circumfix:(?: )', 'equiv'=>'term:', 'nows'=>1, 'nullterm'=>1, 'match'=>'PGE::Exp::Group')

    $P0 = get_hll_global ['PGE';'P5Regex'], 'parse_enumclass'
    optable.'newtok'('term:[', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('term:.', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_hll_global ['PGE';'P5Regex'], 'parse_quant'
    optable.'newtok'('postfix:*', 'looser'=>'term:', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('postfix:+', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('postfix:?', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.'newtok'('postfix:{', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)

    optable.'newtok'('infix:',  'looser'=>'postfix:*', 'right'=>1, 'nows'=>1, 'match'=>'PGE::Exp::Concat')
    optable.'newtok'('infix:|', 'looser'=>'infix:',    'left'=>1,  'nows'=>1, 'match'=>'PGE::Exp::Alt')

    optable.'newtok'('close:}', 'looser'=>'infix:|', 'nows'=>1)            # XXX: hack

    # Create a stack for holding stop tokens
    $P0 = new 'ResizablePMCArray'
    set_hll_global ['PGE';'P5Regex'], '@!stopstack', $P0

    $P0 = get_hll_global ["PGE";"P5Regex"], "compile_p5regex"
    compreg "PGE::P5Regex", $P0
.end


.sub 'parse_error'
    .param pmc mob
    .param int pos
    .param string message
    $P0 = getattribute mob, '$.pos'
    $P0 = pos
    $P0 = new 'Exception'
    $S0 = 'p5regex parse error: '
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
    $P0 = $S0
    throw $P0
    .return ()
.end


.sub "parse_lit"
    .param pmc mob
    .param pmc adverbs        :slurpy :named
    .local string target
    .local int pos, lastpos
    .local int litstart, litlen
    .local string initchar
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Literal')
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
    $I0 = index "nrteab", initchar
    if $I0 < 0 goto term_literal
    initchar = substr "\n\r\t\e\a\b", $I0, 1
  term_literal:
    litstart = pos
    litlen = 0
    .local string stop
    .local int stoplen
    $P0 = get_hll_global ['PGE';'P5Regex'], '@!stopstack'
    stop = $P0[-1]
    stoplen = length stop
  term_literal_loop:
    if pos >= lastpos goto term_literal_end
    if stoplen == 0 goto not_stop
    $S0 = substr target, pos, stoplen
    if $S0 == stop goto term_literal_end
  not_stop:
    $S0 = substr target, pos, 1
    $I0 = index "[](){}*?+\\|^$.", $S0
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
    mob.'!make'($S0)
    goto end
  end:
    mob.'to'(pos)
    .return (mob)
.end

.sub "parse_quant"
    .param pmc mob
    .param pmc adverbs        :slurpy :named
    .local string target
    .local int min, max, backtrack
    .local int pos, lastpos
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::Quant')
    lastpos = length target
    min = 0
    max = PGE_INF
    backtrack = 0
    if key == '{' goto quant_range
    if key != '+' goto quant_max
    min = 1
  quant_max:
    if key != "?" goto quant_lazy
    max = 1
    goto quant_lazy
  quant_range:
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto quant_range_max
    $S0 = substr target, pos
    min = $S0
    max = $S0
    pos = $I1
  quant_range_max:
    $S0 = substr target, pos, 1
    if $S0 != "," goto quant_range_end
    inc pos
    max = PGE_INF
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto quant_range_end
    $S0 = substr target, pos
    max = $S0
    pos = $I1
  quant_range_end:
    $S0 = substr target, pos, 1
    if $S0 != "}" goto err_range
    inc pos
  quant_lazy:
    $S0 = substr target, pos, 1
    if $S0 != "?" goto end
    backtrack = PGE_BACKTRACK_EAGER
    inc pos
  end:
    mob["min"] = min
    mob["max"] = max
    mob["backtrack"] = backtrack
    mob.'to'(pos)
    .return (mob)
  err_range:
    parse_error(mob, pos, "Error in quantified range")
.end


.sub parse_group
    .param pmc mob
    .param pmc adverbs        :slurpy :named
    .local string target
    .local int pos, lastpos
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::CGroup')
    inc pos
    $S0 = substr target, pos, 2
    if $S0 == "?:" goto nocapture
    goto end
  nocapture:
    pos += 2
  end:
    mob.'to'(pos)
    .return (mob)
.end

.sub "parse_enumclass"
    .param pmc mob
    .param pmc adverbs        :slurpy :named
    .local string target
    .local int pos, lastpos
    .local int isrange
    .local string charlist
    .local string key
    key = mob['KEY']
    (mob, pos, target) = mob.'new'(mob, 'grammar'=>'PGE::Exp::EnumCharList')
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
    mob.'to'(pos)
    mob.'!make'(charlist)
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


.namespace [ "PGE";"Exp" ]

.sub "p5analyze" :method
    .param pmc pad
    .local pmc exp
    $I0 = 0
  loop:
    $I1 = defined self[$I0]
    if $I1 == 0 goto end
    $P0 = self[$I0]
    $P0 = $P0."p5analyze"(pad)
    self[$I0] = $P0
    inc $I0
    goto loop
  end:
    .return (self)
.end

.namespace [ "PGE";"Exp";"CGroup" ]

.sub "p5analyze" :method
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
    exp = exp."p5analyze"(pad)
    self[0] = exp
    .return (self)
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
