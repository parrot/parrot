=head1 Title

PGE::OPTable - PGE operator precedence table and parser

=head1 DESCRIPTION

This file implements the operator precedence table used to perform
shift/reduce parsing of strings.  To get a parser, first create an
instance of C<PGE::OPTable>, then make calls to the C<addtok>
method to add operator tokens into the table:

    .local pmc optable, digit
    $I0 = find_type "PGE::OPTable"
    digit = find_global "PGE::Rule", "digit"
    optable."addtok"(" infix:+", "PGE::Match")
    optable."addtok"(" infix:-", "PGE::Match", "infix:+")
    optable."addtok"(" infix:*", "PGE::Match", ">infix:+")
    optable."addtok"(" infix:/", "PGE::Match", "infix:*")
    optable."addtok"(" term:", digit, ">infix:*")
    optable."addtok"(" circumfix:( )", "PGE::Match", "term:")

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

.const int PGE_OPTABLE_CLOSE = 0
.const int PGE_OPTABLE_TERM = 1
.const int PGE_OPTABLE_POSTFIX = 2
.const int PGE_OPTABLE_PREFIX = 3
.const int PGE_OPTABLE_INFIX = 4
.const int PGE_OPTABLE_CIRCUMFIX = 5
.const int PGE_OPTABLE_POSTCIRCUMFIX = 6

.include "cclass.pasm"

=head1 Methods

=item C<__onload()>

Creates the PGE::OPTable and PGE::Op classes.

=cut

.sub "__onload" 
    .local pmc base
    base = newclass "PGE::OPTable"
    addattribute base, "%:toktable"
    addattribute base, "%:termtable"
    addattribute base, "%:opertable"
    addattribute base, "%:wstermtable"
    addattribute base, "%:wsopertable"
    $P0 = getclass "PGE::Match"
    $P0 = subclass $P0, "PGE::Op"
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

=item C<addtok(STR name, PMC match, STR rel, STR opts)>

Adds a new token to the operator precedence table.  Operators are
named as strings representing the syntactic category of the operator
and the operator token(s).  Available syntactic categories include
"infix:", "prefix:", "postfix:", "term:", "circumfix:", and
"postcircumfix:".  

The C<match> argument is either a string identifying the class of 
Match object to create for this operator, or a (rule) subroutine 
to be called that will parse the complete token and return an 
appropriate match object.  

The C<rel> argument specifies the precedence of this operator 
relative to another operator, with a leading ">" or "<" used to indicate
tighter or looser precedence.  Finally, the C<opts> parameter
can be used to indicate the associativity of the operator ("left" or 
"right").

=cut

.sub "addtok" :method
    .param string name
    .param pmc match
    .param string rel          :optional
    .param int has_rel         :opt_flag
    .param string opts         :optional
    .param int has_opts        :opt_flag
    .local string equiv, syncat
    .local pmc toktable, termtable, wstermtable, opertable, wsopertable
    .local pmc tok
    .local string tok1, tok2
    .local int isws

    toktable = getattribute self, "PGE::OPTable\x0%:toktable"
    termtable = getattribute self, "PGE::OPTable\x0%:termtable"
    opertable = getattribute self, "PGE::OPTable\x0%:opertable"
    wstermtable = getattribute self, "PGE::OPTable\x0%:wstermtable"
    wsopertable = getattribute self, "PGE::OPTable\x0%:wsopertable"

    if has_opts goto addtok_1
    opts = "left"
  addtok_1:
    equiv = "="
    if has_rel == 0 goto addtok_2
    $S0 = substr rel, 0, 1
    $I0 = index "=<>", $S0
    if $I0 == -1 goto addtok_3
    $S1 = substr rel, 1
    $P0 = toktable[$S1]
    equiv = $P0['equiv']
    equiv = clone equiv
    substr equiv, -1, 0, $S0
    goto addtok_2
  addtok_3:
    $P0 = toktable[rel]
    equiv = $P0['equiv']

  addtok_2:
    isws = 0
    $S0 = substr name, 0, 1
    if $S0 != " " goto addtok_4
    isws = 1
    name = substr name, 1

  addtok_4:
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
    if $I0 < 0 goto addtok_5
    $I1 = $I0 + 1
    tok2 = substr tok1, $I1
    tok1 = substr tok1, 0, $I0
    tok["tok2"] = tok2
    $P0 = clone tok
    $P0["syncat"] = PGE_OPTABLE_CLOSE
    opertable[tok2] = $P0
    wsopertable[tok2] = $P0
  addtok_5:
    tok["tok1"] = tok1
    toktable[name] = tok
    if syncat == "infix:" goto infix
    if syncat == "postfix:" goto postfix
    if syncat == "circumfix:" goto circumfix
    if syncat == "prefix:" goto prefix
    if syncat == "postcircumfix:" goto postcircumfix
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
  expect_term:
    termtable[tok1] = tok 
    if isws == 0 goto end
    wstermtable[tok1] = tok 
    goto end
  expect_op:
    opertable[tok1] = tok 
    if isws == 0 goto end
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
    .local pmc mobpos
    .local pmc termtable, opertable, wstermtable, wsopertable
    .local pmc oper
    .local pmc tok, match, top
    .local pmc termstack, operstack, tokstack
    .local int arity
    .local pmc args
    .local string key
    .local pmc newfrom

    termtable = getattribute self, "PGE::OPTable\x0%:termtable"
    opertable = getattribute self, "PGE::OPTable\x0%:opertable"
    wstermtable = getattribute self, "PGE::OPTable\x0%:wstermtable"
    wsopertable = getattribute self, "PGE::OPTable\x0%:wsopertable"
    termstack = new PerlArray
    operstack = new PerlArray
    tokstack = new PerlArray

    newfrom = find_global "PGE::Match", "newfrom"
    mob = newfrom(mob, 0)
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P0 = getattribute mob, "PGE::Match\x0$:target"
    mobpos = getattribute mob, "PGE::Match\x0$:pos"
    target = $P0
    lastpos = length target

  expect_term:
    $P0 = wstermtable
    wspos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if wspos > pos goto expect_term_1
    $P0 = termtable
  expect_term_1:
    key = $P0."lkey"(target, wspos)
    tok = $P0[key]
    bsr tok_match
    unless oper goto term_error
    $P0 = tok["syncat"]
    if $P0 == PGE_OPTABLE_PREFIX goto oper_shift
    if $P0 == PGE_OPTABLE_CIRCUMFIX goto oper_shift
    push termstack, oper
    pos = oper.to()
    
  expect_oper:
    $P0 = wsopertable
    wspos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if wspos > pos goto expect_oper_1
    $P0 = opertable
  expect_oper_1:
    key = $P0."lkey"(target, wspos)
    if key == "" goto end
    tok = $P0[key]
    bsr tok_match
    unless oper goto end
  expect_oper_2:
    $I0 = elements tokstack
    if $I0 < 1 goto oper_shift
    top = tokstack[-1]
    $P0 = top["syncat"]
    if $P0 <= PGE_OPTABLE_POSTFIX goto oper_reduce
    if $P0 >= PGE_OPTABLE_CIRCUMFIX goto oper_shift
    $P0 = tok["syncat"]
    if $P0 == PGE_OPTABLE_CLOSE goto oper_reduce
    $P0 = tok["equiv"]
    $P1 = top["equiv"]
    if $P1 < $P0 goto oper_shift
    if $P1 > $P0 goto oper_reduce
    $S0 = top["opts"]
    $I0 = index $S0, "right"
    if $I0 >= 0 goto oper_shift
  oper_reduce:
    bsr reduce
    goto expect_oper_2
  oper_shift:
    push tokstack, tok
    push operstack, oper
    pos = oper.to()
    $P0 = tok["syncat"]
    if $P0 >= PGE_OPTABLE_PREFIX goto expect_term
    goto expect_oper
  oper_close:

  reduce:
    $P0 = pop tokstack
    $P1 = $P0["syncat"]
    if $P1 != PGE_OPTABLE_CLOSE goto reduce_1
    $P0 = pop tokstack
    $P1 = pop operstack
  reduce_1:
    arity = $P0["arity"]
    $P0 = pop operstack
    args = new PerlArray
    $P0["args"] = args
  reduce_args:
    if arity < 1 goto reduce_end
    $P1 = pop termstack
    unshift args, $P1
    dec arity
    goto reduce_args
  reduce_end:
    push termstack, $P0
    ret

  tok_match:
    mobpos = wspos
    match = tok["match"]
    $I0 = isa match, "Sub"
    if $I0 goto tok_match_sub
    oper = newfrom(mob, wspos, match)
    $I0 = length key
    $I0 += wspos
    $P0 = getattribute oper, "PGE::Match\x0$:pos"
    $P0 = $I0
    goto tok_match_end
  tok_match_sub:
    oper = match(mob)
  tok_match_end:
    $P0 = tok["name"]
    $P0 = clone $P0
    oper["name"] = $P0
    ret

  end:
    $I0 = elements tokstack
    if $I0 < 1 goto end_1
    bsr reduce
    goto end
  end_1:
    $P0 = pop termstack
    mob["expr"] = $P0
    mobpos = pos
    .return (mob)

  term_error:
    $P0 = new Exception
    $S0 = "Missing term at offset "
    $S1 = wspos
    $S0 .= $S1
    $S0 .= "\n"
    $P0["_message"] = $S0
    throw $P0
    mobpos = -1
    .return (mob)
.end


