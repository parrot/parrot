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
.sub "_block11"  :anon :subid("10_1258264412.38819")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 5
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
    $P244 = $P14()
.annotate "line", 1
    .return ($P244)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1258264412.38819")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258264412.38819" 
    .local pmc block
    set block, $P12
    $P245 = get_root_global ["parrot"], "P6metaclass"
    $P245."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block13"  :subid("11_1258264412.38819") :outer("10_1258264412.38819")
.annotate "line", 5
    .const 'Sub' $P235 = "87_1258264412.38819" 
    capture_lex $P235
    .const 'Sub' $P229 = "85_1258264412.38819" 
    capture_lex $P229
    .const 'Sub' $P217 = "82_1258264412.38819" 
    capture_lex $P217
    .const 'Sub' $P213 = "80_1258264412.38819" 
    capture_lex $P213
    .const 'Sub' $P208 = "78_1258264412.38819" 
    capture_lex $P208
    .const 'Sub' $P203 = "76_1258264412.38819" 
    capture_lex $P203
    .const 'Sub' $P199 = "74_1258264412.38819" 
    capture_lex $P199
    .const 'Sub' $P195 = "72_1258264412.38819" 
    capture_lex $P195
    .const 'Sub' $P191 = "70_1258264412.38819" 
    capture_lex $P191
    .const 'Sub' $P187 = "68_1258264412.38819" 
    capture_lex $P187
    .const 'Sub' $P183 = "66_1258264412.38819" 
    capture_lex $P183
    .const 'Sub' $P179 = "64_1258264412.38819" 
    capture_lex $P179
    .const 'Sub' $P169 = "60_1258264412.38819" 
    capture_lex $P169
    .const 'Sub' $P157 = "58_1258264412.38819" 
    capture_lex $P157
    .const 'Sub' $P146 = "56_1258264412.38819" 
    capture_lex $P146
    .const 'Sub' $P140 = "54_1258264412.38819" 
    capture_lex $P140
    .const 'Sub' $P132 = "52_1258264412.38819" 
    capture_lex $P132
    .const 'Sub' $P126 = "50_1258264412.38819" 
    capture_lex $P126
    .const 'Sub' $P118 = "48_1258264412.38819" 
    capture_lex $P118
    .const 'Sub' $P112 = "46_1258264412.38819" 
    capture_lex $P112
    .const 'Sub' $P104 = "44_1258264412.38819" 
    capture_lex $P104
    .const 'Sub' $P98 = "42_1258264412.38819" 
    capture_lex $P98
    .const 'Sub' $P92 = "40_1258264412.38819" 
    capture_lex $P92
    .const 'Sub' $P83 = "38_1258264412.38819" 
    capture_lex $P83
    .const 'Sub' $P76 = "36_1258264412.38819" 
    capture_lex $P76
    .const 'Sub' $P69 = "34_1258264412.38819" 
    capture_lex $P69
    .const 'Sub' $P64 = "32_1258264412.38819" 
    capture_lex $P64
    .const 'Sub' $P59 = "30_1258264412.38819" 
    capture_lex $P59
    .const 'Sub' $P54 = "28_1258264412.38819" 
    capture_lex $P54
    .const 'Sub' $P22 = "14_1258264412.38819" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258264412.38819" 
    capture_lex $P15
    .const 'Sub' $P235 = "87_1258264412.38819" 
    capture_lex $P235
    .return ($P235)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__ws"  :subid("13_1258264412.38819") :method
.annotate "line", 5
    new $P18, "ResizablePMCArray"
    push $P18, ""
    .return ($P18)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__termish"  :subid("15_1258264412.38819") :method
.annotate "line", 5
    new $P25, "ResizablePMCArray"
    push $P25, ""
    .return ($P25)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1258264412.38819") :method
.annotate "line", 13
    $P31 = self."!protoregex"("term")
    .return ($P31)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1258264412.38819") :method
.annotate "line", 13
    $P33 = self."!PREFIX__!protoregex"("term")
    .return ($P33)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1258264412.38819") :method
.annotate "line", 14
    $P35 = self."!protoregex"("infix")
    .return ($P35)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1258264412.38819") :method
.annotate "line", 14
    $P37 = self."!PREFIX__!protoregex"("infix")
    .return ($P37)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1258264412.38819") :method
.annotate "line", 15
    $P39 = self."!protoregex"("prefix")
    .return ($P39)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1258264412.38819") :method
.annotate "line", 15
    $P41 = self."!PREFIX__!protoregex"("prefix")
    .return ($P41)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1258264412.38819") :method
.annotate "line", 16
    $P43 = self."!protoregex"("postfix")
    .return ($P43)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1258264412.38819") :method
.annotate "line", 16
    $P45 = self."!PREFIX__!protoregex"("postfix")
    .return ($P45)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1258264412.38819") :method
.annotate "line", 17
    $P47 = self."!protoregex"("circumfix")
    .return ($P47)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1258264412.38819") :method
.annotate "line", 17
    $P49 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P49)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1258264412.38819") :method
.annotate "line", 18
    $P51 = self."!protoregex"("postcircumfix")
    .return ($P51)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1258264412.38819") :method
.annotate "line", 18
    $P53 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P53)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1258264412.38819") :method
.annotate "line", 5
    $P57 = self."!PREFIX__!subrule"("circumfix", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__infixish"  :subid("31_1258264412.38819") :method
.annotate "line", 5
    $P62 = self."!PREFIX__!subrule"("OPER=infix", "")
    new $P63, "ResizablePMCArray"
    push $P63, $P62
    .return ($P63)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__prefixish"  :subid("33_1258264412.38819") :method
.annotate "line", 5
    $P67 = self."!PREFIX__!subrule"("OPER=prefix", "")
    new $P68, "ResizablePMCArray"
    push $P68, $P67
    .return ($P68)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__postfixish"  :subid("35_1258264412.38819") :method
.annotate "line", 5
    $P72 = self."!PREFIX__!subrule"("OPER=postcircumfix", "")
    $P73 = self."!PREFIX__!subrule"("OPER=postfix", "")
    new $P74, "ResizablePMCArray"
    push $P74, $P72
    push $P74, $P73
    .return ($P74)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("36_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__quote_delimited"  :subid("37_1258264412.38819") :method
.annotate "line", 5
    $P79 = self."!PREFIX__!subrule"("starter", "")
    new $P80, "ResizablePMCArray"
    push $P80, $P79
    .return ($P80)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("38_1258264412.38819") :method :outer("11_1258264412.38819")
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
.sub "!PREFIX__quote_atom"  :subid("39_1258264412.38819") :method
.annotate "line", 5
    new $P86, "ResizablePMCArray"
    push $P86, ""
    .return ($P86)
.end


.namespace ["HLL";"Grammar"]
.sub "decint"  :subid("40_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx93_tgt
    .local int rx93_pos
    .local int rx93_off
    .local int rx93_eos
    .local int rx93_rep
    .local pmc rx93_cur
    (rx93_cur, rx93_pos, rx93_tgt, $I10) = self."!cursor_start"()
    rx93_cur."!cursor_debug"("START ", "decint")
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
    set_addr $I97, rxquantr96_done
    rx93_cur."!mark_push"(0, -1, $I97)
  rxquantr96_loop:
  # rx charclass_q d r 1..-1
    sub $I10, rx93_pos, rx93_off
    find_not_cclass $I11, 8, rx93_tgt, $I10, rx93_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx93_fail
    add rx93_pos, rx93_off, $I11
    (rx93_rep) = rx93_cur."!mark_commit"($I97)
    rx93_cur."!mark_push"(rx93_rep, rx93_pos, $I97)
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
    rx93_cur."!cursor_pass"(rx93_pos, "decint")
    rx93_cur."!cursor_debug"("PASS  ", "decint", " at pos=", rx93_pos)
    .return (rx93_cur)
  rx93_fail:
.annotate "line", 5
    (rx93_rep, rx93_pos, $I10, $P10) = rx93_cur."!mark_fail"(0)
    lt rx93_pos, -1, rx93_done
    eq rx93_pos, -1, rx93_fail
    jump $I10
  rx93_done:
    rx93_cur."!cursor_fail"()
    rx93_cur."!cursor_debug"("FAIL  ", "decint")
    .return (rx93_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decint"  :subid("41_1258264412.38819") :method
.annotate "line", 5
    new $P95, "ResizablePMCArray"
    push $P95, ""
    .return ($P95)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("42_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx99_tgt
    .local int rx99_pos
    .local int rx99_off
    .local int rx99_eos
    .local int rx99_rep
    .local pmc rx99_cur
    (rx99_cur, rx99_pos, rx99_tgt, $I10) = self."!cursor_start"()
    rx99_cur."!cursor_debug"("START ", "hexints")
    rx99_cur."!cursor_caparray"("decint")
    .lex unicode:"$\x{a2}", rx99_cur
    .local pmc match
    .lex "$/", match
    length rx99_eos, rx99_tgt
    set rx99_off, 0
    lt $I10, 2, rx99_start
    sub rx99_off, $I10, 1
    substr rx99_tgt, rx99_tgt, rx99_off
  rx99_start:
.annotate "line", 43
  # rx rxquantr102 ** 1..*
    set_addr $I103, rxquantr102_done
    rx99_cur."!mark_push"(0, -1, $I103)
  rxquantr102_loop:
  # rx subrule "ws" subtype=method negate=
    rx99_cur."!cursor_pos"(rx99_pos)
    $P10 = rx99_cur."ws"()
    unless $P10, rx99_fail
    rx99_pos = $P10."pos"()
  # rx subrule "decint" subtype=capture negate=
    rx99_cur."!cursor_pos"(rx99_pos)
    $P10 = rx99_cur."decint"()
    unless $P10, rx99_fail
    rx99_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    rx99_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx99_cur."!cursor_pos"(rx99_pos)
    $P10 = rx99_cur."ws"()
    unless $P10, rx99_fail
    rx99_pos = $P10."pos"()
    (rx99_rep) = rx99_cur."!mark_commit"($I103)
    rx99_cur."!mark_push"(rx99_rep, rx99_pos, $I103)
  # rx literal  ","
    add $I11, rx99_pos, 1
    gt $I11, rx99_eos, rx99_fail
    sub $I11, rx99_pos, rx99_off
    substr $S10, rx99_tgt, $I11, 1
    ne $S10, ",", rx99_fail
    add rx99_pos, 1
    goto rxquantr102_loop
  rxquantr102_done:
  # rx pass
    rx99_cur."!cursor_pass"(rx99_pos, "hexints")
    rx99_cur."!cursor_debug"("PASS  ", "hexints", " at pos=", rx99_pos)
    .return (rx99_cur)
  rx99_fail:
.annotate "line", 5
    (rx99_rep, rx99_pos, $I10, $P10) = rx99_cur."!mark_fail"(0)
    lt rx99_pos, -1, rx99_done
    eq rx99_pos, -1, rx99_fail
    jump $I10
  rx99_done:
    rx99_cur."!cursor_fail"()
    rx99_cur."!cursor_debug"("FAIL  ", "hexints")
    .return (rx99_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("43_1258264412.38819") :method
.annotate "line", 5
    new $P101, "ResizablePMCArray"
    push $P101, ""
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("44_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx105_tgt
    .local int rx105_pos
    .local int rx105_off
    .local int rx105_eos
    .local int rx105_rep
    .local pmc rx105_cur
    (rx105_cur, rx105_pos, rx105_tgt, $I10) = self."!cursor_start"()
    rx105_cur."!cursor_debug"("START ", "hexint")
    .lex unicode:"$\x{a2}", rx105_cur
    .local pmc match
    .lex "$/", match
    length rx105_eos, rx105_tgt
    set rx105_off, 0
    lt $I10, 2, rx105_start
    sub rx105_off, $I10, 1
    substr rx105_tgt, rx105_tgt, rx105_off
  rx105_start:
.annotate "line", 45
  # rx rxquantr108 ** 1..*
    set_addr $I111, rxquantr108_done
    rx105_cur."!mark_push"(0, -1, $I111)
  rxquantr108_loop:
  # rx rxquantr109 ** 1..*
    set_addr $I110, rxquantr109_done
    rx105_cur."!mark_push"(0, -1, $I110)
  rxquantr109_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, "0123456789abcdefABCDEF", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I110)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I110)
    goto rxquantr109_loop
  rxquantr109_done:
    (rx105_rep) = rx105_cur."!mark_commit"($I111)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I111)
  # rx literal  "_"
    add $I11, rx105_pos, 1
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 1
    ne $S10, "_", rx105_fail
    add rx105_pos, 1
    goto rxquantr108_loop
  rxquantr108_done:
  # rx pass
    rx105_cur."!cursor_pass"(rx105_pos, "hexint")
    rx105_cur."!cursor_debug"("PASS  ", "hexint", " at pos=", rx105_pos)
    .return (rx105_cur)
  rx105_fail:
.annotate "line", 5
    (rx105_rep, rx105_pos, $I10, $P10) = rx105_cur."!mark_fail"(0)
    lt rx105_pos, -1, rx105_done
    eq rx105_pos, -1, rx105_fail
    jump $I10
  rx105_done:
    rx105_cur."!cursor_fail"()
    rx105_cur."!cursor_debug"("FAIL  ", "hexint")
    .return (rx105_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexint"  :subid("45_1258264412.38819") :method
.annotate "line", 5
    new $P107, "ResizablePMCArray"
    push $P107, ""
    .return ($P107)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("46_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx113_tgt
    .local int rx113_pos
    .local int rx113_off
    .local int rx113_eos
    .local int rx113_rep
    .local pmc rx113_cur
    (rx113_cur, rx113_pos, rx113_tgt, $I10) = self."!cursor_start"()
    rx113_cur."!cursor_debug"("START ", "hexints")
    rx113_cur."!cursor_caparray"("hexint")
    .lex unicode:"$\x{a2}", rx113_cur
    .local pmc match
    .lex "$/", match
    length rx113_eos, rx113_tgt
    set rx113_off, 0
    lt $I10, 2, rx113_start
    sub rx113_off, $I10, 1
    substr rx113_tgt, rx113_tgt, rx113_off
  rx113_start:
.annotate "line", 46
  # rx rxquantr116 ** 1..*
    set_addr $I117, rxquantr116_done
    rx113_cur."!mark_push"(0, -1, $I117)
  rxquantr116_loop:
  # rx subrule "ws" subtype=method negate=
    rx113_cur."!cursor_pos"(rx113_pos)
    $P10 = rx113_cur."ws"()
    unless $P10, rx113_fail
    rx113_pos = $P10."pos"()
  # rx subrule "hexint" subtype=capture negate=
    rx113_cur."!cursor_pos"(rx113_pos)
    $P10 = rx113_cur."hexint"()
    unless $P10, rx113_fail
    rx113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx113_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx113_cur."!cursor_pos"(rx113_pos)
    $P10 = rx113_cur."ws"()
    unless $P10, rx113_fail
    rx113_pos = $P10."pos"()
    (rx113_rep) = rx113_cur."!mark_commit"($I117)
    rx113_cur."!mark_push"(rx113_rep, rx113_pos, $I117)
  # rx literal  ","
    add $I11, rx113_pos, 1
    gt $I11, rx113_eos, rx113_fail
    sub $I11, rx113_pos, rx113_off
    substr $S10, rx113_tgt, $I11, 1
    ne $S10, ",", rx113_fail
    add rx113_pos, 1
    goto rxquantr116_loop
  rxquantr116_done:
  # rx pass
    rx113_cur."!cursor_pass"(rx113_pos, "hexints")
    rx113_cur."!cursor_debug"("PASS  ", "hexints", " at pos=", rx113_pos)
    .return (rx113_cur)
  rx113_fail:
.annotate "line", 5
    (rx113_rep, rx113_pos, $I10, $P10) = rx113_cur."!mark_fail"(0)
    lt rx113_pos, -1, rx113_done
    eq rx113_pos, -1, rx113_fail
    jump $I10
  rx113_done:
    rx113_cur."!cursor_fail"()
    rx113_cur."!cursor_debug"("FAIL  ", "hexints")
    .return (rx113_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("47_1258264412.38819") :method
.annotate "line", 5
    new $P115, "ResizablePMCArray"
    push $P115, ""
    .return ($P115)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("48_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx119_tgt
    .local int rx119_pos
    .local int rx119_off
    .local int rx119_eos
    .local int rx119_rep
    .local pmc rx119_cur
    (rx119_cur, rx119_pos, rx119_tgt, $I10) = self."!cursor_start"()
    rx119_cur."!cursor_debug"("START ", "octint")
    .lex unicode:"$\x{a2}", rx119_cur
    .local pmc match
    .lex "$/", match
    length rx119_eos, rx119_tgt
    set rx119_off, 0
    lt $I10, 2, rx119_start
    sub rx119_off, $I10, 1
    substr rx119_tgt, rx119_tgt, rx119_off
  rx119_start:
.annotate "line", 48
  # rx rxquantr122 ** 1..*
    set_addr $I125, rxquantr122_done
    rx119_cur."!mark_push"(0, -1, $I125)
  rxquantr122_loop:
  # rx rxquantr123 ** 1..*
    set_addr $I124, rxquantr123_done
    rx119_cur."!mark_push"(0, -1, $I124)
  rxquantr123_loop:
  # rx enumcharlist negate=0 
    ge rx119_pos, rx119_eos, rx119_fail
    sub $I10, rx119_pos, rx119_off
    substr $S10, rx119_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rx119_fail
    inc rx119_pos
    (rx119_rep) = rx119_cur."!mark_commit"($I124)
    rx119_cur."!mark_push"(rx119_rep, rx119_pos, $I124)
    goto rxquantr123_loop
  rxquantr123_done:
    (rx119_rep) = rx119_cur."!mark_commit"($I125)
    rx119_cur."!mark_push"(rx119_rep, rx119_pos, $I125)
  # rx literal  "_"
    add $I11, rx119_pos, 1
    gt $I11, rx119_eos, rx119_fail
    sub $I11, rx119_pos, rx119_off
    substr $S10, rx119_tgt, $I11, 1
    ne $S10, "_", rx119_fail
    add rx119_pos, 1
    goto rxquantr122_loop
  rxquantr122_done:
  # rx pass
    rx119_cur."!cursor_pass"(rx119_pos, "octint")
    rx119_cur."!cursor_debug"("PASS  ", "octint", " at pos=", rx119_pos)
    .return (rx119_cur)
  rx119_fail:
.annotate "line", 5
    (rx119_rep, rx119_pos, $I10, $P10) = rx119_cur."!mark_fail"(0)
    lt rx119_pos, -1, rx119_done
    eq rx119_pos, -1, rx119_fail
    jump $I10
  rx119_done:
    rx119_cur."!cursor_fail"()
    rx119_cur."!cursor_debug"("FAIL  ", "octint")
    .return (rx119_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octint"  :subid("49_1258264412.38819") :method
.annotate "line", 5
    new $P121, "ResizablePMCArray"
    push $P121, ""
    .return ($P121)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("50_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx127_tgt
    .local int rx127_pos
    .local int rx127_off
    .local int rx127_eos
    .local int rx127_rep
    .local pmc rx127_cur
    (rx127_cur, rx127_pos, rx127_tgt, $I10) = self."!cursor_start"()
    rx127_cur."!cursor_debug"("START ", "octints")
    rx127_cur."!cursor_caparray"("octint")
    .lex unicode:"$\x{a2}", rx127_cur
    .local pmc match
    .lex "$/", match
    length rx127_eos, rx127_tgt
    set rx127_off, 0
    lt $I10, 2, rx127_start
    sub rx127_off, $I10, 1
    substr rx127_tgt, rx127_tgt, rx127_off
  rx127_start:
.annotate "line", 49
  # rx rxquantr130 ** 1..*
    set_addr $I131, rxquantr130_done
    rx127_cur."!mark_push"(0, -1, $I131)
  rxquantr130_loop:
  # rx subrule "ws" subtype=method negate=
    rx127_cur."!cursor_pos"(rx127_pos)
    $P10 = rx127_cur."ws"()
    unless $P10, rx127_fail
    rx127_pos = $P10."pos"()
  # rx subrule "octint" subtype=capture negate=
    rx127_cur."!cursor_pos"(rx127_pos)
    $P10 = rx127_cur."octint"()
    unless $P10, rx127_fail
    rx127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx127_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx127_cur."!cursor_pos"(rx127_pos)
    $P10 = rx127_cur."ws"()
    unless $P10, rx127_fail
    rx127_pos = $P10."pos"()
    (rx127_rep) = rx127_cur."!mark_commit"($I131)
    rx127_cur."!mark_push"(rx127_rep, rx127_pos, $I131)
  # rx literal  ","
    add $I11, rx127_pos, 1
    gt $I11, rx127_eos, rx127_fail
    sub $I11, rx127_pos, rx127_off
    substr $S10, rx127_tgt, $I11, 1
    ne $S10, ",", rx127_fail
    add rx127_pos, 1
    goto rxquantr130_loop
  rxquantr130_done:
  # rx pass
    rx127_cur."!cursor_pass"(rx127_pos, "octints")
    rx127_cur."!cursor_debug"("PASS  ", "octints", " at pos=", rx127_pos)
    .return (rx127_cur)
  rx127_fail:
.annotate "line", 5
    (rx127_rep, rx127_pos, $I10, $P10) = rx127_cur."!mark_fail"(0)
    lt rx127_pos, -1, rx127_done
    eq rx127_pos, -1, rx127_fail
    jump $I10
  rx127_done:
    rx127_cur."!cursor_fail"()
    rx127_cur."!cursor_debug"("FAIL  ", "octints")
    .return (rx127_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octints"  :subid("51_1258264412.38819") :method
.annotate "line", 5
    new $P129, "ResizablePMCArray"
    push $P129, ""
    .return ($P129)
.end


.namespace ["HLL";"Grammar"]
.sub "binint"  :subid("52_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx133_tgt
    .local int rx133_pos
    .local int rx133_off
    .local int rx133_eos
    .local int rx133_rep
    .local pmc rx133_cur
    (rx133_cur, rx133_pos, rx133_tgt, $I10) = self."!cursor_start"()
    rx133_cur."!cursor_debug"("START ", "binint")
    .lex unicode:"$\x{a2}", rx133_cur
    .local pmc match
    .lex "$/", match
    length rx133_eos, rx133_tgt
    set rx133_off, 0
    lt $I10, 2, rx133_start
    sub rx133_off, $I10, 1
    substr rx133_tgt, rx133_tgt, rx133_off
  rx133_start:
.annotate "line", 51
  # rx rxquantr136 ** 1..*
    set_addr $I139, rxquantr136_done
    rx133_cur."!mark_push"(0, -1, $I139)
  rxquantr136_loop:
  # rx rxquantr137 ** 1..*
    set_addr $I138, rxquantr137_done
    rx133_cur."!mark_push"(0, -1, $I138)
  rxquantr137_loop:
  # rx enumcharlist negate=0 
    ge rx133_pos, rx133_eos, rx133_fail
    sub $I10, rx133_pos, rx133_off
    substr $S10, rx133_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rx133_fail
    inc rx133_pos
    (rx133_rep) = rx133_cur."!mark_commit"($I138)
    rx133_cur."!mark_push"(rx133_rep, rx133_pos, $I138)
    goto rxquantr137_loop
  rxquantr137_done:
    (rx133_rep) = rx133_cur."!mark_commit"($I139)
    rx133_cur."!mark_push"(rx133_rep, rx133_pos, $I139)
  # rx literal  "_"
    add $I11, rx133_pos, 1
    gt $I11, rx133_eos, rx133_fail
    sub $I11, rx133_pos, rx133_off
    substr $S10, rx133_tgt, $I11, 1
    ne $S10, "_", rx133_fail
    add rx133_pos, 1
    goto rxquantr136_loop
  rxquantr136_done:
  # rx pass
    rx133_cur."!cursor_pass"(rx133_pos, "binint")
    rx133_cur."!cursor_debug"("PASS  ", "binint", " at pos=", rx133_pos)
    .return (rx133_cur)
  rx133_fail:
.annotate "line", 5
    (rx133_rep, rx133_pos, $I10, $P10) = rx133_cur."!mark_fail"(0)
    lt rx133_pos, -1, rx133_done
    eq rx133_pos, -1, rx133_fail
    jump $I10
  rx133_done:
    rx133_cur."!cursor_fail"()
    rx133_cur."!cursor_debug"("FAIL  ", "binint")
    .return (rx133_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binint"  :subid("53_1258264412.38819") :method
.annotate "line", 5
    new $P135, "ResizablePMCArray"
    push $P135, ""
    .return ($P135)
.end


.namespace ["HLL";"Grammar"]
.sub "binints"  :subid("54_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx141_tgt
    .local int rx141_pos
    .local int rx141_off
    .local int rx141_eos
    .local int rx141_rep
    .local pmc rx141_cur
    (rx141_cur, rx141_pos, rx141_tgt, $I10) = self."!cursor_start"()
    rx141_cur."!cursor_debug"("START ", "binints")
    rx141_cur."!cursor_caparray"("binint")
    .lex unicode:"$\x{a2}", rx141_cur
    .local pmc match
    .lex "$/", match
    length rx141_eos, rx141_tgt
    set rx141_off, 0
    lt $I10, 2, rx141_start
    sub rx141_off, $I10, 1
    substr rx141_tgt, rx141_tgt, rx141_off
  rx141_start:
.annotate "line", 52
  # rx rxquantr144 ** 1..*
    set_addr $I145, rxquantr144_done
    rx141_cur."!mark_push"(0, -1, $I145)
  rxquantr144_loop:
  # rx subrule "ws" subtype=method negate=
    rx141_cur."!cursor_pos"(rx141_pos)
    $P10 = rx141_cur."ws"()
    unless $P10, rx141_fail
    rx141_pos = $P10."pos"()
  # rx subrule "binint" subtype=capture negate=
    rx141_cur."!cursor_pos"(rx141_pos)
    $P10 = rx141_cur."binint"()
    unless $P10, rx141_fail
    rx141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("binint")
    rx141_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx141_cur."!cursor_pos"(rx141_pos)
    $P10 = rx141_cur."ws"()
    unless $P10, rx141_fail
    rx141_pos = $P10."pos"()
    (rx141_rep) = rx141_cur."!mark_commit"($I145)
    rx141_cur."!mark_push"(rx141_rep, rx141_pos, $I145)
  # rx literal  ","
    add $I11, rx141_pos, 1
    gt $I11, rx141_eos, rx141_fail
    sub $I11, rx141_pos, rx141_off
    substr $S10, rx141_tgt, $I11, 1
    ne $S10, ",", rx141_fail
    add rx141_pos, 1
    goto rxquantr144_loop
  rxquantr144_done:
  # rx pass
    rx141_cur."!cursor_pass"(rx141_pos, "binints")
    rx141_cur."!cursor_debug"("PASS  ", "binints", " at pos=", rx141_pos)
    .return (rx141_cur)
  rx141_fail:
.annotate "line", 5
    (rx141_rep, rx141_pos, $I10, $P10) = rx141_cur."!mark_fail"(0)
    lt rx141_pos, -1, rx141_done
    eq rx141_pos, -1, rx141_fail
    jump $I10
  rx141_done:
    rx141_cur."!cursor_fail"()
    rx141_cur."!cursor_debug"("FAIL  ", "binints")
    .return (rx141_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binints"  :subid("55_1258264412.38819") :method
.annotate "line", 5
    new $P143, "ResizablePMCArray"
    push $P143, ""
    .return ($P143)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("56_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt, $I10) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "integer")
    .lex unicode:"$\x{a2}", rx147_cur
    .local pmc match
    .lex "$/", match
    length rx147_eos, rx147_tgt
    set rx147_off, 0
    lt $I10, 2, rx147_start
    sub rx147_off, $I10, 1
    substr rx147_tgt, rx147_tgt, rx147_off
  rx147_start:
  alt155_0:
.annotate "line", 55
    set_addr $I10, alt155_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 56
  # rx literal  "0"
    add $I11, rx147_pos, 1
    gt $I11, rx147_eos, rx147_fail
    sub $I11, rx147_pos, rx147_off
    substr $S10, rx147_tgt, $I11, 1
    ne $S10, "0", rx147_fail
    add rx147_pos, 1
  alt156_0:
    set_addr $I10, alt156_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  # rx literal  "b"
    add $I11, rx147_pos, 1
    gt $I11, rx147_eos, rx147_fail
    sub $I11, rx147_pos, rx147_off
    substr $S10, rx147_tgt, $I11, 1
    ne $S10, "b", rx147_fail
    add rx147_pos, 1
  # rx subrule "binint" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."binint"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=binint")
    rx147_pos = $P10."pos"()
    goto alt156_end
  alt156_1:
    set_addr $I10, alt156_2
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 57
  # rx literal  "o"
    add $I11, rx147_pos, 1
    gt $I11, rx147_eos, rx147_fail
    sub $I11, rx147_pos, rx147_off
    substr $S10, rx147_tgt, $I11, 1
    ne $S10, "o", rx147_fail
    add rx147_pos, 1
  # rx subrule "octint" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."octint"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=octint")
    rx147_pos = $P10."pos"()
    goto alt156_end
  alt156_2:
    set_addr $I10, alt156_3
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 58
  # rx literal  "x"
    add $I11, rx147_pos, 1
    gt $I11, rx147_eos, rx147_fail
    sub $I11, rx147_pos, rx147_off
    substr $S10, rx147_tgt, $I11, 1
    ne $S10, "x", rx147_fail
    add rx147_pos, 1
  # rx subrule "hexint" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."hexint"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=hexint")
    rx147_pos = $P10."pos"()
    goto alt156_end
  alt156_3:
.annotate "line", 59
  # rx literal  "d"
    add $I11, rx147_pos, 1
    gt $I11, rx147_eos, rx147_fail
    sub $I11, rx147_pos, rx147_off
    substr $S10, rx147_tgt, $I11, 1
    ne $S10, "d", rx147_fail
    add rx147_pos, 1
  # rx subrule "decint" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."decint"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx147_pos = $P10."pos"()
  alt156_end:
.annotate "line", 56
    goto alt155_end
  alt155_1:
.annotate "line", 61
  # rx subrule "decint" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."decint"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx147_pos = $P10."pos"()
  alt155_end:
.annotate "line", 54
  # rx pass
    rx147_cur."!cursor_pass"(rx147_pos, "integer")
    rx147_cur."!cursor_debug"("PASS  ", "integer", " at pos=", rx147_pos)
    .return (rx147_cur)
  rx147_fail:
.annotate "line", 5
    (rx147_rep, rx147_pos, $I10, $P10) = rx147_cur."!mark_fail"(0)
    lt rx147_pos, -1, rx147_done
    eq rx147_pos, -1, rx147_fail
    jump $I10
  rx147_done:
    rx147_cur."!cursor_fail"()
    rx147_cur."!cursor_debug"("FAIL  ", "integer")
    .return (rx147_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__integer"  :subid("57_1258264412.38819") :method
.annotate "line", 5
    $P149 = self."!PREFIX__!subrule"("VALUE=decint", "")
    $P150 = self."!PREFIX__!subrule"("VALUE=decint", "0d")
    $P151 = self."!PREFIX__!subrule"("VALUE=hexint", "0x")
    $P152 = self."!PREFIX__!subrule"("VALUE=octint", "0o")
    $P153 = self."!PREFIX__!subrule"("VALUE=binint", "0b")
    new $P154, "ResizablePMCArray"
    push $P154, $P149
    push $P154, $P150
    push $P154, $P151
    push $P154, $P152
    push $P154, $P153
    .return ($P154)
.end


.namespace ["HLL";"Grammar"]
.sub "dec_number"  :subid("58_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx158_tgt
    .local int rx158_pos
    .local int rx158_off
    .local int rx158_eos
    .local int rx158_rep
    .local pmc rx158_cur
    (rx158_cur, rx158_pos, rx158_tgt, $I10) = self."!cursor_start"()
    rx158_cur."!cursor_debug"("START ", "dec_number")
    rx158_cur."!cursor_caparray"("escale")
    .lex unicode:"$\x{a2}", rx158_cur
    .local pmc match
    .lex "$/", match
    length rx158_eos, rx158_tgt
    set rx158_off, 0
    lt $I10, 2, rx158_start
    sub rx158_off, $I10, 1
    substr rx158_tgt, rx158_tgt, rx158_off
  rx158_start:
  alt161_0:
.annotate "line", 65
    set_addr $I10, alt161_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 66
  # rx subcapture "coeff"
    set_addr $I10, rxcap_162_fail
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  # rx literal  "."
    add $I11, rx158_pos, 1
    gt $I11, rx158_eos, rx158_fail
    sub $I11, rx158_pos, rx158_off
    substr $S10, rx158_tgt, $I11, 1
    ne $S10, ".", rx158_fail
    add rx158_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 8, rx158_tgt, $I10, rx158_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx158_fail
    add rx158_pos, rx158_off, $I11
    set_addr $I10, rxcap_162_fail
    ($I12, $I11) = rx158_cur."!mark_peek"($I10)
    rx158_cur."!cursor_pos"($I11)
    ($P10) = rx158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx158_pos, "")
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_162_done
  rxcap_162_fail:
    goto rx158_fail
  rxcap_162_done:
  # rx rxquantr163 ** 0..1
    set_addr $I164, rxquantr163_done
    rx158_cur."!mark_push"(0, rx158_pos, $I164)
  rxquantr163_loop:
  # rx subrule "escale" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."escale"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx158_pos = $P10."pos"()
    (rx158_rep) = rx158_cur."!mark_commit"($I164)
  rxquantr163_done:
    goto alt161_end
  alt161_1:
    set_addr $I10, alt161_2
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 67
  # rx subcapture "coeff"
    set_addr $I10, rxcap_165_fail
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 8, rx158_tgt, $I10, rx158_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx158_fail
    add rx158_pos, rx158_off, $I11
  # rx literal  "."
    add $I11, rx158_pos, 1
    gt $I11, rx158_eos, rx158_fail
    sub $I11, rx158_pos, rx158_off
    substr $S10, rx158_tgt, $I11, 1
    ne $S10, ".", rx158_fail
    add rx158_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 8, rx158_tgt, $I10, rx158_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx158_fail
    add rx158_pos, rx158_off, $I11
    set_addr $I10, rxcap_165_fail
    ($I12, $I11) = rx158_cur."!mark_peek"($I10)
    rx158_cur."!cursor_pos"($I11)
    ($P10) = rx158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx158_pos, "")
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_165_done
  rxcap_165_fail:
    goto rx158_fail
  rxcap_165_done:
  # rx rxquantr166 ** 0..1
    set_addr $I167, rxquantr166_done
    rx158_cur."!mark_push"(0, rx158_pos, $I167)
  rxquantr166_loop:
  # rx subrule "escale" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."escale"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx158_pos = $P10."pos"()
    (rx158_rep) = rx158_cur."!mark_commit"($I167)
  rxquantr166_done:
    goto alt161_end
  alt161_2:
.annotate "line", 68
  # rx subcapture "coeff"
    set_addr $I10, rxcap_168_fail
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 8, rx158_tgt, $I10, rx158_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx158_fail
    add rx158_pos, rx158_off, $I11
    set_addr $I10, rxcap_168_fail
    ($I12, $I11) = rx158_cur."!mark_peek"($I10)
    rx158_cur."!cursor_pos"($I11)
    ($P10) = rx158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx158_pos, "")
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_168_done
  rxcap_168_fail:
    goto rx158_fail
  rxcap_168_done:
  # rx subrule "escale" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."escale"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx158_pos = $P10."pos"()
  alt161_end:
.annotate "line", 65
  # rx pass
    rx158_cur."!cursor_pass"(rx158_pos, "dec_number")
    rx158_cur."!cursor_debug"("PASS  ", "dec_number", " at pos=", rx158_pos)
    .return (rx158_cur)
  rx158_fail:
.annotate "line", 5
    (rx158_rep, rx158_pos, $I10, $P10) = rx158_cur."!mark_fail"(0)
    lt rx158_pos, -1, rx158_done
    eq rx158_pos, -1, rx158_fail
    jump $I10
  rx158_done:
    rx158_cur."!cursor_fail"()
    rx158_cur."!cursor_debug"("FAIL  ", "dec_number")
    .return (rx158_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__dec_number"  :subid("59_1258264412.38819") :method
.annotate "line", 5
    new $P160, "ResizablePMCArray"
    push $P160, ""
    push $P160, ""
    push $P160, "."
    .return ($P160)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("60_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx170_tgt
    .local int rx170_pos
    .local int rx170_off
    .local int rx170_eos
    .local int rx170_rep
    .local pmc rx170_cur
    (rx170_cur, rx170_pos, rx170_tgt, $I10) = self."!cursor_start"()
    rx170_cur."!cursor_debug"("START ", "escale")
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
  # rx enumcharlist negate=0 
    ge rx170_pos, rx170_eos, rx170_fail
    sub $I10, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I10, 1
    index $I11, "Ee", $S10
    lt $I11, 0, rx170_fail
    inc rx170_pos
  # rx rxquantr173 ** 0..1
    set_addr $I174, rxquantr173_done
    rx170_cur."!mark_push"(0, rx170_pos, $I174)
  rxquantr173_loop:
  # rx enumcharlist negate=0 
    ge rx170_pos, rx170_eos, rx170_fail
    sub $I10, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx170_fail
    inc rx170_pos
    (rx170_rep) = rx170_cur."!mark_commit"($I174)
  rxquantr173_done:
  # rx charclass_q d r 1..-1
    sub $I10, rx170_pos, rx170_off
    find_not_cclass $I11, 8, rx170_tgt, $I10, rx170_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx170_fail
    add rx170_pos, rx170_off, $I11
  # rx pass
    rx170_cur."!cursor_pass"(rx170_pos, "escale")
    rx170_cur."!cursor_debug"("PASS  ", "escale", " at pos=", rx170_pos)
    .return (rx170_cur)
  rx170_fail:
.annotate "line", 5
    (rx170_rep, rx170_pos, $I10, $P10) = rx170_cur."!mark_fail"(0)
    lt rx170_pos, -1, rx170_done
    eq rx170_pos, -1, rx170_fail
    jump $I10
  rx170_done:
    rx170_cur."!cursor_fail"()
    rx170_cur."!cursor_debug"("FAIL  ", "escale")
    .return (rx170_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__escale"  :subid("61_1258264412.38819") :method
.annotate "line", 5
    new $P172, "ResizablePMCArray"
    push $P172, "e"
    push $P172, "E"
    .return ($P172)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("62_1258264412.38819") :method
.annotate "line", 73
    $P176 = self."!protoregex"("quote_escape")
    .return ($P176)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("63_1258264412.38819") :method
.annotate "line", 73
    $P178 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P178)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("64_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx180_tgt
    .local int rx180_pos
    .local int rx180_off
    .local int rx180_eos
    .local int rx180_rep
    .local pmc rx180_cur
    (rx180_cur, rx180_pos, rx180_tgt, $I10) = self."!cursor_start"()
    rx180_cur."!cursor_debug"("START ", "quote_escape:sym<backslash>")
    .lex unicode:"$\x{a2}", rx180_cur
    .local pmc match
    .lex "$/", match
    length rx180_eos, rx180_tgt
    set rx180_off, 0
    lt $I10, 2, rx180_start
    sub rx180_off, $I10, 1
    substr rx180_tgt, rx180_tgt, rx180_off
  rx180_start:
.annotate "line", 74
  # rx literal  "\\\\"
    add $I11, rx180_pos, 2
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 2
    ne $S10, "\\\\", rx180_fail
    add rx180_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx180_cur."!cursor_pos"(rx180_pos)
    $P10 = rx180_cur."quotemod_check"("q")
    unless $P10, rx180_fail
  # rx pass
    rx180_cur."!cursor_pass"(rx180_pos, "quote_escape:sym<backslash>")
    rx180_cur."!cursor_debug"("PASS  ", "quote_escape:sym<backslash>", " at pos=", rx180_pos)
    .return (rx180_cur)
  rx180_fail:
.annotate "line", 5
    (rx180_rep, rx180_pos, $I10, $P10) = rx180_cur."!mark_fail"(0)
    lt rx180_pos, -1, rx180_done
    eq rx180_pos, -1, rx180_fail
    jump $I10
  rx180_done:
    rx180_cur."!cursor_fail"()
    rx180_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<backslash>")
    .return (rx180_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("65_1258264412.38819") :method
.annotate "line", 5
    new $P182, "ResizablePMCArray"
    push $P182, "\\\\"
    .return ($P182)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("66_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx184_tgt
    .local int rx184_pos
    .local int rx184_off
    .local int rx184_eos
    .local int rx184_rep
    .local pmc rx184_cur
    (rx184_cur, rx184_pos, rx184_tgt, $I10) = self."!cursor_start"()
    rx184_cur."!cursor_debug"("START ", "quote_escape:sym<stopper>")
    .lex unicode:"$\x{a2}", rx184_cur
    .local pmc match
    .lex "$/", match
    length rx184_eos, rx184_tgt
    set rx184_off, 0
    lt $I10, 2, rx184_start
    sub rx184_off, $I10, 1
    substr rx184_tgt, rx184_tgt, rx184_off
  rx184_start:
.annotate "line", 75
  # rx literal  "\\"
    add $I11, rx184_pos, 1
    gt $I11, rx184_eos, rx184_fail
    sub $I11, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I11, 1
    ne $S10, "\\", rx184_fail
    add rx184_pos, 1
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."quotemod_check"("q")
    unless $P10, rx184_fail
  # rx subrule "stopper" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."stopper"()
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx184_pos = $P10."pos"()
  # rx pass
    rx184_cur."!cursor_pass"(rx184_pos, "quote_escape:sym<stopper>")
    rx184_cur."!cursor_debug"("PASS  ", "quote_escape:sym<stopper>", " at pos=", rx184_pos)
    .return (rx184_cur)
  rx184_fail:
.annotate "line", 5
    (rx184_rep, rx184_pos, $I10, $P10) = rx184_cur."!mark_fail"(0)
    lt rx184_pos, -1, rx184_done
    eq rx184_pos, -1, rx184_fail
    jump $I10
  rx184_done:
    rx184_cur."!cursor_fail"()
    rx184_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<stopper>")
    .return (rx184_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("67_1258264412.38819") :method
.annotate "line", 5
    new $P186, "ResizablePMCArray"
    push $P186, "\\"
    .return ($P186)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("68_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx188_tgt
    .local int rx188_pos
    .local int rx188_off
    .local int rx188_eos
    .local int rx188_rep
    .local pmc rx188_cur
    (rx188_cur, rx188_pos, rx188_tgt, $I10) = self."!cursor_start"()
    rx188_cur."!cursor_debug"("START ", "quote_escape:sym<bs>")
    .lex unicode:"$\x{a2}", rx188_cur
    .local pmc match
    .lex "$/", match
    length rx188_eos, rx188_tgt
    set rx188_off, 0
    lt $I10, 2, rx188_start
    sub rx188_off, $I10, 1
    substr rx188_tgt, rx188_tgt, rx188_off
  rx188_start:
.annotate "line", 77
  # rx literal  "\\b"
    add $I11, rx188_pos, 2
    gt $I11, rx188_eos, rx188_fail
    sub $I11, rx188_pos, rx188_off
    substr $S10, rx188_tgt, $I11, 2
    ne $S10, "\\b", rx188_fail
    add rx188_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."quotemod_check"("b")
    unless $P10, rx188_fail
  # rx pass
    rx188_cur."!cursor_pass"(rx188_pos, "quote_escape:sym<bs>")
    rx188_cur."!cursor_debug"("PASS  ", "quote_escape:sym<bs>", " at pos=", rx188_pos)
    .return (rx188_cur)
  rx188_fail:
.annotate "line", 5
    (rx188_rep, rx188_pos, $I10, $P10) = rx188_cur."!mark_fail"(0)
    lt rx188_pos, -1, rx188_done
    eq rx188_pos, -1, rx188_fail
    jump $I10
  rx188_done:
    rx188_cur."!cursor_fail"()
    rx188_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<bs>")
    .return (rx188_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("69_1258264412.38819") :method
.annotate "line", 5
    new $P190, "ResizablePMCArray"
    push $P190, "\\b"
    .return ($P190)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("70_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx192_tgt
    .local int rx192_pos
    .local int rx192_off
    .local int rx192_eos
    .local int rx192_rep
    .local pmc rx192_cur
    (rx192_cur, rx192_pos, rx192_tgt, $I10) = self."!cursor_start"()
    rx192_cur."!cursor_debug"("START ", "quote_escape:sym<nl>")
    .lex unicode:"$\x{a2}", rx192_cur
    .local pmc match
    .lex "$/", match
    length rx192_eos, rx192_tgt
    set rx192_off, 0
    lt $I10, 2, rx192_start
    sub rx192_off, $I10, 1
    substr rx192_tgt, rx192_tgt, rx192_off
  rx192_start:
.annotate "line", 78
  # rx literal  "\\n"
    add $I11, rx192_pos, 2
    gt $I11, rx192_eos, rx192_fail
    sub $I11, rx192_pos, rx192_off
    substr $S10, rx192_tgt, $I11, 2
    ne $S10, "\\n", rx192_fail
    add rx192_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."quotemod_check"("b")
    unless $P10, rx192_fail
  # rx pass
    rx192_cur."!cursor_pass"(rx192_pos, "quote_escape:sym<nl>")
    rx192_cur."!cursor_debug"("PASS  ", "quote_escape:sym<nl>", " at pos=", rx192_pos)
    .return (rx192_cur)
  rx192_fail:
.annotate "line", 5
    (rx192_rep, rx192_pos, $I10, $P10) = rx192_cur."!mark_fail"(0)
    lt rx192_pos, -1, rx192_done
    eq rx192_pos, -1, rx192_fail
    jump $I10
  rx192_done:
    rx192_cur."!cursor_fail"()
    rx192_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<nl>")
    .return (rx192_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("71_1258264412.38819") :method
.annotate "line", 5
    new $P194, "ResizablePMCArray"
    push $P194, "\\n"
    .return ($P194)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("72_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt, $I10) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "quote_escape:sym<cr>")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    set rx196_off, 0
    lt $I10, 2, rx196_start
    sub rx196_off, $I10, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
.annotate "line", 79
  # rx literal  "\\r"
    add $I11, rx196_pos, 2
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 2
    ne $S10, "\\r", rx196_fail
    add rx196_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."quotemod_check"("b")
    unless $P10, rx196_fail
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "quote_escape:sym<cr>")
    rx196_cur."!cursor_debug"("PASS  ", "quote_escape:sym<cr>", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate "line", 5
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<cr>")
    .return (rx196_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("73_1258264412.38819") :method
.annotate "line", 5
    new $P198, "ResizablePMCArray"
    push $P198, "\\r"
    .return ($P198)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("74_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx200_tgt
    .local int rx200_pos
    .local int rx200_off
    .local int rx200_eos
    .local int rx200_rep
    .local pmc rx200_cur
    (rx200_cur, rx200_pos, rx200_tgt, $I10) = self."!cursor_start"()
    rx200_cur."!cursor_debug"("START ", "quote_escape:sym<tab>")
    .lex unicode:"$\x{a2}", rx200_cur
    .local pmc match
    .lex "$/", match
    length rx200_eos, rx200_tgt
    set rx200_off, 0
    lt $I10, 2, rx200_start
    sub rx200_off, $I10, 1
    substr rx200_tgt, rx200_tgt, rx200_off
  rx200_start:
.annotate "line", 80
  # rx literal  "\\t"
    add $I11, rx200_pos, 2
    gt $I11, rx200_eos, rx200_fail
    sub $I11, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I11, 2
    ne $S10, "\\t", rx200_fail
    add rx200_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx200_cur."!cursor_pos"(rx200_pos)
    $P10 = rx200_cur."quotemod_check"("b")
    unless $P10, rx200_fail
  # rx pass
    rx200_cur."!cursor_pass"(rx200_pos, "quote_escape:sym<tab>")
    rx200_cur."!cursor_debug"("PASS  ", "quote_escape:sym<tab>", " at pos=", rx200_pos)
    .return (rx200_cur)
  rx200_fail:
.annotate "line", 5
    (rx200_rep, rx200_pos, $I10, $P10) = rx200_cur."!mark_fail"(0)
    lt rx200_pos, -1, rx200_done
    eq rx200_pos, -1, rx200_fail
    jump $I10
  rx200_done:
    rx200_cur."!cursor_fail"()
    rx200_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<tab>")
    .return (rx200_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("75_1258264412.38819") :method
.annotate "line", 5
    new $P202, "ResizablePMCArray"
    push $P202, "\\t"
    .return ($P202)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("76_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx204_tgt
    .local int rx204_pos
    .local int rx204_off
    .local int rx204_eos
    .local int rx204_rep
    .local pmc rx204_cur
    (rx204_cur, rx204_pos, rx204_tgt, $I10) = self."!cursor_start"()
    rx204_cur."!cursor_debug"("START ", "quote_escape:sym<hex>")
    .lex unicode:"$\x{a2}", rx204_cur
    .local pmc match
    .lex "$/", match
    length rx204_eos, rx204_tgt
    set rx204_off, 0
    lt $I10, 2, rx204_start
    sub rx204_off, $I10, 1
    substr rx204_tgt, rx204_tgt, rx204_off
  rx204_start:
.annotate "line", 82
  # rx literal  unicode:"\\x"
    add $I11, rx204_pos, 2
    gt $I11, rx204_eos, rx204_fail
    sub $I11, rx204_pos, rx204_off
    substr $S10, rx204_tgt, $I11, 2
    ne $S10, unicode:"\\x", rx204_fail
    add rx204_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."quotemod_check"("b")
    unless $P10, rx204_fail
  alt207_0:
.annotate "line", 83
    set_addr $I10, alt207_1
    rx204_cur."!mark_push"(0, rx204_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."hexint"()
    unless $P10, rx204_fail
    rx204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx204_pos = $P10."pos"()
    goto alt207_end
  alt207_1:
  # rx literal  "["
    add $I11, rx204_pos, 1
    gt $I11, rx204_eos, rx204_fail
    sub $I11, rx204_pos, rx204_off
    substr $S10, rx204_tgt, $I11, 1
    ne $S10, "[", rx204_fail
    add rx204_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."hexints"()
    unless $P10, rx204_fail
    rx204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx204_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx204_pos, 1
    gt $I11, rx204_eos, rx204_fail
    sub $I11, rx204_pos, rx204_off
    substr $S10, rx204_tgt, $I11, 1
    ne $S10, "]", rx204_fail
    add rx204_pos, 1
  alt207_end:
.annotate "line", 81
  # rx pass
    rx204_cur."!cursor_pass"(rx204_pos, "quote_escape:sym<hex>")
    rx204_cur."!cursor_debug"("PASS  ", "quote_escape:sym<hex>", " at pos=", rx204_pos)
    .return (rx204_cur)
  rx204_fail:
.annotate "line", 5
    (rx204_rep, rx204_pos, $I10, $P10) = rx204_cur."!mark_fail"(0)
    lt rx204_pos, -1, rx204_done
    eq rx204_pos, -1, rx204_fail
    jump $I10
  rx204_done:
    rx204_cur."!cursor_fail"()
    rx204_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<hex>")
    .return (rx204_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("77_1258264412.38819") :method
.annotate "line", 5
    new $P206, "ResizablePMCArray"
    push $P206, unicode:"\\x"
    .return ($P206)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("78_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt, $I10) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "quote_escape:sym<oct>")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    set rx209_off, 0
    lt $I10, 2, rx209_start
    sub rx209_off, $I10, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
.annotate "line", 86
  # rx literal  "\\o"
    add $I11, rx209_pos, 2
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 2
    ne $S10, "\\o", rx209_fail
    add rx209_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."quotemod_check"("b")
    unless $P10, rx209_fail
  alt212_0:
.annotate "line", 87
    set_addr $I10, alt212_1
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."octint"()
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx209_pos = $P10."pos"()
    goto alt212_end
  alt212_1:
  # rx literal  "["
    add $I11, rx209_pos, 1
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 1
    ne $S10, "[", rx209_fail
    add rx209_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."octints"()
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx209_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx209_pos, 1
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 1
    ne $S10, "]", rx209_fail
    add rx209_pos, 1
  alt212_end:
.annotate "line", 85
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "quote_escape:sym<oct>")
    rx209_cur."!cursor_debug"("PASS  ", "quote_escape:sym<oct>", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate "line", 5
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<oct>")
    .return (rx209_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("79_1258264412.38819") :method
.annotate "line", 5
    new $P211, "ResizablePMCArray"
    push $P211, "\\o"
    .return ($P211)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("80_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx214_tgt
    .local int rx214_pos
    .local int rx214_off
    .local int rx214_eos
    .local int rx214_rep
    .local pmc rx214_cur
    (rx214_cur, rx214_pos, rx214_tgt, $I10) = self."!cursor_start"()
    rx214_cur."!cursor_debug"("START ", "quote_escape:sym<chr>")
    .lex unicode:"$\x{a2}", rx214_cur
    .local pmc match
    .lex "$/", match
    length rx214_eos, rx214_tgt
    set rx214_off, 0
    lt $I10, 2, rx214_start
    sub rx214_off, $I10, 1
    substr rx214_tgt, rx214_tgt, rx214_off
  rx214_start:
.annotate "line", 89
  # rx literal  "\\c"
    add $I11, rx214_pos, 2
    gt $I11, rx214_eos, rx214_fail
    sub $I11, rx214_pos, rx214_off
    substr $S10, rx214_tgt, $I11, 2
    ne $S10, "\\c", rx214_fail
    add rx214_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx214_cur."!cursor_pos"(rx214_pos)
    $P10 = rx214_cur."quotemod_check"("b")
    unless $P10, rx214_fail
  # rx subrule "charspec" subtype=capture negate=
    rx214_cur."!cursor_pos"(rx214_pos)
    $P10 = rx214_cur."charspec"()
    unless $P10, rx214_fail
    rx214_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx214_pos = $P10."pos"()
  # rx pass
    rx214_cur."!cursor_pass"(rx214_pos, "quote_escape:sym<chr>")
    rx214_cur."!cursor_debug"("PASS  ", "quote_escape:sym<chr>", " at pos=", rx214_pos)
    .return (rx214_cur)
  rx214_fail:
.annotate "line", 5
    (rx214_rep, rx214_pos, $I10, $P10) = rx214_cur."!mark_fail"(0)
    lt rx214_pos, -1, rx214_done
    eq rx214_pos, -1, rx214_fail
    jump $I10
  rx214_done:
    rx214_cur."!cursor_fail"()
    rx214_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<chr>")
    .return (rx214_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("81_1258264412.38819") :method
.annotate "line", 5
    new $P216, "ResizablePMCArray"
    push $P216, "\\c"
    .return ($P216)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("82_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .const 'Sub' $P226 = "84_1258264412.38819" 
    capture_lex $P226
    .local string rx218_tgt
    .local int rx218_pos
    .local int rx218_off
    .local int rx218_eos
    .local int rx218_rep
    .local pmc rx218_cur
    (rx218_cur, rx218_pos, rx218_tgt, $I10) = self."!cursor_start"()
    rx218_cur."!cursor_debug"("START ", "charname")
    .lex unicode:"$\x{a2}", rx218_cur
    .local pmc match
    .lex "$/", match
    length rx218_eos, rx218_tgt
    set rx218_off, 0
    lt $I10, 2, rx218_start
    sub rx218_off, $I10, 1
    substr rx218_tgt, rx218_tgt, rx218_off
  rx218_start:
  alt222_0:
.annotate "line", 91
    set_addr $I10, alt222_1
    rx218_cur."!mark_push"(0, rx218_pos, $I10)
.annotate "line", 92
  # rx subrule "integer" subtype=capture negate=
    rx218_cur."!cursor_pos"(rx218_pos)
    $P10 = rx218_cur."integer"()
    unless $P10, rx218_fail
    rx218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx218_pos = $P10."pos"()
    goto alt222_end
  alt222_1:
.annotate "line", 93
  # rx enumcharlist negate=0 
    ge rx218_pos, rx218_eos, rx218_fail
    sub $I10, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx218_fail
    inc rx218_pos
  # rx rxquantf223 ** 0..*
    set_addr $I10, rxquantf223_loop
    rx218_cur."!mark_push"(0, rx218_pos, $I10)
    goto rxquantf223_done
  rxquantf223_loop:
  # rx enumcharlist negate=1 
    ge rx218_pos, rx218_eos, rx218_fail
    sub $I10, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I10, 1
    index $I11, "],#", $S10
    ge $I11, 0, rx218_fail
    inc rx218_pos
    set_addr $I10, rxquantf223_loop
    rx218_cur."!mark_push"($I224, rx218_pos, $I10)
  rxquantf223_done:
  # rx enumcharlist negate=0 
    ge rx218_pos, rx218_eos, rx218_fail
    sub $I10, rx218_pos, rx218_off
    substr $S10, rx218_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)", $S10
    lt $I11, 0, rx218_fail
    inc rx218_pos
.annotate "line", 94
  # rx subrule "before" subtype=zerowidth negate=
    rx218_cur."!cursor_pos"(rx218_pos)
    .const 'Sub' $P226 = "84_1258264412.38819" 
    capture_lex $P226
    $P10 = rx218_cur."before"($P226)
    unless $P10, rx218_fail
  alt222_end:
.annotate "line", 91
  # rx pass
    rx218_cur."!cursor_pass"(rx218_pos, "charname")
    rx218_cur."!cursor_debug"("PASS  ", "charname", " at pos=", rx218_pos)
    .return (rx218_cur)
  rx218_fail:
.annotate "line", 5
    (rx218_rep, rx218_pos, $I10, $P10) = rx218_cur."!mark_fail"(0)
    lt rx218_pos, -1, rx218_done
    eq rx218_pos, -1, rx218_fail
    jump $I10
  rx218_done:
    rx218_cur."!cursor_fail"()
    rx218_cur."!cursor_debug"("FAIL  ", "charname")
    .return (rx218_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charname"  :subid("83_1258264412.38819") :method
.annotate "line", 5
    $P220 = self."!PREFIX__!subrule"("integer", "")
    new $P221, "ResizablePMCArray"
    push $P221, "Z"
    push $P221, "Y"
    push $P221, "X"
    push $P221, "W"
    push $P221, "V"
    push $P221, "U"
    push $P221, "T"
    push $P221, "S"
    push $P221, "R"
    push $P221, "Q"
    push $P221, "P"
    push $P221, "O"
    push $P221, "N"
    push $P221, "M"
    push $P221, "L"
    push $P221, "K"
    push $P221, "J"
    push $P221, "I"
    push $P221, "H"
    push $P221, "G"
    push $P221, "F"
    push $P221, "E"
    push $P221, "D"
    push $P221, "C"
    push $P221, "B"
    push $P221, "A"
    push $P221, "z"
    push $P221, "y"
    push $P221, "x"
    push $P221, "w"
    push $P221, "v"
    push $P221, "u"
    push $P221, "t"
    push $P221, "s"
    push $P221, "r"
    push $P221, "q"
    push $P221, "p"
    push $P221, "o"
    push $P221, "n"
    push $P221, "m"
    push $P221, "l"
    push $P221, "k"
    push $P221, "j"
    push $P221, "i"
    push $P221, "h"
    push $P221, "g"
    push $P221, "f"
    push $P221, "e"
    push $P221, "d"
    push $P221, "c"
    push $P221, "b"
    push $P221, "a"
    push $P221, $P220
    .return ($P221)
.end


.namespace ["HLL";"Grammar"]
.sub "_block225"  :anon :subid("84_1258264412.38819") :method :outer("82_1258264412.38819")
.annotate "line", 94
    .local string rx227_tgt
    .local int rx227_pos
    .local int rx227_off
    .local int rx227_eos
    .local int rx227_rep
    .local pmc rx227_cur
    (rx227_cur, rx227_pos, rx227_tgt, $I10) = self."!cursor_start"()
    rx227_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx227_cur
    .local pmc match
    .lex "$/", match
    length rx227_eos, rx227_tgt
    set rx227_off, 0
    lt $I10, 2, rx227_start
    sub rx227_off, $I10, 1
    substr rx227_tgt, rx227_tgt, rx227_off
  rx227_start:
    ge rx227_pos, 0, rxscan228_done
  rxscan228_loop:
    ($P10) = rx227_cur."from"()
    inc $P10
    set rx227_pos, $P10
    ge rx227_pos, rx227_eos, rxscan228_done
    set_addr $I10, rxscan228_loop
    rx227_cur."!mark_push"(0, rx227_pos, $I10)
  rxscan228_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx227_pos, rx227_off
    find_not_cclass $I11, 32, rx227_tgt, $I10, rx227_eos
    add rx227_pos, rx227_off, $I11
  # rx enumcharlist negate=0 
    ge rx227_pos, rx227_eos, rx227_fail
    sub $I10, rx227_pos, rx227_off
    substr $S10, rx227_tgt, $I10, 1
    index $I11, "],#", $S10
    lt $I11, 0, rx227_fail
    inc rx227_pos
  # rx pass
    rx227_cur."!cursor_pass"(rx227_pos, "")
    rx227_cur."!cursor_debug"("PASS  ", "", " at pos=", rx227_pos)
    .return (rx227_cur)
  rx227_fail:
    (rx227_rep, rx227_pos, $I10, $P10) = rx227_cur."!mark_fail"(0)
    lt rx227_pos, -1, rx227_done
    eq rx227_pos, -1, rx227_fail
    jump $I10
  rx227_done:
    rx227_cur."!cursor_fail"()
    rx227_cur."!cursor_debug"("FAIL  ", "")
    .return (rx227_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "charnames"  :subid("85_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx230_tgt
    .local int rx230_pos
    .local int rx230_off
    .local int rx230_eos
    .local int rx230_rep
    .local pmc rx230_cur
    (rx230_cur, rx230_pos, rx230_tgt, $I10) = self."!cursor_start"()
    rx230_cur."!cursor_debug"("START ", "charnames")
    rx230_cur."!cursor_caparray"("charname")
    .lex unicode:"$\x{a2}", rx230_cur
    .local pmc match
    .lex "$/", match
    length rx230_eos, rx230_tgt
    set rx230_off, 0
    lt $I10, 2, rx230_start
    sub rx230_off, $I10, 1
    substr rx230_tgt, rx230_tgt, rx230_off
  rx230_start:
.annotate "line", 96
  # rx rxquantr233 ** 1..*
    set_addr $I234, rxquantr233_done
    rx230_cur."!mark_push"(0, -1, $I234)
  rxquantr233_loop:
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
  # rx subrule "charname" subtype=capture negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."charname"()
    unless $P10, rx230_fail
    rx230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charname")
    rx230_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
    (rx230_rep) = rx230_cur."!mark_commit"($I234)
    rx230_cur."!mark_push"(rx230_rep, rx230_pos, $I234)
  # rx literal  ","
    add $I11, rx230_pos, 1
    gt $I11, rx230_eos, rx230_fail
    sub $I11, rx230_pos, rx230_off
    substr $S10, rx230_tgt, $I11, 1
    ne $S10, ",", rx230_fail
    add rx230_pos, 1
    goto rxquantr233_loop
  rxquantr233_done:
  # rx pass
    rx230_cur."!cursor_pass"(rx230_pos, "charnames")
    rx230_cur."!cursor_debug"("PASS  ", "charnames", " at pos=", rx230_pos)
    .return (rx230_cur)
  rx230_fail:
.annotate "line", 5
    (rx230_rep, rx230_pos, $I10, $P10) = rx230_cur."!mark_fail"(0)
    lt rx230_pos, -1, rx230_done
    eq rx230_pos, -1, rx230_fail
    jump $I10
  rx230_done:
    rx230_cur."!cursor_fail"()
    rx230_cur."!cursor_debug"("FAIL  ", "charnames")
    .return (rx230_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charnames"  :subid("86_1258264412.38819") :method
.annotate "line", 5
    new $P232, "ResizablePMCArray"
    push $P232, ""
    .return ($P232)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("87_1258264412.38819") :method :outer("11_1258264412.38819")
.annotate "line", 5
    .local string rx236_tgt
    .local int rx236_pos
    .local int rx236_off
    .local int rx236_eos
    .local int rx236_rep
    .local pmc rx236_cur
    (rx236_cur, rx236_pos, rx236_tgt, $I10) = self."!cursor_start"()
    rx236_cur."!cursor_debug"("START ", "charspec")
    .lex unicode:"$\x{a2}", rx236_cur
    .local pmc match
    .lex "$/", match
    length rx236_eos, rx236_tgt
    set rx236_off, 0
    lt $I10, 2, rx236_start
    sub rx236_off, $I10, 1
    substr rx236_tgt, rx236_tgt, rx236_off
  rx236_start:
  alt241_0:
.annotate "line", 98
    set_addr $I10, alt241_1
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
.annotate "line", 99
  # rx literal  "["
    add $I11, rx236_pos, 1
    gt $I11, rx236_eos, rx236_fail
    sub $I11, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I11, 1
    ne $S10, "[", rx236_fail
    add rx236_pos, 1
  # rx subrule "charnames" subtype=capture negate=
    rx236_cur."!cursor_pos"(rx236_pos)
    $P10 = rx236_cur."charnames"()
    unless $P10, rx236_fail
    rx236_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charnames")
    rx236_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx236_pos, 1
    gt $I11, rx236_eos, rx236_fail
    sub $I11, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I11, 1
    ne $S10, "]", rx236_fail
    add rx236_pos, 1
    goto alt241_end
  alt241_1:
    set_addr $I10, alt241_2
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
.annotate "line", 100
  # rx charclass_q d r 1..-1
    sub $I10, rx236_pos, rx236_off
    find_not_cclass $I11, 8, rx236_tgt, $I10, rx236_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx236_fail
    add rx236_pos, rx236_off, $I11
  # rx rxquantr242 ** 0..*
    set_addr $I243, rxquantr242_done
    rx236_cur."!mark_push"(0, rx236_pos, $I243)
  rxquantr242_loop:
  # rx literal  "_"
    add $I11, rx236_pos, 1
    gt $I11, rx236_eos, rx236_fail
    sub $I11, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I11, 1
    ne $S10, "_", rx236_fail
    add rx236_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx236_pos, rx236_off
    find_not_cclass $I11, 8, rx236_tgt, $I10, rx236_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx236_fail
    add rx236_pos, rx236_off, $I11
    (rx236_rep) = rx236_cur."!mark_commit"($I243)
    rx236_cur."!mark_push"(rx236_rep, rx236_pos, $I243)
    goto rxquantr242_loop
  rxquantr242_done:
    goto alt241_end
  alt241_2:
    set_addr $I10, alt241_3
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
.annotate "line", 101
  # rx enumcharlist negate=0 
    ge rx236_pos, rx236_eos, rx236_fail
    sub $I10, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I10, 1
    index $I11, "?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx236_fail
    inc rx236_pos
    goto alt241_end
  alt241_3:
.annotate "line", 102
  # rx subrule "panic" subtype=method negate=
    rx236_cur."!cursor_pos"(rx236_pos)
    $P10 = rx236_cur."panic"("Unrecognized \\c character")
    unless $P10, rx236_fail
    rx236_pos = $P10."pos"()
  alt241_end:
.annotate "line", 97
  # rx pass
    rx236_cur."!cursor_pass"(rx236_pos, "charspec")
    rx236_cur."!cursor_debug"("PASS  ", "charspec", " at pos=", rx236_pos)
    .return (rx236_cur)
  rx236_fail:
.annotate "line", 5
    (rx236_rep, rx236_pos, $I10, $P10) = rx236_cur."!mark_fail"(0)
    lt rx236_pos, -1, rx236_done
    eq rx236_pos, -1, rx236_fail
    jump $I10
  rx236_done:
    rx236_cur."!cursor_fail"()
    rx236_cur."!cursor_debug"("FAIL  ", "charspec")
    .return (rx236_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charspec"  :subid("88_1258264412.38819") :method
.annotate "line", 5
    $P238 = self."!PREFIX__!subrule"("", "")
    $P239 = self."!PREFIX__!subrule"("charnames", "[")
    new $P240, "ResizablePMCArray"
    push $P240, $P238
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
    push $P240, "@"
    push $P240, "?"
    push $P240, ""
    push $P240, $P239
    .return ($P240)
.end

### .include 'gen/hllgrammar-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258264416.3253")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
    $P434 = $P14()
.annotate "line", 1
    .return ($P434)
.end


.namespace []
.sub "" :load :init :subid("post39") :outer("10_1258264416.3253")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258264416.3253" 
    .local pmc block
    set block, $P12
    $P435 = get_root_global ["parrot"], "P6metaclass"
    $P435."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block13"  :subid("11_1258264416.3253") :outer("10_1258264416.3253")
.annotate "line", 3
    .const 'Sub' $P417 = "38_1258264416.3253" 
    capture_lex $P417
    .const 'Sub' $P400 = "37_1258264416.3253" 
    capture_lex $P400
    .const 'Sub' $P393 = "36_1258264416.3253" 
    capture_lex $P393
    .const 'Sub' $P386 = "35_1258264416.3253" 
    capture_lex $P386
    .const 'Sub' $P379 = "34_1258264416.3253" 
    capture_lex $P379
    .const 'Sub' $P372 = "33_1258264416.3253" 
    capture_lex $P372
    .const 'Sub' $P362 = "32_1258264416.3253" 
    capture_lex $P362
    .const 'Sub' $P355 = "31_1258264416.3253" 
    capture_lex $P355
    .const 'Sub' $P339 = "30_1258264416.3253" 
    capture_lex $P339
    .const 'Sub' $P264 = "28_1258264416.3253" 
    capture_lex $P264
    .const 'Sub' $P203 = "25_1258264416.3253" 
    capture_lex $P203
    .const 'Sub' $P194 = "24_1258264416.3253" 
    capture_lex $P194
    .const 'Sub' $P185 = "23_1258264416.3253" 
    capture_lex $P185
    .const 'Sub' $P176 = "22_1258264416.3253" 
    capture_lex $P176
    .const 'Sub' $P167 = "21_1258264416.3253" 
    capture_lex $P167
    .const 'Sub' $P158 = "20_1258264416.3253" 
    capture_lex $P158
    .const 'Sub' $P148 = "19_1258264416.3253" 
    capture_lex $P148
    .const 'Sub' $P138 = "18_1258264416.3253" 
    capture_lex $P138
    .const 'Sub' $P128 = "17_1258264416.3253" 
    capture_lex $P128
    .const 'Sub' $P28 = "14_1258264416.3253" 
    capture_lex $P28
    .const 'Sub' $P22 = "13_1258264416.3253" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258264416.3253" 
    capture_lex $P15
.annotate "line", 163
    .const 'Sub' $P417 = "38_1258264416.3253" 
    capture_lex $P417
.annotate "line", 3
    .return ($P417)
.end


.namespace ["HLL";"Actions"]
.sub "string_to_int"  :subid("12_1258264416.3253") :outer("11_1258264416.3253")
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
.sub "ints_to_string"  :subid("13_1258264416.3253") :outer("11_1258264416.3253")
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
.sub "EXPR"  :subid("14_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_31
    .param pmc param_32 :optional
    .param int has_param_32 :opt_flag
.annotate "line", 62
    .const 'Sub' $P111 = "16_1258264416.3253" 
    capture_lex $P111
    .const 'Sub' $P78 = "15_1258264416.3253" 
    capture_lex $P78
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "self", self
    .lex "$/", param_31
    if has_param_32, optparam_40
    new $P33, "Undef"
    set param_32, $P33
  optparam_40:
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
    unless_null $P44, vivify_41
    new $P44, "Hash"
  vivify_41:
    set $P45, $P44["OPER"]
    unless_null $P45, vivify_42
    new $P45, "Undef"
  vivify_42:
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
    unless_null $P53, vivify_43
    new $P53, "Hash"
  vivify_43:
    set $P54, $P53["OPER"]
    unless_null $P54, vivify_44
    new $P54, "Hash"
  vivify_44:
    set $P55, $P54["O"]
    unless_null $P55, vivify_45
    new $P55, "Hash"
  vivify_45:
    set $P56, $P55["pasttype"]
    unless_null $P56, vivify_46
    new $P56, "Undef"
  vivify_46:
    if $P56, if_52
.annotate "line", 68
    find_lex $P64, "$/"
    unless_null $P64, vivify_47
    new $P64, "Hash"
  vivify_47:
    set $P65, $P64["OPER"]
    unless_null $P65, vivify_48
    new $P65, "Hash"
  vivify_48:
    set $P66, $P65["O"]
    unless_null $P66, vivify_49
    new $P66, "Hash"
  vivify_49:
    set $P67, $P66["pirop"]
    unless_null $P67, vivify_50
    new $P67, "Undef"
  vivify_50:
    unless $P67, if_63_end
    find_lex $P68, "$past"
    find_lex $P69, "$/"
    unless_null $P69, vivify_51
    new $P69, "Hash"
  vivify_51:
    set $P70, $P69["OPER"]
    unless_null $P70, vivify_52
    new $P70, "Hash"
  vivify_52:
    set $P71, $P70["O"]
    unless_null $P71, vivify_53
    new $P71, "Hash"
  vivify_53:
    set $P72, $P71["pirop"]
    unless_null $P72, vivify_54
    new $P72, "Undef"
  vivify_54:
    set $S73, $P72
    $P68."pirop"($S73)
  if_63_end:
    goto if_52_end
  if_52:
.annotate "line", 67
    find_lex $P57, "$past"
    find_lex $P58, "$/"
    unless_null $P58, vivify_55
    new $P58, "Hash"
  vivify_55:
    set $P59, $P58["OPER"]
    unless_null $P59, vivify_56
    new $P59, "Hash"
  vivify_56:
    set $P60, $P59["O"]
    unless_null $P60, vivify_57
    new $P60, "Hash"
  vivify_57:
    set $P61, $P60["pasttype"]
    unless_null $P61, vivify_58
    new $P61, "Undef"
  vivify_58:
    set $S62, $P61
    $P57."pasttype"($S62)
  if_52_end:
.annotate "line", 69
    find_lex $P75, "$past"
    $P76 = $P75."name"()
    if $P76, unless_74_end
    .const 'Sub' $P78 = "15_1258264416.3253" 
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
    unless $I108, for_undef_62
    iter $P105, $P107
    new $P122, 'ExceptionHandler'
    set_addr $P122, loop121_handler
    $P122."handle_types"(65, 67, 66)
    push_eh $P122
  loop121_test:
    unless $P105, loop121_done
    shift $P109, $P105
  loop121_redo:
    .const 'Sub' $P111 = "16_1258264416.3253" 
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
  for_undef_62:
.annotate "line", 81
    goto if_97_end
  if_97:
.annotate "line", 80
    find_lex $P101, "$past"
    find_lex $P102, "$/"
    unless_null $P102, vivify_63
    new $P102, "ResizablePMCArray"
  vivify_63:
    set $P103, $P102[0]
    unless_null $P103, vivify_64
    new $P103, "Undef"
  vivify_64:
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
.sub "_block77"  :anon :subid("15_1258264416.3253") :outer("14_1258264416.3253")
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
    unless_null $P87, vivify_59
    new $P87, "Hash"
  vivify_59:
    set $P88, $P87["OPER"]
    unless_null $P88, vivify_60
    new $P88, "Hash"
  vivify_60:
    set $P89, $P88["sym"]
    unless_null $P89, vivify_61
    new $P89, "Undef"
  vivify_61:
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
.sub "_block110"  :anon :subid("16_1258264416.3253") :outer("14_1258264416.3253")
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
.sub "termish"  :subid("17_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_131
.annotate "line", 87
    new $P130, 'ExceptionHandler'
    set_addr $P130, control_129
    $P130."handle_types"(58)
    push_eh $P130
    .lex "self", self
    .lex "$/", param_131
.annotate "line", 88
    find_lex $P132, "$/"
    find_lex $P133, "$/"
    unless_null $P133, vivify_65
    new $P133, "Hash"
  vivify_65:
    set $P134, $P133["term"]
    unless_null $P134, vivify_66
    new $P134, "Undef"
  vivify_66:
    $P135 = $P134."ast"()
    $P136 = $P132."!make"($P135)
.annotate "line", 87
    .return ($P136)
  control_129:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "term:sym<circumfix>"  :subid("18_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_141
.annotate "line", 91
    new $P140, 'ExceptionHandler'
    set_addr $P140, control_139
    $P140."handle_types"(58)
    push_eh $P140
    .lex "self", self
    .lex "$/", param_141
    find_lex $P142, "$/"
    find_lex $P143, "$/"
    unless_null $P143, vivify_67
    new $P143, "Hash"
  vivify_67:
    set $P144, $P143["circumfix"]
    unless_null $P144, vivify_68
    new $P144, "Undef"
  vivify_68:
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
.sub "integer"  :subid("19_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_151
.annotate "line", 93
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "self", self
    .lex "$/", param_151
    find_lex $P152, "$/"
    find_lex $P153, "$/"
    unless_null $P153, vivify_69
    new $P153, "Hash"
  vivify_69:
    set $P154, $P153["VALUE"]
    unless_null $P154, vivify_70
    new $P154, "Undef"
  vivify_70:
    $P155 = $P154."ast"()
    $P156 = $P152."!make"($P155)
    .return ($P156)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P157, exception, "payload"
    .return ($P157)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "dec_number"  :subid("20_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_161
.annotate "line", 95
    new $P160, 'ExceptionHandler'
    set_addr $P160, control_159
    $P160."handle_types"(58)
    push_eh $P160
    .lex "self", self
    .lex "$/", param_161
    find_lex $P162, "$/"
    find_lex $P163, "$/"
    set $N164, $P163
    $P165 = $P162."!make"($N164)
    .return ($P165)
  control_159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "decint"  :subid("21_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_170
.annotate "line", 97
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    .lex "self", self
    .lex "$/", param_170
    find_lex $P171, "$/"
    find_lex $P172, "$/"
    $P173 = "string_to_int"($P172, 10)
    $P174 = $P171."!make"($P173)
    .return ($P174)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P175, exception, "payload"
    .return ($P175)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "hexint"  :subid("22_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_179
.annotate "line", 98
    new $P178, 'ExceptionHandler'
    set_addr $P178, control_177
    $P178."handle_types"(58)
    push_eh $P178
    .lex "self", self
    .lex "$/", param_179
    find_lex $P180, "$/"
    find_lex $P181, "$/"
    $P182 = "string_to_int"($P181, 16)
    $P183 = $P180."!make"($P182)
    .return ($P183)
  control_177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P184, exception, "payload"
    .return ($P184)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "octint"  :subid("23_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_188
.annotate "line", 99
    new $P187, 'ExceptionHandler'
    set_addr $P187, control_186
    $P187."handle_types"(58)
    push_eh $P187
    .lex "self", self
    .lex "$/", param_188
    find_lex $P189, "$/"
    find_lex $P190, "$/"
    $P191 = "string_to_int"($P190, 8)
    $P192 = $P189."!make"($P191)
    .return ($P192)
  control_186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "binint"  :subid("24_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_197
.annotate "line", 100
    new $P196, 'ExceptionHandler'
    set_addr $P196, control_195
    $P196."handle_types"(58)
    push_eh $P196
    .lex "self", self
    .lex "$/", param_197
    find_lex $P198, "$/"
    find_lex $P199, "$/"
    $P200 = "string_to_int"($P199, 2)
    $P201 = $P198."!make"($P200)
    .return ($P201)
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, "payload"
    .return ($P202)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_EXPR"  :subid("25_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_206
.annotate "line", 102
    .const 'Sub' $P222 = "26_1258264416.3253" 
    capture_lex $P222
    new $P205, 'ExceptionHandler'
    set_addr $P205, control_204
    $P205."handle_types"(58)
    push_eh $P205
    .lex "self", self
    .lex "$/", param_206
.annotate "line", 103
    new $P207, "Undef"
    .lex "$past", $P207
    find_lex $P208, "$/"
    unless_null $P208, vivify_71
    new $P208, "Hash"
  vivify_71:
    set $P209, $P208["quote_delimited"]
    unless_null $P209, vivify_72
    new $P209, "Undef"
  vivify_72:
    $P210 = $P209."ast"()
    store_lex "$past", $P210
.annotate "line", 104
    get_hll_global $P212, ["HLL";"Grammar"], "quotemod_check"
    find_lex $P213, "$/"
    $P214 = $P212($P213, "w")
    unless $P214, if_211_end
.annotate "line", 105
    get_hll_global $P216, ["PAST"], "Node"
    find_lex $P217, "$past"
    $P218 = $P216."ACCEPTS"($P217)
    if $P218, if_215
.annotate "line", 108
    .const 'Sub' $P222 = "26_1258264416.3253" 
    capture_lex $P222
    $P222()
    goto if_215_end
  if_215:
.annotate "line", 106
    find_lex $P219, "$/"
    $P220 = $P219."CURSOR"()
    $P220."panic"("Can't form :w list from non-constant strings (yet)")
  if_215_end:
  if_211_end:
.annotate "line", 116
    get_hll_global $P252, ["PAST"], "Node"
    find_lex $P253, "$past"
    $P254 = $P252."ACCEPTS"($P253)
    isfalse $I255, $P254
    unless $I255, if_251_end
.annotate "line", 117
    get_hll_global $P256, ["PAST"], "Val"
    find_lex $P257, "$past"
    set $S258, $P257
    $P259 = $P256."new"($S258 :named("value"))
    store_lex "$past", $P259
  if_251_end:
.annotate "line", 119
    find_lex $P260, "$/"
    find_lex $P261, "$past"
    $P262 = $P260."!make"($P261)
.annotate "line", 102
    .return ($P262)
  control_204:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P263, exception, "payload"
    .return ($P263)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block221"  :anon :subid("26_1258264416.3253") :outer("25_1258264416.3253")
.annotate "line", 108
    .const 'Sub' $P243 = "27_1258264416.3253" 
    capture_lex $P243
.annotate "line", 109
    new $P223, "ResizablePMCArray"
    .lex "@words", $P223
    get_hll_global $P224, ["HLL";"Grammar"], "split_words"
    find_lex $P225, "$/"
    find_lex $P226, "$past"
    $P227 = $P224($P225, $P226)
    store_lex "@words", $P227
.annotate "line", 110
    find_lex $P230, "@words"
    set $N231, $P230
    new $P232, "Integer"
    assign $P232, 1
    set $N233, $P232
    isgt $I234, $N231, $N233
    if $I234, if_229
    new $P228, 'Integer'
    set $P228, $I234
    goto if_229_end
  if_229:
.annotate "line", 111
    get_hll_global $P235, ["PAST"], "Op"
    find_lex $P236, "$/"
    $P237 = $P235."new"("list" :named("pasttype"), $P236 :named("node"))
    store_lex "$past", $P237
.annotate "line", 112
    find_lex $P239, "@words"
    defined $I240, $P239
    unless $I240, for_undef_73
    iter $P238, $P239
    new $P249, 'ExceptionHandler'
    set_addr $P249, loop248_handler
    $P249."handle_types"(65, 67, 66)
    push_eh $P249
  loop248_test:
    unless $P238, loop248_done
    shift $P241, $P238
  loop248_redo:
    .const 'Sub' $P243 = "27_1258264416.3253" 
    capture_lex $P243
    $P243($P241)
  loop248_next:
    goto loop248_test
  loop248_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, 'type'
    eq $P250, 65, loop248_next
    eq $P250, 67, loop248_redo
  loop248_done:
    pop_eh 
  for_undef_73:
.annotate "line", 110
    set $P228, $P238
  if_229_end:
.annotate "line", 108
    .return ($P228)
.end


.namespace ["HLL";"Actions"]
.sub "_block242"  :anon :subid("27_1258264416.3253") :outer("26_1258264416.3253")
    .param pmc param_244
.annotate "line", 112
    .lex "$_", param_244
    find_lex $P245, "$past"
    find_lex $P246, "$_"
    $P247 = $P245."push"($P246)
    .return ($P247)
.end


.namespace ["HLL";"Actions"]
.sub "quote_delimited"  :subid("28_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_267
.annotate "line", 122
    .const 'Sub' $P279 = "29_1258264416.3253" 
    capture_lex $P279
    new $P266, 'ExceptionHandler'
    set_addr $P266, control_265
    $P266."handle_types"(58)
    push_eh $P266
    .lex "self", self
    .lex "$/", param_267
.annotate "line", 123
    new $P268, "ResizablePMCArray"
    .lex "@parts", $P268
.annotate "line", 124
    new $P269, "Undef"
    .lex "$lastlit", $P269
.annotate "line", 140
    new $P270, "Undef"
    .lex "$past", $P270
.annotate "line", 122
    find_lex $P271, "@parts"
.annotate "line", 124
    new $P272, "String"
    assign $P272, ""
    store_lex "$lastlit", $P272
.annotate "line", 125
    find_lex $P274, "$/"
    unless_null $P274, vivify_74
    new $P274, "Hash"
  vivify_74:
    set $P275, $P274["quote_atom"]
    unless_null $P275, vivify_75
    new $P275, "Undef"
  vivify_75:
    defined $I276, $P275
    unless $I276, for_undef_76
    iter $P273, $P275
    new $P312, 'ExceptionHandler'
    set_addr $P312, loop311_handler
    $P312."handle_types"(65, 67, 66)
    push_eh $P312
  loop311_test:
    unless $P273, loop311_done
    shift $P277, $P273
  loop311_redo:
    .const 'Sub' $P279 = "29_1258264416.3253" 
    capture_lex $P279
    $P279($P277)
  loop311_next:
    goto loop311_test
  loop311_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P313, exception, 'type'
    eq $P313, 65, loop311_next
    eq $P313, 67, loop311_redo
  loop311_done:
    pop_eh 
  for_undef_76:
.annotate "line", 139
    find_lex $P315, "$lastlit"
    set $S316, $P315
    isgt $I317, $S316, ""
    unless $I317, if_314_end
    find_lex $P318, "@parts"
    find_lex $P319, "$lastlit"
    $P318."push"($P319)
  if_314_end:
.annotate "line", 140
    find_lex $P322, "@parts"
    if $P322, if_321
    new $P325, "String"
    assign $P325, ""
    set $P320, $P325
    goto if_321_end
  if_321:
    find_lex $P323, "@parts"
    $P324 = $P323."shift"()
    set $P320, $P324
  if_321_end:
    store_lex "$past", $P320
.annotate "line", 141
    new $P333, 'ExceptionHandler'
    set_addr $P333, loop332_handler
    $P333."handle_types"(65, 67, 66)
    push_eh $P333
  loop332_test:
    find_lex $P326, "@parts"
    unless $P326, loop332_done
  loop332_redo:
.annotate "line", 142
    get_hll_global $P327, ["PAST"], "Op"
    find_lex $P328, "$past"
    find_lex $P329, "@parts"
    $P330 = $P329."shift"()
    $P331 = $P327."new"($P328, $P330, "concat" :named("pirop"))
    store_lex "$past", $P331
  loop332_next:
.annotate "line", 141
    goto loop332_test
  loop332_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P334, exception, 'type'
    eq $P334, 65, loop332_next
    eq $P334, 67, loop332_redo
  loop332_done:
    pop_eh 
.annotate "line", 144
    find_lex $P335, "$/"
    find_lex $P336, "$past"
    $P337 = $P335."!make"($P336)
.annotate "line", 122
    .return ($P337)
  control_265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P338, exception, "payload"
    .return ($P338)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block278"  :anon :subid("29_1258264416.3253") :outer("28_1258264416.3253")
    .param pmc param_281
.annotate "line", 126
    new $P280, "Undef"
    .lex "$ast", $P280
    .lex "$_", param_281
    find_lex $P282, "$_"
    $P283 = $P282."ast"()
    store_lex "$ast", $P283
.annotate "line", 127
    get_hll_global $P286, ["PAST"], "Node"
    find_lex $P287, "$ast"
    $P288 = $P286."ACCEPTS"($P287)
    isfalse $I289, $P288
    if $I289, if_285
.annotate "line", 130
    find_lex $P295, "$ast"
    get_hll_global $P296, ["PAST"], "Val"
    $P297 = $P295."isa"($P296)
    if $P297, if_294
.annotate "line", 134
    find_lex $P303, "$lastlit"
    set $S304, $P303
    isgt $I305, $S304, ""
    unless $I305, if_302_end
    find_lex $P306, "@parts"
    find_lex $P307, "$lastlit"
    $P306."push"($P307)
  if_302_end:
.annotate "line", 135
    find_lex $P308, "@parts"
    find_lex $P309, "$ast"
    $P308."push"($P309)
.annotate "line", 136
    new $P310, "String"
    assign $P310, ""
    store_lex "$lastlit", $P310
.annotate "line", 133
    set $P293, $P310
.annotate "line", 130
    goto if_294_end
  if_294:
.annotate "line", 131
    find_lex $P298, "$lastlit"
    find_lex $P299, "$ast"
    $S300 = $P299."value"()
    concat $P301, $P298, $S300
    store_lex "$lastlit", $P301
.annotate "line", 130
    set $P293, $P301
  if_294_end:
    set $P284, $P293
.annotate "line", 127
    goto if_285_end
  if_285:
.annotate "line", 128
    find_lex $P290, "$lastlit"
    find_lex $P291, "$ast"
    concat $P292, $P290, $P291
    store_lex "$lastlit", $P292
.annotate "line", 127
    set $P284, $P292
  if_285_end:
.annotate "line", 125
    .return ($P284)
.end


.namespace ["HLL";"Actions"]
.sub "quote_atom"  :subid("30_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_342
.annotate "line", 147
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "self", self
    .lex "$/", param_342
.annotate "line", 148
    find_lex $P343, "$/"
    find_lex $P346, "$/"
    unless_null $P346, vivify_77
    new $P346, "Hash"
  vivify_77:
    set $P347, $P346["quote_escape"]
    unless_null $P347, vivify_78
    new $P347, "Undef"
  vivify_78:
    if $P347, if_345
    find_lex $P351, "$/"
    set $S352, $P351
    new $P344, 'String'
    set $P344, $S352
    goto if_345_end
  if_345:
    find_lex $P348, "$/"
    unless_null $P348, vivify_79
    new $P348, "Hash"
  vivify_79:
    set $P349, $P348["quote_escape"]
    unless_null $P349, vivify_80
    new $P349, "Undef"
  vivify_80:
    $P350 = $P349."ast"()
    set $P344, $P350
  if_345_end:
    $P353 = $P343."!make"($P344)
.annotate "line", 147
    .return ($P353)
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P354, exception, "payload"
    .return ($P354)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<backslash>"  :subid("31_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_358
.annotate "line", 151
    new $P357, 'ExceptionHandler'
    set_addr $P357, control_356
    $P357."handle_types"(58)
    push_eh $P357
    .lex "self", self
    .lex "$/", param_358
    find_lex $P359, "$/"
    $P360 = $P359."!make"("\\")
    .return ($P360)
  control_356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P361, exception, "payload"
    .return ($P361)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<stopper>"  :subid("32_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_365
.annotate "line", 152
    new $P364, 'ExceptionHandler'
    set_addr $P364, control_363
    $P364."handle_types"(58)
    push_eh $P364
    .lex "self", self
    .lex "$/", param_365
    find_lex $P366, "$/"
    find_lex $P367, "$/"
    unless_null $P367, vivify_81
    new $P367, "Hash"
  vivify_81:
    set $P368, $P367["stopper"]
    unless_null $P368, vivify_82
    new $P368, "Undef"
  vivify_82:
    set $S369, $P368
    $P370 = $P366."!make"($S369)
    .return ($P370)
  control_363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, "payload"
    .return ($P371)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<bs>"  :subid("33_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_375
.annotate "line", 154
    new $P374, 'ExceptionHandler'
    set_addr $P374, control_373
    $P374."handle_types"(58)
    push_eh $P374
    .lex "self", self
    .lex "$/", param_375
    find_lex $P376, "$/"
    $P377 = $P376."!make"("\b")
    .return ($P377)
  control_373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P378, exception, "payload"
    .return ($P378)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<nl>"  :subid("34_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_382
.annotate "line", 155
    new $P381, 'ExceptionHandler'
    set_addr $P381, control_380
    $P381."handle_types"(58)
    push_eh $P381
    .lex "self", self
    .lex "$/", param_382
    find_lex $P383, "$/"
    $P384 = $P383."!make"("\n")
    .return ($P384)
  control_380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P385, exception, "payload"
    .return ($P385)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<cr>"  :subid("35_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_389
.annotate "line", 156
    new $P388, 'ExceptionHandler'
    set_addr $P388, control_387
    $P388."handle_types"(58)
    push_eh $P388
    .lex "self", self
    .lex "$/", param_389
    find_lex $P390, "$/"
    $P391 = $P390."!make"("\r")
    .return ($P391)
  control_387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P392, exception, "payload"
    .return ($P392)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<tab>"  :subid("36_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_396
.annotate "line", 157
    new $P395, 'ExceptionHandler'
    set_addr $P395, control_394
    $P395."handle_types"(58)
    push_eh $P395
    .lex "self", self
    .lex "$/", param_396
    find_lex $P397, "$/"
    $P398 = $P397."!make"("\t")
    .return ($P398)
  control_394:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P399, exception, "payload"
    .return ($P399)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<hex>"  :subid("37_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_403
.annotate "line", 159
    new $P402, 'ExceptionHandler'
    set_addr $P402, control_401
    $P402."handle_types"(58)
    push_eh $P402
    .lex "self", self
    .lex "$/", param_403
.annotate "line", 160
    find_lex $P404, "$/"
    find_lex $P407, "$/"
    unless_null $P407, vivify_83
    new $P407, "Hash"
  vivify_83:
    set $P408, $P407["hexint"]
    unless_null $P408, vivify_84
    new $P408, "Undef"
  vivify_84:
    if $P408, if_406
    find_lex $P411, "$/"
    unless_null $P411, vivify_85
    new $P411, "Hash"
  vivify_85:
    set $P412, $P411["hexints"]
    unless_null $P412, vivify_86
    new $P412, "Hash"
  vivify_86:
    set $P413, $P412["hexint"]
    unless_null $P413, vivify_87
    new $P413, "Undef"
  vivify_87:
    set $P405, $P413
    goto if_406_end
  if_406:
    find_lex $P409, "$/"
    unless_null $P409, vivify_88
    new $P409, "Hash"
  vivify_88:
    set $P410, $P409["hexint"]
    unless_null $P410, vivify_89
    new $P410, "Undef"
  vivify_89:
    set $P405, $P410
  if_406_end:
    $P414 = "ints_to_string"($P405)
    $P415 = $P404."!make"($P414)
.annotate "line", 159
    .return ($P415)
  control_401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P416, exception, "payload"
    .return ($P416)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<oct>"  :subid("38_1258264416.3253") :method :outer("11_1258264416.3253")
    .param pmc param_420
.annotate "line", 163
    new $P419, 'ExceptionHandler'
    set_addr $P419, control_418
    $P419."handle_types"(58)
    push_eh $P419
    .lex "self", self
    .lex "$/", param_420
.annotate "line", 164
    find_lex $P421, "$/"
    find_lex $P424, "$/"
    unless_null $P424, vivify_90
    new $P424, "Hash"
  vivify_90:
    set $P425, $P424["octint"]
    unless_null $P425, vivify_91
    new $P425, "Undef"
  vivify_91:
    if $P425, if_423
    find_lex $P428, "$/"
    unless_null $P428, vivify_92
    new $P428, "Hash"
  vivify_92:
    set $P429, $P428["octints"]
    unless_null $P429, vivify_93
    new $P429, "Hash"
  vivify_93:
    set $P430, $P429["octint"]
    unless_null $P430, vivify_94
    new $P430, "Undef"
  vivify_94:
    set $P422, $P430
    goto if_423_end
  if_423:
    find_lex $P426, "$/"
    unless_null $P426, vivify_95
    new $P426, "Hash"
  vivify_95:
    set $P427, $P426["octint"]
    unless_null $P427, vivify_96
    new $P427, "Undef"
  vivify_96:
    set $P422, $P427
  if_423_end:
    $P431 = "ints_to_string"($P422)
    $P432 = $P421."!make"($P431)
.annotate "line", 163
    .return ($P432)
  control_418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P433, exception, "payload"
    .return ($P433)
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
