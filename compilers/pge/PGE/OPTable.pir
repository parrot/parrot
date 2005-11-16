=head1 Title

PGE::OPTable - PGE operator precedence table and parser

=head1 DESCRIPTION

This file implements the operator precedence table used to perform
shift/reduce parsing of strings.  To get a parser, first create an
instance of C<PGE::OPTable>, then make calls to the C<addtok>
method to add operator tokens into the table:

    .local pmc optable, digit
    $I0 = find_type "PGE::OPTable"
    optable = new $I0 

    digit = find_global "PGE::Rule", "digit"
    optable."addtok"("infix:+")
    optable."addtok"("infix:-", "infix:+")
    optable."addtok"("infix:*", ">infix:+")
    optable."addtok"("infix:/", "infix:*")
    optable."addtok"("term:", ">infix:*", digit)
    optable."addtok"("circumfix:( )", "term:")

The C<parse> method can then be used to obtain a Match object
representing the parse of a string:

    $P0 = optable."parse"("1 + 2 * 3")

To make a parser callable from a rule, create a custom rule
subroutine that calls the parser:

    .sub "expr"
        .param pmc mob
        .local pmc optable
        optable = find_name "optable"
        $P0 = optable."parse"(mob)
        .return ($P0)
    .end

=cut

.namespace [ "PGE::OPTable" ]

.const int PGE_OPTABLE_EMPTY = 0
.const int PGE_OPTABLE_TERM = 1
.const int PGE_OPTABLE_POSTFIX = 2
.const int PGE_OPTABLE_CLOSE = 3
.const int PGE_OPTABLE_PREFIX = 4
.const int PGE_OPTABLE_INFIX = 5
.const int PGE_OPTABLE_TERNARY = 6
.const int PGE_OPTABLE_POSTCIRCUMFIX = 7
.const int PGE_OPTABLE_CIRCUMFIX = 8

.include "cclass.pasm"

=head1 Methods

=item C<__onload()>

Creates the PGE::OPTable class.

=cut

.sub "__onload" :load
    .local pmc base
    $I0 = find_type "PGE::OPTable"
    if $I0 goto end
    base = newclass "PGE::OPTable"
    addattribute base, "%:toktable"
    addattribute base, "%:termtable"
    addattribute base, "%:opertable"
    addattribute base, "%:wstermtable"
    addattribute base, "%:wsopertable"
  end:
.end

=item C<__init()>

Initializes a PGE::OPTable object.

=cut

.sub "__init" :method
    $P0 = new Hash
    setattribute self, "PGE::OPTable\x0%:toktable", $P0
    $I0 = find_type "PGE::TokenHash"
    $P0 = new $I0
    setattribute self, "PGE::OPTable\x0%:termtable", $P0
    $P0 = new $I0
    setattribute self, "PGE::OPTable\x0%:wstermtable", $P0
    $P0 = new $I0
    setattribute self, "PGE::OPTable\x0%:opertable", $P0
    $P0 = new $I0
    setattribute self, "PGE::OPTable\x0%:wsopertable", $P0
.end

=head2 Methods

=item C<addtok(STR name [, STR rel [, STR opts [, PMC match ]]])>

Adds a new token to the operator precedence table.  Operators are
named as strings representing the syntactic category of the operator
and the operator token(s).  Available syntactic categories include
"infix:", "prefix:", "postfix:", "term:", "circumfix:", and
"postcircumfix:".  

The C<rel> argument specifies the precedence of the new operator
relative to an existing operator, with a leading "<" or ">" indicating
looser or tighter precedence.

The C<opts> parameter can be used to indicate the associativity 
of the operator ("left" or "right") and whether the token 
disallows leading whitespace ("nows").

Finally, the C<match> argument is either a string identifying 
the class of Match object to create for this operator, or a 
(rule) subroutine to be called that will parse the complete 
token and return an appropriate Match object.  The default 
value for C<match> is "PGE::Match".

=cut

.sub "addtok" :method
    .param string name
    .param string rel          :optional
    .param int has_rel         :opt_flag
    .param string opts         :optional
    .param int has_opts        :opt_flag
    .param pmc match           :optional
    .param int has_match       :opt_flag
    .local string equiv, syncat
    .local pmc toktable, termtable, wstermtable, opertable, wsopertable
    .local pmc tok
    .local string tok1, tok2
    .local int nows

    toktable = getattribute self, "PGE::OPTable\x0%:toktable"
    termtable = getattribute self, "PGE::OPTable\x0%:termtable"
    opertable = getattribute self, "PGE::OPTable\x0%:opertable"
    wstermtable = getattribute self, "PGE::OPTable\x0%:wstermtable"
    wsopertable = getattribute self, "PGE::OPTable\x0%:wsopertable"

    if has_match goto set_equiv
    match = new String
    match = "PGE::Match"
    if has_opts goto set_equiv
    opts = "left"

  set_equiv:
    equiv = "="
    if has_rel == 0 goto set_nows
    if rel == "" goto set_nows
    $S0 = substr rel, 0, 1
    $I0 = index "=<>", $S0
    if $I0 == -1 goto set_equiv_1
    $S1 = substr rel, 1
    $P0 = toktable[$S1]
    equiv = $P0['equiv']
    equiv = clone equiv
    substr equiv, -1, 0, $S0
    goto set_nows
  set_equiv_1:
    $P0 = toktable[rel]
    equiv = $P0['equiv']

  set_nows:
    nows = 0
    $I0 = index opts, "nows"
    if $I0 < 0 goto addtok_1
    nows = 1

  addtok_1:
    tok = new Hash
    tok["name"] = name
    tok["opts"] = opts
    tok["equiv"] = equiv
    tok["match"] = match
    tok["arity"] = 1
    $I0 = index name, ":"
    inc $I0
    syncat = substr name, 0, $I0
    tok1 = substr name, $I0
    $I0 = index tok1, " "
    if $I0 < 0 goto addtok_2
    $I1 = $I0 + 1
    tok2 = substr tok1, $I1
    tok1 = substr tok1, 0, $I0
    tok["tok2"] = tok2
    $P0 = clone tok
    $P0["syncat"] = PGE_OPTABLE_CLOSE
    opertable[tok2] = $P0
    wsopertable[tok2] = $P0
  addtok_2:
    tok["tok1"] = tok1
    toktable[name] = tok
    if syncat == "infix:" goto infix
    if syncat == "postfix:" goto postfix
    if syncat == "circumfix:" goto circumfix
    if syncat == "prefix:" goto prefix
    if syncat == "postcircumfix:" goto postcircumfix
    if syncat == "ternary:" goto ternary
    if syncat == "close:" goto close
  term:
    tok["syncat"] = PGE_OPTABLE_TERM
    goto expect_term
  infix:
    tok["syncat"] = PGE_OPTABLE_INFIX
    tok["arity"] = 2
    goto expect_op
  prefix:
    tok["syncat"] = PGE_OPTABLE_PREFIX
    goto expect_term
  postfix:
    tok["syncat"] = PGE_OPTABLE_POSTFIX
    goto expect_op
  circumfix:
    tok["syncat"] = PGE_OPTABLE_CIRCUMFIX
    goto expect_term
  postcircumfix:
    tok["syncat"] = PGE_OPTABLE_POSTCIRCUMFIX
    tok["arity"] = 2
    goto expect_op
  ternary:
    tok["syncat"] = PGE_OPTABLE_TERNARY
    tok["arity"] = 3
    goto expect_op
  close:
    tok["syncat"] = PGE_OPTABLE_CLOSE
    tok["arity"] = 0
    goto expect_op
  expect_term:
    termtable[tok1] = tok 
    if nows goto end
    wstermtable[tok1] = tok 
    goto end
  expect_op:
    opertable[tok1] = tok 
    if nows goto end
    wsopertable[tok1] = tok
  end:
.end

=item C<parse(PMC mob)>

Parse the string or match given by C<mob>, and return a Match object
representing the result of the parse.

=cut

.sub "parse" :method
    .param pmc mob
    .local string target
    .local int pos, lastpos, wspos
    .local pmc termtable, opertable, wstermtable, wsopertable
    .local pmc termempty, operempty
    .local pmc oper
    .local pmc tok, match, top
    .local int tokcat, topcat
    .local pmc termstack, operstack, tokstack
    .local int arity
    .local pmc args
    .local string key
    .local pmc newfrom, mfrom, mpos

    termtable = getattribute self, "PGE::OPTable\x0%:termtable"
    opertable = getattribute self, "PGE::OPTable\x0%:opertable"
    wstermtable = getattribute self, "PGE::OPTable\x0%:wstermtable"
    wsopertable = getattribute self, "PGE::OPTable\x0%:wsopertable"
    termstack = new PerlArray
    operstack = new PerlArray
    tokstack = new PerlArray
    termempty = termtable[""]
    operempty = opertable[""]

    newfrom = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = newfrom(mob, 0)
    pos = mfrom
    lastpos = length target

  expect_term:
    if pos >= lastpos goto null_term
    $P0 = wstermtable
    wspos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if wspos > pos goto expect_term_1
    $P0 = termtable
  expect_term_1:
    key = $P0."lkey"(target, wspos)
    tok = $P0[key]
    unless tok goto expect_term_empty
    bsr tok_match
    if oper goto found_term
  expect_term_empty:
    unless termempty goto null_term
    tok = termempty
    key = ""
    wspos = pos
    bsr tok_match
    if oper goto found_term
  null_term:
    unless tokstack goto term_error
    top = tokstack[-1]
    $S0 = top["opts"]
    $I0 = index $S0, "nullterm"
    if $I0 < 0 goto term_error
    oper = newfrom(mob, wspos, "PGE::Match")
    push termstack, oper
    goto expect_oper
  found_term:
    tokcat = tok["syncat"]
    pos = oper.to()
    if tokcat == PGE_OPTABLE_PREFIX goto oper_shift            # (S1)
    if tokcat == PGE_OPTABLE_CIRCUMFIX goto oper_shift         # (S2, P2)
    push termstack, oper
    
  expect_oper:
    if pos >= lastpos goto end
    $P0 = wsopertable
    wspos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if wspos > pos goto expect_oper_1
    $P0 = opertable
  expect_oper_1:
    key = $P0."lkey"(target, wspos)
    tok = $P0[key]
    unless tok goto expect_oper_empty
    bsr tok_match
    if oper goto found_oper
  expect_oper_empty:
    unless operempty goto end
    tok = operempty
    key = ""
    wspos = pos
    bsr tok_match
    unless oper goto end
  found_oper:
    tokcat = tok["syncat"]
  shift_reduce:
    topcat = PGE_OPTABLE_EMPTY
    $I0 = elements tokstack
    if $I0 > 0 goto shift_reduce_1
    if tokcat == PGE_OPTABLE_CLOSE goto end                    # (E3)
    goto oper_shift                                            # (S3)
  shift_reduce_1:
    top = tokstack[-1]
    topcat = top["syncat"]
    if topcat == PGE_OPTABLE_POSTFIX goto oper_reduce          # (R4)
    if tokcat == PGE_OPTABLE_CLOSE goto oper_close             # (R5, C5)
    if topcat >= PGE_OPTABLE_POSTCIRCUMFIX goto oper_shift     # (S6)
    $P0 = tok["equiv"]                                         
    $P1 = top["equiv"]
    if $P0 > $P1 goto oper_shift                               # (P)
    if topcat != PGE_OPTABLE_TERNARY goto shift_reduce_2       
    if tokcat != PGE_OPTABLE_TERNARY goto ternary_error        # (P/E)
    goto oper_shift                                            # (S7)
  shift_reduce_2:
    if $P0 < $P1 goto oper_reduce                              # (P)
    $S0 = top["opts"]
    $I0 = index $S0, "right"                                   
    if $I0 >= 0 goto oper_shift                                # (P/A)
  oper_reduce:
    bsr reduce
    goto shift_reduce
  oper_close:
    if topcat < PGE_OPTABLE_TERNARY goto oper_reduce           # (R5)
    $P1 = top["tok2"]
    $S0 = $P1
    if key != $S0 goto end                                     # (C5)
  oper_shift:
    push tokstack, tok
    push operstack, oper
    pos = oper.to()
    if tokcat >= PGE_OPTABLE_PREFIX goto expect_term
    if tokcat == PGE_OPTABLE_POSTFIX goto expect_oper
    if topcat == PGE_OPTABLE_TERNARY goto expect_term
    goto expect_oper

  reduce:
    $P0 = pop tokstack
    $P1 = $P0["syncat"]
    if $P1 != PGE_OPTABLE_CLOSE goto reduce_1
    $P0 = pop tokstack
    $P1 = pop operstack
  reduce_1:
    arity = $P0["arity"]
    $P0 = pop operstack
  reduce_args:
    if arity < 1 goto reduce_end
    dec arity
    $P1 = pop termstack
    $P0[arity] = $P1
    goto reduce_args
  reduce_end:
    push termstack, $P0
    ret

  tok_match:
    mpos = wspos
    match = tok["match"]
    $I0 = isa match, "Sub"
    if $I0 goto tok_match_sub
    (oper, $P99, $P99, $P0) = newfrom(mob, wspos, match)
    $I0 = length key
    $I0 += wspos
    $P0 = $I0
    goto tok_match_end
  tok_match_sub:
    oper = match(mob)
  tok_match_end:
    $P0 = tok["name"]
    $P0 = clone $P0
    oper["type"] = $P0
    ret

  end:
    $I0 = elements tokstack
    if $I0 < 1 goto end_1
    bsr reduce
    goto end
  end_1:
    $P0 = pop termstack
    mob["expr"] = $P0
    mpos = pos
    .return (mob)

  term_error:
    $P0 = new Exception
    $S0 = "Missing term at offset "
    $S1 = wspos
    $S0 .= $S1
    $S0 .= "\n"
    $P0["_message"] = $S0
    throw $P0
    mpos = -1
    .return (mob)

  ternary_error:
    $P0 = new Exception
    $S0 = "Missing ternary close at offset "
    $S1 = wspos
    $S0 .= $S1
    $S0 .= "\n"
    $P0["_message"] = $S0
    throw $P0
    mpos = -1
    .return (mob)
.end

### Miscellaneous Notes
#
# Here's the shift-reduce table used by the C<parse> method.
# The digits in the table map each state to the corresponding
# statement in the C<parse> method above.
# 
#     tokstack                           Current token
#     --------    ---------------------------------------------------------
#                 postfix  close  prefix  infix  ternary  postcirc  circfix
#     empty         S3      E3      S1     S3      S3        S3       S2
#     postfix       R4      R4      X      R4      R4        R4       X
#     close         P       R5      S1     P       P         P        P2 (*)
#     prefix        P       R5      S1     P       P         P        S2
#     infix         P       R5      S1     P/A     P         P        S2
#     ternary       P/E     C5      S1     P/E     S7        P/E      S2
#     postcirc      S6      C5      S1     S6      S6        S6       S2
#     circfix       S6      C5      S1     S6      S6        S6       S2
# 
#       Expect    oper    mixed    term   term    term      term     term
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
#    (*) - XXX: The current implementation assumes that circumfix
#    operators are always tighter than any close, and so performs a shift.
       
=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
