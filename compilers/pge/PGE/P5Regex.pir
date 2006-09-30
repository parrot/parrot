

.namespace [ "PGE::P5Regex" ]

.sub "compile_p5regex"
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $I0 = exists adverbs['name']
    if $I0 goto adverbs_1
    adverbs['name'] = '_p5regex'
  adverbs_1:
    $I0 = exists adverbs['grammar']
    if $I0 goto adverbs_2
    adverbs['grammar'] = 'PGE::Grammar'
  adverbs_2:

    .local string target
    target = adverbs['target']

    .local pmc match
    $P0 = get_hll_global ["PGE::Grammar"], "p5regex"
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
    exp = exp.'p5analyze'(pad)
    if target != 'exp' goto pir
    .return (exp)

  pir:
    .local pmc code
    code = exp.'root_pir'(adverbs :flat :named)
    if target != 'PIR' goto bytecode
    .return (code)

  bytecode:
    $P0 = compreg 'PIR'
    $P1 = $P0(code)
    .return ($P1)
.end


.namespace [ "PGE::Grammar" ]

.sub "p5regex"
    .param pmc mob
    .local pmc optable
    optable = get_hll_global ["PGE::P5Regex"], "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end


.include "cclass.pasm"

.const int PGE_INF = 2147483647

.namespace [ "PGE::P5Regex" ]

.sub "__onload" :load
    .local pmc optable

    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    set_hll_global ["PGE::P5Regex"], "$optable", optable

    $P0 = get_hll_global ["PGE::P5Regex"], "parse_lit"
    optable.newtok('term:', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('term:\\b', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:\\B', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:^',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')
    optable.newtok('term:$',   'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::Anchor')

    optable.newtok('term:\\d', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\\D', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\\s', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\\S', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\\w', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')
    optable.newtok('term:\\W', 'equiv'=>'term:', 'nows'=>1, 'match'=>'PGE::Exp::CCShortcut')

    optable.newtok('circumfix:( )',   'equiv'=>'term:', 'nows'=>1, 'nullterm'=>1, 'match'=>'PGE::Exp::CGroup')
    optable.newtok('circumfix:(?: )', 'equiv'=>'term:', 'nows'=>1, 'nullterm'=>1, 'match'=>'PGE::Exp::Group')

    $P0 = get_hll_global ['PGE::P5Regex'], 'parse_enumclass'
    optable.newtok('term:[', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('term:.', 'precedence'=>'=', 'nows'=>1, 'parsed'=>$P0)

    $P0 = get_hll_global ['PGE::P5Regex'], 'parse_quant'
    optable.newtok('postfix:*', 'looser'=>'term:', 'left'=>1, 'nows', 'parsed'=>$P0)
    optable.newtok('postfix:+', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('postfix:?', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)
    optable.newtok('postfix:{', 'equiv'=>'postfix:*', 'left'=>1, 'nows'=>1, 'parsed'=>$P0)

    optable.newtok('infix:',  'looser'=>'postfix:*', 'right'=>1, 'nows'=>1, 'match'=>'PGE::Exp::Concat')
    optable.newtok('infix:|', 'looser'=>'infix:',    'left'=>1,  'nows'=>1, 'match'=>'PGE::Exp::Alt')

    optable.newtok('close:}', 'looser'=>'infix:|', 'nows'=>1)            # XXX: hack
    optable.newtok('close:]', 'equiv'=>'close:}',  'nows'=>1)            # XXX: hack

    $P0 = get_hll_global ["PGE::P5Regex"], "compile_p5regex"
    compreg "PGE::P5Regex", $P0
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
    if initchar == ')' goto end
    inc pos
    if initchar != "\\" goto term_literal

  term_backslash:
    initchar = substr target, pos, 1
    inc pos
    $I0 = index "nrteab", initchar
    if $I0 < 0 goto term_literal
    initchar = substr "\n\r\t\e\a\b", $I0, 1
    
  term_literal:
    litstart = pos
    litlen = 0
  term_literal_loop:
    if pos >= lastpos goto term_literal_end
    $S0 = substr target, pos, 1
    $I0 = index "[](){}*?+\\|^$.", $S0
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
    mpos = pos
    .return (mob)
  err_range:
    parse_error(mob, pos, "Error in quantified range")
.end


.sub parse_group
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    $P0 = get_hll_global ["PGE::Match"], "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::CGroup")
    pos = mfrom
    inc pos
    $S0 = substr target, pos, 2
    if $S0 == "?:" goto nocapture
    goto end
  nocapture:
    pos += 2
  end:
    mpos = pos
    .return (mob)
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
    parse_error(mob, pos, "No closing ']' for enumerated character list")
.end
    

.namespace [ "PGE::Exp" ]

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

.namespace [ "PGE::Exp::CGroup" ]

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


