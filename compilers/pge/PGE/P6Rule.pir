.include "cclass.pasm"

.namespace [ "PGE::P6Rule" ]

.sub "__onload" :load
    .local pmc optable
    $I0 = find_type "PGE::Exp::WS"
    if $I0 goto end
    $P0 = getclass "PGE::Exp::Subrule"
    $P1 = subclass $P0, "PGE::Exp::WS"
    $P0 = getclass "PGE::Exp"
    $P1 = subclass $P0, "PGE::Exp::Alias"

    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    store_global "PGE::P6Rule", "$optable", optable

    $P0 = find_global "PGE::P6Rule", "parse_ws_lit"
    optable.addtok("term:", "", "nows", $P0)
    optable.addtok("term:::", "term:", "nows", "PGE::Exp::Cut")
    optable.addtok("term::::", "term:", "nows", "PGE::Exp::Cut")
    optable.addtok("term:\\b", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:\\B", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:^", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:^^", "term:", "nows", "PGE::Exp::Anchor")
    optable.addtok("term:$$", "term:", "nows", "PGE::Exp::Anchor")

    $P0 = find_global "PGE::P6Rule", "parse_dollar"
    optable.addtok("term:$", "term:", "nows", $P0)

    optable.addtok("term:.", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\d", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\D", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\s", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\S", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\w", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\W", "term:", "nows", "PGE::Exp::CCShortcut")
    optable.addtok("term:\\n", "term:", "nows", "PGE::Exp::CCShortcut")

    optable.addtok("circumfix:[ ]", "term:", "nows", "PGE::Exp::Group")
    optable.addtok("circumfix:( )", "term:", "nows", "PGE::Exp::Group")

    optable.addtok("<commit>", "term:", "nows", "PGE::Exp::Commit")

    $P0 = find_global "PGE::P6Rule", "parse_subrule"
    optable.addtok("term:<", "term:", "nows", $P0)
    optable.addtok("term:<?", "term:", "nows", $P0)

    $P0 = find_global "PGE::P6Rule", "parse_enumclass"
    optable.addtok("term:<[", "term:", "nows", $P0)
    optable.addtok("term:<-[", "term:", "nows", $P0)
    optable.addtok("term:<+[", "term:", "nows", $P0)

    $P0 = find_global "PGE::P6Rule", "parse_closure"
    optable.addtok("term:{{", "term:", "nows", $P0)

    $P0 = find_global "PGE::P6Rule", "parse_quant"
    optable.addtok("postfix:*", "<term:", "left", $P0)
    optable.addtok("postfix:+", "postfix:*", "left", $P0)
    optable.addtok("postfix:?", "postfix:*", "left", $P0)
    optable.addtok("postfix::", "postfix:*", "left", "PGE::Exp::Cut")
    $P0 = find_global "PGE::Rule", "fail"
    optable.addtok("postfix:::", "postfix:*", "left", $P0)

    optable.addtok("infix:", "<postfix:*", "right,nows", "PGE::Exp::Concat")
    optable.addtok("infix:&", "<infix:", "left,nows", "PGE::Exp::Conj")
    optable.addtok("infix:|", "<infix:&", "left,nows", "PGE::Exp::Alt")

    optable.addtok("infix::=", ">postfix:*", "right", "PGE::Exp::Alias")

    $P0 = find_global "PGE::P6Rule", "parse_modifier"
    optable.addtok("prefix::", "<infix:|", "nows", $P0)

    optable.addtok("close:>", "<prefix::", "nows")

    $P0 = new Hash
    store_global "PGE::P6Rule", "%escape", $P0
    $P0["e"] = "\e"
    $P0["f"] = "\f"
    $P0["r"] = "\r"
    $P0["t"] = "\t"
    $P0["v"] = unicode:"\x0a\x0b\x0c\x0d\x85\u2028\u2029"
    $P0["h"] = unicode:"\x09\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000"
    $P0["n"] = unicode:"\x0a\x0d\x0c\x85\u2028\u2029"
    # See http://www.unicode.org/Public/UNIDATA/PropList.txt for above

    $P0 = find_global "PGE", "p6rule"
    compreg "PGE::P6Rule", $P0
  end:
.end


.sub "parse_ws_lit"
    .param pmc mob
    .local pmc newfrom
    .local string target
    .local int pos, lastpos
    .local int litstart, litlen
    .local string initchar
    .local int base, isnegated
    newfrom = find_global "PGE::Match", "newfrom"
    $P0 = getattribute mob, "PGE::Match\x0$:target"
    target = $P0
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    pos = $P0
    lastpos = length target

    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    if $I0 goto term_ws
    initchar = substr target, pos, 1
    inc pos
    if initchar == "#" goto term_ws
    if initchar != "\\" goto term_literal

  term_backslash:
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 goto err_backslash_digit
    initchar = substr target, pos, 1
    isnegated = is_cclass .CCLASS_UPPERCASE, target, pos 
    inc pos
    $S0 = downcase initchar
    if $S0 == 'x' goto term_backslash_x            # \x.. \X..
    if $S0 == 'o' goto term_backslash_o            # \o.. \O..
    $P0 = find_global "PGE::P6Rule", "%escape"
    $I0 = exists $P0[$S0]                          # \e\f\r\t\v\h
    if $I0 == 0 goto term_literal
    initchar = $P0[$S0]
    if isnegated goto term_charlist                # negated \E\F\R\T\V\H
    $I0 = length initchar
    if $I0 < 2 goto term_literal
  term_charlist:
    mob = newfrom(mob, 0, "PGE::Exp::EnumCharList")
    mob["value"] = initchar
    mob["isnegated"] = isnegated
    goto end

  term_backslash_o:
    base = 8
    goto term_bx0
  term_backslash_x:
    base = 16
  term_bx0:
    $I0 = 0
    $S0 = substr target, pos, 1
    $I2 = index "[{(<", $S0
    if $I2 < 0 goto term_bx1
    $S2 = substr "]})>", $I0
    inc pos
  term_bx1:
    $S0 = substr target, pos, 1
    downcase $S0
    $I1 = index "0123456789abcdef", $S0
    if $I1 < 0 goto term_bx2
    if $I1 >= base goto term_bx2
    $I0 *= base
    $I0 += $I1
    inc pos
    goto term_bx1
  term_bx2:
    initchar = chr $I0
    if $I2 < 0 goto term_bx3
    $S0 = substr target, pos, 1
    if $S0 != $S2 goto err_close
    inc pos
  term_bx3:
    if isnegated goto term_charlist                # \X[...], \000
    # goto term_literal                            # \x[...], \000

  term_literal:                                    # first char is in initchar
    mob = newfrom(mob, 0, "PGE::Exp::Literal")
    litstart = pos
    litlen = 0
  term_literal_loop:
    if pos >= lastpos goto term_literal_end
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    if $I0 goto term_literal_end
    $S0 = substr target, pos, 1
    $I0 = index "<>[](){}:*?+\\|&#^$.", $S0
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

  term_ws:
    mob = newfrom(mob, 0, "PGE::Exp::WS")
  term_ws_1:
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $S0 = substr target, pos, 1
    if $S0 != "#" goto end
    $I0 = index target, "\n", pos
    pos = $I0 + 1
    if pos > 0 goto term_ws_1
    pos = lastpos
  end:
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    $P0 = pos
    .return (mob)

  err_backslash_digit:
    parse_error(mob, pos, "\\1 and \\012 illegal, use $1, \\o012, or \\x0a")
    goto end
  err_nodigits:
    parse_error(mob, pos, "No digits found in \\x...")
    goto end
  err_close:
    parse_error(mob, pos, "Missing close bracket for \\x...")
    goto end
.end

.sub "parse_modifier"
    .param pmc mob
    .local int pos, lastpos
    .local string target, value
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Modifier")
    pos = mfrom
    lastpos = length target
    value = "1"
    inc pos
    $I0 = pos
    pos = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if pos == $I0 goto name
    $I1 = pos - $I0
    value = substr target, $I0, $I1
    $I0 = pos
  name:
    pos = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    $I1 = pos - $I0
    $S0 = substr target, $I0, $I1
    $S0 = concat ":", $S0
    mob["mname"] = $S0
    mob["value"] = value
    $S0 = substr target, pos, 1
    if $S0 != "(" goto end
    $I0 = pos + 1
    pos = index target, ")", pos
    $I1 = pos - $I0
    $S0 = substr target, $I0, $I1
    mob["value"] = $S0
    inc pos
  end:
    mpos = pos
    .return (mob)
.end


.sub "parse_closure"
    .param pmc mob
    .local pmc newfrom
    .local string target
    .local pmc mfrom, mpos
    .local int pos, len
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Closure")
    pos = mfrom
    len = 0
  init:
    $S0 = substr target, pos, 1
    if $S0 != "{" goto body
    inc len
    inc pos
    goto init
  body:
    $S0 = repeat "}", len
    $I0 = index target, $S0, pos
    if $I0 < pos goto err_noclose
    $I1 = $I0 - pos
    $S1 = substr target, pos, $I1
    mob["value"] = $S1
    pos = $I0 + len
    mpos = pos
    .return (mob)
 err_noclose:
    parse_error(mob, pos, "Missing closing braces for closure")
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
    min = 1
    max = 1
    islazy = 0
    $S0 = substr target, pos, 2
    if $S0 == "**" goto quant_closure
    $S0 = substr target, pos, 1
    if $S0 == "+" goto quant_max
    min = 0
  quant_max:
    if $S0 == "?" goto quant_lazy
    max = PGE_INF
    goto quant_lazy
  quant_lazy:
    inc pos
    $I0 = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $S0 = substr target, $I0, 1
    if $S0 != "?" goto end
    islazy = 1
    pos = $I0 + 1
    goto end
  quant_closure:
    pos += 2
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    $S0 = substr target, pos, 1
    if $S0 != "{" goto err_closure
    inc pos
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto err_closure
    $S0 = substr target, pos
    min = $S0
    max = $S0
    pos = $I1
    $S0 = substr target, pos, 2
    if $S0 != '..' goto quant_closure_end
    pos += 2
    max = PGE_INF
    $S0 = substr target, pos, 1
    if $S0 == '.' goto quant_closure_end
    $I1 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I1 <= pos goto err_closure
    $S0 = substr target, pos
    max = $S0
    pos = $I1
  quant_closure_end:
    $S0 = substr target, pos, 1
    if $S0 != "}" goto err_closure
    inc pos
  end:
    mob["min"] = min
    mob["max"] = max
    mob["islazy"] = islazy
    mpos = pos
    .return (mob)
  err_closure:
    parse_error(mob, pos, "Error in closure quantifier")
.end

.sub "parse_subrule"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    .local int iscapture
    .local string subname
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob, 0, "PGE::Exp::Subrule")
    pos = mfrom 
    lastpos = length target
    $S0 = substr target, pos, 2
    if $S0 == "<?" goto nocapture
    if $S0 == "<!" goto negated
    iscapture = 1
    inc pos
    goto subrule_name
  negated:
    mob["isnegated"] = 1
  nocapture:
    iscapture = 0
    pos += 2
  subrule_name:
    $I0 = pos
  subrule_name_1:
    pos = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    $S0 = substr target, pos, 2
    if $S0 != "::" goto subrule_name_2
    pos += 2
    goto subrule_name_1
  subrule_name_2:
    $I1 = pos - $I0
    subname = substr target, $I0, $I1
    $S0 = substr target, pos, 2
    if $S0 == ": " goto subrule_text
    $S0 = substr target, pos, 1
    if $S0 != " " goto subrule_end
    inc pos
    mpos = pos
    $P0 = find_global "PGE::Rule", "p6rule"
    $P1 = $P0(mob)
    unless $P1 goto end
    $S0 = $P1
    mob["arg"] = $S0
    pos = $P1.to()
    mpos = -1
    $S0 = substr target, pos, 1
    goto subrule_end
  subrule_text:
    pos += 2
    $I0 = index target, ">", pos
    if $I0 < 0 goto end
    $I0 -= pos
    $S0 = substr target, pos, $I0
    mob["arg"] = $S0
    pos += $I0
    $S0 = substr target, pos, 1
  subrule_end:
    if $S0 != ">" goto end
    inc pos
    mpos = pos
    mob["subname"] = subname
    mob["iscapture"] = iscapture
    if iscapture == 0 goto end
    $S0 = escape subname
    $S0 = concat '"', $S0
    $S0 = concat $S0, '"'
    mob["cname"] = $S0
  end:
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
    lastpos = length target
    charlist = ""
    mob["isnegated"] = 0
    pos = mfrom
    isrange = 0
    $S0 = substr target, pos, 3
    pos += 2
    if $S0 != "<-[" goto scan
    mob["isnegated"] = 1
    inc pos
  scan:
    if pos >= lastpos goto err_close
    $S0 = substr target, pos, 1
    if $S0 == "]" goto endclass
    if $S0 == "-" goto err_hyphen
    if $S0 == "." goto dotrange
    if $S0 != "\\" goto addchar
  backslash:
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index "nrtfae0", $S0
    if $I0 == -1 goto addchar
    $S0 = substr "\n\r\t\f\a\e\0", $I0, 1
  addchar:
    inc pos
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
  dotrange:
    if isrange goto addrange
    $S1 = substr target, pos, 2
    if $S1 != ".." goto addchar
    pos += 2
    isrange = 1
    goto scan
  endclass:
    $S0 = substr target, pos, 2
    if $S0 != "]>" goto err_bracket
    pos += 2
    mpos = pos
    mob["value"] = charlist
    goto end
  err_bracket:
    parse_error(mob, pos, "Unescaped ']' in charlist")
    goto end
  err_hyphen:
    parse_error(mob, pos, "Unescaped '-' in charlist (use '..' or '\-')")
    goto end
  err_close:
    parse_error(mob, pos, "No closing ']>' for charlist")
  end:
    .return (mob)
.end

.sub "parse_dollar"
    .param pmc mob
    .local string target
    .local int pos, lastpos
    .local pmc newfrom, mfrom, mpos
    .local string cname
    newfrom = find_global "PGE::Match", "newfrom"
    $P0 = getattribute mob, "PGE::Match\x0$:target"
    target = $P0
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    pos = $P0
    lastpos = length target
    inc pos
    $S0 = substr target, pos, 1
    if $S0 == '<' goto name
    $I0 = find_not_cclass .CCLASS_NUMERIC, target, pos, lastpos
    if $I0 > pos goto numeric
  eos_anchor:
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, "PGE::Exp::Anchor")
    mob["value"] = "$"
    goto end
  numeric:
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, "PGE::Exp::Scalar")
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    mob["cname"] = cname
    pos = $I0
    goto end
  name:
    inc pos
    (mob, $P0, mfrom, mpos) = newfrom(mob, 0, "PGE::Exp::Scalar")
    $I0 = index target, ">", pos
    if $I0 < pos goto err_close
  name_1:
    $I1 = $I0 - pos
    cname = substr target, pos, $I1
    cname = escape cname
    cname = concat '"', cname
    cname = concat cname, '"'
    mob["cname"] = cname
    pos = $I0 + 1
    goto end
  err_close:
    parse_error(mob, pos, "Missing close '>' in scalar")
  end:
    mpos = pos
    .return (mob)
.end
    
.sub "parse_error"
    .param pmc mob
    .param int pos
    .param string message
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    $P0 = pos
    $P0 = new Exception
    $S0 = "p6rule parse error: "
    $S0 .= message
    $P0["_message"] = $S0
    throw $P0
    .return ()
.end

.namespace [ "PGE::Rule" ]

.sub "p6rule"
    .param pmc mob
    .local pmc optable
    optable = find_global "PGE::P6Rule", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end

.namespace [ "PGE" ]

.sub "p6rule"
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

    if has_name goto p6rule_1
    name = "_pge_rule"
    if has_gram goto p6rule_1
    grammar = "PGE::Rule"
  p6rule_1:
    newfrom = find_global "PGE::Match", "newfrom"
    (exp, $P99, $P99, $P0) = newfrom(pattern, 0, "PGE::Exp")
    $P0 = 0

    $P0 = find_global "PGE::Rule", "p6rule"
    exp = $P0(exp)
    pad = new Hash
    $P0 = new Hash
    pad["reps"] = $P0
    pad["cutnum"] = PGE_CUT_GROUP
    pad["subpats"] = 0
    pad[":lang"] = "PIR"
    $P0 = exp["expr"]
    $P0 = $P0.p6analyze(pad)
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

.sub "p6analyze" :method
    .param pmc pad
    $I0 = defined self["value"]
    if $I0 goto end
    $S0 = self
    self["value"] = $S0
  end:
    .return (self)
.end

.namespace [ "PGE::Exp::Literal" ]

.sub "p6analyze" :method
    .param pmc pad
    $I0 = pad[":i"]
    self["ignorecase"] = $I0
    .return (self)
.end

.namespace [ "PGE::Exp::Cut" ]

.sub "p6analyze" :method
    .param pmc pad
    .local string token
    token = self
    if token == ":" goto cutatom
    $I0 = PGE_CUT_RULE
    if token == ":::" goto cut_1
    $I0 = pad["cutnum"]
  cut_1:
    self["cutnum"] = $I0
    .return (self)
  cutatom:
    $P0 = self[0]
    $P0 = $P0.reduce(pad)
    $P0["iscut"] = 1
    $P0["isquant"] = 1
    .return ($P0)
.end

.namespace [ "PGE::Exp::Concat" ]

.sub "p6analyze" :method
    .param pmc pad
    .local pmc exp0, exp1
    exp0 = self[0]
    exp0 = exp0.p6analyze(pad)
    exp1 = self[1]
    exp1 = exp1.p6analyze(pad)
    unless_null exp0, exp1null
    .return (exp1)
  exp1null:
    self[0] = exp0
    unless_null exp1, end
    .return (exp0)
  end:
    self[1] = exp1
    .return (self)
.end

.namespace [ "PGE::Exp::Alt" ]

.sub "p6analyze" :method
    .param pmc pad
    .local pmc reps, savereps
    .local pmc exp0, exp1

    reps = pad["reps"]
    savereps = new Hash
    $P0 = new Iterator, reps
  reps_1:
    unless $P0 goto reps_2
    $P1 = shift $P0
    $P2 = reps[$P1]
    savereps[$P1] = $P2
    goto reps_1
  reps_2:
    $I0 = pad["subpats"]
    exp0 = self[0]
    exp0 = exp0.p6analyze(pad)
    self[0] = exp0

    $I1 = pad["subpats"]
    pad["subpats"] = $I0
    pad["reps"] = savereps
    exp1 = self[1]
    exp1 = exp1.p6analyze(pad)
    self[1] = exp1
    $I0 = pad["subpats"]
    if $I0 >= $I1 goto end
    pad["subpats"] = $I1
  end:
    .return (self)
.end

.namespace [ "PGE::Exp::Conj" ]

.sub "p6analyze" :method
    .param pmc pad
    $P0 = self[0]
    $P0 = $P0.p6analyze(pad)
    self[0] = $P0
    $P1 = self[1]
    $P1 = $P1.p6analyze(pad)
    self[1] = $P1
    .return (self)
.end
    
    
.namespace [ "PGE::Exp::Quant" ]

.sub "p6analyze" :method
    .param pmc pad
    .local pmc exp
    .local int padarray
    padarray = pad["isarray"]
    pad["isarray"] = 1
    exp = self[0]
    exp = exp.p6analyze(pad)
    self[0] = exp
    pad["isarray"] = padarray
    .return (self)
.end
    
.namespace [ "PGE::Exp::Group" ] 

.sub "p6analyze" :method
    .param pmc pad
    .local pmc reps, exp
    .local string cname
    .local int cutnum, padarray, isarray, subpats

    cutnum = pad["cutnum"]
    ($S0, $I0) = self.serno()
    pad["cutnum"] = $I0
    self["cutnum"] = $I0

    if self != "(" goto init
    self["iscapture"] = 1
    self["isscope"] = 1

  init:
    $I0 = self["iscapture"]
    if $I0 == 0 goto unscoped

  capture:
    $I0 = exists self["cname"]
    if $I0 goto setsubpats
    $I0 = pad["subpats"]
    self["cname"] = $I0
    
  setsubpats:
    cname = self["cname"]
    $S0 = substr cname, 0, 1
    if $S0 == '"' goto setreps
    $I0 = cname
    inc $I0
    pad["subpats"] = $I0

  setreps:
    isarray = 0
    reps = pad["reps"]
    $I0 = exists reps[cname]
    if $I0 == 0 goto setreps_1
    $P0 = reps[cname]
    $P0["isarray"] = 1
    isarray = 1
  setreps_1:
    reps[cname] = self

    padarray = pad["isarray"]
    isarray |= padarray
    self["isarray"] = isarray
    $I0 = self["isscope"]
    if $I0 == 0 goto unscoped

  scoped:
    subpats = pad["subpats"]
    pad["subpats"] = 0
    pad["isarray"] = 0
    $P0 = new Hash
    pad["reps"] = $P0
    exp = self[0]
    exp = exp.p6analyze(pad)
    self[0] = exp
    pad["reps"] = reps
    pad["subpats"] = subpats
    pad["isarray"] = padarray
    pad["cutnum"] = cutnum
    goto end
  unscoped:
    exp = self[0]
    exp = exp.p6analyze(pad)
    self[0] = exp
    pad["cutnum"] = cutnum
  end:
    .return (self)
.end

.namespace [ "PGE::Exp::Subrule" ]

.sub "p6analyze" :method
    .param pmc pad
    .local int isarray, iscapture
    .local string cname
    .local pmc reps

    iscapture = self["iscapture"]
    if iscapture == 0 goto end
    cname = self["cname"]
    isarray = pad["isarray"]
    reps = pad["reps"]
    $I0 = exists reps[cname]
    if $I0 == 0 goto reps_1
    $P0 = reps[cname]
    $P0["isarray"] = 1
    isarray = 1
  reps_1:
    reps[cname] = self
    self["isarray"] = isarray
  
  next_cname:
    $S0 = substr cname, 0, 1
    if $S0 == '"' goto end
    $I0 = cname
    inc $I0
    pad["subpats"] = $I0

  end:
    .return (self)
.end

.namespace [ "PGE::Exp::WS" ]

.sub "p6analyze" :method
    .param pmc pad
    $I0 = pad[":w"]
    if $I0 goto ws
    null $P0
    .return ($P0)
  ws:
    self["subname"] = "ws"
    self["iscapture"] = 0
    .return (self)
.end

.namespace [ "PGE::Exp::Modifier" ]

.sub "p6analyze" :method
    .param pmc pad
    .local string mname
    .local pmc value
    .local pmc exp
    mname = self["mname"]
    value = self["value"]
    if mname == ":words" goto words
    if mname == ":ignorecase" goto ignorecase
    goto setpad
  words:
    mname = ":w"
    goto setpad
  ignorecase:
    mname = ":i"
  setpad:
    $P0 = pad[mname]
    pad[mname] = value
    exp = self[0]
    exp = exp.p6analyze(pad)
    self[0] = exp
    pad[mname] = $P0
    .return (exp)
.end


.namespace [ "PGE::Exp::Alias" ]

.sub "p6analyze" :method
    .param pmc pad
    .local string cname
    .local pmc exp0, exp1

    exp0 = self[0]
    cname = exp0["cname"]
    exp1 = self[1]
    exp1["cname"] = cname
    exp1["iscapture"] = 1
    exp1 = exp1.p6analyze(pad)
    .return (exp1)
.end

.namespace [ "PGE::Exp::Closure" ]

.sub "p6analyze" :method
    .param pmc pad
    $S0 = pad[":lang"]
    self["lang"] = $S0
    if $S0 != "PIR" goto end
    $S1 = self["value"]
    $I0 = index $S1, ".sub"
    if $I0 >= 0 goto end
    $S1 = concat ".sub anon :anon\n.param pmc match\n", $S1
    $S1 .= "\n.end\n"
    self["value"] = $S1
  end:
    .return (self)
.end
