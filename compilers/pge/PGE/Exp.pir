=head1 Title

PGE::Exp - PGE rule expression trees and code generator

=head1 DESCRIPTION

This file implements the expression objects used to build rule
expressions.  The classes currently include

    PGE::Exp       - base class
    PGE::Start     - start of rule
    PGE::End       - (successful) end of rule
    PGE::Literal   - match a literal string
    PGE::Scalar    - match a scalar
    PGE::Dot       - match any character
    PGE::CCShortcut - character class shortcuts (\d, \D, \w, etc.)
    PGE::CharClass - character classes (<[abcde]>, <-[abcde]>)
    PGE::WS        - <?ws> rule
    PGE::Anchor    - matching of ^, ^^, $, $$, \b, \B anchors
    PGE::Cut       - :: and :::
    PGE::Concat    - concatenation of expressions
    PGE::Alt       - alternations
    PGE::Group     - groups and captures

Each class has a C<gen> method that is used to generate PIR
code for that portion of the expression.  The code does not yet
have a lot of optimizations in it -- we're still focusing on
functionality and correctness at the moment.

=cut

.include "cclass.pasm"
.include "errors.pasm"
.include "interpinfo.pasm"

.const int PGE_INF = 2147483647                    # XXX: arbitrary limit
.const int PGE_CUT_GROUP = -1                      # cut current alt/group
.const int PGE_CUT_RULE = -2                       # cut current rule

.namespace [ "PGE::Exp" ]

.sub __onload
    .local pmc hashclass
    .local pmc expclass
    .local pmc hash
    hashclass = getclass "Hash"
    expclass = subclass hashclass, "PGE::Exp"
    $P0 = subclass expclass, "PGE::Exp::Start"
    $P0 = subclass expclass, "PGE::Exp::End"
    $P0 = subclass expclass, "PGE::Exp::Literal"
    $P0 = subclass expclass, "PGE::Exp::Scalar"
    $P0 = subclass expclass, "PGE::Exp::Dot"
    $P0 = subclass expclass, "PGE::Exp::CCShortcut"
    $P0 = subclass expclass, "PGE::Exp::CharClass"
    $P0 = subclass expclass, "PGE::Exp::WS"
    $P0 = subclass expclass, "PGE::Exp::Anchor"
    $P0 = subclass expclass, "PGE::Exp::Cut"
    $P0 = subclass expclass, "PGE::Exp::Concat"
    $P0 = subclass expclass, "PGE::Exp::Alt"
    $P0 = subclass expclass, "PGE::Exp::Group"
    hash = new Hash
    store_global "PGE::Exp::CCShortcut", "%slashcode", hash
    hash['\d'] = <<"EOT"
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    unless $I0 goto %s_f
EOT
    hash['\n'] = <<"EOT"
    $I0 = is_cclass .CCLASS_NEWLINE, target, pos
    unless $I0 goto %s_f
EOT
    hash['\s'] = <<"EOT"
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    unless $I0 goto %s_f
EOT
    hash['\w'] = <<"EOT"
    $I0 = is_cclass .CCLASS_WORD, target, pos
    unless $I0 goto %s_f
EOT
    hash['\D'] = <<"EOT"
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    if $I0 goto %s_f
EOT
    hash['\N'] = <<"EOT"
    $I0 = is_cclass .CCLASS_NEWLINE, target, pos
    if $I0 goto %s_f
EOT
    hash['\S'] = <<"EOT"
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    if $I0 goto %s_f
EOT
    hash['\W'] = <<"EOT"
    $I0 = is_cclass .CCLASS_WORD, target, pos
    if $I0 goto %s_f
EOT
    $P0 = new Integer
    store_global "PGE::Exp", "$_serno", $P0
    .return ()
.end

=head2 Functions

=item C<new(STR class [, PMC exp1 [, PMC exp2]])>

Creates and returns  a new C<Exp> object of C<class>, initializing
min/max/greedy/etc.  values and C<exp1> and C<exp2> objects if provided.

=cut

.sub "new"
    .param string expclass     :optional           # class from find_type
    .param int has_class       :opt_flag
    .param pmc exp1            :optional           # left expression
    .param int has_exp1        :opt_flag
    .param pmc exp2            :optional           # right expression
    .param int has_exp2        :opt_flag
    .local pmc me                                  # new expression object

    if has_class goto buildme
    expclass = "PGE::Exp"
  buildme:
    $I0 = find_type expclass
    me = new $I0
    me["min"] = 1
    me["max"] = 1
    me["isgreedy"] = 1
    me["iscut"] = 0

    unless has_exp1 goto end
    me["exp1"] = exp1
    unless has_exp2 goto end
    me["exp2"] = exp2
  end:
    .return (me)
.end

=item C<(min, max, isgreedy, iscut) = _getattributes()>

A method for quickly retrieving the min, max, and greediness
attributes of an expression object.

=cut

.sub "_getattributes" method
    .local int min, max, isgreedy, iscut
    min = self["min"]
    max = self["max"]
    isgreedy = self["isgreedy"]
    iscut = self["iscut"]
    .return (min, max, isgreedy, iscut)
.end

=item C<quant()>

Returns a string representing the quantifier values of the
current expression object.

=cut

.sub "quant" method
    .local string min, max
    $S0 = "{"
    min = self["min"]
    concat $S0, min
    concat $S0, ".."
    max = self["max"]
    concat $S0, max
    concat $S0, "}"
    $I0 = self["isgreedy"]
    if $I0 goto cut
    concat $S0, "?"
  cut:
    $I0 = self["iscut"]
    unless $I0 goto end
    concat $S0, ":"
  end:
    .return ($S0)
.end

=item C<analyze(PMC next, PMC pad)>

The analyze method is used to walk an expression tree and perform
a variety of optimizations and pre-processing in preparation for
generating the rule code.  The C<next> parameter identifies the
expression that will come after this one.  The C<pad> parameter
is a work pad hash that is carried from one object to the next.
Typical entries in the pad include:
    isarray: does this (group) object cause its subelements to repeat?
    reps: a hash of lexically repeated capture names

=cut

.sub "analyze" method
    .param pmc next
    .param pmc pad
    self["firstchars"] = ""
    .return ()
.end


=item C<firstchars([PMC exp1 [, PMC exp2]])>

The firstchars method sets the "firstchars" optimization hint
based on the concatenation of the firstchars of any expressions
provided.  If either of the expressions has an empty firstchars
hint, then we have have no firstchars either.

=cut

.sub "firstchars" method
    .param pmc exp1            :optional
    .param int has_exp1        :opt_flag
    .param pmc exp2            :optional
    .param int has_exp2        :opt_flag

    unless has_exp1 goto exp_1
    $S0 = exp1["firstchars"]
    unless $S0 > "" goto exp_1
    unless has_exp2 goto exp_1
    $S1 = exp2["firstchars"]
    unless $S1 > "" goto exp_1
    concat $S0, $S1
    goto end
  exp_1:
    $S0 = ""
  end:
    self["firstchars"] = $S0
    .return ()
.end

=item C<(STR, INT) = serno([STR prefix [, INT start]])>

This method simply returns integers and labels usable for
serialization, e.g., for generating unique labels and identifiers
within generated code.  The C<start> parameter allows the serial
number to be set to a given value.  XXX: I'm assuming overflow
won't be a problem, but is the use of the start parameter thread-safe?

=cut

.sub "serno" method
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


=item C<emit(PMC code, STR fmt [, STR str1 [, STR str2]])>

Adds to the current code string, replacing %s by str1/str2.

=cut

.sub "emit"
    .param pmc code                                # append to code
    .param string fmt                              # string to output
    .param string str1         :optional           # first %s substitution
    .param string str2         :optional           # second %s substitution

    concat fmt, "\n"
    $I0 = index fmt, "%s"
    if $I0 < 0 goto emit_1
    substr fmt, $I0, 2, str1
    $I0 = index fmt, "%s"
    if $I0 < 0 goto emit_1
    substr fmt, $I0, 2, str2
  emit_1:
    concat code, fmt
    .return ()
.end

=item C<emitsub(PMC code, STR next, [STR save [, ...]])

Generate a subroutine call to C<next>, preserving and restoring
any save parameters in the process.  The special parameter "NOCUT"
says not to intercept cutting operations.

=cut

.sub "emitsub" method
    .param pmc code                                # append to code
    .param string next                             # sub label
    .param pmc save         :slurpy                # registers to save
    .local int nocut                               # flag for "NOCUT"
    .local pmc emit                                # emit subroutine
    .local int savec                               # number of save items

    emit = find_global "PGE::Exp", "emit"
    nocut = 0
    savec = elements save
    $I0 = 0
  saveregs_0:
    if $I0 >= savec goto emitsub_0
    $S0 = save[$I0]
    inc $I0
    if $S0 == "NOCUT" goto set_nocut
    emit(code, "    save %s", $S0)
    goto saveregs_0
  set_nocut:
    nocut = 1
    goto saveregs_0
  emitsub_0:
    emit(code, "    bsr %s", next)
    $I0 = savec - 1
  restoreregs_0:
    if $I0 < 0 goto generate_cut
    $S0 = save[$I0]
    dec $I0
    if $S0 == "NOCUT" goto restoreregs_0
    emit(code, "    restore %s", $S0)
    goto restoreregs_0
  generate_cut:
    if nocut goto end
    emit(code, "    if cutting != 0 goto fail")
  end:
    .return ()
.end

=item C<genliteral(PMC code, STR label, STR next)>

Generate code to match literal strings, quantified as necessary.
There are several types of rule expressions that result matching
literal strings, thus we write the code once here rather than
duplicate it in each expression.  This code assumes that the
literal to be matched has already been placed in the C<str> string
register.

=cut

.sub "genliteral" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int min, max, isgreedy, iscut
    (min, max, isgreedy, iscut) = self."_getattributes"()
    emit = find_global "PGE::Exp", "emit"
    emit(code, "    litlen = length lit")
    unless min == 1 goto greedy
    unless max == 1 goto greedy
    emit(code, "    $S0 = substr target, pos, litlen")
    emit(code, "    if $S0 != lit goto fail")
    emit(code, "    pos += litlen")
    emit(code, "    goto %s", next)
    .return ()
  greedy:
    emit(code, "    rep = 0")
    unless isgreedy goto lazy
    emit(code, "  %s_lit1:", label)
    emit(code, "    if rep >= %s goto %s_lit2", max, label)
    emit(code, "    $S0 = substr target, pos, litlen")
    emit(code, "    if $S0 != lit goto %s_lit2", label)
    emit(code, "    inc rep")
    emit(code, "    pos += litlen")
    emit(code, "    goto %s_lit1", label)
    emit(code, "  %s_lit2:", label)
    emit(code, "    if rep < %s goto fail", min)
    unless iscut goto greedy_1
    emit(code, "    goto %s", next)
  greedy_1:
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep", "litlen")
    emit(code, "    dec rep")
    emit(code, "    pos -= litlen")
    emit(code, "    goto %s_lit2", label)
    .return ()

  lazy:
    emit(code, "  %s_lit1:", label)
    emit(code, "    if rep < %s goto %s_lit2", min, label)
    unless iscut goto lazy_1
    emit(code, "    goto %s", next)
    goto lazy_2
  lazy_1:
    emit(code, "    if rep >= %s goto %s", max, next)
    self.emitsub(code, next, "pos", "rep", "lit", "litlen")
  lazy_2:
    emit(code, "  %s_lit2:", label)
    emit(code, "    $S0 = substr target, pos, litlen")
    emit(code, "    if $S0 != lit goto fail")
    emit(code, "    inc rep")
    emit(code, "    pos += litlen")
    emit(code, "    goto %s_lit1", label)
    .return ()
.end

.namespace [ "PGE::Exp::Start" ]

.sub analyze method
    .param pmc next
    .param pmc pad
    pad = new Hash                                 # create a new workpad
    pad["cutnum"] = PGE_CUT_GROUP                  # cut the current group
    $P0 = self["exp1"]
    $P0.analyze(self, pad)                         # analyze our subexp
    self.firstchars($P0)                           # set firstchars
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp1
    .local string firstchars
    .local string exp1label

    exp1label = "R"
    emit = find_global "PGE::Exp", "emit"
    emit(code, ".sub %s", label)
    emit(code, "    .param pmc mob")
    emit(code, "    .local pmc corou")
    emit(code, "    $P0 = find_global \"PGE::Match\", \"newfrom\"")
    emit(code, "    mob = $P0(mob)")
    emit(code, "    newsub corou, .Coroutine, _%s_coroutine", label)
    emit(code, "    setattribute mob, \"PGE::Match\\x0&:corou\", corou")
    emit(code, "    corou(mob)")
    emit(code, "    .return (mob)")
    emit(code, ".end")
    emit(code, "")
    emit(code, ".sub _%s_coroutine", label)
    emit(code, "    .param pmc mob")
    emit(code, "    .local int pos")
    emit(code, "    .local string target")
    emit(code, "    .local int lastpos")
    emit(code, "    .local int cutting")
    emit(code, "    .local int rep, maxrep")
    emit(code, "    .local int litlen")
    emit(code, "    .local string lit")
    emit(code, "    .local pmc gpad, rcache")
    emit(code, "    .local pmc captscope")
    emit(code, "    .local pmc from")
    emit(code, ".include \"cclass.pasm\"")
    emit(code, "    gpad = new PerlArray")
    emit(code, "    rcache = new PerlHash")
    emit(code, "    captscope = mob")
    emit(code, "    from = getattribute mob, \"PGE::Match\\x0$:from\"")
    emit(code, "    $P0 = getattribute mob, \"PGE::Match\\x0$:target\"")
    emit(code, "    target = $P0")
    emit(code, "    pos = from")
    emit(code, "    lastpos = length target")
    emit(code, "    if pos >= 0 goto try_at_pos")
    emit(code, "    pos = 0")
    emit(code, "  try_match:")
    emit(code, "    cutting = 0")
    emit(code, "    if pos > lastpos goto fail_forever")
    $I0 = exists self["firstchars"]
    unless $I0 goto gen_1
    firstchars = self["firstchars"]
    unless firstchars > "" goto gen_1
    $P0 = find_global "Data::Escape", "String"
    firstchars = $P0(firstchars, '"')
    emit(code, "    $S0 = substr target, pos, 1")
    emit(code, "    $I0 = index \"%s\", $S0", firstchars)
    emit(code, "    if $I0 < 0 goto try_again")
  gen_1:
    emit(code, "    from = pos")
    self.emitsub(code, exp1label, "pos", "from", "lastpos", "NOCUT")
    emit(code, "    if cutting == %s goto fail_forever", PGE_CUT_RULE)
    emit(code, "  try_again:")
    emit(code, "    inc pos")
    emit(code, "    goto try_match")
    emit(code, "  try_at_pos:")
    emit(code, "    cutting = 0")
    emit(code, "    from = pos")
    self.emitsub(code, exp1label, "NOCUT")
    emit(code, "  fail_forever:")
    emit(code, "    $P0 = getattribute mob, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P0 = -2")
    emit(code, "    .yield()")
    emit(code, "    goto fail_forever")

    exp1 = self["exp1"]
    exp1.gen(code, exp1label, next)

    emit(code, ".end")
    .return ()
.end

.namespace [ "PGE::Exp::End" ]

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s:", label)
    emit(code, "    $P0 = getattribute mob, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P0 = pos")
    emit(code, "    .yield()")
    emit(code, "    $P0 = -1")
    emit(code, "  fail:")
    emit(code, "    ret")
    .return ()
.end

.namespace [ "PGE::Exp::Literal" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    $S0 = self["literal"]                          # set up firstchars
    $S0 = substr $S0, 0, 1
    self["firstchars"] = $S0
    $I0 = self["min"]                              # if we allow zero reps
    unless $I0 < 1 goto end                        # then add firstchars
    self.firstchars(self, next)                    # of the following exp
  end:
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    emit = find_global "PGE::Exp", "emit"
    $S0 = self."quant"()
    $S1 = self["literal"]
    $P0 = find_global "Data::Escape", "String"
    $S1 = $P0($S1, '"')
    emit(code, "\n  %s:  # literal %s", label, $S0)
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
    .local pmc cname
    .local int subp
    emit = find_global "PGE::Exp", "emit"
    $S0 = self."quant"()
    cname = self["cname"]
    $I0 = isa cname, "Integer"
    unless $I0 goto named
    subp = cname
    emit(code, "\n  %s:  # backref $%s %s", label, subp, $S0)
    emit(code, "    lit = ''")
    emit(code, "    $P0 = getattribute mob, \"PGE::Match\\x0@:capt\"")
    emit(code, "    if_null $P0, %s_1", label)
    emit(code, "    $P1 = $P0[%s]", subp)
    emit(code, "    lit = $P1[-1]")
    emit(code, "  %s_1:", label)
    .return self.genliteral(code, label, next)
  named:
    $P0 = find_global "Data::Escape", "String"
    $S1 = cname
    $S1 = $P0($S1)
    emit(code, "\n  %s:  # backref $<%s> %s", label, $S1, $S0)
    emit(code, "    lit = ''")
    emit(code, "    $P0 = getattribute mob, \"PGE::Match\\x0%:capt\"")
    emit(code, "    if_null $P0, %s_1", label)
    emit(code, "    $P1 = $P0[\"%s\"]", $S1)
    emit(code, "    lit = $P1[-1]")
    emit(code, "  %s_1:", label)
    .return self.genliteral(code, label, next)
.end


.namespace [ "PGE::Exp::Dot" ]

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int min, max, isgreedy, iscut
    (min, max, isgreedy, iscut) = self."_getattributes"()
    emit = find_global "PGE::Exp", "emit"
    $S0 = self."quant"()
    emit(code, "\n  %s: # dot %s", label, $S0)
    emit(code, "    maxrep = length target")
    emit(code, "    maxrep -= pos")
    unless min > 0 goto dot_1
    emit(code, "    if maxrep < %s goto fail", min)
  dot_1:
    unless min == max goto dot_2
    emit(code, "    pos += %s", min)
    emit(code, "    goto %s", next)
    .return ()
  dot_2:
    if max == PGE_INF goto greedy
    emit(code, "    if maxrep <= %s goto %s_1", max, label)
    emit(code, "    maxrep = %s", max)
    emit(code, "  %s_1:", label)
  greedy:
    unless isgreedy goto lazy
    emit(code, "    rep = maxrep")
    emit(code, "    pos += rep")
    emit(code, "  %s_2:", label)
    emit(code, "    if rep < %s goto fail", min)
    unless iscut goto greedy_1
    emit(code, "    goto %s", next)
    .return ()
  greedy_1:
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep")
    emit(code, "    dec rep")
    emit(code, "    dec pos")
    emit(code, "    goto %s_2", label)
    .return ()
  lazy:
    emit(code, "    rep = %s", min)
    emit(code, "    pos += rep", min)
    emit(code, "  %s_3:", label)
    emit(code, "    if rep > maxrep goto fail")
    unless iscut goto lazy_1
    emit(code, "    goto %s", next)
    .return ()
  lazy_1:
    emit(code, "    if rep == maxrep goto %s", next)
    self.emitsub(code, next, "pos", "rep", "maxrep")
    emit(code, "    inc rep")
    emit(code, "    inc pos")
    emit(code, "    goto %s_3", label)
    .return ()
.end

.namespace [ "PGE::Exp::CCShortcut" ]

.sub gen method
    .param pmc code
    .param string label
    .param string next
    .local string token
    .local int min, max, isgreedy, iscut
    .local pmc emit
    .local pmc hash
    .local string test
    (min, max, isgreedy, iscut) = self."_getattributes"()
    hash = find_global "PGE::Exp::CCShortcut", "%slashcode"
    token = self["token"]
    test = hash[token]
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s:", label)
    emit(code, "    rep = 0")
    unless isgreedy goto lazy
    emit(code, "  %s_1:", label)
    emit(code, "    if pos >= lastpos goto %s_f", label)
    emit(code, "    if rep >= %s goto %s_f", max, label)
    emit(code, test, label)
    emit(code, "    inc pos")
    emit(code, "    inc rep")
    emit(code, "    goto %s_1", label)
    emit(code, "  %s_f:", label)
    emit(code, "    if rep < %s goto fail", min)
    unless iscut goto greedy_1
    emit(code, "    goto %s", next)
    .return ()
  greedy_1:
    emit(code, "    if rep == %s goto %s", min, next)
    self.emitsub(code, next, "pos", "rep")
    emit(code, "    dec pos")
    emit(code, "    dec rep")
    emit(code, "    goto %s_f", label)
    .return ()
  lazy:
    emit(code, "  %s_0:", label)
    emit(code, "    if rep < %s goto %s_1", min, label)
    unless iscut goto lazy_1
    emit(code, "    goto %s", next)
    goto lazy_2
  lazy_1:
    emit(code, "    if rep >= %s goto %s", max, next)
    emit(code, "    if pos >= lastpos goto fail")
    self.emitsub(code, next, "pos", "rep")
  lazy_2:
    emit(code, "  %s_1:", label)
    emit(code, test, label)
    emit(code, "    inc rep")
    emit(code, "    inc pos")
    emit(code, "    goto %s_0", label)
    emit(code, "  %s_f:", label)
    emit(code, "    goto fail")
    .return ()
.end

.namespace [ "PGE::Exp::CharClass" ]

# Note:  The implementation interface for CharClass may change
# in the near future, so don't rely on this too heavily just yet.
# (pmichaud, 2005-05-11)

.sub gen method
    .param pmc code
    .param string label
    .param string next
    .local string token
    .local int min, max, isgreedy, iscut
    .local pmc emit
    .local string charclass, charmatch
    (min, max, isgreedy, iscut) = self."_getattributes"()
    emit = find_global "PGE::Exp", "emit"
    $P0 = find_global "Data::Escape", "String"
    charclass = self["charclass"]
    charclass = $P0(charclass, '"')
    charmatch = self["charmatch"]
    emit(code, "\n  %s:", label)
    emit(code, "    rep = 0")
    unless isgreedy goto lazy
    emit(code, "  %s_1:", label)
    emit(code, "    if pos >= lastpos goto %s_2", label)
    emit(code, "    if rep >= %s goto %s_2", max, label)
    emit(code, "    $S0 = substr target, pos, 1")
    emit(code, "    $I0 = index \"%s\", $S0", charclass)
    emit(code, "    %s $I0 == -1 goto %s_2", charmatch, label)
    emit(code, "    inc pos")
    emit(code, "    inc rep")
    emit(code, "    goto %s_1", label)
    emit(code, "  %s_2:", label)
    emit(code, "    if rep < %s goto fail", min)
    unless iscut goto greedy_1
    emit(code, "    goto %s", next)
    .return ()
  greedy_1:
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
    emit(code, "    $I0 = index \"%s\", $S0", charclass)
    emit(code, "    %s $I0 == -1 goto fail", charmatch)
    emit(code, "    inc rep")
    emit(code, "    inc pos")
    emit(code, "    goto %s_0", label)
    .return ()
.end

.namespace [ "PGE::Exp::WS" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    .local string nextfc
    self["firstchars"] = ""
    nextfc = next["firstchars"]
    unless nextfc > "" goto end
    $I1 = length nextfc
    $I0 = find_cclass .CCLASS_WHITESPACE, nextfc, 0, $I1
    unless $I0 == $I1 goto end
    self["iscut"] = 1
  end:
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s: # <?ws>", label)
    emit(code, "    rep = 0")
    emit(code, "    if pos >= lastpos goto %s", next)
    emit(code, "    if pos < 1 goto %s_1", label)
    emit(code, "    $I0 = is_cclass %s, target, pos", .CCLASS_WORD)
    emit(code, "    unless $I0 goto %s_1", label)
    emit(code, "    $I0 = pos - 1")
    emit(code, "    $I1 = is_cclass %s, target, $I0", .CCLASS_WORD)
    emit(code, "    if $I1 goto fail")
    emit(code, "  %s_1:", label)
    emit(code, "    rep = pos")
    emit(code, "    pos = find_not_cclass %s, target, pos, lastpos", .CCLASS_WHITESPACE)
    $I0 = self["iscut"]
    unless $I0 goto backtrack
    emit(code, "    goto %s", next)
    goto end
  backtrack:
    emit(code, "    rep = pos - rep")
    emit(code, "  %s_2:", label)
    emit(code, "    if rep == 0 goto %s", next)
    self.emitsub(code, next, "pos", "rep")
    emit(code, "    dec rep")
    emit(code, "    dec pos")
    emit(code, "    goto %s_2", label)
  end:
    .return ()
.end


.namespace [ "PGE::Exp::Anchor" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    self.firstchars(next)
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local string token
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s:", label)
    token = self["token"]
    if token == "\\b" goto word
    if token == "\\B" goto word
    if token == '$$' goto eos
    if token == '$' goto eos
    emit(code, "    if pos == 0 goto %s", next)
    unless token == '^^' goto end
    emit(code, "    $I0 = pos - 1")
    emit(code, "    $I1 = is_cclass .CCLASS_NEWLINE, target, $I0")
    emit(code, "    if $I1 goto %s", next)
    goto end
  eos:
    emit(code, "    if pos == lastpos goto %s", next)
    unless token == '$$' goto end
    emit(code, "    $I0 = is_cclass .CCLASS_NEWLINE, target, pos")
    emit(code, "    if $I0 goto %s", next)
    goto end
  word:
    emit(code, "    $I0 = 0")
    emit(code, "    unless pos > 0 goto %s_1", label)
    emit(code, "    $I2 = pos - 1")
    emit(code, "    $I0 = is_cclass .CCLASS_WORD, target, $I2")
    emit(code, "  %s_1:", label)
    emit(code, "    $I1 = 0")
    emit(code, "    unless pos < lastpos goto %s_2", label)
    emit(code, "    $I1 = is_cclass .CCLASS_WORD, target, pos")
    emit(code, "  %s_2:", label)
    unless token == "\\b" goto word_1
    emit(code, "    if $I0 != $I1 goto %s", next)
    goto end
  word_1:
    emit(code, "    if $I0 == $I1 goto %s", next)
  end:
    emit(code, "    goto fail")
    .return ()
.end


.namespace [ "PGE::Exp::Concat" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    .local pmc exp1, exp2
    exp2 = self["exp2"]
    exp2.analyze(next, pad)
    exp1 = self["exp1"]
    exp1.analyze(exp2, pad)
    self.firstchars(exp1)
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp1, exp2
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s:", label)
    ($S0, $I0) = self.serno()
    ($S1, $I1) = self.serno()
    exp1 = self["exp1"]
    exp1.gen(code, $S0, $S1)
    exp2 = self["exp2"]
    exp2.gen(code, $S1, next)
    .return ()
.end

.namespace [ "PGE::Exp::Cut" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    .local string token
    token = self["token"]
    $I0 = PGE_CUT_RULE
    if token == ":::" goto cut_1
    $I0 = pad["cutnum"]
  cut_1:
    self["cutnum"] = $I0
    self.firstchars(next)
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local int cutnum
    emit = find_global "PGE::Exp", "emit"
    cutnum = self["cutnum"]
    emit(code, "\n  %s:", label)
    self.emitsub(code, next, "NOCUT")
    emit(code, "    cutting = %s", cutnum)
    emit(code, "    goto fail")
    .return ()
.end

.namespace [ "PGE::Exp::Alt" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    .local pmc exp1, exp2
    .local pmc creps

    $I0 = exists pad["creps"]                      # create creps hash array
    if $I0 goto creps_1                            # if not exists
    $P0 = new Hash
    pad["creps"] = $P0
  creps_1:
    creps = pad["creps"]
    creps = clone creps
    exp1 = self["exp1"]
    exp2 = self["exp2"]
    exp2.analyze(next, pad)
    pad["creps"] = creps
    exp1.analyze(next, pad)
    self.firstchars(exp1, exp2)
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp1, exp2
    emit = find_global "PGE::Exp", "emit"
    emit(code, "\n  %s:", label)
    ($S0, $I0) = self.serno()
    ($S1, $I1) = self.serno()
    self.emitsub(code, $S0, "pos")
    emit(code, "    goto %s", $S1)
    exp1 = self["exp1"]
    exp1.gen(code, $S0, next)
    exp2 = self["exp2"]
    exp2.gen(code, $S1, next)
    .return ()
.end


.namespace [ "PGE::Exp::Group" ]

.sub "analyze" method
    .param pmc next
    .param pmc pad
    .local pmc exp1
    .local int isarray, psave
    .local pmc creps
    .local string cname

    self["firstchars"] = ""                        # no firstchars default
    ($S0, $I0) = self.serno()                      # get a unique group number
    pad["cutnum"] = $I0
    self["cutnum"] = $I0

    $I0 = exists pad["creps"]                      # create creps hash array
    if $I0 goto creps_1                            # if not exists
    $P0 = new Hash
    pad["creps"] = $P0
  creps_1:
    creps = pad["creps"]                           # load creps hash
    $I0 = exists self["cname"]
    unless $I0 goto isarray_0                      # skip if no capture
    $P0 = self["cname"]
    cname = $P0
    $I0 = isa $P0, "Integer"                       # Integer = subpattern cap
    if $I0 goto creps_2
    cname = concat "%", cname
  creps_2:
    $I0 = exists creps[cname]                      # have seen capture name?
    unless $I0 goto creps_3                        #
    $P0 = creps[cname]                             # yes, so prev is now
    $P0["isarray"] = 1                             # an array capture
    self["isarray"] = 1                            # and so is self
  creps_3:
    creps[cname] = self                            # mark us for future ref

  isarray_0:
    psave = pad["isarray"]                         # get current isarray status
    isarray = self["isarray"]                      # combine with group's
    isarray |= psave                               #
    self["isarray"] = isarray                      # and pass to nested
    pad["isarray"] = isarray
    $I0 = self["cscope"]                           # new scope resets
    unless $I0 goto isarray_1                      # array status
    pad["isarray"] = 0
    isarray = 0                                    # each capt obj is single
    delete pad["creps"]                            # new lexical name scope
  isarray_1:
    $I0 = defined self["exp1"]
    unless $I0 goto end
    exp1 = self["exp1"]
    exp1.analyze(next, pad)
    pad["isarray"] = psave

  fc:
    $I0 = self["min"]                              # set up firstchars
    if $I0 > 0 goto fc_2
    self.firstchars(exp1, next)
    goto end
  fc_2:
    self.firstchars(exp1)
  end:
    pad["creps"] = creps
    .return ()
.end

.sub "gen" method
    .param pmc code
    .param string label
    .param string next
    .local pmc emit
    .local pmc exp1
    .local int min, max, isgreedy, iscut, iscapture, isarray, issubrule, cscope
    .local int cutnum
    .local string rname, captname, captsave, captback
    .local string exp1label, exp1next
    .local string replabel
    emit = find_global "PGE::Exp", "emit"
    (min, max, isgreedy, iscut) = self."_getattributes"()
    (exp1label, $I0) = self.serno()
    cutnum = self["cutnum"]
    iscapture = defined self["cname"]
    isarray = self["isarray"]
    rname = self["rname"]
    cscope = self["cscope"]
    issubrule = exists self["rname"]
    $P0 = self["cname"]
    captname = $P0
    $I0 = isa $P0, "Integer"
    if $I0 goto captarray
    $P1 = find_global "Data::Escape", "String"
    captname = $P1(captname, '"')
    captname = concat '"', captname
    captname = concat captname, '"'

  captarray:
    captsave = ""
    captback = ""
    emit(code, "\n  %s:", label)
    if iscapture == 0 goto subrule
    captsave = "    $P1[%s] = $P0"
    captback = "    delete $P1[%s]"
    if isarray == 0 goto subrule
    captsave = "    $P1 = $P1[%s]\n    push $P1, $P0"
    captback = "    $P1 = pop $P1"
    emit(code, "    $I0 = defined captscope[%s]", captname)
    emit(code, "    if $I0 goto %s_c1", label)
    emit(code, "    $P0 = new PerlArray")
    emit(code, "    captscope[%s] = $P0", captname)
    emit(code, "    save captscope")
    emit(code, "    bsr %s_c1", label)
    emit(code, "    restore captscope")
    emit(code, "    delete captscope[%s]", captname)
    emit(code, "    goto fail")
    emit(code, "  %s_c1:", label)
   
  subrule:
    if issubrule == 0 goto init
    $I0 = 0
  subrule_1:
    $I1 = index rname, "::", $I0
    if $I1 == -1 goto subrule_2
    $I0 = $I1 + 2
    goto subrule_1
  subrule_2:
    if $I0 == 0 goto subrule_simple_name
    $S1 = substr rname, $I0                         # get rule name
    $I0 -= 2
    $S0 = substr rname, 0, $I0                      # get grammar name
    emit(code, "    $P0 = find_global \"%s\", \"%s\"", $S0, $S1)
    emit(code, "    rcache[\"%s\"] = $P0", rname)
    emit(code, "    $P1 = find_global \"PGE::Match\", \"newfrom\"")
    emit(code, "    $P1 = $P1(mob, pos, \"%s\")", $S0)
    goto init
  subrule_simple_name:
    emit(code, "    $I0 = can mob, \"%s\"", rname)
    emit(code, "    if $I0 goto %s_s1", label)
    emit(code, "    $P0 = find_global \"%s\"", rname)
    emit(code, "    goto %s_s2", label)
    emit(code, "  %s_s1:", label)
    emit(code, "    $P0 = find_method mob, \"%s\"", rname)
    emit(code, "  %s_s2:", label)
    emit(code, "    rcache[\"%s\"] = $P0", rname)
    emit(code, "    $P1 = mob")
    
  init:
    emit(code, "    push gpad, captscope")
    emit(code, "    push gpad, $P1")
    emit(code, "    push gpad, 0")
    replabel = concat label, "_rep"
    emit(code, "    bsr %s", replabel)
    emit(code, "    $I0 = pop gpad")
    emit(code, "    $P0 = pop gpad")
    emit(code, "    $P0 = pop gpad")
    emit(code, "    if cutting != %s goto fail", cutnum)
    emit(code, "    cutting = 0")
    emit(code, "    goto fail")

  rep:
    emit(code, "  %s:", replabel)
    emit(code, "    rep = gpad[-1]")
    if isgreedy == 0 goto lazy
    emit(code, "    if rep >= %s goto %s_g1", max, label)
    emit(code, "    inc rep")
    emit(code, "    gpad[-1] = rep")
    emit(code, "    captscope = gpad[-3]")
    $S0 = concat label, "_exp1"
    self.emitsub(code, $S0, "rep", "pos")
    emit(code, "    dec rep")
    emit(code, "  %s_g1:", label)
    emit(code, "    if rep < %s goto fail", min)
    goto trynext
  lazy:
    emit(code, "    if rep < %s goto %s_l1", min, label)
    $S0 = concat label, "_next"
    self.emitsub(code, $S0, "rep", "pos")
    emit(code, "  %s_l1:", label)
    emit(code, "    if rep >= %s goto fail", max)
    emit(code, "    inc rep")
    emit(code, "    gpad[-1] = rep")
    emit(code, "    captscope = gpad[-3]")
    emit(code, "    goto %s_exp1", label)

  trynext:
    emit(code, "  %s_next:", label) 
    emit(code, "    $I0 = pop gpad")
    emit(code, "    $P0 = pop gpad")
    emit(code, "    captscope = pop gpad")
    self.emitsub(code, next, "rep", "$P0", "captscope", "NOCUT")
    emit(code, "    push gpad, captscope")
    emit(code, "    push gpad, $P0")
    emit(code, "    push gpad, rep")
    if iscut == 0 goto trynext_1
    emit(code, "    cutting = %s", cutnum)
  trynext_1:
    emit(code, "    goto fail")

  tryexp1:
    emit(code, "  %s_exp1:", label)
    if issubrule goto trysubr
    if iscapture goto trysubp
    exp1next = replabel
    goto trysubp_2
  trysubp:  
    exp1next = concat label, "_subp"
    emit(code, "    $P1 = captscope")
    emit(code, "    $P0 = find_global \"PGE::Match\", \"newfrom\"")
    emit(code, "    $P0 = $P0($P1, pos)")
    emit(code, "    gpad[-2] = $P0")
    emit(code, "    save captscope")
    if cscope == 0 goto trysubp_1
    emit(code, "    captscope = $P0")
  trysubp_1:
    emit(code, captsave, captname)
    self.emitsub(code, exp1label, "$P1", "NOCUT")
    emit(code, captback, captname)
    emit(code, "    restore captscope")
    emit(code, "    goto fail")
    emit(code, "  %s:", exp1next)
    emit(code, "    $P0 = gpad[-2]")
    emit(code, "    $P0 = getattribute $P0, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P0 = pos")
    emit(code, "    goto %s", replabel)
  trysubp_2:
    exp1 = self["exp1"]
    exp1.gen(code, exp1label, exp1next)
    goto end

  trysubr:
    emit(code, "    $P1 = gpad[-2]")
    emit(code, "    $P0 = getattribute $P1, \"PGE::Match\\x0$:pos\"")
    emit(code, "    $P0 = pos")
    emit(code, "    $P0 = rcache[\"%s\"]", rname)
    emit(code, "    $P0 = $P0($P1)")
    emit(code, "    unless $P0 goto fail")
    emit(code, "    $P1 = captscope")
    emit(code, captsave, captname)
    emit(code, "  %s_sr3:", label)
    emit(code, "    pos = $P0.to()")
    self.emitsub(code, replabel, "$P0", "$P1", "NOCUT")
    emit(code, "    $P0.next()")
    emit(code, "    if $P0 goto %s_sr3", label)
    emit(code, captback, captname)
    emit(code, "    goto fail")

  end:
.end
  
