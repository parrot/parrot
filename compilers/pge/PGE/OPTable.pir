=head1 Title

PGE::OPTable - PGE operator precedence table and parser

=cut

.namespace [ "PGE::OPTable" ]

.const int PGE_OPTABLE_ARITY         = 0x0003
.const int PGE_OPTABLE_ASSOC_RIGHT   = 0x0004
.const int PGE_OPTABLE_NOWS          = 0x1000
.const int PGE_OPTABLE_NULLTERM      = 0x2000

.const int PGE_OPTABLE_EXPECT        = 0x00f0
.const int PGE_OPTABLE_EXPECT_TERM   = 0x0010
.const int PGE_OPTABLE_EXPECT_OPER   = 0x0060
.const int PGE_OPTABLE_EXPECT_TERMPOST = 0x0050

.const int PGE_OPTABLE_SYNCAT        = 0x0f00

.const int PGE_OPTABLE_EMPTY         = 0x0000
.const int PGE_OPTABLE_TERM          = 0x0100
.const int PGE_OPTABLE_POSTFIX       = 0x0200
.const int PGE_OPTABLE_CLOSE         = 0x0300
.const int PGE_OPTABLE_PREFIX        = 0x0400
.const int PGE_OPTABLE_PRELIST       = 0x0500
.const int PGE_OPTABLE_INFIX         = 0x0600
.const int PGE_OPTABLE_TERNARY       = 0x0700
.const int PGE_OPTABLE_POSTCIRCUMFIX = 0x0800
.const int PGE_OPTABLE_CIRCUMFIX     = 0x0900

.include "cclass.pasm"

.sub "__onload" :load
    .local pmc base
    .local pmc sctable
    .local pmc closetoken
    base = newclass "PGE::OPTable"
    addattribute base, "%!token"
    addattribute base, "%!key"
    addattribute base, "%!klen"
    addattribute base, "&!ws"
    sctable = new .Hash
    sctable["term:"]          = 0x0110
    sctable["postfix:"]       = 0x0221
    sctable["close:"]         = 0x0320
    sctable["prefix:"]        = 0x0411
    sctable["prelist:"]       = 0x0511
    sctable["infix:"]         = 0x0622
    sctable["ternary:"]       = 0x0723
    sctable["postcircumfix:"] = 0x0842
    sctable["circumfix:"]     = 0x0911
    store_global "PGE::OPTable", "%!sctable", sctable
    closetoken = new .Hash
    closetoken["equiv"] = ""
    closetoken["mode"] = 0x0320
    store_global "PGE::OPTable", "%!closetoken", closetoken
    .return ()
.end

.sub "__init" :method
    .local pmc tokentable, keytable, klentable
    tokentable = new .Hash
    keytable = new .Hash
    klentable = new .Hash
    setattribute self, "PGE::OPTable\x0%!token", tokentable
    setattribute self, "PGE::OPTable\x0%!key", keytable
    setattribute self, "PGE::OPTable\x0%!klen", klentable
.end


.sub "addtok" :method
    .param string name
    .param string rel          :optional
    .param int has_rel         :opt_flag
    .param string opts         :optional
    .param int has_opts        :opt_flag
    .param pmc match           :optional
    .param int has_match       :opt_flag
    .local pmc tokentable
    .local string equiv
    tokentable = getattribute self, "PGE::OPTable\x0%!token"

    if has_match goto args_1
    match = new .String
    match = "PGE::Match"

  args_1:
    if has_opts goto set_equiv
    opts = "left"

  set_equiv:
    equiv = "="
    if has_rel == 0 goto add_token
    if rel == "" goto add_token
    $I0 = exists tokentable[rel]
    if $I0 == 0 goto set_equiv_1
    $P0 = tokentable[rel]
    equiv = $P0["equiv"]
    goto add_token
  set_equiv_1:
    $S0 = substr rel, 1
    $I0 = exists tokentable[$S0]
    if $I0 == 0 goto set_equiv_2
    $P0 = tokentable[$S0]
    equiv = $P0["equiv"]
    equiv = clone equiv
    $S0 = substr rel, 0, 1
    substr equiv, -1, 0, $S0
    goto add_token
  set_equiv_2:
    equiv = rel

  add_token:
    .local pmc token   
    .local string syncat, key, key_close
    $I0 = index name, ":"
    inc $I0
    syncat = substr name, 0, $I0
    key = substr name, $I0

    $I0 = exists tokentable[name]
    if $I0 goto end
    token = new .Hash
    tokentable[name] = token
    token["name"] = name
    token["match"] = match
    token["equiv"] = equiv

    $I0 = index key, " "
    if $I0 < 0 goto add_key
    $I1 = $I0 + 1
    key_close = substr key, $I1
    key = substr key, 0, $I0
    token["key_close"] = key_close
    $S0 = concat "close:", key_close
    self."addtok"($S0, name)

  add_key:
    .local pmc keytable, klentable
    keytable = getattribute self, "PGE::OPTable\x0%!key"
    klentable = getattribute self, "PGE::OPTable\x0%!klen"
    $I1 = length key
    $S0 = substr key, 0, 1
    $I0 = klentable[$S0]
    if $I0 >= $I1 goto add_key_1
    klentable[$S0] = $I1
  add_key_1:
    $I0 = exists keytable[key]
    if $I0 goto add_key_array
    keytable[key] = token
    goto end
  add_key_array:
    $P0 = keytable[key]
    $I0 = does $P0, "array"
    if $I0 goto add_key_array_2
    $P1 = new .ResizablePMCArray
    push $P1, $P0
    push $P1, token
    keytable[key] = $P1
    goto end
  add_key_array_2:
    push $P0, token

  end:
    .local pmc sctable
    .local int mode
    token = tokentable[name]

    sctable = find_global "PGE::OPTable", "%!sctable"
    mode = sctable[syncat]

    $I0 = index opts, "right"
    if $I0 < 0 goto mode_1
    mode = mode | PGE_OPTABLE_ASSOC_RIGHT
  mode_1:
    $I0 = index opts, "nows"
    if $I0 < 0 goto mode_2
    mode = mode | PGE_OPTABLE_NOWS
  mode_2:
    $I0 = index opts, "nullterm"
    if $I0 < 0 goto mode_3
    mode = mode | PGE_OPTABLE_NULLTERM
  mode_3:
    token["mode"] = mode
    .return()
.end


.sub "parse" :method
    .param pmc mob
    .local pmc tokentable, keytable, klentable
    .local pmc tokenstack, operstack, termstack
    .local pmc newfrom
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos, wspos
    .local int expect, nows
    .local pmc ws
    .local string key 
    .local pmc token, top, oper
    .local pmc iter
    .local int tokenmode, topmode
    .local int tokencat, topcat
    .local int arity
    .local pmc match
    .local int lastcat

    tokentable = getattribute self, "PGE::OPTable\x0%!token"
    keytable = getattribute self, "PGE::OPTable\x0%!key"
    klentable = getattribute self, "PGE::OPTable\x0%!klen"
    ws = getattribute self, "PGE::OPTable\x0&!ws"
    tokenstack = new .ResizablePMCArray
    operstack = new .ResizablePMCArray
    termstack = new .ResizablePMCArray

    newfrom = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = newfrom(mob, 0)
    pos = mfrom
    lastpos = length target
    lastcat = PGE_OPTABLE_EMPTY

  expect_term:
    expect = PGE_OPTABLE_EXPECT_TERM
    goto token_next

  expect_termpost:
    expect = PGE_OPTABLE_EXPECT_TERMPOST
    goto token_next

  expect_oper:
    expect = PGE_OPTABLE_EXPECT_OPER

  token_next:
    ## Figure out what we're looking for
    wspos = pos
    if pos >= lastpos goto oper_not_found
    if_null ws, token_next_ws
    mpos = pos
    $P0 = ws(mob)
    pos = $P0.to()
    goto token_next_1
  token_next_ws:
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
  token_next_1:
    nows = 0
    if pos == wspos goto key_search
    nows = PGE_OPTABLE_NOWS

  key_search:
    key = substr target, pos, 1
    $I0 = klentable[key]
    key = substr target, pos, $I0
  key_loop:
    $I0 = exists keytable[key]
    if $I0 == 0 goto key_next
    token = keytable[key]
    $I0 = does token, "array"
    if $I0 goto key_array
    bsr token_match
    if_null oper, key_next
    if oper goto oper_found
    goto key_next
  key_array:
    iter = new .Iterator, token
    iter = 0
  key_array_1:
    unless iter goto key_next
    token = shift iter
    bsr token_match
    if_null oper, key_array_1
    if oper goto oper_found
    goto key_array_1
  key_next:
    if key == '' goto token_nows
    chopn key, 1
    goto key_loop
  token_nows:
    if pos == wspos goto oper_not_found
    pos = wspos
    nows = 0
    goto key_search

  oper_not_found:
    $I0 = expect & PGE_OPTABLE_EXPECT_TERM
    if $I0 == 0 goto end
    (oper, $S0, $P0, $P1) = newfrom(mob, pos, "PGE::Match")
    push termstack, oper
    unless tokenstack goto end
    top = tokenstack[-1]
    topmode = top["mode"]
    $I0 = topmode & PGE_OPTABLE_NULLTERM
    if $I0 == 0 goto end
    $P1 = pos
    goto expect_oper

  oper_found:
    tokenmode = token["mode"]
    tokencat = tokenmode & PGE_OPTABLE_SYNCAT
    if lastcat != PGE_OPTABLE_PRELIST goto oper_found_1
    if tokencat != PGE_OPTABLE_POSTCIRCUMFIX goto oper_found_1
    $P0 = pop tokenstack
    $P0 = pop operstack
    push termstack, $P0
  oper_found_1:
    lastcat = tokencat
    if tokencat == PGE_OPTABLE_TERM goto term_shift
    if tokencat == PGE_OPTABLE_PREFIX goto oper_shift          # (S1)
    if tokencat == PGE_OPTABLE_CIRCUMFIX goto oper_shift       # (S2)

    ## Check that we already have a term
    $I0 = elements termstack                                 
    if $I0 > 0 goto shift_reduce
    if tokencat != PGE_OPTABLE_PRELIST goto end

  ## The shift/reduce loop
  shift_reduce:
    ## If the token stack is empty, shift
    $I0 = elements tokenstack
    if $I0 > 0 goto shift_reduce_1
    if tokencat == PGE_OPTABLE_CLOSE goto end                  # (E3)
    topcat = PGE_OPTABLE_EMPTY
    goto oper_shift                                            # (S3)
  shift_reduce_1:
    ## Compare with token at top of stack
    top = tokenstack[-1]
    topmode = top["mode"]
    topcat = topmode & PGE_OPTABLE_SYNCAT
    if topcat == PGE_OPTABLE_POSTFIX goto oper_reduce          # (R4)
    if tokencat == PGE_OPTABLE_CLOSE goto oper_close           # (R5, C5)
    if topcat >= PGE_OPTABLE_POSTCIRCUMFIX goto oper_shift     # (S6)
    ## Check operator precedence
    $P0 = token["equiv"]
    $P1 = top["equiv"]
    if $P0 > $P1 goto oper_shift                               # (P)
    if topcat != PGE_OPTABLE_TERNARY goto shift_reduce_2
    if tokencat != PGE_OPTABLE_TERNARY goto err_ternary        # (P/E)
    goto oper_shift
  shift_reduce_2:
    if $P0 < $P1 goto oper_reduce
    $I0 = topmode & PGE_OPTABLE_ASSOC_RIGHT                    
    if $I0 goto oper_shift                                     # (P/A)

  oper_reduce:
    bsr reduce
    goto shift_reduce

  oper_close:
    if topcat < PGE_OPTABLE_TERNARY goto oper_reduce           # (R5)
    $S0 = top["key_close"]
    if key != $S0 goto end                                     # (C5)

  oper_shift:
    push tokenstack, token
    push operstack, oper
    pos = oper.to()
    if tokencat == PGE_OPTABLE_PRELIST goto expect_termpost
    if tokencat >= PGE_OPTABLE_PREFIX goto expect_term
    if tokencat == PGE_OPTABLE_POSTFIX goto expect_oper
    if topcat == PGE_OPTABLE_TERNARY goto expect_term
    goto expect_oper

  term_shift:
    push termstack, oper
    pos = oper.to()
    goto expect_oper

  ## reduce top operation on stack
  reduce:
    $P0 = pop tokenstack
    topmode = $P0["mode"]
    topcat = topmode & PGE_OPTABLE_SYNCAT
    if topcat != PGE_OPTABLE_CLOSE goto reduce_1
    $P0 = pop tokenstack
    $P1 = pop operstack
  reduce_1:
    $P1 = pop operstack
    topmode = $P0["mode"]
    arity = topmode & PGE_OPTABLE_ARITY
  reduce_args:
    if arity < 1 goto reduce_saveterm
    $P2 = pop termstack
    dec arity
    unless $P2 goto reduce_backtrack
    $P1[arity] = $P2
    goto reduce_args
  reduce_backtrack:
    wspos = $P1.from()
    if arity > 0 goto reduce_end
    push termstack, $P2
    goto reduce_end
  reduce_saveterm:
    push termstack, $P1
  reduce_end:
    ret

  token_match:
    mpos = pos
    null oper
    tokenmode = token["mode"]
    $I0 = tokenmode & expect
    if $I0 == 0 goto token_match_end
    $I0 = tokenmode & nows
    if $I0 goto token_match_end
    match = token["match"]
    $I0 = isa match, "Sub"
    if $I0 goto token_match_sub
    (oper, $P99, $P99, $P0) = newfrom(mob, pos, match)
    $I0 = length key
    $I0 += pos
    $P0 = $I0
    goto token_match_success
  token_match_sub:
    oper = match(mob)
  token_match_success:
    $P0 = token["name"]
    $P0 = clone $P0
    oper["type"] = $P0
  token_match_end:
    ret

  ## At end, reduce any remaining tokens and return result term
  end:
    $I0 = elements tokenstack
    if $I0 < 1 goto end_1
    bsr reduce
    goto end
  end_1:
    $I0 = elements termstack
    if $I0 < 1 goto end_2
    $P0 = pop termstack
    unless $P0 goto end_2
    mob["expr"] = $P0
    mpos = wspos
    .return (mob)
  end_2:
    mpos = -1
    .return (mob)

  err_ternary:
    print "Ternary error\n"
    end
.end


#  stack                               Current token
#  -------    -----------------------------------------------------------------
#             postfix  close  prefix  prelist  infix  ternary  postcir  circfix
#  empty        S3      E3      S1      S3      S3      S3       S3       S2
#  postfix      R4      R4      X       R4      R4      R4       R4       X
#  close        P       R5      S1      P       P       P        P        P2
#  prefix       P       R5      S1      P       P       P        P        S2
#  prelist              R5      S1                                        S2
#  infix        P       R5      S1      P       P/A     P        P        S2
#  ternary      P/E     C5      S1      P/E     P/E     P/A      P/E      S2
#  postcir      S6      C5      S1      S6      S6      S6       S6       S2
#  circfix      S6      C5      S1      S6      S6      S6       S6       S2

