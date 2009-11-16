# $Id$

=head1 NAME

HLL - Parrot HLL library

=head1 DESCRIPTION

This file brings together the various modules needed for HLL::Compiler
and HLL::Grammar.

=cut

.sub '' :anon :load :init
    load_bytecode 'Regex.pbc'
.end

### .include 'src/cheats/hll-compiler.pir'
# we have to overload PCT::HLLCompiler's parse method to support P6Regex grammars


.namespace ['HLL';'Compiler']

.sub '' :anon :init :load
    load_bytecode 'PCT/HLLCompiler.pbc'
    .local pmc p6meta
    p6meta = get_hll_global 'P6metaclass'
    p6meta.'new_class'('HLL::Compiler', 'parent'=>'PCT::HLLCompiler')
.end


.sub 'parse' :method
    .param pmc source
    .param pmc options         :slurpy :named

    .local string tcode
    tcode = options['transcode']
    unless tcode goto transcode_done
    .local pmc tcode_it
    $P0 = split ' ', tcode
    tcode_it = iter $P0
  tcode_loop:
    unless tcode_it goto transcode_done
    tcode = shift tcode_it
    push_eh tcode_enc
    $I0 = find_charset tcode
    $S0 = source
    $S0 = trans_charset $S0, $I0
    assign source, $S0
    pop_eh
    goto transcode_done
  tcode_enc:
    pop_eh
    push_eh tcode_fail
    $I0 = find_encoding tcode
    $S0 = source
    $S0 = trans_encoding $S0, $I0
    assign source, $S0
    pop_eh
    goto transcode_done
  tcode_fail:
    pop_eh
    goto tcode_loop
  transcode_done:

    .local pmc parsegrammar, parseactions, match
    parsegrammar = self.'parsegrammar'()

    null parseactions
    $S0 = options['target']
    if $S0 == 'parse' goto have_parseactions
    parseactions = self.'parseactions'()
  have_parseactions:

    .local int rxtrace
    rxtrace = options['parsetrace']
    match = parsegrammar.'parse'(source, 'from'=>0, 'actions'=>parseactions, 'rxtrace'=>rxtrace)
    unless match goto err_parsefail
    .return (match)

  err_parsefail:
    self.'panic'('Unable to parse source')
    .return (match)
.end


.sub 'pir' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'POST'
    $S0 = $P0.'to_pir'(source, adverbs :flat :named)
    .return ($S0)
.end

### .include 'src/cheats/hll-grammar.pir'
# Copyright (C) 2009 Patrick R. Michaud

=head1 TITLE

src/cheats/hll-grammar.pir -- Additional HLL::Grammar methods

=head2 Methods

=over 4

=cut


.include 'cclass.pasm'
### .include 'src/Regex/constants.pir'
.const int CURSOR_FAIL = -1
.const int CURSOR_FAIL_GROUP = -2
.const int CURSOR_FAIL_RULE = -3
.const int CURSOR_FAIL_MATCH = -4

.const int CURSOR_TYPE_SCAN = 1
.const int CURSOR_TYPE_PEEK = 2

.namespace ['HLL';'Grammar']

.sub '' :load :init
    .local pmc brackets
    brackets = box unicode:"<>[](){}\xab\xbb\u0f3a\u0f3b\u0f3c\u0f3d\u169b\u169c\u2045\u2046\u207d\u207e\u208d\u208e\u2329\u232a\u2768\u2769\u276a\u276b\u276c\u276d\u276e\u276f\u2770\u2771\u2772\u2773\u2774\u2775\u27c5\u27c6\u27e6\u27e7\u27e8\u27e9\u27ea\u27eb\u2983\u2984\u2985\u2986\u2987\u2988\u2989\u298a\u298b\u298c\u298d\u298e\u298f\u2990\u2991\u2992\u2993\u2994\u2995\u2996\u2997\u2998\u29d8\u29d9\u29da\u29db\u29fc\u29fd\u3008\u3009\u300a\u300b\u300c\u300d\u300e\u300f\u3010\u3011\u3014\u3015\u3016\u3017\u3018\u3019\u301a\u301b\u301d\u301e\ufd3e\ufd3f\ufe17\ufe18\ufe35\ufe36\ufe37\ufe38\ufe39\ufe3a\ufe3b\ufe3c\ufe3d\ufe3e\ufe3f\ufe40\ufe41\ufe42\ufe43\ufe44\ufe47\ufe48\ufe59\ufe5a\ufe5b\ufe5c\ufe5d\ufe5e\uff08\uff09\uff3b\uff3d\uff5b\uff5d\uff5f\uff60\uff62\uff63"
    set_global '$!brackets', brackets
.end


.namespace ['HLL';'Grammar']

=item O(spec [, save])

This subrule attaches operator precedence information to
a match object (such as an operator token).  A typical
invocation for the subrule might be:

    token infix:sym<+> { <sym> <O( q{ %additive, :pirop<add> } )> }

This says to add all of the attribute of the C<%additive> hash
(described below) and a C<pirop> entry into the match object
returned by the C<< infix:sym<+> >> token (as the C<O> named
capture).  Note that this is a alphabetic 'O", not a digit zero.

Currently the C<O> subrule accepts a string argument describing
the hash to be stored.  (Note the C< q{ ... } > above.  Eventually
it may be possible to omit the 'q' such that an actual (constant)
hash constructor is passed as an argument to C<O>.

The hash built via the string argument to C<O> is cached, so that
subsequent parses of the same token re-use the hash built from
previous parses of the token, rather than building a new hash
on each invocation.

The C<save> argument is used to build "hash" aggregates that can
be referred to by subsequent calls to C<O>.  For example,

    NQP::Grammar.O(':prec<t=>, :assoc<left>', '%additive' );

specifies the values to be associated with later references to
"%additive".  Eventually it will likely be possible to use true
hashes from a package namespace, but this works for now.

Currently the only pairs recognized have the form C< :pair >,
C< :!pair >, and C<< :pair<strval> >>.

=cut

.sub 'O' :method
    .param string spec
    .param string save         :optional
    .param int has_save        :opt_flag

    # First, get the hash cache.  Right now we have one
    # cache for all grammars; eventually we may need a way to
    # separate them out by cursor type.
    .local pmc ohash
    ohash = get_global '%!ohash'
    unless null ohash goto have_ohash
    ohash = new ['Hash']
    set_global '%!ohash', ohash
  have_ohash:

    # See if we've already created a Hash for the current
    # specification string -- if so, use that.
    .local pmc hash
    hash = ohash[spec]
    unless null hash goto hash_done

    # Otherwise, we need to build a new one.
    hash = new ['Hash']
    .local int pos, eos
    pos = 0
    eos = length spec
  spec_loop:
    pos = find_not_cclass .CCLASS_WHITESPACE, spec, pos, eos
    if pos >= eos goto spec_done
    $S0 = substr spec, pos, 1
    if $S0 == ',' goto spec_comma
    if $S0 == ':' goto spec_pair

    # If whatever we found doesn't start with a colon, treat it
    # as a lookup of a previously saved hash to be merged in.
    .local string lookup
    .local int lpos
    # Find the first whitespace or comma
    lpos = find_cclass .CCLASS_WHITESPACE, spec, pos, eos
    $I0 = index spec, ',', pos
    if $I0 < 0 goto have_lookup_lpos
    if $I0 >= lpos goto have_lookup_lpos
    lpos = $I0
  have_lookup_lpos:
    $I0 = lpos - pos
    lookup = substr spec, pos, $I0
    .local pmc lhash, lhash_it
    lhash = ohash[lookup]
    if null lhash goto err_lookup
    lhash_it = iter lhash
  lhash_loop:
    unless lhash_it goto lhash_done
    $S0 = shift lhash_it
    $P0 = lhash[$S0]
    hash[$S0] = $P0
    goto lhash_loop
  lhash_done:
    pos = lpos
    goto spec_loop

    # We just ignore commas between elements for now.
  spec_comma:
    inc pos
    goto spec_loop

    # If we see a colon, then we want to parse whatever
    # comes next like a pair.
  spec_pair:
    # eat colon
    inc pos
    .local string name
    .local pmc value
    value = new ['Boolean']

    # If the pair is of the form :!name, then reverse the value
    # and skip the colon.
    $S0 = substr spec, pos, 1
    $I0 = iseq $S0, '!'
    pos += $I0
    $I0 = not $I0
    value = $I0

    # Get the name of the pair.
    lpos = find_not_cclass .CCLASS_WORD, spec, pos, eos
    $I0 = lpos - pos
    name = substr spec, pos, $I0
    pos = lpos

    # Look for a <...> that follows.
    $S0 = substr spec, pos, 1
    unless $S0 == '<' goto have_value
    inc pos
    lpos = index spec, '>', pos
    $I0 = lpos - pos
    $S0 = substr spec, pos, $I0
    value = box $S0
    pos = lpos + 1
  have_value:
    # Done processing the pair, store it in the hash.
    hash[name] = value
    goto spec_loop
  spec_done:
    # Done processing the spec string, cache the hash for later.
    ohash[spec] = hash
  hash_done:

    # If we've been called as a subrule, then build a pass-cursor
    # to indicate success and set the hash as the subrule's match object.
    if has_save goto save_hash
    ($P0, $I0) = self.'!cursor_start'()
    $P0.'!cursor_pass'($I0, '')
    setattribute $P0, '$!match', hash
    .return ($P0)

    # save the hash under a new entry
  save_hash:
    ohash[save] = hash
    .return (self)

  err_lookup:
    self.'panic'('Unknown operator precedence specification "', lookup, '"')
.end


=item panic([args :slurpy])

Throw an exception at the current cursor location.  If the message
doesn't end with a newline, also output the line number and offset
of the match.

=cut

.sub 'panic' :method
    .param pmc args            :slurpy

    .local int pos
    .local pmc target
    pos = self.'pos'()
    target = getattribute self, '$!target'

    $I1 = target.'lineof'(pos)
    inc $I1
    push args, ' at line '
    push args, $I1

    $S0 = target
    $S0 = substr $S0, pos, 10
    $S0 = escape $S0
    push args, ', near "'
    push args, $S0
    push args, '"'

    .local string message
    message = join '', args

    die message
.end


=item peek_delimiters(target, pos)

Return the start/stop delimiter pair based on peeking at C<target>
position C<pos>.

=cut

.sub 'peek_delimiters' :method
    .param string target
    .param int pos

    .local string brackets, start, stop
    $P0 = get_global '$!brackets'
    brackets = $P0

    # peek at the next character
    start = substr target, pos, 1
    # colon and word characters aren't valid delimiters
    if start == ':' goto err_colon_delim
    $I0 = is_cclass .CCLASS_WORD, start, 0
    if $I0 goto err_word_delim
    $I0 = is_cclass .CCLASS_WHITESPACE, start, 0
    if $I0 goto err_ws_delim

    # assume stop delim is same as start, for the moment
    stop = start

    # see if we have an opener or closer
    $I0 = index brackets, start
    if $I0 < 0 goto bracket_end
    # if it's a closing bracket, that's an error also
    $I1 = $I0 % 2
    if $I1 goto err_close
    # it's an opener, so get the closing bracket
    inc $I0
    stop = substr brackets, $I0, 1

    # see if the opening bracket is repeated
    .local int len
    len = 0
  bracket_loop:
    inc pos
    inc len
    $S0 = substr target, pos, 1
    if $S0 == start goto bracket_loop
    if len == 1 goto bracket_end
    start = repeat start, len
    stop = repeat stop, len
  bracket_end:
    .return (start, stop, pos)

  err_colon_delim:
    self.'panic'('Colons may not be used to delimit quoting constructs')
  err_word_delim:
    self.'panic'('Alphanumeric character is not allowed as a delimiter')
  err_ws_delim:
    self.'panic'('Whitespace character is not allowed as a delimiter')
  err_close:
    self.'panic'('Use of a closing delimiter for an opener is reserved')
.end


.sub 'quote_EXPR' :method
    .param pmc args            :slurpy

    .local pmc quotemod, true
    .lex '%*QUOTEMOD', quotemod
    quotemod = new ['Hash']

    true = box 1


  args_loop:
    unless args goto args_done
    .local string mod
    mod = shift args
    mod = substr mod, 1
    quotemod[mod] = true
    if mod == 'qq' goto opt_qq
    if mod == 'b' goto opt_b
    goto args_loop
  opt_qq:
    quotemod['s'] = true
    quotemod['a'] = true
    quotemod['h'] = true
    quotemod['f'] = true
    quotemod['c'] = true
    quotemod['b'] = true
  opt_b:
    quotemod['q'] = true
    goto args_loop
  args_done:

    .local pmc cur
    .local string target
    .local int pos

    (cur, pos, target) = self.'!cursor_start'()

    .local pmc start, stop
    (start, stop) = self.'peek_delimiters'(target, pos)

    .lex '$*QUOTE_START', start
    .lex '$*QUOTE_STOP', stop

    $P10 = cur.'quote_delimited'()
    unless $P10 goto fail
    cur.'!mark_push'(0, CURSOR_FAIL, 0, $P10)
    $P10.'!cursor_names'('quote_delimited')
    pos = $P10.'pos'()
    cur.'!cursor_pass'(pos, 'quote_EXPR')
  fail:
    .return (cur)
.end


.sub 'quotemod_check' :method
    .param string mod

    $P0 = find_dynamic_lex '%*QUOTEMOD'
    $P1 = $P0[mod]
    unless null $P1 goto done
    $P1 = new ['Undef']
  done:
    .return ($P1)
.end


.sub 'starter' :method
    .local pmc cur
    .local string target, start
    .local int pos

    (cur, pos, target) = self.'!cursor_start'()

    $P0 = find_dynamic_lex '$*QUOTE_START'
    if null $P0 goto fail
    start = $P0

    $I0 = length start
    $S0 = substr target, pos, $I0
    unless $S0 == start goto fail
    pos += $I0
    cur.'!cursor_pass'(pos, 'starter')
  fail:
    .return (cur)
.end


.sub 'stopper' :method
    .local pmc cur
    .local string target, stop
    .local int pos

    (cur, pos, target) = self.'!cursor_start'()

    $P0 = find_dynamic_lex '$*QUOTE_STOP'
    if null $P0 goto fail
    stop = $P0

    $I0 = length stop
    $S0 = substr target, pos, $I0
    unless $S0 == stop goto fail
    pos += $I0
    cur.'!cursor_pass'(pos, 'stopper')
  fail:
    .return (cur)
.end


.sub 'split_words' :method
    .param string words
    .local int pos, eos
    .local pmc result
    pos = 0
    eos = length words
    result = new ['ResizablePMCArray']
  split_loop:
    pos = find_not_cclass .CCLASS_WHITESPACE, words, pos, eos
    unless pos < eos goto split_done
    $I0 = find_cclass .CCLASS_WHITESPACE, words, pos, eos
    $I1 = $I0 - pos
    $S0 = substr words, pos, $I1
    push result, $S0
    pos = $I0
    goto split_loop
  split_done:
    .return (result)
.end


=item EXPR(...)

An operator precedence parser.

=cut

.sub 'EXPR' :method
    .param string preclim      :optional
    .param int has_preclim     :opt_flag

    if has_preclim goto have_preclim
    preclim = ''
  have_preclim:

    .const 'Sub' reduce = 'EXPR_reduce'
    .local string termishrx
    termishrx = 'termish'

    .local pmc opstack, termstack
    opstack = new ['ResizablePMCArray']
    .lex '@opstack', opstack
    termstack = new ['ResizablePMCArray']
    .lex '@termstack', termstack

    .local pmc here, from, pos
    (here, pos) = self.'!cursor_start'()

  term_loop:
    here = here.termishrx()
    unless here goto fail
    .local pmc termish
    termish = here.'MATCH'()

    # interleave any prefix/postfix we might have found
    .local pmc termOPER, prefixish, postfixish
    termOPER = termish
  termOPER_loop:
    $I0 = exists termOPER['OPER']
    unless $I0 goto termOPER_done
    termOPER = termOPER['OPER']
    goto termOPER_loop
  termOPER_done:
    prefixish = termOPER['prefixish']
    postfixish = termOPER['postfixish']
    if null prefixish goto prefix_done

  prepostfix_loop:
    unless prefixish goto prepostfix_done
    unless postfixish goto prepostfix_done
    .local pmc preO, postO
    .local string preprec, postprec
    $P0 = prefixish[0]
    $P0 = $P0['OPER']
    preO = $P0['O']
    preprec = preO['prec']
    $P0 = postfixish[-1]
    $P0 = $P0['OPER']
    postO = $P0['O']
    postprec = postO['prec']
    if postprec < preprec goto post_shift
    if postprec > preprec goto pre_shift
    $S0 = postO['uassoc']
    if $S0 == 'right' goto pre_shift
  post_shift:
    $P0 = pop postfixish
    push opstack, $P0
    goto prepostfix_loop
  pre_shift:
    $P0 = shift prefixish
    push opstack, $P0
    goto prepostfix_loop
  prepostfix_done:

  prefix_loop:
    unless prefixish goto prefix_done
    $P0 = shift prefixish
    push opstack, $P0
    goto prefix_loop
  prefix_done:
    delete termish['prefixish']

  postfix_loop:
    if null postfixish goto postfix_done
    unless postfixish goto postfix_done
    $P0 = pop postfixish
    push opstack, $P0
    goto postfix_loop
  postfix_done:
    delete termish['postfixish']

    $P0 = termish['term']
    push termstack, $P0

    # Now see if we can fetch an infix operator
    .local pmc infixcur, infix
    here = here.'ws'()
    infixcur = here.'infixish'()
    unless infixcur goto term_done
    infix = infixcur.'MATCH'()

    .local pmc inO
    $P0 = infix['OPER']
    inO = $P0['O']
    termishrx = inO['nextterm']
    if termishrx goto have_termishrx
    termishrx = 'termish'
  have_termishrx:

    .local string inprec, inassoc, opprec
    inprec = inO['prec']
    unless inprec goto err_inprec
    if inprec <= preclim goto term_done
    inassoc = inO['assoc']

  reduce_loop:
    unless opstack goto reduce_done
    $P0 = opstack[-1]
    $P0 = $P0['OPER']
    $P0 = $P0['O']
    opprec = $P0['prec']
    unless opprec > inprec goto reduce_gt_done
    capture_lex reduce
    self.reduce(termstack, opstack)
    goto reduce_loop
  reduce_gt_done:

    unless opprec == inprec goto reduce_done
    # equal precedence, use associativity to decide
    unless inassoc == 'left' goto reduce_done
    # left associative, reduce immediately
    capture_lex reduce
    self.reduce(termstack, opstack)
  reduce_done:

    push opstack, infix        # The Shift
    here = infixcur.'ws'()
    goto term_loop
  term_done:

  opstack_loop:
    unless opstack goto opstack_done
    capture_lex reduce
    self.reduce(termstack, opstack)
    goto opstack_loop
  opstack_done:

  expr_done:
    .local pmc term
    term = pop termstack
    pos = here.'pos'()
    here = self.'!cursor_start'()
    setattribute here, '$!pos', pos
    setattribute here, '$!match', term
    here.'!reduce'('EXPR')
  fail:
    .return (here)

  err_internal:
    $I0 = termstack
    here.'panic'('Internal operator parser error, @termstack == ', $I0)
  err_inprec:
    infixcur.'panic'('Missing infixish operator precedence')
.end


.sub 'EXPR_reduce' :method :anon
    .param pmc termstack
    .param pmc opstack

    .local pmc op, opOPER, opO
    .local string opassoc
    op = pop opstack
    opOPER = op['OPER']
    opO = opOPER['O']
    opassoc = opO['assoc']
    if opassoc == 'unary' goto op_unary
    if opassoc == 'list' goto op_list
  op_infix:
    .local pmc right, left
    right = pop termstack
    left = pop termstack
    op[0] = left
    op[1] = right
    $S0 = opO['reducecheck']
    unless $S0 goto op_infix_1
    self.$S0(op)
  op_infix_1:
    self.'!reduce'('EXPR', 'INFIX', op)
    goto done

  op_unary:
    .local pmc arg, afrom, ofrom
    arg = pop termstack
    op[0] = arg
    afrom = arg.'from'()
    ofrom = op.'from'()
    if afrom < ofrom goto op_postfix
  op_prefix:
    self.'!reduce'('EXPR', 'PREFIX', op)
    goto done
  op_postfix:
    self.'!reduce'('EXPR', 'POSTFIX', op)
    goto done

  op_list:
    .local string sym
    sym = opOPER['sym']
    arg = pop termstack
    unshift op, arg
  op_sym_loop:
    unless opstack goto op_sym_done
    $P0 = opstack[-1]
    $P0 = $P0['OPER']
    $S0 = $P0['sym']
    if sym != $S0 goto op_sym_done
    arg = pop termstack
    unshift op, arg
    $P0 = pop opstack
    goto op_sym_loop
  op_sym_done:
    arg = pop termstack
    unshift op, arg
    self.'!reduce'('EXPR', 'LIST', op)
    goto done

  done:
    push termstack, op
.end


.sub 'ternary' :method
    .param pmc match
    $P0 = match[1]
    $P1 = match['infix']
    $P1 = $P1['EXPR']
    match[1] = $P1
    match[2] = $P0
.end


.sub 'MARKER' :method
    .param pmc markname

    .local pmc pos
    pos = self.'pos'()
    self.'!cursor_debug'('START MARKER name=', markname, ', pos=', pos)

    .local pmc markhash
    markhash = get_global '%!MARKHASH'
    unless null markhash goto have_markhash
    markhash = new ['Hash']
    set_global '%!MARKHASH', markhash
  have_markhash:
    markhash[markname] = pos
    self.'!cursor_debug'('PASS  MARKER')
    .return (1)
.end


.sub 'MARKED' :method
    .param pmc markname

    self.'!cursor_debug'('START MARKED name=', markname)

    .local pmc markhash
    markhash = get_global '%!MARKHASH'
    if null markhash goto fail
    $P0 = markhash[markname]
    if null $P0 goto fail
    $P1 = self.'pos'()
    unless $P0 == $P1 goto fail
    self.'!cursor_debug'('PASS  MARKED')
    .return (1)
  fail:
    self.'!cursor_debug'('FAIL  MARKED')
    .return (0)
.end


.sub 'LANG' :method
    .param string lang
    .param string regex

    .local pmc langhash, cur, pos
    langhash = find_dynamic_lex '%*LANG'
    $P0 = langhash[lang]
    (cur, pos) = self.'!cursor_start'($P0)
    cur.'!cursor_pos'(pos)

    $S0 = concat lang, '-actions'
    $P0 = langhash[$S0]
    .lex '$*ACTIONS', $P0

    # XXX can't use tailcall here or we lose $*ACTIONS
    $P1 = cur.regex()
    .return ($P1)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

### .include 'gen/hllgrammar-grammar.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258388820.35002")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 5
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
    $P263 = $P14()
.annotate "line", 1
    .return ($P263)
.end


.namespace []
.sub "" :load :init :subid("post94") :outer("10_1258388820.35002")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258388820.35002" 
    .local pmc block
    set block, $P12
    $P264 = get_root_global ["parrot"], "P6metaclass"
    $P264."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block13"  :subid("11_1258388820.35002") :outer("10_1258388820.35002")
.annotate "line", 5
    .const 'Sub' $P254 = "92_1258388820.35002" 
    capture_lex $P254
    .const 'Sub' $P248 = "90_1258388820.35002" 
    capture_lex $P248
    .const 'Sub' $P236 = "87_1258388820.35002" 
    capture_lex $P236
    .const 'Sub' $P232 = "85_1258388820.35002" 
    capture_lex $P232
    .const 'Sub' $P227 = "83_1258388820.35002" 
    capture_lex $P227
    .const 'Sub' $P222 = "81_1258388820.35002" 
    capture_lex $P222
    .const 'Sub' $P218 = "79_1258388820.35002" 
    capture_lex $P218
    .const 'Sub' $P214 = "77_1258388820.35002" 
    capture_lex $P214
    .const 'Sub' $P210 = "75_1258388820.35002" 
    capture_lex $P210
    .const 'Sub' $P206 = "73_1258388820.35002" 
    capture_lex $P206
    .const 'Sub' $P202 = "71_1258388820.35002" 
    capture_lex $P202
    .const 'Sub' $P198 = "69_1258388820.35002" 
    capture_lex $P198
    .const 'Sub' $P188 = "65_1258388820.35002" 
    capture_lex $P188
    .const 'Sub' $P176 = "63_1258388820.35002" 
    capture_lex $P176
    .const 'Sub' $P165 = "61_1258388820.35002" 
    capture_lex $P165
    .const 'Sub' $P159 = "59_1258388820.35002" 
    capture_lex $P159
    .const 'Sub' $P151 = "57_1258388820.35002" 
    capture_lex $P151
    .const 'Sub' $P145 = "55_1258388820.35002" 
    capture_lex $P145
    .const 'Sub' $P137 = "53_1258388820.35002" 
    capture_lex $P137
    .const 'Sub' $P131 = "51_1258388820.35002" 
    capture_lex $P131
    .const 'Sub' $P123 = "49_1258388820.35002" 
    capture_lex $P123
    .const 'Sub' $P117 = "47_1258388820.35002" 
    capture_lex $P117
    .const 'Sub' $P111 = "45_1258388820.35002" 
    capture_lex $P111
    .const 'Sub' $P102 = "43_1258388820.35002" 
    capture_lex $P102
    .const 'Sub' $P95 = "41_1258388820.35002" 
    capture_lex $P95
    .const 'Sub' $P85 = "40_1258388820.35002" 
    capture_lex $P85
    .const 'Sub' $P80 = "38_1258388820.35002" 
    capture_lex $P80
    .const 'Sub' $P76 = "36_1258388820.35002" 
    capture_lex $P76
    .const 'Sub' $P69 = "34_1258388820.35002" 
    capture_lex $P69
    .const 'Sub' $P64 = "32_1258388820.35002" 
    capture_lex $P64
    .const 'Sub' $P59 = "30_1258388820.35002" 
    capture_lex $P59
    .const 'Sub' $P54 = "28_1258388820.35002" 
    capture_lex $P54
    .const 'Sub' $P22 = "14_1258388820.35002" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258388820.35002" 
    capture_lex $P15
.annotate "line", 33
    .const 'Sub' $P254 = "92_1258388820.35002" 
    capture_lex $P254
.annotate "line", 5
    .return ($P254)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx16_tgt
    .local int rx16_pos
    .local int rx16_off
    .local int rx16_eos
    .local int rx16_rep
    .local pmc rx16_cur
    (rx16_cur, rx16_pos, rx16_tgt, $I10) = self."!cursor_start"()
    rx16_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx16_cur
    .local pmc match
    .lex "$/", match
    length rx16_eos, rx16_tgt
    set rx16_off, 0
    lt $I10, 2, rx16_start
    sub rx16_off, $I10, 1
    substr rx16_tgt, rx16_tgt, rx16_off
  rx16_start:
  # rx subrule "ww" subtype=zerowidth negate=1
    rx16_cur."!cursor_pos"(rx16_pos)
    $P10 = rx16_cur."ww"()
    if $P10, rx16_fail
  # rx rxquantr19 ** 0..*
    set_addr $I21, rxquantr19_done
    rx16_cur."!mark_push"(0, rx16_pos, $I21)
  rxquantr19_loop:
  alt20_0:
    set_addr $I10, alt20_1
    rx16_cur."!mark_push"(0, rx16_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx16_pos, rx16_off
    find_not_cclass $I11, 32, rx16_tgt, $I10, rx16_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx16_fail
    add rx16_pos, rx16_off, $I11
    goto alt20_end
  alt20_1:
  # rx literal  "#"
    add $I11, rx16_pos, 1
    gt $I11, rx16_eos, rx16_fail
    sub $I11, rx16_pos, rx16_off
    substr $S10, rx16_tgt, $I11, 1
    ne $S10, "#", rx16_fail
    add rx16_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx16_pos, rx16_off
    find_cclass $I11, 4096, rx16_tgt, $I10, rx16_eos
    add rx16_pos, rx16_off, $I11
  alt20_end:
    (rx16_rep) = rx16_cur."!mark_commit"($I21)
    rx16_cur."!mark_push"(rx16_rep, rx16_pos, $I21)
    goto rxquantr19_loop
  rxquantr19_done:
  # rx pass
    rx16_cur."!cursor_pass"(rx16_pos, "ws")
    rx16_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx16_pos)
    .return (rx16_cur)
  rx16_fail:
    (rx16_rep, rx16_pos, $I10, $P10) = rx16_cur."!mark_fail"(0)
    lt rx16_pos, -1, rx16_done
    eq rx16_pos, -1, rx16_fail
    jump $I10
  rx16_done:
    rx16_cur."!cursor_fail"()
    rx16_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx16_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__ws"  :subid("13_1258388820.35002") :method
.annotate "line", 5
    new $P18, "ResizablePMCArray"
    push $P18, ""
    .return ($P18)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx23_tgt
    .local int rx23_pos
    .local int rx23_off
    .local int rx23_eos
    .local int rx23_rep
    .local pmc rx23_cur
    (rx23_cur, rx23_pos, rx23_tgt, $I10) = self."!cursor_start"()
    rx23_cur."!cursor_debug"("START ", "termish")
    rx23_cur."!cursor_caparray"("prefixish", "postfixish")
    .lex unicode:"$\x{a2}", rx23_cur
    .local pmc match
    .lex "$/", match
    length rx23_eos, rx23_tgt
    set rx23_off, 0
    lt $I10, 2, rx23_start
    sub rx23_off, $I10, 1
    substr rx23_tgt, rx23_tgt, rx23_off
  rx23_start:
.annotate "line", 8
  # rx rxquantr26 ** 0..*
    set_addr $I27, rxquantr26_done
    rx23_cur."!mark_push"(0, rx23_pos, $I27)
  rxquantr26_loop:
  # rx subrule "prefixish" subtype=capture negate=
    rx23_cur."!cursor_pos"(rx23_pos)
    $P10 = rx23_cur."prefixish"()
    unless $P10, rx23_fail
    rx23_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("prefixish")
    rx23_pos = $P10."pos"()
    (rx23_rep) = rx23_cur."!mark_commit"($I27)
    rx23_cur."!mark_push"(rx23_rep, rx23_pos, $I27)
    goto rxquantr26_loop
  rxquantr26_done:
.annotate "line", 9
  # rx subrule "term" subtype=capture negate=
    rx23_cur."!cursor_pos"(rx23_pos)
    $P10 = rx23_cur."term"()
    unless $P10, rx23_fail
    rx23_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx23_pos = $P10."pos"()
.annotate "line", 10
  # rx rxquantr28 ** 0..*
    set_addr $I29, rxquantr28_done
    rx23_cur."!mark_push"(0, rx23_pos, $I29)
  rxquantr28_loop:
  # rx subrule "postfixish" subtype=capture negate=
    rx23_cur."!cursor_pos"(rx23_pos)
    $P10 = rx23_cur."postfixish"()
    unless $P10, rx23_fail
    rx23_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postfixish")
    rx23_pos = $P10."pos"()
    (rx23_rep) = rx23_cur."!mark_commit"($I29)
    rx23_cur."!mark_push"(rx23_rep, rx23_pos, $I29)
    goto rxquantr28_loop
  rxquantr28_done:
.annotate "line", 7
  # rx pass
    rx23_cur."!cursor_pass"(rx23_pos, "termish")
    rx23_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx23_pos)
    .return (rx23_cur)
  rx23_fail:
.annotate "line", 5
    (rx23_rep, rx23_pos, $I10, $P10) = rx23_cur."!mark_fail"(0)
    lt rx23_pos, -1, rx23_done
    eq rx23_pos, -1, rx23_fail
    jump $I10
  rx23_done:
    rx23_cur."!cursor_fail"()
    rx23_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx23_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__termish"  :subid("15_1258388820.35002") :method
.annotate "line", 5
    new $P25, "ResizablePMCArray"
    push $P25, ""
    .return ($P25)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1258388820.35002") :method
.annotate "line", 13
    $P31 = self."!protoregex"("term")
    .return ($P31)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1258388820.35002") :method
.annotate "line", 13
    $P33 = self."!PREFIX__!protoregex"("term")
    .return ($P33)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1258388820.35002") :method
.annotate "line", 14
    $P35 = self."!protoregex"("infix")
    .return ($P35)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1258388820.35002") :method
.annotate "line", 14
    $P37 = self."!PREFIX__!protoregex"("infix")
    .return ($P37)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1258388820.35002") :method
.annotate "line", 15
    $P39 = self."!protoregex"("prefix")
    .return ($P39)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1258388820.35002") :method
.annotate "line", 15
    $P41 = self."!PREFIX__!protoregex"("prefix")
    .return ($P41)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1258388820.35002") :method
.annotate "line", 16
    $P43 = self."!protoregex"("postfix")
    .return ($P43)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1258388820.35002") :method
.annotate "line", 16
    $P45 = self."!PREFIX__!protoregex"("postfix")
    .return ($P45)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1258388820.35002") :method
.annotate "line", 17
    $P47 = self."!protoregex"("circumfix")
    .return ($P47)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1258388820.35002") :method
.annotate "line", 17
    $P49 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P49)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1258388820.35002") :method
.annotate "line", 18
    $P51 = self."!protoregex"("postcircumfix")
    .return ($P51)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1258388820.35002") :method
.annotate "line", 18
    $P53 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P53)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx55_tgt
    .local int rx55_pos
    .local int rx55_off
    .local int rx55_eos
    .local int rx55_rep
    .local pmc rx55_cur
    (rx55_cur, rx55_pos, rx55_tgt, $I10) = self."!cursor_start"()
    rx55_cur."!cursor_debug"("START ", "term:sym<circumfix>")
    .lex unicode:"$\x{a2}", rx55_cur
    .local pmc match
    .lex "$/", match
    length rx55_eos, rx55_tgt
    set rx55_off, 0
    lt $I10, 2, rx55_start
    sub rx55_off, $I10, 1
    substr rx55_tgt, rx55_tgt, rx55_off
  rx55_start:
.annotate "line", 20
  # rx subrule "circumfix" subtype=capture negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."circumfix"()
    unless $P10, rx55_fail
    rx55_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx55_pos = $P10."pos"()
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "term:sym<circumfix>")
    rx55_cur."!cursor_debug"("PASS  ", "term:sym<circumfix>", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_fail:
.annotate "line", 5
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    rx55_cur."!cursor_debug"("FAIL  ", "term:sym<circumfix>")
    .return (rx55_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1258388820.35002") :method
.annotate "line", 5
    $P57 = self."!PREFIX__!subrule"("circumfix", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx60_tgt
    .local int rx60_pos
    .local int rx60_off
    .local int rx60_eos
    .local int rx60_rep
    .local pmc rx60_cur
    (rx60_cur, rx60_pos, rx60_tgt, $I10) = self."!cursor_start"()
    rx60_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx60_cur
    .local pmc match
    .lex "$/", match
    length rx60_eos, rx60_tgt
    set rx60_off, 0
    lt $I10, 2, rx60_start
    sub rx60_off, $I10, 1
    substr rx60_tgt, rx60_tgt, rx60_off
  rx60_start:
.annotate "line", 22
  # rx subrule "infix" subtype=capture negate=
    rx60_cur."!cursor_pos"(rx60_pos)
    $P10 = rx60_cur."infix"()
    unless $P10, rx60_fail
    rx60_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx60_pos = $P10."pos"()
  # rx pass
    rx60_cur."!cursor_pass"(rx60_pos, "infixish")
    rx60_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx60_pos)
    .return (rx60_cur)
  rx60_fail:
.annotate "line", 5
    (rx60_rep, rx60_pos, $I10, $P10) = rx60_cur."!mark_fail"(0)
    lt rx60_pos, -1, rx60_done
    eq rx60_pos, -1, rx60_fail
    jump $I10
  rx60_done:
    rx60_cur."!cursor_fail"()
    rx60_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx60_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infixish"  :subid("31_1258388820.35002") :method
.annotate "line", 5
    $P62 = self."!PREFIX__!subrule"("OPER=infix", "")
    new $P63, "ResizablePMCArray"
    push $P63, $P62
    .return ($P63)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx65_tgt
    .local int rx65_pos
    .local int rx65_off
    .local int rx65_eos
    .local int rx65_rep
    .local pmc rx65_cur
    (rx65_cur, rx65_pos, rx65_tgt, $I10) = self."!cursor_start"()
    rx65_cur."!cursor_debug"("START ", "prefixish")
    .lex unicode:"$\x{a2}", rx65_cur
    .local pmc match
    .lex "$/", match
    length rx65_eos, rx65_tgt
    set rx65_off, 0
    lt $I10, 2, rx65_start
    sub rx65_off, $I10, 1
    substr rx65_tgt, rx65_tgt, rx65_off
  rx65_start:
.annotate "line", 23
  # rx subrule "prefix" subtype=capture negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."prefix"()
    unless $P10, rx65_fail
    rx65_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=prefix")
    rx65_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."ws"()
    unless $P10, rx65_fail
    rx65_pos = $P10."pos"()
  # rx pass
    rx65_cur."!cursor_pass"(rx65_pos, "prefixish")
    rx65_cur."!cursor_debug"("PASS  ", "prefixish", " at pos=", rx65_pos)
    .return (rx65_cur)
  rx65_fail:
.annotate "line", 5
    (rx65_rep, rx65_pos, $I10, $P10) = rx65_cur."!mark_fail"(0)
    lt rx65_pos, -1, rx65_done
    eq rx65_pos, -1, rx65_fail
    jump $I10
  rx65_done:
    rx65_cur."!cursor_fail"()
    rx65_cur."!cursor_debug"("FAIL  ", "prefixish")
    .return (rx65_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefixish"  :subid("33_1258388820.35002") :method
.annotate "line", 5
    $P67 = self."!PREFIX__!subrule"("OPER=prefix", "")
    new $P68, "ResizablePMCArray"
    push $P68, $P67
    .return ($P68)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx70_tgt
    .local int rx70_pos
    .local int rx70_off
    .local int rx70_eos
    .local int rx70_rep
    .local pmc rx70_cur
    (rx70_cur, rx70_pos, rx70_tgt, $I10) = self."!cursor_start"()
    rx70_cur."!cursor_debug"("START ", "postfixish")
    .lex unicode:"$\x{a2}", rx70_cur
    .local pmc match
    .lex "$/", match
    length rx70_eos, rx70_tgt
    set rx70_off, 0
    lt $I10, 2, rx70_start
    sub rx70_off, $I10, 1
    substr rx70_tgt, rx70_tgt, rx70_off
  rx70_start:
  alt75_0:
.annotate "line", 24
    set_addr $I10, alt75_1
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
.annotate "line", 25
  # rx subrule "postfix" subtype=capture negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."postfix"()
    unless $P10, rx70_fail
    rx70_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postfix")
    rx70_pos = $P10."pos"()
    goto alt75_end
  alt75_1:
.annotate "line", 26
  # rx subrule "postcircumfix" subtype=capture negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."postcircumfix"()
    unless $P10, rx70_fail
    rx70_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postcircumfix")
    rx70_pos = $P10."pos"()
  alt75_end:
.annotate "line", 24
  # rx pass
    rx70_cur."!cursor_pass"(rx70_pos, "postfixish")
    rx70_cur."!cursor_debug"("PASS  ", "postfixish", " at pos=", rx70_pos)
    .return (rx70_cur)
  rx70_fail:
.annotate "line", 5
    (rx70_rep, rx70_pos, $I10, $P10) = rx70_cur."!mark_fail"(0)
    lt rx70_pos, -1, rx70_done
    eq rx70_pos, -1, rx70_fail
    jump $I10
  rx70_done:
    rx70_cur."!cursor_fail"()
    rx70_cur."!cursor_debug"("FAIL  ", "postfixish")
    .return (rx70_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfixish"  :subid("35_1258388820.35002") :method
.annotate "line", 5
    $P72 = self."!PREFIX__!subrule"("OPER=postcircumfix", "")
    $P73 = self."!PREFIX__!subrule"("OPER=postfix", "")
    new $P74, "ResizablePMCArray"
    push $P74, $P72
    push $P74, $P73
    .return ($P74)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm"  :subid("36_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx77_tgt
    .local int rx77_pos
    .local int rx77_off
    .local int rx77_eos
    .local int rx77_rep
    .local pmc rx77_cur
    (rx77_cur, rx77_pos, rx77_tgt, $I10) = self."!cursor_start"()
    rx77_cur."!cursor_debug"("START ", "nullterm")
    .lex unicode:"$\x{a2}", rx77_cur
    .local pmc match
    .lex "$/", match
    length rx77_eos, rx77_tgt
    set rx77_off, 0
    lt $I10, 2, rx77_start
    sub rx77_off, $I10, 1
    substr rx77_tgt, rx77_tgt, rx77_off
  rx77_start:
.annotate "line", 29
  # rx pass
    rx77_cur."!cursor_pass"(rx77_pos, "nullterm")
    rx77_cur."!cursor_debug"("PASS  ", "nullterm", " at pos=", rx77_pos)
    .return (rx77_cur)
  rx77_fail:
.annotate "line", 5
    (rx77_rep, rx77_pos, $I10, $P10) = rx77_cur."!mark_fail"(0)
    lt rx77_pos, -1, rx77_done
    eq rx77_pos, -1, rx77_fail
    jump $I10
  rx77_done:
    rx77_cur."!cursor_fail"()
    rx77_cur."!cursor_debug"("FAIL  ", "nullterm")
    .return (rx77_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm"  :subid("37_1258388820.35002") :method
.annotate "line", 5
    new $P79, "ResizablePMCArray"
    push $P79, ""
    .return ($P79)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm_alt"  :subid("38_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 5
    .local string rx81_tgt
    .local int rx81_pos
    .local int rx81_off
    .local int rx81_eos
    .local int rx81_rep
    .local pmc rx81_cur
    (rx81_cur, rx81_pos, rx81_tgt, $I10) = self."!cursor_start"()
    rx81_cur."!cursor_debug"("START ", "nullterm_alt")
    .lex unicode:"$\x{a2}", rx81_cur
    .local pmc match
    .lex "$/", match
    length rx81_eos, rx81_tgt
    set rx81_off, 0
    lt $I10, 2, rx81_start
    sub rx81_off, $I10, 1
    substr rx81_tgt, rx81_tgt, rx81_off
  rx81_start:
.annotate "line", 30
  # rx subrule "nullterm" subtype=capture negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    $P10 = rx81_cur."nullterm"()
    unless $P10, rx81_fail
    rx81_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx81_pos = $P10."pos"()
  # rx pass
    rx81_cur."!cursor_pass"(rx81_pos, "nullterm_alt")
    rx81_cur."!cursor_debug"("PASS  ", "nullterm_alt", " at pos=", rx81_pos)
    .return (rx81_cur)
  rx81_fail:
.annotate "line", 5
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    rx81_cur."!cursor_debug"("FAIL  ", "nullterm_alt")
    .return (rx81_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm_alt"  :subid("39_1258388820.35002") :method
.annotate "line", 5
    $P83 = self."!PREFIX__!subrule"("term", "")
    new $P84, "ResizablePMCArray"
    push $P84, $P83
    .return ($P84)
.end


.namespace ["HLL";"Grammar"]
.sub "nulltermish"  :subid("40_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    new $P87, 'ExceptionHandler'
    set_addr $P87, control_86
    $P87."handle_types"(58)
    push_eh $P87
    .lex "self", self
    find_lex $P90, "self"
    $P91 = $P90."termish"()
    unless $P91, unless_89
    set $P88, $P91
    goto unless_89_end
  unless_89:
    find_lex $P92, "self"
    $P93 = $P92."nullterm_alt"()
    set $P88, $P93
  unless_89_end:
    .return ($P88)
  control_86:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
    rethrow exception
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("41_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx96_tgt
    .local int rx96_pos
    .local int rx96_off
    .local int rx96_eos
    .local int rx96_rep
    .local pmc rx96_cur
    (rx96_cur, rx96_pos, rx96_tgt, $I10) = self."!cursor_start"()
    rx96_cur."!cursor_debug"("START ", "quote_delimited")
    rx96_cur."!cursor_caparray"("quote_atom")
    .lex unicode:"$\x{a2}", rx96_cur
    .local pmc match
    .lex "$/", match
    length rx96_eos, rx96_tgt
    set rx96_off, 0
    lt $I10, 2, rx96_start
    sub rx96_off, $I10, 1
    substr rx96_tgt, rx96_tgt, rx96_off
  rx96_start:
.annotate "line", 37
  # rx subrule "starter" subtype=capture negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."starter"()
    unless $P10, rx96_fail
    rx96_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("starter")
    rx96_pos = $P10."pos"()
  # rx rxquantr100 ** 0..*
    set_addr $I101, rxquantr100_done
    rx96_cur."!mark_push"(0, rx96_pos, $I101)
  rxquantr100_loop:
  # rx subrule "quote_atom" subtype=capture negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."quote_atom"()
    unless $P10, rx96_fail
    rx96_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_atom")
    rx96_pos = $P10."pos"()
    (rx96_rep) = rx96_cur."!mark_commit"($I101)
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
  # rx subrule "stopper" subtype=capture negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."stopper"()
    unless $P10, rx96_fail
    rx96_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx96_pos = $P10."pos"()
.annotate "line", 36
  # rx pass
    rx96_cur."!cursor_pass"(rx96_pos, "quote_delimited")
    rx96_cur."!cursor_debug"("PASS  ", "quote_delimited", " at pos=", rx96_pos)
    .return (rx96_cur)
  rx96_fail:
.annotate "line", 33
    (rx96_rep, rx96_pos, $I10, $P10) = rx96_cur."!mark_fail"(0)
    lt rx96_pos, -1, rx96_done
    eq rx96_pos, -1, rx96_fail
    jump $I10
  rx96_done:
    rx96_cur."!cursor_fail"()
    rx96_cur."!cursor_debug"("FAIL  ", "quote_delimited")
    .return (rx96_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_delimited"  :subid("42_1258388820.35002") :method
.annotate "line", 33
    $P98 = self."!PREFIX__!subrule"("starter", "")
    new $P99, "ResizablePMCArray"
    push $P99, $P98
    .return ($P99)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("43_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    (rx103_cur, rx103_pos, rx103_tgt, $I10) = self."!cursor_start"()
    rx103_cur."!cursor_debug"("START ", "quote_atom")
    .lex unicode:"$\x{a2}", rx103_cur
    .local pmc match
    .lex "$/", match
    length rx103_eos, rx103_tgt
    set rx103_off, 0
    lt $I10, 2, rx103_start
    sub rx103_off, $I10, 1
    substr rx103_tgt, rx103_tgt, rx103_off
  rx103_start:
.annotate "line", 41
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."stopper"()
    if $P10, rx103_fail
  alt106_0:
.annotate "line", 42
    set_addr $I10, alt106_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
.annotate "line", 43
  # rx subrule "quote_escape" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."quote_escape"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_escape")
    rx103_pos = $P10."pos"()
    goto alt106_end
  alt106_1:
.annotate "line", 44
  # rx rxquantr107 ** 1..*
    set_addr $I110, rxquantr107_done
    rx103_cur."!mark_push"(0, -1, $I110)
  rxquantr107_loop:
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."stopper"()
    if $P10, rx103_fail
  # rx subrule "quote_escape" subtype=zerowidth negate=1
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."quote_escape"()
    if $P10, rx103_fail
  # rx charclass .
    ge rx103_pos, rx103_eos, rx103_fail
    inc rx103_pos
    (rx103_rep) = rx103_cur."!mark_commit"($I110)
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I110)
    goto rxquantr107_loop
  rxquantr107_done:
  alt106_end:
.annotate "line", 40
  # rx pass
    rx103_cur."!cursor_pass"(rx103_pos, "quote_atom")
    rx103_cur."!cursor_debug"("PASS  ", "quote_atom", " at pos=", rx103_pos)
    .return (rx103_cur)
  rx103_fail:
.annotate "line", 33
    (rx103_rep, rx103_pos, $I10, $P10) = rx103_cur."!mark_fail"(0)
    lt rx103_pos, -1, rx103_done
    eq rx103_pos, -1, rx103_fail
    jump $I10
  rx103_done:
    rx103_cur."!cursor_fail"()
    rx103_cur."!cursor_debug"("FAIL  ", "quote_atom")
    .return (rx103_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_atom"  :subid("44_1258388820.35002") :method
.annotate "line", 33
    new $P105, "ResizablePMCArray"
    push $P105, ""
    .return ($P105)
.end


.namespace ["HLL";"Grammar"]
.sub "decint"  :subid("45_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx112_tgt
    .local int rx112_pos
    .local int rx112_off
    .local int rx112_eos
    .local int rx112_rep
    .local pmc rx112_cur
    (rx112_cur, rx112_pos, rx112_tgt, $I10) = self."!cursor_start"()
    rx112_cur."!cursor_debug"("START ", "decint")
    .lex unicode:"$\x{a2}", rx112_cur
    .local pmc match
    .lex "$/", match
    length rx112_eos, rx112_tgt
    set rx112_off, 0
    lt $I10, 2, rx112_start
    sub rx112_off, $I10, 1
    substr rx112_tgt, rx112_tgt, rx112_off
  rx112_start:
.annotate "line", 48
  # rx rxquantr115 ** 1..*
    set_addr $I116, rxquantr115_done
    rx112_cur."!mark_push"(0, -1, $I116)
  rxquantr115_loop:
  # rx charclass_q d r 1..-1
    sub $I10, rx112_pos, rx112_off
    find_not_cclass $I11, 8, rx112_tgt, $I10, rx112_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx112_fail
    add rx112_pos, rx112_off, $I11
    (rx112_rep) = rx112_cur."!mark_commit"($I116)
    rx112_cur."!mark_push"(rx112_rep, rx112_pos, $I116)
  # rx literal  "_"
    add $I11, rx112_pos, 1
    gt $I11, rx112_eos, rx112_fail
    sub $I11, rx112_pos, rx112_off
    substr $S10, rx112_tgt, $I11, 1
    ne $S10, "_", rx112_fail
    add rx112_pos, 1
    goto rxquantr115_loop
  rxquantr115_done:
  # rx pass
    rx112_cur."!cursor_pass"(rx112_pos, "decint")
    rx112_cur."!cursor_debug"("PASS  ", "decint", " at pos=", rx112_pos)
    .return (rx112_cur)
  rx112_fail:
.annotate "line", 33
    (rx112_rep, rx112_pos, $I10, $P10) = rx112_cur."!mark_fail"(0)
    lt rx112_pos, -1, rx112_done
    eq rx112_pos, -1, rx112_fail
    jump $I10
  rx112_done:
    rx112_cur."!cursor_fail"()
    rx112_cur."!cursor_debug"("FAIL  ", "decint")
    .return (rx112_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decint"  :subid("46_1258388820.35002") :method
.annotate "line", 33
    new $P114, "ResizablePMCArray"
    push $P114, ""
    .return ($P114)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("47_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx118_tgt
    .local int rx118_pos
    .local int rx118_off
    .local int rx118_eos
    .local int rx118_rep
    .local pmc rx118_cur
    (rx118_cur, rx118_pos, rx118_tgt, $I10) = self."!cursor_start"()
    rx118_cur."!cursor_debug"("START ", "hexints")
    rx118_cur."!cursor_caparray"("decint")
    .lex unicode:"$\x{a2}", rx118_cur
    .local pmc match
    .lex "$/", match
    length rx118_eos, rx118_tgt
    set rx118_off, 0
    lt $I10, 2, rx118_start
    sub rx118_off, $I10, 1
    substr rx118_tgt, rx118_tgt, rx118_off
  rx118_start:
.annotate "line", 49
  # rx rxquantr121 ** 1..*
    set_addr $I122, rxquantr121_done
    rx118_cur."!mark_push"(0, -1, $I122)
  rxquantr121_loop:
  # rx subrule "ws" subtype=method negate=
    rx118_cur."!cursor_pos"(rx118_pos)
    $P10 = rx118_cur."ws"()
    unless $P10, rx118_fail
    rx118_pos = $P10."pos"()
  # rx subrule "decint" subtype=capture negate=
    rx118_cur."!cursor_pos"(rx118_pos)
    $P10 = rx118_cur."decint"()
    unless $P10, rx118_fail
    rx118_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    rx118_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx118_cur."!cursor_pos"(rx118_pos)
    $P10 = rx118_cur."ws"()
    unless $P10, rx118_fail
    rx118_pos = $P10."pos"()
    (rx118_rep) = rx118_cur."!mark_commit"($I122)
    rx118_cur."!mark_push"(rx118_rep, rx118_pos, $I122)
  # rx literal  ","
    add $I11, rx118_pos, 1
    gt $I11, rx118_eos, rx118_fail
    sub $I11, rx118_pos, rx118_off
    substr $S10, rx118_tgt, $I11, 1
    ne $S10, ",", rx118_fail
    add rx118_pos, 1
    goto rxquantr121_loop
  rxquantr121_done:
  # rx pass
    rx118_cur."!cursor_pass"(rx118_pos, "hexints")
    rx118_cur."!cursor_debug"("PASS  ", "hexints", " at pos=", rx118_pos)
    .return (rx118_cur)
  rx118_fail:
.annotate "line", 33
    (rx118_rep, rx118_pos, $I10, $P10) = rx118_cur."!mark_fail"(0)
    lt rx118_pos, -1, rx118_done
    eq rx118_pos, -1, rx118_fail
    jump $I10
  rx118_done:
    rx118_cur."!cursor_fail"()
    rx118_cur."!cursor_debug"("FAIL  ", "hexints")
    .return (rx118_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("48_1258388820.35002") :method
.annotate "line", 33
    new $P120, "ResizablePMCArray"
    push $P120, ""
    .return ($P120)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("49_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx124_tgt
    .local int rx124_pos
    .local int rx124_off
    .local int rx124_eos
    .local int rx124_rep
    .local pmc rx124_cur
    (rx124_cur, rx124_pos, rx124_tgt, $I10) = self."!cursor_start"()
    rx124_cur."!cursor_debug"("START ", "hexint")
    .lex unicode:"$\x{a2}", rx124_cur
    .local pmc match
    .lex "$/", match
    length rx124_eos, rx124_tgt
    set rx124_off, 0
    lt $I10, 2, rx124_start
    sub rx124_off, $I10, 1
    substr rx124_tgt, rx124_tgt, rx124_off
  rx124_start:
.annotate "line", 51
  # rx rxquantr127 ** 1..*
    set_addr $I130, rxquantr127_done
    rx124_cur."!mark_push"(0, -1, $I130)
  rxquantr127_loop:
  # rx rxquantr128 ** 1..*
    set_addr $I129, rxquantr128_done
    rx124_cur."!mark_push"(0, -1, $I129)
  rxquantr128_loop:
  # rx enumcharlist negate=0 
    ge rx124_pos, rx124_eos, rx124_fail
    sub $I10, rx124_pos, rx124_off
    substr $S10, rx124_tgt, $I10, 1
    index $I11, "0123456789abcdefABCDEF", $S10
    lt $I11, 0, rx124_fail
    inc rx124_pos
    (rx124_rep) = rx124_cur."!mark_commit"($I129)
    rx124_cur."!mark_push"(rx124_rep, rx124_pos, $I129)
    goto rxquantr128_loop
  rxquantr128_done:
    (rx124_rep) = rx124_cur."!mark_commit"($I130)
    rx124_cur."!mark_push"(rx124_rep, rx124_pos, $I130)
  # rx literal  "_"
    add $I11, rx124_pos, 1
    gt $I11, rx124_eos, rx124_fail
    sub $I11, rx124_pos, rx124_off
    substr $S10, rx124_tgt, $I11, 1
    ne $S10, "_", rx124_fail
    add rx124_pos, 1
    goto rxquantr127_loop
  rxquantr127_done:
  # rx pass
    rx124_cur."!cursor_pass"(rx124_pos, "hexint")
    rx124_cur."!cursor_debug"("PASS  ", "hexint", " at pos=", rx124_pos)
    .return (rx124_cur)
  rx124_fail:
.annotate "line", 33
    (rx124_rep, rx124_pos, $I10, $P10) = rx124_cur."!mark_fail"(0)
    lt rx124_pos, -1, rx124_done
    eq rx124_pos, -1, rx124_fail
    jump $I10
  rx124_done:
    rx124_cur."!cursor_fail"()
    rx124_cur."!cursor_debug"("FAIL  ", "hexint")
    .return (rx124_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexint"  :subid("50_1258388820.35002") :method
.annotate "line", 33
    new $P126, "ResizablePMCArray"
    push $P126, ""
    .return ($P126)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("51_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx132_tgt
    .local int rx132_pos
    .local int rx132_off
    .local int rx132_eos
    .local int rx132_rep
    .local pmc rx132_cur
    (rx132_cur, rx132_pos, rx132_tgt, $I10) = self."!cursor_start"()
    rx132_cur."!cursor_debug"("START ", "hexints")
    rx132_cur."!cursor_caparray"("hexint")
    .lex unicode:"$\x{a2}", rx132_cur
    .local pmc match
    .lex "$/", match
    length rx132_eos, rx132_tgt
    set rx132_off, 0
    lt $I10, 2, rx132_start
    sub rx132_off, $I10, 1
    substr rx132_tgt, rx132_tgt, rx132_off
  rx132_start:
.annotate "line", 52
  # rx rxquantr135 ** 1..*
    set_addr $I136, rxquantr135_done
    rx132_cur."!mark_push"(0, -1, $I136)
  rxquantr135_loop:
  # rx subrule "ws" subtype=method negate=
    rx132_cur."!cursor_pos"(rx132_pos)
    $P10 = rx132_cur."ws"()
    unless $P10, rx132_fail
    rx132_pos = $P10."pos"()
  # rx subrule "hexint" subtype=capture negate=
    rx132_cur."!cursor_pos"(rx132_pos)
    $P10 = rx132_cur."hexint"()
    unless $P10, rx132_fail
    rx132_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx132_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx132_cur."!cursor_pos"(rx132_pos)
    $P10 = rx132_cur."ws"()
    unless $P10, rx132_fail
    rx132_pos = $P10."pos"()
    (rx132_rep) = rx132_cur."!mark_commit"($I136)
    rx132_cur."!mark_push"(rx132_rep, rx132_pos, $I136)
  # rx literal  ","
    add $I11, rx132_pos, 1
    gt $I11, rx132_eos, rx132_fail
    sub $I11, rx132_pos, rx132_off
    substr $S10, rx132_tgt, $I11, 1
    ne $S10, ",", rx132_fail
    add rx132_pos, 1
    goto rxquantr135_loop
  rxquantr135_done:
  # rx pass
    rx132_cur."!cursor_pass"(rx132_pos, "hexints")
    rx132_cur."!cursor_debug"("PASS  ", "hexints", " at pos=", rx132_pos)
    .return (rx132_cur)
  rx132_fail:
.annotate "line", 33
    (rx132_rep, rx132_pos, $I10, $P10) = rx132_cur."!mark_fail"(0)
    lt rx132_pos, -1, rx132_done
    eq rx132_pos, -1, rx132_fail
    jump $I10
  rx132_done:
    rx132_cur."!cursor_fail"()
    rx132_cur."!cursor_debug"("FAIL  ", "hexints")
    .return (rx132_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("52_1258388820.35002") :method
.annotate "line", 33
    new $P134, "ResizablePMCArray"
    push $P134, ""
    .return ($P134)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("53_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx138_tgt
    .local int rx138_pos
    .local int rx138_off
    .local int rx138_eos
    .local int rx138_rep
    .local pmc rx138_cur
    (rx138_cur, rx138_pos, rx138_tgt, $I10) = self."!cursor_start"()
    rx138_cur."!cursor_debug"("START ", "octint")
    .lex unicode:"$\x{a2}", rx138_cur
    .local pmc match
    .lex "$/", match
    length rx138_eos, rx138_tgt
    set rx138_off, 0
    lt $I10, 2, rx138_start
    sub rx138_off, $I10, 1
    substr rx138_tgt, rx138_tgt, rx138_off
  rx138_start:
.annotate "line", 54
  # rx rxquantr141 ** 1..*
    set_addr $I144, rxquantr141_done
    rx138_cur."!mark_push"(0, -1, $I144)
  rxquantr141_loop:
  # rx rxquantr142 ** 1..*
    set_addr $I143, rxquantr142_done
    rx138_cur."!mark_push"(0, -1, $I143)
  rxquantr142_loop:
  # rx enumcharlist negate=0 
    ge rx138_pos, rx138_eos, rx138_fail
    sub $I10, rx138_pos, rx138_off
    substr $S10, rx138_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rx138_fail
    inc rx138_pos
    (rx138_rep) = rx138_cur."!mark_commit"($I143)
    rx138_cur."!mark_push"(rx138_rep, rx138_pos, $I143)
    goto rxquantr142_loop
  rxquantr142_done:
    (rx138_rep) = rx138_cur."!mark_commit"($I144)
    rx138_cur."!mark_push"(rx138_rep, rx138_pos, $I144)
  # rx literal  "_"
    add $I11, rx138_pos, 1
    gt $I11, rx138_eos, rx138_fail
    sub $I11, rx138_pos, rx138_off
    substr $S10, rx138_tgt, $I11, 1
    ne $S10, "_", rx138_fail
    add rx138_pos, 1
    goto rxquantr141_loop
  rxquantr141_done:
  # rx pass
    rx138_cur."!cursor_pass"(rx138_pos, "octint")
    rx138_cur."!cursor_debug"("PASS  ", "octint", " at pos=", rx138_pos)
    .return (rx138_cur)
  rx138_fail:
.annotate "line", 33
    (rx138_rep, rx138_pos, $I10, $P10) = rx138_cur."!mark_fail"(0)
    lt rx138_pos, -1, rx138_done
    eq rx138_pos, -1, rx138_fail
    jump $I10
  rx138_done:
    rx138_cur."!cursor_fail"()
    rx138_cur."!cursor_debug"("FAIL  ", "octint")
    .return (rx138_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octint"  :subid("54_1258388820.35002") :method
.annotate "line", 33
    new $P140, "ResizablePMCArray"
    push $P140, ""
    .return ($P140)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("55_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx146_tgt
    .local int rx146_pos
    .local int rx146_off
    .local int rx146_eos
    .local int rx146_rep
    .local pmc rx146_cur
    (rx146_cur, rx146_pos, rx146_tgt, $I10) = self."!cursor_start"()
    rx146_cur."!cursor_debug"("START ", "octints")
    rx146_cur."!cursor_caparray"("octint")
    .lex unicode:"$\x{a2}", rx146_cur
    .local pmc match
    .lex "$/", match
    length rx146_eos, rx146_tgt
    set rx146_off, 0
    lt $I10, 2, rx146_start
    sub rx146_off, $I10, 1
    substr rx146_tgt, rx146_tgt, rx146_off
  rx146_start:
.annotate "line", 55
  # rx rxquantr149 ** 1..*
    set_addr $I150, rxquantr149_done
    rx146_cur."!mark_push"(0, -1, $I150)
  rxquantr149_loop:
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
  # rx subrule "octint" subtype=capture negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."octint"()
    unless $P10, rx146_fail
    rx146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx146_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
    (rx146_rep) = rx146_cur."!mark_commit"($I150)
    rx146_cur."!mark_push"(rx146_rep, rx146_pos, $I150)
  # rx literal  ","
    add $I11, rx146_pos, 1
    gt $I11, rx146_eos, rx146_fail
    sub $I11, rx146_pos, rx146_off
    substr $S10, rx146_tgt, $I11, 1
    ne $S10, ",", rx146_fail
    add rx146_pos, 1
    goto rxquantr149_loop
  rxquantr149_done:
  # rx pass
    rx146_cur."!cursor_pass"(rx146_pos, "octints")
    rx146_cur."!cursor_debug"("PASS  ", "octints", " at pos=", rx146_pos)
    .return (rx146_cur)
  rx146_fail:
.annotate "line", 33
    (rx146_rep, rx146_pos, $I10, $P10) = rx146_cur."!mark_fail"(0)
    lt rx146_pos, -1, rx146_done
    eq rx146_pos, -1, rx146_fail
    jump $I10
  rx146_done:
    rx146_cur."!cursor_fail"()
    rx146_cur."!cursor_debug"("FAIL  ", "octints")
    .return (rx146_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octints"  :subid("56_1258388820.35002") :method
.annotate "line", 33
    new $P148, "ResizablePMCArray"
    push $P148, ""
    .return ($P148)
.end


.namespace ["HLL";"Grammar"]
.sub "binint"  :subid("57_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx152_tgt
    .local int rx152_pos
    .local int rx152_off
    .local int rx152_eos
    .local int rx152_rep
    .local pmc rx152_cur
    (rx152_cur, rx152_pos, rx152_tgt, $I10) = self."!cursor_start"()
    rx152_cur."!cursor_debug"("START ", "binint")
    .lex unicode:"$\x{a2}", rx152_cur
    .local pmc match
    .lex "$/", match
    length rx152_eos, rx152_tgt
    set rx152_off, 0
    lt $I10, 2, rx152_start
    sub rx152_off, $I10, 1
    substr rx152_tgt, rx152_tgt, rx152_off
  rx152_start:
.annotate "line", 57
  # rx rxquantr155 ** 1..*
    set_addr $I158, rxquantr155_done
    rx152_cur."!mark_push"(0, -1, $I158)
  rxquantr155_loop:
  # rx rxquantr156 ** 1..*
    set_addr $I157, rxquantr156_done
    rx152_cur."!mark_push"(0, -1, $I157)
  rxquantr156_loop:
  # rx enumcharlist negate=0 
    ge rx152_pos, rx152_eos, rx152_fail
    sub $I10, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rx152_fail
    inc rx152_pos
    (rx152_rep) = rx152_cur."!mark_commit"($I157)
    rx152_cur."!mark_push"(rx152_rep, rx152_pos, $I157)
    goto rxquantr156_loop
  rxquantr156_done:
    (rx152_rep) = rx152_cur."!mark_commit"($I158)
    rx152_cur."!mark_push"(rx152_rep, rx152_pos, $I158)
  # rx literal  "_"
    add $I11, rx152_pos, 1
    gt $I11, rx152_eos, rx152_fail
    sub $I11, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I11, 1
    ne $S10, "_", rx152_fail
    add rx152_pos, 1
    goto rxquantr155_loop
  rxquantr155_done:
  # rx pass
    rx152_cur."!cursor_pass"(rx152_pos, "binint")
    rx152_cur."!cursor_debug"("PASS  ", "binint", " at pos=", rx152_pos)
    .return (rx152_cur)
  rx152_fail:
.annotate "line", 33
    (rx152_rep, rx152_pos, $I10, $P10) = rx152_cur."!mark_fail"(0)
    lt rx152_pos, -1, rx152_done
    eq rx152_pos, -1, rx152_fail
    jump $I10
  rx152_done:
    rx152_cur."!cursor_fail"()
    rx152_cur."!cursor_debug"("FAIL  ", "binint")
    .return (rx152_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binint"  :subid("58_1258388820.35002") :method
.annotate "line", 33
    new $P154, "ResizablePMCArray"
    push $P154, ""
    .return ($P154)
.end


.namespace ["HLL";"Grammar"]
.sub "binints"  :subid("59_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx160_tgt
    .local int rx160_pos
    .local int rx160_off
    .local int rx160_eos
    .local int rx160_rep
    .local pmc rx160_cur
    (rx160_cur, rx160_pos, rx160_tgt, $I10) = self."!cursor_start"()
    rx160_cur."!cursor_debug"("START ", "binints")
    rx160_cur."!cursor_caparray"("binint")
    .lex unicode:"$\x{a2}", rx160_cur
    .local pmc match
    .lex "$/", match
    length rx160_eos, rx160_tgt
    set rx160_off, 0
    lt $I10, 2, rx160_start
    sub rx160_off, $I10, 1
    substr rx160_tgt, rx160_tgt, rx160_off
  rx160_start:
.annotate "line", 58
  # rx rxquantr163 ** 1..*
    set_addr $I164, rxquantr163_done
    rx160_cur."!mark_push"(0, -1, $I164)
  rxquantr163_loop:
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  # rx subrule "binint" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."binint"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("binint")
    rx160_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
    (rx160_rep) = rx160_cur."!mark_commit"($I164)
    rx160_cur."!mark_push"(rx160_rep, rx160_pos, $I164)
  # rx literal  ","
    add $I11, rx160_pos, 1
    gt $I11, rx160_eos, rx160_fail
    sub $I11, rx160_pos, rx160_off
    substr $S10, rx160_tgt, $I11, 1
    ne $S10, ",", rx160_fail
    add rx160_pos, 1
    goto rxquantr163_loop
  rxquantr163_done:
  # rx pass
    rx160_cur."!cursor_pass"(rx160_pos, "binints")
    rx160_cur."!cursor_debug"("PASS  ", "binints", " at pos=", rx160_pos)
    .return (rx160_cur)
  rx160_fail:
.annotate "line", 33
    (rx160_rep, rx160_pos, $I10, $P10) = rx160_cur."!mark_fail"(0)
    lt rx160_pos, -1, rx160_done
    eq rx160_pos, -1, rx160_fail
    jump $I10
  rx160_done:
    rx160_cur."!cursor_fail"()
    rx160_cur."!cursor_debug"("FAIL  ", "binints")
    .return (rx160_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binints"  :subid("60_1258388820.35002") :method
.annotate "line", 33
    new $P162, "ResizablePMCArray"
    push $P162, ""
    .return ($P162)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("61_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx166_tgt
    .local int rx166_pos
    .local int rx166_off
    .local int rx166_eos
    .local int rx166_rep
    .local pmc rx166_cur
    (rx166_cur, rx166_pos, rx166_tgt, $I10) = self."!cursor_start"()
    rx166_cur."!cursor_debug"("START ", "integer")
    .lex unicode:"$\x{a2}", rx166_cur
    .local pmc match
    .lex "$/", match
    length rx166_eos, rx166_tgt
    set rx166_off, 0
    lt $I10, 2, rx166_start
    sub rx166_off, $I10, 1
    substr rx166_tgt, rx166_tgt, rx166_off
  rx166_start:
  alt174_0:
.annotate "line", 61
    set_addr $I10, alt174_1
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
.annotate "line", 62
  # rx literal  "0"
    add $I11, rx166_pos, 1
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 1
    ne $S10, "0", rx166_fail
    add rx166_pos, 1
  alt175_0:
    set_addr $I10, alt175_1
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
  # rx literal  "b"
    add $I11, rx166_pos, 1
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 1
    ne $S10, "b", rx166_fail
    add rx166_pos, 1
  # rx subrule "binint" subtype=capture negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."binint"()
    unless $P10, rx166_fail
    rx166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=binint")
    rx166_pos = $P10."pos"()
    goto alt175_end
  alt175_1:
    set_addr $I10, alt175_2
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
.annotate "line", 63
  # rx literal  "o"
    add $I11, rx166_pos, 1
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 1
    ne $S10, "o", rx166_fail
    add rx166_pos, 1
  # rx subrule "octint" subtype=capture negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."octint"()
    unless $P10, rx166_fail
    rx166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=octint")
    rx166_pos = $P10."pos"()
    goto alt175_end
  alt175_2:
    set_addr $I10, alt175_3
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
.annotate "line", 64
  # rx literal  "x"
    add $I11, rx166_pos, 1
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 1
    ne $S10, "x", rx166_fail
    add rx166_pos, 1
  # rx subrule "hexint" subtype=capture negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."hexint"()
    unless $P10, rx166_fail
    rx166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=hexint")
    rx166_pos = $P10."pos"()
    goto alt175_end
  alt175_3:
.annotate "line", 65
  # rx literal  "d"
    add $I11, rx166_pos, 1
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 1
    ne $S10, "d", rx166_fail
    add rx166_pos, 1
  # rx subrule "decint" subtype=capture negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."decint"()
    unless $P10, rx166_fail
    rx166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx166_pos = $P10."pos"()
  alt175_end:
.annotate "line", 62
    goto alt174_end
  alt174_1:
.annotate "line", 67
  # rx subrule "decint" subtype=capture negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."decint"()
    unless $P10, rx166_fail
    rx166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx166_pos = $P10."pos"()
  alt174_end:
.annotate "line", 60
  # rx pass
    rx166_cur."!cursor_pass"(rx166_pos, "integer")
    rx166_cur."!cursor_debug"("PASS  ", "integer", " at pos=", rx166_pos)
    .return (rx166_cur)
  rx166_fail:
.annotate "line", 33
    (rx166_rep, rx166_pos, $I10, $P10) = rx166_cur."!mark_fail"(0)
    lt rx166_pos, -1, rx166_done
    eq rx166_pos, -1, rx166_fail
    jump $I10
  rx166_done:
    rx166_cur."!cursor_fail"()
    rx166_cur."!cursor_debug"("FAIL  ", "integer")
    .return (rx166_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__integer"  :subid("62_1258388820.35002") :method
.annotate "line", 33
    $P168 = self."!PREFIX__!subrule"("VALUE=decint", "")
    $P169 = self."!PREFIX__!subrule"("VALUE=decint", "0d")
    $P170 = self."!PREFIX__!subrule"("VALUE=hexint", "0x")
    $P171 = self."!PREFIX__!subrule"("VALUE=octint", "0o")
    $P172 = self."!PREFIX__!subrule"("VALUE=binint", "0b")
    new $P173, "ResizablePMCArray"
    push $P173, $P168
    push $P173, $P169
    push $P173, $P170
    push $P173, $P171
    push $P173, $P172
    .return ($P173)
.end


.namespace ["HLL";"Grammar"]
.sub "dec_number"  :subid("63_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt, $I10) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "dec_number")
    rx177_cur."!cursor_caparray"("escale")
    .lex unicode:"$\x{a2}", rx177_cur
    .local pmc match
    .lex "$/", match
    length rx177_eos, rx177_tgt
    set rx177_off, 0
    lt $I10, 2, rx177_start
    sub rx177_off, $I10, 1
    substr rx177_tgt, rx177_tgt, rx177_off
  rx177_start:
  alt180_0:
.annotate "line", 71
    set_addr $I10, alt180_1
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
.annotate "line", 72
  # rx subcapture "coeff"
    set_addr $I10, rxcap_181_fail
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  # rx literal  "."
    add $I11, rx177_pos, 1
    gt $I11, rx177_eos, rx177_fail
    sub $I11, rx177_pos, rx177_off
    substr $S10, rx177_tgt, $I11, 1
    ne $S10, ".", rx177_fail
    add rx177_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx177_pos, rx177_off
    find_not_cclass $I11, 8, rx177_tgt, $I10, rx177_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx177_fail
    add rx177_pos, rx177_off, $I11
    set_addr $I10, rxcap_181_fail
    ($I12, $I11) = rx177_cur."!mark_peek"($I10)
    rx177_cur."!cursor_pos"($I11)
    ($P10) = rx177_cur."!cursor_start"()
    $P10."!cursor_pass"(rx177_pos, "")
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_181_done
  rxcap_181_fail:
    goto rx177_fail
  rxcap_181_done:
  # rx rxquantr182 ** 0..1
    set_addr $I183, rxquantr182_done
    rx177_cur."!mark_push"(0, rx177_pos, $I183)
  rxquantr182_loop:
  # rx subrule "escale" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."escale"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx177_pos = $P10."pos"()
    (rx177_rep) = rx177_cur."!mark_commit"($I183)
  rxquantr182_done:
    goto alt180_end
  alt180_1:
    set_addr $I10, alt180_2
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
.annotate "line", 73
  # rx subcapture "coeff"
    set_addr $I10, rxcap_184_fail
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx177_pos, rx177_off
    find_not_cclass $I11, 8, rx177_tgt, $I10, rx177_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx177_fail
    add rx177_pos, rx177_off, $I11
  # rx literal  "."
    add $I11, rx177_pos, 1
    gt $I11, rx177_eos, rx177_fail
    sub $I11, rx177_pos, rx177_off
    substr $S10, rx177_tgt, $I11, 1
    ne $S10, ".", rx177_fail
    add rx177_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx177_pos, rx177_off
    find_not_cclass $I11, 8, rx177_tgt, $I10, rx177_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx177_fail
    add rx177_pos, rx177_off, $I11
    set_addr $I10, rxcap_184_fail
    ($I12, $I11) = rx177_cur."!mark_peek"($I10)
    rx177_cur."!cursor_pos"($I11)
    ($P10) = rx177_cur."!cursor_start"()
    $P10."!cursor_pass"(rx177_pos, "")
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_184_done
  rxcap_184_fail:
    goto rx177_fail
  rxcap_184_done:
  # rx rxquantr185 ** 0..1
    set_addr $I186, rxquantr185_done
    rx177_cur."!mark_push"(0, rx177_pos, $I186)
  rxquantr185_loop:
  # rx subrule "escale" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."escale"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx177_pos = $P10."pos"()
    (rx177_rep) = rx177_cur."!mark_commit"($I186)
  rxquantr185_done:
    goto alt180_end
  alt180_2:
.annotate "line", 74
  # rx subcapture "coeff"
    set_addr $I10, rxcap_187_fail
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx177_pos, rx177_off
    find_not_cclass $I11, 8, rx177_tgt, $I10, rx177_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx177_fail
    add rx177_pos, rx177_off, $I11
    set_addr $I10, rxcap_187_fail
    ($I12, $I11) = rx177_cur."!mark_peek"($I10)
    rx177_cur."!cursor_pos"($I11)
    ($P10) = rx177_cur."!cursor_start"()
    $P10."!cursor_pass"(rx177_pos, "")
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_187_done
  rxcap_187_fail:
    goto rx177_fail
  rxcap_187_done:
  # rx subrule "escale" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."escale"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx177_pos = $P10."pos"()
  alt180_end:
.annotate "line", 71
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "dec_number")
    rx177_cur."!cursor_debug"("PASS  ", "dec_number", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_fail:
.annotate "line", 33
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "dec_number")
    .return (rx177_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__dec_number"  :subid("64_1258388820.35002") :method
.annotate "line", 33
    new $P179, "ResizablePMCArray"
    push $P179, ""
    push $P179, ""
    push $P179, "."
    .return ($P179)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("65_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt, $I10) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "escale")
    .lex unicode:"$\x{a2}", rx189_cur
    .local pmc match
    .lex "$/", match
    length rx189_eos, rx189_tgt
    set rx189_off, 0
    lt $I10, 2, rx189_start
    sub rx189_off, $I10, 1
    substr rx189_tgt, rx189_tgt, rx189_off
  rx189_start:
.annotate "line", 77
  # rx enumcharlist negate=0 
    ge rx189_pos, rx189_eos, rx189_fail
    sub $I10, rx189_pos, rx189_off
    substr $S10, rx189_tgt, $I10, 1
    index $I11, "Ee", $S10
    lt $I11, 0, rx189_fail
    inc rx189_pos
  # rx rxquantr192 ** 0..1
    set_addr $I193, rxquantr192_done
    rx189_cur."!mark_push"(0, rx189_pos, $I193)
  rxquantr192_loop:
  # rx enumcharlist negate=0 
    ge rx189_pos, rx189_eos, rx189_fail
    sub $I10, rx189_pos, rx189_off
    substr $S10, rx189_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx189_fail
    inc rx189_pos
    (rx189_rep) = rx189_cur."!mark_commit"($I193)
  rxquantr192_done:
  # rx charclass_q d r 1..-1
    sub $I10, rx189_pos, rx189_off
    find_not_cclass $I11, 8, rx189_tgt, $I10, rx189_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx189_fail
    add rx189_pos, rx189_off, $I11
  # rx pass
    rx189_cur."!cursor_pass"(rx189_pos, "escale")
    rx189_cur."!cursor_debug"("PASS  ", "escale", " at pos=", rx189_pos)
    .return (rx189_cur)
  rx189_fail:
.annotate "line", 33
    (rx189_rep, rx189_pos, $I10, $P10) = rx189_cur."!mark_fail"(0)
    lt rx189_pos, -1, rx189_done
    eq rx189_pos, -1, rx189_fail
    jump $I10
  rx189_done:
    rx189_cur."!cursor_fail"()
    rx189_cur."!cursor_debug"("FAIL  ", "escale")
    .return (rx189_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__escale"  :subid("66_1258388820.35002") :method
.annotate "line", 33
    new $P191, "ResizablePMCArray"
    push $P191, "e"
    push $P191, "E"
    .return ($P191)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("67_1258388820.35002") :method
.annotate "line", 79
    $P195 = self."!protoregex"("quote_escape")
    .return ($P195)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("68_1258388820.35002") :method
.annotate "line", 79
    $P197 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P197)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("69_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx199_tgt
    .local int rx199_pos
    .local int rx199_off
    .local int rx199_eos
    .local int rx199_rep
    .local pmc rx199_cur
    (rx199_cur, rx199_pos, rx199_tgt, $I10) = self."!cursor_start"()
    rx199_cur."!cursor_debug"("START ", "quote_escape:sym<backslash>")
    .lex unicode:"$\x{a2}", rx199_cur
    .local pmc match
    .lex "$/", match
    length rx199_eos, rx199_tgt
    set rx199_off, 0
    lt $I10, 2, rx199_start
    sub rx199_off, $I10, 1
    substr rx199_tgt, rx199_tgt, rx199_off
  rx199_start:
.annotate "line", 80
  # rx literal  "\\\\"
    add $I11, rx199_pos, 2
    gt $I11, rx199_eos, rx199_fail
    sub $I11, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I11, 2
    ne $S10, "\\\\", rx199_fail
    add rx199_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."quotemod_check"("q")
    unless $P10, rx199_fail
  # rx pass
    rx199_cur."!cursor_pass"(rx199_pos, "quote_escape:sym<backslash>")
    rx199_cur."!cursor_debug"("PASS  ", "quote_escape:sym<backslash>", " at pos=", rx199_pos)
    .return (rx199_cur)
  rx199_fail:
.annotate "line", 33
    (rx199_rep, rx199_pos, $I10, $P10) = rx199_cur."!mark_fail"(0)
    lt rx199_pos, -1, rx199_done
    eq rx199_pos, -1, rx199_fail
    jump $I10
  rx199_done:
    rx199_cur."!cursor_fail"()
    rx199_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<backslash>")
    .return (rx199_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("70_1258388820.35002") :method
.annotate "line", 33
    new $P201, "ResizablePMCArray"
    push $P201, "\\\\"
    .return ($P201)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("71_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt, $I10) = self."!cursor_start"()
    rx203_cur."!cursor_debug"("START ", "quote_escape:sym<stopper>")
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    set rx203_off, 0
    lt $I10, 2, rx203_start
    sub rx203_off, $I10, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
.annotate "line", 81
  # rx literal  "\\"
    add $I11, rx203_pos, 1
    gt $I11, rx203_eos, rx203_fail
    sub $I11, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I11, 1
    ne $S10, "\\", rx203_fail
    add rx203_pos, 1
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."quotemod_check"("q")
    unless $P10, rx203_fail
  # rx subrule "stopper" subtype=capture negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."stopper"()
    unless $P10, rx203_fail
    rx203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx203_pos = $P10."pos"()
  # rx pass
    rx203_cur."!cursor_pass"(rx203_pos, "quote_escape:sym<stopper>")
    rx203_cur."!cursor_debug"("PASS  ", "quote_escape:sym<stopper>", " at pos=", rx203_pos)
    .return (rx203_cur)
  rx203_fail:
.annotate "line", 33
    (rx203_rep, rx203_pos, $I10, $P10) = rx203_cur."!mark_fail"(0)
    lt rx203_pos, -1, rx203_done
    eq rx203_pos, -1, rx203_fail
    jump $I10
  rx203_done:
    rx203_cur."!cursor_fail"()
    rx203_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<stopper>")
    .return (rx203_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("72_1258388820.35002") :method
.annotate "line", 33
    new $P205, "ResizablePMCArray"
    push $P205, "\\"
    .return ($P205)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("73_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx207_tgt
    .local int rx207_pos
    .local int rx207_off
    .local int rx207_eos
    .local int rx207_rep
    .local pmc rx207_cur
    (rx207_cur, rx207_pos, rx207_tgt, $I10) = self."!cursor_start"()
    rx207_cur."!cursor_debug"("START ", "quote_escape:sym<bs>")
    .lex unicode:"$\x{a2}", rx207_cur
    .local pmc match
    .lex "$/", match
    length rx207_eos, rx207_tgt
    set rx207_off, 0
    lt $I10, 2, rx207_start
    sub rx207_off, $I10, 1
    substr rx207_tgt, rx207_tgt, rx207_off
  rx207_start:
.annotate "line", 83
  # rx literal  "\\b"
    add $I11, rx207_pos, 2
    gt $I11, rx207_eos, rx207_fail
    sub $I11, rx207_pos, rx207_off
    substr $S10, rx207_tgt, $I11, 2
    ne $S10, "\\b", rx207_fail
    add rx207_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx207_cur."!cursor_pos"(rx207_pos)
    $P10 = rx207_cur."quotemod_check"("b")
    unless $P10, rx207_fail
  # rx pass
    rx207_cur."!cursor_pass"(rx207_pos, "quote_escape:sym<bs>")
    rx207_cur."!cursor_debug"("PASS  ", "quote_escape:sym<bs>", " at pos=", rx207_pos)
    .return (rx207_cur)
  rx207_fail:
.annotate "line", 33
    (rx207_rep, rx207_pos, $I10, $P10) = rx207_cur."!mark_fail"(0)
    lt rx207_pos, -1, rx207_done
    eq rx207_pos, -1, rx207_fail
    jump $I10
  rx207_done:
    rx207_cur."!cursor_fail"()
    rx207_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<bs>")
    .return (rx207_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("74_1258388820.35002") :method
.annotate "line", 33
    new $P209, "ResizablePMCArray"
    push $P209, "\\b"
    .return ($P209)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("75_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx211_tgt
    .local int rx211_pos
    .local int rx211_off
    .local int rx211_eos
    .local int rx211_rep
    .local pmc rx211_cur
    (rx211_cur, rx211_pos, rx211_tgt, $I10) = self."!cursor_start"()
    rx211_cur."!cursor_debug"("START ", "quote_escape:sym<nl>")
    .lex unicode:"$\x{a2}", rx211_cur
    .local pmc match
    .lex "$/", match
    length rx211_eos, rx211_tgt
    set rx211_off, 0
    lt $I10, 2, rx211_start
    sub rx211_off, $I10, 1
    substr rx211_tgt, rx211_tgt, rx211_off
  rx211_start:
.annotate "line", 84
  # rx literal  "\\n"
    add $I11, rx211_pos, 2
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 2
    ne $S10, "\\n", rx211_fail
    add rx211_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."quotemod_check"("b")
    unless $P10, rx211_fail
  # rx pass
    rx211_cur."!cursor_pass"(rx211_pos, "quote_escape:sym<nl>")
    rx211_cur."!cursor_debug"("PASS  ", "quote_escape:sym<nl>", " at pos=", rx211_pos)
    .return (rx211_cur)
  rx211_fail:
.annotate "line", 33
    (rx211_rep, rx211_pos, $I10, $P10) = rx211_cur."!mark_fail"(0)
    lt rx211_pos, -1, rx211_done
    eq rx211_pos, -1, rx211_fail
    jump $I10
  rx211_done:
    rx211_cur."!cursor_fail"()
    rx211_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<nl>")
    .return (rx211_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("76_1258388820.35002") :method
.annotate "line", 33
    new $P213, "ResizablePMCArray"
    push $P213, "\\n"
    .return ($P213)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("77_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx215_tgt
    .local int rx215_pos
    .local int rx215_off
    .local int rx215_eos
    .local int rx215_rep
    .local pmc rx215_cur
    (rx215_cur, rx215_pos, rx215_tgt, $I10) = self."!cursor_start"()
    rx215_cur."!cursor_debug"("START ", "quote_escape:sym<cr>")
    .lex unicode:"$\x{a2}", rx215_cur
    .local pmc match
    .lex "$/", match
    length rx215_eos, rx215_tgt
    set rx215_off, 0
    lt $I10, 2, rx215_start
    sub rx215_off, $I10, 1
    substr rx215_tgt, rx215_tgt, rx215_off
  rx215_start:
.annotate "line", 85
  # rx literal  "\\r"
    add $I11, rx215_pos, 2
    gt $I11, rx215_eos, rx215_fail
    sub $I11, rx215_pos, rx215_off
    substr $S10, rx215_tgt, $I11, 2
    ne $S10, "\\r", rx215_fail
    add rx215_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx215_cur."!cursor_pos"(rx215_pos)
    $P10 = rx215_cur."quotemod_check"("b")
    unless $P10, rx215_fail
  # rx pass
    rx215_cur."!cursor_pass"(rx215_pos, "quote_escape:sym<cr>")
    rx215_cur."!cursor_debug"("PASS  ", "quote_escape:sym<cr>", " at pos=", rx215_pos)
    .return (rx215_cur)
  rx215_fail:
.annotate "line", 33
    (rx215_rep, rx215_pos, $I10, $P10) = rx215_cur."!mark_fail"(0)
    lt rx215_pos, -1, rx215_done
    eq rx215_pos, -1, rx215_fail
    jump $I10
  rx215_done:
    rx215_cur."!cursor_fail"()
    rx215_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<cr>")
    .return (rx215_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("78_1258388820.35002") :method
.annotate "line", 33
    new $P217, "ResizablePMCArray"
    push $P217, "\\r"
    .return ($P217)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("79_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx219_tgt
    .local int rx219_pos
    .local int rx219_off
    .local int rx219_eos
    .local int rx219_rep
    .local pmc rx219_cur
    (rx219_cur, rx219_pos, rx219_tgt, $I10) = self."!cursor_start"()
    rx219_cur."!cursor_debug"("START ", "quote_escape:sym<tab>")
    .lex unicode:"$\x{a2}", rx219_cur
    .local pmc match
    .lex "$/", match
    length rx219_eos, rx219_tgt
    set rx219_off, 0
    lt $I10, 2, rx219_start
    sub rx219_off, $I10, 1
    substr rx219_tgt, rx219_tgt, rx219_off
  rx219_start:
.annotate "line", 86
  # rx literal  "\\t"
    add $I11, rx219_pos, 2
    gt $I11, rx219_eos, rx219_fail
    sub $I11, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I11, 2
    ne $S10, "\\t", rx219_fail
    add rx219_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."quotemod_check"("b")
    unless $P10, rx219_fail
  # rx pass
    rx219_cur."!cursor_pass"(rx219_pos, "quote_escape:sym<tab>")
    rx219_cur."!cursor_debug"("PASS  ", "quote_escape:sym<tab>", " at pos=", rx219_pos)
    .return (rx219_cur)
  rx219_fail:
.annotate "line", 33
    (rx219_rep, rx219_pos, $I10, $P10) = rx219_cur."!mark_fail"(0)
    lt rx219_pos, -1, rx219_done
    eq rx219_pos, -1, rx219_fail
    jump $I10
  rx219_done:
    rx219_cur."!cursor_fail"()
    rx219_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<tab>")
    .return (rx219_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("80_1258388820.35002") :method
.annotate "line", 33
    new $P221, "ResizablePMCArray"
    push $P221, "\\t"
    .return ($P221)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("81_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx223_tgt
    .local int rx223_pos
    .local int rx223_off
    .local int rx223_eos
    .local int rx223_rep
    .local pmc rx223_cur
    (rx223_cur, rx223_pos, rx223_tgt, $I10) = self."!cursor_start"()
    rx223_cur."!cursor_debug"("START ", "quote_escape:sym<hex>")
    .lex unicode:"$\x{a2}", rx223_cur
    .local pmc match
    .lex "$/", match
    length rx223_eos, rx223_tgt
    set rx223_off, 0
    lt $I10, 2, rx223_start
    sub rx223_off, $I10, 1
    substr rx223_tgt, rx223_tgt, rx223_off
  rx223_start:
.annotate "line", 88
  # rx literal  unicode:"\\x"
    add $I11, rx223_pos, 2
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    substr $S10, rx223_tgt, $I11, 2
    ne $S10, unicode:"\\x", rx223_fail
    add rx223_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx223_cur."!cursor_pos"(rx223_pos)
    $P10 = rx223_cur."quotemod_check"("b")
    unless $P10, rx223_fail
  alt226_0:
.annotate "line", 89
    set_addr $I10, alt226_1
    rx223_cur."!mark_push"(0, rx223_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx223_cur."!cursor_pos"(rx223_pos)
    $P10 = rx223_cur."hexint"()
    unless $P10, rx223_fail
    rx223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx223_pos = $P10."pos"()
    goto alt226_end
  alt226_1:
  # rx literal  "["
    add $I11, rx223_pos, 1
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    substr $S10, rx223_tgt, $I11, 1
    ne $S10, "[", rx223_fail
    add rx223_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx223_cur."!cursor_pos"(rx223_pos)
    $P10 = rx223_cur."hexints"()
    unless $P10, rx223_fail
    rx223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx223_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx223_pos, 1
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    substr $S10, rx223_tgt, $I11, 1
    ne $S10, "]", rx223_fail
    add rx223_pos, 1
  alt226_end:
.annotate "line", 87
  # rx pass
    rx223_cur."!cursor_pass"(rx223_pos, "quote_escape:sym<hex>")
    rx223_cur."!cursor_debug"("PASS  ", "quote_escape:sym<hex>", " at pos=", rx223_pos)
    .return (rx223_cur)
  rx223_fail:
.annotate "line", 33
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    rx223_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<hex>")
    .return (rx223_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("82_1258388820.35002") :method
.annotate "line", 33
    new $P225, "ResizablePMCArray"
    push $P225, unicode:"\\x"
    .return ($P225)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("83_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx228_tgt
    .local int rx228_pos
    .local int rx228_off
    .local int rx228_eos
    .local int rx228_rep
    .local pmc rx228_cur
    (rx228_cur, rx228_pos, rx228_tgt, $I10) = self."!cursor_start"()
    rx228_cur."!cursor_debug"("START ", "quote_escape:sym<oct>")
    .lex unicode:"$\x{a2}", rx228_cur
    .local pmc match
    .lex "$/", match
    length rx228_eos, rx228_tgt
    set rx228_off, 0
    lt $I10, 2, rx228_start
    sub rx228_off, $I10, 1
    substr rx228_tgt, rx228_tgt, rx228_off
  rx228_start:
.annotate "line", 92
  # rx literal  "\\o"
    add $I11, rx228_pos, 2
    gt $I11, rx228_eos, rx228_fail
    sub $I11, rx228_pos, rx228_off
    substr $S10, rx228_tgt, $I11, 2
    ne $S10, "\\o", rx228_fail
    add rx228_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx228_cur."!cursor_pos"(rx228_pos)
    $P10 = rx228_cur."quotemod_check"("b")
    unless $P10, rx228_fail
  alt231_0:
.annotate "line", 93
    set_addr $I10, alt231_1
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx228_cur."!cursor_pos"(rx228_pos)
    $P10 = rx228_cur."octint"()
    unless $P10, rx228_fail
    rx228_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx228_pos = $P10."pos"()
    goto alt231_end
  alt231_1:
  # rx literal  "["
    add $I11, rx228_pos, 1
    gt $I11, rx228_eos, rx228_fail
    sub $I11, rx228_pos, rx228_off
    substr $S10, rx228_tgt, $I11, 1
    ne $S10, "[", rx228_fail
    add rx228_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx228_cur."!cursor_pos"(rx228_pos)
    $P10 = rx228_cur."octints"()
    unless $P10, rx228_fail
    rx228_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx228_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx228_pos, 1
    gt $I11, rx228_eos, rx228_fail
    sub $I11, rx228_pos, rx228_off
    substr $S10, rx228_tgt, $I11, 1
    ne $S10, "]", rx228_fail
    add rx228_pos, 1
  alt231_end:
.annotate "line", 91
  # rx pass
    rx228_cur."!cursor_pass"(rx228_pos, "quote_escape:sym<oct>")
    rx228_cur."!cursor_debug"("PASS  ", "quote_escape:sym<oct>", " at pos=", rx228_pos)
    .return (rx228_cur)
  rx228_fail:
.annotate "line", 33
    (rx228_rep, rx228_pos, $I10, $P10) = rx228_cur."!mark_fail"(0)
    lt rx228_pos, -1, rx228_done
    eq rx228_pos, -1, rx228_fail
    jump $I10
  rx228_done:
    rx228_cur."!cursor_fail"()
    rx228_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<oct>")
    .return (rx228_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("84_1258388820.35002") :method
.annotate "line", 33
    new $P230, "ResizablePMCArray"
    push $P230, "\\o"
    .return ($P230)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("85_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx233_tgt
    .local int rx233_pos
    .local int rx233_off
    .local int rx233_eos
    .local int rx233_rep
    .local pmc rx233_cur
    (rx233_cur, rx233_pos, rx233_tgt, $I10) = self."!cursor_start"()
    rx233_cur."!cursor_debug"("START ", "quote_escape:sym<chr>")
    .lex unicode:"$\x{a2}", rx233_cur
    .local pmc match
    .lex "$/", match
    length rx233_eos, rx233_tgt
    set rx233_off, 0
    lt $I10, 2, rx233_start
    sub rx233_off, $I10, 1
    substr rx233_tgt, rx233_tgt, rx233_off
  rx233_start:
.annotate "line", 95
  # rx literal  "\\c"
    add $I11, rx233_pos, 2
    gt $I11, rx233_eos, rx233_fail
    sub $I11, rx233_pos, rx233_off
    substr $S10, rx233_tgt, $I11, 2
    ne $S10, "\\c", rx233_fail
    add rx233_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx233_cur."!cursor_pos"(rx233_pos)
    $P10 = rx233_cur."quotemod_check"("b")
    unless $P10, rx233_fail
  # rx subrule "charspec" subtype=capture negate=
    rx233_cur."!cursor_pos"(rx233_pos)
    $P10 = rx233_cur."charspec"()
    unless $P10, rx233_fail
    rx233_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx233_pos = $P10."pos"()
  # rx pass
    rx233_cur."!cursor_pass"(rx233_pos, "quote_escape:sym<chr>")
    rx233_cur."!cursor_debug"("PASS  ", "quote_escape:sym<chr>", " at pos=", rx233_pos)
    .return (rx233_cur)
  rx233_fail:
.annotate "line", 33
    (rx233_rep, rx233_pos, $I10, $P10) = rx233_cur."!mark_fail"(0)
    lt rx233_pos, -1, rx233_done
    eq rx233_pos, -1, rx233_fail
    jump $I10
  rx233_done:
    rx233_cur."!cursor_fail"()
    rx233_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<chr>")
    .return (rx233_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("86_1258388820.35002") :method
.annotate "line", 33
    new $P235, "ResizablePMCArray"
    push $P235, "\\c"
    .return ($P235)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("87_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .const 'Sub' $P245 = "89_1258388820.35002" 
    capture_lex $P245
    .local string rx237_tgt
    .local int rx237_pos
    .local int rx237_off
    .local int rx237_eos
    .local int rx237_rep
    .local pmc rx237_cur
    (rx237_cur, rx237_pos, rx237_tgt, $I10) = self."!cursor_start"()
    rx237_cur."!cursor_debug"("START ", "charname")
    .lex unicode:"$\x{a2}", rx237_cur
    .local pmc match
    .lex "$/", match
    length rx237_eos, rx237_tgt
    set rx237_off, 0
    lt $I10, 2, rx237_start
    sub rx237_off, $I10, 1
    substr rx237_tgt, rx237_tgt, rx237_off
  rx237_start:
  alt241_0:
.annotate "line", 97
    set_addr $I10, alt241_1
    rx237_cur."!mark_push"(0, rx237_pos, $I10)
.annotate "line", 98
  # rx subrule "integer" subtype=capture negate=
    rx237_cur."!cursor_pos"(rx237_pos)
    $P10 = rx237_cur."integer"()
    unless $P10, rx237_fail
    rx237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx237_pos = $P10."pos"()
    goto alt241_end
  alt241_1:
.annotate "line", 99
  # rx enumcharlist negate=0 
    ge rx237_pos, rx237_eos, rx237_fail
    sub $I10, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx237_fail
    inc rx237_pos
  # rx rxquantf242 ** 0..*
    set_addr $I10, rxquantf242_loop
    rx237_cur."!mark_push"(0, rx237_pos, $I10)
    goto rxquantf242_done
  rxquantf242_loop:
  # rx enumcharlist negate=1 
    ge rx237_pos, rx237_eos, rx237_fail
    sub $I10, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I10, 1
    index $I11, "],#", $S10
    ge $I11, 0, rx237_fail
    inc rx237_pos
    set_addr $I10, rxquantf242_loop
    rx237_cur."!mark_push"($I243, rx237_pos, $I10)
  rxquantf242_done:
  # rx enumcharlist negate=0 
    ge rx237_pos, rx237_eos, rx237_fail
    sub $I10, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)", $S10
    lt $I11, 0, rx237_fail
    inc rx237_pos
.annotate "line", 100
  # rx subrule "before" subtype=zerowidth negate=
    rx237_cur."!cursor_pos"(rx237_pos)
    .const 'Sub' $P245 = "89_1258388820.35002" 
    capture_lex $P245
    $P10 = rx237_cur."before"($P245)
    unless $P10, rx237_fail
  alt241_end:
.annotate "line", 97
  # rx pass
    rx237_cur."!cursor_pass"(rx237_pos, "charname")
    rx237_cur."!cursor_debug"("PASS  ", "charname", " at pos=", rx237_pos)
    .return (rx237_cur)
  rx237_fail:
.annotate "line", 33
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    rx237_cur."!cursor_debug"("FAIL  ", "charname")
    .return (rx237_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charname"  :subid("88_1258388820.35002") :method
.annotate "line", 33
    $P239 = self."!PREFIX__!subrule"("integer", "")
    new $P240, "ResizablePMCArray"
    push $P240, "Z"
    push $P240, "Y"
    push $P240, "X"
    push $P240, "W"
    push $P240, "V"
    push $P240, "U"
    push $P240, "T"
    push $P240, "S"
    push $P240, "R"
    push $P240, "Q"
    push $P240, "P"
    push $P240, "O"
    push $P240, "N"
    push $P240, "M"
    push $P240, "L"
    push $P240, "K"
    push $P240, "J"
    push $P240, "I"
    push $P240, "H"
    push $P240, "G"
    push $P240, "F"
    push $P240, "E"
    push $P240, "D"
    push $P240, "C"
    push $P240, "B"
    push $P240, "A"
    push $P240, "z"
    push $P240, "y"
    push $P240, "x"
    push $P240, "w"
    push $P240, "v"
    push $P240, "u"
    push $P240, "t"
    push $P240, "s"
    push $P240, "r"
    push $P240, "q"
    push $P240, "p"
    push $P240, "o"
    push $P240, "n"
    push $P240, "m"
    push $P240, "l"
    push $P240, "k"
    push $P240, "j"
    push $P240, "i"
    push $P240, "h"
    push $P240, "g"
    push $P240, "f"
    push $P240, "e"
    push $P240, "d"
    push $P240, "c"
    push $P240, "b"
    push $P240, "a"
    push $P240, $P239
    .return ($P240)
.end


.namespace ["HLL";"Grammar"]
.sub "_block244"  :anon :subid("89_1258388820.35002") :method :outer("87_1258388820.35002")
.annotate "line", 100
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    rx246_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    set rx246_off, 0
    lt $I10, 2, rx246_start
    sub rx246_off, $I10, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
    ge rx246_pos, 0, rxscan247_done
  rxscan247_loop:
    ($P10) = rx246_cur."from"()
    inc $P10
    set rx246_pos, $P10
    ge rx246_pos, rx246_eos, rxscan247_done
    set_addr $I10, rxscan247_loop
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxscan247_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx246_pos, rx246_off
    find_not_cclass $I11, 32, rx246_tgt, $I10, rx246_eos
    add rx246_pos, rx246_off, $I11
  # rx enumcharlist negate=0 
    ge rx246_pos, rx246_eos, rx246_fail
    sub $I10, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I10, 1
    index $I11, "],#", $S10
    lt $I11, 0, rx246_fail
    inc rx246_pos
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "")
    rx246_cur."!cursor_debug"("PASS  ", "", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "")
    .return (rx246_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "charnames"  :subid("90_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx249_tgt
    .local int rx249_pos
    .local int rx249_off
    .local int rx249_eos
    .local int rx249_rep
    .local pmc rx249_cur
    (rx249_cur, rx249_pos, rx249_tgt, $I10) = self."!cursor_start"()
    rx249_cur."!cursor_debug"("START ", "charnames")
    rx249_cur."!cursor_caparray"("charname")
    .lex unicode:"$\x{a2}", rx249_cur
    .local pmc match
    .lex "$/", match
    length rx249_eos, rx249_tgt
    set rx249_off, 0
    lt $I10, 2, rx249_start
    sub rx249_off, $I10, 1
    substr rx249_tgt, rx249_tgt, rx249_off
  rx249_start:
.annotate "line", 102
  # rx rxquantr252 ** 1..*
    set_addr $I253, rxquantr252_done
    rx249_cur."!mark_push"(0, -1, $I253)
  rxquantr252_loop:
  # rx subrule "ws" subtype=method negate=
    rx249_cur."!cursor_pos"(rx249_pos)
    $P10 = rx249_cur."ws"()
    unless $P10, rx249_fail
    rx249_pos = $P10."pos"()
  # rx subrule "charname" subtype=capture negate=
    rx249_cur."!cursor_pos"(rx249_pos)
    $P10 = rx249_cur."charname"()
    unless $P10, rx249_fail
    rx249_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charname")
    rx249_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx249_cur."!cursor_pos"(rx249_pos)
    $P10 = rx249_cur."ws"()
    unless $P10, rx249_fail
    rx249_pos = $P10."pos"()
    (rx249_rep) = rx249_cur."!mark_commit"($I253)
    rx249_cur."!mark_push"(rx249_rep, rx249_pos, $I253)
  # rx literal  ","
    add $I11, rx249_pos, 1
    gt $I11, rx249_eos, rx249_fail
    sub $I11, rx249_pos, rx249_off
    substr $S10, rx249_tgt, $I11, 1
    ne $S10, ",", rx249_fail
    add rx249_pos, 1
    goto rxquantr252_loop
  rxquantr252_done:
  # rx pass
    rx249_cur."!cursor_pass"(rx249_pos, "charnames")
    rx249_cur."!cursor_debug"("PASS  ", "charnames", " at pos=", rx249_pos)
    .return (rx249_cur)
  rx249_fail:
.annotate "line", 33
    (rx249_rep, rx249_pos, $I10, $P10) = rx249_cur."!mark_fail"(0)
    lt rx249_pos, -1, rx249_done
    eq rx249_pos, -1, rx249_fail
    jump $I10
  rx249_done:
    rx249_cur."!cursor_fail"()
    rx249_cur."!cursor_debug"("FAIL  ", "charnames")
    .return (rx249_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charnames"  :subid("91_1258388820.35002") :method
.annotate "line", 33
    new $P251, "ResizablePMCArray"
    push $P251, ""
    .return ($P251)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("92_1258388820.35002") :method :outer("11_1258388820.35002")
.annotate "line", 33
    .local string rx255_tgt
    .local int rx255_pos
    .local int rx255_off
    .local int rx255_eos
    .local int rx255_rep
    .local pmc rx255_cur
    (rx255_cur, rx255_pos, rx255_tgt, $I10) = self."!cursor_start"()
    rx255_cur."!cursor_debug"("START ", "charspec")
    .lex unicode:"$\x{a2}", rx255_cur
    .local pmc match
    .lex "$/", match
    length rx255_eos, rx255_tgt
    set rx255_off, 0
    lt $I10, 2, rx255_start
    sub rx255_off, $I10, 1
    substr rx255_tgt, rx255_tgt, rx255_off
  rx255_start:
  alt260_0:
.annotate "line", 104
    set_addr $I10, alt260_1
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
.annotate "line", 105
  # rx literal  "["
    add $I11, rx255_pos, 1
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 1
    ne $S10, "[", rx255_fail
    add rx255_pos, 1
  # rx subrule "charnames" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."charnames"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charnames")
    rx255_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx255_pos, 1
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 1
    ne $S10, "]", rx255_fail
    add rx255_pos, 1
    goto alt260_end
  alt260_1:
    set_addr $I10, alt260_2
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
.annotate "line", 106
  # rx charclass_q d r 1..-1
    sub $I10, rx255_pos, rx255_off
    find_not_cclass $I11, 8, rx255_tgt, $I10, rx255_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx255_fail
    add rx255_pos, rx255_off, $I11
  # rx rxquantr261 ** 0..*
    set_addr $I262, rxquantr261_done
    rx255_cur."!mark_push"(0, rx255_pos, $I262)
  rxquantr261_loop:
  # rx literal  "_"
    add $I11, rx255_pos, 1
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 1
    ne $S10, "_", rx255_fail
    add rx255_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx255_pos, rx255_off
    find_not_cclass $I11, 8, rx255_tgt, $I10, rx255_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx255_fail
    add rx255_pos, rx255_off, $I11
    (rx255_rep) = rx255_cur."!mark_commit"($I262)
    rx255_cur."!mark_push"(rx255_rep, rx255_pos, $I262)
    goto rxquantr261_loop
  rxquantr261_done:
    goto alt260_end
  alt260_2:
    set_addr $I10, alt260_3
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
.annotate "line", 107
  # rx enumcharlist negate=0 
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I10, 1
    index $I11, "?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx255_fail
    inc rx255_pos
    goto alt260_end
  alt260_3:
.annotate "line", 108
  # rx subrule "panic" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."panic"("Unrecognized \\c character")
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  alt260_end:
.annotate "line", 103
  # rx pass
    rx255_cur."!cursor_pass"(rx255_pos, "charspec")
    rx255_cur."!cursor_debug"("PASS  ", "charspec", " at pos=", rx255_pos)
    .return (rx255_cur)
  rx255_fail:
.annotate "line", 33
    (rx255_rep, rx255_pos, $I10, $P10) = rx255_cur."!mark_fail"(0)
    lt rx255_pos, -1, rx255_done
    eq rx255_pos, -1, rx255_fail
    jump $I10
  rx255_done:
    rx255_cur."!cursor_fail"()
    rx255_cur."!cursor_debug"("FAIL  ", "charspec")
    .return (rx255_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charspec"  :subid("93_1258388820.35002") :method
.annotate "line", 33
    $P257 = self."!PREFIX__!subrule"("", "")
    $P258 = self."!PREFIX__!subrule"("charnames", "[")
    new $P259, "ResizablePMCArray"
    push $P259, $P257
    push $P259, "Z"
    push $P259, "Y"
    push $P259, "X"
    push $P259, "W"
    push $P259, "V"
    push $P259, "U"
    push $P259, "T"
    push $P259, "S"
    push $P259, "R"
    push $P259, "Q"
    push $P259, "P"
    push $P259, "O"
    push $P259, "N"
    push $P259, "M"
    push $P259, "L"
    push $P259, "K"
    push $P259, "J"
    push $P259, "I"
    push $P259, "H"
    push $P259, "G"
    push $P259, "F"
    push $P259, "E"
    push $P259, "D"
    push $P259, "C"
    push $P259, "B"
    push $P259, "A"
    push $P259, "@"
    push $P259, "?"
    push $P259, ""
    push $P259, $P258
    .return ($P259)
.end

### .include 'gen/hllgrammar-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258388824.47776")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
    $P451 = $P14()
.annotate "line", 1
    .return ($P451)
.end


.namespace []
.sub "" :load :init :subid("post41") :outer("10_1258388824.47776")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258388824.47776" 
    .local pmc block
    set block, $P12
    $P452 = get_root_global ["parrot"], "P6metaclass"
    $P452."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block13"  :subid("11_1258388824.47776") :outer("10_1258388824.47776")
.annotate "line", 3
    .const 'Sub' $P434 = "40_1258388824.47776" 
    capture_lex $P434
    .const 'Sub' $P417 = "39_1258388824.47776" 
    capture_lex $P417
    .const 'Sub' $P410 = "38_1258388824.47776" 
    capture_lex $P410
    .const 'Sub' $P403 = "37_1258388824.47776" 
    capture_lex $P403
    .const 'Sub' $P396 = "36_1258388824.47776" 
    capture_lex $P396
    .const 'Sub' $P389 = "35_1258388824.47776" 
    capture_lex $P389
    .const 'Sub' $P379 = "34_1258388824.47776" 
    capture_lex $P379
    .const 'Sub' $P372 = "33_1258388824.47776" 
    capture_lex $P372
    .const 'Sub' $P356 = "32_1258388824.47776" 
    capture_lex $P356
    .const 'Sub' $P281 = "30_1258388824.47776" 
    capture_lex $P281
    .const 'Sub' $P220 = "27_1258388824.47776" 
    capture_lex $P220
    .const 'Sub' $P211 = "26_1258388824.47776" 
    capture_lex $P211
    .const 'Sub' $P202 = "25_1258388824.47776" 
    capture_lex $P202
    .const 'Sub' $P193 = "24_1258388824.47776" 
    capture_lex $P193
    .const 'Sub' $P184 = "23_1258388824.47776" 
    capture_lex $P184
    .const 'Sub' $P175 = "22_1258388824.47776" 
    capture_lex $P175
    .const 'Sub' $P165 = "21_1258388824.47776" 
    capture_lex $P165
    .const 'Sub' $P155 = "20_1258388824.47776" 
    capture_lex $P155
    .const 'Sub' $P148 = "19_1258388824.47776" 
    capture_lex $P148
    .const 'Sub' $P138 = "18_1258388824.47776" 
    capture_lex $P138
    .const 'Sub' $P128 = "17_1258388824.47776" 
    capture_lex $P128
    .const 'Sub' $P28 = "14_1258388824.47776" 
    capture_lex $P28
    .const 'Sub' $P22 = "13_1258388824.47776" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258388824.47776" 
    capture_lex $P15
.annotate "line", 163
    .const 'Sub' $P434 = "40_1258388824.47776" 
    capture_lex $P434
.annotate "line", 3
    .return ($P434)
.end


.namespace ["HLL";"Actions"]
.sub "string_to_int"  :subid("12_1258388824.47776") :outer("11_1258388824.47776")
    .param pmc param_18
    .param pmc param_19
.annotate "line", 3
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$src", param_18
    .lex "$base", param_19
.annotate "line", 4

        .local pmc src
        .local string src_s
        src = find_lex '$src'
        src_s = src
        .local int base, pos, eos, result
        $P0 = find_lex '$base'
        base = $P0
        pos = 0
        eos = length src_s
        result = 0
      str_loop:
        unless pos < eos goto str_done
        .local string char
        char = substr src_s, pos, 1
        if char == '_' goto str_next
        .local int digitval
        digitval = index "00112233445566778899AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz", char
        if digitval < 0 goto err_base
        digitval >>= 1
        if digitval > base goto err_base
        result *= base
        result += digitval
      str_next:
        inc pos
        goto str_loop
      err_base:
	src.'panic'('Invalid radix conversion of "', char, '"')
      str_done:
        $P20 = box result
    
.annotate "line", 3
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "ints_to_string"  :subid("13_1258388824.47776") :outer("11_1258388824.47776")
    .param pmc param_25
.annotate "line", 37
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "$ints", param_25
.annotate "line", 38

        .local string result
        result = ''
        .local pmc ints, ints_it
        ints = find_lex '$ints'
        $I0 = does ints, 'array'
        unless $I0 goto ints_1
        ints_it = iter ints
      ints_loop:
        unless ints_it goto ints_done
        $P0 = shift ints_it
        $I0 = $P0.'ast'()
        $S0 = chr $I0
        concat result, $S0
        goto ints_loop
      ints_1:
        $I0 = ints.'ast'()
        result = chr $I0
      ints_done:
        $P26 = box result
    
.annotate "line", 37
    .return ($P26)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "EXPR"  :subid("14_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_31
    .param pmc param_32 :optional
    .param int has_param_32 :opt_flag
.annotate "line", 62
    .const 'Sub' $P111 = "16_1258388824.47776" 
    capture_lex $P111
    .const 'Sub' $P78 = "15_1258388824.47776" 
    capture_lex $P78
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "self", self
    .lex "$/", param_31
    if has_param_32, optparam_42
    new $P33, "Undef"
    set param_32, $P33
  optparam_42:
    .lex "$key", param_32
.annotate "line", 64
    new $P34, "Undef"
    .lex "$past", $P34
.annotate "line", 63
    find_lex $P36, "$key"
    if $P36, unless_35_end
    new $P37, "Exception"
    set $P37['type'], 58
    new $P38, "Integer"
    assign $P38, 0
    setattribute $P37, 'payload', $P38
    throw $P37
  unless_35_end:
.annotate "line", 64
    find_lex $P40, "$/"
    $P41 = $P40."peek_ast"()
    set $P39, $P41
    defined $I43, $P39
    if $I43, default_42
    find_lex $P44, "$/"
    unless_null $P44, vivify_43
    new $P44, "Hash"
  vivify_43:
    set $P45, $P44["OPER"]
    unless_null $P45, vivify_44
    new $P45, "Undef"
  vivify_44:
    $P46 = $P45."peek_ast"()
    set $P39, $P46
  default_42:
    store_lex "$past", $P39
.annotate "line", 65
    find_lex $P48, "$past"
    if $P48, unless_47_end
.annotate "line", 66
    get_hll_global $P49, ["PAST"], "Op"
    find_lex $P50, "$/"
    $P51 = $P49."new"($P50 :named("node"))
    store_lex "$past", $P51
.annotate "line", 67
    find_lex $P53, "$/"
    unless_null $P53, vivify_45
    new $P53, "Hash"
  vivify_45:
    set $P54, $P53["OPER"]
    unless_null $P54, vivify_46
    new $P54, "Hash"
  vivify_46:
    set $P55, $P54["O"]
    unless_null $P55, vivify_47
    new $P55, "Hash"
  vivify_47:
    set $P56, $P55["pasttype"]
    unless_null $P56, vivify_48
    new $P56, "Undef"
  vivify_48:
    if $P56, if_52
.annotate "line", 68
    find_lex $P64, "$/"
    unless_null $P64, vivify_49
    new $P64, "Hash"
  vivify_49:
    set $P65, $P64["OPER"]
    unless_null $P65, vivify_50
    new $P65, "Hash"
  vivify_50:
    set $P66, $P65["O"]
    unless_null $P66, vivify_51
    new $P66, "Hash"
  vivify_51:
    set $P67, $P66["pirop"]
    unless_null $P67, vivify_52
    new $P67, "Undef"
  vivify_52:
    unless $P67, if_63_end
    find_lex $P68, "$past"
    find_lex $P69, "$/"
    unless_null $P69, vivify_53
    new $P69, "Hash"
  vivify_53:
    set $P70, $P69["OPER"]
    unless_null $P70, vivify_54
    new $P70, "Hash"
  vivify_54:
    set $P71, $P70["O"]
    unless_null $P71, vivify_55
    new $P71, "Hash"
  vivify_55:
    set $P72, $P71["pirop"]
    unless_null $P72, vivify_56
    new $P72, "Undef"
  vivify_56:
    set $S73, $P72
    $P68."pirop"($S73)
  if_63_end:
    goto if_52_end
  if_52:
.annotate "line", 67
    find_lex $P57, "$past"
    find_lex $P58, "$/"
    unless_null $P58, vivify_57
    new $P58, "Hash"
  vivify_57:
    set $P59, $P58["OPER"]
    unless_null $P59, vivify_58
    new $P59, "Hash"
  vivify_58:
    set $P60, $P59["O"]
    unless_null $P60, vivify_59
    new $P60, "Hash"
  vivify_59:
    set $P61, $P60["pasttype"]
    unless_null $P61, vivify_60
    new $P61, "Undef"
  vivify_60:
    set $S62, $P61
    $P57."pasttype"($S62)
  if_52_end:
.annotate "line", 69
    find_lex $P75, "$past"
    $P76 = $P75."name"()
    if $P76, unless_74_end
    .const 'Sub' $P78 = "15_1258388824.47776" 
    capture_lex $P78
    $P78()
  unless_74_end:
  unless_47_end:
.annotate "line", 80
    find_lex $P98, "$key"
    set $S99, $P98
    iseq $I100, $S99, "POSTFIX"
    if $I100, if_97
.annotate "line", 82
    find_lex $P106, "$/"
    $P107 = $P106."list"()
    defined $I108, $P107
    unless $I108, for_undef_64
    iter $P105, $P107
    new $P122, 'ExceptionHandler'
    set_addr $P122, loop121_handler
    $P122."handle_types"(65, 67, 66)
    push_eh $P122
  loop121_test:
    unless $P105, loop121_done
    shift $P109, $P105
  loop121_redo:
    .const 'Sub' $P111 = "16_1258388824.47776" 
    capture_lex $P111
    $P111($P109)
  loop121_next:
    goto loop121_test
  loop121_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, 65, loop121_next
    eq $P123, 67, loop121_redo
  loop121_done:
    pop_eh 
  for_undef_64:
.annotate "line", 81
    goto if_97_end
  if_97:
.annotate "line", 80
    find_lex $P101, "$past"
    find_lex $P102, "$/"
    unless_null $P102, vivify_65
    new $P102, "ResizablePMCArray"
  vivify_65:
    set $P103, $P102[0]
    unless_null $P103, vivify_66
    new $P103, "Undef"
  vivify_66:
    $P104 = $P103."ast"()
    $P101."unshift"($P104)
  if_97_end:
.annotate "line", 84
    find_lex $P124, "$/"
    find_lex $P125, "$past"
    $P126 = $P124."!make"($P125)
.annotate "line", 62
    .return ($P126)
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, "payload"
    .return ($P127)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block77"  :anon :subid("15_1258388824.47776") :outer("14_1258388824.47776")
.annotate "line", 71
    new $P79, "Undef"
    .lex "$name", $P79
.annotate "line", 70
    find_lex $P81, "$key"
    set $S82, $P81
    iseq $I83, $S82, "LIST"
    unless $I83, if_80_end
    new $P84, "String"
    assign $P84, "infix"
    store_lex "$key", $P84
  if_80_end:
.annotate "line", 71

                $P0 = find_lex '$key'
                $S0 = $P0
                $S0 = downcase $S0
                $P85 = box $S0
            
    concat $P86, $P85, ":<"
.annotate "line", 76
    find_lex $P87, "$/"
    unless_null $P87, vivify_61
    new $P87, "Hash"
  vivify_61:
    set $P88, $P87["OPER"]
    unless_null $P88, vivify_62
    new $P88, "Hash"
  vivify_62:
    set $P89, $P88["sym"]
    unless_null $P89, vivify_63
    new $P89, "Undef"
  vivify_63:
    concat $P90, $P86, $P89
    concat $P91, $P90, ">"
    store_lex "$name", $P91
.annotate "line", 77
    find_lex $P92, "$past"
    new $P93, "String"
    assign $P93, "&"
    find_lex $P94, "$name"
    concat $P95, $P93, $P94
    $P96 = $P92."name"($P95)
.annotate "line", 69
    .return ($P96)
.end


.namespace ["HLL";"Actions"]
.sub "_block110"  :anon :subid("16_1258388824.47776") :outer("14_1258388824.47776")
    .param pmc param_112
.annotate "line", 82
    .lex "$_", param_112
    find_lex $P115, "$_"
    $P116 = $P115."ast"()
    if $P116, if_114
    set $P113, $P116
    goto if_114_end
  if_114:
    find_lex $P117, "$past"
    find_lex $P118, "$_"
    $P119 = $P118."ast"()
    $P120 = $P117."push"($P119)
    set $P113, $P120
  if_114_end:
    .return ($P113)
.end


.namespace ["HLL";"Actions"]
.sub "term:sym<circumfix>"  :subid("17_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_131
.annotate "line", 87
    new $P130, 'ExceptionHandler'
    set_addr $P130, control_129
    $P130."handle_types"(58)
    push_eh $P130
    .lex "self", self
    .lex "$/", param_131
    find_lex $P132, "$/"
    find_lex $P133, "$/"
    unless_null $P133, vivify_67
    new $P133, "Hash"
  vivify_67:
    set $P134, $P133["circumfix"]
    unless_null $P134, vivify_68
    new $P134, "Undef"
  vivify_68:
    $P135 = $P134."ast"()
    $P136 = $P132."!make"($P135)
    .return ($P136)
  control_129:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "termish"  :subid("18_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_141
.annotate "line", 89
    new $P140, 'ExceptionHandler'
    set_addr $P140, control_139
    $P140."handle_types"(58)
    push_eh $P140
    .lex "self", self
    .lex "$/", param_141
    find_lex $P142, "$/"
    find_lex $P143, "$/"
    unless_null $P143, vivify_69
    new $P143, "Hash"
  vivify_69:
    set $P144, $P143["term"]
    unless_null $P144, vivify_70
    new $P144, "Undef"
  vivify_70:
    $P145 = $P144."ast"()
    $P146 = $P142."!make"($P145)
    .return ($P146)
  control_139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "nullterm"  :subid("19_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_151
.annotate "line", 90
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "self", self
    .lex "$/", param_151
    find_lex $P152, "$/"
    $P153 = $P152."!make"(0)
    .return ($P153)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "nullterm_alt"  :subid("20_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_158
.annotate "line", 91
    new $P157, 'ExceptionHandler'
    set_addr $P157, control_156
    $P157."handle_types"(58)
    push_eh $P157
    .lex "self", self
    .lex "$/", param_158
    find_lex $P159, "$/"
    find_lex $P160, "$/"
    unless_null $P160, vivify_71
    new $P160, "Hash"
  vivify_71:
    set $P161, $P160["term"]
    unless_null $P161, vivify_72
    new $P161, "Undef"
  vivify_72:
    $P162 = $P161."ast"()
    $P163 = $P159."!make"($P162)
    .return ($P163)
  control_156:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "integer"  :subid("21_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_168
.annotate "line", 93
    new $P167, 'ExceptionHandler'
    set_addr $P167, control_166
    $P167."handle_types"(58)
    push_eh $P167
    .lex "self", self
    .lex "$/", param_168
    find_lex $P169, "$/"
    find_lex $P170, "$/"
    unless_null $P170, vivify_73
    new $P170, "Hash"
  vivify_73:
    set $P171, $P170["VALUE"]
    unless_null $P171, vivify_74
    new $P171, "Undef"
  vivify_74:
    $P172 = $P171."ast"()
    $P173 = $P169."!make"($P172)
    .return ($P173)
  control_166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "dec_number"  :subid("22_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_178
.annotate "line", 95
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
    .lex "$/", param_178
    find_lex $P179, "$/"
    find_lex $P180, "$/"
    set $N181, $P180
    $P182 = $P179."!make"($N181)
    .return ($P182)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P183, exception, "payload"
    .return ($P183)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "decint"  :subid("23_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_187
.annotate "line", 97
    new $P186, 'ExceptionHandler'
    set_addr $P186, control_185
    $P186."handle_types"(58)
    push_eh $P186
    .lex "self", self
    .lex "$/", param_187
    find_lex $P188, "$/"
    find_lex $P189, "$/"
    $P190 = "string_to_int"($P189, 10)
    $P191 = $P188."!make"($P190)
    .return ($P191)
  control_185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "hexint"  :subid("24_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_196
.annotate "line", 98
    new $P195, 'ExceptionHandler'
    set_addr $P195, control_194
    $P195."handle_types"(58)
    push_eh $P195
    .lex "self", self
    .lex "$/", param_196
    find_lex $P197, "$/"
    find_lex $P198, "$/"
    $P199 = "string_to_int"($P198, 16)
    $P200 = $P197."!make"($P199)
    .return ($P200)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "octint"  :subid("25_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_205
.annotate "line", 99
    new $P204, 'ExceptionHandler'
    set_addr $P204, control_203
    $P204."handle_types"(58)
    push_eh $P204
    .lex "self", self
    .lex "$/", param_205
    find_lex $P206, "$/"
    find_lex $P207, "$/"
    $P208 = "string_to_int"($P207, 8)
    $P209 = $P206."!make"($P208)
    .return ($P209)
  control_203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, "payload"
    .return ($P210)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "binint"  :subid("26_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_214
.annotate "line", 100
    new $P213, 'ExceptionHandler'
    set_addr $P213, control_212
    $P213."handle_types"(58)
    push_eh $P213
    .lex "self", self
    .lex "$/", param_214
    find_lex $P215, "$/"
    find_lex $P216, "$/"
    $P217 = "string_to_int"($P216, 2)
    $P218 = $P215."!make"($P217)
    .return ($P218)
  control_212:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P219, exception, "payload"
    .return ($P219)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_EXPR"  :subid("27_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_223
.annotate "line", 102
    .const 'Sub' $P239 = "28_1258388824.47776" 
    capture_lex $P239
    new $P222, 'ExceptionHandler'
    set_addr $P222, control_221
    $P222."handle_types"(58)
    push_eh $P222
    .lex "self", self
    .lex "$/", param_223
.annotate "line", 103
    new $P224, "Undef"
    .lex "$past", $P224
    find_lex $P225, "$/"
    unless_null $P225, vivify_75
    new $P225, "Hash"
  vivify_75:
    set $P226, $P225["quote_delimited"]
    unless_null $P226, vivify_76
    new $P226, "Undef"
  vivify_76:
    $P227 = $P226."ast"()
    store_lex "$past", $P227
.annotate "line", 104
    get_hll_global $P229, ["HLL";"Grammar"], "quotemod_check"
    find_lex $P230, "$/"
    $P231 = $P229($P230, "w")
    unless $P231, if_228_end
.annotate "line", 105
    get_hll_global $P233, ["PAST"], "Node"
    find_lex $P234, "$past"
    $P235 = $P233."ACCEPTS"($P234)
    if $P235, if_232
.annotate "line", 108
    .const 'Sub' $P239 = "28_1258388824.47776" 
    capture_lex $P239
    $P239()
    goto if_232_end
  if_232:
.annotate "line", 106
    find_lex $P236, "$/"
    $P237 = $P236."CURSOR"()
    $P237."panic"("Can't form :w list from non-constant strings (yet)")
  if_232_end:
  if_228_end:
.annotate "line", 116
    get_hll_global $P269, ["PAST"], "Node"
    find_lex $P270, "$past"
    $P271 = $P269."ACCEPTS"($P270)
    isfalse $I272, $P271
    unless $I272, if_268_end
.annotate "line", 117
    get_hll_global $P273, ["PAST"], "Val"
    find_lex $P274, "$past"
    set $S275, $P274
    $P276 = $P273."new"($S275 :named("value"))
    store_lex "$past", $P276
  if_268_end:
.annotate "line", 119
    find_lex $P277, "$/"
    find_lex $P278, "$past"
    $P279 = $P277."!make"($P278)
.annotate "line", 102
    .return ($P279)
  control_221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P280, exception, "payload"
    .return ($P280)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block238"  :anon :subid("28_1258388824.47776") :outer("27_1258388824.47776")
.annotate "line", 108
    .const 'Sub' $P260 = "29_1258388824.47776" 
    capture_lex $P260
.annotate "line", 109
    new $P240, "ResizablePMCArray"
    .lex "@words", $P240
    get_hll_global $P241, ["HLL";"Grammar"], "split_words"
    find_lex $P242, "$/"
    find_lex $P243, "$past"
    $P244 = $P241($P242, $P243)
    store_lex "@words", $P244
.annotate "line", 110
    find_lex $P247, "@words"
    set $N248, $P247
    new $P249, "Integer"
    assign $P249, 1
    set $N250, $P249
    isgt $I251, $N248, $N250
    if $I251, if_246
    new $P245, 'Integer'
    set $P245, $I251
    goto if_246_end
  if_246:
.annotate "line", 111
    get_hll_global $P252, ["PAST"], "Op"
    find_lex $P253, "$/"
    $P254 = $P252."new"("list" :named("pasttype"), $P253 :named("node"))
    store_lex "$past", $P254
.annotate "line", 112
    find_lex $P256, "@words"
    defined $I257, $P256
    unless $I257, for_undef_77
    iter $P255, $P256
    new $P266, 'ExceptionHandler'
    set_addr $P266, loop265_handler
    $P266."handle_types"(65, 67, 66)
    push_eh $P266
  loop265_test:
    unless $P255, loop265_done
    shift $P258, $P255
  loop265_redo:
    .const 'Sub' $P260 = "29_1258388824.47776" 
    capture_lex $P260
    $P260($P258)
  loop265_next:
    goto loop265_test
  loop265_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, 'type'
    eq $P267, 65, loop265_next
    eq $P267, 67, loop265_redo
  loop265_done:
    pop_eh 
  for_undef_77:
.annotate "line", 110
    set $P245, $P255
  if_246_end:
.annotate "line", 108
    .return ($P245)
.end


.namespace ["HLL";"Actions"]
.sub "_block259"  :anon :subid("29_1258388824.47776") :outer("28_1258388824.47776")
    .param pmc param_261
.annotate "line", 112
    .lex "$_", param_261
    find_lex $P262, "$past"
    find_lex $P263, "$_"
    $P264 = $P262."push"($P263)
    .return ($P264)
.end


.namespace ["HLL";"Actions"]
.sub "quote_delimited"  :subid("30_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_284
.annotate "line", 122
    .const 'Sub' $P296 = "31_1258388824.47776" 
    capture_lex $P296
    new $P283, 'ExceptionHandler'
    set_addr $P283, control_282
    $P283."handle_types"(58)
    push_eh $P283
    .lex "self", self
    .lex "$/", param_284
.annotate "line", 123
    new $P285, "ResizablePMCArray"
    .lex "@parts", $P285
.annotate "line", 124
    new $P286, "Undef"
    .lex "$lastlit", $P286
.annotate "line", 140
    new $P287, "Undef"
    .lex "$past", $P287
.annotate "line", 122
    find_lex $P288, "@parts"
.annotate "line", 124
    new $P289, "String"
    assign $P289, ""
    store_lex "$lastlit", $P289
.annotate "line", 125
    find_lex $P291, "$/"
    unless_null $P291, vivify_78
    new $P291, "Hash"
  vivify_78:
    set $P292, $P291["quote_atom"]
    unless_null $P292, vivify_79
    new $P292, "Undef"
  vivify_79:
    defined $I293, $P292
    unless $I293, for_undef_80
    iter $P290, $P292
    new $P329, 'ExceptionHandler'
    set_addr $P329, loop328_handler
    $P329."handle_types"(65, 67, 66)
    push_eh $P329
  loop328_test:
    unless $P290, loop328_done
    shift $P294, $P290
  loop328_redo:
    .const 'Sub' $P296 = "31_1258388824.47776" 
    capture_lex $P296
    $P296($P294)
  loop328_next:
    goto loop328_test
  loop328_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, 'type'
    eq $P330, 65, loop328_next
    eq $P330, 67, loop328_redo
  loop328_done:
    pop_eh 
  for_undef_80:
.annotate "line", 139
    find_lex $P332, "$lastlit"
    set $S333, $P332
    isgt $I334, $S333, ""
    unless $I334, if_331_end
    find_lex $P335, "@parts"
    find_lex $P336, "$lastlit"
    $P335."push"($P336)
  if_331_end:
.annotate "line", 140
    find_lex $P339, "@parts"
    if $P339, if_338
    new $P342, "String"
    assign $P342, ""
    set $P337, $P342
    goto if_338_end
  if_338:
    find_lex $P340, "@parts"
    $P341 = $P340."shift"()
    set $P337, $P341
  if_338_end:
    store_lex "$past", $P337
.annotate "line", 141
    new $P350, 'ExceptionHandler'
    set_addr $P350, loop349_handler
    $P350."handle_types"(65, 67, 66)
    push_eh $P350
  loop349_test:
    find_lex $P343, "@parts"
    unless $P343, loop349_done
  loop349_redo:
.annotate "line", 142
    get_hll_global $P344, ["PAST"], "Op"
    find_lex $P345, "$past"
    find_lex $P346, "@parts"
    $P347 = $P346."shift"()
    $P348 = $P344."new"($P345, $P347, "concat" :named("pirop"))
    store_lex "$past", $P348
  loop349_next:
.annotate "line", 141
    goto loop349_test
  loop349_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P351, exception, 'type'
    eq $P351, 65, loop349_next
    eq $P351, 67, loop349_redo
  loop349_done:
    pop_eh 
.annotate "line", 144
    find_lex $P352, "$/"
    find_lex $P353, "$past"
    $P354 = $P352."!make"($P353)
.annotate "line", 122
    .return ($P354)
  control_282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P355, exception, "payload"
    .return ($P355)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block295"  :anon :subid("31_1258388824.47776") :outer("30_1258388824.47776")
    .param pmc param_298
.annotate "line", 126
    new $P297, "Undef"
    .lex "$ast", $P297
    .lex "$_", param_298
    find_lex $P299, "$_"
    $P300 = $P299."ast"()
    store_lex "$ast", $P300
.annotate "line", 127
    get_hll_global $P303, ["PAST"], "Node"
    find_lex $P304, "$ast"
    $P305 = $P303."ACCEPTS"($P304)
    isfalse $I306, $P305
    if $I306, if_302
.annotate "line", 130
    find_lex $P312, "$ast"
    get_hll_global $P313, ["PAST"], "Val"
    $P314 = $P312."isa"($P313)
    if $P314, if_311
.annotate "line", 134
    find_lex $P320, "$lastlit"
    set $S321, $P320
    isgt $I322, $S321, ""
    unless $I322, if_319_end
    find_lex $P323, "@parts"
    find_lex $P324, "$lastlit"
    $P323."push"($P324)
  if_319_end:
.annotate "line", 135
    find_lex $P325, "@parts"
    find_lex $P326, "$ast"
    $P325."push"($P326)
.annotate "line", 136
    new $P327, "String"
    assign $P327, ""
    store_lex "$lastlit", $P327
.annotate "line", 133
    set $P310, $P327
.annotate "line", 130
    goto if_311_end
  if_311:
.annotate "line", 131
    find_lex $P315, "$lastlit"
    find_lex $P316, "$ast"
    $S317 = $P316."value"()
    concat $P318, $P315, $S317
    store_lex "$lastlit", $P318
.annotate "line", 130
    set $P310, $P318
  if_311_end:
    set $P301, $P310
.annotate "line", 127
    goto if_302_end
  if_302:
.annotate "line", 128
    find_lex $P307, "$lastlit"
    find_lex $P308, "$ast"
    concat $P309, $P307, $P308
    store_lex "$lastlit", $P309
.annotate "line", 127
    set $P301, $P309
  if_302_end:
.annotate "line", 125
    .return ($P301)
.end


.namespace ["HLL";"Actions"]
.sub "quote_atom"  :subid("32_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_359
.annotate "line", 147
    new $P358, 'ExceptionHandler'
    set_addr $P358, control_357
    $P358."handle_types"(58)
    push_eh $P358
    .lex "self", self
    .lex "$/", param_359
.annotate "line", 148
    find_lex $P360, "$/"
    find_lex $P363, "$/"
    unless_null $P363, vivify_81
    new $P363, "Hash"
  vivify_81:
    set $P364, $P363["quote_escape"]
    unless_null $P364, vivify_82
    new $P364, "Undef"
  vivify_82:
    if $P364, if_362
    find_lex $P368, "$/"
    set $S369, $P368
    new $P361, 'String'
    set $P361, $S369
    goto if_362_end
  if_362:
    find_lex $P365, "$/"
    unless_null $P365, vivify_83
    new $P365, "Hash"
  vivify_83:
    set $P366, $P365["quote_escape"]
    unless_null $P366, vivify_84
    new $P366, "Undef"
  vivify_84:
    $P367 = $P366."ast"()
    set $P361, $P367
  if_362_end:
    $P370 = $P360."!make"($P361)
.annotate "line", 147
    .return ($P370)
  control_357:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, "payload"
    .return ($P371)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<backslash>"  :subid("33_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_375
.annotate "line", 151
    new $P374, 'ExceptionHandler'
    set_addr $P374, control_373
    $P374."handle_types"(58)
    push_eh $P374
    .lex "self", self
    .lex "$/", param_375
    find_lex $P376, "$/"
    $P377 = $P376."!make"("\\")
    .return ($P377)
  control_373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P378, exception, "payload"
    .return ($P378)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<stopper>"  :subid("34_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_382
.annotate "line", 152
    new $P381, 'ExceptionHandler'
    set_addr $P381, control_380
    $P381."handle_types"(58)
    push_eh $P381
    .lex "self", self
    .lex "$/", param_382
    find_lex $P383, "$/"
    find_lex $P384, "$/"
    unless_null $P384, vivify_85
    new $P384, "Hash"
  vivify_85:
    set $P385, $P384["stopper"]
    unless_null $P385, vivify_86
    new $P385, "Undef"
  vivify_86:
    set $S386, $P385
    $P387 = $P383."!make"($S386)
    .return ($P387)
  control_380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<bs>"  :subid("35_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_392
.annotate "line", 154
    new $P391, 'ExceptionHandler'
    set_addr $P391, control_390
    $P391."handle_types"(58)
    push_eh $P391
    .lex "self", self
    .lex "$/", param_392
    find_lex $P393, "$/"
    $P394 = $P393."!make"("\b")
    .return ($P394)
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P395, exception, "payload"
    .return ($P395)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<nl>"  :subid("36_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_399
.annotate "line", 155
    new $P398, 'ExceptionHandler'
    set_addr $P398, control_397
    $P398."handle_types"(58)
    push_eh $P398
    .lex "self", self
    .lex "$/", param_399
    find_lex $P400, "$/"
    $P401 = $P400."!make"("\n")
    .return ($P401)
  control_397:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P402, exception, "payload"
    .return ($P402)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<cr>"  :subid("37_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_406
.annotate "line", 156
    new $P405, 'ExceptionHandler'
    set_addr $P405, control_404
    $P405."handle_types"(58)
    push_eh $P405
    .lex "self", self
    .lex "$/", param_406
    find_lex $P407, "$/"
    $P408 = $P407."!make"("\r")
    .return ($P408)
  control_404:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P409, exception, "payload"
    .return ($P409)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<tab>"  :subid("38_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_413
.annotate "line", 157
    new $P412, 'ExceptionHandler'
    set_addr $P412, control_411
    $P412."handle_types"(58)
    push_eh $P412
    .lex "self", self
    .lex "$/", param_413
    find_lex $P414, "$/"
    $P415 = $P414."!make"("\t")
    .return ($P415)
  control_411:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P416, exception, "payload"
    .return ($P416)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<hex>"  :subid("39_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_420
.annotate "line", 159
    new $P419, 'ExceptionHandler'
    set_addr $P419, control_418
    $P419."handle_types"(58)
    push_eh $P419
    .lex "self", self
    .lex "$/", param_420
.annotate "line", 160
    find_lex $P421, "$/"
    find_lex $P424, "$/"
    unless_null $P424, vivify_87
    new $P424, "Hash"
  vivify_87:
    set $P425, $P424["hexint"]
    unless_null $P425, vivify_88
    new $P425, "Undef"
  vivify_88:
    if $P425, if_423
    find_lex $P428, "$/"
    unless_null $P428, vivify_89
    new $P428, "Hash"
  vivify_89:
    set $P429, $P428["hexints"]
    unless_null $P429, vivify_90
    new $P429, "Hash"
  vivify_90:
    set $P430, $P429["hexint"]
    unless_null $P430, vivify_91
    new $P430, "Undef"
  vivify_91:
    set $P422, $P430
    goto if_423_end
  if_423:
    find_lex $P426, "$/"
    unless_null $P426, vivify_92
    new $P426, "Hash"
  vivify_92:
    set $P427, $P426["hexint"]
    unless_null $P427, vivify_93
    new $P427, "Undef"
  vivify_93:
    set $P422, $P427
  if_423_end:
    $P431 = "ints_to_string"($P422)
    $P432 = $P421."!make"($P431)
.annotate "line", 159
    .return ($P432)
  control_418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P433, exception, "payload"
    .return ($P433)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<oct>"  :subid("40_1258388824.47776") :method :outer("11_1258388824.47776")
    .param pmc param_437
.annotate "line", 163
    new $P436, 'ExceptionHandler'
    set_addr $P436, control_435
    $P436."handle_types"(58)
    push_eh $P436
    .lex "self", self
    .lex "$/", param_437
.annotate "line", 164
    find_lex $P438, "$/"
    find_lex $P441, "$/"
    unless_null $P441, vivify_94
    new $P441, "Hash"
  vivify_94:
    set $P442, $P441["octint"]
    unless_null $P442, vivify_95
    new $P442, "Undef"
  vivify_95:
    if $P442, if_440
    find_lex $P445, "$/"
    unless_null $P445, vivify_96
    new $P445, "Hash"
  vivify_96:
    set $P446, $P445["octints"]
    unless_null $P446, vivify_97
    new $P446, "Hash"
  vivify_97:
    set $P447, $P446["octint"]
    unless_null $P447, vivify_98
    new $P447, "Undef"
  vivify_98:
    set $P439, $P447
    goto if_440_end
  if_440:
    find_lex $P443, "$/"
    unless_null $P443, vivify_99
    new $P443, "Hash"
  vivify_99:
    set $P444, $P443["octint"]
    unless_null $P444, vivify_100
    new $P444, "Undef"
  vivify_100:
    set $P439, $P444
  if_440_end:
    $P448 = "ints_to_string"($P439)
    $P449 = $P438."!make"($P448)
.annotate "line", 163
    .return ($P449)
  control_435:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P450, exception, "payload"
    .return ($P450)
    rethrow exception
.end


=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.

=head1 COPYRIGHT

Copyright (C) 2009, Patrick R. Michaud

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
