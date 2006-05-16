# $Id$

=head1 Title

PGE::OPTable - PGE operator precedence table and parser

=head1 Methods

=over 4

=cut

.namespace [ "PGE::OPTable" ]

.const int PGE_OPTABLE_EXPECT_TERM   = 0x01
.const int PGE_OPTABLE_EXPECT_OPER   = 0x02
.const int PGE_OPTABLE_EXPECT_START  = 0x05

.const int PGE_OPTABLE_EMPTY         = 0x00
.const int PGE_OPTABLE_TERM          = 0x10
.const int PGE_OPTABLE_POSTFIX       = 0x20
.const int PGE_OPTABLE_CLOSE         = 0x30
.const int PGE_OPTABLE_PREFIX        = 0x40
.const int PGE_OPTABLE_PRELIST       = 0x50
.const int PGE_OPTABLE_INFIX         = 0x60
.const int PGE_OPTABLE_TERNARY       = 0x70
.const int PGE_OPTABLE_POSTCIRCUMFIX = 0x80
.const int PGE_OPTABLE_CIRCUMFIX     = 0x90

.const int PGE_OPTABLE_STOP_SUB      = -1

.include "cclass.pasm"

.sub '__onload' :load
    .local pmc base
    .local pmc sctable
    $P0 = getclass "Hash"
    base = subclass $P0, 'PGE::OPTable'
    addattribute base, '%!key'
    addattribute base, '%!klen'
    addattribute base, '&!ws'
    sctable = new .Hash
    store_global '%!sctable', sctable

    'sctable'('term:', 'syncat'=>PGE_OPTABLE_TERM, 'expect'=>0x0201)
    'sctable'('postfix:', 'syncat'=>PGE_OPTABLE_POSTFIX, 'expect'=>0x0202, 'arity'=>1)
    'sctable'('close:', 'syncat'=>PGE_OPTABLE_CLOSE, 'expect'=>0x0202)
    'sctable'('prefix:', 'syncat'=>PGE_OPTABLE_PREFIX, 'expect'=>0x0101, 'arity'=>1)
    'sctable'('infix:', 'syncat'=>PGE_OPTABLE_INFIX, 'expect'=>0x0102, 'arity'=>2)
    'sctable'('ternary:', 'syncat'=>PGE_OPTABLE_TERNARY, 'expect'=>0x0102, 'expectclose'=>0x0102, 'arity'=>3)
    'sctable'('postcircumfix:', 'syncat'=>PGE_OPTABLE_POSTCIRCUMFIX, 'expect'=>0x0102, 'arity'=>2)
    'sctable'('circumfix:', 'syncat'=>PGE_OPTABLE_CIRCUMFIX, 'expect'=>0x0101, 'arity'=>1)
    .return ()
.end

=item C<syncat(string name, adverbs :slurpy :named)

Adds (or replaces) a syntactic category's defaults.

=cut

.sub 'sctable'
    .param string name
    .param pmc adverbs         :slurpy :named
    .local pmc sctable
    sctable = find_global '%!sctable'
    unless null adverbs goto with_adverbs
    adverbs = new .Hash
  with_adverbs:
    sctable[name] = adverbs
    .return (adverbs)
.end


.sub "__init" :method
    .local pmc tokentable, keytable, klentable
    tokentable = self
    keytable = new .Hash
    klentable = new .Hash
    setattribute self, "PGE::OPTable\x0%!key", keytable
    setattribute self, "PGE::OPTable\x0%!klen", klentable
.end


.sub 'newtok' :method
    .param string name
    .param pmc args            :slurpy :named

    .local string syncat, key
    $I0 = index name, ':'
    inc $I0
    syncat = substr name, 0, $I0
    key = substr name, $I0

    .local pmc sctable, token
    sctable = find_global "PGE::OPTable", "%!sctable"
    $I0 = exists sctable[syncat]
    if $I0 == 0 goto token_hash
    token = sctable[syncat]
    token = clone token
    goto with_token
  token_hash:
    token = new .Hash
  with_token:
    token['name'] = name

    # we don't replace existing tokens
    .local pmc tokentable
    tokentable = self
    $I0 = exists tokentable[name]
    if $I0 goto end
    tokentable[name] = token

    $P0 = new .Iterator, args
  args_loop:
    unless $P0 goto args_end
    $P1 = shift $P0
    $P2 = $P0[$P1]
    token[$P1] = $P2
    goto args_loop
  args_end:
    
    $S0 = token['match']
    if $S0 > '' goto with_match
    token['match'] = 'PGE::Match'
  with_match:

    $S0 = token['equiv']
    unless $S0 goto with_equiv
    $S1 = tokentable[$S0;'precedence']
    token['precedence'] = $S1
    $S1 = tokentable[$S0;'assoc']
    token['assoc'] = $S1
  with_equiv:

    $S0 = token['looser']
    unless $S0 goto with_looser
    $S0 = tokentable[$S0;'precedence']
    $S0 = clone $S0
    substr $S0, -1, 0, '<'
    token['precedence'] = $S0
  with_looser:

    $S0 = token['tighter']
    unless $S0 goto with_tighter
    $S0 = tokentable[$S0;'precedence']
    $S0 = clone $S0
    substr $S0, -1, 0, '>'
    token['precedence'] = $S0
  with_tighter:

    $I0 = exists token['precclose']
    if $I0 goto with_precclose
    $P0 = token['precedence']
    token['precclose'] = $P0
  with_precclose:
    
    .local string keyclose
    $I0 = index key, ' '
    if $I0 < 0 goto with_close
    $I1 = $I0 + 1
    keyclose = substr key, $I1
    key = substr key, 0, $I0
    token['keyclose'] = keyclose
    $S0 = concat 'close:', keyclose
    $I0 = token['expectclose']
    if $I0 goto with_expectclose
    $I0 = 0x0202
  with_expectclose:
    self.'newtok'($S0, 'equiv' => name, 'expect'=>$I0)
  with_close:

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
    goto add_key_end
  add_key_array:
    $P0 = keytable[key]
    $I0 = does $P0, 'array'
    if $I0 goto add_key_array_2
    $P1 = new .ResizablePMCArray
    push $P1, $P0
    push $P1, token
    keytable[key] = $P1
    goto add_key_end
  add_key_array_2:
    push $P0, token
  add_key_end:

    .local string assoc
    assoc = token['assoc']
    if assoc > '' goto with_assoc
    token['assoc'] = 'left'
  with_assoc:

  end:
    .return (token)
.end
    

.sub 'parse' :method
    .param pmc mob
    .param pmc adverbs         :slurpy :named
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
    .local int tokencat, topcat
    .local int circumnest

    tokentable = self
    keytable = getattribute self, "PGE::OPTable\x0%!key"
    klentable = getattribute self, "PGE::OPTable\x0%!klen"

    unless null adverbs goto with_adverbs
    adverbs = new .Hash
  with_adverbs:

    ##   see if we have a 'stop' adverb.  If so, then it is either
    ##   a string to be matched directly or a sub(rule) to be called 
    ##   to check for a match.
    .local int has_stop, has_stop_nows
    .local string stop_str
    .local pmc stop
    has_stop = 0
    $I0 = exists adverbs['stop']
    if $I0 == 0 goto with_stop
    stop = adverbs['stop']
    has_stop = PGE_OPTABLE_STOP_SUB
    $I0 = isa stop, 'Sub'
    if $I0 goto with_stop
    stop_str = stop
    $S0 = substr stop_str, 0, 1
    if $S0 != ' ' goto stop_str_nows
    stop_str = substr stop_str, 1
    has_stop = length stop_str
    has_stop_nows = 0
    goto with_stop
  stop_str_nows:
    has_stop = length stop_str
    has_stop_nows = 1
  with_stop:

    ## if we have a 'tighter' adverb, set
    ## tighter to the precedence of the op specified
    .local string tighter
    tighter = adverbs['tighter']
    $I0 = exists tokentable[tighter]
    if $I0 == 0 goto with_tighter
    token = tokentable[tighter]
    tighter = token['precedence']
  with_tighter:

    ws = getattribute self, "PGE::OPTable\x0&!ws"
    tokenstack = new .ResizablePMCArray
    operstack = new .ResizablePMCArray
    termstack = new .ResizablePMCArray

    newfrom = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = newfrom(mob, 0)
    pos = mfrom
    lastpos = length target
    circumnest = 0
    expect = PGE_OPTABLE_EXPECT_START

  token_next:
    ##   figure out what we're looking for
    ##   if we're at the end of the string, end match
    wspos = pos
    if pos >= lastpos goto oper_not_found
    ##   check for leading whitespace -- it may limit token candidates
    if null ws goto token_next_ws
    mpos = pos
    $P0 = ws(mob)
    unless $P0 goto token_next_1
    pos = $P0.to()
    goto token_next_1
  token_next_ws:
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
  token_next_1:
    ##   "nows" tokens are eligible if we don't have leading ws
    nows = isne pos, wspos

  check_stop:
    ##  Check for a stop pattern or string.  But don't check
    ##  if we're in a circumfix.
    if circumnest > 0 goto key_search
    if has_stop == 0 goto key_search
    if has_stop == PGE_OPTABLE_STOP_SUB goto check_stop_sub
    $I0 = has_stop_nows & nows
    if $I0 goto key_search
    $S0 = substr target, pos, has_stop
    if $S0 == stop_str goto oper_not_found
    goto key_search
  check_stop_sub:
    mpos = wspos
    $P0 = stop(mob)
    if $P0 goto oper_not_found

  ## look through eligible tokens to find longest match
  key_search:
    ##   use the next character of input stream to limit search
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
    ##   try again, with the whitespace operators this time
    pos = wspos
    nows = 0
    goto check_stop

  oper_not_found:
    ##   we were unable to find a valid token for the current expect state
    ##   if we're not expecting a term, then end the match here
    $I0 = expect & PGE_OPTABLE_EXPECT_TERM
    if $I0 == 0 goto end
    ##   otherwise, let's add a "dummy" term to the stack for reduction
    (oper, $S0, $P0, $P1) = newfrom(mob, pos, "PGE::Match")
    push termstack, oper
    ##   if the current operator doesn't allow nullterm, end match
    unless tokenstack goto end
    top = tokenstack[-1]
    $I0 = top['nullterm']
    if $I0 == 0 goto end
    ##   it's a nullterm operator, so we can continue parsing
    $P1 = pos
    expect = PGE_OPTABLE_EXPECT_OPER
    goto token_next

  oper_found:
    ##   tighter: if we have an insufficiently tight token, 
    ##   treat it as not found.
    if circumnest > 0 goto oper_found_1
    $S0 = token['precedence']
    if $S0 <= tighter goto oper_not_found
  oper_found_1:
    tokencat = token['syncat']
    ##   this section processes according to the
    ##   table at the end of this function
    if tokencat == PGE_OPTABLE_TERM goto term_shift
    if tokencat == PGE_OPTABLE_PREFIX goto oper_shift          # (S1)
    if tokencat == PGE_OPTABLE_CIRCUMFIX goto oper_shift       # (S2)

    $I0 = elements termstack                                 
    if $I0 > 0 goto shift_reduce
    if tokencat != PGE_OPTABLE_PRELIST goto end

  ## The shift/reduce loop
  shift_reduce:
    $I0 = elements tokenstack
    if $I0 > 0 goto shift_reduce_1
    if tokencat == PGE_OPTABLE_CLOSE goto end                  # (E3)
    topcat = PGE_OPTABLE_EMPTY
    goto oper_shift                                            # (S3)
  shift_reduce_1:
    top = tokenstack[-1]
    topcat = top['syncat']
    if topcat == PGE_OPTABLE_POSTFIX goto oper_reduce          # (R4)
    if tokencat == PGE_OPTABLE_CLOSE goto oper_close           # (R5, C5)
    if topcat >= PGE_OPTABLE_POSTCIRCUMFIX goto oper_shift     # (S6)
    $P0 = token['precedence']
    $P1 = top['precclose']
    if $P0 > $P1 goto oper_shift                               # (P)
    if topcat != PGE_OPTABLE_TERNARY goto shift_reduce_2
    if tokencat != PGE_OPTABLE_TERNARY goto err_ternary        # (P/E)
    goto oper_shift
  shift_reduce_2:
    if $P0 < $P1 goto oper_reduce
    $P2 = top['assoc']
    if $P2 == 'right' goto oper_shift                          # (P/A)

  oper_reduce:
    bsr reduce
    goto shift_reduce

  oper_close:
    ##   if the top operator isn't a circumfix, reduce it
    ##   if the close token doesn't match circumfix close, end here
    ##   else shift (fall-through)
    if topcat < PGE_OPTABLE_TERNARY goto oper_reduce           # (R5)
    $S0 = top['keyclose']
    if key != $S0 goto end
    dec circumnest

  oper_shift:
    ##   shift operator onto the operator stack
    push tokenstack, token
    push operstack, oper
    pos = oper.to()
    ##   for circumfix ops, increase the circumfix nesting level
    $I0 = isgt tokencat, PGE_OPTABLE_POSTCIRCUMFIX
    circumnest += $I0
    expect = token['expect']
    expect = shr expect, 8
    goto token_next

  term_shift:
    push termstack, oper
    pos = oper.to()
    expect = token['expect']
    expect = shr expect, 8
    goto token_next

  ## reduce top operation on stack
  reduce:
    top = pop tokenstack
    $P1 = pop operstack
    topcat = top['syncat']
    if topcat == PGE_OPTABLE_CLOSE goto reduce_close
    if topcat < PGE_OPTABLE_POSTCIRCUMFIX goto reduce_normal
    ##   we have an unbalanced open, so error.  remove the
    ##   incomplete circumfixed term, and for circumfix: opers 
    ##   put a failed nullterm onto the termstack
    wspos = -1
    $P0 = pop termstack
    if topcat != PGE_OPTABLE_CIRCUMFIX goto reduce_end
    (oper, $S0, $P0, $P1) = newfrom(mob, pos, "PGE::Match")
    push termstack, oper
    goto reduce_end
  reduce_close:
    top = pop tokenstack
    $P1 = pop operstack
  reduce_normal:
    .local int arity
    arity = top['arity']
  reduce_args:
    if arity < 1 goto reduce_list
    $P2 = pop termstack
    dec arity
    unless $P2 goto reduce_backtrack
    $P1[arity] = $P2
    goto reduce_args
  reduce_backtrack:
    wspos = -1
    if arity > 0 goto end
    push termstack, $P2
    goto reduce_end
  reduce_list:
    ##   combine matching list associative operations
    $S0 = top['assoc']
    if $S0 != 'list' goto reduce_saveterm
    $S1 = $P1['type']
    $S2 = $P2['type']
    if $S1 != $S2 goto reduce_saveterm
    $P0 = $P2.get_array()
    $P1 = $P1[1]
    push $P0, $P1
    $P1 = $P2
  reduce_saveterm:
    push termstack, $P1
  reduce_end:
    ret

  token_match:
    mpos = pos
    null oper
    $I0 = token['expect']
    $I0 = $I0 & expect
    if $I0 == 0 goto token_match_end
    $I0 = token['nows']
    $I0 = $I0 & nows
    if $I0 goto token_match_end
    $I0 = exists token['parsed']
    if $I0 goto token_match_sub
    $S0 = token['match']
    (oper, $P99, $P99, $P0) = newfrom(mob, pos, $S0)
    $I0 = length key
    $I0 += pos
    $P0 = $I0
    goto token_match_success
  token_match_sub:
    $P0 = token['parsed']
    $I0 = length key
    $I0 += pos
    mob['KEY'] = key
    mpos = $I0
    oper = $P0(mob)
    delete mob['KEY']
    $P0 = oper.from()
    $P0 = pos
  token_match_success:
    $P0 = token["name"]
    $P0 = clone $P0
    oper['type'] = $P0
  token_match_end:
    ret

  ## At end, reduce any remaining tokens and return result term
  end:
    $I0 = elements tokenstack
    if $I0 < 1 goto end_1
    bsr reduce
    goto end
  end_1:
    mpos = -1
    ##   if the termstack is empty, fail the match
    ##   if the term is an invalid term, fail the match
    $I0 = elements termstack
    if $I0 < 1 goto end_2
    $P0 = pop termstack
    unless $P0 goto end_2
    mob["expr"] = $P0
    mpos = wspos
    if wspos > 0 goto end_2
    ##   somewhere we encountered an error that caused us to backtrack
    ##   find the "real" ending position here
  end_1a:
    $I0 = $P0.to()
    if $I0 <= wspos goto end_1b
    wspos = $I0
    mpos = $I0
  end_1b:
    $P0 = $P0[0]
    if null $P0 goto end_2
    $I0 = isa $P0, 'PGE::Match'
    if $I0 goto end_1a
  end_2:
    .return (mob)

  err_ternary:
    print "Ternary error\n"
    end
.end


### Miscellaneous Notes
#
# Here's the shift-reduce table used by the C<parse> method.
# The digits in the table map each state to the corresponding
# statement in the C<parse> method above.
#
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
#
#    Legend:
#       S# = shift  -- push operator onto token stack
#       R# = reduce -- pop operator from token stack, and fill it with
#           the appropriate number of arguments (arity) from the term stack.
#           Then put the operator token onto the term stack.  Reducing a
#           close token requires popping two operators from the token
#           stack.  Reducing a lone ternary operator is a parse error
#           (its close token must be present).
#       P = precedence -- compare the relative precedence of the top
#           token in the token stack with the current token.
#           If current is tighter than top, shift.
#           If current is looser than top, reduce.
#       P/A = precedence with associativity -- for tokens with equal
#           precedence, use the associativity of the top token in the
#           token stack, shift if it's right associative, reduce otherwise.
#       P/E = higher precedence only -- shift if the current token has
#           higher precedence than the top token on the stack, otherwise
#           it's a parse error.
#       C = close -- If the current token is an appropriate closing
#           token for the top operator on the token stack, then shift.
#           Otherwise, it's an unbalanced closing token.
#       X = unreachable combination
#       E = either the end of the parse, or a parse error (probably
#           to be determined by the caller)
#

=item C<addtok(string name, string rel [, string opts [, pmc match]])>

Deprecated.  Use C<newtok>.

=cut

.sub "addtok" :method
    .param string name
    .param string rel          
    .param string opts         :optional
    .param int has_opts        :opt_flag
    .param pmc match           :optional
    .param int has_match       :opt_flag

    .local pmc args
    args = new .Hash

  addtok_rel:
    if rel == '' goto no_precedence
    $S0 = substr rel, 0, 1
    if $S0 == '<' goto looser
    if $S0 == '>' goto tighter
    args['equiv'] = rel 
    goto addtok_opts
  looser:
    $S0 = substr rel, 1
    args['looser'] = $S0
    goto addtok_opts
  tighter:
    $S0 = substr rel, 1
    args['tighter'] = $S0
    goto addtok_opts
  no_precedence:
    args['precedence'] = '='

  addtok_opts:
    if has_opts == 0 goto addtok_match
  addtok_right:
    $I0 = index opts, 'right'
    if $I0 < 0 goto addtok_list
    args['assoc'] = 'right'
  addtok_list:
    $I0 = index opts, 'list'
    if $I0 < 0 goto addtok_nows
    args['assoc'] = 'list'
  addtok_nows:
    $I0 = index opts, 'nows'
    if $I0 < 0 goto addtok_nullterm
    args['nows'] = 1
  addtok_nullterm:
    $I0 = index opts, 'nullterm'
    if $I0 < 0 goto addtok_match
    args['nullterm'] = 1

  addtok_match:
    if has_match == 0 goto end
    $I0 = isa match, 'Sub'
    if $I0 goto add_parsed
    args['match'] = match
    goto end
  add_parsed:
    args['parsed'] = match

  end:
    .return self.'newtok'(name, args :named :flat)
.end
    
=back

=cut
