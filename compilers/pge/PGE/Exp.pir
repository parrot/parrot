.namespace [ "PGE::Exp" ]

.include "interpinfo.pasm"
.include "cclass.pasm"
.const int PGE_INF = 2147483647
.const int PGE_CUT_GROUP = -1
.const int PGE_CUT_RULE = -2
.const int PGE_CUT_MATCH = -3
.const int PGE_CUT_CUT = -4

.sub "__onload" :load
    .local pmc optable
    .local pmc term

    $I0 = find_type "PGE::Exp"
    if $I0 goto end
    $P0 = getclass "PGE::Match"
    $P0 = subclass $P0, "PGE::Exp"
    $P1 = subclass $P0, "PGE::Exp::Literal"
    $P1 = subclass $P0, "PGE::Exp::Scalar"
    $P1 = subclass $P0, "PGE::Exp::CCShortcut"
    $P1 = subclass $P0, "PGE::Exp::EnumCharList"
    $P1 = subclass $P0, "PGE::Exp::Anchor"
    $P1 = subclass $P0, "PGE::Exp::Concat"
    $P1 = subclass $P0, "PGE::Exp::Alt"
    $P1 = subclass $P0, "PGE::Exp::Conj"
    $P1 = subclass $P0, "PGE::Exp::Group"
    $P1 = subclass $P0, "PGE::Exp::Subrule"
    $P1 = subclass $P0, "PGE::Exp::Cut"
    $P1 = subclass $P0, "PGE::Exp::Quant"
    $P1 = subclass $P0, "PGE::Exp::Modifier"
    $P1 = subclass $P0, "PGE::Exp::Closure"
    $P1 = subclass $P0, "PGE::Exp::Commit"
    $P0 = new .Integer
    store_global "PGE::Exp", "$_serno", $P0
  end:
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

.sub "escape" :method
    .param string str
    str = escape str
    str = concat '"', str
    str = concat str, '"'
    $I0 = index str, "\\x"
    if $I0 >= 0 goto unicode
    $I0 = index str, "\\u"
    if $I0 >= 0 goto unicode
    goto end
  unicode:
    str = concat "unicode:", str
  end:
    .return (str)
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

.sub "genfixedstr" :method
    .param pmc code
    .param string label
    .param string next
    .param string testcode
    .param string fixstr
    .param string fixlen
    .local pmc emit
    .local int min, max, islazy, iscut, ignorecase
    .local string testlabel
    (min, max, islazy, iscut, $S0) = self."quant"()
    ignorecase = self["ignorecase"]
    emit = find_global "PGE::Exp", "emit"
    testlabel = "fail"
    if min != max goto quant
    iscut = 1
    if max != 1 goto quant
    bsr test
    emit(code, "    goto %s", next)
    .return ()
  quant:
    emit(code, "    rep = 0")
    if islazy goto lazy
  greedy:
    testlabel = concat label, "_g2"
    emit(code, "  %s_g1:", label)
    if max == PGE_INF goto greedy_1
    emit(code, "    if rep >= %s goto %s", max, testlabel)
  greedy_1:
    bsr test
    emit(code, "    inc rep")
    emit(code, "    goto %s_g1", label)
    emit(code, "  %s:", testlabel)
    emit(code, "    if rep < %s goto fail", min)
    if iscut goto cut
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep", "$I1")
    emit(code, "    dec rep")
    emit(code, "    pos -= %s", fixlen)
    emit(code, "    goto %s", testlabel)
    .return ()
  lazy:
    if min > 1 goto lazy_1
    emit(code, "    goto %s_l2", label)
  lazy_1:
    emit(code, "  %s_l1:", label)
    bsr test
    emit(code, "    if rep < %s goto %s_l1", min, label)
    emit(code, "  %s_l2:", label)
    if iscut goto cut
    if max == PGE_INF goto lazy_2
    emit(code, "    if rep >= %s goto %s", max, next)
  lazy_2:
    self.emitsub(code, next, "pos", "rep", "$I1", "$S1")
  lazy_4:
    emit(code, "    goto %s_l1", label)
    .return ()
  cut:
    emit(code, "    goto %s", next)
    .return ()

  test:
    emit(code, "    if pos >= lastpos goto %s", testlabel)
    emit(code, "    $S0 = substr target, pos, %s", fixlen)
    if ignorecase == 0 goto test_1
    emit(code, "    downcase $S0")
  test_1:
    emit(code, testcode, fixstr, testlabel)
    emit(code, "    pos += %s", fixlen)
    ret
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
    captsave = "    $P2 = captscope[%s]\n    push $P2, $P0"
    captback = "    $P1 = captscope[%s]\n    $P1 = pop $P1"
    $I0 = self["isgen"]
    if $I0 goto end
    emit(code, "    $I0 = defined captscope[%s]", cname)
    emit(code, "    if $I0 goto %s_c1", label)
    emit(code, "    $P0 = new .PerlArray")
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

.sub "firstchars" :method
    .param pmc explist         :slurpy
    $S1 = ""
  loop:
    unless explist goto end
    $P0 = shift explist
    $I0 = exists $P0["firstchars"]
    if $I0 == 0 goto nofirstchars
    $S0 = $P0["firstchars"]
    if $S0 == "" goto nofirstchars
    $S1 .= $S0
    goto loop
  end:
    self["firstchars"] = $S1
    .return ()
  nofirstchars:
    self["firstchars"] = ""
    .return ()
.end
 
.sub "reduce" :method
    .param pmc next
    $P0 = new .Exception
    $P0["_message"] = "Attempt to reduce PGE::Exp abstract class"
    throw $P0
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

    code = new .String
    exp0 = self["expr"]
    exp0 = exp0.reduce(self)
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
    emit(code, "    gpad = new .PerlArray")
    emit(code, "    rcache = new .PerlHash")
    emit(code, "    captscope = mob")
    emit(code, "    pos = mfrom")
    emit(code, "    if pos >= 0 goto try_at_pos")
    emit(code, "    pos = 0")
    emit(code, "  try_match:")
    emit(code, "    cutting = 0")
    emit(code, "    if pos > lastpos goto fail_forever")
    $S1 = exp0["firstchars"]
    if $S1 == "" goto nofc
    $S1 = self."escape"($S1)
    emit(code, "    $S0 = substr target, pos, 1")
    emit(code, "    $I0 = index %s, $S0", $S1)
    emit(code, "    if $I0 < 0 goto try_match_1")
  nofc:
    emit(code, "    mfrom = pos")
    self.emitsub(code, exp0label, "pos", "NOCUT")
    emit(code, "    if cutting <= %s goto fail_cut", PGE_CUT_RULE)
    emit(code, "  try_match_1:")
    emit(code, "    inc pos")
    emit(code, "    goto try_match")
    emit(code, "  try_at_pos:")
    emit(code, "    cutting = 0")
    self.emitsub(code, exp0label, "NOCUT")
    emit(code, "    if cutting <= %s goto fail_cut", PGE_CUT_RULE)
    emit(code, "  fail_forever:")
    emit(code, "    cutting = %s", PGE_CUT_RULE)
    emit(code, "  fail_cut:")
    emit(code, "    mpos = cutting")
    emit(code, "    null $P0")
    emit(code, "    setattribute mob, \"PGE::Match\\x0&:corou\", $P0")
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

.sub "reduce" :method
    .param pmc next
    $S0 = self["value"]
    $S0 = substr $S0, 0, 1
    $I0 = self["ignorecase"]
    if $I0 == 0 goto end
    $S1 = downcase $S0
    $S0 = upcase $S0
    $S0 .= $S1
  end:
    self["firstchars"] = $S0
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    ($I0, $I1, $I2, $I3, $S0) = self."quant"()
    emit = find_global "PGE::Exp", "emit"
    $S1 = self["value"]
    $I0 = self["ignorecase"]
    if $I0 == 0 goto lit_1
    downcase $S1
  lit_1:
    $I1 = length $S1
    $S1 = self."escape"($S1)
    emit(code, "\n  %s: # literal %s    ##", label, $S0)
    $S0 = "    if $S0 != %s goto %s"
    self.genfixedstr(code, label, next, $S0, $S1, $I1)
    .return ()
.end    

.namespace [ "PGE::Exp::EnumCharList" ]

.sub "reduce" :method
    .param pmc next
    $S0 = ""
    $I0 = self["isnegated"]
    if $I0 goto end
    $S0 = self["charlist"]
  end:
    self["firstchars"] = $S0
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    ($I0, $I1, $I2, $I3, $S0) = self."quant"()
    emit = find_global "PGE::Exp", "emit"
    $S1 = self["value"]
    $I0 = self["ignorecase"]
    if $I0 == 0 goto charlist_1
    downcase $S1
  charlist_1:
    emit(code, "\n  %s: # charclass %s    ##", label, $S0)
    $I1 = length $S1
    $S1 = self."escape"($S1)
    $I0 = self["isnegated"]
    if $I0 goto charlist_2
    $S0 = "    $I0 = index %s, $S0\n    if $I0 < 0 goto %s"
    self.genfixedstr(code, label, next, $S0, $S1, 1)
    .return ()
  charlist_2:
    $S0 = "    $I0 = index %s, $S0\n    if $I0 >= 0 goto %s"
    self.genfixedstr(code, label, next, $S0, $S1, 1)
    .return ()
.end    


.namespace [ "PGE::Exp::Scalar" ]

.sub "reduce" :method
    .param pmc next
    self["firstchars"] = ""
    .return (self)
.end
    
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
    emit(code, "    $S1 = $P0")
    emit(code, "    $I1 = length $S1")
    $S0 = "    if $S0 != %s goto %s"
    self."genfixedstr"(code, label, next, $S0, "$S1", "$I1")
    .return ()
.end
    

.namespace [ "PGE::Exp::CCShortcut" ]

.sub "reduce" :method
    $S0 = self["value"]
    if $S0 != "\\n" goto end
    self["isquant"] = 1
  end:
    self["firstchars"] = ""
.end
    
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
    if token == "\\n" goto newline
    if token == "." goto dot
    find = "    $I0 = find_not_cclass %s, target, pos, lastpos"
    if token == "\\s" goto space
    if token == "\\d" goto digit
    if token == "\\w" goto word
    find = "    $I0 = find_cclass %s, target, pos, lastpos"
    if token == "\\S" goto space
    if token == "\\D" goto digit
    if token == "\\W" goto word
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
  newline:                                         # single newline
    emit(code, "    $I0 = is_cclass %s, target, pos", .CCLASS_NEWLINE)
    emit(code, "    if $I0 == 0 goto fail")
    emit(code, "    $S0 = substr target, pos, 2")
    emit(code, "    inc pos")
    emit(code, "    if $S0 != \"\\r\\n\" goto %s", next)
    emit(code, "    inc pos")
    emit(code, "    goto %s", next)
    .return ()
.end


.namespace [ "PGE::Exp::Concat" ]

.sub "reduce" :method
    .param pmc next
    .local pmc exp0, exp1, exp10

    exp1 = self[1]
    exp1 = exp1.reduce(next)
    self[1] = exp1
    exp0 = self[0]
    exp0 = exp0.reduce(exp1)
    self[0] = exp0

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
    $I0 = exp0["isquant"]
    if $I0 == 0 goto exp0_min1
    $I0 = exp0["min"]
    if $I0 > 0 goto exp0_min1
    self.firstchars(exp0, exp1)
    .return (self)
  exp0_min1:
    self.firstchars(exp0)
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

.sub "reduce" :method
    .param pmc next
    self.firstchars(next)
    .return (self)
.end

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

.sub "reduce" :method
    .param pmc next
    .local pmc exp0, exp1
    exp0 = self[0]
    exp0 = exp0.reduce(next)
    self[0] = exp0
    exp1 = self[1]
    exp1 = exp1.reduce(next)
    self[1] = exp1
    self.firstchars(exp0, exp1)
    .return (self)
.end

.sub "gen" :method
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


.namespace [ "PGE::Exp::Conj" ]

.sub "reduce" :method
    .param pmc next
    .local pmc exp0, exp1
    exp0 = self[0]
    exp0 = exp0.reduce(next)
    self[0] = exp0
    exp1 = self[1]
    exp1 = exp1.reduce(next)
    self[1] = exp1
    self.firstchars(exp0, exp1)
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp0, exp1
    .local string exp0label, exp1label, chk0label, chk1label
    emit = find_global "PGE::Exp", "emit"
    (exp0label, $I0) = self.serno()
    (exp1label, $I1) = self.serno()
    chk0label = concat label, "_0"
    chk1label = concat label, "_1"
    emit(code, "\n  %s:  # conj %s, %s    ##", label, exp0label, exp1label)
    emit(code, "    push gpad, pos")
    emit(code, "    push gpad, pos")
    self.emitsub(code, exp0label, "NOCUT")
    emit(code, "    $I0 = pop gpad")
    emit(code, "    $I0 = pop gpad")
    emit(code, "    goto fail")
    emit(code, "  %s:", chk0label)
    emit(code, "    gpad[-1] = pos")
    emit(code, "    pos = gpad[-2]")
    emit(code, "    goto %s", exp1label)
    emit(code, "  %s:", chk1label)
    emit(code, "    $I0 = gpad[-1]")
    emit(code, "    if $I0 != pos goto fail")
    emit(code, "    $I0 = pop gpad")
    emit(code, "    $I1 = pop gpad")
    self.emitsub(code, next, "$I0", "$I1", "NOCUT")
    emit(code, "    push gpad, $I1")
    emit(code, "    push gpad, $I0")
    emit(code, "    goto fail")
    exp0 = self[0]
    exp0.gen(code, exp0label, chk0label)
    exp1 = self[1]
    exp1.gen(code, exp1label, chk1label)
    .return ()
.end


.namespace [ "PGE::Exp::Quant" ]

.sub "reduce" :method
    .param pmc next
    .local pmc exp

    exp = self[0]
    exp = exp.reduce(next)
    $I0 = exp["isquant"]
    if $I0 == 1 goto noreduce
    exp["isquant"] = 1
    $P0 = self["islazy"]
    exp["islazy"] = $P0
    $P0 = self["max"]
    exp["max"] = $P0
    $P0 = self["min"]
    exp["min"] = $P0
    if $P0 > 0 goto quant1
    exp.firstchars(exp, next)
  quant1:
    .return (exp)
  noreduce:
    $P0 = self["min"]
    if $P0 > 0 goto quant2
    self.firstchars(exp, next)
    .return (self)
  quant2:
    self.firstchars(exp)
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
    .param pmc next
    .local pmc exp
    self["isquant"] = 1
    exp = self[0]
    exp = exp.reduce(next)
    self[0] = exp
    self.firstchars(exp)
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
    .param pmc next
    self["isquant"] = 1
    self["firstchars"] = ""
    $S0 = next["firstchars"]
    self["nextchars"] = $S0
    .return (self)
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local string subname, subargs, nextchars
    .local string cname, captsave, captback
    .local int iscapture, iscut, isnegated
    emit = find_global "PGE::Exp", "emit"
    subname = self["subname"]
    iscapture = self["iscapture"]
    iscut = self["iscut"]
    isnegated = self["isnegated"]
    cname = self["cname"]
    nextchars = self["nextchars"]
    emit(code, "\n  %s:  # subrule %s    ##", label, subname)
    subargs = ""
    $I0 = exists self["arg"]
    if $I0 == 0 goto nosubargs
    $S0 = self["arg"]
    $S0 = self."escape"($S0)
    subargs = concat ", ", $S0
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
    emit(code, "    $P1 = captscope", subargs)
  subrule_3:
    if nextchars == "" goto subrule_3a
    nextchars = self.escape(nextchars)
    emit(code, "    $P2 = new .String")
    emit(code, "    $P2 = %s", nextchars)
    emit(code, "    setprop $P0, \"nextchars\", $P2")
  subrule_3a:
    emit(code, "    $P0 = $P0($P1%s)", subargs)
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0$:pos\"")
    emit(code, "    if $P1 <= %s goto %s_commit", PGE_CUT_MATCH, label)
    if isnegated == 0 goto subrule_4
    emit(code, "    if $P1 >= 0 goto fail")
    emit(code, "    $P1 = pos")
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0$:from\"")
    emit(code, "    $P1 = pos")
    emit(code, "    goto %s", next)
    goto subrule_commit
  subrule_4:
    emit(code, "    if $P1 < 0 goto fail")
    if iscapture == 0 goto subrule_5
    emit(code, captsave, cname)
    emit(code, "    bsr %s_s3", label)
    emit(code, captback, cname)
    emit(code, "    goto fail")
  subrule_5:
    emit(code, "  %s_s3:", label)
    emit(code, "    pos = $P1")
    if iscut == 0 goto subrule_6
    emit(code, "    goto %s", next)
    goto subrule_commit
  subrule_6:
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0&:corou\"")
    emit(code, "    if_null $P1, %s", next)
    self.emitsub(code, next, "$P0", "NOCUT")
    emit(code, "    $P0.next()")
    emit(code, "    $P1 = getattribute $P0, \"PGE::Match\\x0$:pos\"")
    emit(code, "    if $P1 >= 0 goto %s_s3", label)
    emit(code, "    if $P1 > %s goto fail", PGE_CUT_MATCH)
  subrule_commit:
    emit(code, "  %s_commit:", label)
    emit(code, "    cutting = $P1")
    emit(code, "    goto fail")
  end:
    .return ()
.end

.namespace [ "PGE::Exp::Cut" ]

.sub "reduce" :method
    .param pmc next
    self.firstchars(next)
    .return (self)
.end

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

.namespace [ "PGE::Exp::Closure" ]

.sub "reduce" :method
    self["isquant"] = 1
    self["firstchars"] = ""
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local string value, lang
    emit = find_global "PGE::Exp", "emit"
    value = self["value"]
    lang = self["lang"]
    value = self."escape"(value)
    lang = self."escape"(lang)
    emit(code, "\n  %s:  # closure    ##", label)
    emit(code, "    $S0 = concat %s, \":\"", lang)
    emit(code, "    $S1 = %s", value)
    emit(code, "    $S0 .= $S1")
    emit(code, "    $P0 = find_global \"PGE::Rule\", \"%:cache\"")
    emit(code, "    $I0 = exists $P0[$S0]")
    emit(code, "    if $I0 goto %s_1", label)
    emit(code, "    $P1 = compreg %s", lang)
    emit(code, "    $P1 = $P1($S1)")
    emit(code, "    $P0[$S0] = $P1")
    emit(code, "  %s_1:", label)
    emit(code, "    $P1 = $P0[$S0]")
    emit(code, "    mpos = pos")
    emit(code, "    $P1(mob)")
    emit(code, "    goto %s", next)
    .return ()
.end

.namespace [ "PGE::Exp::Commit" ]

.sub "reduce" :method
    .param pmc next
    self["firstchars"] = ""
    .return (self)
.end

.sub "gen" :method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    emit = find_global "PGE::Exp", "emit"
    emit(code, "  %s:  # commit    ##", label)
    emit(code, "    bsr %s", next)
    emit(code, "    cutting = %s", PGE_CUT_MATCH)
    emit(code, "    goto fail")
    .return ()
.end
