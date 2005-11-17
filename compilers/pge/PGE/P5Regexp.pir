.include "cclass.pasm"

.const int PGE_INF = 2147483647

.namespace [ "PGE::P5Regexp" ]

.sub "__onload" :load
    .local pmc optable

    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    store_global "PGE::P5Regexp", "$optable", optable

    $P0 = find_global "PGE::P5Regexp", "parse_lit"
    optable.addtok("term:", "", "nows", $P0)
    optable.addtok("term:\\b", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:\\B", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:^", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:$", "term:", "nows", "PGE::Exp::Anchor")

    optable.addtok("term:\\d", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\D", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\s", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\S", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\w", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\W", "term:", "nows", "PGE::Exp::CCShortcut")

    $P0 = find_global "PGE::P5Regexp", "parse_group"
    optable.addtok("circumfix:( )", "term:", "nows", $P0)

    $P0 = find_global "PGE::P5Regexp", "parse_enumclass"
    optable.addtok("term:[", "", "nows", $P0)
    optable.addtok("term:.", "", "nows", $P0)

    $P0 = find_global "PGE::P5Regexp", "parse_quant"
    optable.addtok("postfix:*", "<term:", "left,nows", $P0)
    optable.addtok("postfix:+", "postfix:*", "left,nows", $P0)
    optable.addtok("postfix:?", "postfix:*", "left,nows", $P0)
    optable.addtok("postfix:{", "postfix:*", "left,nows", $P0)

    optable.addtok("infix:", "<postfix:*", "right,nows", "PGE::Exp::Concat")
    optable.addtok("infix:|", "<infix:", "left,nows", "PGE::Exp::Alt")

    optable.addtok("close:}", "<infix:|", "nows")            # XXX: hack
    optable.addtok("close:]", "close:}", "nows")             # XXX: hack

    $P0 = find_global "PGE", "_compile_p5regexp"
    compreg "PGE::P5Regexp", $P0
.end


.sub "parse_lit"
    .param pmc mob
    .local pmc newfrom
    .local string target
    .local int pos, lastpos
    .local int litstart, litlen
    .local string initchar
    newfrom = find_global "PGE::Match", "newfrom"
    $P0 = getattribute mob, "PGE::Match\x0$:target"
    target = $P0
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    pos = $P0
    lastpos = length target
    initchar = substr target, pos, 1
    inc pos
    if initchar != "\\" goto term_literal

  term_backslash:
    initchar = substr target, pos, 1
    inc pos
    $I0 = index "nrteab", initchar
    if $I0 < 0 goto term_literal
    initchar = substr "\n\r\t\e\a\b", $I0, 1
    
  term_literal:
    mob = newfrom(mob, 0, "PGE::Exp::Literal")
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
    mob["value"] = $S0
    goto end
  end:
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    $P0 = pos
    .return (mob)
.end

.sub "parse_quant"
    .param pmc mob
    .local string target
    .local int min, max, islazy
    .local int pos, lastpos
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Quant")
    pos = mfrom
    lastpos = length target
    min = 0
    max = PGE_INF
    islazy = 0
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == "{" goto quant_range
    if $S0 != "+" goto quant_max
    min = 1
  quant_max:
    if $S0 != "?" goto quant_lazy
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
    islazy = 1
    inc pos
  end:
    mob["min"] = min
    mob["max"] = max
    mob["islazy"] = islazy
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
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Group")
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
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::EnumCharList")
    pos = mfrom
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == "." goto dot
    lastpos = length target
    charlist = ""
    mob["isnegated"] = 0
    isrange = 0
    $S0 = substr target, pos, 1
    if $S0 != "^" goto scan
    mob["isnegated"] = 1
    inc pos
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
    if charlist == "" goto addchar
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
    mob["value"] = charlist
    .return (mob)
    
  err_close:
    parse_error(mob, pos, "No closing ']' for enumerated character list")
.end
    

.namespace [ "PGE::Rule" ]

.sub "p5regexp"
    .param pmc mob
    .local pmc optable
    optable = find_global "PGE::P5Regexp", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end

.namespace [ "PGE" ]

.sub "_compile_p5regexp"
    .param string pattern
    .param string grammar      :optional
    .param int has_gram        :opt_flag
    .param string name         :optional
    .param int has_name        :opt_flag

    .local pmc exp
    .local pmc newfrom
    .local pmc code
    .local pmc sub
    .local pmc pad

    if has_name goto p5regexp_1
    name = "_pge_rule"
    if has_gram goto p5regexp_1
    grammar = "PGE::Rule"
  p5regexp_1:
    newfrom = find_global "PGE::Match", "newfrom"
    (exp, $P99, $P99, $P0) = newfrom(pattern, 0, "PGE::Exp")
    $P0 = 0

    $P0 = find_global "PGE::Rule", "p5regexp"
    exp = $P0(exp)

    pad = new Hash
    pad["subpats"] = 0
    $P0 = exp["expr"]
    $P0 = $P0."p5analyze"(pad)
    exp["expr"] = $P0

    $P0 = new String
    $P0 = "\n.namespace [ \""
    $P0 .= grammar
    $P0 .= "\" ]\n\n"
    code = exp."as_pir"(name)
    code = concat $P0, code

    $P0 = compreg "PIR"
    sub = $P0(code)
    if has_name == 0 goto end
    $I0 = find_type grammar
    if $I0 > 0 goto end
    $P0 = getclass "PGE::Rule"
    $P1 = subclass $P0, grammar
  end:
    .return (sub, code, exp)
.end

.namespace [ "PGE::Exp" ]

.sub "p5analyze" :method
    .param pmc pad
    .local pmc exp
    $I0 = 0
  loop:
    $I1 = defined self[$I0]
    if $I1 == 0 goto value
    $P0 = self[$I0]
    $P0 = $P0."p5analyze"(pad)
    self[$I0] = $P0
    inc $I0
    goto loop
  value:
    $I0 = defined self["value"]
    if $I0 goto end
    $S0 = self
    self["value"] = $S0
  end:
    .return (self)
.end

.namespace [ "PGE::Exp::Group" ]

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


