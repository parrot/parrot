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
    .local string termish
    termish = 'termish'

    .local pmc opstack, termstack
    opstack = new ['ResizablePMCArray']
    .lex '@opstack', opstack
    termstack = new ['ResizablePMCArray']
    .lex '@termstack', termstack

    .local pmc here, from, pos
    (here, pos) = self.'!cursor_start'()

  term_loop:
    here = here.termish()
    unless here goto fail
    .local pmc term
    term = here.'MATCH'()
    push termstack, term

    # interleave any prefix/postfix we might have found
    .local pmc termOPER, prefixish, postfixish
    termOPER = term
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
    delete term['prefixish']

  postfix_loop:
    if null postfixish goto postfix_done
    unless postfixish goto postfix_done
    $P0 = pop postfixish
    push opstack, $P0
    goto postfix_loop
  postfix_done:
    delete term['postfixish']

    # Now see if we can fetch an infix operator
    .local pmc infixcur, infix
    here = here.'ws'()
    infixcur = here.'infixish'()
    unless infixcur goto term_done
    infix = infixcur.'MATCH'()

    .local pmc inO
    $P0 = infix['OPER']
    inO = $P0['O']
    termish = inO['nextterm']
    if termish goto have_termish
    termish = 'termish'
  have_termish:

    unless opstack goto reduce_done
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
    self.reduce()
    goto reduce_loop
  reduce_gt_done:

    unless opprec == inprec goto reduce_done
    # equal precedence, use associativity to decide
    unless inassoc == 'left' goto reduce_done
    # left associative, reduce immediately
    capture_lex reduce
    self.reduce()
  reduce_done:

    push opstack, infix        # The Shift
    here = infixcur.'ws'()
    goto term_loop
  term_done:

  opstack_loop:
    unless opstack goto opstack_done
    capture_lex reduce
    self.reduce()
    goto opstack_loop
  opstack_done:

  expr_done:
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


.sub 'EXPR_reduce' :method :anon :outer('EXPR')
    .local pmc termstack, opstack
    termstack = find_lex '@termstack'
    opstack = find_lex '@opstack'

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
.sub "_block11"  :anon :subid("10_1258055876.35069")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 5
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
    $P226 = $P14()
.annotate "line", 1
    .return ($P226)
.end


.namespace []
.sub "" :load :init :subid("post81") :outer("10_1258055876.35069")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258055876.35069" 
    .local pmc block
    set block, $P12
    $P227 = get_root_global ["parrot"], "P6metaclass"
    $P227."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block13"  :subid("11_1258055876.35069") :outer("10_1258055876.35069")
.annotate "line", 5
    .const 'Sub' $P217 = "79_1258055876.35069" 
    capture_lex $P217
    .const 'Sub' $P211 = "77_1258055876.35069" 
    capture_lex $P211
    .const 'Sub' $P199 = "74_1258055876.35069" 
    capture_lex $P199
    .const 'Sub' $P195 = "72_1258055876.35069" 
    capture_lex $P195
    .const 'Sub' $P190 = "70_1258055876.35069" 
    capture_lex $P190
    .const 'Sub' $P185 = "68_1258055876.35069" 
    capture_lex $P185
    .const 'Sub' $P181 = "66_1258055876.35069" 
    capture_lex $P181
    .const 'Sub' $P177 = "64_1258055876.35069" 
    capture_lex $P177
    .const 'Sub' $P173 = "62_1258055876.35069" 
    capture_lex $P173
    .const 'Sub' $P169 = "60_1258055876.35069" 
    capture_lex $P169
    .const 'Sub' $P165 = "58_1258055876.35069" 
    capture_lex $P165
    .const 'Sub' $P161 = "56_1258055876.35069" 
    capture_lex $P161
    .const 'Sub' $P151 = "52_1258055876.35069" 
    capture_lex $P151
    .const 'Sub' $P139 = "50_1258055876.35069" 
    capture_lex $P139
    .const 'Sub' $P120 = "48_1258055876.35069" 
    capture_lex $P120
    .const 'Sub' $P114 = "46_1258055876.35069" 
    capture_lex $P114
    .const 'Sub' $P106 = "44_1258055876.35069" 
    capture_lex $P106
    .const 'Sub' $P100 = "42_1258055876.35069" 
    capture_lex $P100
    .const 'Sub' $P92 = "40_1258055876.35069" 
    capture_lex $P92
    .const 'Sub' $P83 = "38_1258055876.35069" 
    capture_lex $P83
    .const 'Sub' $P76 = "36_1258055876.35069" 
    capture_lex $P76
    .const 'Sub' $P69 = "34_1258055876.35069" 
    capture_lex $P69
    .const 'Sub' $P64 = "32_1258055876.35069" 
    capture_lex $P64
    .const 'Sub' $P59 = "30_1258055876.35069" 
    capture_lex $P59
    .const 'Sub' $P54 = "28_1258055876.35069" 
    capture_lex $P54
    .const 'Sub' $P22 = "14_1258055876.35069" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258055876.35069" 
    capture_lex $P15
    .const 'Sub' $P217 = "79_1258055876.35069" 
    capture_lex $P217
    .return ($P217)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1258055876.35069") :method :outer("11_1258055876.35069")
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
.sub "!PREFIX__ws"  :subid("13_1258055876.35069") :method
.annotate "line", 5
    new $P18, "ResizablePMCArray"
    push $P18, ""
    .return ($P18)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx23_tgt
    .local int rx23_pos
    .local int rx23_off
    .local int rx23_eos
    .local int rx23_rep
    .local pmc rx23_cur
    (rx23_cur, rx23_pos, rx23_tgt, $I10) = self."!cursor_start"()
    rx23_cur."!cursor_debug"("START ", "termish")
    rx23_cur."!cursor_caparray"("postfixish", "prefixish")
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
.sub "!PREFIX__termish"  :subid("15_1258055876.35069") :method
.annotate "line", 5
    new $P25, "ResizablePMCArray"
    push $P25, ""
    .return ($P25)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1258055876.35069") :method
.annotate "line", 13
    $P31 = self."!protoregex"("term")
    .return ($P31)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1258055876.35069") :method
.annotate "line", 13
    $P33 = self."!PREFIX__!protoregex"("term")
    .return ($P33)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1258055876.35069") :method
.annotate "line", 14
    $P35 = self."!protoregex"("infix")
    .return ($P35)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1258055876.35069") :method
.annotate "line", 14
    $P37 = self."!PREFIX__!protoregex"("infix")
    .return ($P37)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1258055876.35069") :method
.annotate "line", 15
    $P39 = self."!protoregex"("prefix")
    .return ($P39)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1258055876.35069") :method
.annotate "line", 15
    $P41 = self."!PREFIX__!protoregex"("prefix")
    .return ($P41)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1258055876.35069") :method
.annotate "line", 16
    $P43 = self."!protoregex"("postfix")
    .return ($P43)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1258055876.35069") :method
.annotate "line", 16
    $P45 = self."!PREFIX__!protoregex"("postfix")
    .return ($P45)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1258055876.35069") :method
.annotate "line", 17
    $P47 = self."!protoregex"("circumfix")
    .return ($P47)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1258055876.35069") :method
.annotate "line", 17
    $P49 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P49)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1258055876.35069") :method
.annotate "line", 18
    $P51 = self."!protoregex"("postcircumfix")
    .return ($P51)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1258055876.35069") :method
.annotate "line", 18
    $P53 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P53)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1258055876.35069") :method :outer("11_1258055876.35069")
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
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1258055876.35069") :method
.annotate "line", 5
    $P57 = self."!PREFIX__!subrule"("circumfix", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1258055876.35069") :method :outer("11_1258055876.35069")
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
.sub "!PREFIX__infixish"  :subid("31_1258055876.35069") :method
.annotate "line", 5
    $P62 = self."!PREFIX__!subrule"("OPER=infix", "")
    new $P63, "ResizablePMCArray"
    push $P63, $P62
    .return ($P63)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1258055876.35069") :method :outer("11_1258055876.35069")
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
.sub "!PREFIX__prefixish"  :subid("33_1258055876.35069") :method
.annotate "line", 5
    $P67 = self."!PREFIX__!subrule"("OPER=prefix", "")
    new $P68, "ResizablePMCArray"
    push $P68, $P67
    .return ($P68)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1258055876.35069") :method :outer("11_1258055876.35069")
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
.sub "!PREFIX__postfixish"  :subid("35_1258055876.35069") :method
.annotate "line", 5
    $P72 = self."!PREFIX__!subrule"("OPER=postcircumfix", "")
    $P73 = self."!PREFIX__!subrule"("OPER=postfix", "")
    new $P74, "ResizablePMCArray"
    push $P74, $P72
    push $P74, $P73
    .return ($P74)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("36_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx77_tgt
    .local int rx77_pos
    .local int rx77_off
    .local int rx77_eos
    .local int rx77_rep
    .local pmc rx77_cur
    (rx77_cur, rx77_pos, rx77_tgt, $I10) = self."!cursor_start"()
    rx77_cur."!cursor_debug"("START ", "quote_delimited")
    rx77_cur."!cursor_caparray"("quote_atom")
    .lex unicode:"$\x{a2}", rx77_cur
    .local pmc match
    .lex "$/", match
    length rx77_eos, rx77_tgt
    set rx77_off, 0
    lt $I10, 2, rx77_start
    sub rx77_off, $I10, 1
    substr rx77_tgt, rx77_tgt, rx77_off
  rx77_start:
.annotate "line", 31
  # rx subrule "starter" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."starter"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("starter")
    rx77_pos = $P10."pos"()
  # rx rxquantr81 ** 0..*
    set_addr $I82, rxquantr81_done
    rx77_cur."!mark_push"(0, rx77_pos, $I82)
  rxquantr81_loop:
  # rx subrule "quote_atom" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."quote_atom"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_atom")
    rx77_pos = $P10."pos"()
    (rx77_rep) = rx77_cur."!mark_commit"($I82)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I82)
    goto rxquantr81_loop
  rxquantr81_done:
  # rx subrule "stopper" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."stopper"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx77_pos = $P10."pos"()
.annotate "line", 30
  # rx pass
    rx77_cur."!cursor_pass"(rx77_pos, "quote_delimited")
    rx77_cur."!cursor_debug"("PASS  ", "quote_delimited", " at pos=", rx77_pos)
    .return (rx77_cur)
  rx77_fail:
.annotate "line", 5
    (rx77_rep, rx77_pos, $I10, $P10) = rx77_cur."!mark_fail"(0)
    lt rx77_pos, -1, rx77_done
    eq rx77_pos, -1, rx77_fail
    jump $I10
  rx77_done:
    rx77_cur."!cursor_fail"()
    rx77_cur."!cursor_debug"("FAIL  ", "quote_delimited")
    .return (rx77_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_delimited"  :subid("37_1258055876.35069") :method
.annotate "line", 5
    $P79 = self."!PREFIX__!subrule"("starter", "")
    new $P80, "ResizablePMCArray"
    push $P80, $P79
    .return ($P80)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("38_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx84_tgt
    .local int rx84_pos
    .local int rx84_off
    .local int rx84_eos
    .local int rx84_rep
    .local pmc rx84_cur
    (rx84_cur, rx84_pos, rx84_tgt, $I10) = self."!cursor_start"()
    rx84_cur."!cursor_debug"("START ", "quote_atom")
    .lex unicode:"$\x{a2}", rx84_cur
    .local pmc match
    .lex "$/", match
    length rx84_eos, rx84_tgt
    set rx84_off, 0
    lt $I10, 2, rx84_start
    sub rx84_off, $I10, 1
    substr rx84_tgt, rx84_tgt, rx84_off
  rx84_start:
.annotate "line", 35
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."stopper"()
    if $P10, rx84_fail
  alt87_0:
.annotate "line", 36
    set_addr $I10, alt87_1
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
.annotate "line", 37
  # rx subrule "quote_escape" subtype=capture negate=
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."quote_escape"()
    unless $P10, rx84_fail
    rx84_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_escape")
    rx84_pos = $P10."pos"()
    goto alt87_end
  alt87_1:
.annotate "line", 38
  # rx rxquantr88 ** 1..*
    set_addr $I91, rxquantr88_done
    rx84_cur."!mark_push"(0, -1, $I91)
  rxquantr88_loop:
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."stopper"()
    if $P10, rx84_fail
  # rx subrule "quote_escape" subtype=zerowidth negate=1
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."quote_escape"()
    if $P10, rx84_fail
  # rx charclass .
    ge rx84_pos, rx84_eos, rx84_fail
    inc rx84_pos
    (rx84_rep) = rx84_cur."!mark_commit"($I91)
    rx84_cur."!mark_push"(rx84_rep, rx84_pos, $I91)
    goto rxquantr88_loop
  rxquantr88_done:
  alt87_end:
.annotate "line", 34
  # rx pass
    rx84_cur."!cursor_pass"(rx84_pos, "quote_atom")
    rx84_cur."!cursor_debug"("PASS  ", "quote_atom", " at pos=", rx84_pos)
    .return (rx84_cur)
  rx84_fail:
.annotate "line", 5
    (rx84_rep, rx84_pos, $I10, $P10) = rx84_cur."!mark_fail"(0)
    lt rx84_pos, -1, rx84_done
    eq rx84_pos, -1, rx84_fail
    jump $I10
  rx84_done:
    rx84_cur."!cursor_fail"()
    rx84_cur."!cursor_debug"("FAIL  ", "quote_atom")
    .return (rx84_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_atom"  :subid("39_1258055876.35069") :method
.annotate "line", 5
    new $P86, "ResizablePMCArray"
    push $P86, ""
    .return ($P86)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("40_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx93_tgt
    .local int rx93_pos
    .local int rx93_off
    .local int rx93_eos
    .local int rx93_rep
    .local pmc rx93_cur
    (rx93_cur, rx93_pos, rx93_tgt, $I10) = self."!cursor_start"()
    rx93_cur."!cursor_debug"("START ", "hexint")
    .lex unicode:"$\x{a2}", rx93_cur
    .local pmc match
    .lex "$/", match
    length rx93_eos, rx93_tgt
    set rx93_off, 0
    lt $I10, 2, rx93_start
    sub rx93_off, $I10, 1
    substr rx93_tgt, rx93_tgt, rx93_off
  rx93_start:
.annotate "line", 42
  # rx rxquantr96 ** 1..*
    set_addr $I99, rxquantr96_done
    rx93_cur."!mark_push"(0, -1, $I99)
  rxquantr96_loop:
  # rx rxquantr97 ** 1..*
    set_addr $I98, rxquantr97_done
    rx93_cur."!mark_push"(0, -1, $I98)
  rxquantr97_loop:
  # rx enumcharlist negate=0 
    ge rx93_pos, rx93_eos, rx93_fail
    sub $I10, rx93_pos, rx93_off
    substr $S10, rx93_tgt, $I10, 1
    index $I11, "0123456789abcdefABCDEF", $S10
    lt $I11, 0, rx93_fail
    inc rx93_pos
    (rx93_rep) = rx93_cur."!mark_commit"($I98)
    rx93_cur."!mark_push"(rx93_rep, rx93_pos, $I98)
    goto rxquantr97_loop
  rxquantr97_done:
    (rx93_rep) = rx93_cur."!mark_commit"($I99)
    rx93_cur."!mark_push"(rx93_rep, rx93_pos, $I99)
  # rx literal  "_"
    add $I11, rx93_pos, 1
    gt $I11, rx93_eos, rx93_fail
    sub $I11, rx93_pos, rx93_off
    substr $S10, rx93_tgt, $I11, 1
    ne $S10, "_", rx93_fail
    add rx93_pos, 1
    goto rxquantr96_loop
  rxquantr96_done:
  # rx pass
    rx93_cur."!cursor_pass"(rx93_pos, "hexint")
    rx93_cur."!cursor_debug"("PASS  ", "hexint", " at pos=", rx93_pos)
    .return (rx93_cur)
  rx93_fail:
.annotate "line", 5
    (rx93_rep, rx93_pos, $I10, $P10) = rx93_cur."!mark_fail"(0)
    lt rx93_pos, -1, rx93_done
    eq rx93_pos, -1, rx93_fail
    jump $I10
  rx93_done:
    rx93_cur."!cursor_fail"()
    rx93_cur."!cursor_debug"("FAIL  ", "hexint")
    .return (rx93_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexint"  :subid("41_1258055876.35069") :method
.annotate "line", 5
    new $P95, "ResizablePMCArray"
    push $P95, ""
    .return ($P95)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("42_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx101_tgt
    .local int rx101_pos
    .local int rx101_off
    .local int rx101_eos
    .local int rx101_rep
    .local pmc rx101_cur
    (rx101_cur, rx101_pos, rx101_tgt, $I10) = self."!cursor_start"()
    rx101_cur."!cursor_debug"("START ", "hexints")
    rx101_cur."!cursor_caparray"("hexint")
    .lex unicode:"$\x{a2}", rx101_cur
    .local pmc match
    .lex "$/", match
    length rx101_eos, rx101_tgt
    set rx101_off, 0
    lt $I10, 2, rx101_start
    sub rx101_off, $I10, 1
    substr rx101_tgt, rx101_tgt, rx101_off
  rx101_start:
.annotate "line", 43
  # rx rxquantr104 ** 1..*
    set_addr $I105, rxquantr104_done
    rx101_cur."!mark_push"(0, -1, $I105)
  rxquantr104_loop:
  # rx subrule "ws" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."ws"()
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
  # rx subrule "hexint" subtype=capture negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."hexint"()
    unless $P10, rx101_fail
    rx101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx101_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx101_cur."!cursor_pos"(rx101_pos)
    $P10 = rx101_cur."ws"()
    unless $P10, rx101_fail
    rx101_pos = $P10."pos"()
    (rx101_rep) = rx101_cur."!mark_commit"($I105)
    rx101_cur."!mark_push"(rx101_rep, rx101_pos, $I105)
  # rx literal  ","
    add $I11, rx101_pos, 1
    gt $I11, rx101_eos, rx101_fail
    sub $I11, rx101_pos, rx101_off
    substr $S10, rx101_tgt, $I11, 1
    ne $S10, ",", rx101_fail
    add rx101_pos, 1
    goto rxquantr104_loop
  rxquantr104_done:
  # rx pass
    rx101_cur."!cursor_pass"(rx101_pos, "hexints")
    rx101_cur."!cursor_debug"("PASS  ", "hexints", " at pos=", rx101_pos)
    .return (rx101_cur)
  rx101_fail:
.annotate "line", 5
    (rx101_rep, rx101_pos, $I10, $P10) = rx101_cur."!mark_fail"(0)
    lt rx101_pos, -1, rx101_done
    eq rx101_pos, -1, rx101_fail
    jump $I10
  rx101_done:
    rx101_cur."!cursor_fail"()
    rx101_cur."!cursor_debug"("FAIL  ", "hexints")
    .return (rx101_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("43_1258055876.35069") :method
.annotate "line", 5
    new $P103, "ResizablePMCArray"
    push $P103, ""
    .return ($P103)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("44_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx107_tgt
    .local int rx107_pos
    .local int rx107_off
    .local int rx107_eos
    .local int rx107_rep
    .local pmc rx107_cur
    (rx107_cur, rx107_pos, rx107_tgt, $I10) = self."!cursor_start"()
    rx107_cur."!cursor_debug"("START ", "octint")
    .lex unicode:"$\x{a2}", rx107_cur
    .local pmc match
    .lex "$/", match
    length rx107_eos, rx107_tgt
    set rx107_off, 0
    lt $I10, 2, rx107_start
    sub rx107_off, $I10, 1
    substr rx107_tgt, rx107_tgt, rx107_off
  rx107_start:
.annotate "line", 45
  # rx rxquantr110 ** 1..*
    set_addr $I113, rxquantr110_done
    rx107_cur."!mark_push"(0, -1, $I113)
  rxquantr110_loop:
  # rx rxquantr111 ** 1..*
    set_addr $I112, rxquantr111_done
    rx107_cur."!mark_push"(0, -1, $I112)
  rxquantr111_loop:
  # rx enumcharlist negate=0 
    ge rx107_pos, rx107_eos, rx107_fail
    sub $I10, rx107_pos, rx107_off
    substr $S10, rx107_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rx107_fail
    inc rx107_pos
    (rx107_rep) = rx107_cur."!mark_commit"($I112)
    rx107_cur."!mark_push"(rx107_rep, rx107_pos, $I112)
    goto rxquantr111_loop
  rxquantr111_done:
    (rx107_rep) = rx107_cur."!mark_commit"($I113)
    rx107_cur."!mark_push"(rx107_rep, rx107_pos, $I113)
  # rx literal  "_"
    add $I11, rx107_pos, 1
    gt $I11, rx107_eos, rx107_fail
    sub $I11, rx107_pos, rx107_off
    substr $S10, rx107_tgt, $I11, 1
    ne $S10, "_", rx107_fail
    add rx107_pos, 1
    goto rxquantr110_loop
  rxquantr110_done:
  # rx pass
    rx107_cur."!cursor_pass"(rx107_pos, "octint")
    rx107_cur."!cursor_debug"("PASS  ", "octint", " at pos=", rx107_pos)
    .return (rx107_cur)
  rx107_fail:
.annotate "line", 5
    (rx107_rep, rx107_pos, $I10, $P10) = rx107_cur."!mark_fail"(0)
    lt rx107_pos, -1, rx107_done
    eq rx107_pos, -1, rx107_fail
    jump $I10
  rx107_done:
    rx107_cur."!cursor_fail"()
    rx107_cur."!cursor_debug"("FAIL  ", "octint")
    .return (rx107_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octint"  :subid("45_1258055876.35069") :method
.annotate "line", 5
    new $P109, "ResizablePMCArray"
    push $P109, ""
    .return ($P109)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("46_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx115_tgt
    .local int rx115_pos
    .local int rx115_off
    .local int rx115_eos
    .local int rx115_rep
    .local pmc rx115_cur
    (rx115_cur, rx115_pos, rx115_tgt, $I10) = self."!cursor_start"()
    rx115_cur."!cursor_debug"("START ", "octints")
    rx115_cur."!cursor_caparray"("octint")
    .lex unicode:"$\x{a2}", rx115_cur
    .local pmc match
    .lex "$/", match
    length rx115_eos, rx115_tgt
    set rx115_off, 0
    lt $I10, 2, rx115_start
    sub rx115_off, $I10, 1
    substr rx115_tgt, rx115_tgt, rx115_off
  rx115_start:
.annotate "line", 46
  # rx rxquantr118 ** 1..*
    set_addr $I119, rxquantr118_done
    rx115_cur."!mark_push"(0, -1, $I119)
  rxquantr118_loop:
  # rx subrule "ws" subtype=method negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    $P10 = rx115_cur."ws"()
    unless $P10, rx115_fail
    rx115_pos = $P10."pos"()
  # rx subrule "octint" subtype=capture negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    $P10 = rx115_cur."octint"()
    unless $P10, rx115_fail
    rx115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx115_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    $P10 = rx115_cur."ws"()
    unless $P10, rx115_fail
    rx115_pos = $P10."pos"()
    (rx115_rep) = rx115_cur."!mark_commit"($I119)
    rx115_cur."!mark_push"(rx115_rep, rx115_pos, $I119)
  # rx literal  ","
    add $I11, rx115_pos, 1
    gt $I11, rx115_eos, rx115_fail
    sub $I11, rx115_pos, rx115_off
    substr $S10, rx115_tgt, $I11, 1
    ne $S10, ",", rx115_fail
    add rx115_pos, 1
    goto rxquantr118_loop
  rxquantr118_done:
  # rx pass
    rx115_cur."!cursor_pass"(rx115_pos, "octints")
    rx115_cur."!cursor_debug"("PASS  ", "octints", " at pos=", rx115_pos)
    .return (rx115_cur)
  rx115_fail:
.annotate "line", 5
    (rx115_rep, rx115_pos, $I10, $P10) = rx115_cur."!mark_fail"(0)
    lt rx115_pos, -1, rx115_done
    eq rx115_pos, -1, rx115_fail
    jump $I10
  rx115_done:
    rx115_cur."!cursor_fail"()
    rx115_cur."!cursor_debug"("FAIL  ", "octints")
    .return (rx115_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octints"  :subid("47_1258055876.35069") :method
.annotate "line", 5
    new $P117, "ResizablePMCArray"
    push $P117, ""
    .return ($P117)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("48_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx121_tgt
    .local int rx121_pos
    .local int rx121_off
    .local int rx121_eos
    .local int rx121_rep
    .local pmc rx121_cur
    (rx121_cur, rx121_pos, rx121_tgt, $I10) = self."!cursor_start"()
    rx121_cur."!cursor_debug"("START ", "integer")
    .lex unicode:"$\x{a2}", rx121_cur
    .local pmc match
    .lex "$/", match
    length rx121_eos, rx121_tgt
    set rx121_off, 0
    lt $I10, 2, rx121_start
    sub rx121_off, $I10, 1
    substr rx121_tgt, rx121_tgt, rx121_off
  rx121_start:
  alt126_0:
.annotate "line", 49
    set_addr $I10, alt126_1
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
.annotate "line", 50
  # rx literal  "0"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "0", rx121_fail
    add rx121_pos, 1
  alt127_0:
    set_addr $I10, alt127_1
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
  # rx literal  "b"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "b", rx121_fail
    add rx121_pos, 1
  # rx subcapture "binint"
    set_addr $I10, rxcap_132_fail
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
  # rx rxquantr128 ** 1..*
    set_addr $I131, rxquantr128_done
    rx121_cur."!mark_push"(0, -1, $I131)
  rxquantr128_loop:
  # rx rxquantr129 ** 1..*
    set_addr $I130, rxquantr129_done
    rx121_cur."!mark_push"(0, -1, $I130)
  rxquantr129_loop:
  # rx enumcharlist negate=0 
    ge rx121_pos, rx121_eos, rx121_fail
    sub $I10, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I10, 1
    index $I11, "01", $S10
    lt $I11, 0, rx121_fail
    inc rx121_pos
    (rx121_rep) = rx121_cur."!mark_commit"($I130)
    rx121_cur."!mark_push"(rx121_rep, rx121_pos, $I130)
    goto rxquantr129_loop
  rxquantr129_done:
    (rx121_rep) = rx121_cur."!mark_commit"($I131)
    rx121_cur."!mark_push"(rx121_rep, rx121_pos, $I131)
  # rx literal  "_"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "_", rx121_fail
    add rx121_pos, 1
    goto rxquantr128_loop
  rxquantr128_done:
    set_addr $I10, rxcap_132_fail
    ($I12, $I11) = rx121_cur."!mark_peek"($I10)
    rx121_cur."!cursor_pos"($I11)
    ($P10) = rx121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx121_pos, "")
    rx121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("binint")
    goto rxcap_132_done
  rxcap_132_fail:
    goto rx121_fail
  rxcap_132_done:
    goto alt127_end
  alt127_1:
    set_addr $I10, alt127_2
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
.annotate "line", 51
  # rx literal  "o"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "o", rx121_fail
    add rx121_pos, 1
  # rx subrule "octint" subtype=capture negate=
    rx121_cur."!cursor_pos"(rx121_pos)
    $P10 = rx121_cur."octint"()
    unless $P10, rx121_fail
    rx121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx121_pos = $P10."pos"()
    goto alt127_end
  alt127_2:
    set_addr $I10, alt127_3
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
.annotate "line", 52
  # rx literal  "x"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "x", rx121_fail
    add rx121_pos, 1
  # rx subrule "hexint" subtype=capture negate=
    rx121_cur."!cursor_pos"(rx121_pos)
    $P10 = rx121_cur."hexint"()
    unless $P10, rx121_fail
    rx121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx121_pos = $P10."pos"()
    goto alt127_end
  alt127_3:
.annotate "line", 53
  # rx literal  "d"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "d", rx121_fail
    add rx121_pos, 1
  # rx subcapture "decint"
    set_addr $I10, rxcap_135_fail
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
  # rx rxquantr133 ** 1..*
    set_addr $I134, rxquantr133_done
    rx121_cur."!mark_push"(0, -1, $I134)
  rxquantr133_loop:
  # rx charclass_q d r 1..-1
    sub $I10, rx121_pos, rx121_off
    find_not_cclass $I11, 8, rx121_tgt, $I10, rx121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx121_fail
    add rx121_pos, rx121_off, $I11
    (rx121_rep) = rx121_cur."!mark_commit"($I134)
    rx121_cur."!mark_push"(rx121_rep, rx121_pos, $I134)
  # rx literal  "_"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "_", rx121_fail
    add rx121_pos, 1
    goto rxquantr133_loop
  rxquantr133_done:
    set_addr $I10, rxcap_135_fail
    ($I12, $I11) = rx121_cur."!mark_peek"($I10)
    rx121_cur."!cursor_pos"($I11)
    ($P10) = rx121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx121_pos, "")
    rx121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    goto rxcap_135_done
  rxcap_135_fail:
    goto rx121_fail
  rxcap_135_done:
  alt127_end:
.annotate "line", 50
    goto alt126_end
  alt126_1:
.annotate "line", 55
  # rx subcapture "decint"
    set_addr $I10, rxcap_138_fail
    rx121_cur."!mark_push"(0, rx121_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx121_pos, rx121_off
    find_not_cclass $I11, 8, rx121_tgt, $I10, rx121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx121_fail
    add rx121_pos, rx121_off, $I11
  # rx rxquantr136 ** 0..*
    set_addr $I137, rxquantr136_done
    rx121_cur."!mark_push"(0, rx121_pos, $I137)
  rxquantr136_loop:
  # rx literal  "_"
    add $I11, rx121_pos, 1
    gt $I11, rx121_eos, rx121_fail
    sub $I11, rx121_pos, rx121_off
    substr $S10, rx121_tgt, $I11, 1
    ne $S10, "_", rx121_fail
    add rx121_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx121_pos, rx121_off
    find_not_cclass $I11, 8, rx121_tgt, $I10, rx121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx121_fail
    add rx121_pos, rx121_off, $I11
    (rx121_rep) = rx121_cur."!mark_commit"($I137)
    rx121_cur."!mark_push"(rx121_rep, rx121_pos, $I137)
    goto rxquantr136_loop
  rxquantr136_done:
    set_addr $I10, rxcap_138_fail
    ($I12, $I11) = rx121_cur."!mark_peek"($I10)
    rx121_cur."!cursor_pos"($I11)
    ($P10) = rx121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx121_pos, "")
    rx121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    goto rxcap_138_done
  rxcap_138_fail:
    goto rx121_fail
  rxcap_138_done:
  alt126_end:
.annotate "line", 48
  # rx pass
    rx121_cur."!cursor_pass"(rx121_pos, "integer")
    rx121_cur."!cursor_debug"("PASS  ", "integer", " at pos=", rx121_pos)
    .return (rx121_cur)
  rx121_fail:
.annotate "line", 5
    (rx121_rep, rx121_pos, $I10, $P10) = rx121_cur."!mark_fail"(0)
    lt rx121_pos, -1, rx121_done
    eq rx121_pos, -1, rx121_fail
    jump $I10
  rx121_done:
    rx121_cur."!cursor_fail"()
    rx121_cur."!cursor_debug"("FAIL  ", "integer")
    .return (rx121_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__integer"  :subid("49_1258055876.35069") :method
.annotate "line", 5
    $P123 = self."!PREFIX__!subrule"("hexint", "0x")
    $P124 = self."!PREFIX__!subrule"("octint", "0o")
    new $P125, "ResizablePMCArray"
    push $P125, ""
    push $P125, "0d"
    push $P125, $P123
    push $P125, $P124
    push $P125, "0b"
    .return ($P125)
.end


.namespace ["HLL";"Grammar"]
.sub "dec_number"  :subid("50_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx140_tgt
    .local int rx140_pos
    .local int rx140_off
    .local int rx140_eos
    .local int rx140_rep
    .local pmc rx140_cur
    (rx140_cur, rx140_pos, rx140_tgt, $I10) = self."!cursor_start"()
    rx140_cur."!cursor_debug"("START ", "dec_number")
    rx140_cur."!cursor_caparray"("escale")
    .lex unicode:"$\x{a2}", rx140_cur
    .local pmc match
    .lex "$/", match
    length rx140_eos, rx140_tgt
    set rx140_off, 0
    lt $I10, 2, rx140_start
    sub rx140_off, $I10, 1
    substr rx140_tgt, rx140_tgt, rx140_off
  rx140_start:
  alt143_0:
.annotate "line", 59
    set_addr $I10, alt143_1
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
.annotate "line", 60
  # rx subcapture "coeff"
    set_addr $I10, rxcap_144_fail
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  # rx literal  "."
    add $I11, rx140_pos, 1
    gt $I11, rx140_eos, rx140_fail
    sub $I11, rx140_pos, rx140_off
    substr $S10, rx140_tgt, $I11, 1
    ne $S10, ".", rx140_fail
    add rx140_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx140_pos, rx140_off
    find_not_cclass $I11, 8, rx140_tgt, $I10, rx140_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx140_fail
    add rx140_pos, rx140_off, $I11
    set_addr $I10, rxcap_144_fail
    ($I12, $I11) = rx140_cur."!mark_peek"($I10)
    rx140_cur."!cursor_pos"($I11)
    ($P10) = rx140_cur."!cursor_start"()
    $P10."!cursor_pass"(rx140_pos, "")
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_144_done
  rxcap_144_fail:
    goto rx140_fail
  rxcap_144_done:
  # rx rxquantr145 ** 0..1
    set_addr $I146, rxquantr145_done
    rx140_cur."!mark_push"(0, rx140_pos, $I146)
  rxquantr145_loop:
  # rx subrule "escale" subtype=capture negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."escale"()
    unless $P10, rx140_fail
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx140_pos = $P10."pos"()
    (rx140_rep) = rx140_cur."!mark_commit"($I146)
  rxquantr145_done:
    goto alt143_end
  alt143_1:
    set_addr $I10, alt143_2
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
.annotate "line", 61
  # rx subcapture "coeff"
    set_addr $I10, rxcap_147_fail
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx140_pos, rx140_off
    find_not_cclass $I11, 8, rx140_tgt, $I10, rx140_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx140_fail
    add rx140_pos, rx140_off, $I11
  # rx literal  "."
    add $I11, rx140_pos, 1
    gt $I11, rx140_eos, rx140_fail
    sub $I11, rx140_pos, rx140_off
    substr $S10, rx140_tgt, $I11, 1
    ne $S10, ".", rx140_fail
    add rx140_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx140_pos, rx140_off
    find_not_cclass $I11, 8, rx140_tgt, $I10, rx140_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx140_fail
    add rx140_pos, rx140_off, $I11
    set_addr $I10, rxcap_147_fail
    ($I12, $I11) = rx140_cur."!mark_peek"($I10)
    rx140_cur."!cursor_pos"($I11)
    ($P10) = rx140_cur."!cursor_start"()
    $P10."!cursor_pass"(rx140_pos, "")
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_147_done
  rxcap_147_fail:
    goto rx140_fail
  rxcap_147_done:
  # rx rxquantr148 ** 0..1
    set_addr $I149, rxquantr148_done
    rx140_cur."!mark_push"(0, rx140_pos, $I149)
  rxquantr148_loop:
  # rx subrule "escale" subtype=capture negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."escale"()
    unless $P10, rx140_fail
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx140_pos = $P10."pos"()
    (rx140_rep) = rx140_cur."!mark_commit"($I149)
  rxquantr148_done:
    goto alt143_end
  alt143_2:
.annotate "line", 62
  # rx subcapture "coeff"
    set_addr $I10, rxcap_150_fail
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx140_pos, rx140_off
    find_not_cclass $I11, 8, rx140_tgt, $I10, rx140_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx140_fail
    add rx140_pos, rx140_off, $I11
    set_addr $I10, rxcap_150_fail
    ($I12, $I11) = rx140_cur."!mark_peek"($I10)
    rx140_cur."!cursor_pos"($I11)
    ($P10) = rx140_cur."!cursor_start"()
    $P10."!cursor_pass"(rx140_pos, "")
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_150_done
  rxcap_150_fail:
    goto rx140_fail
  rxcap_150_done:
  # rx subrule "escale" subtype=capture negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."escale"()
    unless $P10, rx140_fail
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx140_pos = $P10."pos"()
  alt143_end:
.annotate "line", 59
  # rx pass
    rx140_cur."!cursor_pass"(rx140_pos, "dec_number")
    rx140_cur."!cursor_debug"("PASS  ", "dec_number", " at pos=", rx140_pos)
    .return (rx140_cur)
  rx140_fail:
.annotate "line", 5
    (rx140_rep, rx140_pos, $I10, $P10) = rx140_cur."!mark_fail"(0)
    lt rx140_pos, -1, rx140_done
    eq rx140_pos, -1, rx140_fail
    jump $I10
  rx140_done:
    rx140_cur."!cursor_fail"()
    rx140_cur."!cursor_debug"("FAIL  ", "dec_number")
    .return (rx140_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__dec_number"  :subid("51_1258055876.35069") :method
.annotate "line", 5
    new $P142, "ResizablePMCArray"
    push $P142, ""
    push $P142, ""
    push $P142, "."
    .return ($P142)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("52_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx152_tgt
    .local int rx152_pos
    .local int rx152_off
    .local int rx152_eos
    .local int rx152_rep
    .local pmc rx152_cur
    (rx152_cur, rx152_pos, rx152_tgt, $I10) = self."!cursor_start"()
    rx152_cur."!cursor_debug"("START ", "escale")
    .lex unicode:"$\x{a2}", rx152_cur
    .local pmc match
    .lex "$/", match
    length rx152_eos, rx152_tgt
    set rx152_off, 0
    lt $I10, 2, rx152_start
    sub rx152_off, $I10, 1
    substr rx152_tgt, rx152_tgt, rx152_off
  rx152_start:
.annotate "line", 65
  # rx enumcharlist negate=0 
    ge rx152_pos, rx152_eos, rx152_fail
    sub $I10, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I10, 1
    index $I11, "Ee", $S10
    lt $I11, 0, rx152_fail
    inc rx152_pos
  # rx rxquantr155 ** 0..1
    set_addr $I156, rxquantr155_done
    rx152_cur."!mark_push"(0, rx152_pos, $I156)
  rxquantr155_loop:
  # rx enumcharlist negate=0 
    ge rx152_pos, rx152_eos, rx152_fail
    sub $I10, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx152_fail
    inc rx152_pos
    (rx152_rep) = rx152_cur."!mark_commit"($I156)
  rxquantr155_done:
  # rx charclass_q d r 1..-1
    sub $I10, rx152_pos, rx152_off
    find_not_cclass $I11, 8, rx152_tgt, $I10, rx152_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx152_fail
    add rx152_pos, rx152_off, $I11
  # rx pass
    rx152_cur."!cursor_pass"(rx152_pos, "escale")
    rx152_cur."!cursor_debug"("PASS  ", "escale", " at pos=", rx152_pos)
    .return (rx152_cur)
  rx152_fail:
.annotate "line", 5
    (rx152_rep, rx152_pos, $I10, $P10) = rx152_cur."!mark_fail"(0)
    lt rx152_pos, -1, rx152_done
    eq rx152_pos, -1, rx152_fail
    jump $I10
  rx152_done:
    rx152_cur."!cursor_fail"()
    rx152_cur."!cursor_debug"("FAIL  ", "escale")
    .return (rx152_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__escale"  :subid("53_1258055876.35069") :method
.annotate "line", 5
    new $P154, "ResizablePMCArray"
    push $P154, "e"
    push $P154, "E"
    .return ($P154)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("54_1258055876.35069") :method
.annotate "line", 67
    $P158 = self."!protoregex"("quote_escape")
    .return ($P158)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("55_1258055876.35069") :method
.annotate "line", 67
    $P160 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P160)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("56_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    (rx162_cur, rx162_pos, rx162_tgt, $I10) = self."!cursor_start"()
    rx162_cur."!cursor_debug"("START ", "quote_escape:sym<backslash>")
    .lex unicode:"$\x{a2}", rx162_cur
    .local pmc match
    .lex "$/", match
    length rx162_eos, rx162_tgt
    set rx162_off, 0
    lt $I10, 2, rx162_start
    sub rx162_off, $I10, 1
    substr rx162_tgt, rx162_tgt, rx162_off
  rx162_start:
.annotate "line", 68
  # rx literal  "\\\\"
    add $I11, rx162_pos, 2
    gt $I11, rx162_eos, rx162_fail
    sub $I11, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I11, 2
    ne $S10, "\\\\", rx162_fail
    add rx162_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."quotemod_check"("q")
    unless $P10, rx162_fail
  # rx pass
    rx162_cur."!cursor_pass"(rx162_pos, "quote_escape:sym<backslash>")
    rx162_cur."!cursor_debug"("PASS  ", "quote_escape:sym<backslash>", " at pos=", rx162_pos)
    .return (rx162_cur)
  rx162_fail:
.annotate "line", 5
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    rx162_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<backslash>")
    .return (rx162_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("57_1258055876.35069") :method
.annotate "line", 5
    new $P164, "ResizablePMCArray"
    push $P164, "\\\\"
    .return ($P164)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("58_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx166_tgt
    .local int rx166_pos
    .local int rx166_off
    .local int rx166_eos
    .local int rx166_rep
    .local pmc rx166_cur
    (rx166_cur, rx166_pos, rx166_tgt, $I10) = self."!cursor_start"()
    rx166_cur."!cursor_debug"("START ", "quote_escape:sym<stopper>")
    .lex unicode:"$\x{a2}", rx166_cur
    .local pmc match
    .lex "$/", match
    length rx166_eos, rx166_tgt
    set rx166_off, 0
    lt $I10, 2, rx166_start
    sub rx166_off, $I10, 1
    substr rx166_tgt, rx166_tgt, rx166_off
  rx166_start:
.annotate "line", 69
  # rx literal  "\\"
    add $I11, rx166_pos, 1
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 1
    ne $S10, "\\", rx166_fail
    add rx166_pos, 1
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."quotemod_check"("q")
    unless $P10, rx166_fail
  # rx subrule "stopper" subtype=capture negate=
    rx166_cur."!cursor_pos"(rx166_pos)
    $P10 = rx166_cur."stopper"()
    unless $P10, rx166_fail
    rx166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx166_pos = $P10."pos"()
  # rx pass
    rx166_cur."!cursor_pass"(rx166_pos, "quote_escape:sym<stopper>")
    rx166_cur."!cursor_debug"("PASS  ", "quote_escape:sym<stopper>", " at pos=", rx166_pos)
    .return (rx166_cur)
  rx166_fail:
.annotate "line", 5
    (rx166_rep, rx166_pos, $I10, $P10) = rx166_cur."!mark_fail"(0)
    lt rx166_pos, -1, rx166_done
    eq rx166_pos, -1, rx166_fail
    jump $I10
  rx166_done:
    rx166_cur."!cursor_fail"()
    rx166_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<stopper>")
    .return (rx166_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("59_1258055876.35069") :method
.annotate "line", 5
    new $P168, "ResizablePMCArray"
    push $P168, "\\"
    .return ($P168)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("60_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx170_tgt
    .local int rx170_pos
    .local int rx170_off
    .local int rx170_eos
    .local int rx170_rep
    .local pmc rx170_cur
    (rx170_cur, rx170_pos, rx170_tgt, $I10) = self."!cursor_start"()
    rx170_cur."!cursor_debug"("START ", "quote_escape:sym<bs>")
    .lex unicode:"$\x{a2}", rx170_cur
    .local pmc match
    .lex "$/", match
    length rx170_eos, rx170_tgt
    set rx170_off, 0
    lt $I10, 2, rx170_start
    sub rx170_off, $I10, 1
    substr rx170_tgt, rx170_tgt, rx170_off
  rx170_start:
.annotate "line", 71
  # rx literal  "\\b"
    add $I11, rx170_pos, 2
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 2
    ne $S10, "\\b", rx170_fail
    add rx170_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx170_cur."!cursor_pos"(rx170_pos)
    $P10 = rx170_cur."quotemod_check"("b")
    unless $P10, rx170_fail
  # rx pass
    rx170_cur."!cursor_pass"(rx170_pos, "quote_escape:sym<bs>")
    rx170_cur."!cursor_debug"("PASS  ", "quote_escape:sym<bs>", " at pos=", rx170_pos)
    .return (rx170_cur)
  rx170_fail:
.annotate "line", 5
    (rx170_rep, rx170_pos, $I10, $P10) = rx170_cur."!mark_fail"(0)
    lt rx170_pos, -1, rx170_done
    eq rx170_pos, -1, rx170_fail
    jump $I10
  rx170_done:
    rx170_cur."!cursor_fail"()
    rx170_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<bs>")
    .return (rx170_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("61_1258055876.35069") :method
.annotate "line", 5
    new $P172, "ResizablePMCArray"
    push $P172, "\\b"
    .return ($P172)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("62_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx174_tgt
    .local int rx174_pos
    .local int rx174_off
    .local int rx174_eos
    .local int rx174_rep
    .local pmc rx174_cur
    (rx174_cur, rx174_pos, rx174_tgt, $I10) = self."!cursor_start"()
    rx174_cur."!cursor_debug"("START ", "quote_escape:sym<nl>")
    .lex unicode:"$\x{a2}", rx174_cur
    .local pmc match
    .lex "$/", match
    length rx174_eos, rx174_tgt
    set rx174_off, 0
    lt $I10, 2, rx174_start
    sub rx174_off, $I10, 1
    substr rx174_tgt, rx174_tgt, rx174_off
  rx174_start:
.annotate "line", 72
  # rx literal  "\\n"
    add $I11, rx174_pos, 2
    gt $I11, rx174_eos, rx174_fail
    sub $I11, rx174_pos, rx174_off
    substr $S10, rx174_tgt, $I11, 2
    ne $S10, "\\n", rx174_fail
    add rx174_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx174_cur."!cursor_pos"(rx174_pos)
    $P10 = rx174_cur."quotemod_check"("b")
    unless $P10, rx174_fail
  # rx pass
    rx174_cur."!cursor_pass"(rx174_pos, "quote_escape:sym<nl>")
    rx174_cur."!cursor_debug"("PASS  ", "quote_escape:sym<nl>", " at pos=", rx174_pos)
    .return (rx174_cur)
  rx174_fail:
.annotate "line", 5
    (rx174_rep, rx174_pos, $I10, $P10) = rx174_cur."!mark_fail"(0)
    lt rx174_pos, -1, rx174_done
    eq rx174_pos, -1, rx174_fail
    jump $I10
  rx174_done:
    rx174_cur."!cursor_fail"()
    rx174_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<nl>")
    .return (rx174_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("63_1258055876.35069") :method
.annotate "line", 5
    new $P176, "ResizablePMCArray"
    push $P176, "\\n"
    .return ($P176)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("64_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx178_tgt
    .local int rx178_pos
    .local int rx178_off
    .local int rx178_eos
    .local int rx178_rep
    .local pmc rx178_cur
    (rx178_cur, rx178_pos, rx178_tgt, $I10) = self."!cursor_start"()
    rx178_cur."!cursor_debug"("START ", "quote_escape:sym<cr>")
    .lex unicode:"$\x{a2}", rx178_cur
    .local pmc match
    .lex "$/", match
    length rx178_eos, rx178_tgt
    set rx178_off, 0
    lt $I10, 2, rx178_start
    sub rx178_off, $I10, 1
    substr rx178_tgt, rx178_tgt, rx178_off
  rx178_start:
.annotate "line", 73
  # rx literal  "\\r"
    add $I11, rx178_pos, 2
    gt $I11, rx178_eos, rx178_fail
    sub $I11, rx178_pos, rx178_off
    substr $S10, rx178_tgt, $I11, 2
    ne $S10, "\\r", rx178_fail
    add rx178_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx178_cur."!cursor_pos"(rx178_pos)
    $P10 = rx178_cur."quotemod_check"("b")
    unless $P10, rx178_fail
  # rx pass
    rx178_cur."!cursor_pass"(rx178_pos, "quote_escape:sym<cr>")
    rx178_cur."!cursor_debug"("PASS  ", "quote_escape:sym<cr>", " at pos=", rx178_pos)
    .return (rx178_cur)
  rx178_fail:
.annotate "line", 5
    (rx178_rep, rx178_pos, $I10, $P10) = rx178_cur."!mark_fail"(0)
    lt rx178_pos, -1, rx178_done
    eq rx178_pos, -1, rx178_fail
    jump $I10
  rx178_done:
    rx178_cur."!cursor_fail"()
    rx178_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<cr>")
    .return (rx178_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("65_1258055876.35069") :method
.annotate "line", 5
    new $P180, "ResizablePMCArray"
    push $P180, "\\r"
    .return ($P180)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("66_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx182_tgt
    .local int rx182_pos
    .local int rx182_off
    .local int rx182_eos
    .local int rx182_rep
    .local pmc rx182_cur
    (rx182_cur, rx182_pos, rx182_tgt, $I10) = self."!cursor_start"()
    rx182_cur."!cursor_debug"("START ", "quote_escape:sym<tab>")
    .lex unicode:"$\x{a2}", rx182_cur
    .local pmc match
    .lex "$/", match
    length rx182_eos, rx182_tgt
    set rx182_off, 0
    lt $I10, 2, rx182_start
    sub rx182_off, $I10, 1
    substr rx182_tgt, rx182_tgt, rx182_off
  rx182_start:
.annotate "line", 74
  # rx literal  "\\t"
    add $I11, rx182_pos, 2
    gt $I11, rx182_eos, rx182_fail
    sub $I11, rx182_pos, rx182_off
    substr $S10, rx182_tgt, $I11, 2
    ne $S10, "\\t", rx182_fail
    add rx182_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."quotemod_check"("b")
    unless $P10, rx182_fail
  # rx pass
    rx182_cur."!cursor_pass"(rx182_pos, "quote_escape:sym<tab>")
    rx182_cur."!cursor_debug"("PASS  ", "quote_escape:sym<tab>", " at pos=", rx182_pos)
    .return (rx182_cur)
  rx182_fail:
.annotate "line", 5
    (rx182_rep, rx182_pos, $I10, $P10) = rx182_cur."!mark_fail"(0)
    lt rx182_pos, -1, rx182_done
    eq rx182_pos, -1, rx182_fail
    jump $I10
  rx182_done:
    rx182_cur."!cursor_fail"()
    rx182_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<tab>")
    .return (rx182_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("67_1258055876.35069") :method
.annotate "line", 5
    new $P184, "ResizablePMCArray"
    push $P184, "\\t"
    .return ($P184)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("68_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx186_tgt
    .local int rx186_pos
    .local int rx186_off
    .local int rx186_eos
    .local int rx186_rep
    .local pmc rx186_cur
    (rx186_cur, rx186_pos, rx186_tgt, $I10) = self."!cursor_start"()
    rx186_cur."!cursor_debug"("START ", "quote_escape:sym<hex>")
    .lex unicode:"$\x{a2}", rx186_cur
    .local pmc match
    .lex "$/", match
    length rx186_eos, rx186_tgt
    set rx186_off, 0
    lt $I10, 2, rx186_start
    sub rx186_off, $I10, 1
    substr rx186_tgt, rx186_tgt, rx186_off
  rx186_start:
.annotate "line", 76
  # rx literal  unicode:"\\x"
    add $I11, rx186_pos, 2
    gt $I11, rx186_eos, rx186_fail
    sub $I11, rx186_pos, rx186_off
    substr $S10, rx186_tgt, $I11, 2
    ne $S10, unicode:"\\x", rx186_fail
    add rx186_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."quotemod_check"("b")
    unless $P10, rx186_fail
  alt189_0:
.annotate "line", 77
    set_addr $I10, alt189_1
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."hexint"()
    unless $P10, rx186_fail
    rx186_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx186_pos = $P10."pos"()
    goto alt189_end
  alt189_1:
  # rx literal  "["
    add $I11, rx186_pos, 1
    gt $I11, rx186_eos, rx186_fail
    sub $I11, rx186_pos, rx186_off
    substr $S10, rx186_tgt, $I11, 1
    ne $S10, "[", rx186_fail
    add rx186_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."hexints"()
    unless $P10, rx186_fail
    rx186_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx186_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx186_pos, 1
    gt $I11, rx186_eos, rx186_fail
    sub $I11, rx186_pos, rx186_off
    substr $S10, rx186_tgt, $I11, 1
    ne $S10, "]", rx186_fail
    add rx186_pos, 1
  alt189_end:
.annotate "line", 75
  # rx pass
    rx186_cur."!cursor_pass"(rx186_pos, "quote_escape:sym<hex>")
    rx186_cur."!cursor_debug"("PASS  ", "quote_escape:sym<hex>", " at pos=", rx186_pos)
    .return (rx186_cur)
  rx186_fail:
.annotate "line", 5
    (rx186_rep, rx186_pos, $I10, $P10) = rx186_cur."!mark_fail"(0)
    lt rx186_pos, -1, rx186_done
    eq rx186_pos, -1, rx186_fail
    jump $I10
  rx186_done:
    rx186_cur."!cursor_fail"()
    rx186_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<hex>")
    .return (rx186_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("69_1258055876.35069") :method
.annotate "line", 5
    new $P188, "ResizablePMCArray"
    push $P188, unicode:"\\x"
    .return ($P188)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("70_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    (rx191_cur, rx191_pos, rx191_tgt, $I10) = self."!cursor_start"()
    rx191_cur."!cursor_debug"("START ", "quote_escape:sym<oct>")
    .lex unicode:"$\x{a2}", rx191_cur
    .local pmc match
    .lex "$/", match
    length rx191_eos, rx191_tgt
    set rx191_off, 0
    lt $I10, 2, rx191_start
    sub rx191_off, $I10, 1
    substr rx191_tgt, rx191_tgt, rx191_off
  rx191_start:
.annotate "line", 80
  # rx literal  "\\o"
    add $I11, rx191_pos, 2
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 2
    ne $S10, "\\o", rx191_fail
    add rx191_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."quotemod_check"("b")
    unless $P10, rx191_fail
  alt194_0:
.annotate "line", 81
    set_addr $I10, alt194_1
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."octint"()
    unless $P10, rx191_fail
    rx191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx191_pos = $P10."pos"()
    goto alt194_end
  alt194_1:
  # rx literal  "["
    add $I11, rx191_pos, 1
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 1
    ne $S10, "[", rx191_fail
    add rx191_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."octints"()
    unless $P10, rx191_fail
    rx191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx191_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx191_pos, 1
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 1
    ne $S10, "]", rx191_fail
    add rx191_pos, 1
  alt194_end:
.annotate "line", 79
  # rx pass
    rx191_cur."!cursor_pass"(rx191_pos, "quote_escape:sym<oct>")
    rx191_cur."!cursor_debug"("PASS  ", "quote_escape:sym<oct>", " at pos=", rx191_pos)
    .return (rx191_cur)
  rx191_fail:
.annotate "line", 5
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    rx191_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<oct>")
    .return (rx191_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("71_1258055876.35069") :method
.annotate "line", 5
    new $P193, "ResizablePMCArray"
    push $P193, "\\o"
    .return ($P193)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("72_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt, $I10) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "quote_escape:sym<chr>")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    set rx196_off, 0
    lt $I10, 2, rx196_start
    sub rx196_off, $I10, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
.annotate "line", 83
  # rx literal  "\\c"
    add $I11, rx196_pos, 2
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 2
    ne $S10, "\\c", rx196_fail
    add rx196_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."quotemod_check"("b")
    unless $P10, rx196_fail
  # rx subrule "charspec" subtype=capture negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."charspec"()
    unless $P10, rx196_fail
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx196_pos = $P10."pos"()
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "quote_escape:sym<chr>")
    rx196_cur."!cursor_debug"("PASS  ", "quote_escape:sym<chr>", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate "line", 5
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<chr>")
    .return (rx196_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("73_1258055876.35069") :method
.annotate "line", 5
    new $P198, "ResizablePMCArray"
    push $P198, "\\c"
    .return ($P198)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("74_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .const 'Sub' $P208 = "76_1258055876.35069" 
    capture_lex $P208
    .local string rx200_tgt
    .local int rx200_pos
    .local int rx200_off
    .local int rx200_eos
    .local int rx200_rep
    .local pmc rx200_cur
    (rx200_cur, rx200_pos, rx200_tgt, $I10) = self."!cursor_start"()
    rx200_cur."!cursor_debug"("START ", "charname")
    .lex unicode:"$\x{a2}", rx200_cur
    .local pmc match
    .lex "$/", match
    length rx200_eos, rx200_tgt
    set rx200_off, 0
    lt $I10, 2, rx200_start
    sub rx200_off, $I10, 1
    substr rx200_tgt, rx200_tgt, rx200_off
  rx200_start:
  alt204_0:
.annotate "line", 85
    set_addr $I10, alt204_1
    rx200_cur."!mark_push"(0, rx200_pos, $I10)
.annotate "line", 86
  # rx subrule "integer" subtype=capture negate=
    rx200_cur."!cursor_pos"(rx200_pos)
    $P10 = rx200_cur."integer"()
    unless $P10, rx200_fail
    rx200_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx200_pos = $P10."pos"()
    goto alt204_end
  alt204_1:
.annotate "line", 87
  # rx enumcharlist negate=0 
    ge rx200_pos, rx200_eos, rx200_fail
    sub $I10, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx200_fail
    inc rx200_pos
  # rx rxquantf205 ** 0..*
    set_addr $I10, rxquantf205_loop
    rx200_cur."!mark_push"(0, rx200_pos, $I10)
    goto rxquantf205_done
  rxquantf205_loop:
  # rx enumcharlist negate=1 
    ge rx200_pos, rx200_eos, rx200_fail
    sub $I10, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I10, 1
    index $I11, "],#", $S10
    ge $I11, 0, rx200_fail
    inc rx200_pos
    set_addr $I10, rxquantf205_loop
    rx200_cur."!mark_push"($I206, rx200_pos, $I10)
  rxquantf205_done:
  # rx enumcharlist negate=0 
    ge rx200_pos, rx200_eos, rx200_fail
    sub $I10, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)", $S10
    lt $I11, 0, rx200_fail
    inc rx200_pos
.annotate "line", 88
  # rx subrule "before" subtype=zerowidth negate=
    rx200_cur."!cursor_pos"(rx200_pos)
    .const 'Sub' $P208 = "76_1258055876.35069" 
    capture_lex $P208
    $P10 = rx200_cur."before"($P208)
    unless $P10, rx200_fail
  alt204_end:
.annotate "line", 85
  # rx pass
    rx200_cur."!cursor_pass"(rx200_pos, "charname")
    rx200_cur."!cursor_debug"("PASS  ", "charname", " at pos=", rx200_pos)
    .return (rx200_cur)
  rx200_fail:
.annotate "line", 5
    (rx200_rep, rx200_pos, $I10, $P10) = rx200_cur."!mark_fail"(0)
    lt rx200_pos, -1, rx200_done
    eq rx200_pos, -1, rx200_fail
    jump $I10
  rx200_done:
    rx200_cur."!cursor_fail"()
    rx200_cur."!cursor_debug"("FAIL  ", "charname")
    .return (rx200_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charname"  :subid("75_1258055876.35069") :method
.annotate "line", 5
    $P202 = self."!PREFIX__!subrule"("integer", "")
    new $P203, "ResizablePMCArray"
    push $P203, "Z"
    push $P203, "Y"
    push $P203, "X"
    push $P203, "W"
    push $P203, "V"
    push $P203, "U"
    push $P203, "T"
    push $P203, "S"
    push $P203, "R"
    push $P203, "Q"
    push $P203, "P"
    push $P203, "O"
    push $P203, "N"
    push $P203, "M"
    push $P203, "L"
    push $P203, "K"
    push $P203, "J"
    push $P203, "I"
    push $P203, "H"
    push $P203, "G"
    push $P203, "F"
    push $P203, "E"
    push $P203, "D"
    push $P203, "C"
    push $P203, "B"
    push $P203, "A"
    push $P203, "z"
    push $P203, "y"
    push $P203, "x"
    push $P203, "w"
    push $P203, "v"
    push $P203, "u"
    push $P203, "t"
    push $P203, "s"
    push $P203, "r"
    push $P203, "q"
    push $P203, "p"
    push $P203, "o"
    push $P203, "n"
    push $P203, "m"
    push $P203, "l"
    push $P203, "k"
    push $P203, "j"
    push $P203, "i"
    push $P203, "h"
    push $P203, "g"
    push $P203, "f"
    push $P203, "e"
    push $P203, "d"
    push $P203, "c"
    push $P203, "b"
    push $P203, "a"
    push $P203, $P202
    .return ($P203)
.end


.namespace ["HLL";"Grammar"]
.sub "_block207"  :anon :subid("76_1258055876.35069") :method :outer("74_1258055876.35069")
.annotate "line", 88
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt, $I10) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    set rx209_off, 0
    lt $I10, 2, rx209_start
    sub rx209_off, $I10, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    ge rx209_pos, 0, rxscan210_done
  rxscan210_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan210_done
    set_addr $I10, rxscan210_loop
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  rxscan210_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx209_pos, rx209_off
    find_not_cclass $I11, 32, rx209_tgt, $I10, rx209_eos
    add rx209_pos, rx209_off, $I11
  # rx enumcharlist negate=0 
    ge rx209_pos, rx209_eos, rx209_fail
    sub $I10, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I10, 1
    index $I11, "],#", $S10
    lt $I11, 0, rx209_fail
    inc rx209_pos
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "")
    rx209_cur."!cursor_debug"("PASS  ", "", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "")
    .return (rx209_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "charnames"  :subid("77_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt, $I10) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "charnames")
    rx212_cur."!cursor_caparray"("charname")
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    set rx212_off, 0
    lt $I10, 2, rx212_start
    sub rx212_off, $I10, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
.annotate "line", 90
  # rx rxquantr215 ** 1..*
    set_addr $I216, rxquantr215_done
    rx212_cur."!mark_push"(0, -1, $I216)
  rxquantr215_loop:
  # rx subrule "ws" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."ws"()
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
  # rx subrule "charname" subtype=capture negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."charname"()
    unless $P10, rx212_fail
    rx212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charname")
    rx212_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."ws"()
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
    (rx212_rep) = rx212_cur."!mark_commit"($I216)
    rx212_cur."!mark_push"(rx212_rep, rx212_pos, $I216)
  # rx literal  ","
    add $I11, rx212_pos, 1
    gt $I11, rx212_eos, rx212_fail
    sub $I11, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I11, 1
    ne $S10, ",", rx212_fail
    add rx212_pos, 1
    goto rxquantr215_loop
  rxquantr215_done:
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "charnames")
    rx212_cur."!cursor_debug"("PASS  ", "charnames", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 5
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "charnames")
    .return (rx212_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charnames"  :subid("78_1258055876.35069") :method
.annotate "line", 5
    new $P214, "ResizablePMCArray"
    push $P214, ""
    .return ($P214)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("79_1258055876.35069") :method :outer("11_1258055876.35069")
.annotate "line", 5
    .local string rx218_tgt
    .local int rx218_pos
    .local int rx218_off
    .local int rx218_eos
    .local int rx218_rep
    .local pmc rx218_cur
    (rx218_cur, rx218_pos, rx218_tgt, $I10) = self."!cursor_start"()
    rx218_cur."!cursor_debug"("START ", "charspec")
    .lex unicode:"$\x{a2}", rx218_cur
    .local pmc match
    .lex "$/", match
    length rx218_eos, rx218_tgt
    set rx218_off, 0
    lt $I10, 2, rx218_start
    sub rx218_off, $I10, 1
    substr rx218_tgt, rx218_tgt, rx218_off
  rx218_start:
  alt223_0:
.annotate "line", 92
    set_addr $I10, alt223_1
    rx218_cur."!mark_push"(0, rx218_pos, $I10)
.annotate "line", 93
  # rx literal  "["
    add $I11, rx218_pos, 1
    gt $I11, rx218_eos, rx218_fail
    sub $I11, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I11, 1
    ne $S10, "[", rx218_fail
    add rx218_pos, 1
  # rx subrule "charnames" subtype=capture negate=
    rx218_cur."!cursor_pos"(rx218_pos)
    $P10 = rx218_cur."charnames"()
    unless $P10, rx218_fail
    rx218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charnames")
    rx218_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx218_pos, 1
    gt $I11, rx218_eos, rx218_fail
    sub $I11, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I11, 1
    ne $S10, "]", rx218_fail
    add rx218_pos, 1
    goto alt223_end
  alt223_1:
    set_addr $I10, alt223_2
    rx218_cur."!mark_push"(0, rx218_pos, $I10)
.annotate "line", 94
  # rx charclass_q d r 1..-1
    sub $I10, rx218_pos, rx218_off
    find_not_cclass $I11, 8, rx218_tgt, $I10, rx218_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx218_fail
    add rx218_pos, rx218_off, $I11
  # rx rxquantr224 ** 0..*
    set_addr $I225, rxquantr224_done
    rx218_cur."!mark_push"(0, rx218_pos, $I225)
  rxquantr224_loop:
  # rx literal  "_"
    add $I11, rx218_pos, 1
    gt $I11, rx218_eos, rx218_fail
    sub $I11, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I11, 1
    ne $S10, "_", rx218_fail
    add rx218_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx218_pos, rx218_off
    find_not_cclass $I11, 8, rx218_tgt, $I10, rx218_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx218_fail
    add rx218_pos, rx218_off, $I11
    (rx218_rep) = rx218_cur."!mark_commit"($I225)
    rx218_cur."!mark_push"(rx218_rep, rx218_pos, $I225)
    goto rxquantr224_loop
  rxquantr224_done:
    goto alt223_end
  alt223_2:
    set_addr $I10, alt223_3
    rx218_cur."!mark_push"(0, rx218_pos, $I10)
.annotate "line", 95
  # rx enumcharlist negate=0 
    ge rx218_pos, rx218_eos, rx218_fail
    sub $I10, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I10, 1
    index $I11, "?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx218_fail
    inc rx218_pos
    goto alt223_end
  alt223_3:
.annotate "line", 96
  # rx subrule "panic" subtype=method negate=
    rx218_cur."!cursor_pos"(rx218_pos)
    $P10 = rx218_cur."panic"("Unrecognized \\\\c character")
    unless $P10, rx218_fail
    rx218_pos = $P10."pos"()
  alt223_end:
.annotate "line", 91
  # rx pass
    rx218_cur."!cursor_pass"(rx218_pos, "charspec")
    rx218_cur."!cursor_debug"("PASS  ", "charspec", " at pos=", rx218_pos)
    .return (rx218_cur)
  rx218_fail:
.annotate "line", 5
    (rx218_rep, rx218_pos, $I10, $P10) = rx218_cur."!mark_fail"(0)
    lt rx218_pos, -1, rx218_done
    eq rx218_pos, -1, rx218_fail
    jump $I10
  rx218_done:
    rx218_cur."!cursor_fail"()
    rx218_cur."!cursor_debug"("FAIL  ", "charspec")
    .return (rx218_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charspec"  :subid("80_1258055876.35069") :method
.annotate "line", 5
    $P220 = self."!PREFIX__!subrule"("panic", "")
    $P221 = self."!PREFIX__!subrule"("charnames", "[")
    new $P222, "ResizablePMCArray"
    push $P222, $P220
    push $P222, "Z"
    push $P222, "Y"
    push $P222, "X"
    push $P222, "W"
    push $P222, "V"
    push $P222, "U"
    push $P222, "T"
    push $P222, "S"
    push $P222, "R"
    push $P222, "Q"
    push $P222, "P"
    push $P222, "O"
    push $P222, "N"
    push $P222, "M"
    push $P222, "L"
    push $P222, "K"
    push $P222, "J"
    push $P222, "I"
    push $P222, "H"
    push $P222, "G"
    push $P222, "F"
    push $P222, "E"
    push $P222, "D"
    push $P222, "C"
    push $P222, "B"
    push $P222, "A"
    push $P222, "@"
    push $P222, "?"
    push $P222, ""
    push $P222, $P221
    .return ($P222)
.end

### .include 'gen/hllgrammar-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258055878.60441")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
    $P440 = $P14()
.annotate "line", 1
    .return ($P440)
.end


.namespace []
.sub "" :load :init :subid("post38") :outer("10_1258055878.60441")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258055878.60441" 
    .local pmc block
    set block, $P12
    $P441 = get_root_global ["parrot"], "P6metaclass"
    $P441."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block13"  :subid("11_1258055878.60441") :outer("10_1258055878.60441")
.annotate "line", 3
    .const 'Sub' $P423 = "37_1258055878.60441" 
    capture_lex $P423
    .const 'Sub' $P406 = "36_1258055878.60441" 
    capture_lex $P406
    .const 'Sub' $P399 = "35_1258055878.60441" 
    capture_lex $P399
    .const 'Sub' $P392 = "34_1258055878.60441" 
    capture_lex $P392
    .const 'Sub' $P385 = "33_1258055878.60441" 
    capture_lex $P385
    .const 'Sub' $P378 = "32_1258055878.60441" 
    capture_lex $P378
    .const 'Sub' $P368 = "31_1258055878.60441" 
    capture_lex $P368
    .const 'Sub' $P361 = "30_1258055878.60441" 
    capture_lex $P361
    .const 'Sub' $P345 = "29_1258055878.60441" 
    capture_lex $P345
    .const 'Sub' $P271 = "27_1258055878.60441" 
    capture_lex $P271
    .const 'Sub' $P212 = "24_1258055878.60441" 
    capture_lex $P212
    .const 'Sub' $P203 = "23_1258055878.60441" 
    capture_lex $P203
    .const 'Sub' $P194 = "22_1258055878.60441" 
    capture_lex $P194
    .const 'Sub' $P185 = "21_1258055878.60441" 
    capture_lex $P185
    .const 'Sub' $P154 = "20_1258055878.60441" 
    capture_lex $P154
    .const 'Sub' $P144 = "19_1258055878.60441" 
    capture_lex $P144
    .const 'Sub' $P134 = "18_1258055878.60441" 
    capture_lex $P134
    .const 'Sub' $P34 = "15_1258055878.60441" 
    capture_lex $P34
    .const 'Sub' $P28 = "14_1258055878.60441" 
    capture_lex $P28
    .const 'Sub' $P22 = "13_1258055878.60441" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258055878.60441" 
    capture_lex $P15
.annotate "line", 183
    .const 'Sub' $P423 = "37_1258055878.60441" 
    capture_lex $P423
.annotate "line", 3
    .return ($P423)
.end


.namespace ["HLL";"Actions"]
.sub "string_to_int"  :subid("12_1258055878.60441") :outer("11_1258055878.60441")
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
.sub "ints_to_string"  :subid("13_1258055878.60441") :outer("11_1258055878.60441")
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
.sub "isaPAST"  :subid("14_1258055878.60441") :outer("11_1258055878.60441")
    .param pmc param_31
.annotate "line", 61
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "$x", param_31
.annotate "line", 62

        $P0 = find_lex '$x'
        $I0 = isa $P0, ['PAST';'Node']
        $P32 = box $I0
    
.annotate "line", 61
    .return ($P32)
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "EXPR"  :subid("15_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_37
    .param pmc param_38 :optional
    .param int has_param_38 :opt_flag
.annotate "line", 69
    .const 'Sub' $P117 = "17_1258055878.60441" 
    capture_lex $P117
    .const 'Sub' $P84 = "16_1258055878.60441" 
    capture_lex $P84
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$/", param_37
    if has_param_38, optparam_39
    new $P39, "Undef"
    set param_38, $P39
  optparam_39:
    .lex "$key", param_38
.annotate "line", 71
    new $P40, "Undef"
    .lex "$past", $P40
.annotate "line", 70
    find_lex $P42, "$key"
    if $P42, unless_41_end
    new $P43, "Exception"
    set $P43['type'], 58
    new $P44, "Integer"
    assign $P44, 0
    setattribute $P43, 'payload', $P44
    throw $P43
  unless_41_end:
.annotate "line", 71
    find_lex $P46, "$/"
    $P47 = $P46."peek_ast"()
    set $P45, $P47
    defined $I49, $P45
    if $I49, default_48
    find_lex $P50, "$/"
    unless_null $P50, vivify_40
    new $P50, "Hash"
  vivify_40:
    set $P51, $P50["OPER"]
    unless_null $P51, vivify_41
    new $P51, "Undef"
  vivify_41:
    $P52 = $P51."peek_ast"()
    set $P45, $P52
  default_48:
    store_lex "$past", $P45
.annotate "line", 72
    find_lex $P54, "$past"
    if $P54, unless_53_end
.annotate "line", 73
    get_hll_global $P55, ["PAST"], "Op"
    find_lex $P56, "$/"
    $P57 = $P55."new"($P56 :named("node"))
    store_lex "$past", $P57
.annotate "line", 74
    find_lex $P59, "$/"
    unless_null $P59, vivify_42
    new $P59, "Hash"
  vivify_42:
    set $P60, $P59["OPER"]
    unless_null $P60, vivify_43
    new $P60, "Hash"
  vivify_43:
    set $P61, $P60["O"]
    unless_null $P61, vivify_44
    new $P61, "Hash"
  vivify_44:
    set $P62, $P61["pasttype"]
    unless_null $P62, vivify_45
    new $P62, "Undef"
  vivify_45:
    if $P62, if_58
.annotate "line", 75
    find_lex $P70, "$/"
    unless_null $P70, vivify_46
    new $P70, "Hash"
  vivify_46:
    set $P71, $P70["OPER"]
    unless_null $P71, vivify_47
    new $P71, "Hash"
  vivify_47:
    set $P72, $P71["O"]
    unless_null $P72, vivify_48
    new $P72, "Hash"
  vivify_48:
    set $P73, $P72["pirop"]
    unless_null $P73, vivify_49
    new $P73, "Undef"
  vivify_49:
    unless $P73, if_69_end
    find_lex $P74, "$past"
    find_lex $P75, "$/"
    unless_null $P75, vivify_50
    new $P75, "Hash"
  vivify_50:
    set $P76, $P75["OPER"]
    unless_null $P76, vivify_51
    new $P76, "Hash"
  vivify_51:
    set $P77, $P76["O"]
    unless_null $P77, vivify_52
    new $P77, "Hash"
  vivify_52:
    set $P78, $P77["pirop"]
    unless_null $P78, vivify_53
    new $P78, "Undef"
  vivify_53:
    set $S79, $P78
    $P74."pirop"($S79)
  if_69_end:
    goto if_58_end
  if_58:
.annotate "line", 74
    find_lex $P63, "$past"
    find_lex $P64, "$/"
    unless_null $P64, vivify_54
    new $P64, "Hash"
  vivify_54:
    set $P65, $P64["OPER"]
    unless_null $P65, vivify_55
    new $P65, "Hash"
  vivify_55:
    set $P66, $P65["O"]
    unless_null $P66, vivify_56
    new $P66, "Hash"
  vivify_56:
    set $P67, $P66["pasttype"]
    unless_null $P67, vivify_57
    new $P67, "Undef"
  vivify_57:
    set $S68, $P67
    $P63."pasttype"($S68)
  if_58_end:
.annotate "line", 76
    find_lex $P81, "$past"
    $P82 = $P81."name"()
    if $P82, unless_80_end
    .const 'Sub' $P84 = "16_1258055878.60441" 
    capture_lex $P84
    $P84()
  unless_80_end:
  unless_53_end:
.annotate "line", 87
    find_lex $P104, "$key"
    set $S105, $P104
    iseq $I106, $S105, "POSTFIX"
    if $I106, if_103
.annotate "line", 89
    find_lex $P112, "$/"
    $P113 = $P112."list"()
    defined $I114, $P113
    unless $I114, for_undef_61
    iter $P111, $P113
    new $P128, 'ExceptionHandler'
    set_addr $P128, loop127_handler
    $P128."handle_types"(65, 67, 66)
    push_eh $P128
  loop127_test:
    unless $P111, loop127_done
    shift $P115, $P111
  loop127_redo:
    .const 'Sub' $P117 = "17_1258055878.60441" 
    capture_lex $P117
    $P117($P115)
  loop127_next:
    goto loop127_test
  loop127_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, 'type'
    eq $P129, 65, loop127_next
    eq $P129, 67, loop127_redo
  loop127_done:
    pop_eh 
  for_undef_61:
.annotate "line", 88
    goto if_103_end
  if_103:
.annotate "line", 87
    find_lex $P107, "$past"
    find_lex $P108, "$/"
    unless_null $P108, vivify_62
    new $P108, "ResizablePMCArray"
  vivify_62:
    set $P109, $P108[0]
    unless_null $P109, vivify_63
    new $P109, "Undef"
  vivify_63:
    $P110 = $P109."ast"()
    $P107."unshift"($P110)
  if_103_end:
.annotate "line", 91
    find_lex $P130, "$/"
    find_lex $P131, "$past"
    $P132 = $P130."!make"($P131)
.annotate "line", 69
    .return ($P132)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block83"  :anon :subid("16_1258055878.60441") :outer("15_1258055878.60441")
.annotate "line", 78
    new $P85, "Undef"
    .lex "$name", $P85
.annotate "line", 77
    find_lex $P87, "$key"
    set $S88, $P87
    iseq $I89, $S88, "LIST"
    unless $I89, if_86_end
    new $P90, "String"
    assign $P90, "infix"
    store_lex "$key", $P90
  if_86_end:
.annotate "line", 78

                $P0 = find_lex '$key'
                $S0 = $P0
                $S0 = downcase $S0
                $P91 = box $S0
            
    concat $P92, $P91, ":<"
.annotate "line", 83
    find_lex $P93, "$/"
    unless_null $P93, vivify_58
    new $P93, "Hash"
  vivify_58:
    set $P94, $P93["OPER"]
    unless_null $P94, vivify_59
    new $P94, "Hash"
  vivify_59:
    set $P95, $P94["sym"]
    unless_null $P95, vivify_60
    new $P95, "Undef"
  vivify_60:
    concat $P96, $P92, $P95
    concat $P97, $P96, ">"
    store_lex "$name", $P97
.annotate "line", 84
    find_lex $P98, "$past"
    new $P99, "String"
    assign $P99, "&"
    find_lex $P100, "$name"
    concat $P101, $P99, $P100
    $P102 = $P98."name"($P101)
.annotate "line", 76
    .return ($P102)
.end


.namespace ["HLL";"Actions"]
.sub "_block116"  :anon :subid("17_1258055878.60441") :outer("15_1258055878.60441")
    .param pmc param_118
.annotate "line", 89
    .lex "$_", param_118
    find_lex $P121, "$_"
    $P122 = $P121."ast"()
    if $P122, if_120
    set $P119, $P122
    goto if_120_end
  if_120:
    find_lex $P123, "$past"
    find_lex $P124, "$_"
    $P125 = $P124."ast"()
    $P126 = $P123."push"($P125)
    set $P119, $P126
  if_120_end:
    .return ($P119)
.end


.namespace ["HLL";"Actions"]
.sub "termish"  :subid("18_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_137
.annotate "line", 94
    new $P136, 'ExceptionHandler'
    set_addr $P136, control_135
    $P136."handle_types"(58)
    push_eh $P136
    .lex "self", self
    .lex "$/", param_137
.annotate "line", 95
    find_lex $P138, "$/"
    find_lex $P139, "$/"
    unless_null $P139, vivify_64
    new $P139, "Hash"
  vivify_64:
    set $P140, $P139["term"]
    unless_null $P140, vivify_65
    new $P140, "Undef"
  vivify_65:
    $P141 = $P140."ast"()
    $P142 = $P138."!make"($P141)
.annotate "line", 94
    .return ($P142)
  control_135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "term:sym<circumfix>"  :subid("19_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_147
.annotate "line", 98
    new $P146, 'ExceptionHandler'
    set_addr $P146, control_145
    $P146."handle_types"(58)
    push_eh $P146
    .lex "self", self
    .lex "$/", param_147
    find_lex $P148, "$/"
    find_lex $P149, "$/"
    unless_null $P149, vivify_66
    new $P149, "Hash"
  vivify_66:
    set $P150, $P149["circumfix"]
    unless_null $P150, vivify_67
    new $P150, "Undef"
  vivify_67:
    $P151 = $P150."ast"()
    $P152 = $P148."!make"($P151)
    .return ($P152)
  control_145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "integer"  :subid("20_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_157
.annotate "line", 100
    new $P156, 'ExceptionHandler'
    set_addr $P156, control_155
    $P156."handle_types"(58)
    push_eh $P156
    .lex "self", self
    .lex "$/", param_157
.annotate "line", 101
    find_lex $P158, "$/"
.annotate "line", 102
    find_lex $P161, "$/"
    unless_null $P161, vivify_68
    new $P161, "Hash"
  vivify_68:
    set $P162, $P161["decint"]
    unless_null $P162, vivify_69
    new $P162, "Undef"
  vivify_69:
    if $P162, if_160
.annotate "line", 104
    find_lex $P168, "$/"
    unless_null $P168, vivify_70
    new $P168, "Hash"
  vivify_70:
    set $P169, $P168["hexint"]
    unless_null $P169, vivify_71
    new $P169, "Undef"
  vivify_71:
    if $P169, if_167
.annotate "line", 106
    find_lex $P175, "$/"
    unless_null $P175, vivify_72
    new $P175, "Hash"
  vivify_72:
    set $P176, $P175["octint"]
    unless_null $P176, vivify_73
    new $P176, "Undef"
  vivify_73:
    if $P176, if_174
.annotate "line", 107
    find_lex $P180, "$/"
    unless_null $P180, vivify_74
    new $P180, "Hash"
  vivify_74:
    set $P181, $P180["binint"]
    unless_null $P181, vivify_75
    new $P181, "Undef"
  vivify_75:
    $P182 = "string_to_int"($P181, 2)
    set $P173, $P182
.annotate "line", 106
    goto if_174_end
  if_174:
    find_lex $P177, "$/"
    unless_null $P177, vivify_76
    new $P177, "Hash"
  vivify_76:
    set $P178, $P177["octint"]
    unless_null $P178, vivify_77
    new $P178, "Undef"
  vivify_77:
    $P179 = $P178."ast"()
    set $P173, $P179
  if_174_end:
    set $P166, $P173
.annotate "line", 104
    goto if_167_end
  if_167:
    find_lex $P170, "$/"
    unless_null $P170, vivify_78
    new $P170, "Hash"
  vivify_78:
    set $P171, $P170["hexint"]
    unless_null $P171, vivify_79
    new $P171, "Undef"
  vivify_79:
    $P172 = $P171."ast"()
    set $P166, $P172
  if_167_end:
    set $P159, $P166
.annotate "line", 102
    goto if_160_end
  if_160:
    find_lex $P163, "$/"
    unless_null $P163, vivify_80
    new $P163, "Hash"
  vivify_80:
    set $P164, $P163["decint"]
    unless_null $P164, vivify_81
    new $P164, "Undef"
  vivify_81:
    $P165 = "string_to_int"($P164, 10)
    set $P159, $P165
  if_160_end:
    $P183 = $P158."!make"($P159)
.annotate "line", 100
    .return ($P183)
  control_155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P184, exception, "payload"
    .return ($P184)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "dec_number"  :subid("21_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_188
.annotate "line", 112
    new $P187, 'ExceptionHandler'
    set_addr $P187, control_186
    $P187."handle_types"(58)
    push_eh $P187
    .lex "self", self
    .lex "$/", param_188
    find_lex $P189, "$/"
    find_lex $P190, "$/"
    set $N191, $P190
    $P192 = $P189."!make"($N191)
    .return ($P192)
  control_186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "hexint"  :subid("22_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_197
.annotate "line", 114
    new $P196, 'ExceptionHandler'
    set_addr $P196, control_195
    $P196."handle_types"(58)
    push_eh $P196
    .lex "self", self
    .lex "$/", param_197
.annotate "line", 115
    find_lex $P198, "$/"
    find_lex $P199, "$/"
    $P200 = "string_to_int"($P199, 16)
    $P201 = $P198."!make"($P200)
.annotate "line", 114
    .return ($P201)
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, "payload"
    .return ($P202)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "octint"  :subid("23_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_206
.annotate "line", 118
    new $P205, 'ExceptionHandler'
    set_addr $P205, control_204
    $P205."handle_types"(58)
    push_eh $P205
    .lex "self", self
    .lex "$/", param_206
.annotate "line", 119
    find_lex $P207, "$/"
    find_lex $P208, "$/"
    $P209 = "string_to_int"($P208, 8)
    $P210 = $P207."!make"($P209)
.annotate "line", 118
    .return ($P210)
  control_204:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_EXPR"  :subid("24_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_215
.annotate "line", 122
    .const 'Sub' $P230 = "25_1258055878.60441" 
    capture_lex $P230
    new $P214, 'ExceptionHandler'
    set_addr $P214, control_213
    $P214."handle_types"(58)
    push_eh $P214
    .lex "self", self
    .lex "$/", param_215
.annotate "line", 123
    new $P216, "Undef"
    .lex "$past", $P216
    find_lex $P217, "$/"
    unless_null $P217, vivify_82
    new $P217, "Hash"
  vivify_82:
    set $P218, $P217["quote_delimited"]
    unless_null $P218, vivify_83
    new $P218, "Undef"
  vivify_83:
    $P219 = $P218."ast"()
    store_lex "$past", $P219
.annotate "line", 124
    get_hll_global $P221, ["HLL";"Grammar"], "quotemod_check"
    find_lex $P222, "$/"
    $P223 = $P221($P222, "w")
    unless $P223, if_220_end
.annotate "line", 125
    find_lex $P225, "$past"
    $P226 = "isaPAST"($P225)
    if $P226, if_224
.annotate "line", 128
    .const 'Sub' $P230 = "25_1258055878.60441" 
    capture_lex $P230
    $P230()
    goto if_224_end
  if_224:
.annotate "line", 126
    find_lex $P227, "$/"
    $P228 = $P227."CURSOR"()
    $P228."panic"("Can't form :w list from non-constant strings (yet)")
  if_224_end:
  if_220_end:
.annotate "line", 136
    find_lex $P260, "$past"
    $P261 = "isaPAST"($P260)
    isfalse $I262, $P261
    unless $I262, if_259_end
.annotate "line", 137
    get_hll_global $P263, ["PAST"], "Val"
    find_lex $P264, "$past"
    set $S265, $P264
    $P266 = $P263."new"($S265 :named("value"))
    store_lex "$past", $P266
  if_259_end:
.annotate "line", 139
    find_lex $P267, "$/"
    find_lex $P268, "$past"
    $P269 = $P267."!make"($P268)
.annotate "line", 122
    .return ($P269)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block229"  :anon :subid("25_1258055878.60441") :outer("24_1258055878.60441")
.annotate "line", 128
    .const 'Sub' $P251 = "26_1258055878.60441" 
    capture_lex $P251
.annotate "line", 129
    new $P231, "ResizablePMCArray"
    .lex "@words", $P231
    get_hll_global $P232, ["HLL";"Grammar"], "split_words"
    find_lex $P233, "$/"
    find_lex $P234, "$past"
    $P235 = $P232($P233, $P234)
    store_lex "@words", $P235
.annotate "line", 130
    find_lex $P238, "@words"
    set $N239, $P238
    new $P240, "Integer"
    assign $P240, 1
    set $N241, $P240
    isgt $I242, $N239, $N241
    if $I242, if_237
    new $P236, 'Integer'
    set $P236, $I242
    goto if_237_end
  if_237:
.annotate "line", 131
    get_hll_global $P243, ["PAST"], "Op"
    find_lex $P244, "$/"
    $P245 = $P243."new"("list" :named("pasttype"), $P244 :named("node"))
    store_lex "$past", $P245
.annotate "line", 132
    find_lex $P247, "@words"
    defined $I248, $P247
    unless $I248, for_undef_84
    iter $P246, $P247
    new $P257, 'ExceptionHandler'
    set_addr $P257, loop256_handler
    $P257."handle_types"(65, 67, 66)
    push_eh $P257
  loop256_test:
    unless $P246, loop256_done
    shift $P249, $P246
  loop256_redo:
    .const 'Sub' $P251 = "26_1258055878.60441" 
    capture_lex $P251
    $P251($P249)
  loop256_next:
    goto loop256_test
  loop256_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, 'type'
    eq $P258, 65, loop256_next
    eq $P258, 67, loop256_redo
  loop256_done:
    pop_eh 
  for_undef_84:
.annotate "line", 130
    set $P236, $P246
  if_237_end:
.annotate "line", 128
    .return ($P236)
.end


.namespace ["HLL";"Actions"]
.sub "_block250"  :anon :subid("26_1258055878.60441") :outer("25_1258055878.60441")
    .param pmc param_252
.annotate "line", 132
    .lex "$_", param_252
    find_lex $P253, "$past"
    find_lex $P254, "$_"
    $P255 = $P253."push"($P254)
    .return ($P255)
.end


.namespace ["HLL";"Actions"]
.sub "quote_delimited"  :subid("27_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_274
.annotate "line", 142
    .const 'Sub' $P286 = "28_1258055878.60441" 
    capture_lex $P286
    new $P273, 'ExceptionHandler'
    set_addr $P273, control_272
    $P273."handle_types"(58)
    push_eh $P273
    .lex "self", self
    .lex "$/", param_274
.annotate "line", 143
    new $P275, "ResizablePMCArray"
    .lex "@parts", $P275
.annotate "line", 144
    new $P276, "Undef"
    .lex "$lastlit", $P276
.annotate "line", 160
    new $P277, "Undef"
    .lex "$past", $P277
.annotate "line", 142
    find_lex $P278, "@parts"
.annotate "line", 144
    new $P279, "String"
    assign $P279, ""
    store_lex "$lastlit", $P279
.annotate "line", 145
    find_lex $P281, "$/"
    unless_null $P281, vivify_85
    new $P281, "Hash"
  vivify_85:
    set $P282, $P281["quote_atom"]
    unless_null $P282, vivify_86
    new $P282, "Undef"
  vivify_86:
    defined $I283, $P282
    unless $I283, for_undef_87
    iter $P280, $P282
    new $P318, 'ExceptionHandler'
    set_addr $P318, loop317_handler
    $P318."handle_types"(65, 67, 66)
    push_eh $P318
  loop317_test:
    unless $P280, loop317_done
    shift $P284, $P280
  loop317_redo:
    .const 'Sub' $P286 = "28_1258055878.60441" 
    capture_lex $P286
    $P286($P284)
  loop317_next:
    goto loop317_test
  loop317_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P319, exception, 'type'
    eq $P319, 65, loop317_next
    eq $P319, 67, loop317_redo
  loop317_done:
    pop_eh 
  for_undef_87:
.annotate "line", 159
    find_lex $P321, "$lastlit"
    set $S322, $P321
    isgt $I323, $S322, ""
    unless $I323, if_320_end
    find_lex $P324, "@parts"
    find_lex $P325, "$lastlit"
    $P324."push"($P325)
  if_320_end:
.annotate "line", 160
    find_lex $P328, "@parts"
    if $P328, if_327
    new $P331, "String"
    assign $P331, ""
    set $P326, $P331
    goto if_327_end
  if_327:
    find_lex $P329, "@parts"
    $P330 = $P329."shift"()
    set $P326, $P330
  if_327_end:
    store_lex "$past", $P326
.annotate "line", 161
    new $P339, 'ExceptionHandler'
    set_addr $P339, loop338_handler
    $P339."handle_types"(65, 67, 66)
    push_eh $P339
  loop338_test:
    find_lex $P332, "@parts"
    unless $P332, loop338_done
  loop338_redo:
.annotate "line", 162
    get_hll_global $P333, ["PAST"], "Op"
    find_lex $P334, "$past"
    find_lex $P335, "@parts"
    $P336 = $P335."shift"()
    $P337 = $P333."new"($P334, $P336, "concat" :named("pirop"))
    store_lex "$past", $P337
  loop338_next:
.annotate "line", 161
    goto loop338_test
  loop338_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P340, exception, 'type'
    eq $P340, 65, loop338_next
    eq $P340, 67, loop338_redo
  loop338_done:
    pop_eh 
.annotate "line", 164
    find_lex $P341, "$/"
    find_lex $P342, "$past"
    $P343 = $P341."!make"($P342)
.annotate "line", 142
    .return ($P343)
  control_272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, "payload"
    .return ($P344)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block285"  :anon :subid("28_1258055878.60441") :outer("27_1258055878.60441")
    .param pmc param_288
.annotate "line", 146
    new $P287, "Undef"
    .lex "$ast", $P287
    .lex "$_", param_288
    find_lex $P289, "$_"
    $P290 = $P289."ast"()
    store_lex "$ast", $P290
.annotate "line", 147
    find_lex $P293, "$ast"
    $P294 = "isaPAST"($P293)
    isfalse $I295, $P294
    if $I295, if_292
.annotate "line", 150
    find_lex $P301, "$ast"
    get_hll_global $P302, ["PAST"], "Val"
    $P303 = $P301."isa"($P302)
    if $P303, if_300
.annotate "line", 154
    find_lex $P309, "$lastlit"
    set $S310, $P309
    isgt $I311, $S310, ""
    unless $I311, if_308_end
    find_lex $P312, "@parts"
    find_lex $P313, "$lastlit"
    $P312."push"($P313)
  if_308_end:
.annotate "line", 155
    find_lex $P314, "@parts"
    find_lex $P315, "$ast"
    $P314."push"($P315)
.annotate "line", 156
    new $P316, "String"
    assign $P316, ""
    store_lex "$lastlit", $P316
.annotate "line", 153
    set $P299, $P316
.annotate "line", 150
    goto if_300_end
  if_300:
.annotate "line", 151
    find_lex $P304, "$lastlit"
    find_lex $P305, "$ast"
    $S306 = $P305."value"()
    concat $P307, $P304, $S306
    store_lex "$lastlit", $P307
.annotate "line", 150
    set $P299, $P307
  if_300_end:
    set $P291, $P299
.annotate "line", 147
    goto if_292_end
  if_292:
.annotate "line", 148
    find_lex $P296, "$lastlit"
    find_lex $P297, "$ast"
    concat $P298, $P296, $P297
    store_lex "$lastlit", $P298
.annotate "line", 147
    set $P291, $P298
  if_292_end:
.annotate "line", 145
    .return ($P291)
.end


.namespace ["HLL";"Actions"]
.sub "quote_atom"  :subid("29_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_348
.annotate "line", 167
    new $P347, 'ExceptionHandler'
    set_addr $P347, control_346
    $P347."handle_types"(58)
    push_eh $P347
    .lex "self", self
    .lex "$/", param_348
.annotate "line", 168
    find_lex $P349, "$/"
    find_lex $P352, "$/"
    unless_null $P352, vivify_88
    new $P352, "Hash"
  vivify_88:
    set $P353, $P352["quote_escape"]
    unless_null $P353, vivify_89
    new $P353, "Undef"
  vivify_89:
    if $P353, if_351
    find_lex $P357, "$/"
    set $S358, $P357
    new $P350, 'String'
    set $P350, $S358
    goto if_351_end
  if_351:
    find_lex $P354, "$/"
    unless_null $P354, vivify_90
    new $P354, "Hash"
  vivify_90:
    set $P355, $P354["quote_escape"]
    unless_null $P355, vivify_91
    new $P355, "Undef"
  vivify_91:
    $P356 = $P355."ast"()
    set $P350, $P356
  if_351_end:
    $P359 = $P349."!make"($P350)
.annotate "line", 167
    .return ($P359)
  control_346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P360, exception, "payload"
    .return ($P360)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<backslash>"  :subid("30_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_364
.annotate "line", 171
    new $P363, 'ExceptionHandler'
    set_addr $P363, control_362
    $P363."handle_types"(58)
    push_eh $P363
    .lex "self", self
    .lex "$/", param_364
    find_lex $P365, "$/"
    $P366 = $P365."!make"("\\")
    .return ($P366)
  control_362:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P367, exception, "payload"
    .return ($P367)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<stopper>"  :subid("31_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_371
.annotate "line", 172
    new $P370, 'ExceptionHandler'
    set_addr $P370, control_369
    $P370."handle_types"(58)
    push_eh $P370
    .lex "self", self
    .lex "$/", param_371
    find_lex $P372, "$/"
    find_lex $P373, "$/"
    unless_null $P373, vivify_92
    new $P373, "Hash"
  vivify_92:
    set $P374, $P373["stopper"]
    unless_null $P374, vivify_93
    new $P374, "Undef"
  vivify_93:
    set $S375, $P374
    $P376 = $P372."!make"($S375)
    .return ($P376)
  control_369:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P377, exception, "payload"
    .return ($P377)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<bs>"  :subid("32_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_381
.annotate "line", 174
    new $P380, 'ExceptionHandler'
    set_addr $P380, control_379
    $P380."handle_types"(58)
    push_eh $P380
    .lex "self", self
    .lex "$/", param_381
    find_lex $P382, "$/"
    $P383 = $P382."!make"("\b")
    .return ($P383)
  control_379:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, "payload"
    .return ($P384)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<nl>"  :subid("33_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_388
.annotate "line", 175
    new $P387, 'ExceptionHandler'
    set_addr $P387, control_386
    $P387."handle_types"(58)
    push_eh $P387
    .lex "self", self
    .lex "$/", param_388
    find_lex $P389, "$/"
    $P390 = $P389."!make"("\n")
    .return ($P390)
  control_386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P391, exception, "payload"
    .return ($P391)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<cr>"  :subid("34_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_395
.annotate "line", 176
    new $P394, 'ExceptionHandler'
    set_addr $P394, control_393
    $P394."handle_types"(58)
    push_eh $P394
    .lex "self", self
    .lex "$/", param_395
    find_lex $P396, "$/"
    $P397 = $P396."!make"("\r")
    .return ($P397)
  control_393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P398, exception, "payload"
    .return ($P398)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<tab>"  :subid("35_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_402
.annotate "line", 177
    new $P401, 'ExceptionHandler'
    set_addr $P401, control_400
    $P401."handle_types"(58)
    push_eh $P401
    .lex "self", self
    .lex "$/", param_402
    find_lex $P403, "$/"
    $P404 = $P403."!make"("\t")
    .return ($P404)
  control_400:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P405, exception, "payload"
    .return ($P405)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<hex>"  :subid("36_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_409
.annotate "line", 179
    new $P408, 'ExceptionHandler'
    set_addr $P408, control_407
    $P408."handle_types"(58)
    push_eh $P408
    .lex "self", self
    .lex "$/", param_409
.annotate "line", 180
    find_lex $P410, "$/"
    find_lex $P413, "$/"
    unless_null $P413, vivify_94
    new $P413, "Hash"
  vivify_94:
    set $P414, $P413["hexint"]
    unless_null $P414, vivify_95
    new $P414, "Undef"
  vivify_95:
    if $P414, if_412
    find_lex $P417, "$/"
    unless_null $P417, vivify_96
    new $P417, "Hash"
  vivify_96:
    set $P418, $P417["hexints"]
    unless_null $P418, vivify_97
    new $P418, "Hash"
  vivify_97:
    set $P419, $P418["hexint"]
    unless_null $P419, vivify_98
    new $P419, "Undef"
  vivify_98:
    set $P411, $P419
    goto if_412_end
  if_412:
    find_lex $P415, "$/"
    unless_null $P415, vivify_99
    new $P415, "Hash"
  vivify_99:
    set $P416, $P415["hexint"]
    unless_null $P416, vivify_100
    new $P416, "Undef"
  vivify_100:
    set $P411, $P416
  if_412_end:
    $P420 = "ints_to_string"($P411)
    $P421 = $P410."!make"($P420)
.annotate "line", 179
    .return ($P421)
  control_407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P422, exception, "payload"
    .return ($P422)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<oct>"  :subid("37_1258055878.60441") :method :outer("11_1258055878.60441")
    .param pmc param_426
.annotate "line", 183
    new $P425, 'ExceptionHandler'
    set_addr $P425, control_424
    $P425."handle_types"(58)
    push_eh $P425
    .lex "self", self
    .lex "$/", param_426
.annotate "line", 184
    find_lex $P427, "$/"
    find_lex $P430, "$/"
    unless_null $P430, vivify_101
    new $P430, "Hash"
  vivify_101:
    set $P431, $P430["octint"]
    unless_null $P431, vivify_102
    new $P431, "Undef"
  vivify_102:
    if $P431, if_429
    find_lex $P434, "$/"
    unless_null $P434, vivify_103
    new $P434, "Hash"
  vivify_103:
    set $P435, $P434["octints"]
    unless_null $P435, vivify_104
    new $P435, "Hash"
  vivify_104:
    set $P436, $P435["octint"]
    unless_null $P436, vivify_105
    new $P436, "Undef"
  vivify_105:
    set $P428, $P436
    goto if_429_end
  if_429:
    find_lex $P432, "$/"
    unless_null $P432, vivify_106
    new $P432, "Hash"
  vivify_106:
    set $P433, $P432["octint"]
    unless_null $P433, vivify_107
    new $P433, "Undef"
  vivify_107:
    set $P428, $P433
  if_429_end:
    $P437 = "ints_to_string"($P428)
    $P438 = $P427."!make"($P437)
.annotate "line", 183
    .return ($P438)
  control_424:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P439, exception, "payload"
    .return ($P439)
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
