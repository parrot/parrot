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
.sub "_block11"  :anon :subid("10_1258208084.60641")
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
.sub "" :load :init :subid("post89") :outer("10_1258208084.60641")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258208084.60641" 
    .local pmc block
    set block, $P12
    $P245 = get_root_global ["parrot"], "P6metaclass"
    $P245."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block13"  :subid("11_1258208084.60641") :outer("10_1258208084.60641")
.annotate "line", 5
    .const 'Sub' $P235 = "87_1258208084.60641" 
    capture_lex $P235
    .const 'Sub' $P229 = "85_1258208084.60641" 
    capture_lex $P229
    .const 'Sub' $P217 = "82_1258208084.60641" 
    capture_lex $P217
    .const 'Sub' $P213 = "80_1258208084.60641" 
    capture_lex $P213
    .const 'Sub' $P208 = "78_1258208084.60641" 
    capture_lex $P208
    .const 'Sub' $P203 = "76_1258208084.60641" 
    capture_lex $P203
    .const 'Sub' $P199 = "74_1258208084.60641" 
    capture_lex $P199
    .const 'Sub' $P195 = "72_1258208084.60641" 
    capture_lex $P195
    .const 'Sub' $P191 = "70_1258208084.60641" 
    capture_lex $P191
    .const 'Sub' $P187 = "68_1258208084.60641" 
    capture_lex $P187
    .const 'Sub' $P183 = "66_1258208084.60641" 
    capture_lex $P183
    .const 'Sub' $P179 = "64_1258208084.60641" 
    capture_lex $P179
    .const 'Sub' $P169 = "60_1258208084.60641" 
    capture_lex $P169
    .const 'Sub' $P157 = "58_1258208084.60641" 
    capture_lex $P157
    .const 'Sub' $P146 = "56_1258208084.60641" 
    capture_lex $P146
    .const 'Sub' $P140 = "54_1258208084.60641" 
    capture_lex $P140
    .const 'Sub' $P132 = "52_1258208084.60641" 
    capture_lex $P132
    .const 'Sub' $P126 = "50_1258208084.60641" 
    capture_lex $P126
    .const 'Sub' $P118 = "48_1258208084.60641" 
    capture_lex $P118
    .const 'Sub' $P112 = "46_1258208084.60641" 
    capture_lex $P112
    .const 'Sub' $P104 = "44_1258208084.60641" 
    capture_lex $P104
    .const 'Sub' $P98 = "42_1258208084.60641" 
    capture_lex $P98
    .const 'Sub' $P92 = "40_1258208084.60641" 
    capture_lex $P92
    .const 'Sub' $P83 = "38_1258208084.60641" 
    capture_lex $P83
    .const 'Sub' $P76 = "36_1258208084.60641" 
    capture_lex $P76
    .const 'Sub' $P69 = "34_1258208084.60641" 
    capture_lex $P69
    .const 'Sub' $P64 = "32_1258208084.60641" 
    capture_lex $P64
    .const 'Sub' $P59 = "30_1258208084.60641" 
    capture_lex $P59
    .const 'Sub' $P54 = "28_1258208084.60641" 
    capture_lex $P54
    .const 'Sub' $P22 = "14_1258208084.60641" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258208084.60641" 
    capture_lex $P15
    .const 'Sub' $P235 = "87_1258208084.60641" 
    capture_lex $P235
    .return ($P235)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__ws"  :subid("13_1258208084.60641") :method
.annotate "line", 5
    new $P18, "ResizablePMCArray"
    push $P18, ""
    .return ($P18)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__termish"  :subid("15_1258208084.60641") :method
.annotate "line", 5
    new $P25, "ResizablePMCArray"
    push $P25, ""
    .return ($P25)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1258208084.60641") :method
.annotate "line", 13
    $P31 = self."!protoregex"("term")
    .return ($P31)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1258208084.60641") :method
.annotate "line", 13
    $P33 = self."!PREFIX__!protoregex"("term")
    .return ($P33)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1258208084.60641") :method
.annotate "line", 14
    $P35 = self."!protoregex"("infix")
    .return ($P35)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1258208084.60641") :method
.annotate "line", 14
    $P37 = self."!PREFIX__!protoregex"("infix")
    .return ($P37)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1258208084.60641") :method
.annotate "line", 15
    $P39 = self."!protoregex"("prefix")
    .return ($P39)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1258208084.60641") :method
.annotate "line", 15
    $P41 = self."!PREFIX__!protoregex"("prefix")
    .return ($P41)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1258208084.60641") :method
.annotate "line", 16
    $P43 = self."!protoregex"("postfix")
    .return ($P43)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1258208084.60641") :method
.annotate "line", 16
    $P45 = self."!PREFIX__!protoregex"("postfix")
    .return ($P45)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1258208084.60641") :method
.annotate "line", 17
    $P47 = self."!protoregex"("circumfix")
    .return ($P47)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1258208084.60641") :method
.annotate "line", 17
    $P49 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P49)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1258208084.60641") :method
.annotate "line", 18
    $P51 = self."!protoregex"("postcircumfix")
    .return ($P51)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1258208084.60641") :method
.annotate "line", 18
    $P53 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P53)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1258208084.60641") :method
.annotate "line", 5
    $P57 = self."!PREFIX__!subrule"("circumfix", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__infixish"  :subid("31_1258208084.60641") :method
.annotate "line", 5
    $P62 = self."!PREFIX__!subrule"("OPER=infix", "")
    new $P63, "ResizablePMCArray"
    push $P63, $P62
    .return ($P63)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__prefixish"  :subid("33_1258208084.60641") :method
.annotate "line", 5
    $P67 = self."!PREFIX__!subrule"("OPER=prefix", "")
    new $P68, "ResizablePMCArray"
    push $P68, $P67
    .return ($P68)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__postfixish"  :subid("35_1258208084.60641") :method
.annotate "line", 5
    $P72 = self."!PREFIX__!subrule"("OPER=postcircumfix", "")
    $P73 = self."!PREFIX__!subrule"("OPER=postfix", "")
    new $P74, "ResizablePMCArray"
    push $P74, $P72
    push $P74, $P73
    .return ($P74)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("36_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_delimited"  :subid("37_1258208084.60641") :method
.annotate "line", 5
    $P79 = self."!PREFIX__!subrule"("starter", "")
    new $P80, "ResizablePMCArray"
    push $P80, $P79
    .return ($P80)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("38_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_atom"  :subid("39_1258208084.60641") :method
.annotate "line", 5
    new $P86, "ResizablePMCArray"
    push $P86, ""
    .return ($P86)
.end


.namespace ["HLL";"Grammar"]
.sub "decint"  :subid("40_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__decint"  :subid("41_1258208084.60641") :method
.annotate "line", 5
    new $P95, "ResizablePMCArray"
    push $P95, ""
    .return ($P95)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("42_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__hexints"  :subid("43_1258208084.60641") :method
.annotate "line", 5
    new $P101, "ResizablePMCArray"
    push $P101, ""
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("44_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__hexint"  :subid("45_1258208084.60641") :method
.annotate "line", 5
    new $P107, "ResizablePMCArray"
    push $P107, ""
    .return ($P107)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("46_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__hexints"  :subid("47_1258208084.60641") :method
.annotate "line", 5
    new $P115, "ResizablePMCArray"
    push $P115, ""
    .return ($P115)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("48_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__octint"  :subid("49_1258208084.60641") :method
.annotate "line", 5
    new $P121, "ResizablePMCArray"
    push $P121, ""
    .return ($P121)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("50_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__octints"  :subid("51_1258208084.60641") :method
.annotate "line", 5
    new $P129, "ResizablePMCArray"
    push $P129, ""
    .return ($P129)
.end


.namespace ["HLL";"Grammar"]
.sub "binint"  :subid("52_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__binint"  :subid("53_1258208084.60641") :method
.annotate "line", 5
    new $P135, "ResizablePMCArray"
    push $P135, ""
    .return ($P135)
.end


.namespace ["HLL";"Grammar"]
.sub "binints"  :subid("54_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__binints"  :subid("55_1258208084.60641") :method
.annotate "line", 5
    new $P143, "ResizablePMCArray"
    push $P143, ""
    .return ($P143)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("56_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__integer"  :subid("57_1258208084.60641") :method
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
.sub "dec_number"  :subid("58_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__dec_number"  :subid("59_1258208084.60641") :method
.annotate "line", 5
    new $P160, "ResizablePMCArray"
    push $P160, ""
    push $P160, ""
    push $P160, "."
    .return ($P160)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("60_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__escale"  :subid("61_1258208084.60641") :method
.annotate "line", 5
    new $P172, "ResizablePMCArray"
    push $P172, "e"
    push $P172, "E"
    .return ($P172)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("62_1258208084.60641") :method
.annotate "line", 73
    $P176 = self."!protoregex"("quote_escape")
    .return ($P176)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("63_1258208084.60641") :method
.annotate "line", 73
    $P178 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P178)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("64_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("65_1258208084.60641") :method
.annotate "line", 5
    new $P182, "ResizablePMCArray"
    push $P182, "\\\\"
    .return ($P182)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("66_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("67_1258208084.60641") :method
.annotate "line", 5
    new $P186, "ResizablePMCArray"
    push $P186, "\\"
    .return ($P186)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("68_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("69_1258208084.60641") :method
.annotate "line", 5
    new $P190, "ResizablePMCArray"
    push $P190, "\\b"
    .return ($P190)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("70_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("71_1258208084.60641") :method
.annotate "line", 5
    new $P194, "ResizablePMCArray"
    push $P194, "\\n"
    .return ($P194)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("72_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("73_1258208084.60641") :method
.annotate "line", 5
    new $P198, "ResizablePMCArray"
    push $P198, "\\r"
    .return ($P198)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("74_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("75_1258208084.60641") :method
.annotate "line", 5
    new $P202, "ResizablePMCArray"
    push $P202, "\\t"
    .return ($P202)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("76_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("77_1258208084.60641") :method
.annotate "line", 5
    new $P206, "ResizablePMCArray"
    push $P206, unicode:"\\x"
    .return ($P206)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("78_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("79_1258208084.60641") :method
.annotate "line", 5
    new $P211, "ResizablePMCArray"
    push $P211, "\\o"
    .return ($P211)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("80_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("81_1258208084.60641") :method
.annotate "line", 5
    new $P216, "ResizablePMCArray"
    push $P216, "\\c"
    .return ($P216)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("82_1258208084.60641") :method :outer("11_1258208084.60641")
.annotate "line", 5
    .const 'Sub' $P226 = "84_1258208084.60641" 
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
    .const 'Sub' $P226 = "84_1258208084.60641" 
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
.sub "!PREFIX__charname"  :subid("83_1258208084.60641") :method
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
.sub "_block225"  :anon :subid("84_1258208084.60641") :method :outer("82_1258208084.60641")
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
.sub "charnames"  :subid("85_1258208084.60641") :method :outer("11_1258208084.60641")
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
.sub "!PREFIX__charnames"  :subid("86_1258208084.60641") :method
.annotate "line", 5
    new $P232, "ResizablePMCArray"
    push $P232, ""
    .return ($P232)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("87_1258208084.60641") :method :outer("11_1258208084.60641")
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
    $P10 = rx236_cur."panic"("Unrecognized \\\\c character")
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
.sub "!PREFIX__charspec"  :subid("88_1258208084.60641") :method
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
.sub "_block11"  :anon :subid("10_1258208086.97044")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
    $P437 = $P14()
.annotate "line", 1
    .return ($P437)
.end


.namespace []
.sub "" :load :init :subid("post40") :outer("10_1258208086.97044")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258208086.97044" 
    .local pmc block
    set block, $P12
    $P438 = get_root_global ["parrot"], "P6metaclass"
    $P438."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block13"  :subid("11_1258208086.97044") :outer("10_1258208086.97044")
.annotate "line", 3
    .const 'Sub' $P420 = "39_1258208086.97044" 
    capture_lex $P420
    .const 'Sub' $P403 = "38_1258208086.97044" 
    capture_lex $P403
    .const 'Sub' $P396 = "37_1258208086.97044" 
    capture_lex $P396
    .const 'Sub' $P389 = "36_1258208086.97044" 
    capture_lex $P389
    .const 'Sub' $P382 = "35_1258208086.97044" 
    capture_lex $P382
    .const 'Sub' $P375 = "34_1258208086.97044" 
    capture_lex $P375
    .const 'Sub' $P365 = "33_1258208086.97044" 
    capture_lex $P365
    .const 'Sub' $P358 = "32_1258208086.97044" 
    capture_lex $P358
    .const 'Sub' $P342 = "31_1258208086.97044" 
    capture_lex $P342
    .const 'Sub' $P268 = "29_1258208086.97044" 
    capture_lex $P268
    .const 'Sub' $P209 = "26_1258208086.97044" 
    capture_lex $P209
    .const 'Sub' $P200 = "25_1258208086.97044" 
    capture_lex $P200
    .const 'Sub' $P191 = "24_1258208086.97044" 
    capture_lex $P191
    .const 'Sub' $P182 = "23_1258208086.97044" 
    capture_lex $P182
    .const 'Sub' $P173 = "22_1258208086.97044" 
    capture_lex $P173
    .const 'Sub' $P164 = "21_1258208086.97044" 
    capture_lex $P164
    .const 'Sub' $P154 = "20_1258208086.97044" 
    capture_lex $P154
    .const 'Sub' $P144 = "19_1258208086.97044" 
    capture_lex $P144
    .const 'Sub' $P134 = "18_1258208086.97044" 
    capture_lex $P134
    .const 'Sub' $P34 = "15_1258208086.97044" 
    capture_lex $P34
    .const 'Sub' $P28 = "14_1258208086.97044" 
    capture_lex $P28
    .const 'Sub' $P22 = "13_1258208086.97044" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1258208086.97044" 
    capture_lex $P15
.annotate "line", 170
    .const 'Sub' $P420 = "39_1258208086.97044" 
    capture_lex $P420
.annotate "line", 3
    .return ($P420)
.end


.namespace ["HLL";"Actions"]
.sub "string_to_int"  :subid("12_1258208086.97044") :outer("11_1258208086.97044")
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
.sub "ints_to_string"  :subid("13_1258208086.97044") :outer("11_1258208086.97044")
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
.sub "isaPAST"  :subid("14_1258208086.97044") :outer("11_1258208086.97044")
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
.sub "EXPR"  :subid("15_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_37
    .param pmc param_38 :optional
    .param int has_param_38 :opt_flag
.annotate "line", 69
    .const 'Sub' $P117 = "17_1258208086.97044" 
    capture_lex $P117
    .const 'Sub' $P84 = "16_1258208086.97044" 
    capture_lex $P84
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$/", param_37
    if has_param_38, optparam_41
    new $P39, "Undef"
    set param_38, $P39
  optparam_41:
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
    unless_null $P50, vivify_42
    new $P50, "Hash"
  vivify_42:
    set $P51, $P50["OPER"]
    unless_null $P51, vivify_43
    new $P51, "Undef"
  vivify_43:
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
    unless_null $P59, vivify_44
    new $P59, "Hash"
  vivify_44:
    set $P60, $P59["OPER"]
    unless_null $P60, vivify_45
    new $P60, "Hash"
  vivify_45:
    set $P61, $P60["O"]
    unless_null $P61, vivify_46
    new $P61, "Hash"
  vivify_46:
    set $P62, $P61["pasttype"]
    unless_null $P62, vivify_47
    new $P62, "Undef"
  vivify_47:
    if $P62, if_58
.annotate "line", 75
    find_lex $P70, "$/"
    unless_null $P70, vivify_48
    new $P70, "Hash"
  vivify_48:
    set $P71, $P70["OPER"]
    unless_null $P71, vivify_49
    new $P71, "Hash"
  vivify_49:
    set $P72, $P71["O"]
    unless_null $P72, vivify_50
    new $P72, "Hash"
  vivify_50:
    set $P73, $P72["pirop"]
    unless_null $P73, vivify_51
    new $P73, "Undef"
  vivify_51:
    unless $P73, if_69_end
    find_lex $P74, "$past"
    find_lex $P75, "$/"
    unless_null $P75, vivify_52
    new $P75, "Hash"
  vivify_52:
    set $P76, $P75["OPER"]
    unless_null $P76, vivify_53
    new $P76, "Hash"
  vivify_53:
    set $P77, $P76["O"]
    unless_null $P77, vivify_54
    new $P77, "Hash"
  vivify_54:
    set $P78, $P77["pirop"]
    unless_null $P78, vivify_55
    new $P78, "Undef"
  vivify_55:
    set $S79, $P78
    $P74."pirop"($S79)
  if_69_end:
    goto if_58_end
  if_58:
.annotate "line", 74
    find_lex $P63, "$past"
    find_lex $P64, "$/"
    unless_null $P64, vivify_56
    new $P64, "Hash"
  vivify_56:
    set $P65, $P64["OPER"]
    unless_null $P65, vivify_57
    new $P65, "Hash"
  vivify_57:
    set $P66, $P65["O"]
    unless_null $P66, vivify_58
    new $P66, "Hash"
  vivify_58:
    set $P67, $P66["pasttype"]
    unless_null $P67, vivify_59
    new $P67, "Undef"
  vivify_59:
    set $S68, $P67
    $P63."pasttype"($S68)
  if_58_end:
.annotate "line", 76
    find_lex $P81, "$past"
    $P82 = $P81."name"()
    if $P82, unless_80_end
    .const 'Sub' $P84 = "16_1258208086.97044" 
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
    unless $I114, for_undef_63
    iter $P111, $P113
    new $P128, 'ExceptionHandler'
    set_addr $P128, loop127_handler
    $P128."handle_types"(65, 67, 66)
    push_eh $P128
  loop127_test:
    unless $P111, loop127_done
    shift $P115, $P111
  loop127_redo:
    .const 'Sub' $P117 = "17_1258208086.97044" 
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
  for_undef_63:
.annotate "line", 88
    goto if_103_end
  if_103:
.annotate "line", 87
    find_lex $P107, "$past"
    find_lex $P108, "$/"
    unless_null $P108, vivify_64
    new $P108, "ResizablePMCArray"
  vivify_64:
    set $P109, $P108[0]
    unless_null $P109, vivify_65
    new $P109, "Undef"
  vivify_65:
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
.sub "_block83"  :anon :subid("16_1258208086.97044") :outer("15_1258208086.97044")
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
    unless_null $P93, vivify_60
    new $P93, "Hash"
  vivify_60:
    set $P94, $P93["OPER"]
    unless_null $P94, vivify_61
    new $P94, "Hash"
  vivify_61:
    set $P95, $P94["sym"]
    unless_null $P95, vivify_62
    new $P95, "Undef"
  vivify_62:
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
.sub "_block116"  :anon :subid("17_1258208086.97044") :outer("15_1258208086.97044")
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
.sub "termish"  :subid("18_1258208086.97044") :method :outer("11_1258208086.97044")
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
    unless_null $P139, vivify_66
    new $P139, "Hash"
  vivify_66:
    set $P140, $P139["term"]
    unless_null $P140, vivify_67
    new $P140, "Undef"
  vivify_67:
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
.sub "term:sym<circumfix>"  :subid("19_1258208086.97044") :method :outer("11_1258208086.97044")
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
    unless_null $P149, vivify_68
    new $P149, "Hash"
  vivify_68:
    set $P150, $P149["circumfix"]
    unless_null $P150, vivify_69
    new $P150, "Undef"
  vivify_69:
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
.sub "integer"  :subid("20_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_157
.annotate "line", 100
    new $P156, 'ExceptionHandler'
    set_addr $P156, control_155
    $P156."handle_types"(58)
    push_eh $P156
    .lex "self", self
    .lex "$/", param_157
    find_lex $P158, "$/"
    find_lex $P159, "$/"
    unless_null $P159, vivify_70
    new $P159, "Hash"
  vivify_70:
    set $P160, $P159["VALUE"]
    unless_null $P160, vivify_71
    new $P160, "Undef"
  vivify_71:
    $P161 = $P160."ast"()
    $P162 = $P158."!make"($P161)
    .return ($P162)
  control_155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "dec_number"  :subid("21_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_167
.annotate "line", 102
    new $P166, 'ExceptionHandler'
    set_addr $P166, control_165
    $P166."handle_types"(58)
    push_eh $P166
    .lex "self", self
    .lex "$/", param_167
    find_lex $P168, "$/"
    find_lex $P169, "$/"
    set $N170, $P169
    $P171 = $P168."!make"($N170)
    .return ($P171)
  control_165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P172, exception, "payload"
    .return ($P172)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "decint"  :subid("22_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_176
.annotate "line", 104
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "$/", param_176
    find_lex $P177, "$/"
    find_lex $P178, "$/"
    $P179 = "string_to_int"($P178, 10)
    $P180 = $P177."!make"($P179)
    .return ($P180)
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "hexint"  :subid("23_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_185
.annotate "line", 105
    new $P184, 'ExceptionHandler'
    set_addr $P184, control_183
    $P184."handle_types"(58)
    push_eh $P184
    .lex "self", self
    .lex "$/", param_185
    find_lex $P186, "$/"
    find_lex $P187, "$/"
    $P188 = "string_to_int"($P187, 16)
    $P189 = $P186."!make"($P188)
    .return ($P189)
  control_183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P190, exception, "payload"
    .return ($P190)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "octint"  :subid("24_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_194
.annotate "line", 106
    new $P193, 'ExceptionHandler'
    set_addr $P193, control_192
    $P193."handle_types"(58)
    push_eh $P193
    .lex "self", self
    .lex "$/", param_194
    find_lex $P195, "$/"
    find_lex $P196, "$/"
    $P197 = "string_to_int"($P196, 8)
    $P198 = $P195."!make"($P197)
    .return ($P198)
  control_192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "binint"  :subid("25_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_203
.annotate "line", 107
    new $P202, 'ExceptionHandler'
    set_addr $P202, control_201
    $P202."handle_types"(58)
    push_eh $P202
    .lex "self", self
    .lex "$/", param_203
    find_lex $P204, "$/"
    find_lex $P205, "$/"
    $P206 = "string_to_int"($P205, 2)
    $P207 = $P204."!make"($P206)
    .return ($P207)
  control_201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, "payload"
    .return ($P208)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_EXPR"  :subid("26_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_212
.annotate "line", 109
    .const 'Sub' $P227 = "27_1258208086.97044" 
    capture_lex $P227
    new $P211, 'ExceptionHandler'
    set_addr $P211, control_210
    $P211."handle_types"(58)
    push_eh $P211
    .lex "self", self
    .lex "$/", param_212
.annotate "line", 110
    new $P213, "Undef"
    .lex "$past", $P213
    find_lex $P214, "$/"
    unless_null $P214, vivify_72
    new $P214, "Hash"
  vivify_72:
    set $P215, $P214["quote_delimited"]
    unless_null $P215, vivify_73
    new $P215, "Undef"
  vivify_73:
    $P216 = $P215."ast"()
    store_lex "$past", $P216
.annotate "line", 111
    get_hll_global $P218, ["HLL";"Grammar"], "quotemod_check"
    find_lex $P219, "$/"
    $P220 = $P218($P219, "w")
    unless $P220, if_217_end
.annotate "line", 112
    find_lex $P222, "$past"
    $P223 = "isaPAST"($P222)
    if $P223, if_221
.annotate "line", 115
    .const 'Sub' $P227 = "27_1258208086.97044" 
    capture_lex $P227
    $P227()
    goto if_221_end
  if_221:
.annotate "line", 113
    find_lex $P224, "$/"
    $P225 = $P224."CURSOR"()
    $P225."panic"("Can't form :w list from non-constant strings (yet)")
  if_221_end:
  if_217_end:
.annotate "line", 123
    find_lex $P257, "$past"
    $P258 = "isaPAST"($P257)
    isfalse $I259, $P258
    unless $I259, if_256_end
.annotate "line", 124
    get_hll_global $P260, ["PAST"], "Val"
    find_lex $P261, "$past"
    set $S262, $P261
    $P263 = $P260."new"($S262 :named("value"))
    store_lex "$past", $P263
  if_256_end:
.annotate "line", 126
    find_lex $P264, "$/"
    find_lex $P265, "$past"
    $P266 = $P264."!make"($P265)
.annotate "line", 109
    .return ($P266)
  control_210:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, "payload"
    .return ($P267)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block226"  :anon :subid("27_1258208086.97044") :outer("26_1258208086.97044")
.annotate "line", 115
    .const 'Sub' $P248 = "28_1258208086.97044" 
    capture_lex $P248
.annotate "line", 116
    new $P228, "ResizablePMCArray"
    .lex "@words", $P228
    get_hll_global $P229, ["HLL";"Grammar"], "split_words"
    find_lex $P230, "$/"
    find_lex $P231, "$past"
    $P232 = $P229($P230, $P231)
    store_lex "@words", $P232
.annotate "line", 117
    find_lex $P235, "@words"
    set $N236, $P235
    new $P237, "Integer"
    assign $P237, 1
    set $N238, $P237
    isgt $I239, $N236, $N238
    if $I239, if_234
    new $P233, 'Integer'
    set $P233, $I239
    goto if_234_end
  if_234:
.annotate "line", 118
    get_hll_global $P240, ["PAST"], "Op"
    find_lex $P241, "$/"
    $P242 = $P240."new"("list" :named("pasttype"), $P241 :named("node"))
    store_lex "$past", $P242
.annotate "line", 119
    find_lex $P244, "@words"
    defined $I245, $P244
    unless $I245, for_undef_74
    iter $P243, $P244
    new $P254, 'ExceptionHandler'
    set_addr $P254, loop253_handler
    $P254."handle_types"(65, 67, 66)
    push_eh $P254
  loop253_test:
    unless $P243, loop253_done
    shift $P246, $P243
  loop253_redo:
    .const 'Sub' $P248 = "28_1258208086.97044" 
    capture_lex $P248
    $P248($P246)
  loop253_next:
    goto loop253_test
  loop253_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P255, exception, 'type'
    eq $P255, 65, loop253_next
    eq $P255, 67, loop253_redo
  loop253_done:
    pop_eh 
  for_undef_74:
.annotate "line", 117
    set $P233, $P243
  if_234_end:
.annotate "line", 115
    .return ($P233)
.end


.namespace ["HLL";"Actions"]
.sub "_block247"  :anon :subid("28_1258208086.97044") :outer("27_1258208086.97044")
    .param pmc param_249
.annotate "line", 119
    .lex "$_", param_249
    find_lex $P250, "$past"
    find_lex $P251, "$_"
    $P252 = $P250."push"($P251)
    .return ($P252)
.end


.namespace ["HLL";"Actions"]
.sub "quote_delimited"  :subid("29_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_271
.annotate "line", 129
    .const 'Sub' $P283 = "30_1258208086.97044" 
    capture_lex $P283
    new $P270, 'ExceptionHandler'
    set_addr $P270, control_269
    $P270."handle_types"(58)
    push_eh $P270
    .lex "self", self
    .lex "$/", param_271
.annotate "line", 130
    new $P272, "ResizablePMCArray"
    .lex "@parts", $P272
.annotate "line", 131
    new $P273, "Undef"
    .lex "$lastlit", $P273
.annotate "line", 147
    new $P274, "Undef"
    .lex "$past", $P274
.annotate "line", 129
    find_lex $P275, "@parts"
.annotate "line", 131
    new $P276, "String"
    assign $P276, ""
    store_lex "$lastlit", $P276
.annotate "line", 132
    find_lex $P278, "$/"
    unless_null $P278, vivify_75
    new $P278, "Hash"
  vivify_75:
    set $P279, $P278["quote_atom"]
    unless_null $P279, vivify_76
    new $P279, "Undef"
  vivify_76:
    defined $I280, $P279
    unless $I280, for_undef_77
    iter $P277, $P279
    new $P315, 'ExceptionHandler'
    set_addr $P315, loop314_handler
    $P315."handle_types"(65, 67, 66)
    push_eh $P315
  loop314_test:
    unless $P277, loop314_done
    shift $P281, $P277
  loop314_redo:
    .const 'Sub' $P283 = "30_1258208086.97044" 
    capture_lex $P283
    $P283($P281)
  loop314_next:
    goto loop314_test
  loop314_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P316, exception, 'type'
    eq $P316, 65, loop314_next
    eq $P316, 67, loop314_redo
  loop314_done:
    pop_eh 
  for_undef_77:
.annotate "line", 146
    find_lex $P318, "$lastlit"
    set $S319, $P318
    isgt $I320, $S319, ""
    unless $I320, if_317_end
    find_lex $P321, "@parts"
    find_lex $P322, "$lastlit"
    $P321."push"($P322)
  if_317_end:
.annotate "line", 147
    find_lex $P325, "@parts"
    if $P325, if_324
    new $P328, "String"
    assign $P328, ""
    set $P323, $P328
    goto if_324_end
  if_324:
    find_lex $P326, "@parts"
    $P327 = $P326."shift"()
    set $P323, $P327
  if_324_end:
    store_lex "$past", $P323
.annotate "line", 148
    new $P336, 'ExceptionHandler'
    set_addr $P336, loop335_handler
    $P336."handle_types"(65, 67, 66)
    push_eh $P336
  loop335_test:
    find_lex $P329, "@parts"
    unless $P329, loop335_done
  loop335_redo:
.annotate "line", 149
    get_hll_global $P330, ["PAST"], "Op"
    find_lex $P331, "$past"
    find_lex $P332, "@parts"
    $P333 = $P332."shift"()
    $P334 = $P330."new"($P331, $P333, "concat" :named("pirop"))
    store_lex "$past", $P334
  loop335_next:
.annotate "line", 148
    goto loop335_test
  loop335_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, 'type'
    eq $P337, 65, loop335_next
    eq $P337, 67, loop335_redo
  loop335_done:
    pop_eh 
.annotate "line", 151
    find_lex $P338, "$/"
    find_lex $P339, "$past"
    $P340 = $P338."!make"($P339)
.annotate "line", 129
    .return ($P340)
  control_269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P341, exception, "payload"
    .return ($P341)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "_block282"  :anon :subid("30_1258208086.97044") :outer("29_1258208086.97044")
    .param pmc param_285
.annotate "line", 133
    new $P284, "Undef"
    .lex "$ast", $P284
    .lex "$_", param_285
    find_lex $P286, "$_"
    $P287 = $P286."ast"()
    store_lex "$ast", $P287
.annotate "line", 134
    find_lex $P290, "$ast"
    $P291 = "isaPAST"($P290)
    isfalse $I292, $P291
    if $I292, if_289
.annotate "line", 137
    find_lex $P298, "$ast"
    get_hll_global $P299, ["PAST"], "Val"
    $P300 = $P298."isa"($P299)
    if $P300, if_297
.annotate "line", 141
    find_lex $P306, "$lastlit"
    set $S307, $P306
    isgt $I308, $S307, ""
    unless $I308, if_305_end
    find_lex $P309, "@parts"
    find_lex $P310, "$lastlit"
    $P309."push"($P310)
  if_305_end:
.annotate "line", 142
    find_lex $P311, "@parts"
    find_lex $P312, "$ast"
    $P311."push"($P312)
.annotate "line", 143
    new $P313, "String"
    assign $P313, ""
    store_lex "$lastlit", $P313
.annotate "line", 140
    set $P296, $P313
.annotate "line", 137
    goto if_297_end
  if_297:
.annotate "line", 138
    find_lex $P301, "$lastlit"
    find_lex $P302, "$ast"
    $S303 = $P302."value"()
    concat $P304, $P301, $S303
    store_lex "$lastlit", $P304
.annotate "line", 137
    set $P296, $P304
  if_297_end:
    set $P288, $P296
.annotate "line", 134
    goto if_289_end
  if_289:
.annotate "line", 135
    find_lex $P293, "$lastlit"
    find_lex $P294, "$ast"
    concat $P295, $P293, $P294
    store_lex "$lastlit", $P295
.annotate "line", 134
    set $P288, $P295
  if_289_end:
.annotate "line", 132
    .return ($P288)
.end


.namespace ["HLL";"Actions"]
.sub "quote_atom"  :subid("31_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_345
.annotate "line", 154
    new $P344, 'ExceptionHandler'
    set_addr $P344, control_343
    $P344."handle_types"(58)
    push_eh $P344
    .lex "self", self
    .lex "$/", param_345
.annotate "line", 155
    find_lex $P346, "$/"
    find_lex $P349, "$/"
    unless_null $P349, vivify_78
    new $P349, "Hash"
  vivify_78:
    set $P350, $P349["quote_escape"]
    unless_null $P350, vivify_79
    new $P350, "Undef"
  vivify_79:
    if $P350, if_348
    find_lex $P354, "$/"
    set $S355, $P354
    new $P347, 'String'
    set $P347, $S355
    goto if_348_end
  if_348:
    find_lex $P351, "$/"
    unless_null $P351, vivify_80
    new $P351, "Hash"
  vivify_80:
    set $P352, $P351["quote_escape"]
    unless_null $P352, vivify_81
    new $P352, "Undef"
  vivify_81:
    $P353 = $P352."ast"()
    set $P347, $P353
  if_348_end:
    $P356 = $P346."!make"($P347)
.annotate "line", 154
    .return ($P356)
  control_343:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P357, exception, "payload"
    .return ($P357)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<backslash>"  :subid("32_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_361
.annotate "line", 158
    new $P360, 'ExceptionHandler'
    set_addr $P360, control_359
    $P360."handle_types"(58)
    push_eh $P360
    .lex "self", self
    .lex "$/", param_361
    find_lex $P362, "$/"
    $P363 = $P362."!make"("\\")
    .return ($P363)
  control_359:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P364, exception, "payload"
    .return ($P364)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<stopper>"  :subid("33_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_368
.annotate "line", 159
    new $P367, 'ExceptionHandler'
    set_addr $P367, control_366
    $P367."handle_types"(58)
    push_eh $P367
    .lex "self", self
    .lex "$/", param_368
    find_lex $P369, "$/"
    find_lex $P370, "$/"
    unless_null $P370, vivify_82
    new $P370, "Hash"
  vivify_82:
    set $P371, $P370["stopper"]
    unless_null $P371, vivify_83
    new $P371, "Undef"
  vivify_83:
    set $S372, $P371
    $P373 = $P369."!make"($S372)
    .return ($P373)
  control_366:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<bs>"  :subid("34_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_378
.annotate "line", 161
    new $P377, 'ExceptionHandler'
    set_addr $P377, control_376
    $P377."handle_types"(58)
    push_eh $P377
    .lex "self", self
    .lex "$/", param_378
    find_lex $P379, "$/"
    $P380 = $P379."!make"("\b")
    .return ($P380)
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P381, exception, "payload"
    .return ($P381)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<nl>"  :subid("35_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_385
.annotate "line", 162
    new $P384, 'ExceptionHandler'
    set_addr $P384, control_383
    $P384."handle_types"(58)
    push_eh $P384
    .lex "self", self
    .lex "$/", param_385
    find_lex $P386, "$/"
    $P387 = $P386."!make"("\n")
    .return ($P387)
  control_383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<cr>"  :subid("36_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_392
.annotate "line", 163
    new $P391, 'ExceptionHandler'
    set_addr $P391, control_390
    $P391."handle_types"(58)
    push_eh $P391
    .lex "self", self
    .lex "$/", param_392
    find_lex $P393, "$/"
    $P394 = $P393."!make"("\r")
    .return ($P394)
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P395, exception, "payload"
    .return ($P395)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<tab>"  :subid("37_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_399
.annotate "line", 164
    new $P398, 'ExceptionHandler'
    set_addr $P398, control_397
    $P398."handle_types"(58)
    push_eh $P398
    .lex "self", self
    .lex "$/", param_399
    find_lex $P400, "$/"
    $P401 = $P400."!make"("\t")
    .return ($P401)
  control_397:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P402, exception, "payload"
    .return ($P402)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<hex>"  :subid("38_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_406
.annotate "line", 166
    new $P405, 'ExceptionHandler'
    set_addr $P405, control_404
    $P405."handle_types"(58)
    push_eh $P405
    .lex "self", self
    .lex "$/", param_406
.annotate "line", 167
    find_lex $P407, "$/"
    find_lex $P410, "$/"
    unless_null $P410, vivify_84
    new $P410, "Hash"
  vivify_84:
    set $P411, $P410["hexint"]
    unless_null $P411, vivify_85
    new $P411, "Undef"
  vivify_85:
    if $P411, if_409
    find_lex $P414, "$/"
    unless_null $P414, vivify_86
    new $P414, "Hash"
  vivify_86:
    set $P415, $P414["hexints"]
    unless_null $P415, vivify_87
    new $P415, "Hash"
  vivify_87:
    set $P416, $P415["hexint"]
    unless_null $P416, vivify_88
    new $P416, "Undef"
  vivify_88:
    set $P408, $P416
    goto if_409_end
  if_409:
    find_lex $P412, "$/"
    unless_null $P412, vivify_89
    new $P412, "Hash"
  vivify_89:
    set $P413, $P412["hexint"]
    unless_null $P413, vivify_90
    new $P413, "Undef"
  vivify_90:
    set $P408, $P413
  if_409_end:
    $P417 = "ints_to_string"($P408)
    $P418 = $P407."!make"($P417)
.annotate "line", 166
    .return ($P418)
  control_404:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P419, exception, "payload"
    .return ($P419)
    rethrow exception
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<oct>"  :subid("39_1258208086.97044") :method :outer("11_1258208086.97044")
    .param pmc param_423
.annotate "line", 170
    new $P422, 'ExceptionHandler'
    set_addr $P422, control_421
    $P422."handle_types"(58)
    push_eh $P422
    .lex "self", self
    .lex "$/", param_423
.annotate "line", 171
    find_lex $P424, "$/"
    find_lex $P427, "$/"
    unless_null $P427, vivify_91
    new $P427, "Hash"
  vivify_91:
    set $P428, $P427["octint"]
    unless_null $P428, vivify_92
    new $P428, "Undef"
  vivify_92:
    if $P428, if_426
    find_lex $P431, "$/"
    unless_null $P431, vivify_93
    new $P431, "Hash"
  vivify_93:
    set $P432, $P431["octints"]
    unless_null $P432, vivify_94
    new $P432, "Hash"
  vivify_94:
    set $P433, $P432["octint"]
    unless_null $P433, vivify_95
    new $P433, "Undef"
  vivify_95:
    set $P425, $P433
    goto if_426_end
  if_426:
    find_lex $P429, "$/"
    unless_null $P429, vivify_96
    new $P429, "Hash"
  vivify_96:
    set $P430, $P429["octint"]
    unless_null $P430, vivify_97
    new $P430, "Undef"
  vivify_97:
    set $P425, $P430
  if_426_end:
    $P434 = "ints_to_string"($P425)
    $P435 = $P424."!make"($P434)
.annotate "line", 170
    .return ($P435)
  control_421:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P436, exception, "payload"
    .return ($P436)
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
