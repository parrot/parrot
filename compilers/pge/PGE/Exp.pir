.namespace [ "PGE::Exp" ]

.include "interpinfo.pasm"
.include "cclass.pasm"
.const int PGE_INF = 2147483647
.const int PGE_CUT_GROUP = -1
.const int PGE_CUT_RULE = -2

.sub "__onload"
    .local pmc optable
    .local pmc term

    $P0 = getclass "PGE::Match"
    $P0 = subclass $P0, "PGE::Exp"
    $P1 = subclass $P0, "PGE::Exp::Literal"
    $P1 = subclass $P0, "PGE::Exp::Scalar"
    $P1 = subclass $P0, "PGE::Exp::CCShortcut"
    $P1 = subclass $P0, "PGE::Exp::EnumCharList"
    $P1 = subclass $P0, "PGE::Exp::Anchor"
    $P1 = subclass $P0, "PGE::Exp::Concat"
    $P1 = subclass $P0, "PGE::Exp::Conj"
    $P1 = subclass $P0, "PGE::Exp::Alt"
    $P1 = subclass $P0, "PGE::Exp::Group"
    $P1 = subclass $P0, "PGE::Exp::Subrule"
    $P1 = subclass $P0, "PGE::Exp::Cut"
    $P1 = subclass $P0, "PGE::Exp::Quant"
    $P1 = subclass $P0, "PGE::Exp::Modifier"
    $P0 = new Integer
    store_global "PGE::Exp", "$_serno", $P0
.end


#### Code Generation ####

.namespace [ "PGE::Exp" ]

=item C<(STR, INT) = serno([STR prefix [, INT start]])>

This method simply returns integers and labels usable for
serialization, e.g., for generating unique labels and identifiers
within generated code.  The C<start> parameter allows the serial
number to be set to a given value.  XXX: I'm assuming overflow
won't be a problem, but is the use of the start parameter thread-safe?

=cut

.sub "serno" :method
    .param string prefix       :optional
    .param int has_prefix      :opt_flag
    .param int start           :optional
    .param int has_start       :opt_flag

    if has_prefix goto serno_1
    prefix = "R"
  serno_1:
    $P0 = find_global "PGE::Exp", "$_serno"
    inc $P0
    unless has_start goto serno_2
    $P0 = start
  serno_2:
    $I0 = $P0
    $S0 = $I0
    concat prefix, $S0
    .return (prefix, $I0)
.end

.sub "emit"
    .param pmc code                                # string to append to
    .param string fmt                              # string to output
    .param pmc args            :slurpy             # slurpy args

    $I0 = length fmt
    if $I0 < 2 goto emit_1
    $S0 = substr fmt, -2, 2
    if $S0 != "##" goto emit_1
    $S0 = code
    $S0 = clone $S0
    $S0 .= fmt
    $P0 = split "\n", $S0
    $I0 = $P0
    $S1 = $I0
    fmt .= " "
    fmt .= $S1
  emit_1:
    fmt .= "\n"
  emit_2:
    $I0 = index fmt, "%s"
    if $I0 < 0 goto end
    $S0 = shift args
    substr fmt, $I0, 2, $S0
    goto emit_2
  end:
    code .= fmt
.end

.sub "emitsub" :method
    .param pmc code                                # append to code
    .param string next                             # where to bsr
    .param pmc save            :slurpy             # things to save
    .local pmc emit
    .local int nocut 
    .local int savec

    emit = find_global "PGE::Exp", "emit"
    nocut = 0
    $S0 = save[-1]
    if $S0 != "NOCUT" goto saveregs
    nocut = 1
    $S0 = pop save
  saveregs:
    savec = elements save
    $I0 = 0
  saveregs_1:
    if $I0 >= savec goto emitsub_1
    $S0 = save[$I0]
    emit(code, "    save %s", $S0)
    inc $I0
    goto saveregs_1
  emitsub_1:
    emit(code, "    bsr %s", next)
    $I0 = savec - 1
  restoreregs_1:
    if $I0 < 0 goto gencut
    $S0 = save[$I0]
    emit(code, "    restore %s", $S0)
    dec $I0
    goto restoreregs_1
  gencut:
    if nocut goto end
    emit(code, "    if cutting != 0 goto fail")
  end:
.end

.sub "quant" :method
    .local int min, max, islazy, iscut
    .local string qstr
    min = 1
    max = 1
    islazy = 0
    iscut = 0
    $I0 = exists self["min"]
    if $I0 == 0 goto quant_1
    min = self["min"]
    max = self["max"]
    islazy = self["islazy"]
    iscut = self["iscut"]
  quant_1:
    qstr = "{"
    $S0 = min
    concat qstr, $S0
    concat qstr, ".."
    $S0 = max
    concat qstr, $S0
    concat qstr, "}"
    if islazy == 0 goto end
    concat qstr, "?"
  end:
    .return (min, max, islazy, iscut, qstr)
.end

=item C<genliteral(PMC code, STR label, STR next)>

Generate code to match literal strings, quantified as necessary.
There are several types of rule expressions that result matching
literal strings, thus we write the code once here rather than
duplicate it in each expression.  This code assumes that the
literal to be matched has already been placed in the C<str> string
register.

=cut

.sub "genliteral" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int min, max, islazy, iscut, ignorecase
    (min, max, islazy, iscut, $S0) = self."quant"()
    ignorecase = self["ignorecase"]
    emit = find_global "PGE::Exp", "emit"
    emit(code, "    litlen = length lit")
    unless min == 1 goto quant
    unless max == 1 goto quant
    emit(code, "    $S0 = substr target, pos, litlen")
    if ignorecase == 0 goto init_1
    emit(code, "    downcase $S0")
  init_1:
    emit(code, "    if $S0 != lit goto fail")
    emit(code, "    pos += litlen")
    emit(code, "    goto %s", next)
    .return()
  quant:
    emit(code, "    rep = 0")
    if islazy goto lazy
  greedy:
    emit(code, "  %s_lit1:", label)
    if max == PGE_INF goto greedy_1
    emit(code, "    if rep >= %s goto %s_lit2", max, label)
  greedy_1:
    emit(code, "    $S0 = substr target, pos, litlen")
    emit(code, "    if $S0 != lit goto %s_lit2", label)
    emit(code, "    inc rep")
    emit(code, "    pos += litlen")
    emit(code, "    goto %s_lit1", label)
    emit(code, "  %s_lit2:", label)
    emit(code, "    if rep < %s goto fail", min)
    if iscut goto greedy_cut
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep", "litlen")
    emit(code, "    dec rep")
    emit(code, "    pos -= litlen")
    emit(code, "    goto %s_lit2", label)
    .return ()
  greedy_cut:
    emit(code, "    goto %s", next)
    .return ()
  lazy:
    emit(code, "  %s_lit1:", label)
    if min < 1 goto lazy_1
    emit(code, "    if rep < %s goto %s_lit2", min, label)
  lazy_1:
    if iscut == 0 goto lazy_2
    emit(code, "    goto %s", next)
    goto lazy_4
  lazy_2:
    if max == PGE_INF goto lazy_3
    emit(code, "    if rep >= %s goto %s", max, next)
  lazy_3:
    self.emitsub(code, next, "pos", "rep", "lit", "litlen")
  lazy_4:
    emit(code, "  %s_lit2:", label)
    emit(code, "    $S0 = substr target, pos, litlen")
    emit(code, "    if $S0 != lit goto fail")
    emit(code, "    inc rep")
    emit(code, "    pos += litlen")
    emit(code, "    goto %s_lit1", label)
    .return ()
.end

.sub "gencapture" :method
    .param pmc code
    .param string label
    .local string cname, captsave, captback
    .local int iscapture, isarray
    .local pmc emit
    emit = find_global "PGE::Exp", "emit"
    iscapture = self["iscapture"]
    isarray = self["isarray"]
    cname = self["cname"]
    captsave = ""
    captback = ""
    if iscapture == 0 goto end
    captsave = "    captscope[%s] = $P0"
    captback = "    delete captscope[%s]"
    if isarray == 0 goto end
    captsave = "    $P1 = captscope[%s]\n    push $P1, $P0"
    captback = "    $P1 = captscope[%s]\n    $P1 = pop $P1"
    $I0 = self["isgen"]
    if $I0 goto end
    emit(code, "    $I0 = defined captscope[%s]", cname)
    emit(code, "    if $I0 goto %s_c1", label)
    emit(code, "    $P0 = new PerlArray")
    emit(code, "    captscope[%s] = $P0", cname)
    emit(code, "    save captscope")
    emit(code, "    bsr %s_c1", label)
    emit(code, "    restore captscope")
    emit(code, "    delete captscope[%s]", cname)
    emit(code, "    goto fail")
    emit(code, "  %s_c1:", label)
    self["isgen"] = 1
  end:
    .return (captsave, captback)
.end
 
.sub "reduce" :method
    .local pmc args
    args = getattribute self, "PGE::Match\x0@:capt"
    if_null args, end
    $I0 = elements args
  loop:
    dec $I0
    if $I0 < 0 goto end
    $P0 = args[$I0]
    $P0 = $P0.reduce()
    args[$I0] = $P0
    goto loop
  end:
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    emit = find_global "PGE::Exp", "emit"
    $S0 = classname self
    emit(code, "\n  %s:  # %s", label, $S0)
    .return ()
.end

.sub "as_pir" :method
    .param string label
    .local pmc code
    .local pmc emit
    .local pmc exp0
    .local string exp0label

    code = new String
    exp0 = self["expr"]
    exp0 = exp0.reduce()
    self["expr"] = exp0

    exp0label = "R"
    emit = find_global "PGE::Exp", "emit"
    emit(code, ".sub %s", label)
    emit(code, "    .param pmc mob")
    emit(code, "    .const .Sub corou = \"%s_corou\"", label)
    emit(code, "    $P0 = corou")
    emit(code, "    $P0 = clone $P0")
    emit(code, "    mob = $P0(mob)")
    emit(code, "    .return (mob)")
    emit(code, ".end")
    emit(code, "\n.sub %s_corou :anon", label)
    emit(code, "    .param pmc mob")
    emit(code, "    .local pmc newfrom")
    emit(code, "    .local string target")
    emit(code, "    .local pmc mfrom, mpos")
    emit(code, "    .local int pos, lastpos, rep, maxrep")
    emit(code, "    .local int cutting")
    emit(code, "    .local string lit")
    emit(code, "    .local int litlen")
    emit(code, "    .local pmc gpad, rcache")
    emit(code, "    .local pmc captscope")
    emit(code, "    newfrom = find_global \"PGE::Match\", \"newfrom\"")
    emit(code, "    (mob, target, mfrom, mpos) = newfrom(mob, -1)")
    emit(code, "    $P0 = interpinfo %s", .INTERPINFO_CURRENT_SUB)
    emit(code, "    setattribute mob, \"PGE::Match\\x0&:corou\", $P0")
    emit(code, "    lastpos = length target")
    emit(code, "    gpad = new PerlArray")
    emit(code, "    rcache = new PerlHash")
    emit(code, "    captscope = mob")
    emit(code, "    pos = mfrom")
    emit(code, "    if pos >= 0 goto try_at_pos")
    emit(code, "    pos = 0")
    emit(code, "  try_match:")
    emit(code, "    cutting = 0")
    emit(code, "    if pos > lastpos goto fail_forever")
    emit(code, "    mfrom = pos")
    self.emitsub(code, exp0label, "pos", "NOCUT")
    emit(code, "    if cutting == %s goto fail_forever", PGE_CUT_RULE)
    emit(code, "    inc pos")
    emit(code, "    goto try_match")
    emit(code, "  try_at_pos:")
    emit(code, "    cutting = 0")
    self.emitsub(code, exp0label, "NOCUT")
    emit(code, "  fail_forever:")
    emit(code, "    null $P0")
    emit(code, "    setattribute mob, \"PGE::Match\\x0&:corou\", $P0")
    emit(code, "    mpos = -2")
    emit(code, "    .yield (mob)")
    emit(code, "    goto fail_forever")
    emit(code, "  succeed:")
    emit(code, "    mpos = pos")
    emit(code, "    .yield (mob)")
    emit(code, "    mpos = -1")
    emit(code, "  fail:")
    emit(code, "    ret")

    exp0.gen(code, exp0label, "succeed")

    emit(code, "\n.end")
    .return (code)
.end


.namespace [ "PGE::Exp::Literal" ]

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    ($I0, $I1, $I2, $I3, $S0) = self."quant"()
    $I0 = self["ignorecase"]
    emit = find_global "PGE::Exp", "emit"
    $S1 = self["value"]
    if $I0 == 0 goto init_1
    downcase $S1
  init_1:
    $P0 = find_global "Data::Escape", "String"
    $S1 = $P0($S1, '"')
    emit(code, "\n  %s: # literal %s    ##", label, $S0)
    emit(code, "    lit = \"%s\"", $S1)
    self.genliteral(code, label, next)
    .return ()
.end    

.namespace [ "PGE::Exp::Scalar" ]

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local string cname
    ($I0, $I1, $I2, $I3, $S0) = self."quant"()
    emit = find_global "PGE::Exp", "emit"
    cname = self["cname"]
    emit(code, "\n  %s: # scalar %s %s    ##", label, cname, $S0)
    emit(code, "    $P0 = mob[%s]", cname)
    emit(code, "    $I0 = isa $P0, \"Array\"")
    emit(code, "    if $I0 == 0 goto %s_0", label)
    emit(code, "    $P0 = $P0[-1]")
    emit(code, "  %s_0:", label)
    emit(code, "    lit = $P0")
    self.genliteral(code, label, next)
    .return ()
.end
    

.namespace [ "PGE::Exp::CCShortcut" ]

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local string token
    .local int min, max, islazy, iscut
    .local pmc emit
    .local string find
    token = self["value"]
    (min, max, islazy, iscut, $S0) = self."quant"()
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n %s:  # %s %s", label, token, $S0)
    if token == "." goto dot
    find = "    $I0 = find_not_cclass %s, target, pos, lastpos"
    if token == "\\s" goto space
    if token == "\\d" goto digit
    if token == "\\w" goto word
    if token == "\\n" goto newline
    find = "    $I0 = find_cclass %s, target, pos, lastpos"
    if token == "\\S" goto space
    if token == "\\D" goto digit
    if token == "\\W" goto word
    if token == "\\N" goto newline
  dot:
    emit(code, "    $I0 = lastpos")
    goto char
  space:
    emit(code, find, .CCLASS_WHITESPACE)
    goto char
  digit:
    emit(code, find, .CCLASS_NUMERIC)
    goto char
  word:
    emit(code, find, .CCLASS_WORD)
    goto char
  newline:
    emit(code, find, .CCLASS_NEWLINE)
    goto char
  char:
    emit(code, "    rep = $I0 - pos")
    emit(code, "    if rep < %s goto fail", min)
    if min != max goto char_2
    emit(code, "    pos += %s", min)
    emit(code, "    goto %s", next)
    .return()
  char_2:
    emit(code, "    if rep <= %s goto %s_1", max, label)
    emit(code, "    rep = %s", max)
    emit(code, "  %s_1:", label)
    if islazy goto lazy
  greedy:
    emit(code, "    pos += rep")
    if iscut goto cut
    emit(code, "  %s_2:", label)
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep")
    emit(code, "    dec rep")
    emit(code, "    dec pos")
    emit(code, "    goto %s_2", label)
    .return ()
  lazy:
    emit(code, "    pos += %s", min)
    if iscut goto cut
    emit(code, "    rep -= %s", min)
    emit(code, "  %s_3:", label)
    emit(code, "    if rep == 0 goto %s", next)
    self.emitsub(code, next, "pos", "rep")
    emit(code, "    dec rep")
    emit(code, "    inc pos")
    emit(code, "    goto %s_3", label)
    .return ()
  cut:
    emit(code, "    goto %s", next)
    .return ()
.end

.namespace [ "PGE::Exp::EnumCharList" ]

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local string charlist, charmatch
    .local int min, max, islazy, iscut
    .local pmc emit
    (min, max, islazy, iscut, $S0) = self."quant"()
    emit = find_global "PGE::Exp", "emit"
    $P0 = find_global "Data::Escape", "String"
    charlist = self["charlist"]
    charlist = $P0(charlist, '"')
    charmatch = self["charmatch"]
    emit(code, "\n  %s:  # enumchars %s %s    ##", label, charlist, $S0)
    emit(code, "    rep = 0")
    if islazy goto lazy
    emit(code, "  %s_1:", label)
    emit(code, "    if pos >= lastpos goto %s_2", label)
    emit(code, "    if rep >= %s goto %s_2", max, label)
    emit(code, "    $S0 = substr target, pos, 1")
    emit(code, "    $I0 = index \"%s\", $S0", charlist)
    emit(code, "    %s $I0 == -1 goto %s_2", charmatch, label)
    emit(code, "    inc pos") 
    emit(code, "    inc rep")
    emit(code, "    goto %s_1", label)
    emit(code, "  %s_2:", label)
    emit(code, "    if rep < %s goto fail", min)
    if iscut goto cut
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep")
    emit(code, "    dec pos")
    emit(code, "    dec rep")
    emit(code, "    goto %s_2", label)
    .return ()
  lazy:
    emit(code, "  %s_0:", label)
    emit(code, "    if rep < %s goto %s_1", min, label)
    unless iscut goto lazy_1
    emit(code, "    goto %s", next)
    goto lazy_2
  lazy_1:
    emit(code, "    if rep >= %s goto %s", max, next)
    emit(code, "    if pos > lastpos goto fail")
    self.emitsub(code, next, "pos", "rep")
  lazy_2:
    emit(code, "  %s_1:", label)
    emit(code, "    $S0 = substr target, pos, 1")
    emit(code, "    $I0 = index \"%s\", $S0", charlist)
    emit(code, "    %s $I0 == -1 goto fail", charmatch)
    emit(code, "    inc rep")
    emit(code, "    inc pos")
    emit(code, "    goto %s_0", label)
    .return ()
  cut:
    emit(code, "    goto %s", next)
    .return ()
.end
 

.namespace [ "PGE::Exp::Concat" ]

.sub "reduce" :method
    .local pmc exp0, exp1, exp10

    exp0 = self[0]
    exp0 = exp0.reduce()
    self[0] = exp0
    exp1 = self[1]
    exp1 = exp1.reduce()
    self[1] = exp1

  concat_lit:
    $I0 = exp0["isquant"]
    if $I0 goto concat_lit_end
    $I0 = isa exp0, "PGE::Exp::Literal"
    if $I0 == 0 goto concat_lit_end
    $I0 = exp1["isquant"]
    if $I0 goto concat_lit_end
    $I0 = isa exp1, "PGE::Exp::Literal"
    if $I0 == 0 goto concat_lit_concat
    $S0 = exp0["value"]
    $S1 = exp1["value"]
    concat $S0, $S1
    exp0["value"] = $S0
    .return (exp0)
  concat_lit_concat:
    $I0 = isa exp1, "PGE::Exp::Concat"
    if $I0 == 0 goto concat_lit_end
    exp10 = exp1[0]
    $I0 = exp10["isquant"]
    if $I0 goto concat_lit_end
    $I0 = isa exp10, "PGE::Exp::Literal"
    if $I0 == 0 goto concat_lit_end
    $S0 = exp0["value"]
    $S1 = exp10["value"]
    concat $S0, $S1
    exp0["value"] = $S0
    $P0 = exp1[1]
    self[1] = $P0
  concat_lit_end:
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp0, exp1
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s:    ##", label)
    ($S0, $I0) = self.serno()
    ($S1, $I1) = self.serno()
    exp0 = self[0]
    exp0.gen(code, $S0, $S1)
    exp1 = self[1]
    exp1.gen(code, $S1, next)
    .return ()
.end

.namespace [ "PGE::Exp::Anchor" ]

.sub "gen" :method
    .param pmc code
    .param pmc label
    .param pmc next
    .local pmc emit
    .local pmc token
    token = self["value"]
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s: # anchor %s    ##", label, token)
    if token == "$$" goto eol
    if token == "$" goto eos
    if token == "\\b" goto word
    if token == "\\B" goto word
  bos:
    emit(code, "    if pos == 0 goto %s", next)
    if token != "^^" goto end
  bol:
    emit(code, "    if pos == lastpos goto fail")
    emit(code, "    $I0 = pos - 1")
    emit(code, "    $I1 = is_cclass %s, target, $I0", .CCLASS_NEWLINE)
    emit(code, "    if $I1 goto %s", next)
    goto end
  eol:
    emit(code, "    $I1 = is_cclass %s, target, pos", .CCLASS_NEWLINE)
    emit(code, "    if $I1 goto %s", next)
    emit(code, "    if pos != lastpos goto fail")
    emit(code, "    if pos < 1 goto %s", next)
    emit(code, "    $I0 = pos - 1")
    emit(code, "    $I1 = is_cclass %s, target, $I0", .CCLASS_NEWLINE)
    emit(code, "    if $I1 == 0 goto %s", next)
    goto end
  eos:
    emit(code, "    if pos == lastpos goto %s", next)
    goto end
  word:
    emit(code, "    $I0 = 0")
    emit(code, "    if pos == 0 goto %s_1", label)
    emit(code, "    $I2 = pos - 1")
    emit(code, "    $I0 = is_cclass %s, target, $I2", .CCLASS_WORD)
    emit(code, "  %s_1:", label)
    emit(code, "    $I1 = 0")
    emit(code, "    if pos >= lastpos goto %s_2", label)
    emit(code, "    $I1 = is_cclass %s, target, pos", .CCLASS_WORD)
    emit(code, "  %s_2:", label)
    if token == "\\B" goto word_1
    emit(code, "    if $I0 != $I1 goto %s", next)
    goto end
  word_1:
    emit(code, "    if $I0 == $I1 goto %s", next)
  end:
    emit(code, "    goto fail")
    .return ()
.end


.namespace [ "PGE::Exp::Alt" ]

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp0, exp1
    emit = find_global "PGE::Exp", "emit"
    ($S0, $I0) = self.serno()
    ($S1, $I1) = self.serno()
    emit(code, "\n  %s:  # alt %s, %s    ##", label, $S0, $S1)
    self.emitsub(code, $S0, "pos")
    emit(code, "    goto %s", $S1)
    exp0 = self[0]
    exp0.gen(code, $S0, next)
    exp1 = self[1]
    exp1.gen(code, $S1, next)
    .return ()
.end


.namespace [ "PGE::Exp::Quant" ]

.sub "reduce" :method
    .local pmc exp

    exp = self[0]
    exp = exp.reduce()
    $I0 = exp["isquant"]
    if $I0 == 1 goto noreduce
    exp["isquant"] = 1
    $P0 = self["min"]
    exp["min"] = $P0
    $P0 = self["max"]
    exp["max"] = $P0
    $P0 = self["islazy"]
    exp["islazy"] = $P0
    .return (exp)
  noreduce:
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int min, max, islazy, iscut
    .local int cutnum
    .local string explabel, replabel
    .local pmc exp

    emit = find_global "PGE::Exp", "emit"
    (min, max, islazy, iscut, $S0) = self."quant"()
    ($S0, cutnum) = self."quant"()
    exp = self[0]
    (explabel, $I0) = self."serno"()
    replabel = concat label, "_rep"

    emit(code, "  %s:  # quant %s    ##", label, $S0)
    $I0 = exp["iscapture"]
    if $I0 == 0 goto quant_1
    exp."gencapture"(code, label)
  quant_1:
    emit(code, "    push gpad, 0")
    emit(code, "    bsr %s", replabel)  
    emit(code, "    $I0 = pop gpad")
    emit(code, "    if cutting != %s goto fail", cutnum)
    emit(code, "    cutting = 0")
    emit(code, "    goto fail")
    emit(code, "  %s:", replabel)
    emit(code, "    rep = gpad[-1]")
    if islazy goto lazy
  greedy:
    if max == PGE_INF goto greedy_1
    emit(code, "    if rep >= %s goto %s_g1", max, label)
  greedy_1:
    emit(code, "    inc rep")
    emit(code, "    gpad[-1] = rep")
    self.emitsub(code, explabel, "rep", "pos")
    emit(code, "    dec rep")
    emit(code, "  %s_g1:", label)
    if min < 1 goto greedy_2
    emit(code, "    if rep < %s goto fail", min)
  greedy_2:
    emit(code, "    $I0 = pop gpad")
    self.emitsub(code, next, "rep", "NOCUT")
    emit(code, "    push gpad, rep")
    if iscut == 0 goto greedy_3
    emit(code, "    cutting = %s", cutnum)
  greedy_3:
    emit(code, "    goto fail")
    goto end
  lazy:
    if min < 1 goto lazy_1
    emit(code, "    if rep < %s goto %s_l1", min, label)
  lazy_1:
    emit(code, "    $I0 = pop gpad")
    self.emitsub(code, next, "rep", "pos", "NOCUT")
    emit(code, "    push gpad, rep")
    emit(code, "  %s_l1:", label)
    emit(code, "    if rep >= %s goto fail", max)
    emit(code, "    inc rep")
    emit(code, "    gpad[-1] = rep")
    emit(code, "    goto %s", explabel)
  end:
    exp.gen(code, explabel, replabel)
.end


.namespace [ "PGE::Exp::Group" ]

.sub "reduce" :method
    .local pmc exp
    self["isquant"] = 1
    exp = self[0]
    exp = exp.reduce()
    self[0] = exp
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int iscapture, isarray, isscope
    .local string cname, captsave, captback
    .local string explabel, expnext
    .local int cutnum, iscut
    .local pmc exp

    emit = find_global "PGE::Exp", "emit"
    iscapture = self["iscapture"]
    isscope = self["isscope"]
    cname = self["cname"]
    iscut = self["iscut"]
    cutnum = self["cutnum"]
    exp = self[0]
    (explabel, $I0) = self.serno()
    expnext = next

    emit(code, "\n  %s:  # group %s    ##", label, cname)
    if iscapture goto capture
    self.emitsub(code, explabel, "NOCUT")
    emit(code, "    if cutting != %s goto fail", cutnum)
    emit(code, "    cutting = 0")
    emit(code, "    goto fail")
    goto end
  capture:
    expnext = concat label, "_subp"
    (captsave, captback) = self."gencapture"(code, label)
    emit(code, "    ($P0, $P9, $P1) = newfrom(captscope, pos)")
    emit(code, "    $P1 = pos")
    emit(code, "    push gpad, captscope")
    emit(code, "    push gpad, $P0")
    emit(code, captsave, cname)
    if isscope == 0 goto capture_1
    emit(code, "    captscope = $P0")
  capture_1:
    self.emitsub(code, explabel, "NOCUT")
    emit(code, "    $P0 = pop gpad")
    emit(code, "    captscope = pop gpad")
    emit(code, captback, cname)
    if iscut == 0 goto capture_2
    emit(code, "    if cutting != %d goto fail", cutnum)
    emit(code, "    cutting = 0")
  capture_2:
    emit(code, "    goto fail")
    emit(code, "  %s:", expnext)
    emit(code, "    save captscope")
    emit(code, "    $P0 = pop gpad")
    emit(code, "    captscope = pop gpad")
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P1 = pos")
    self.emitsub(code, next, "$P0", "captscope", "NOCUT")
    emit(code, "    push gpad, captscope")
    emit(code, "    push gpad, $P0")
    emit(code, "    restore captscope")
    emit(code, "    goto fail")
  end:
    exp.gen(code, explabel, expnext)
.end 

.namespace [ "PGE::Exp::Subrule" ]

.sub "reduce" :method
    self["isquant"] = 1
    .return (self)
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local string subname, subargs
    .local string cname, captsave, captback
    .local int iscapture, iscut, isnegated
    emit = find_global "PGE::Exp", "emit"
    subname = self["subname"]
    iscapture = self["iscapture"]
    iscut = self["iscut"]
    isnegated = self["isnegated"]
    cname = self["cname"]
    emit(code, "\n  %s:  # subrule %s    ##", label, subname)
    subargs = ""
    $I0 = exists self["arg"]
    if $I0 == 0 goto nosubargs
    $P0 = find_global "Data::Escape", "String"
    $S0 = self["arg"]
    $S0 = $P0($S0, '"')
    subargs = ', "'
    subargs .= $S0
    subargs .= '"'
  nosubargs:
    captsave = ""
    captback = ""
    if iscapture == 0 goto subrule
    (captsave, captback) = self."gencapture"(code, label)
  subrule:
    $I0 = 0
  subrule_1:
    $I1 = index subname, "::", $I0
    if $I1 == -1 goto subrule_2
    $I0 = $I1 + 2
    goto subrule_1
  subrule_2:
    if $I0 == 0 goto subrule_simple_name
    $S1 = substr subname, $I0
    $I0 -= 2
    $S0 = substr subname, 0, $I0
    emit(code, "    ($P1,$P9,$P9,$P0) = newfrom(captscope, pos, \"%s\")", $S0)
    emit(code, "    $P0 = pos")
    emit(code, "    $P0 = find_global \"%s\", \"%s\"", $S0, $S1)
    emit(code, "    $P0 = $P0($P1%s)", subargs)
    goto subrule_3
  subrule_simple_name:
    emit(code, "    $P0 = getattribute captscope, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P0 = pos")
    emit(code, "    $I0 = can mob, \"%s\"", subname)
    emit(code, "    if $I0 == 0 goto %s_s1", label)
    emit(code, "    $P0 = find_method mob, \"%s\"", subname)
    emit(code, "    goto %s_s2", label)
    emit(code, "  %s_s1:", label)
    emit(code, "    $P0 = find_global \"%s\"", subname)
    emit(code, "  %s_s2:", label)
    emit(code, "    $P0 = $P0(captscope%s)", subargs)
  subrule_3:
    if isnegated == 0 goto subrule_4
    emit(code, "    if $P0 goto fail")
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0$:from\"")
    emit(code, "    $P1 = pos")
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P1 = pos")
    emit(code, "    goto %s", next)
    goto end
  subrule_4:
    emit(code, "    unless $P0 goto fail")
    emit(code, captsave, cname)
    if iscut == 0 goto subrule_5
    emit(code, "    goto %s", next)
    goto end
  subrule_5:
    emit(code, "  %s_sr3:", label)
    emit(code, "    pos = $P0.to()")
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0&:corou\"")
    emit(code, "    if_null $P1, %s", next)
    self.emitsub(code, next, "$P0", "NOCUT")
    emit(code, "    $P0.next()")
    emit(code, "    if $P0 goto %s_sr3", label)
    emit(code, captback, cname)
    emit(code, "    goto fail")
  end:
    .return ()
.end

.namespace [ "PGE::Exp::Cut" ]

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int cutnum
    emit = find_global "PGE::Exp", "emit"
    cutnum = self["cutnum"]
    emit(code, "\n  %s:  # cut %s    ##", label, cutnum)
    self.emitsub(code, next, "NOCUT")
    emit(code, "    cutting = %s", cutnum)
    emit(code, "    goto fail")
    .return ()
.end
