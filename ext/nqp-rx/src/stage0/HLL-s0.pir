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
    match = parsegrammar.'parse'(source, 'p'=>0, 'actions'=>parseactions, 'rxtrace'=>rxtrace)
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


.sub 'parse_name' :method
    .param string name

    # split name on ::
    .local pmc ns
    ns = split '::', name

    # move any leading sigil to the last item
    .local string sigil
    $S0 = ns[0]
    sigil = substr $S0, 0, 1
    $I0 = index '$@%&', sigil
    if $I0 < 0 goto sigil_done
    substr $S0, 0, 1, ''
    ns[0] = $S0
    $S0 = ns[-1]
    $S0 = concat sigil, $S0
    ns[-1] = $S0
  sigil_done:

    # remove any empty items from the list
    .local pmc ns_it
    ns_it = iter ns
    ns = new ['ResizablePMCArray']
  ns_loop:
    unless ns_it goto ns_done
    $S0 = shift ns_it
    unless $S0 > '' goto ns_loop
    push ns, $S0
    goto ns_loop
  ns_done:

    # return the result
    .return (ns)
.end
### .include 'src/cheats/hll-grammar.pir'
# Copyright (C) 2009, The Perl Foundation.

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
.sub "_block11"  :anon :subid("10_1271336377.56964")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 5
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
    $P344 = $P14()
.annotate "line", 1
    .return ($P344)
.end


.namespace []
.sub "" :load :init :subid("post105") :outer("10_1271336377.56964")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1271336377.56964" 
    .local pmc block
    set block, $P12
    $P345 = get_root_global ["parrot"], "P6metaclass"
    $P345."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block13"  :subid("11_1271336377.56964") :outer("10_1271336377.56964")
.annotate "line", 5
    .const 'Sub' $P334 = "103_1271336377.56964" 
    capture_lex $P334
    .const 'Sub' $P327 = "101_1271336377.56964" 
    capture_lex $P327
    .const 'Sub' $P314 = "98_1271336377.56964" 
    capture_lex $P314
    .const 'Sub' $P282 = "93_1271336377.56964" 
    capture_lex $P282
    .const 'Sub' $P276 = "91_1271336377.56964" 
    capture_lex $P276
    .const 'Sub' $P271 = "89_1271336377.56964" 
    capture_lex $P271
    .const 'Sub' $P265 = "87_1271336377.56964" 
    capture_lex $P265
    .const 'Sub' $P259 = "85_1271336377.56964" 
    capture_lex $P259
    .const 'Sub' $P254 = "83_1271336377.56964" 
    capture_lex $P254
    .const 'Sub' $P249 = "81_1271336377.56964" 
    capture_lex $P249
    .const 'Sub' $P244 = "79_1271336377.56964" 
    capture_lex $P244
    .const 'Sub' $P239 = "77_1271336377.56964" 
    capture_lex $P239
    .const 'Sub' $P234 = "75_1271336377.56964" 
    capture_lex $P234
    .const 'Sub' $P229 = "73_1271336377.56964" 
    capture_lex $P229
    .const 'Sub' $P224 = "71_1271336377.56964" 
    capture_lex $P224
    .const 'Sub' $P219 = "69_1271336377.56964" 
    capture_lex $P219
    .const 'Sub' $P208 = "65_1271336377.56964" 
    capture_lex $P208
    .const 'Sub' $P195 = "63_1271336377.56964" 
    capture_lex $P195
    .const 'Sub' $P183 = "61_1271336377.56964" 
    capture_lex $P183
    .const 'Sub' $P176 = "59_1271336377.56964" 
    capture_lex $P176
    .const 'Sub' $P167 = "57_1271336377.56964" 
    capture_lex $P167
    .const 'Sub' $P160 = "55_1271336377.56964" 
    capture_lex $P160
    .const 'Sub' $P151 = "53_1271336377.56964" 
    capture_lex $P151
    .const 'Sub' $P144 = "51_1271336377.56964" 
    capture_lex $P144
    .const 'Sub' $P135 = "49_1271336377.56964" 
    capture_lex $P135
    .const 'Sub' $P128 = "47_1271336377.56964" 
    capture_lex $P128
    .const 'Sub' $P121 = "45_1271336377.56964" 
    capture_lex $P121
    .const 'Sub' $P111 = "43_1271336377.56964" 
    capture_lex $P111
    .const 'Sub' $P103 = "41_1271336377.56964" 
    capture_lex $P103
    .const 'Sub' $P93 = "40_1271336377.56964" 
    capture_lex $P93
    .const 'Sub' $P87 = "38_1271336377.56964" 
    capture_lex $P87
    .const 'Sub' $P82 = "36_1271336377.56964" 
    capture_lex $P82
    .const 'Sub' $P74 = "34_1271336377.56964" 
    capture_lex $P74
    .const 'Sub' $P68 = "32_1271336377.56964" 
    capture_lex $P68
    .const 'Sub' $P62 = "30_1271336377.56964" 
    capture_lex $P62
    .const 'Sub' $P56 = "28_1271336377.56964" 
    capture_lex $P56
    .const 'Sub' $P23 = "14_1271336377.56964" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1271336377.56964" 
    capture_lex $P15
.annotate "line", 33
    .const 'Sub' $P334 = "103_1271336377.56964" 
    capture_lex $P334
.annotate "line", 5
    .return ($P334)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx16_tgt
    .local int rx16_pos
    .local int rx16_off
    .local int rx16_eos
    .local int rx16_rep
    .local pmc rx16_cur
    (rx16_cur, rx16_pos, rx16_tgt) = self."!cursor_start"()
    rx16_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx16_cur
    .local pmc match
    .lex "$/", match
    length rx16_eos, rx16_tgt
    set rx16_off, 0
    lt rx16_pos, 2, rx16_start
    sub rx16_off, rx16_pos, 1
    substr rx16_tgt, rx16_tgt, rx16_off
  rx16_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan19_done
    goto rxscan19_scan
  rxscan19_loop:
    ($P10) = rx16_cur."from"()
    inc $P10
    set rx16_pos, $P10
    ge rx16_pos, rx16_eos, rxscan19_done
  rxscan19_scan:
    set_addr $I10, rxscan19_loop
    rx16_cur."!mark_push"(0, rx16_pos, $I10)
  rxscan19_done:
  # rx subrule "ww" subtype=zerowidth negate=1
    rx16_cur."!cursor_pos"(rx16_pos)
    $P10 = rx16_cur."ww"()
    if $P10, rx16_fail
  # rx rxquantr20 ** 0..*
    set_addr $I22, rxquantr20_done
    rx16_cur."!mark_push"(0, rx16_pos, $I22)
  rxquantr20_loop:
  alt21_0:
    set_addr $I10, alt21_1
    rx16_cur."!mark_push"(0, rx16_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx16_pos, rx16_off
    find_not_cclass $I11, 32, rx16_tgt, $I10, rx16_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx16_fail
    add rx16_pos, rx16_off, $I11
    goto alt21_end
  alt21_1:
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
  alt21_end:
    (rx16_rep) = rx16_cur."!mark_commit"($I22)
    rx16_cur."!mark_push"(rx16_rep, rx16_pos, $I22)
    goto rxquantr20_loop
  rxquantr20_done:
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
.sub "!PREFIX__ws"  :subid("13_1271336377.56964") :method
.annotate "line", 5
    new $P18, "ResizablePMCArray"
    push $P18, ""
    .return ($P18)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx24_tgt
    .local int rx24_pos
    .local int rx24_off
    .local int rx24_eos
    .local int rx24_rep
    .local pmc rx24_cur
    (rx24_cur, rx24_pos, rx24_tgt) = self."!cursor_start"()
    rx24_cur."!cursor_debug"("START ", "termish")
    rx24_cur."!cursor_caparray"("postfixish", "prefixish")
    .lex unicode:"$\x{a2}", rx24_cur
    .local pmc match
    .lex "$/", match
    length rx24_eos, rx24_tgt
    set rx24_off, 0
    lt rx24_pos, 2, rx24_start
    sub rx24_off, rx24_pos, 1
    substr rx24_tgt, rx24_tgt, rx24_off
  rx24_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan27_done
    goto rxscan27_scan
  rxscan27_loop:
    ($P10) = rx24_cur."from"()
    inc $P10
    set rx24_pos, $P10
    ge rx24_pos, rx24_eos, rxscan27_done
  rxscan27_scan:
    set_addr $I10, rxscan27_loop
    rx24_cur."!mark_push"(0, rx24_pos, $I10)
  rxscan27_done:
.annotate "line", 8
  # rx rxquantr28 ** 0..*
    set_addr $I29, rxquantr28_done
    rx24_cur."!mark_push"(0, rx24_pos, $I29)
  rxquantr28_loop:
  # rx subrule "prefixish" subtype=capture negate=
    rx24_cur."!cursor_pos"(rx24_pos)
    $P10 = rx24_cur."prefixish"()
    unless $P10, rx24_fail
    rx24_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("prefixish")
    rx24_pos = $P10."pos"()
    (rx24_rep) = rx24_cur."!mark_commit"($I29)
    rx24_cur."!mark_push"(rx24_rep, rx24_pos, $I29)
    goto rxquantr28_loop
  rxquantr28_done:
.annotate "line", 9
  # rx subrule "term" subtype=capture negate=
    rx24_cur."!cursor_pos"(rx24_pos)
    $P10 = rx24_cur."term"()
    unless $P10, rx24_fail
    rx24_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx24_pos = $P10."pos"()
.annotate "line", 10
  # rx rxquantr30 ** 0..*
    set_addr $I31, rxquantr30_done
    rx24_cur."!mark_push"(0, rx24_pos, $I31)
  rxquantr30_loop:
  # rx subrule "postfixish" subtype=capture negate=
    rx24_cur."!cursor_pos"(rx24_pos)
    $P10 = rx24_cur."postfixish"()
    unless $P10, rx24_fail
    rx24_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postfixish")
    rx24_pos = $P10."pos"()
    (rx24_rep) = rx24_cur."!mark_commit"($I31)
    rx24_cur."!mark_push"(rx24_rep, rx24_pos, $I31)
    goto rxquantr30_loop
  rxquantr30_done:
.annotate "line", 7
  # rx pass
    rx24_cur."!cursor_pass"(rx24_pos, "termish")
    rx24_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx24_pos)
    .return (rx24_cur)
  rx24_fail:
.annotate "line", 5
    (rx24_rep, rx24_pos, $I10, $P10) = rx24_cur."!mark_fail"(0)
    lt rx24_pos, -1, rx24_done
    eq rx24_pos, -1, rx24_fail
    jump $I10
  rx24_done:
    rx24_cur."!cursor_fail"()
    rx24_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx24_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__termish"  :subid("15_1271336377.56964") :method
.annotate "line", 5
    new $P26, "ResizablePMCArray"
    push $P26, ""
    .return ($P26)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1271336377.56964") :method
.annotate "line", 13
    $P33 = self."!protoregex"("term")
    .return ($P33)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1271336377.56964") :method
.annotate "line", 13
    $P35 = self."!PREFIX__!protoregex"("term")
    .return ($P35)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1271336377.56964") :method
.annotate "line", 14
    $P37 = self."!protoregex"("infix")
    .return ($P37)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1271336377.56964") :method
.annotate "line", 14
    $P39 = self."!PREFIX__!protoregex"("infix")
    .return ($P39)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1271336377.56964") :method
.annotate "line", 15
    $P41 = self."!protoregex"("prefix")
    .return ($P41)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1271336377.56964") :method
.annotate "line", 15
    $P43 = self."!PREFIX__!protoregex"("prefix")
    .return ($P43)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1271336377.56964") :method
.annotate "line", 16
    $P45 = self."!protoregex"("postfix")
    .return ($P45)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1271336377.56964") :method
.annotate "line", 16
    $P47 = self."!PREFIX__!protoregex"("postfix")
    .return ($P47)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1271336377.56964") :method
.annotate "line", 17
    $P49 = self."!protoregex"("circumfix")
    .return ($P49)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1271336377.56964") :method
.annotate "line", 17
    $P51 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P51)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1271336377.56964") :method
.annotate "line", 18
    $P53 = self."!protoregex"("postcircumfix")
    .return ($P53)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1271336377.56964") :method
.annotate "line", 18
    $P55 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P55)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx57_tgt
    .local int rx57_pos
    .local int rx57_off
    .local int rx57_eos
    .local int rx57_rep
    .local pmc rx57_cur
    (rx57_cur, rx57_pos, rx57_tgt) = self."!cursor_start"()
    rx57_cur."!cursor_debug"("START ", "term:sym<circumfix>")
    .lex unicode:"$\x{a2}", rx57_cur
    .local pmc match
    .lex "$/", match
    length rx57_eos, rx57_tgt
    set rx57_off, 0
    lt rx57_pos, 2, rx57_start
    sub rx57_off, rx57_pos, 1
    substr rx57_tgt, rx57_tgt, rx57_off
  rx57_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan61_done
    goto rxscan61_scan
  rxscan61_loop:
    ($P10) = rx57_cur."from"()
    inc $P10
    set rx57_pos, $P10
    ge rx57_pos, rx57_eos, rxscan61_done
  rxscan61_scan:
    set_addr $I10, rxscan61_loop
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
  rxscan61_done:
.annotate "line", 20
  # rx subrule "circumfix" subtype=capture negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."circumfix"()
    unless $P10, rx57_fail
    rx57_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx57_pos = $P10."pos"()
  # rx pass
    rx57_cur."!cursor_pass"(rx57_pos, "term:sym<circumfix>")
    rx57_cur."!cursor_debug"("PASS  ", "term:sym<circumfix>", " at pos=", rx57_pos)
    .return (rx57_cur)
  rx57_fail:
.annotate "line", 5
    (rx57_rep, rx57_pos, $I10, $P10) = rx57_cur."!mark_fail"(0)
    lt rx57_pos, -1, rx57_done
    eq rx57_pos, -1, rx57_fail
    jump $I10
  rx57_done:
    rx57_cur."!cursor_fail"()
    rx57_cur."!cursor_debug"("FAIL  ", "term:sym<circumfix>")
    .return (rx57_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1271336377.56964") :method
.annotate "line", 5
    $P59 = self."!PREFIX__!subrule"("circumfix", "")
    new $P60, "ResizablePMCArray"
    push $P60, $P59
    .return ($P60)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx63_tgt
    .local int rx63_pos
    .local int rx63_off
    .local int rx63_eos
    .local int rx63_rep
    .local pmc rx63_cur
    (rx63_cur, rx63_pos, rx63_tgt) = self."!cursor_start"()
    rx63_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx63_cur
    .local pmc match
    .lex "$/", match
    length rx63_eos, rx63_tgt
    set rx63_off, 0
    lt rx63_pos, 2, rx63_start
    sub rx63_off, rx63_pos, 1
    substr rx63_tgt, rx63_tgt, rx63_off
  rx63_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan67_done
    goto rxscan67_scan
  rxscan67_loop:
    ($P10) = rx63_cur."from"()
    inc $P10
    set rx63_pos, $P10
    ge rx63_pos, rx63_eos, rxscan67_done
  rxscan67_scan:
    set_addr $I10, rxscan67_loop
    rx63_cur."!mark_push"(0, rx63_pos, $I10)
  rxscan67_done:
.annotate "line", 22
  # rx subrule "infix" subtype=capture negate=
    rx63_cur."!cursor_pos"(rx63_pos)
    $P10 = rx63_cur."infix"()
    unless $P10, rx63_fail
    rx63_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx63_pos = $P10."pos"()
  # rx pass
    rx63_cur."!cursor_pass"(rx63_pos, "infixish")
    rx63_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx63_pos)
    .return (rx63_cur)
  rx63_fail:
.annotate "line", 5
    (rx63_rep, rx63_pos, $I10, $P10) = rx63_cur."!mark_fail"(0)
    lt rx63_pos, -1, rx63_done
    eq rx63_pos, -1, rx63_fail
    jump $I10
  rx63_done:
    rx63_cur."!cursor_fail"()
    rx63_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx63_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infixish"  :subid("31_1271336377.56964") :method
.annotate "line", 5
    $P65 = self."!PREFIX__!subrule"("OPER=infix", "")
    new $P66, "ResizablePMCArray"
    push $P66, $P65
    .return ($P66)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx69_tgt
    .local int rx69_pos
    .local int rx69_off
    .local int rx69_eos
    .local int rx69_rep
    .local pmc rx69_cur
    (rx69_cur, rx69_pos, rx69_tgt) = self."!cursor_start"()
    rx69_cur."!cursor_debug"("START ", "prefixish")
    .lex unicode:"$\x{a2}", rx69_cur
    .local pmc match
    .lex "$/", match
    length rx69_eos, rx69_tgt
    set rx69_off, 0
    lt rx69_pos, 2, rx69_start
    sub rx69_off, rx69_pos, 1
    substr rx69_tgt, rx69_tgt, rx69_off
  rx69_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan73_done
    goto rxscan73_scan
  rxscan73_loop:
    ($P10) = rx69_cur."from"()
    inc $P10
    set rx69_pos, $P10
    ge rx69_pos, rx69_eos, rxscan73_done
  rxscan73_scan:
    set_addr $I10, rxscan73_loop
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  rxscan73_done:
.annotate "line", 23
  # rx subrule "prefix" subtype=capture negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."prefix"()
    unless $P10, rx69_fail
    rx69_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=prefix")
    rx69_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx pass
    rx69_cur."!cursor_pass"(rx69_pos, "prefixish")
    rx69_cur."!cursor_debug"("PASS  ", "prefixish", " at pos=", rx69_pos)
    .return (rx69_cur)
  rx69_fail:
.annotate "line", 5
    (rx69_rep, rx69_pos, $I10, $P10) = rx69_cur."!mark_fail"(0)
    lt rx69_pos, -1, rx69_done
    eq rx69_pos, -1, rx69_fail
    jump $I10
  rx69_done:
    rx69_cur."!cursor_fail"()
    rx69_cur."!cursor_debug"("FAIL  ", "prefixish")
    .return (rx69_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefixish"  :subid("33_1271336377.56964") :method
.annotate "line", 5
    $P71 = self."!PREFIX__!subrule"("OPER=prefix", "")
    new $P72, "ResizablePMCArray"
    push $P72, $P71
    .return ($P72)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx75_tgt
    .local int rx75_pos
    .local int rx75_off
    .local int rx75_eos
    .local int rx75_rep
    .local pmc rx75_cur
    (rx75_cur, rx75_pos, rx75_tgt) = self."!cursor_start"()
    rx75_cur."!cursor_debug"("START ", "postfixish")
    .lex unicode:"$\x{a2}", rx75_cur
    .local pmc match
    .lex "$/", match
    length rx75_eos, rx75_tgt
    set rx75_off, 0
    lt rx75_pos, 2, rx75_start
    sub rx75_off, rx75_pos, 1
    substr rx75_tgt, rx75_tgt, rx75_off
  rx75_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan80_done
    goto rxscan80_scan
  rxscan80_loop:
    ($P10) = rx75_cur."from"()
    inc $P10
    set rx75_pos, $P10
    ge rx75_pos, rx75_eos, rxscan80_done
  rxscan80_scan:
    set_addr $I10, rxscan80_loop
    rx75_cur."!mark_push"(0, rx75_pos, $I10)
  rxscan80_done:
  alt81_0:
.annotate "line", 24
    set_addr $I10, alt81_1
    rx75_cur."!mark_push"(0, rx75_pos, $I10)
.annotate "line", 25
  # rx subrule "postfix" subtype=capture negate=
    rx75_cur."!cursor_pos"(rx75_pos)
    $P10 = rx75_cur."postfix"()
    unless $P10, rx75_fail
    rx75_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postfix")
    rx75_pos = $P10."pos"()
    goto alt81_end
  alt81_1:
.annotate "line", 26
  # rx subrule "postcircumfix" subtype=capture negate=
    rx75_cur."!cursor_pos"(rx75_pos)
    $P10 = rx75_cur."postcircumfix"()
    unless $P10, rx75_fail
    rx75_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postcircumfix")
    rx75_pos = $P10."pos"()
  alt81_end:
.annotate "line", 24
  # rx pass
    rx75_cur."!cursor_pass"(rx75_pos, "postfixish")
    rx75_cur."!cursor_debug"("PASS  ", "postfixish", " at pos=", rx75_pos)
    .return (rx75_cur)
  rx75_fail:
.annotate "line", 5
    (rx75_rep, rx75_pos, $I10, $P10) = rx75_cur."!mark_fail"(0)
    lt rx75_pos, -1, rx75_done
    eq rx75_pos, -1, rx75_fail
    jump $I10
  rx75_done:
    rx75_cur."!cursor_fail"()
    rx75_cur."!cursor_debug"("FAIL  ", "postfixish")
    .return (rx75_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfixish"  :subid("35_1271336377.56964") :method
.annotate "line", 5
    $P77 = self."!PREFIX__!subrule"("OPER=postcircumfix", "")
    $P78 = self."!PREFIX__!subrule"("OPER=postfix", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P77
    push $P79, $P78
    .return ($P79)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm"  :subid("36_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx83_tgt
    .local int rx83_pos
    .local int rx83_off
    .local int rx83_eos
    .local int rx83_rep
    .local pmc rx83_cur
    (rx83_cur, rx83_pos, rx83_tgt) = self."!cursor_start"()
    rx83_cur."!cursor_debug"("START ", "nullterm")
    .lex unicode:"$\x{a2}", rx83_cur
    .local pmc match
    .lex "$/", match
    length rx83_eos, rx83_tgt
    set rx83_off, 0
    lt rx83_pos, 2, rx83_start
    sub rx83_off, rx83_pos, 1
    substr rx83_tgt, rx83_tgt, rx83_off
  rx83_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan86_done
    goto rxscan86_scan
  rxscan86_loop:
    ($P10) = rx83_cur."from"()
    inc $P10
    set rx83_pos, $P10
    ge rx83_pos, rx83_eos, rxscan86_done
  rxscan86_scan:
    set_addr $I10, rxscan86_loop
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  rxscan86_done:
.annotate "line", 29
  # rx pass
    rx83_cur."!cursor_pass"(rx83_pos, "nullterm")
    rx83_cur."!cursor_debug"("PASS  ", "nullterm", " at pos=", rx83_pos)
    .return (rx83_cur)
  rx83_fail:
.annotate "line", 5
    (rx83_rep, rx83_pos, $I10, $P10) = rx83_cur."!mark_fail"(0)
    lt rx83_pos, -1, rx83_done
    eq rx83_pos, -1, rx83_fail
    jump $I10
  rx83_done:
    rx83_cur."!cursor_fail"()
    rx83_cur."!cursor_debug"("FAIL  ", "nullterm")
    .return (rx83_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm"  :subid("37_1271336377.56964") :method
.annotate "line", 5
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm_alt"  :subid("38_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 5
    .local string rx88_tgt
    .local int rx88_pos
    .local int rx88_off
    .local int rx88_eos
    .local int rx88_rep
    .local pmc rx88_cur
    (rx88_cur, rx88_pos, rx88_tgt) = self."!cursor_start"()
    rx88_cur."!cursor_debug"("START ", "nullterm_alt")
    .lex unicode:"$\x{a2}", rx88_cur
    .local pmc match
    .lex "$/", match
    length rx88_eos, rx88_tgt
    set rx88_off, 0
    lt rx88_pos, 2, rx88_start
    sub rx88_off, rx88_pos, 1
    substr rx88_tgt, rx88_tgt, rx88_off
  rx88_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan92_done
    goto rxscan92_scan
  rxscan92_loop:
    ($P10) = rx88_cur."from"()
    inc $P10
    set rx88_pos, $P10
    ge rx88_pos, rx88_eos, rxscan92_done
  rxscan92_scan:
    set_addr $I10, rxscan92_loop
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  rxscan92_done:
.annotate "line", 30
  # rx subrule "nullterm" subtype=capture negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."nullterm"()
    unless $P10, rx88_fail
    rx88_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx88_pos = $P10."pos"()
  # rx pass
    rx88_cur."!cursor_pass"(rx88_pos, "nullterm_alt")
    rx88_cur."!cursor_debug"("PASS  ", "nullterm_alt", " at pos=", rx88_pos)
    .return (rx88_cur)
  rx88_fail:
.annotate "line", 5
    (rx88_rep, rx88_pos, $I10, $P10) = rx88_cur."!mark_fail"(0)
    lt rx88_pos, -1, rx88_done
    eq rx88_pos, -1, rx88_fail
    jump $I10
  rx88_done:
    rx88_cur."!cursor_fail"()
    rx88_cur."!cursor_debug"("FAIL  ", "nullterm_alt")
    .return (rx88_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm_alt"  :subid("39_1271336377.56964") :method
.annotate "line", 5
    $P90 = self."!PREFIX__!subrule"("term", "")
    new $P91, "ResizablePMCArray"
    push $P91, $P90
    .return ($P91)
.end


.namespace ["HLL";"Grammar"]
.sub "nulltermish"  :subid("40_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "self", self
    find_lex $P98, "self"
    $P99 = $P98."termish"()
    unless $P99, unless_97
    set $P96, $P99
    goto unless_97_end
  unless_97:
    find_lex $P100, "self"
    $P101 = $P100."nullterm_alt"()
    set $P96, $P101
  unless_97_end:
    .return ($P96)
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("41_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx104_tgt
    .local int rx104_pos
    .local int rx104_off
    .local int rx104_eos
    .local int rx104_rep
    .local pmc rx104_cur
    (rx104_cur, rx104_pos, rx104_tgt) = self."!cursor_start"()
    rx104_cur."!cursor_debug"("START ", "quote_delimited")
    rx104_cur."!cursor_caparray"("quote_atom")
    .lex unicode:"$\x{a2}", rx104_cur
    .local pmc match
    .lex "$/", match
    length rx104_eos, rx104_tgt
    set rx104_off, 0
    lt rx104_pos, 2, rx104_start
    sub rx104_off, rx104_pos, 1
    substr rx104_tgt, rx104_tgt, rx104_off
  rx104_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan108_done
    goto rxscan108_scan
  rxscan108_loop:
    ($P10) = rx104_cur."from"()
    inc $P10
    set rx104_pos, $P10
    ge rx104_pos, rx104_eos, rxscan108_done
  rxscan108_scan:
    set_addr $I10, rxscan108_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  rxscan108_done:
.annotate "line", 37
  # rx subrule "starter" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."starter"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("starter")
    rx104_pos = $P10."pos"()
  # rx rxquantr109 ** 0..*
    set_addr $I110, rxquantr109_done
    rx104_cur."!mark_push"(0, rx104_pos, $I110)
  rxquantr109_loop:
  # rx subrule "quote_atom" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."quote_atom"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_atom")
    rx104_pos = $P10."pos"()
    (rx104_rep) = rx104_cur."!mark_commit"($I110)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I110)
    goto rxquantr109_loop
  rxquantr109_done:
  # rx subrule "stopper" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."stopper"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx104_pos = $P10."pos"()
.annotate "line", 36
  # rx pass
    rx104_cur."!cursor_pass"(rx104_pos, "quote_delimited")
    rx104_cur."!cursor_debug"("PASS  ", "quote_delimited", " at pos=", rx104_pos)
    .return (rx104_cur)
  rx104_fail:
.annotate "line", 33
    (rx104_rep, rx104_pos, $I10, $P10) = rx104_cur."!mark_fail"(0)
    lt rx104_pos, -1, rx104_done
    eq rx104_pos, -1, rx104_fail
    jump $I10
  rx104_done:
    rx104_cur."!cursor_fail"()
    rx104_cur."!cursor_debug"("FAIL  ", "quote_delimited")
    .return (rx104_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_delimited"  :subid("42_1271336377.56964") :method
.annotate "line", 33
    $P106 = self."!PREFIX__!subrule"("starter", "")
    new $P107, "ResizablePMCArray"
    push $P107, $P106
    .return ($P107)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("43_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx112_tgt
    .local int rx112_pos
    .local int rx112_off
    .local int rx112_eos
    .local int rx112_rep
    .local pmc rx112_cur
    (rx112_cur, rx112_pos, rx112_tgt) = self."!cursor_start"()
    rx112_cur."!cursor_debug"("START ", "quote_atom")
    .lex unicode:"$\x{a2}", rx112_cur
    .local pmc match
    .lex "$/", match
    length rx112_eos, rx112_tgt
    set rx112_off, 0
    lt rx112_pos, 2, rx112_start
    sub rx112_off, rx112_pos, 1
    substr rx112_tgt, rx112_tgt, rx112_off
  rx112_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan115_done
    goto rxscan115_scan
  rxscan115_loop:
    ($P10) = rx112_cur."from"()
    inc $P10
    set rx112_pos, $P10
    ge rx112_pos, rx112_eos, rxscan115_done
  rxscan115_scan:
    set_addr $I10, rxscan115_loop
    rx112_cur."!mark_push"(0, rx112_pos, $I10)
  rxscan115_done:
.annotate "line", 41
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx112_cur."!cursor_pos"(rx112_pos)
    $P10 = rx112_cur."stopper"()
    if $P10, rx112_fail
  alt116_0:
.annotate "line", 42
    set_addr $I10, alt116_1
    rx112_cur."!mark_push"(0, rx112_pos, $I10)
.annotate "line", 43
  # rx subrule "quote_escape" subtype=capture negate=
    rx112_cur."!cursor_pos"(rx112_pos)
    $P10 = rx112_cur."quote_escape"()
    unless $P10, rx112_fail
    rx112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_escape")
    rx112_pos = $P10."pos"()
    goto alt116_end
  alt116_1:
.annotate "line", 44
  # rx rxquantr117 ** 1..*
    set_addr $I120, rxquantr117_done
    rx112_cur."!mark_push"(0, -1, $I120)
  rxquantr117_loop:
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx112_cur."!cursor_pos"(rx112_pos)
    $P10 = rx112_cur."stopper"()
    if $P10, rx112_fail
  # rx subrule "quote_escape" subtype=zerowidth negate=1
    rx112_cur."!cursor_pos"(rx112_pos)
    $P10 = rx112_cur."quote_escape"()
    if $P10, rx112_fail
  # rx charclass .
    ge rx112_pos, rx112_eos, rx112_fail
    inc rx112_pos
    (rx112_rep) = rx112_cur."!mark_commit"($I120)
    rx112_cur."!mark_push"(rx112_rep, rx112_pos, $I120)
    goto rxquantr117_loop
  rxquantr117_done:
  alt116_end:
.annotate "line", 40
  # rx pass
    rx112_cur."!cursor_pass"(rx112_pos, "quote_atom")
    rx112_cur."!cursor_debug"("PASS  ", "quote_atom", " at pos=", rx112_pos)
    .return (rx112_cur)
  rx112_fail:
.annotate "line", 33
    (rx112_rep, rx112_pos, $I10, $P10) = rx112_cur."!mark_fail"(0)
    lt rx112_pos, -1, rx112_done
    eq rx112_pos, -1, rx112_fail
    jump $I10
  rx112_done:
    rx112_cur."!cursor_fail"()
    rx112_cur."!cursor_debug"("FAIL  ", "quote_atom")
    .return (rx112_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_atom"  :subid("44_1271336377.56964") :method
.annotate "line", 33
    new $P114, "ResizablePMCArray"
    push $P114, ""
    .return ($P114)
.end


.namespace ["HLL";"Grammar"]
.sub "decint"  :subid("45_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx122_tgt
    .local int rx122_pos
    .local int rx122_off
    .local int rx122_eos
    .local int rx122_rep
    .local pmc rx122_cur
    (rx122_cur, rx122_pos, rx122_tgt) = self."!cursor_start"()
    rx122_cur."!cursor_debug"("START ", "decint")
    .lex unicode:"$\x{a2}", rx122_cur
    .local pmc match
    .lex "$/", match
    length rx122_eos, rx122_tgt
    set rx122_off, 0
    lt rx122_pos, 2, rx122_start
    sub rx122_off, rx122_pos, 1
    substr rx122_tgt, rx122_tgt, rx122_off
  rx122_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan125_done
    goto rxscan125_scan
  rxscan125_loop:
    ($P10) = rx122_cur."from"()
    inc $P10
    set rx122_pos, $P10
    ge rx122_pos, rx122_eos, rxscan125_done
  rxscan125_scan:
    set_addr $I10, rxscan125_loop
    rx122_cur."!mark_push"(0, rx122_pos, $I10)
  rxscan125_done:
.annotate "line", 48
  # rx rxquantr126 ** 1..*
    set_addr $I127, rxquantr126_done
    rx122_cur."!mark_push"(0, -1, $I127)
  rxquantr126_loop:
  # rx charclass_q d r 1..-1
    sub $I10, rx122_pos, rx122_off
    find_not_cclass $I11, 8, rx122_tgt, $I10, rx122_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx122_fail
    add rx122_pos, rx122_off, $I11
    (rx122_rep) = rx122_cur."!mark_commit"($I127)
    rx122_cur."!mark_push"(rx122_rep, rx122_pos, $I127)
  # rx literal  "_"
    add $I11, rx122_pos, 1
    gt $I11, rx122_eos, rx122_fail
    sub $I11, rx122_pos, rx122_off
    substr $S10, rx122_tgt, $I11, 1
    ne $S10, "_", rx122_fail
    add rx122_pos, 1
    goto rxquantr126_loop
  rxquantr126_done:
  # rx pass
    rx122_cur."!cursor_pass"(rx122_pos, "decint")
    rx122_cur."!cursor_debug"("PASS  ", "decint", " at pos=", rx122_pos)
    .return (rx122_cur)
  rx122_fail:
.annotate "line", 33
    (rx122_rep, rx122_pos, $I10, $P10) = rx122_cur."!mark_fail"(0)
    lt rx122_pos, -1, rx122_done
    eq rx122_pos, -1, rx122_fail
    jump $I10
  rx122_done:
    rx122_cur."!cursor_fail"()
    rx122_cur."!cursor_debug"("FAIL  ", "decint")
    .return (rx122_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decint"  :subid("46_1271336377.56964") :method
.annotate "line", 33
    new $P124, "ResizablePMCArray"
    push $P124, ""
    .return ($P124)
.end


.namespace ["HLL";"Grammar"]
.sub "decints"  :subid("47_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx129_tgt
    .local int rx129_pos
    .local int rx129_off
    .local int rx129_eos
    .local int rx129_rep
    .local pmc rx129_cur
    (rx129_cur, rx129_pos, rx129_tgt) = self."!cursor_start"()
    rx129_cur."!cursor_debug"("START ", "decints")
    rx129_cur."!cursor_caparray"("decint")
    .lex unicode:"$\x{a2}", rx129_cur
    .local pmc match
    .lex "$/", match
    length rx129_eos, rx129_tgt
    set rx129_off, 0
    lt rx129_pos, 2, rx129_start
    sub rx129_off, rx129_pos, 1
    substr rx129_tgt, rx129_tgt, rx129_off
  rx129_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan132_done
    goto rxscan132_scan
  rxscan132_loop:
    ($P10) = rx129_cur."from"()
    inc $P10
    set rx129_pos, $P10
    ge rx129_pos, rx129_eos, rxscan132_done
  rxscan132_scan:
    set_addr $I10, rxscan132_loop
    rx129_cur."!mark_push"(0, rx129_pos, $I10)
  rxscan132_done:
.annotate "line", 49
  # rx rxquantr133 ** 1..*
    set_addr $I134, rxquantr133_done
    rx129_cur."!mark_push"(0, -1, $I134)
  rxquantr133_loop:
  # rx subrule "ws" subtype=method negate=
    rx129_cur."!cursor_pos"(rx129_pos)
    $P10 = rx129_cur."ws"()
    unless $P10, rx129_fail
    rx129_pos = $P10."pos"()
  # rx subrule "decint" subtype=capture negate=
    rx129_cur."!cursor_pos"(rx129_pos)
    $P10 = rx129_cur."decint"()
    unless $P10, rx129_fail
    rx129_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    rx129_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx129_cur."!cursor_pos"(rx129_pos)
    $P10 = rx129_cur."ws"()
    unless $P10, rx129_fail
    rx129_pos = $P10."pos"()
    (rx129_rep) = rx129_cur."!mark_commit"($I134)
    rx129_cur."!mark_push"(rx129_rep, rx129_pos, $I134)
  # rx literal  ","
    add $I11, rx129_pos, 1
    gt $I11, rx129_eos, rx129_fail
    sub $I11, rx129_pos, rx129_off
    substr $S10, rx129_tgt, $I11, 1
    ne $S10, ",", rx129_fail
    add rx129_pos, 1
    goto rxquantr133_loop
  rxquantr133_done:
  # rx pass
    rx129_cur."!cursor_pass"(rx129_pos, "decints")
    rx129_cur."!cursor_debug"("PASS  ", "decints", " at pos=", rx129_pos)
    .return (rx129_cur)
  rx129_fail:
.annotate "line", 33
    (rx129_rep, rx129_pos, $I10, $P10) = rx129_cur."!mark_fail"(0)
    lt rx129_pos, -1, rx129_done
    eq rx129_pos, -1, rx129_fail
    jump $I10
  rx129_done:
    rx129_cur."!cursor_fail"()
    rx129_cur."!cursor_debug"("FAIL  ", "decints")
    .return (rx129_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decints"  :subid("48_1271336377.56964") :method
.annotate "line", 33
    new $P131, "ResizablePMCArray"
    push $P131, ""
    .return ($P131)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("49_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx136_tgt
    .local int rx136_pos
    .local int rx136_off
    .local int rx136_eos
    .local int rx136_rep
    .local pmc rx136_cur
    (rx136_cur, rx136_pos, rx136_tgt) = self."!cursor_start"()
    rx136_cur."!cursor_debug"("START ", "hexint")
    .lex unicode:"$\x{a2}", rx136_cur
    .local pmc match
    .lex "$/", match
    length rx136_eos, rx136_tgt
    set rx136_off, 0
    lt rx136_pos, 2, rx136_start
    sub rx136_off, rx136_pos, 1
    substr rx136_tgt, rx136_tgt, rx136_off
  rx136_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan139_done
    goto rxscan139_scan
  rxscan139_loop:
    ($P10) = rx136_cur."from"()
    inc $P10
    set rx136_pos, $P10
    ge rx136_pos, rx136_eos, rxscan139_done
  rxscan139_scan:
    set_addr $I10, rxscan139_loop
    rx136_cur."!mark_push"(0, rx136_pos, $I10)
  rxscan139_done:
.annotate "line", 51
  # rx rxquantr140 ** 1..*
    set_addr $I143, rxquantr140_done
    rx136_cur."!mark_push"(0, -1, $I143)
  rxquantr140_loop:
  # rx rxquantr141 ** 1..*
    set_addr $I142, rxquantr141_done
    rx136_cur."!mark_push"(0, -1, $I142)
  rxquantr141_loop:
  # rx enumcharlist negate=0 
    ge rx136_pos, rx136_eos, rx136_fail
    sub $I10, rx136_pos, rx136_off
    substr $S10, rx136_tgt, $I10, 1
    index $I11, "0123456789abcdefABCDEF", $S10
    lt $I11, 0, rx136_fail
    inc rx136_pos
    (rx136_rep) = rx136_cur."!mark_commit"($I142)
    rx136_cur."!mark_push"(rx136_rep, rx136_pos, $I142)
    goto rxquantr141_loop
  rxquantr141_done:
    (rx136_rep) = rx136_cur."!mark_commit"($I143)
    rx136_cur."!mark_push"(rx136_rep, rx136_pos, $I143)
  # rx literal  "_"
    add $I11, rx136_pos, 1
    gt $I11, rx136_eos, rx136_fail
    sub $I11, rx136_pos, rx136_off
    substr $S10, rx136_tgt, $I11, 1
    ne $S10, "_", rx136_fail
    add rx136_pos, 1
    goto rxquantr140_loop
  rxquantr140_done:
  # rx pass
    rx136_cur."!cursor_pass"(rx136_pos, "hexint")
    rx136_cur."!cursor_debug"("PASS  ", "hexint", " at pos=", rx136_pos)
    .return (rx136_cur)
  rx136_fail:
.annotate "line", 33
    (rx136_rep, rx136_pos, $I10, $P10) = rx136_cur."!mark_fail"(0)
    lt rx136_pos, -1, rx136_done
    eq rx136_pos, -1, rx136_fail
    jump $I10
  rx136_done:
    rx136_cur."!cursor_fail"()
    rx136_cur."!cursor_debug"("FAIL  ", "hexint")
    .return (rx136_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexint"  :subid("50_1271336377.56964") :method
.annotate "line", 33
    new $P138, "ResizablePMCArray"
    push $P138, ""
    .return ($P138)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("51_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx145_tgt
    .local int rx145_pos
    .local int rx145_off
    .local int rx145_eos
    .local int rx145_rep
    .local pmc rx145_cur
    (rx145_cur, rx145_pos, rx145_tgt) = self."!cursor_start"()
    rx145_cur."!cursor_debug"("START ", "hexints")
    rx145_cur."!cursor_caparray"("hexint")
    .lex unicode:"$\x{a2}", rx145_cur
    .local pmc match
    .lex "$/", match
    length rx145_eos, rx145_tgt
    set rx145_off, 0
    lt rx145_pos, 2, rx145_start
    sub rx145_off, rx145_pos, 1
    substr rx145_tgt, rx145_tgt, rx145_off
  rx145_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan148_done
    goto rxscan148_scan
  rxscan148_loop:
    ($P10) = rx145_cur."from"()
    inc $P10
    set rx145_pos, $P10
    ge rx145_pos, rx145_eos, rxscan148_done
  rxscan148_scan:
    set_addr $I10, rxscan148_loop
    rx145_cur."!mark_push"(0, rx145_pos, $I10)
  rxscan148_done:
.annotate "line", 52
  # rx rxquantr149 ** 1..*
    set_addr $I150, rxquantr149_done
    rx145_cur."!mark_push"(0, -1, $I150)
  rxquantr149_loop:
  # rx subrule "ws" subtype=method negate=
    rx145_cur."!cursor_pos"(rx145_pos)
    $P10 = rx145_cur."ws"()
    unless $P10, rx145_fail
    rx145_pos = $P10."pos"()
  # rx subrule "hexint" subtype=capture negate=
    rx145_cur."!cursor_pos"(rx145_pos)
    $P10 = rx145_cur."hexint"()
    unless $P10, rx145_fail
    rx145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx145_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx145_cur."!cursor_pos"(rx145_pos)
    $P10 = rx145_cur."ws"()
    unless $P10, rx145_fail
    rx145_pos = $P10."pos"()
    (rx145_rep) = rx145_cur."!mark_commit"($I150)
    rx145_cur."!mark_push"(rx145_rep, rx145_pos, $I150)
  # rx literal  ","
    add $I11, rx145_pos, 1
    gt $I11, rx145_eos, rx145_fail
    sub $I11, rx145_pos, rx145_off
    substr $S10, rx145_tgt, $I11, 1
    ne $S10, ",", rx145_fail
    add rx145_pos, 1
    goto rxquantr149_loop
  rxquantr149_done:
  # rx pass
    rx145_cur."!cursor_pass"(rx145_pos, "hexints")
    rx145_cur."!cursor_debug"("PASS  ", "hexints", " at pos=", rx145_pos)
    .return (rx145_cur)
  rx145_fail:
.annotate "line", 33
    (rx145_rep, rx145_pos, $I10, $P10) = rx145_cur."!mark_fail"(0)
    lt rx145_pos, -1, rx145_done
    eq rx145_pos, -1, rx145_fail
    jump $I10
  rx145_done:
    rx145_cur."!cursor_fail"()
    rx145_cur."!cursor_debug"("FAIL  ", "hexints")
    .return (rx145_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("52_1271336377.56964") :method
.annotate "line", 33
    new $P147, "ResizablePMCArray"
    push $P147, ""
    .return ($P147)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("53_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx152_tgt
    .local int rx152_pos
    .local int rx152_off
    .local int rx152_eos
    .local int rx152_rep
    .local pmc rx152_cur
    (rx152_cur, rx152_pos, rx152_tgt) = self."!cursor_start"()
    rx152_cur."!cursor_debug"("START ", "octint")
    .lex unicode:"$\x{a2}", rx152_cur
    .local pmc match
    .lex "$/", match
    length rx152_eos, rx152_tgt
    set rx152_off, 0
    lt rx152_pos, 2, rx152_start
    sub rx152_off, rx152_pos, 1
    substr rx152_tgt, rx152_tgt, rx152_off
  rx152_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan155_done
    goto rxscan155_scan
  rxscan155_loop:
    ($P10) = rx152_cur."from"()
    inc $P10
    set rx152_pos, $P10
    ge rx152_pos, rx152_eos, rxscan155_done
  rxscan155_scan:
    set_addr $I10, rxscan155_loop
    rx152_cur."!mark_push"(0, rx152_pos, $I10)
  rxscan155_done:
.annotate "line", 54
  # rx rxquantr156 ** 1..*
    set_addr $I159, rxquantr156_done
    rx152_cur."!mark_push"(0, -1, $I159)
  rxquantr156_loop:
  # rx rxquantr157 ** 1..*
    set_addr $I158, rxquantr157_done
    rx152_cur."!mark_push"(0, -1, $I158)
  rxquantr157_loop:
  # rx enumcharlist negate=0 
    ge rx152_pos, rx152_eos, rx152_fail
    sub $I10, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rx152_fail
    inc rx152_pos
    (rx152_rep) = rx152_cur."!mark_commit"($I158)
    rx152_cur."!mark_push"(rx152_rep, rx152_pos, $I158)
    goto rxquantr157_loop
  rxquantr157_done:
    (rx152_rep) = rx152_cur."!mark_commit"($I159)
    rx152_cur."!mark_push"(rx152_rep, rx152_pos, $I159)
  # rx literal  "_"
    add $I11, rx152_pos, 1
    gt $I11, rx152_eos, rx152_fail
    sub $I11, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I11, 1
    ne $S10, "_", rx152_fail
    add rx152_pos, 1
    goto rxquantr156_loop
  rxquantr156_done:
  # rx pass
    rx152_cur."!cursor_pass"(rx152_pos, "octint")
    rx152_cur."!cursor_debug"("PASS  ", "octint", " at pos=", rx152_pos)
    .return (rx152_cur)
  rx152_fail:
.annotate "line", 33
    (rx152_rep, rx152_pos, $I10, $P10) = rx152_cur."!mark_fail"(0)
    lt rx152_pos, -1, rx152_done
    eq rx152_pos, -1, rx152_fail
    jump $I10
  rx152_done:
    rx152_cur."!cursor_fail"()
    rx152_cur."!cursor_debug"("FAIL  ", "octint")
    .return (rx152_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octint"  :subid("54_1271336377.56964") :method
.annotate "line", 33
    new $P154, "ResizablePMCArray"
    push $P154, ""
    .return ($P154)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("55_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx161_tgt
    .local int rx161_pos
    .local int rx161_off
    .local int rx161_eos
    .local int rx161_rep
    .local pmc rx161_cur
    (rx161_cur, rx161_pos, rx161_tgt) = self."!cursor_start"()
    rx161_cur."!cursor_debug"("START ", "octints")
    rx161_cur."!cursor_caparray"("octint")
    .lex unicode:"$\x{a2}", rx161_cur
    .local pmc match
    .lex "$/", match
    length rx161_eos, rx161_tgt
    set rx161_off, 0
    lt rx161_pos, 2, rx161_start
    sub rx161_off, rx161_pos, 1
    substr rx161_tgt, rx161_tgt, rx161_off
  rx161_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan164_done
    goto rxscan164_scan
  rxscan164_loop:
    ($P10) = rx161_cur."from"()
    inc $P10
    set rx161_pos, $P10
    ge rx161_pos, rx161_eos, rxscan164_done
  rxscan164_scan:
    set_addr $I10, rxscan164_loop
    rx161_cur."!mark_push"(0, rx161_pos, $I10)
  rxscan164_done:
.annotate "line", 55
  # rx rxquantr165 ** 1..*
    set_addr $I166, rxquantr165_done
    rx161_cur."!mark_push"(0, -1, $I166)
  rxquantr165_loop:
  # rx subrule "ws" subtype=method negate=
    rx161_cur."!cursor_pos"(rx161_pos)
    $P10 = rx161_cur."ws"()
    unless $P10, rx161_fail
    rx161_pos = $P10."pos"()
  # rx subrule "octint" subtype=capture negate=
    rx161_cur."!cursor_pos"(rx161_pos)
    $P10 = rx161_cur."octint"()
    unless $P10, rx161_fail
    rx161_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx161_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx161_cur."!cursor_pos"(rx161_pos)
    $P10 = rx161_cur."ws"()
    unless $P10, rx161_fail
    rx161_pos = $P10."pos"()
    (rx161_rep) = rx161_cur."!mark_commit"($I166)
    rx161_cur."!mark_push"(rx161_rep, rx161_pos, $I166)
  # rx literal  ","
    add $I11, rx161_pos, 1
    gt $I11, rx161_eos, rx161_fail
    sub $I11, rx161_pos, rx161_off
    substr $S10, rx161_tgt, $I11, 1
    ne $S10, ",", rx161_fail
    add rx161_pos, 1
    goto rxquantr165_loop
  rxquantr165_done:
  # rx pass
    rx161_cur."!cursor_pass"(rx161_pos, "octints")
    rx161_cur."!cursor_debug"("PASS  ", "octints", " at pos=", rx161_pos)
    .return (rx161_cur)
  rx161_fail:
.annotate "line", 33
    (rx161_rep, rx161_pos, $I10, $P10) = rx161_cur."!mark_fail"(0)
    lt rx161_pos, -1, rx161_done
    eq rx161_pos, -1, rx161_fail
    jump $I10
  rx161_done:
    rx161_cur."!cursor_fail"()
    rx161_cur."!cursor_debug"("FAIL  ", "octints")
    .return (rx161_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octints"  :subid("56_1271336377.56964") :method
.annotate "line", 33
    new $P163, "ResizablePMCArray"
    push $P163, ""
    .return ($P163)
.end


.namespace ["HLL";"Grammar"]
.sub "binint"  :subid("57_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx168_tgt
    .local int rx168_pos
    .local int rx168_off
    .local int rx168_eos
    .local int rx168_rep
    .local pmc rx168_cur
    (rx168_cur, rx168_pos, rx168_tgt) = self."!cursor_start"()
    rx168_cur."!cursor_debug"("START ", "binint")
    .lex unicode:"$\x{a2}", rx168_cur
    .local pmc match
    .lex "$/", match
    length rx168_eos, rx168_tgt
    set rx168_off, 0
    lt rx168_pos, 2, rx168_start
    sub rx168_off, rx168_pos, 1
    substr rx168_tgt, rx168_tgt, rx168_off
  rx168_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan171_done
    goto rxscan171_scan
  rxscan171_loop:
    ($P10) = rx168_cur."from"()
    inc $P10
    set rx168_pos, $P10
    ge rx168_pos, rx168_eos, rxscan171_done
  rxscan171_scan:
    set_addr $I10, rxscan171_loop
    rx168_cur."!mark_push"(0, rx168_pos, $I10)
  rxscan171_done:
.annotate "line", 57
  # rx rxquantr172 ** 1..*
    set_addr $I175, rxquantr172_done
    rx168_cur."!mark_push"(0, -1, $I175)
  rxquantr172_loop:
  # rx rxquantr173 ** 1..*
    set_addr $I174, rxquantr173_done
    rx168_cur."!mark_push"(0, -1, $I174)
  rxquantr173_loop:
  # rx enumcharlist negate=0 
    ge rx168_pos, rx168_eos, rx168_fail
    sub $I10, rx168_pos, rx168_off
    substr $S10, rx168_tgt, $I10, 1
    index $I11, "01", $S10
    lt $I11, 0, rx168_fail
    inc rx168_pos
    (rx168_rep) = rx168_cur."!mark_commit"($I174)
    rx168_cur."!mark_push"(rx168_rep, rx168_pos, $I174)
    goto rxquantr173_loop
  rxquantr173_done:
    (rx168_rep) = rx168_cur."!mark_commit"($I175)
    rx168_cur."!mark_push"(rx168_rep, rx168_pos, $I175)
  # rx literal  "_"
    add $I11, rx168_pos, 1
    gt $I11, rx168_eos, rx168_fail
    sub $I11, rx168_pos, rx168_off
    substr $S10, rx168_tgt, $I11, 1
    ne $S10, "_", rx168_fail
    add rx168_pos, 1
    goto rxquantr172_loop
  rxquantr172_done:
  # rx pass
    rx168_cur."!cursor_pass"(rx168_pos, "binint")
    rx168_cur."!cursor_debug"("PASS  ", "binint", " at pos=", rx168_pos)
    .return (rx168_cur)
  rx168_fail:
.annotate "line", 33
    (rx168_rep, rx168_pos, $I10, $P10) = rx168_cur."!mark_fail"(0)
    lt rx168_pos, -1, rx168_done
    eq rx168_pos, -1, rx168_fail
    jump $I10
  rx168_done:
    rx168_cur."!cursor_fail"()
    rx168_cur."!cursor_debug"("FAIL  ", "binint")
    .return (rx168_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binint"  :subid("58_1271336377.56964") :method
.annotate "line", 33
    new $P170, "ResizablePMCArray"
    push $P170, ""
    .return ($P170)
.end


.namespace ["HLL";"Grammar"]
.sub "binints"  :subid("59_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "binints")
    rx177_cur."!cursor_caparray"("binint")
    .lex unicode:"$\x{a2}", rx177_cur
    .local pmc match
    .lex "$/", match
    length rx177_eos, rx177_tgt
    set rx177_off, 0
    lt rx177_pos, 2, rx177_start
    sub rx177_off, rx177_pos, 1
    substr rx177_tgt, rx177_tgt, rx177_off
  rx177_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan180_done
    goto rxscan180_scan
  rxscan180_loop:
    ($P10) = rx177_cur."from"()
    inc $P10
    set rx177_pos, $P10
    ge rx177_pos, rx177_eos, rxscan180_done
  rxscan180_scan:
    set_addr $I10, rxscan180_loop
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  rxscan180_done:
.annotate "line", 58
  # rx rxquantr181 ** 1..*
    set_addr $I182, rxquantr181_done
    rx177_cur."!mark_push"(0, -1, $I182)
  rxquantr181_loop:
  # rx subrule "ws" subtype=method negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."ws"()
    unless $P10, rx177_fail
    rx177_pos = $P10."pos"()
  # rx subrule "binint" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."binint"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("binint")
    rx177_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."ws"()
    unless $P10, rx177_fail
    rx177_pos = $P10."pos"()
    (rx177_rep) = rx177_cur."!mark_commit"($I182)
    rx177_cur."!mark_push"(rx177_rep, rx177_pos, $I182)
  # rx literal  ","
    add $I11, rx177_pos, 1
    gt $I11, rx177_eos, rx177_fail
    sub $I11, rx177_pos, rx177_off
    substr $S10, rx177_tgt, $I11, 1
    ne $S10, ",", rx177_fail
    add rx177_pos, 1
    goto rxquantr181_loop
  rxquantr181_done:
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "binints")
    rx177_cur."!cursor_debug"("PASS  ", "binints", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_fail:
.annotate "line", 33
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "binints")
    .return (rx177_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binints"  :subid("60_1271336377.56964") :method
.annotate "line", 33
    new $P179, "ResizablePMCArray"
    push $P179, ""
    .return ($P179)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("61_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx184_tgt
    .local int rx184_pos
    .local int rx184_off
    .local int rx184_eos
    .local int rx184_rep
    .local pmc rx184_cur
    (rx184_cur, rx184_pos, rx184_tgt) = self."!cursor_start"()
    rx184_cur."!cursor_debug"("START ", "integer")
    .lex unicode:"$\x{a2}", rx184_cur
    .local pmc match
    .lex "$/", match
    length rx184_eos, rx184_tgt
    set rx184_off, 0
    lt rx184_pos, 2, rx184_start
    sub rx184_off, rx184_pos, 1
    substr rx184_tgt, rx184_tgt, rx184_off
  rx184_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan192_done
    goto rxscan192_scan
  rxscan192_loop:
    ($P10) = rx184_cur."from"()
    inc $P10
    set rx184_pos, $P10
    ge rx184_pos, rx184_eos, rxscan192_done
  rxscan192_scan:
    set_addr $I10, rxscan192_loop
    rx184_cur."!mark_push"(0, rx184_pos, $I10)
  rxscan192_done:
  alt193_0:
.annotate "line", 61
    set_addr $I10, alt193_1
    rx184_cur."!mark_push"(0, rx184_pos, $I10)
.annotate "line", 62
  # rx literal  "0"
    add $I11, rx184_pos, 1
    gt $I11, rx184_eos, rx184_fail
    sub $I11, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I11, 1
    ne $S10, "0", rx184_fail
    add rx184_pos, 1
  alt194_0:
    set_addr $I10, alt194_1
    rx184_cur."!mark_push"(0, rx184_pos, $I10)
  # rx literal  "b"
    add $I11, rx184_pos, 1
    gt $I11, rx184_eos, rx184_fail
    sub $I11, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I11, 1
    ne $S10, "b", rx184_fail
    add rx184_pos, 1
  # rx subrule "binint" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."binint"()
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=binint")
    rx184_pos = $P10."pos"()
    goto alt194_end
  alt194_1:
    set_addr $I10, alt194_2
    rx184_cur."!mark_push"(0, rx184_pos, $I10)
.annotate "line", 63
  # rx literal  "o"
    add $I11, rx184_pos, 1
    gt $I11, rx184_eos, rx184_fail
    sub $I11, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I11, 1
    ne $S10, "o", rx184_fail
    add rx184_pos, 1
  # rx subrule "octint" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."octint"()
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=octint")
    rx184_pos = $P10."pos"()
    goto alt194_end
  alt194_2:
    set_addr $I10, alt194_3
    rx184_cur."!mark_push"(0, rx184_pos, $I10)
.annotate "line", 64
  # rx literal  "x"
    add $I11, rx184_pos, 1
    gt $I11, rx184_eos, rx184_fail
    sub $I11, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I11, 1
    ne $S10, "x", rx184_fail
    add rx184_pos, 1
  # rx subrule "hexint" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."hexint"()
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=hexint")
    rx184_pos = $P10."pos"()
    goto alt194_end
  alt194_3:
.annotate "line", 65
  # rx literal  "d"
    add $I11, rx184_pos, 1
    gt $I11, rx184_eos, rx184_fail
    sub $I11, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I11, 1
    ne $S10, "d", rx184_fail
    add rx184_pos, 1
  # rx subrule "decint" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."decint"()
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx184_pos = $P10."pos"()
  alt194_end:
.annotate "line", 62
    goto alt193_end
  alt193_1:
.annotate "line", 67
  # rx subrule "decint" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."decint"()
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx184_pos = $P10."pos"()
  alt193_end:
.annotate "line", 60
  # rx pass
    rx184_cur."!cursor_pass"(rx184_pos, "integer")
    rx184_cur."!cursor_debug"("PASS  ", "integer", " at pos=", rx184_pos)
    .return (rx184_cur)
  rx184_fail:
.annotate "line", 33
    (rx184_rep, rx184_pos, $I10, $P10) = rx184_cur."!mark_fail"(0)
    lt rx184_pos, -1, rx184_done
    eq rx184_pos, -1, rx184_fail
    jump $I10
  rx184_done:
    rx184_cur."!cursor_fail"()
    rx184_cur."!cursor_debug"("FAIL  ", "integer")
    .return (rx184_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__integer"  :subid("62_1271336377.56964") :method
.annotate "line", 33
    $P186 = self."!PREFIX__!subrule"("VALUE=decint", "")
    $P187 = self."!PREFIX__!subrule"("VALUE=decint", "0d")
    $P188 = self."!PREFIX__!subrule"("VALUE=hexint", "0x")
    $P189 = self."!PREFIX__!subrule"("VALUE=octint", "0o")
    $P190 = self."!PREFIX__!subrule"("VALUE=binint", "0b")
    new $P191, "ResizablePMCArray"
    push $P191, $P186
    push $P191, $P187
    push $P191, $P188
    push $P191, $P189
    push $P191, $P190
    .return ($P191)
.end


.namespace ["HLL";"Grammar"]
.sub "dec_number"  :subid("63_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "dec_number")
    rx196_cur."!cursor_caparray"("escale")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    set rx196_off, 0
    lt rx196_pos, 2, rx196_start
    sub rx196_off, rx196_pos, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan199_done
    goto rxscan199_scan
  rxscan199_loop:
    ($P10) = rx196_cur."from"()
    inc $P10
    set rx196_pos, $P10
    ge rx196_pos, rx196_eos, rxscan199_done
  rxscan199_scan:
    set_addr $I10, rxscan199_loop
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  rxscan199_done:
  alt200_0:
.annotate "line", 71
    set_addr $I10, alt200_1
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
.annotate "line", 72
  # rx subcapture "coeff"
    set_addr $I10, rxcap_201_fail
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  # rx literal  "."
    add $I11, rx196_pos, 1
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 1
    ne $S10, ".", rx196_fail
    add rx196_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx196_pos, rx196_off
    find_not_cclass $I11, 8, rx196_tgt, $I10, rx196_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx196_fail
    add rx196_pos, rx196_off, $I11
    set_addr $I10, rxcap_201_fail
    ($I12, $I11) = rx196_cur."!mark_peek"($I10)
    rx196_cur."!cursor_pos"($I11)
    ($P10) = rx196_cur."!cursor_start"()
    $P10."!cursor_pass"(rx196_pos, "")
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_201_done
  rxcap_201_fail:
    goto rx196_fail
  rxcap_201_done:
  # rx rxquantr202 ** 0..1
    set_addr $I203, rxquantr202_done
    rx196_cur."!mark_push"(0, rx196_pos, $I203)
  rxquantr202_loop:
  # rx subrule "escale" subtype=capture negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."escale"()
    unless $P10, rx196_fail
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx196_pos = $P10."pos"()
    (rx196_rep) = rx196_cur."!mark_commit"($I203)
  rxquantr202_done:
    goto alt200_end
  alt200_1:
    set_addr $I10, alt200_2
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
.annotate "line", 73
  # rx subcapture "coeff"
    set_addr $I10, rxcap_204_fail
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx196_pos, rx196_off
    find_not_cclass $I11, 8, rx196_tgt, $I10, rx196_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx196_fail
    add rx196_pos, rx196_off, $I11
  # rx literal  "."
    add $I11, rx196_pos, 1
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 1
    ne $S10, ".", rx196_fail
    add rx196_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx196_pos, rx196_off
    find_not_cclass $I11, 8, rx196_tgt, $I10, rx196_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx196_fail
    add rx196_pos, rx196_off, $I11
    set_addr $I10, rxcap_204_fail
    ($I12, $I11) = rx196_cur."!mark_peek"($I10)
    rx196_cur."!cursor_pos"($I11)
    ($P10) = rx196_cur."!cursor_start"()
    $P10."!cursor_pass"(rx196_pos, "")
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_204_done
  rxcap_204_fail:
    goto rx196_fail
  rxcap_204_done:
  # rx rxquantr205 ** 0..1
    set_addr $I206, rxquantr205_done
    rx196_cur."!mark_push"(0, rx196_pos, $I206)
  rxquantr205_loop:
  # rx subrule "escale" subtype=capture negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."escale"()
    unless $P10, rx196_fail
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx196_pos = $P10."pos"()
    (rx196_rep) = rx196_cur."!mark_commit"($I206)
  rxquantr205_done:
    goto alt200_end
  alt200_2:
.annotate "line", 74
  # rx subcapture "coeff"
    set_addr $I10, rxcap_207_fail
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx196_pos, rx196_off
    find_not_cclass $I11, 8, rx196_tgt, $I10, rx196_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx196_fail
    add rx196_pos, rx196_off, $I11
    set_addr $I10, rxcap_207_fail
    ($I12, $I11) = rx196_cur."!mark_peek"($I10)
    rx196_cur."!cursor_pos"($I11)
    ($P10) = rx196_cur."!cursor_start"()
    $P10."!cursor_pass"(rx196_pos, "")
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_207_done
  rxcap_207_fail:
    goto rx196_fail
  rxcap_207_done:
  # rx subrule "escale" subtype=capture negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."escale"()
    unless $P10, rx196_fail
    rx196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx196_pos = $P10."pos"()
  alt200_end:
.annotate "line", 71
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "dec_number")
    rx196_cur."!cursor_debug"("PASS  ", "dec_number", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate "line", 33
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "dec_number")
    .return (rx196_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__dec_number"  :subid("64_1271336377.56964") :method
.annotate "line", 33
    new $P198, "ResizablePMCArray"
    push $P198, ""
    push $P198, ""
    push $P198, "."
    .return ($P198)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("65_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "escale")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    set rx209_off, 0
    lt rx209_pos, 2, rx209_start
    sub rx209_off, rx209_pos, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan212_done
    goto rxscan212_scan
  rxscan212_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan212_done
  rxscan212_scan:
    set_addr $I10, rxscan212_loop
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  rxscan212_done:
.annotate "line", 77
  # rx enumcharlist negate=0 
    ge rx209_pos, rx209_eos, rx209_fail
    sub $I10, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I10, 1
    index $I11, "Ee", $S10
    lt $I11, 0, rx209_fail
    inc rx209_pos
  # rx rxquantr213 ** 0..1
    set_addr $I214, rxquantr213_done
    rx209_cur."!mark_push"(0, rx209_pos, $I214)
  rxquantr213_loop:
  # rx enumcharlist negate=0 
    ge rx209_pos, rx209_eos, rx209_fail
    sub $I10, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx209_fail
    inc rx209_pos
    (rx209_rep) = rx209_cur."!mark_commit"($I214)
  rxquantr213_done:
  # rx charclass_q d r 1..-1
    sub $I10, rx209_pos, rx209_off
    find_not_cclass $I11, 8, rx209_tgt, $I10, rx209_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx209_fail
    add rx209_pos, rx209_off, $I11
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "escale")
    rx209_cur."!cursor_debug"("PASS  ", "escale", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate "line", 33
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "escale")
    .return (rx209_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__escale"  :subid("66_1271336377.56964") :method
.annotate "line", 33
    new $P211, "ResizablePMCArray"
    push $P211, "e"
    push $P211, "E"
    .return ($P211)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("67_1271336377.56964") :method
.annotate "line", 79
    $P216 = self."!protoregex"("quote_escape")
    .return ($P216)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("68_1271336377.56964") :method
.annotate "line", 79
    $P218 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P218)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("69_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx220_tgt
    .local int rx220_pos
    .local int rx220_off
    .local int rx220_eos
    .local int rx220_rep
    .local pmc rx220_cur
    (rx220_cur, rx220_pos, rx220_tgt) = self."!cursor_start"()
    rx220_cur."!cursor_debug"("START ", "quote_escape:sym<backslash>")
    .lex unicode:"$\x{a2}", rx220_cur
    .local pmc match
    .lex "$/", match
    length rx220_eos, rx220_tgt
    set rx220_off, 0
    lt rx220_pos, 2, rx220_start
    sub rx220_off, rx220_pos, 1
    substr rx220_tgt, rx220_tgt, rx220_off
  rx220_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan223_done
    goto rxscan223_scan
  rxscan223_loop:
    ($P10) = rx220_cur."from"()
    inc $P10
    set rx220_pos, $P10
    ge rx220_pos, rx220_eos, rxscan223_done
  rxscan223_scan:
    set_addr $I10, rxscan223_loop
    rx220_cur."!mark_push"(0, rx220_pos, $I10)
  rxscan223_done:
.annotate "line", 80
  # rx literal  "\\\\"
    add $I11, rx220_pos, 2
    gt $I11, rx220_eos, rx220_fail
    sub $I11, rx220_pos, rx220_off
    substr $S10, rx220_tgt, $I11, 2
    ne $S10, "\\\\", rx220_fail
    add rx220_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."quotemod_check"("q")
    unless $P10, rx220_fail
  # rx pass
    rx220_cur."!cursor_pass"(rx220_pos, "quote_escape:sym<backslash>")
    rx220_cur."!cursor_debug"("PASS  ", "quote_escape:sym<backslash>", " at pos=", rx220_pos)
    .return (rx220_cur)
  rx220_fail:
.annotate "line", 33
    (rx220_rep, rx220_pos, $I10, $P10) = rx220_cur."!mark_fail"(0)
    lt rx220_pos, -1, rx220_done
    eq rx220_pos, -1, rx220_fail
    jump $I10
  rx220_done:
    rx220_cur."!cursor_fail"()
    rx220_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<backslash>")
    .return (rx220_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("70_1271336377.56964") :method
.annotate "line", 33
    new $P222, "ResizablePMCArray"
    push $P222, "\\\\"
    .return ($P222)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("71_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx225_tgt
    .local int rx225_pos
    .local int rx225_off
    .local int rx225_eos
    .local int rx225_rep
    .local pmc rx225_cur
    (rx225_cur, rx225_pos, rx225_tgt) = self."!cursor_start"()
    rx225_cur."!cursor_debug"("START ", "quote_escape:sym<stopper>")
    .lex unicode:"$\x{a2}", rx225_cur
    .local pmc match
    .lex "$/", match
    length rx225_eos, rx225_tgt
    set rx225_off, 0
    lt rx225_pos, 2, rx225_start
    sub rx225_off, rx225_pos, 1
    substr rx225_tgt, rx225_tgt, rx225_off
  rx225_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan228_done
    goto rxscan228_scan
  rxscan228_loop:
    ($P10) = rx225_cur."from"()
    inc $P10
    set rx225_pos, $P10
    ge rx225_pos, rx225_eos, rxscan228_done
  rxscan228_scan:
    set_addr $I10, rxscan228_loop
    rx225_cur."!mark_push"(0, rx225_pos, $I10)
  rxscan228_done:
.annotate "line", 81
  # rx literal  "\\"
    add $I11, rx225_pos, 1
    gt $I11, rx225_eos, rx225_fail
    sub $I11, rx225_pos, rx225_off
    substr $S10, rx225_tgt, $I11, 1
    ne $S10, "\\", rx225_fail
    add rx225_pos, 1
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."quotemod_check"("q")
    unless $P10, rx225_fail
  # rx subrule "stopper" subtype=capture negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."stopper"()
    unless $P10, rx225_fail
    rx225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx225_pos = $P10."pos"()
  # rx pass
    rx225_cur."!cursor_pass"(rx225_pos, "quote_escape:sym<stopper>")
    rx225_cur."!cursor_debug"("PASS  ", "quote_escape:sym<stopper>", " at pos=", rx225_pos)
    .return (rx225_cur)
  rx225_fail:
.annotate "line", 33
    (rx225_rep, rx225_pos, $I10, $P10) = rx225_cur."!mark_fail"(0)
    lt rx225_pos, -1, rx225_done
    eq rx225_pos, -1, rx225_fail
    jump $I10
  rx225_done:
    rx225_cur."!cursor_fail"()
    rx225_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<stopper>")
    .return (rx225_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("72_1271336377.56964") :method
.annotate "line", 33
    new $P227, "ResizablePMCArray"
    push $P227, "\\"
    .return ($P227)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("73_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx230_tgt
    .local int rx230_pos
    .local int rx230_off
    .local int rx230_eos
    .local int rx230_rep
    .local pmc rx230_cur
    (rx230_cur, rx230_pos, rx230_tgt) = self."!cursor_start"()
    rx230_cur."!cursor_debug"("START ", "quote_escape:sym<bs>")
    .lex unicode:"$\x{a2}", rx230_cur
    .local pmc match
    .lex "$/", match
    length rx230_eos, rx230_tgt
    set rx230_off, 0
    lt rx230_pos, 2, rx230_start
    sub rx230_off, rx230_pos, 1
    substr rx230_tgt, rx230_tgt, rx230_off
  rx230_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan233_done
    goto rxscan233_scan
  rxscan233_loop:
    ($P10) = rx230_cur."from"()
    inc $P10
    set rx230_pos, $P10
    ge rx230_pos, rx230_eos, rxscan233_done
  rxscan233_scan:
    set_addr $I10, rxscan233_loop
    rx230_cur."!mark_push"(0, rx230_pos, $I10)
  rxscan233_done:
.annotate "line", 83
  # rx literal  "\\b"
    add $I11, rx230_pos, 2
    gt $I11, rx230_eos, rx230_fail
    sub $I11, rx230_pos, rx230_off
    substr $S10, rx230_tgt, $I11, 2
    ne $S10, "\\b", rx230_fail
    add rx230_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."quotemod_check"("b")
    unless $P10, rx230_fail
  # rx pass
    rx230_cur."!cursor_pass"(rx230_pos, "quote_escape:sym<bs>")
    rx230_cur."!cursor_debug"("PASS  ", "quote_escape:sym<bs>", " at pos=", rx230_pos)
    .return (rx230_cur)
  rx230_fail:
.annotate "line", 33
    (rx230_rep, rx230_pos, $I10, $P10) = rx230_cur."!mark_fail"(0)
    lt rx230_pos, -1, rx230_done
    eq rx230_pos, -1, rx230_fail
    jump $I10
  rx230_done:
    rx230_cur."!cursor_fail"()
    rx230_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<bs>")
    .return (rx230_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("74_1271336377.56964") :method
.annotate "line", 33
    new $P232, "ResizablePMCArray"
    push $P232, "\\b"
    .return ($P232)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("75_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx235_tgt
    .local int rx235_pos
    .local int rx235_off
    .local int rx235_eos
    .local int rx235_rep
    .local pmc rx235_cur
    (rx235_cur, rx235_pos, rx235_tgt) = self."!cursor_start"()
    rx235_cur."!cursor_debug"("START ", "quote_escape:sym<nl>")
    .lex unicode:"$\x{a2}", rx235_cur
    .local pmc match
    .lex "$/", match
    length rx235_eos, rx235_tgt
    set rx235_off, 0
    lt rx235_pos, 2, rx235_start
    sub rx235_off, rx235_pos, 1
    substr rx235_tgt, rx235_tgt, rx235_off
  rx235_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan238_done
    goto rxscan238_scan
  rxscan238_loop:
    ($P10) = rx235_cur."from"()
    inc $P10
    set rx235_pos, $P10
    ge rx235_pos, rx235_eos, rxscan238_done
  rxscan238_scan:
    set_addr $I10, rxscan238_loop
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  rxscan238_done:
.annotate "line", 84
  # rx literal  "\\n"
    add $I11, rx235_pos, 2
    gt $I11, rx235_eos, rx235_fail
    sub $I11, rx235_pos, rx235_off
    substr $S10, rx235_tgt, $I11, 2
    ne $S10, "\\n", rx235_fail
    add rx235_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx235_cur."!cursor_pos"(rx235_pos)
    $P10 = rx235_cur."quotemod_check"("b")
    unless $P10, rx235_fail
  # rx pass
    rx235_cur."!cursor_pass"(rx235_pos, "quote_escape:sym<nl>")
    rx235_cur."!cursor_debug"("PASS  ", "quote_escape:sym<nl>", " at pos=", rx235_pos)
    .return (rx235_cur)
  rx235_fail:
.annotate "line", 33
    (rx235_rep, rx235_pos, $I10, $P10) = rx235_cur."!mark_fail"(0)
    lt rx235_pos, -1, rx235_done
    eq rx235_pos, -1, rx235_fail
    jump $I10
  rx235_done:
    rx235_cur."!cursor_fail"()
    rx235_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<nl>")
    .return (rx235_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("76_1271336377.56964") :method
.annotate "line", 33
    new $P237, "ResizablePMCArray"
    push $P237, "\\n"
    .return ($P237)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("77_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx240_tgt
    .local int rx240_pos
    .local int rx240_off
    .local int rx240_eos
    .local int rx240_rep
    .local pmc rx240_cur
    (rx240_cur, rx240_pos, rx240_tgt) = self."!cursor_start"()
    rx240_cur."!cursor_debug"("START ", "quote_escape:sym<cr>")
    .lex unicode:"$\x{a2}", rx240_cur
    .local pmc match
    .lex "$/", match
    length rx240_eos, rx240_tgt
    set rx240_off, 0
    lt rx240_pos, 2, rx240_start
    sub rx240_off, rx240_pos, 1
    substr rx240_tgt, rx240_tgt, rx240_off
  rx240_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan243_done
    goto rxscan243_scan
  rxscan243_loop:
    ($P10) = rx240_cur."from"()
    inc $P10
    set rx240_pos, $P10
    ge rx240_pos, rx240_eos, rxscan243_done
  rxscan243_scan:
    set_addr $I10, rxscan243_loop
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  rxscan243_done:
.annotate "line", 85
  # rx literal  "\\r"
    add $I11, rx240_pos, 2
    gt $I11, rx240_eos, rx240_fail
    sub $I11, rx240_pos, rx240_off
    substr $S10, rx240_tgt, $I11, 2
    ne $S10, "\\r", rx240_fail
    add rx240_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx240_cur."!cursor_pos"(rx240_pos)
    $P10 = rx240_cur."quotemod_check"("b")
    unless $P10, rx240_fail
  # rx pass
    rx240_cur."!cursor_pass"(rx240_pos, "quote_escape:sym<cr>")
    rx240_cur."!cursor_debug"("PASS  ", "quote_escape:sym<cr>", " at pos=", rx240_pos)
    .return (rx240_cur)
  rx240_fail:
.annotate "line", 33
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    rx240_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<cr>")
    .return (rx240_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("78_1271336377.56964") :method
.annotate "line", 33
    new $P242, "ResizablePMCArray"
    push $P242, "\\r"
    .return ($P242)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("79_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx245_tgt
    .local int rx245_pos
    .local int rx245_off
    .local int rx245_eos
    .local int rx245_rep
    .local pmc rx245_cur
    (rx245_cur, rx245_pos, rx245_tgt) = self."!cursor_start"()
    rx245_cur."!cursor_debug"("START ", "quote_escape:sym<tab>")
    .lex unicode:"$\x{a2}", rx245_cur
    .local pmc match
    .lex "$/", match
    length rx245_eos, rx245_tgt
    set rx245_off, 0
    lt rx245_pos, 2, rx245_start
    sub rx245_off, rx245_pos, 1
    substr rx245_tgt, rx245_tgt, rx245_off
  rx245_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan248_done
    goto rxscan248_scan
  rxscan248_loop:
    ($P10) = rx245_cur."from"()
    inc $P10
    set rx245_pos, $P10
    ge rx245_pos, rx245_eos, rxscan248_done
  rxscan248_scan:
    set_addr $I10, rxscan248_loop
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  rxscan248_done:
.annotate "line", 86
  # rx literal  "\\t"
    add $I11, rx245_pos, 2
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 2
    ne $S10, "\\t", rx245_fail
    add rx245_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."quotemod_check"("b")
    unless $P10, rx245_fail
  # rx pass
    rx245_cur."!cursor_pass"(rx245_pos, "quote_escape:sym<tab>")
    rx245_cur."!cursor_debug"("PASS  ", "quote_escape:sym<tab>", " at pos=", rx245_pos)
    .return (rx245_cur)
  rx245_fail:
.annotate "line", 33
    (rx245_rep, rx245_pos, $I10, $P10) = rx245_cur."!mark_fail"(0)
    lt rx245_pos, -1, rx245_done
    eq rx245_pos, -1, rx245_fail
    jump $I10
  rx245_done:
    rx245_cur."!cursor_fail"()
    rx245_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<tab>")
    .return (rx245_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("80_1271336377.56964") :method
.annotate "line", 33
    new $P247, "ResizablePMCArray"
    push $P247, "\\t"
    .return ($P247)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<ff>"  :subid("81_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx250_tgt
    .local int rx250_pos
    .local int rx250_off
    .local int rx250_eos
    .local int rx250_rep
    .local pmc rx250_cur
    (rx250_cur, rx250_pos, rx250_tgt) = self."!cursor_start"()
    rx250_cur."!cursor_debug"("START ", "quote_escape:sym<ff>")
    .lex unicode:"$\x{a2}", rx250_cur
    .local pmc match
    .lex "$/", match
    length rx250_eos, rx250_tgt
    set rx250_off, 0
    lt rx250_pos, 2, rx250_start
    sub rx250_off, rx250_pos, 1
    substr rx250_tgt, rx250_tgt, rx250_off
  rx250_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan253_done
    goto rxscan253_scan
  rxscan253_loop:
    ($P10) = rx250_cur."from"()
    inc $P10
    set rx250_pos, $P10
    ge rx250_pos, rx250_eos, rxscan253_done
  rxscan253_scan:
    set_addr $I10, rxscan253_loop
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  rxscan253_done:
.annotate "line", 87
  # rx literal  "\\f"
    add $I11, rx250_pos, 2
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 2
    ne $S10, "\\f", rx250_fail
    add rx250_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."quotemod_check"("b")
    unless $P10, rx250_fail
  # rx pass
    rx250_cur."!cursor_pass"(rx250_pos, "quote_escape:sym<ff>")
    rx250_cur."!cursor_debug"("PASS  ", "quote_escape:sym<ff>", " at pos=", rx250_pos)
    .return (rx250_cur)
  rx250_fail:
.annotate "line", 33
    (rx250_rep, rx250_pos, $I10, $P10) = rx250_cur."!mark_fail"(0)
    lt rx250_pos, -1, rx250_done
    eq rx250_pos, -1, rx250_fail
    jump $I10
  rx250_done:
    rx250_cur."!cursor_fail"()
    rx250_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<ff>")
    .return (rx250_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<ff>"  :subid("82_1271336377.56964") :method
.annotate "line", 33
    new $P252, "ResizablePMCArray"
    push $P252, "\\f"
    .return ($P252)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("83_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx255_tgt
    .local int rx255_pos
    .local int rx255_off
    .local int rx255_eos
    .local int rx255_rep
    .local pmc rx255_cur
    (rx255_cur, rx255_pos, rx255_tgt) = self."!cursor_start"()
    rx255_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
    .lex unicode:"$\x{a2}", rx255_cur
    .local pmc match
    .lex "$/", match
    length rx255_eos, rx255_tgt
    set rx255_off, 0
    lt rx255_pos, 2, rx255_start
    sub rx255_off, rx255_pos, 1
    substr rx255_tgt, rx255_tgt, rx255_off
  rx255_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan258_done
    goto rxscan258_scan
  rxscan258_loop:
    ($P10) = rx255_cur."from"()
    inc $P10
    set rx255_pos, $P10
    ge rx255_pos, rx255_eos, rxscan258_done
  rxscan258_scan:
    set_addr $I10, rxscan258_loop
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  rxscan258_done:
.annotate "line", 88
  # rx literal  "\\e"
    add $I11, rx255_pos, 2
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 2
    ne $S10, "\\e", rx255_fail
    add rx255_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."quotemod_check"("b")
    unless $P10, rx255_fail
  # rx pass
    rx255_cur."!cursor_pass"(rx255_pos, "quote_escape:sym<esc>")
    rx255_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx255_pos)
    .return (rx255_cur)
  rx255_fail:
.annotate "line", 33
    (rx255_rep, rx255_pos, $I10, $P10) = rx255_cur."!mark_fail"(0)
    lt rx255_pos, -1, rx255_done
    eq rx255_pos, -1, rx255_fail
    jump $I10
  rx255_done:
    rx255_cur."!cursor_fail"()
    rx255_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx255_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("84_1271336377.56964") :method
.annotate "line", 33
    new $P257, "ResizablePMCArray"
    push $P257, "\\e"
    .return ($P257)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("85_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx260_tgt
    .local int rx260_pos
    .local int rx260_off
    .local int rx260_eos
    .local int rx260_rep
    .local pmc rx260_cur
    (rx260_cur, rx260_pos, rx260_tgt) = self."!cursor_start"()
    rx260_cur."!cursor_debug"("START ", "quote_escape:sym<hex>")
    .lex unicode:"$\x{a2}", rx260_cur
    .local pmc match
    .lex "$/", match
    length rx260_eos, rx260_tgt
    set rx260_off, 0
    lt rx260_pos, 2, rx260_start
    sub rx260_off, rx260_pos, 1
    substr rx260_tgt, rx260_tgt, rx260_off
  rx260_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan263_done
    goto rxscan263_scan
  rxscan263_loop:
    ($P10) = rx260_cur."from"()
    inc $P10
    set rx260_pos, $P10
    ge rx260_pos, rx260_eos, rxscan263_done
  rxscan263_scan:
    set_addr $I10, rxscan263_loop
    rx260_cur."!mark_push"(0, rx260_pos, $I10)
  rxscan263_done:
.annotate "line", 90
  # rx literal  unicode:"\\x"
    add $I11, rx260_pos, 2
    gt $I11, rx260_eos, rx260_fail
    sub $I11, rx260_pos, rx260_off
    substr $S10, rx260_tgt, $I11, 2
    ne $S10, unicode:"\\x", rx260_fail
    add rx260_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx260_cur."!cursor_pos"(rx260_pos)
    $P10 = rx260_cur."quotemod_check"("b")
    unless $P10, rx260_fail
  alt264_0:
.annotate "line", 91
    set_addr $I10, alt264_1
    rx260_cur."!mark_push"(0, rx260_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx260_cur."!cursor_pos"(rx260_pos)
    $P10 = rx260_cur."hexint"()
    unless $P10, rx260_fail
    rx260_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx260_pos = $P10."pos"()
    goto alt264_end
  alt264_1:
  # rx literal  "["
    add $I11, rx260_pos, 1
    gt $I11, rx260_eos, rx260_fail
    sub $I11, rx260_pos, rx260_off
    substr $S10, rx260_tgt, $I11, 1
    ne $S10, "[", rx260_fail
    add rx260_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx260_cur."!cursor_pos"(rx260_pos)
    $P10 = rx260_cur."hexints"()
    unless $P10, rx260_fail
    rx260_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx260_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx260_pos, 1
    gt $I11, rx260_eos, rx260_fail
    sub $I11, rx260_pos, rx260_off
    substr $S10, rx260_tgt, $I11, 1
    ne $S10, "]", rx260_fail
    add rx260_pos, 1
  alt264_end:
.annotate "line", 89
  # rx pass
    rx260_cur."!cursor_pass"(rx260_pos, "quote_escape:sym<hex>")
    rx260_cur."!cursor_debug"("PASS  ", "quote_escape:sym<hex>", " at pos=", rx260_pos)
    .return (rx260_cur)
  rx260_fail:
.annotate "line", 33
    (rx260_rep, rx260_pos, $I10, $P10) = rx260_cur."!mark_fail"(0)
    lt rx260_pos, -1, rx260_done
    eq rx260_pos, -1, rx260_fail
    jump $I10
  rx260_done:
    rx260_cur."!cursor_fail"()
    rx260_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<hex>")
    .return (rx260_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("86_1271336377.56964") :method
.annotate "line", 33
    new $P262, "ResizablePMCArray"
    push $P262, unicode:"\\x"
    .return ($P262)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("87_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx266_tgt
    .local int rx266_pos
    .local int rx266_off
    .local int rx266_eos
    .local int rx266_rep
    .local pmc rx266_cur
    (rx266_cur, rx266_pos, rx266_tgt) = self."!cursor_start"()
    rx266_cur."!cursor_debug"("START ", "quote_escape:sym<oct>")
    .lex unicode:"$\x{a2}", rx266_cur
    .local pmc match
    .lex "$/", match
    length rx266_eos, rx266_tgt
    set rx266_off, 0
    lt rx266_pos, 2, rx266_start
    sub rx266_off, rx266_pos, 1
    substr rx266_tgt, rx266_tgt, rx266_off
  rx266_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan269_done
    goto rxscan269_scan
  rxscan269_loop:
    ($P10) = rx266_cur."from"()
    inc $P10
    set rx266_pos, $P10
    ge rx266_pos, rx266_eos, rxscan269_done
  rxscan269_scan:
    set_addr $I10, rxscan269_loop
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  rxscan269_done:
.annotate "line", 94
  # rx literal  "\\o"
    add $I11, rx266_pos, 2
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    substr $S10, rx266_tgt, $I11, 2
    ne $S10, "\\o", rx266_fail
    add rx266_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx266_cur."!cursor_pos"(rx266_pos)
    $P10 = rx266_cur."quotemod_check"("b")
    unless $P10, rx266_fail
  alt270_0:
.annotate "line", 95
    set_addr $I10, alt270_1
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx266_cur."!cursor_pos"(rx266_pos)
    $P10 = rx266_cur."octint"()
    unless $P10, rx266_fail
    rx266_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx266_pos = $P10."pos"()
    goto alt270_end
  alt270_1:
  # rx literal  "["
    add $I11, rx266_pos, 1
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    substr $S10, rx266_tgt, $I11, 1
    ne $S10, "[", rx266_fail
    add rx266_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx266_cur."!cursor_pos"(rx266_pos)
    $P10 = rx266_cur."octints"()
    unless $P10, rx266_fail
    rx266_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx266_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx266_pos, 1
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    substr $S10, rx266_tgt, $I11, 1
    ne $S10, "]", rx266_fail
    add rx266_pos, 1
  alt270_end:
.annotate "line", 93
  # rx pass
    rx266_cur."!cursor_pass"(rx266_pos, "quote_escape:sym<oct>")
    rx266_cur."!cursor_debug"("PASS  ", "quote_escape:sym<oct>", " at pos=", rx266_pos)
    .return (rx266_cur)
  rx266_fail:
.annotate "line", 33
    (rx266_rep, rx266_pos, $I10, $P10) = rx266_cur."!mark_fail"(0)
    lt rx266_pos, -1, rx266_done
    eq rx266_pos, -1, rx266_fail
    jump $I10
  rx266_done:
    rx266_cur."!cursor_fail"()
    rx266_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<oct>")
    .return (rx266_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("88_1271336377.56964") :method
.annotate "line", 33
    new $P268, "ResizablePMCArray"
    push $P268, "\\o"
    .return ($P268)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("89_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx272_tgt
    .local int rx272_pos
    .local int rx272_off
    .local int rx272_eos
    .local int rx272_rep
    .local pmc rx272_cur
    (rx272_cur, rx272_pos, rx272_tgt) = self."!cursor_start"()
    rx272_cur."!cursor_debug"("START ", "quote_escape:sym<chr>")
    .lex unicode:"$\x{a2}", rx272_cur
    .local pmc match
    .lex "$/", match
    length rx272_eos, rx272_tgt
    set rx272_off, 0
    lt rx272_pos, 2, rx272_start
    sub rx272_off, rx272_pos, 1
    substr rx272_tgt, rx272_tgt, rx272_off
  rx272_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan275_done
    goto rxscan275_scan
  rxscan275_loop:
    ($P10) = rx272_cur."from"()
    inc $P10
    set rx272_pos, $P10
    ge rx272_pos, rx272_eos, rxscan275_done
  rxscan275_scan:
    set_addr $I10, rxscan275_loop
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  rxscan275_done:
.annotate "line", 97
  # rx literal  "\\c"
    add $I11, rx272_pos, 2
    gt $I11, rx272_eos, rx272_fail
    sub $I11, rx272_pos, rx272_off
    substr $S10, rx272_tgt, $I11, 2
    ne $S10, "\\c", rx272_fail
    add rx272_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."quotemod_check"("b")
    unless $P10, rx272_fail
  # rx subrule "charspec" subtype=capture negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."charspec"()
    unless $P10, rx272_fail
    rx272_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx272_pos = $P10."pos"()
  # rx pass
    rx272_cur."!cursor_pass"(rx272_pos, "quote_escape:sym<chr>")
    rx272_cur."!cursor_debug"("PASS  ", "quote_escape:sym<chr>", " at pos=", rx272_pos)
    .return (rx272_cur)
  rx272_fail:
.annotate "line", 33
    (rx272_rep, rx272_pos, $I10, $P10) = rx272_cur."!mark_fail"(0)
    lt rx272_pos, -1, rx272_done
    eq rx272_pos, -1, rx272_fail
    jump $I10
  rx272_done:
    rx272_cur."!cursor_fail"()
    rx272_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<chr>")
    .return (rx272_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("90_1271336377.56964") :method
.annotate "line", 33
    new $P274, "ResizablePMCArray"
    push $P274, "\\c"
    .return ($P274)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<0>"  :subid("91_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx277_tgt
    .local int rx277_pos
    .local int rx277_off
    .local int rx277_eos
    .local int rx277_rep
    .local pmc rx277_cur
    (rx277_cur, rx277_pos, rx277_tgt) = self."!cursor_start"()
    rx277_cur."!cursor_debug"("START ", "quote_escape:sym<0>")
    .lex unicode:"$\x{a2}", rx277_cur
    .local pmc match
    .lex "$/", match
    length rx277_eos, rx277_tgt
    set rx277_off, 0
    lt rx277_pos, 2, rx277_start
    sub rx277_off, rx277_pos, 1
    substr rx277_tgt, rx277_tgt, rx277_off
  rx277_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan280_done
    goto rxscan280_scan
  rxscan280_loop:
    ($P10) = rx277_cur."from"()
    inc $P10
    set rx277_pos, $P10
    ge rx277_pos, rx277_eos, rxscan280_done
  rxscan280_scan:
    set_addr $I10, rxscan280_loop
    rx277_cur."!mark_push"(0, rx277_pos, $I10)
  rxscan280_done:
.annotate "line", 98
  # rx literal  "\\"
    add $I11, rx277_pos, 1
    gt $I11, rx277_eos, rx277_fail
    sub $I11, rx277_pos, rx277_off
    substr $S10, rx277_tgt, $I11, 1
    ne $S10, "\\", rx277_fail
    add rx277_pos, 1
  # rx subcapture "sym"
    set_addr $I10, rxcap_281_fail
    rx277_cur."!mark_push"(0, rx277_pos, $I10)
  # rx literal  "0"
    add $I11, rx277_pos, 1
    gt $I11, rx277_eos, rx277_fail
    sub $I11, rx277_pos, rx277_off
    substr $S10, rx277_tgt, $I11, 1
    ne $S10, "0", rx277_fail
    add rx277_pos, 1
    set_addr $I10, rxcap_281_fail
    ($I12, $I11) = rx277_cur."!mark_peek"($I10)
    rx277_cur."!cursor_pos"($I11)
    ($P10) = rx277_cur."!cursor_start"()
    $P10."!cursor_pass"(rx277_pos, "")
    rx277_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_281_done
  rxcap_281_fail:
    goto rx277_fail
  rxcap_281_done:
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx277_cur."!cursor_pos"(rx277_pos)
    $P10 = rx277_cur."quotemod_check"("b")
    unless $P10, rx277_fail
  # rx pass
    rx277_cur."!cursor_pass"(rx277_pos, "quote_escape:sym<0>")
    rx277_cur."!cursor_debug"("PASS  ", "quote_escape:sym<0>", " at pos=", rx277_pos)
    .return (rx277_cur)
  rx277_fail:
.annotate "line", 33
    (rx277_rep, rx277_pos, $I10, $P10) = rx277_cur."!mark_fail"(0)
    lt rx277_pos, -1, rx277_done
    eq rx277_pos, -1, rx277_fail
    jump $I10
  rx277_done:
    rx277_cur."!cursor_fail"()
    rx277_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<0>")
    .return (rx277_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<0>"  :subid("92_1271336377.56964") :method
.annotate "line", 33
    new $P279, "ResizablePMCArray"
    push $P279, "\\0"
    .return ($P279)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<misc>"  :subid("93_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .const 'Sub' $P302 = "97_1271336377.56964" 
    capture_lex $P302
    .const 'Sub' $P295 = "96_1271336377.56964" 
    capture_lex $P295
    .const 'Sub' $P290 = "95_1271336377.56964" 
    capture_lex $P290
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "quote_escape:sym<misc>")
    .lex unicode:"$\x{a2}", rx283_cur
    .local pmc match
    .lex "$/", match
    length rx283_eos, rx283_tgt
    set rx283_off, 0
    lt rx283_pos, 2, rx283_start
    sub rx283_off, rx283_pos, 1
    substr rx283_tgt, rx283_tgt, rx283_off
  rx283_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan286_done
    goto rxscan286_scan
  rxscan286_loop:
    ($P10) = rx283_cur."from"()
    inc $P10
    set rx283_pos, $P10
    ge rx283_pos, rx283_eos, rxscan286_done
  rxscan286_scan:
    set_addr $I10, rxscan286_loop
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  rxscan286_done:
.annotate "line", 99
    rx283_cur."!cursor_pos"(rx283_pos)
    find_lex $P287, unicode:"$\x{a2}"
    $P288 = $P287."MATCH"()
    store_lex "$/", $P288
.annotate "line", 100
    .const 'Sub' $P290 = "95_1271336377.56964" 
    capture_lex $P290
    $P291 = $P290()
  # rx literal  "\\"
    add $I11, rx283_pos, 1
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 1
    ne $S10, "\\", rx283_fail
    add rx283_pos, 1
  alt292_0:
.annotate "line", 101
    set_addr $I10, alt292_1
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
.annotate "line", 102
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."quotemod_check"("b")
    unless $P10, rx283_fail
  alt293_0:
.annotate "line", 103
    set_addr $I10, alt293_1
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
.annotate "line", 104
  # rx subrule $P295 subtype=capture negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    .const 'Sub' $P295 = "96_1271336377.56964" 
    capture_lex $P295
    $P10 = rx283_cur.$P295()
    unless $P10, rx283_fail
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("textqq")
    rx283_pos = $P10."pos"()
    goto alt293_end
  alt293_1:
.annotate "line", 105
  # rx subcapture "x"
    set_addr $I10, rxcap_298_fail
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx charclass w
    ge rx283_pos, rx283_eos, rx283_fail
    sub $I10, rx283_pos, rx283_off
    is_cclass $I11, 8192, rx283_tgt, $I10
    unless $I11, rx283_fail
    inc rx283_pos
    set_addr $I10, rxcap_298_fail
    ($I12, $I11) = rx283_cur."!mark_peek"($I10)
    rx283_cur."!cursor_pos"($I11)
    ($P10) = rx283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx283_pos, "")
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("x")
    goto rxcap_298_done
  rxcap_298_fail:
    goto rx283_fail
  rxcap_298_done:
    rx283_cur."!cursor_pos"(rx283_pos)
    find_lex $P299, unicode:"$\x{a2}"
    $P300 = $P299."MATCH"()
    store_lex "$/", $P300
    .const 'Sub' $P302 = "97_1271336377.56964" 
    capture_lex $P302
    $P312 = $P302()
  alt293_end:
.annotate "line", 102
    goto alt292_end
  alt292_1:
.annotate "line", 107
  # rx subcapture "textq"
    set_addr $I10, rxcap_313_fail
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx charclass .
    ge rx283_pos, rx283_eos, rx283_fail
    inc rx283_pos
    set_addr $I10, rxcap_313_fail
    ($I12, $I11) = rx283_cur."!mark_peek"($I10)
    rx283_cur."!cursor_pos"($I11)
    ($P10) = rx283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx283_pos, "")
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("textq")
    goto rxcap_313_done
  rxcap_313_fail:
    goto rx283_fail
  rxcap_313_done:
  alt292_end:
.annotate "line", 99
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "quote_escape:sym<misc>")
    rx283_cur."!cursor_debug"("PASS  ", "quote_escape:sym<misc>", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_fail:
.annotate "line", 33
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<misc>")
    .return (rx283_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<misc>"  :subid("94_1271336377.56964") :method
.annotate "line", 33
    new $P285, "ResizablePMCArray"
    push $P285, ""
    .return ($P285)
.end


.namespace ["HLL";"Grammar"]
.sub "_block289"  :anon :subid("95_1271336377.56964") :outer("93_1271336377.56964")
.annotate "line", 100
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "_block294"  :anon :subid("96_1271336377.56964") :method :outer("93_1271336377.56964")
.annotate "line", 104
    .local string rx296_tgt
    .local int rx296_pos
    .local int rx296_off
    .local int rx296_eos
    .local int rx296_rep
    .local pmc rx296_cur
    (rx296_cur, rx296_pos, rx296_tgt) = self."!cursor_start"()
    rx296_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx296_cur
    .local pmc match
    .lex "$/", match
    length rx296_eos, rx296_tgt
    set rx296_off, 0
    lt rx296_pos, 2, rx296_start
    sub rx296_off, rx296_pos, 1
    substr rx296_tgt, rx296_tgt, rx296_off
  rx296_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan297_done
    goto rxscan297_scan
  rxscan297_loop:
    ($P10) = rx296_cur."from"()
    inc $P10
    set rx296_pos, $P10
    ge rx296_pos, rx296_eos, rxscan297_done
  rxscan297_scan:
    set_addr $I10, rxscan297_loop
    rx296_cur."!mark_push"(0, rx296_pos, $I10)
  rxscan297_done:
  # rx charclass W
    ge rx296_pos, rx296_eos, rx296_fail
    sub $I10, rx296_pos, rx296_off
    is_cclass $I11, 8192, rx296_tgt, $I10
    if $I11, rx296_fail
    inc rx296_pos
  # rx pass
    rx296_cur."!cursor_pass"(rx296_pos, "")
    rx296_cur."!cursor_debug"("PASS  ", "", " at pos=", rx296_pos)
    .return (rx296_cur)
  rx296_fail:
    (rx296_rep, rx296_pos, $I10, $P10) = rx296_cur."!mark_fail"(0)
    lt rx296_pos, -1, rx296_done
    eq rx296_pos, -1, rx296_fail
    jump $I10
  rx296_done:
    rx296_cur."!cursor_fail"()
    rx296_cur."!cursor_debug"("FAIL  ", "")
    .return (rx296_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "_block301"  :anon :subid("97_1271336377.56964") :outer("93_1271336377.56964")
.annotate "line", 105
    find_lex $P303, "$/"
    $P304 = $P303."CURSOR"()
    new $P305, "String"
    assign $P305, "Unrecognized backslash sequence: '\\"
    find_lex $P306, "$/"
    unless_null $P306, vivify_106
    $P306 = root_new ['parrot';'Hash']
  vivify_106:
    set $P307, $P306["x"]
    unless_null $P307, vivify_107
    new $P307, "Undef"
  vivify_107:
    $S308 = $P307."Str"()
    concat $P309, $P305, $S308
    concat $P310, $P309, "'"
    $P311 = $P304."panic"($P310)
    .return ($P311)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("98_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .const 'Sub' $P324 = "100_1271336377.56964" 
    capture_lex $P324
    .local string rx315_tgt
    .local int rx315_pos
    .local int rx315_off
    .local int rx315_eos
    .local int rx315_rep
    .local pmc rx315_cur
    (rx315_cur, rx315_pos, rx315_tgt) = self."!cursor_start"()
    rx315_cur."!cursor_debug"("START ", "charname")
    .lex unicode:"$\x{a2}", rx315_cur
    .local pmc match
    .lex "$/", match
    length rx315_eos, rx315_tgt
    set rx315_off, 0
    lt rx315_pos, 2, rx315_start
    sub rx315_off, rx315_pos, 1
    substr rx315_tgt, rx315_tgt, rx315_off
  rx315_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan319_done
    goto rxscan319_scan
  rxscan319_loop:
    ($P10) = rx315_cur."from"()
    inc $P10
    set rx315_pos, $P10
    ge rx315_pos, rx315_eos, rxscan319_done
  rxscan319_scan:
    set_addr $I10, rxscan319_loop
    rx315_cur."!mark_push"(0, rx315_pos, $I10)
  rxscan319_done:
  alt320_0:
.annotate "line", 111
    set_addr $I10, alt320_1
    rx315_cur."!mark_push"(0, rx315_pos, $I10)
.annotate "line", 112
  # rx subrule "integer" subtype=capture negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."integer"()
    unless $P10, rx315_fail
    rx315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx315_pos = $P10."pos"()
    goto alt320_end
  alt320_1:
.annotate "line", 113
  # rx enumcharlist negate=0 
    ge rx315_pos, rx315_eos, rx315_fail
    sub $I10, rx315_pos, rx315_off
    substr $S10, rx315_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx315_fail
    inc rx315_pos
  # rx rxquantf321 ** 0..*
    set_addr $I10, rxquantf321_loop
    rx315_cur."!mark_push"(0, rx315_pos, $I10)
    goto rxquantf321_done
  rxquantf321_loop:
  # rx enumcharlist negate=1 
    ge rx315_pos, rx315_eos, rx315_fail
    sub $I10, rx315_pos, rx315_off
    substr $S10, rx315_tgt, $I10, 1
    index $I11, "],#", $S10
    ge $I11, 0, rx315_fail
    inc rx315_pos
    set_addr $I10, rxquantf321_loop
    rx315_cur."!mark_push"($I322, rx315_pos, $I10)
  rxquantf321_done:
  # rx enumcharlist negate=0 
    ge rx315_pos, rx315_eos, rx315_fail
    sub $I10, rx315_pos, rx315_off
    substr $S10, rx315_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)", $S10
    lt $I11, 0, rx315_fail
    inc rx315_pos
.annotate "line", 114
  # rx subrule "before" subtype=zerowidth negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    .const 'Sub' $P324 = "100_1271336377.56964" 
    capture_lex $P324
    $P10 = rx315_cur."before"($P324)
    unless $P10, rx315_fail
  alt320_end:
.annotate "line", 111
  # rx pass
    rx315_cur."!cursor_pass"(rx315_pos, "charname")
    rx315_cur."!cursor_debug"("PASS  ", "charname", " at pos=", rx315_pos)
    .return (rx315_cur)
  rx315_fail:
.annotate "line", 33
    (rx315_rep, rx315_pos, $I10, $P10) = rx315_cur."!mark_fail"(0)
    lt rx315_pos, -1, rx315_done
    eq rx315_pos, -1, rx315_fail
    jump $I10
  rx315_done:
    rx315_cur."!cursor_fail"()
    rx315_cur."!cursor_debug"("FAIL  ", "charname")
    .return (rx315_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charname"  :subid("99_1271336377.56964") :method
.annotate "line", 33
    $P317 = self."!PREFIX__!subrule"("integer", "")
    new $P318, "ResizablePMCArray"
    push $P318, "Z"
    push $P318, "Y"
    push $P318, "X"
    push $P318, "W"
    push $P318, "V"
    push $P318, "U"
    push $P318, "T"
    push $P318, "S"
    push $P318, "R"
    push $P318, "Q"
    push $P318, "P"
    push $P318, "O"
    push $P318, "N"
    push $P318, "M"
    push $P318, "L"
    push $P318, "K"
    push $P318, "J"
    push $P318, "I"
    push $P318, "H"
    push $P318, "G"
    push $P318, "F"
    push $P318, "E"
    push $P318, "D"
    push $P318, "C"
    push $P318, "B"
    push $P318, "A"
    push $P318, "z"
    push $P318, "y"
    push $P318, "x"
    push $P318, "w"
    push $P318, "v"
    push $P318, "u"
    push $P318, "t"
    push $P318, "s"
    push $P318, "r"
    push $P318, "q"
    push $P318, "p"
    push $P318, "o"
    push $P318, "n"
    push $P318, "m"
    push $P318, "l"
    push $P318, "k"
    push $P318, "j"
    push $P318, "i"
    push $P318, "h"
    push $P318, "g"
    push $P318, "f"
    push $P318, "e"
    push $P318, "d"
    push $P318, "c"
    push $P318, "b"
    push $P318, "a"
    push $P318, $P317
    .return ($P318)
.end


.namespace ["HLL";"Grammar"]
.sub "_block323"  :anon :subid("100_1271336377.56964") :method :outer("98_1271336377.56964")
.annotate "line", 114
    .local string rx325_tgt
    .local int rx325_pos
    .local int rx325_off
    .local int rx325_eos
    .local int rx325_rep
    .local pmc rx325_cur
    (rx325_cur, rx325_pos, rx325_tgt) = self."!cursor_start"()
    rx325_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx325_cur
    .local pmc match
    .lex "$/", match
    length rx325_eos, rx325_tgt
    set rx325_off, 0
    lt rx325_pos, 2, rx325_start
    sub rx325_off, rx325_pos, 1
    substr rx325_tgt, rx325_tgt, rx325_off
  rx325_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan326_done
    goto rxscan326_scan
  rxscan326_loop:
    ($P10) = rx325_cur."from"()
    inc $P10
    set rx325_pos, $P10
    ge rx325_pos, rx325_eos, rxscan326_done
  rxscan326_scan:
    set_addr $I10, rxscan326_loop
    rx325_cur."!mark_push"(0, rx325_pos, $I10)
  rxscan326_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx325_pos, rx325_off
    find_not_cclass $I11, 32, rx325_tgt, $I10, rx325_eos
    add rx325_pos, rx325_off, $I11
  # rx enumcharlist negate=0 
    ge rx325_pos, rx325_eos, rx325_fail
    sub $I10, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I10, 1
    index $I11, "],#", $S10
    lt $I11, 0, rx325_fail
    inc rx325_pos
  # rx pass
    rx325_cur."!cursor_pass"(rx325_pos, "")
    rx325_cur."!cursor_debug"("PASS  ", "", " at pos=", rx325_pos)
    .return (rx325_cur)
  rx325_fail:
    (rx325_rep, rx325_pos, $I10, $P10) = rx325_cur."!mark_fail"(0)
    lt rx325_pos, -1, rx325_done
    eq rx325_pos, -1, rx325_fail
    jump $I10
  rx325_done:
    rx325_cur."!cursor_fail"()
    rx325_cur."!cursor_debug"("FAIL  ", "")
    .return (rx325_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "charnames"  :subid("101_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    (rx328_cur, rx328_pos, rx328_tgt) = self."!cursor_start"()
    rx328_cur."!cursor_debug"("START ", "charnames")
    rx328_cur."!cursor_caparray"("charname")
    .lex unicode:"$\x{a2}", rx328_cur
    .local pmc match
    .lex "$/", match
    length rx328_eos, rx328_tgt
    set rx328_off, 0
    lt rx328_pos, 2, rx328_start
    sub rx328_off, rx328_pos, 1
    substr rx328_tgt, rx328_tgt, rx328_off
  rx328_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan331_done
    goto rxscan331_scan
  rxscan331_loop:
    ($P10) = rx328_cur."from"()
    inc $P10
    set rx328_pos, $P10
    ge rx328_pos, rx328_eos, rxscan331_done
  rxscan331_scan:
    set_addr $I10, rxscan331_loop
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  rxscan331_done:
.annotate "line", 116
  # rx rxquantr332 ** 1..*
    set_addr $I333, rxquantr332_done
    rx328_cur."!mark_push"(0, -1, $I333)
  rxquantr332_loop:
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
  # rx subrule "charname" subtype=capture negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."charname"()
    unless $P10, rx328_fail
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charname")
    rx328_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
    (rx328_rep) = rx328_cur."!mark_commit"($I333)
    rx328_cur."!mark_push"(rx328_rep, rx328_pos, $I333)
  # rx literal  ","
    add $I11, rx328_pos, 1
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 1
    ne $S10, ",", rx328_fail
    add rx328_pos, 1
    goto rxquantr332_loop
  rxquantr332_done:
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "charnames")
    rx328_cur."!cursor_debug"("PASS  ", "charnames", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate "line", 33
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    rx328_cur."!cursor_debug"("FAIL  ", "charnames")
    .return (rx328_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charnames"  :subid("102_1271336377.56964") :method
.annotate "line", 33
    new $P330, "ResizablePMCArray"
    push $P330, ""
    .return ($P330)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("103_1271336377.56964") :method :outer("11_1271336377.56964")
.annotate "line", 33
    .local string rx335_tgt
    .local int rx335_pos
    .local int rx335_off
    .local int rx335_eos
    .local int rx335_rep
    .local pmc rx335_cur
    (rx335_cur, rx335_pos, rx335_tgt) = self."!cursor_start"()
    rx335_cur."!cursor_debug"("START ", "charspec")
    .lex unicode:"$\x{a2}", rx335_cur
    .local pmc match
    .lex "$/", match
    length rx335_eos, rx335_tgt
    set rx335_off, 0
    lt rx335_pos, 2, rx335_start
    sub rx335_off, rx335_pos, 1
    substr rx335_tgt, rx335_tgt, rx335_off
  rx335_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan340_done
    goto rxscan340_scan
  rxscan340_loop:
    ($P10) = rx335_cur."from"()
    inc $P10
    set rx335_pos, $P10
    ge rx335_pos, rx335_eos, rxscan340_done
  rxscan340_scan:
    set_addr $I10, rxscan340_loop
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
  rxscan340_done:
  alt341_0:
.annotate "line", 118
    set_addr $I10, alt341_1
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
.annotate "line", 119
  # rx literal  "["
    add $I11, rx335_pos, 1
    gt $I11, rx335_eos, rx335_fail
    sub $I11, rx335_pos, rx335_off
    substr $S10, rx335_tgt, $I11, 1
    ne $S10, "[", rx335_fail
    add rx335_pos, 1
  # rx subrule "charnames" subtype=capture negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."charnames"()
    unless $P10, rx335_fail
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charnames")
    rx335_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx335_pos, 1
    gt $I11, rx335_eos, rx335_fail
    sub $I11, rx335_pos, rx335_off
    substr $S10, rx335_tgt, $I11, 1
    ne $S10, "]", rx335_fail
    add rx335_pos, 1
    goto alt341_end
  alt341_1:
    set_addr $I10, alt341_2
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
.annotate "line", 120
  # rx charclass_q d r 1..-1
    sub $I10, rx335_pos, rx335_off
    find_not_cclass $I11, 8, rx335_tgt, $I10, rx335_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx335_fail
    add rx335_pos, rx335_off, $I11
  # rx rxquantr342 ** 0..*
    set_addr $I343, rxquantr342_done
    rx335_cur."!mark_push"(0, rx335_pos, $I343)
  rxquantr342_loop:
  # rx literal  "_"
    add $I11, rx335_pos, 1
    gt $I11, rx335_eos, rx335_fail
    sub $I11, rx335_pos, rx335_off
    substr $S10, rx335_tgt, $I11, 1
    ne $S10, "_", rx335_fail
    add rx335_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx335_pos, rx335_off
    find_not_cclass $I11, 8, rx335_tgt, $I10, rx335_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx335_fail
    add rx335_pos, rx335_off, $I11
    (rx335_rep) = rx335_cur."!mark_commit"($I343)
    rx335_cur."!mark_push"(rx335_rep, rx335_pos, $I343)
    goto rxquantr342_loop
  rxquantr342_done:
    goto alt341_end
  alt341_2:
    set_addr $I10, alt341_3
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
.annotate "line", 121
  # rx enumcharlist negate=0 
    ge rx335_pos, rx335_eos, rx335_fail
    sub $I10, rx335_pos, rx335_off
    substr $S10, rx335_tgt, $I10, 1
    index $I11, "?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx335_fail
    inc rx335_pos
    goto alt341_end
  alt341_3:
.annotate "line", 122
  # rx subrule "panic" subtype=method negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."panic"("Unrecognized \\c character")
    unless $P10, rx335_fail
    rx335_pos = $P10."pos"()
  alt341_end:
.annotate "line", 117
  # rx pass
    rx335_cur."!cursor_pass"(rx335_pos, "charspec")
    rx335_cur."!cursor_debug"("PASS  ", "charspec", " at pos=", rx335_pos)
    .return (rx335_cur)
  rx335_fail:
.annotate "line", 33
    (rx335_rep, rx335_pos, $I10, $P10) = rx335_cur."!mark_fail"(0)
    lt rx335_pos, -1, rx335_done
    eq rx335_pos, -1, rx335_fail
    jump $I10
  rx335_done:
    rx335_cur."!cursor_fail"()
    rx335_cur."!cursor_debug"("FAIL  ", "charspec")
    .return (rx335_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charspec"  :subid("104_1271336377.56964") :method
.annotate "line", 33
    $P337 = self."!PREFIX__!subrule"("", "")
    $P338 = self."!PREFIX__!subrule"("charnames", "[")
    new $P339, "ResizablePMCArray"
    push $P339, $P337
    push $P339, "Z"
    push $P339, "Y"
    push $P339, "X"
    push $P339, "W"
    push $P339, "V"
    push $P339, "U"
    push $P339, "T"
    push $P339, "S"
    push $P339, "R"
    push $P339, "Q"
    push $P339, "P"
    push $P339, "O"
    push $P339, "N"
    push $P339, "M"
    push $P339, "L"
    push $P339, "K"
    push $P339, "J"
    push $P339, "I"
    push $P339, "H"
    push $P339, "G"
    push $P339, "F"
    push $P339, "E"
    push $P339, "D"
    push $P339, "C"
    push $P339, "B"
    push $P339, "A"
    push $P339, "@"
    push $P339, "?"
    push $P339, ""
    push $P339, $P338
    .return ($P339)
.end

### .include 'gen/hllgrammar-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1271336380.06238")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
    $P578 = $P14()
.annotate "line", 1
    .return ($P578)
.end


.namespace []
.sub "" :load :init :subid("post50") :outer("10_1271336380.06238")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1271336380.06238" 
    .local pmc block
    set block, $P12
    $P579 = get_root_global ["parrot"], "P6metaclass"
    $P579."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block13"  :subid("11_1271336380.06238") :outer("10_1271336380.06238")
.annotate "line", 3
    .const 'Sub' $P561 = "49_1271336380.06238" 
    capture_lex $P561
    .const 'Sub' $P536 = "47_1271336380.06238" 
    capture_lex $P536
    .const 'Sub' $P505 = "46_1271336380.06238" 
    capture_lex $P505
    .const 'Sub' $P486 = "45_1271336380.06238" 
    capture_lex $P486
    .const 'Sub' $P479 = "44_1271336380.06238" 
    capture_lex $P479
    .const 'Sub' $P469 = "43_1271336380.06238" 
    capture_lex $P469
    .const 'Sub' $P452 = "42_1271336380.06238" 
    capture_lex $P452
    .const 'Sub' $P435 = "41_1271336380.06238" 
    capture_lex $P435
    .const 'Sub' $P428 = "40_1271336380.06238" 
    capture_lex $P428
    .const 'Sub' $P421 = "39_1271336380.06238" 
    capture_lex $P421
    .const 'Sub' $P414 = "38_1271336380.06238" 
    capture_lex $P414
    .const 'Sub' $P407 = "37_1271336380.06238" 
    capture_lex $P407
    .const 'Sub' $P400 = "36_1271336380.06238" 
    capture_lex $P400
    .const 'Sub' $P393 = "35_1271336380.06238" 
    capture_lex $P393
    .const 'Sub' $P383 = "34_1271336380.06238" 
    capture_lex $P383
    .const 'Sub' $P376 = "33_1271336380.06238" 
    capture_lex $P376
    .const 'Sub' $P360 = "32_1271336380.06238" 
    capture_lex $P360
    .const 'Sub' $P285 = "30_1271336380.06238" 
    capture_lex $P285
    .const 'Sub' $P222 = "27_1271336380.06238" 
    capture_lex $P222
    .const 'Sub' $P213 = "26_1271336380.06238" 
    capture_lex $P213
    .const 'Sub' $P204 = "25_1271336380.06238" 
    capture_lex $P204
    .const 'Sub' $P195 = "24_1271336380.06238" 
    capture_lex $P195
    .const 'Sub' $P186 = "23_1271336380.06238" 
    capture_lex $P186
    .const 'Sub' $P177 = "22_1271336380.06238" 
    capture_lex $P177
    .const 'Sub' $P167 = "21_1271336380.06238" 
    capture_lex $P167
    .const 'Sub' $P157 = "20_1271336380.06238" 
    capture_lex $P157
    .const 'Sub' $P149 = "19_1271336380.06238" 
    capture_lex $P149
    .const 'Sub' $P139 = "18_1271336380.06238" 
    capture_lex $P139
    .const 'Sub' $P129 = "17_1271336380.06238" 
    capture_lex $P129
    .const 'Sub' $P28 = "14_1271336380.06238" 
    capture_lex $P28
    .const 'Sub' $P22 = "13_1271336380.06238" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1271336380.06238" 
    capture_lex $P15
.annotate "line", 198
    .const 'Sub' $P561 = "49_1271336380.06238" 
    capture_lex $P561
.annotate "line", 3
    .return ($P561)
.end


.namespace ["HLL";"Actions"]
.sub "string_to_int"  :subid("12_1271336380.06238") :outer("11_1271336380.06238")
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
        if digitval >= base goto err_base
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
.end


.namespace ["HLL";"Actions"]
.sub "ints_to_string"  :subid("13_1271336380.06238") :outer("11_1271336380.06238")
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
.end


.namespace ["HLL";"Actions"]
.sub "EXPR"  :subid("14_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_31
    .param pmc param_32 :optional
    .param int has_param_32 :opt_flag
.annotate "line", 62
    .const 'Sub' $P111 = "16_1271336380.06238" 
    capture_lex $P111
    .const 'Sub' $P78 = "15_1271336380.06238" 
    capture_lex $P78
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "self", self
    .lex "$/", param_31
    if has_param_32, optparam_51
    new $P33, "Undef"
    set param_32, $P33
  optparam_51:
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
    $P41 = $P40."ast"()
    set $P39, $P41
    defined $I43, $P39
    if $I43, default_42
    find_lex $P44, "$/"
    unless_null $P44, vivify_52
    $P44 = root_new ['parrot';'Hash']
  vivify_52:
    set $P45, $P44["OPER"]
    unless_null $P45, vivify_53
    new $P45, "Undef"
  vivify_53:
    $P46 = $P45."ast"()
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
    unless_null $P53, vivify_54
    $P53 = root_new ['parrot';'Hash']
  vivify_54:
    set $P54, $P53["OPER"]
    unless_null $P54, vivify_55
    $P54 = root_new ['parrot';'Hash']
  vivify_55:
    set $P55, $P54["O"]
    unless_null $P55, vivify_56
    $P55 = root_new ['parrot';'Hash']
  vivify_56:
    set $P56, $P55["pasttype"]
    unless_null $P56, vivify_57
    new $P56, "Undef"
  vivify_57:
    if $P56, if_52
.annotate "line", 68
    find_lex $P64, "$/"
    unless_null $P64, vivify_58
    $P64 = root_new ['parrot';'Hash']
  vivify_58:
    set $P65, $P64["OPER"]
    unless_null $P65, vivify_59
    $P65 = root_new ['parrot';'Hash']
  vivify_59:
    set $P66, $P65["O"]
    unless_null $P66, vivify_60
    $P66 = root_new ['parrot';'Hash']
  vivify_60:
    set $P67, $P66["pirop"]
    unless_null $P67, vivify_61
    new $P67, "Undef"
  vivify_61:
    unless $P67, if_63_end
    find_lex $P68, "$past"
    find_lex $P69, "$/"
    unless_null $P69, vivify_62
    $P69 = root_new ['parrot';'Hash']
  vivify_62:
    set $P70, $P69["OPER"]
    unless_null $P70, vivify_63
    $P70 = root_new ['parrot';'Hash']
  vivify_63:
    set $P71, $P70["O"]
    unless_null $P71, vivify_64
    $P71 = root_new ['parrot';'Hash']
  vivify_64:
    set $P72, $P71["pirop"]
    unless_null $P72, vivify_65
    new $P72, "Undef"
  vivify_65:
    set $S73, $P72
    $P68."pirop"($S73)
  if_63_end:
    goto if_52_end
  if_52:
.annotate "line", 67
    find_lex $P57, "$past"
    find_lex $P58, "$/"
    unless_null $P58, vivify_66
    $P58 = root_new ['parrot';'Hash']
  vivify_66:
    set $P59, $P58["OPER"]
    unless_null $P59, vivify_67
    $P59 = root_new ['parrot';'Hash']
  vivify_67:
    set $P60, $P59["O"]
    unless_null $P60, vivify_68
    $P60 = root_new ['parrot';'Hash']
  vivify_68:
    set $P61, $P60["pasttype"]
    unless_null $P61, vivify_69
    new $P61, "Undef"
  vivify_69:
    set $S62, $P61
    $P57."pasttype"($S62)
  if_52_end:
.annotate "line", 69
    find_lex $P75, "$past"
    $P76 = $P75."name"()
    if $P76, unless_74_end
    .const 'Sub' $P78 = "15_1271336380.06238" 
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
    unless $I108, for_undef_73
    iter $P105, $P107
    new $P123, 'ExceptionHandler'
    set_addr $P123, loop122_handler
    $P123."handle_types"(65, 67, 66)
    push_eh $P123
  loop122_test:
    unless $P105, loop122_done
    shift $P109, $P105
  loop122_redo:
    .const 'Sub' $P111 = "16_1271336380.06238" 
    capture_lex $P111
    $P111($P109)
  loop122_next:
    goto loop122_test
  loop122_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, 'type'
    eq $P124, 65, loop122_next
    eq $P124, 67, loop122_redo
  loop122_done:
    pop_eh 
  for_undef_73:
.annotate "line", 81
    goto if_97_end
  if_97:
.annotate "line", 80
    find_lex $P101, "$past"
    find_lex $P102, "$/"
    unless_null $P102, vivify_74
    $P102 = root_new ['parrot';'ResizablePMCArray']
  vivify_74:
    set $P103, $P102[0]
    unless_null $P103, vivify_75
    new $P103, "Undef"
  vivify_75:
    $P104 = $P103."ast"()
    $P101."unshift"($P104)
  if_97_end:
.annotate "line", 84
    find_lex $P125, "$/"
    find_lex $P126, "$past"
    $P127 = $P125."!make"($P126)
.annotate "line", 62
    .return ($P127)
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["HLL";"Actions"]
.sub "_block77"  :anon :subid("15_1271336380.06238") :outer("14_1271336380.06238")
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
    unless_null $P87, vivify_70
    $P87 = root_new ['parrot';'Hash']
  vivify_70:
    set $P88, $P87["OPER"]
    unless_null $P88, vivify_71
    $P88 = root_new ['parrot';'Hash']
  vivify_71:
    set $P89, $P88["sym"]
    unless_null $P89, vivify_72
    new $P89, "Undef"
  vivify_72:
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
.sub "_block110"  :anon :subid("16_1271336380.06238") :outer("14_1271336380.06238")
    .param pmc param_112
.annotate "line", 82
    .lex "$_", param_112
    find_lex $P115, "$_"
    $P116 = $P115."ast"()
    defined $I117, $P116
    if $I117, if_114
    new $P113, 'Integer'
    set $P113, $I117
    goto if_114_end
  if_114:
    find_lex $P118, "$past"
    find_lex $P119, "$_"
    $P120 = $P119."ast"()
    $P121 = $P118."push"($P120)
    set $P113, $P121
  if_114_end:
    .return ($P113)
.end


.namespace ["HLL";"Actions"]
.sub "term:sym<circumfix>"  :subid("17_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_132
.annotate "line", 87
    new $P131, 'ExceptionHandler'
    set_addr $P131, control_130
    $P131."handle_types"(58)
    push_eh $P131
    .lex "self", self
    .lex "$/", param_132
    find_lex $P133, "$/"
    find_lex $P134, "$/"
    unless_null $P134, vivify_76
    $P134 = root_new ['parrot';'Hash']
  vivify_76:
    set $P135, $P134["circumfix"]
    unless_null $P135, vivify_77
    new $P135, "Undef"
  vivify_77:
    $P136 = $P135."ast"()
    $P137 = $P133."!make"($P136)
    .return ($P137)
  control_130:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
.end


.namespace ["HLL";"Actions"]
.sub "termish"  :subid("18_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_142
.annotate "line", 89
    new $P141, 'ExceptionHandler'
    set_addr $P141, control_140
    $P141."handle_types"(58)
    push_eh $P141
    .lex "self", self
    .lex "$/", param_142
    find_lex $P143, "$/"
    find_lex $P144, "$/"
    unless_null $P144, vivify_78
    $P144 = root_new ['parrot';'Hash']
  vivify_78:
    set $P145, $P144["term"]
    unless_null $P145, vivify_79
    new $P145, "Undef"
  vivify_79:
    $P146 = $P145."ast"()
    $P147 = $P143."!make"($P146)
    .return ($P147)
  control_140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P148, exception, "payload"
    .return ($P148)
.end


.namespace ["HLL";"Actions"]
.sub "nullterm"  :subid("19_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_152
.annotate "line", 90
    new $P151, 'ExceptionHandler'
    set_addr $P151, control_150
    $P151."handle_types"(58)
    push_eh $P151
    .lex "self", self
    .lex "$/", param_152
    find_lex $P153, "$/"
 $P154 = new ['Undef'] 
    $P155 = $P153."!make"($P154)
    .return ($P155)
  control_150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["HLL";"Actions"]
.sub "nullterm_alt"  :subid("20_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_160
.annotate "line", 91
    new $P159, 'ExceptionHandler'
    set_addr $P159, control_158
    $P159."handle_types"(58)
    push_eh $P159
    .lex "self", self
    .lex "$/", param_160
    find_lex $P161, "$/"
    find_lex $P162, "$/"
    unless_null $P162, vivify_80
    $P162 = root_new ['parrot';'Hash']
  vivify_80:
    set $P163, $P162["term"]
    unless_null $P163, vivify_81
    new $P163, "Undef"
  vivify_81:
    $P164 = $P163."ast"()
    $P165 = $P161."!make"($P164)
    .return ($P165)
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["HLL";"Actions"]
.sub "integer"  :subid("21_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_170
.annotate "line", 93
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    .lex "self", self
    .lex "$/", param_170
    find_lex $P171, "$/"
    find_lex $P172, "$/"
    unless_null $P172, vivify_82
    $P172 = root_new ['parrot';'Hash']
  vivify_82:
    set $P173, $P172["VALUE"]
    unless_null $P173, vivify_83
    new $P173, "Undef"
  vivify_83:
    $P174 = $P173."ast"()
    $P175 = $P171."!make"($P174)
    .return ($P175)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["HLL";"Actions"]
.sub "dec_number"  :subid("22_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_180
.annotate "line", 95
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "$/", param_180
    find_lex $P181, "$/"
    find_lex $P182, "$/"
    set $N183, $P182
    $P184 = $P181."!make"($N183)
    .return ($P184)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
.end


.namespace ["HLL";"Actions"]
.sub "decint"  :subid("23_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_189
.annotate "line", 97
    new $P188, 'ExceptionHandler'
    set_addr $P188, control_187
    $P188."handle_types"(58)
    push_eh $P188
    .lex "self", self
    .lex "$/", param_189
    find_lex $P190, "$/"
    find_lex $P191, "$/"
    $P192 = "string_to_int"($P191, 10)
    $P193 = $P190."!make"($P192)
    .return ($P193)
  control_187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P194, exception, "payload"
    .return ($P194)
.end


.namespace ["HLL";"Actions"]
.sub "hexint"  :subid("24_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_198
.annotate "line", 98
    new $P197, 'ExceptionHandler'
    set_addr $P197, control_196
    $P197."handle_types"(58)
    push_eh $P197
    .lex "self", self
    .lex "$/", param_198
    find_lex $P199, "$/"
    find_lex $P200, "$/"
    $P201 = "string_to_int"($P200, 16)
    $P202 = $P199."!make"($P201)
    .return ($P202)
  control_196:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P203, exception, "payload"
    .return ($P203)
.end


.namespace ["HLL";"Actions"]
.sub "octint"  :subid("25_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_207
.annotate "line", 99
    new $P206, 'ExceptionHandler'
    set_addr $P206, control_205
    $P206."handle_types"(58)
    push_eh $P206
    .lex "self", self
    .lex "$/", param_207
    find_lex $P208, "$/"
    find_lex $P209, "$/"
    $P210 = "string_to_int"($P209, 8)
    $P211 = $P208."!make"($P210)
    .return ($P211)
  control_205:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, "payload"
    .return ($P212)
.end


.namespace ["HLL";"Actions"]
.sub "binint"  :subid("26_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_216
.annotate "line", 100
    new $P215, 'ExceptionHandler'
    set_addr $P215, control_214
    $P215."handle_types"(58)
    push_eh $P215
    .lex "self", self
    .lex "$/", param_216
    find_lex $P217, "$/"
    find_lex $P218, "$/"
    $P219 = "string_to_int"($P218, 2)
    $P220 = $P217."!make"($P219)
    .return ($P220)
  control_214:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P221, exception, "payload"
    .return ($P221)
.end


.namespace ["HLL";"Actions"]
.sub "quote_EXPR"  :subid("27_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_225
.annotate "line", 102
    .const 'Sub' $P241 = "28_1271336380.06238" 
    capture_lex $P241
    new $P224, 'ExceptionHandler'
    set_addr $P224, control_223
    $P224."handle_types"(58)
    push_eh $P224
    .lex "self", self
    .lex "$/", param_225
.annotate "line", 103
    new $P226, "Undef"
    .lex "$past", $P226
    find_lex $P227, "$/"
    unless_null $P227, vivify_84
    $P227 = root_new ['parrot';'Hash']
  vivify_84:
    set $P228, $P227["quote_delimited"]
    unless_null $P228, vivify_85
    new $P228, "Undef"
  vivify_85:
    $P229 = $P228."ast"()
    store_lex "$past", $P229
.annotate "line", 104
    find_lex $P231, "$/"
    $P232 = $P231."CURSOR"()
    $P233 = $P232."quotemod_check"("w")
    unless $P233, if_230_end
.annotate "line", 105
    get_hll_global $P235, ["PAST"], "Node"
    find_lex $P236, "$past"
    $P237 = $P235."ACCEPTS"($P236)
    if $P237, if_234
.annotate "line", 108
    .const 'Sub' $P241 = "28_1271336380.06238" 
    capture_lex $P241
    $P241()
    goto if_234_end
  if_234:
.annotate "line", 106
    find_lex $P238, "$/"
    $P239 = $P238."CURSOR"()
    $P239."panic"("Can't form :w list from non-constant strings (yet)")
  if_234_end:
  if_230_end:
.annotate "line", 119
    get_hll_global $P273, ["PAST"], "Node"
    find_lex $P274, "$past"
    $P275 = $P273."ACCEPTS"($P274)
    isfalse $I276, $P275
    unless $I276, if_272_end
.annotate "line", 120
    get_hll_global $P277, ["PAST"], "Val"
    find_lex $P278, "$past"
    set $S279, $P278
    $P280 = $P277."new"($S279 :named("value"))
    store_lex "$past", $P280
  if_272_end:
.annotate "line", 122
    find_lex $P281, "$/"
    find_lex $P282, "$past"
    $P283 = $P281."!make"($P282)
.annotate "line", 102
    .return ($P283)
  control_223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P284, exception, "payload"
    .return ($P284)
.end


.namespace ["HLL";"Actions"]
.sub "_block240"  :anon :subid("28_1271336380.06238") :outer("27_1271336380.06238")
.annotate "line", 108
    .const 'Sub' $P260 = "29_1271336380.06238" 
    capture_lex $P260
.annotate "line", 109
    $P242 = root_new ['parrot';'ResizablePMCArray']
    .lex "@words", $P242
    get_hll_global $P243, ["HLL";"Grammar"], "split_words"
    find_lex $P244, "$/"
    find_lex $P245, "$past"
    $P246 = $P243($P244, $P245)
    store_lex "@words", $P246
.annotate "line", 110
    find_lex $P249, "@words"
    set $N250, $P249
    isgt $I251, $N250, 1.0
    if $I251, if_248
.annotate "line", 115
    find_lex $P268, "@words"
    unless_null $P268, vivify_86
    $P268 = root_new ['parrot';'ResizablePMCArray']
  vivify_86:
    set $P269, $P268[0]
    unless_null $P269, vivify_87
    new $P269, "Undef"
  vivify_87:
    set $S270, $P269
    new $P271, 'String'
    set $P271, $S270
    store_lex "$past", $P271
.annotate "line", 114
    set $P247, $P271
.annotate "line", 110
    goto if_248_end
  if_248:
.annotate "line", 111
    get_hll_global $P252, ["PAST"], "Op"
    find_lex $P253, "$/"
    $P254 = $P252."new"("list" :named("pasttype"), $P253 :named("node"))
    store_lex "$past", $P254
.annotate "line", 112
    find_lex $P256, "@words"
    defined $I257, $P256
    unless $I257, for_undef_88
    iter $P255, $P256
    new $P266, 'ExceptionHandler'
    set_addr $P266, loop265_handler
    $P266."handle_types"(65, 67, 66)
    push_eh $P266
  loop265_test:
    unless $P255, loop265_done
    shift $P258, $P255
  loop265_redo:
    .const 'Sub' $P260 = "29_1271336380.06238" 
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
  for_undef_88:
.annotate "line", 110
    set $P247, $P255
  if_248_end:
.annotate "line", 108
    .return ($P247)
.end


.namespace ["HLL";"Actions"]
.sub "_block259"  :anon :subid("29_1271336380.06238") :outer("28_1271336380.06238")
    .param pmc param_261
.annotate "line", 112
    .lex "$_", param_261
    find_lex $P262, "$past"
    find_lex $P263, "$_"
    $P264 = $P262."push"($P263)
    .return ($P264)
.end


.namespace ["HLL";"Actions"]
.sub "quote_delimited"  :subid("30_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_288
.annotate "line", 125
    .const 'Sub' $P300 = "31_1271336380.06238" 
    capture_lex $P300
    new $P287, 'ExceptionHandler'
    set_addr $P287, control_286
    $P287."handle_types"(58)
    push_eh $P287
    .lex "self", self
    .lex "$/", param_288
.annotate "line", 126
    $P289 = root_new ['parrot';'ResizablePMCArray']
    .lex "@parts", $P289
.annotate "line", 127
    new $P290, "Undef"
    .lex "$lastlit", $P290
.annotate "line", 143
    new $P291, "Undef"
    .lex "$past", $P291
.annotate "line", 125
    find_lex $P292, "@parts"
.annotate "line", 127
    new $P293, "String"
    assign $P293, ""
    store_lex "$lastlit", $P293
.annotate "line", 128
    find_lex $P295, "$/"
    unless_null $P295, vivify_89
    $P295 = root_new ['parrot';'Hash']
  vivify_89:
    set $P296, $P295["quote_atom"]
    unless_null $P296, vivify_90
    new $P296, "Undef"
  vivify_90:
    defined $I297, $P296
    unless $I297, for_undef_91
    iter $P294, $P296
    new $P333, 'ExceptionHandler'
    set_addr $P333, loop332_handler
    $P333."handle_types"(65, 67, 66)
    push_eh $P333
  loop332_test:
    unless $P294, loop332_done
    shift $P298, $P294
  loop332_redo:
    .const 'Sub' $P300 = "31_1271336380.06238" 
    capture_lex $P300
    $P300($P298)
  loop332_next:
    goto loop332_test
  loop332_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P334, exception, 'type'
    eq $P334, 65, loop332_next
    eq $P334, 67, loop332_redo
  loop332_done:
    pop_eh 
  for_undef_91:
.annotate "line", 142
    find_lex $P336, "$lastlit"
    set $S337, $P336
    isgt $I338, $S337, ""
    unless $I338, if_335_end
    find_lex $P339, "@parts"
    find_lex $P340, "$lastlit"
    $P339."push"($P340)
  if_335_end:
.annotate "line", 143
    find_lex $P343, "@parts"
    if $P343, if_342
    new $P346, "String"
    assign $P346, ""
    set $P341, $P346
    goto if_342_end
  if_342:
    find_lex $P344, "@parts"
    $P345 = $P344."shift"()
    set $P341, $P345
  if_342_end:
    store_lex "$past", $P341
.annotate "line", 144
    new $P354, 'ExceptionHandler'
    set_addr $P354, loop353_handler
    $P354."handle_types"(65, 67, 66)
    push_eh $P354
  loop353_test:
    find_lex $P347, "@parts"
    unless $P347, loop353_done
  loop353_redo:
.annotate "line", 145
    get_hll_global $P348, ["PAST"], "Op"
    find_lex $P349, "$past"
    find_lex $P350, "@parts"
    $P351 = $P350."shift"()
    $P352 = $P348."new"($P349, $P351, "concat" :named("pirop"))
    store_lex "$past", $P352
  loop353_next:
.annotate "line", 144
    goto loop353_test
  loop353_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P355, exception, 'type'
    eq $P355, 65, loop353_next
    eq $P355, 67, loop353_redo
  loop353_done:
    pop_eh 
.annotate "line", 147
    find_lex $P356, "$/"
    find_lex $P357, "$past"
    $P358 = $P356."!make"($P357)
.annotate "line", 125
    .return ($P358)
  control_286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P359, exception, "payload"
    .return ($P359)
.end


.namespace ["HLL";"Actions"]
.sub "_block299"  :anon :subid("31_1271336380.06238") :outer("30_1271336380.06238")
    .param pmc param_302
.annotate "line", 129
    new $P301, "Undef"
    .lex "$ast", $P301
    .lex "$_", param_302
    find_lex $P303, "$_"
    $P304 = $P303."ast"()
    store_lex "$ast", $P304
.annotate "line", 130
    get_hll_global $P307, ["PAST"], "Node"
    find_lex $P308, "$ast"
    $P309 = $P307."ACCEPTS"($P308)
    isfalse $I310, $P309
    if $I310, if_306
.annotate "line", 133
    find_lex $P316, "$ast"
    get_hll_global $P317, ["PAST"], "Val"
    $P318 = $P316."isa"($P317)
    if $P318, if_315
.annotate "line", 137
    find_lex $P324, "$lastlit"
    set $S325, $P324
    isgt $I326, $S325, ""
    unless $I326, if_323_end
    find_lex $P327, "@parts"
    find_lex $P328, "$lastlit"
    $P327."push"($P328)
  if_323_end:
.annotate "line", 138
    find_lex $P329, "@parts"
    find_lex $P330, "$ast"
    $P329."push"($P330)
.annotate "line", 139
    new $P331, "String"
    assign $P331, ""
    store_lex "$lastlit", $P331
.annotate "line", 136
    set $P314, $P331
.annotate "line", 133
    goto if_315_end
  if_315:
.annotate "line", 134
    find_lex $P319, "$lastlit"
    find_lex $P320, "$ast"
    $S321 = $P320."value"()
    concat $P322, $P319, $S321
    store_lex "$lastlit", $P322
.annotate "line", 133
    set $P314, $P322
  if_315_end:
    set $P305, $P314
.annotate "line", 130
    goto if_306_end
  if_306:
.annotate "line", 131
    find_lex $P311, "$lastlit"
    find_lex $P312, "$ast"
    concat $P313, $P311, $P312
    store_lex "$lastlit", $P313
.annotate "line", 130
    set $P305, $P313
  if_306_end:
.annotate "line", 128
    .return ($P305)
.end


.namespace ["HLL";"Actions"]
.sub "quote_atom"  :subid("32_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_363
.annotate "line", 150
    new $P362, 'ExceptionHandler'
    set_addr $P362, control_361
    $P362."handle_types"(58)
    push_eh $P362
    .lex "self", self
    .lex "$/", param_363
.annotate "line", 151
    find_lex $P364, "$/"
    find_lex $P367, "$/"
    unless_null $P367, vivify_92
    $P367 = root_new ['parrot';'Hash']
  vivify_92:
    set $P368, $P367["quote_escape"]
    unless_null $P368, vivify_93
    new $P368, "Undef"
  vivify_93:
    if $P368, if_366
    find_lex $P372, "$/"
    set $S373, $P372
    new $P365, 'String'
    set $P365, $S373
    goto if_366_end
  if_366:
    find_lex $P369, "$/"
    unless_null $P369, vivify_94
    $P369 = root_new ['parrot';'Hash']
  vivify_94:
    set $P370, $P369["quote_escape"]
    unless_null $P370, vivify_95
    new $P370, "Undef"
  vivify_95:
    $P371 = $P370."ast"()
    set $P365, $P371
  if_366_end:
    $P374 = $P364."!make"($P365)
.annotate "line", 150
    .return ($P374)
  control_361:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<backslash>"  :subid("33_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_379
.annotate "line", 154
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "self", self
    .lex "$/", param_379
    find_lex $P380, "$/"
    $P381 = $P380."!make"("\\")
    .return ($P381)
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P382, exception, "payload"
    .return ($P382)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<stopper>"  :subid("34_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_386
.annotate "line", 155
    new $P385, 'ExceptionHandler'
    set_addr $P385, control_384
    $P385."handle_types"(58)
    push_eh $P385
    .lex "self", self
    .lex "$/", param_386
    find_lex $P387, "$/"
    find_lex $P388, "$/"
    unless_null $P388, vivify_96
    $P388 = root_new ['parrot';'Hash']
  vivify_96:
    set $P389, $P388["stopper"]
    unless_null $P389, vivify_97
    new $P389, "Undef"
  vivify_97:
    set $S390, $P389
    $P391 = $P387."!make"($S390)
    .return ($P391)
  control_384:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P392, exception, "payload"
    .return ($P392)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<bs>"  :subid("35_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_396
.annotate "line", 157
    new $P395, 'ExceptionHandler'
    set_addr $P395, control_394
    $P395."handle_types"(58)
    push_eh $P395
    .lex "self", self
    .lex "$/", param_396
    find_lex $P397, "$/"
    $P398 = $P397."!make"("\b")
    .return ($P398)
  control_394:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P399, exception, "payload"
    .return ($P399)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<nl>"  :subid("36_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_403
.annotate "line", 158
    new $P402, 'ExceptionHandler'
    set_addr $P402, control_401
    $P402."handle_types"(58)
    push_eh $P402
    .lex "self", self
    .lex "$/", param_403
    find_lex $P404, "$/"
    $P405 = $P404."!make"("\n")
    .return ($P405)
  control_401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<cr>"  :subid("37_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_410
.annotate "line", 159
    new $P409, 'ExceptionHandler'
    set_addr $P409, control_408
    $P409."handle_types"(58)
    push_eh $P409
    .lex "self", self
    .lex "$/", param_410
    find_lex $P411, "$/"
    $P412 = $P411."!make"("\r")
    .return ($P412)
  control_408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P413, exception, "payload"
    .return ($P413)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<tab>"  :subid("38_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_417
.annotate "line", 160
    new $P416, 'ExceptionHandler'
    set_addr $P416, control_415
    $P416."handle_types"(58)
    push_eh $P416
    .lex "self", self
    .lex "$/", param_417
    find_lex $P418, "$/"
    $P419 = $P418."!make"("\t")
    .return ($P419)
  control_415:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P420, exception, "payload"
    .return ($P420)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<ff>"  :subid("39_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_424
.annotate "line", 161
    new $P423, 'ExceptionHandler'
    set_addr $P423, control_422
    $P423."handle_types"(58)
    push_eh $P423
    .lex "self", self
    .lex "$/", param_424
    find_lex $P425, "$/"
    $P426 = $P425."!make"("\f")
    .return ($P426)
  control_422:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P427, exception, "payload"
    .return ($P427)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<esc>"  :subid("40_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_431
.annotate "line", 162
    new $P430, 'ExceptionHandler'
    set_addr $P430, control_429
    $P430."handle_types"(58)
    push_eh $P430
    .lex "self", self
    .lex "$/", param_431
    find_lex $P432, "$/"
    $P433 = $P432."!make"("\e")
    .return ($P433)
  control_429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P434, exception, "payload"
    .return ($P434)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<hex>"  :subid("41_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_438
.annotate "line", 164
    new $P437, 'ExceptionHandler'
    set_addr $P437, control_436
    $P437."handle_types"(58)
    push_eh $P437
    .lex "self", self
    .lex "$/", param_438
.annotate "line", 165
    find_lex $P439, "$/"
    find_lex $P442, "$/"
    unless_null $P442, vivify_98
    $P442 = root_new ['parrot';'Hash']
  vivify_98:
    set $P443, $P442["hexint"]
    unless_null $P443, vivify_99
    new $P443, "Undef"
  vivify_99:
    if $P443, if_441
    find_lex $P446, "$/"
    unless_null $P446, vivify_100
    $P446 = root_new ['parrot';'Hash']
  vivify_100:
    set $P447, $P446["hexints"]
    unless_null $P447, vivify_101
    $P447 = root_new ['parrot';'Hash']
  vivify_101:
    set $P448, $P447["hexint"]
    unless_null $P448, vivify_102
    new $P448, "Undef"
  vivify_102:
    set $P440, $P448
    goto if_441_end
  if_441:
    find_lex $P444, "$/"
    unless_null $P444, vivify_103
    $P444 = root_new ['parrot';'Hash']
  vivify_103:
    set $P445, $P444["hexint"]
    unless_null $P445, vivify_104
    new $P445, "Undef"
  vivify_104:
    set $P440, $P445
  if_441_end:
    $P449 = "ints_to_string"($P440)
    $P450 = $P439."!make"($P449)
.annotate "line", 164
    .return ($P450)
  control_436:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P451, exception, "payload"
    .return ($P451)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<oct>"  :subid("42_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_455
.annotate "line", 168
    new $P454, 'ExceptionHandler'
    set_addr $P454, control_453
    $P454."handle_types"(58)
    push_eh $P454
    .lex "self", self
    .lex "$/", param_455
.annotate "line", 169
    find_lex $P456, "$/"
    find_lex $P459, "$/"
    unless_null $P459, vivify_105
    $P459 = root_new ['parrot';'Hash']
  vivify_105:
    set $P460, $P459["octint"]
    unless_null $P460, vivify_106
    new $P460, "Undef"
  vivify_106:
    if $P460, if_458
    find_lex $P463, "$/"
    unless_null $P463, vivify_107
    $P463 = root_new ['parrot';'Hash']
  vivify_107:
    set $P464, $P463["octints"]
    unless_null $P464, vivify_108
    $P464 = root_new ['parrot';'Hash']
  vivify_108:
    set $P465, $P464["octint"]
    unless_null $P465, vivify_109
    new $P465, "Undef"
  vivify_109:
    set $P457, $P465
    goto if_458_end
  if_458:
    find_lex $P461, "$/"
    unless_null $P461, vivify_110
    $P461 = root_new ['parrot';'Hash']
  vivify_110:
    set $P462, $P461["octint"]
    unless_null $P462, vivify_111
    new $P462, "Undef"
  vivify_111:
    set $P457, $P462
  if_458_end:
    $P466 = "ints_to_string"($P457)
    $P467 = $P456."!make"($P466)
.annotate "line", 168
    .return ($P467)
  control_453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P468, exception, "payload"
    .return ($P468)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<chr>"  :subid("43_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_472
.annotate "line", 172
    new $P471, 'ExceptionHandler'
    set_addr $P471, control_470
    $P471."handle_types"(58)
    push_eh $P471
    .lex "self", self
    .lex "$/", param_472
.annotate "line", 173
    find_lex $P473, "$/"
    find_lex $P474, "$/"
    unless_null $P474, vivify_112
    $P474 = root_new ['parrot';'Hash']
  vivify_112:
    set $P475, $P474["charspec"]
    unless_null $P475, vivify_113
    new $P475, "Undef"
  vivify_113:
    $P476 = $P475."ast"()
    $P477 = $P473."!make"($P476)
.annotate "line", 172
    .return ($P477)
  control_470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P478, exception, "payload"
    .return ($P478)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<0>"  :subid("44_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_482
.annotate "line", 176
    new $P481, 'ExceptionHandler'
    set_addr $P481, control_480
    $P481."handle_types"(58)
    push_eh $P481
    .lex "self", self
    .lex "$/", param_482
.annotate "line", 177
    find_lex $P483, "$/"
    $P484 = $P483."!make"(unicode:"\x{0}")
.annotate "line", 176
    .return ($P484)
  control_480:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P485, exception, "payload"
    .return ($P485)
.end


.namespace ["HLL";"Actions"]
.sub "quote_escape:sym<misc>"  :subid("45_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_489
.annotate "line", 180
    new $P488, 'ExceptionHandler'
    set_addr $P488, control_487
    $P488."handle_types"(58)
    push_eh $P488
    .lex "self", self
    .lex "$/", param_489
.annotate "line", 181
    find_lex $P490, "$/"
    find_lex $P493, "$/"
    unless_null $P493, vivify_114
    $P493 = root_new ['parrot';'Hash']
  vivify_114:
    set $P494, $P493["textq"]
    unless_null $P494, vivify_115
    new $P494, "Undef"
  vivify_115:
    if $P494, if_492
    find_lex $P500, "$/"
    unless_null $P500, vivify_116
    $P500 = root_new ['parrot';'Hash']
  vivify_116:
    set $P501, $P500["textqq"]
    unless_null $P501, vivify_117
    new $P501, "Undef"
  vivify_117:
    $P502 = $P501."Str"()
    set $P491, $P502
    goto if_492_end
  if_492:
    new $P495, "String"
    assign $P495, "\\"
    find_lex $P496, "$/"
    unless_null $P496, vivify_118
    $P496 = root_new ['parrot';'Hash']
  vivify_118:
    set $P497, $P496["textq"]
    unless_null $P497, vivify_119
    new $P497, "Undef"
  vivify_119:
    $S498 = $P497."Str"()
    concat $P499, $P495, $S498
    set $P491, $P499
  if_492_end:
    $P503 = $P490."!make"($P491)
.annotate "line", 180
    .return ($P503)
  control_487:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P504, exception, "payload"
    .return ($P504)
.end


.namespace ["HLL";"Actions"]
.sub "charname"  :subid("46_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_508
.annotate "line", 184
    new $P507, 'ExceptionHandler'
    set_addr $P507, control_506
    $P507."handle_types"(58)
    push_eh $P507
    .lex "self", self
    .lex "$/", param_508
.annotate "line", 185
    new $P509, "Undef"
    .lex "$codepoint", $P509
.annotate "line", 186
    find_lex $P512, "$/"
    unless_null $P512, vivify_120
    $P512 = root_new ['parrot';'Hash']
  vivify_120:
    set $P513, $P512["integer"]
    unless_null $P513, vivify_121
    new $P513, "Undef"
  vivify_121:
    if $P513, if_511
.annotate "line", 187
 $P517 = new ['CodeString'] 
    find_lex $P518, "$/"
    set $S519, $P518
    $P520 = $P517."charname_to_ord"($S519)
    set $P510, $P520
.annotate "line", 186
    goto if_511_end
  if_511:
    find_lex $P514, "$/"
    unless_null $P514, vivify_122
    $P514 = root_new ['parrot';'Hash']
  vivify_122:
    set $P515, $P514["integer"]
    unless_null $P515, vivify_123
    new $P515, "Undef"
  vivify_123:
    $P516 = $P515."ast"()
    set $P510, $P516
  if_511_end:
    store_lex "$codepoint", $P510
.annotate "line", 188
    find_lex $P522, "$codepoint"
    set $N523, $P522
    islt $I524, $N523, 0.0
    unless $I524, if_521_end
    find_lex $P525, "$/"
    $P526 = $P525."CURSOR"()
    new $P527, 'String'
    set $P527, "Unrecognized character name "
    find_lex $P528, "$/"
    concat $P529, $P527, $P528
    $P526."panic"($P529)
  if_521_end:
.annotate "line", 189
    find_lex $P530, "$/"
    find_lex $P531, "$codepoint"
    set $I532, $P531
    chr $S533, $I532
    $P534 = $P530."!make"($S533)
.annotate "line", 184
    .return ($P534)
  control_506:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P535, exception, "payload"
    .return ($P535)
.end


.namespace ["HLL";"Actions"]
.sub "charnames"  :subid("47_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_539
.annotate "line", 192
    .const 'Sub' $P548 = "48_1271336380.06238" 
    capture_lex $P548
    new $P538, 'ExceptionHandler'
    set_addr $P538, control_537
    $P538."handle_types"(58)
    push_eh $P538
    .lex "self", self
    .lex "$/", param_539
.annotate "line", 193
    new $P540, "Undef"
    .lex "$str", $P540
    new $P541, "String"
    assign $P541, ""
    store_lex "$str", $P541
.annotate "line", 194
    find_lex $P543, "$/"
    unless_null $P543, vivify_124
    $P543 = root_new ['parrot';'Hash']
  vivify_124:
    set $P544, $P543["charname"]
    unless_null $P544, vivify_125
    new $P544, "Undef"
  vivify_125:
    defined $I545, $P544
    unless $I545, for_undef_126
    iter $P542, $P544
    new $P555, 'ExceptionHandler'
    set_addr $P555, loop554_handler
    $P555."handle_types"(65, 67, 66)
    push_eh $P555
  loop554_test:
    unless $P542, loop554_done
    shift $P546, $P542
  loop554_redo:
    .const 'Sub' $P548 = "48_1271336380.06238" 
    capture_lex $P548
    $P548($P546)
  loop554_next:
    goto loop554_test
  loop554_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P556, exception, 'type'
    eq $P556, 65, loop554_next
    eq $P556, 67, loop554_redo
  loop554_done:
    pop_eh 
  for_undef_126:
.annotate "line", 195
    find_lex $P557, "$/"
    find_lex $P558, "$str"
    $P559 = $P557."!make"($P558)
.annotate "line", 192
    .return ($P559)
  control_537:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P560, exception, "payload"
    .return ($P560)
.end


.namespace ["HLL";"Actions"]
.sub "_block547"  :anon :subid("48_1271336380.06238") :outer("47_1271336380.06238")
    .param pmc param_549
.annotate "line", 194
    .lex "$_", param_549
    find_lex $P550, "$str"
    find_lex $P551, "$_"
    $S552 = $P551."ast"()
    concat $P553, $P550, $S552
    store_lex "$str", $P553
    .return ($P553)
.end


.namespace ["HLL";"Actions"]
.sub "charspec"  :subid("49_1271336380.06238") :method :outer("11_1271336380.06238")
    .param pmc param_564
.annotate "line", 198
    new $P563, 'ExceptionHandler'
    set_addr $P563, control_562
    $P563."handle_types"(58)
    push_eh $P563
    .lex "self", self
    .lex "$/", param_564
.annotate "line", 199
    find_lex $P565, "$/"
    find_lex $P568, "$/"
    unless_null $P568, vivify_127
    $P568 = root_new ['parrot';'Hash']
  vivify_127:
    set $P569, $P568["charnames"]
    unless_null $P569, vivify_128
    new $P569, "Undef"
  vivify_128:
    if $P569, if_567
    find_lex $P573, "$/"
    $I574 = "string_to_int"($P573, 10)
    chr $S575, $I574
    new $P566, 'String'
    set $P566, $S575
    goto if_567_end
  if_567:
    find_lex $P570, "$/"
    unless_null $P570, vivify_129
    $P570 = root_new ['parrot';'Hash']
  vivify_129:
    set $P571, $P570["charnames"]
    unless_null $P571, vivify_130
    new $P571, "Undef"
  vivify_130:
    $P572 = $P571."ast"()
    set $P566, $P572
  if_567_end:
    $P576 = $P565."!make"($P566)
.annotate "line", 198
    .return ($P576)
  control_562:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P577, exception, "payload"
    .return ($P577)
.end

### .include 'gen/hllcompiler.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1271336381.18625")
.annotate "line", 0
    get_hll_global $P14, ["HLL";"Compiler"], "_block13" 
    capture_lex $P14
.annotate "line", 6
    get_hll_global $P14, ["HLL";"Compiler"], "_block13" 
    capture_lex $P14
    $P283 = $P14()
.annotate "line", 1
    .return ($P283)
.end


.namespace []
.sub "" :load :init :subid("post25") :outer("10_1271336381.18625")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1271336381.18625" 
    .local pmc block
    set block, $P12
.annotate "line", 2
    load_bytecode "PCT/HLLCompiler.pbc"
.annotate "line", 1
    $P284 = get_root_global ["parrot"], "P6metaclass"
    new $P285, "ResizablePMCArray"
    push $P285, "$!language"
    $P284."new_class"("HLL::Compiler", "PCT::HLLCompiler" :named("parent"), $P285 :named("attr"))
.end


.namespace ["HLL";"Compiler"]
.sub "_block13"  :subid("11_1271336381.18625") :outer("10_1271336381.18625")
.annotate "line", 6
    .const 'Sub' $P187 = "20_1271336381.18625" 
    capture_lex $P187
    .const 'Sub' $P152 = "18_1271336381.18625" 
    capture_lex $P152
    .const 'Sub' $P137 = "17_1271336381.18625" 
    capture_lex $P137
    .const 'Sub' $P121 = "16_1271336381.18625" 
    capture_lex $P121
    .const 'Sub' $P32 = "13_1271336381.18625" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1271336381.18625" 
    capture_lex $P15
.annotate "line", 14
    .const 'Sub' $P15 = "12_1271336381.18625" 
    capture_lex $P15
    .lex "value_type", $P15
.annotate "line", 10
    find_lex $P31, "value_type"
.annotate "line", 69
    .const 'Sub' $P187 = "20_1271336381.18625" 
    capture_lex $P187
.annotate "line", 6
    .return ($P187)
.end


.namespace ["HLL";"Compiler"]
.sub "" :load :init :subid("post26") :outer("11_1271336381.18625")
.annotate "line", 6
    get_hll_global $P14, ["HLL";"Compiler"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 11
    get_hll_global $P282, ["HLL"], "Compiler"
    $P282."language"("parrot")
.end


.namespace ["HLL";"Compiler"]
.sub "value_type"  :subid("12_1271336381.18625") :outer("11_1271336381.18625")
    .param pmc param_18
.annotate "line", 14
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$value", param_18
.annotate "line", 15
    find_lex $P21, "$value"
    isa $I22, $P21, "NameSpace"
    if $I22, if_20
.annotate "line", 17
    find_lex $P26, "$value"
    isa $I27, $P26, "Sub"
    if $I27, if_25
    new $P29, "String"
    assign $P29, "var"
    set $P24, $P29
    goto if_25_end
  if_25:
    new $P28, "String"
    assign $P28, "sub"
    set $P24, $P28
  if_25_end:
    set $P19, $P24
.annotate "line", 15
    goto if_20_end
  if_20:
    new $P23, "String"
    assign $P23, "namespace"
    set $P19, $P23
  if_20_end:
.annotate "line", 14
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
.end


.namespace ["HLL";"Compiler"]
.sub "get_exports"  :subid("13_1271336381.18625") :method :outer("11_1271336381.18625")
    .param pmc param_35
    .param pmc param_38 :slurpy
    .param pmc param_36 :optional :named("tagset")
    .param int has_param_36 :opt_flag
.annotate "line", 20
    .const 'Sub' $P104 = "15_1271336381.18625" 
    capture_lex $P104
    .const 'Sub' $P83 = "14_1271336381.18625" 
    capture_lex $P83
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$module", param_35
    if has_param_36, optparam_27
    new $P37, "Undef"
    set param_36, $P37
  optparam_27:
    .lex "$tagset", param_36
    .lex "@symbols", param_38
.annotate "line", 27
    $P39 = root_new ['parrot';'Hash']
    .lex "%exports", $P39
.annotate "line", 28
    $P40 = root_new ['parrot';'Hash']
    .lex "%source", $P40
.annotate "line", 22
    find_lex $P42, "$module"
    does $I43, $P42, "hash"
    new $P44, 'Integer'
    set $P44, $I43
    isfalse $I45, $P44
    unless $I45, if_41_end
.annotate "line", 23
    find_lex $P46, "self"
    find_lex $P47, "$module"
    $P48 = $P46."get_module"($P47)
    store_lex "$module", $P48
  if_41_end:
.annotate "line", 26
    find_lex $P50, "$tagset"
    set $P49, $P50
    defined $I52, $P49
    if $I52, default_51
    find_lex $P55, "@symbols"
    if $P55, if_54
    new $P57, "String"
    assign $P57, "DEFAULT"
    set $P53, $P57
    goto if_54_end
  if_54:
    new $P56, "String"
    assign $P56, "ALL"
    set $P53, $P56
  if_54_end:
    set $P49, $P53
  default_51:
    store_lex "$tagset", $P49
    find_lex $P58, "%exports"
.annotate "line", 28
    find_lex $P59, "$tagset"
    set $S60, $P59
    find_lex $P61, "$module"
    unless_null $P61, vivify_28
    $P61 = root_new ['parrot';'Hash']
  vivify_28:
    set $P62, $P61["EXPORT"]
    unless_null $P62, vivify_29
    $P62 = root_new ['parrot';'Hash']
  vivify_29:
    set $P63, $P62[$S60]
    unless_null $P63, vivify_30
    new $P63, "Undef"
  vivify_30:
    store_lex "%source", $P63
.annotate "line", 29
    find_lex $P65, "%source"
    defined $I66, $P65
    new $P67, 'Integer'
    set $P67, $I66
    isfalse $I68, $P67
    unless $I68, if_64_end
.annotate "line", 30
    find_lex $P71, "$tagset"
    set $S72, $P71
    iseq $I73, $S72, "ALL"
    if $I73, if_70
    $P75 = root_new ['parrot';'Hash']
    set $P69, $P75
    goto if_70_end
  if_70:
    find_lex $P74, "$module"
    set $P69, $P74
  if_70_end:
    store_lex "%source", $P69
  if_64_end:
.annotate "line", 32
    find_lex $P77, "@symbols"
    if $P77, if_76
.annotate "line", 39
    find_lex $P100, "%source"
    defined $I101, $P100
    unless $I101, for_undef_31
    iter $P99, $P100
    new $P117, 'ExceptionHandler'
    set_addr $P117, loop116_handler
    $P117."handle_types"(65, 67, 66)
    push_eh $P117
  loop116_test:
    unless $P99, loop116_done
    shift $P102, $P99
  loop116_redo:
    .const 'Sub' $P104 = "15_1271336381.18625" 
    capture_lex $P104
    $P104($P102)
  loop116_next:
    goto loop116_test
  loop116_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, 65, loop116_next
    eq $P118, 67, loop116_redo
  loop116_done:
    pop_eh 
  for_undef_31:
.annotate "line", 38
    goto if_76_end
  if_76:
.annotate "line", 33
    find_lex $P79, "@symbols"
    defined $I80, $P79
    unless $I80, for_undef_34
    iter $P78, $P79
    new $P97, 'ExceptionHandler'
    set_addr $P97, loop96_handler
    $P97."handle_types"(65, 67, 66)
    push_eh $P97
  loop96_test:
    unless $P78, loop96_done
    shift $P81, $P78
  loop96_redo:
    .const 'Sub' $P83 = "14_1271336381.18625" 
    capture_lex $P83
    $P83($P81)
  loop96_next:
    goto loop96_test
  loop96_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, 'type'
    eq $P98, 65, loop96_next
    eq $P98, 67, loop96_redo
  loop96_done:
    pop_eh 
  for_undef_34:
  if_76_end:
.annotate "line", 32
    find_lex $P119, "%exports"
.annotate "line", 20
    .return ($P119)
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["HLL";"Compiler"]
.sub "_block103"  :anon :subid("15_1271336381.18625") :outer("13_1271336381.18625")
    .param pmc param_106
.annotate "line", 40
    new $P105, "Undef"
    .lex "$value", $P105
    .lex "$_", param_106
    find_lex $P107, "$_"
    $P108 = $P107."value"()
    store_lex "$value", $P108
.annotate "line", 41
    find_lex $P109, "$value"
    find_lex $P110, "$_"
    $P111 = $P110."key"()
    find_lex $P112, "$value"
    $P113 = "value_type"($P112)
    find_lex $P114, "%exports"
    unless_null $P114, vivify_32
    $P114 = root_new ['parrot';'Hash']
    store_lex "%exports", $P114
  vivify_32:
    set $P115, $P114[$P113]
    unless_null $P115, vivify_33
    $P115 = root_new ['parrot';'Hash']
    set $P114[$P113], $P115
  vivify_33:
    set $P115[$P111], $P109
.annotate "line", 39
    .return ($P109)
.end


.namespace ["HLL";"Compiler"]
.sub "_block82"  :anon :subid("14_1271336381.18625") :outer("13_1271336381.18625")
    .param pmc param_85
.annotate "line", 34
    new $P84, "Undef"
    .lex "$value", $P84
    .lex "$_", param_85
    find_lex $P86, "$_"
    set $S87, $P86
    find_lex $P88, "%source"
    unless_null $P88, vivify_35
    $P88 = root_new ['parrot';'Hash']
  vivify_35:
    set $P89, $P88[$S87]
    unless_null $P89, vivify_36
    new $P89, "Undef"
  vivify_36:
    store_lex "$value", $P89
.annotate "line", 35
    find_lex $P90, "$value"
    find_lex $P91, "$_"
    find_lex $P92, "$value"
    $P93 = "value_type"($P92)
    find_lex $P94, "%exports"
    unless_null $P94, vivify_37
    $P94 = root_new ['parrot';'Hash']
    store_lex "%exports", $P94
  vivify_37:
    set $P95, $P94[$P93]
    unless_null $P95, vivify_38
    $P95 = root_new ['parrot';'Hash']
    set $P94[$P93], $P95
  vivify_38:
    set $P95[$P91], $P90
.annotate "line", 33
    .return ($P90)
.end


.namespace ["HLL";"Compiler"]
.sub "get_module"  :subid("16_1271336381.18625") :method :outer("11_1271336381.18625")
    .param pmc param_124
.annotate "line", 47
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "self", self
    .lex "$name", param_124
.annotate "line", 48
    $P125 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P125
    find_lex $P126, "self"
    find_lex $P127, "$name"
    $P128 = $P126."parse_name"($P127)
    store_lex "@name", $P128
.annotate "line", 49
    find_lex $P129, "@name"
    find_lex $P130, "self"
    getattribute $P131, $P130, "$!language"
    unless_null $P131, vivify_39
    new $P131, "Undef"
  vivify_39:
    set $S132, $P131
    downcase $S133, $S132
    $P129."unshift"($S133)
.annotate "line", 50
    find_lex $P134, "@name"
    get_root_namespace $P135, $P134
.annotate "line", 47
    .return ($P135)
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
.end


.namespace ["HLL";"Compiler"]
.sub "language"  :subid("17_1271336381.18625") :method :outer("11_1271336381.18625")
    .param pmc param_140 :optional
    .param int has_param_140 :opt_flag
.annotate "line", 53
    new $P139, 'ExceptionHandler'
    set_addr $P139, control_138
    $P139."handle_types"(58)
    push_eh $P139
    .lex "self", self
    if has_param_140, optparam_40
    new $P141, "Undef"
    set param_140, $P141
  optparam_40:
    .lex "$name", param_140
.annotate "line", 54
    find_lex $P143, "$name"
    unless $P143, if_142_end
.annotate "line", 55
    find_lex $P144, "$name"
    find_lex $P145, "self"
    setattribute $P145, "$!language", $P144
.annotate "line", 56
    find_lex $P146, "$name"
    set $S147, $P146
    find_lex $P148, "self"
    compreg $S147, $P148
  if_142_end:
.annotate "line", 54
    find_lex $P149, "self"
    getattribute $P150, $P149, "$!language"
    unless_null $P150, vivify_41
    new $P150, "Undef"
  vivify_41:
.annotate "line", 53
    .return ($P150)
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P151, exception, "payload"
    .return ($P151)
.end


.namespace ["HLL";"Compiler"]
.sub "load_module"  :subid("18_1271336381.18625") :method :outer("11_1271336381.18625")
    .param pmc param_155
.annotate "line", 61
    .const 'Sub' $P165 = "19_1271336381.18625" 
    capture_lex $P165
    new $P154, 'ExceptionHandler'
    set_addr $P154, control_153
    $P154."handle_types"(58)
    push_eh $P154
    .lex "self", self
    .lex "$name", param_155
.annotate "line", 62
    new $P156, "Undef"
    .lex "$base", $P156
.annotate "line", 63
    new $P157, "Undef"
    .lex "$loaded", $P157
.annotate "line", 62
    find_lex $P158, "self"
    find_lex $P159, "$name"
    $P160 = $P158."parse_name"($P159)
    join $S161, "/", $P160
    new $P162, 'String'
    set $P162, $S161
    store_lex "$base", $P162
.annotate "line", 63
    new $P163, "Integer"
    assign $P163, 0
    store_lex "$loaded", $P163
.annotate "line", 64
    .const 'Sub' $P165 = "19_1271336381.18625" 
    capture_lex $P165
    $P165()
.annotate "line", 65
    find_lex $P178, "$loaded"
    if $P178, unless_177_end
    find_lex $P179, "$base"
    concat $P180, $P179, ".pir"
    set $S181, $P180
    load_bytecode $S181
    new $P182, "Integer"
    assign $P182, 1
    store_lex "$loaded", $P182
  unless_177_end:
.annotate "line", 66
    find_lex $P183, "self"
    find_lex $P184, "$name"
    $P185 = $P183."get_module"($P184)
.annotate "line", 61
    .return ($P185)
  control_153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P186, exception, "payload"
    .return ($P186)
.end


.namespace ["HLL";"Compiler"]
.sub "_block164"  :anon :subid("19_1271336381.18625") :outer("18_1271336381.18625")
.annotate "line", 64
    new $P172, 'ExceptionHandler'
    set_addr $P172, control_171
    $P172."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P172
    find_lex $P166, "$base"
    concat $P167, $P166, ".pbc"
    set $S168, $P167
    load_bytecode $S168
    new $P169, "Integer"
    assign $P169, 1
    store_lex "$loaded", $P169
    pop_eh 
    goto skip_handler_170
  control_171:
    .local pmc exception 
    .get_results (exception) 
    new $P175, 'Integer'
    set $P175, 1
    set exception["handled"], $P175
    set $I176, exception["handled"]
    ne $I176, 1, nothandled_174
  handled_173:
    .return (exception)
  nothandled_174:
    rethrow exception
  skip_handler_170:
    .return ($P169)
.end


.namespace ["HLL";"Compiler"]
.sub "import"  :subid("20_1271336381.18625") :method :outer("11_1271336381.18625")
    .param pmc param_190
    .param pmc param_191
.annotate "line", 69
    .const 'Sub' $P197 = "21_1271336381.18625" 
    capture_lex $P197
    new $P189, 'ExceptionHandler'
    set_addr $P189, control_188
    $P189."handle_types"(58)
    push_eh $P189
    .lex "self", self
    .lex "$target", param_190
    .lex "%exports", param_191
.annotate "line", 70
    find_lex $P193, "%exports"
    defined $I194, $P193
    unless $I194, for_undef_42
    iter $P192, $P193
    new $P279, 'ExceptionHandler'
    set_addr $P279, loop278_handler
    $P279."handle_types"(65, 67, 66)
    push_eh $P279
  loop278_test:
    unless $P192, loop278_done
    shift $P195, $P192
  loop278_redo:
    .const 'Sub' $P197 = "21_1271336381.18625" 
    capture_lex $P197
    $P197($P195)
  loop278_next:
    goto loop278_test
  loop278_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P280, exception, 'type'
    eq $P280, 65, loop278_next
    eq $P280, 67, loop278_redo
  loop278_done:
    pop_eh 
  for_undef_42:
.annotate "line", 69
    .return ($P192)
  control_188:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, "payload"
    .return ($P281)
.end


.namespace ["HLL";"Compiler"]
.sub "_block196"  :anon :subid("21_1271336381.18625") :outer("20_1271336381.18625")
    .param pmc param_200
.annotate "line", 70
    .const 'Sub' $P267 = "24_1271336381.18625" 
    capture_lex $P267
    .const 'Sub' $P247 = "23_1271336381.18625" 
    capture_lex $P247
    .const 'Sub' $P218 = "22_1271336381.18625" 
    capture_lex $P218
.annotate "line", 71
    new $P198, "Undef"
    .lex "$type", $P198
.annotate "line", 72
    $P199 = root_new ['parrot';'Hash']
    .lex "%items", $P199
    .lex "$_", param_200
.annotate "line", 71
    find_lex $P201, "$_"
    $P202 = $P201."key"()
    store_lex "$type", $P202
.annotate "line", 72
    find_lex $P203, "$_"
    $P204 = $P203."value"()
    store_lex "%items", $P204
.annotate "line", 73
    find_lex $P207, "self"
    new $P208, 'String'
    set $P208, "import_"
    find_lex $P209, "$type"
    concat $P210, $P208, $P209
    set $S211, $P210
    can $I212, $P207, $S211
    if $I212, if_206
.annotate "line", 76
    find_lex $P236, "$target"
    new $P237, 'String'
    set $P237, "add_"
    find_lex $P238, "$type"
    concat $P239, $P237, $P238
    set $S240, $P239
    can $I241, $P236, $S240
    if $I241, if_235
.annotate "line", 80
    find_lex $P263, "%items"
    defined $I264, $P263
    unless $I264, for_undef_43
    iter $P262, $P263
    new $P276, 'ExceptionHandler'
    set_addr $P276, loop275_handler
    $P276."handle_types"(65, 67, 66)
    push_eh $P276
  loop275_test:
    unless $P262, loop275_done
    shift $P265, $P262
  loop275_redo:
    .const 'Sub' $P267 = "24_1271336381.18625" 
    capture_lex $P267
    $P267($P265)
  loop275_next:
    goto loop275_test
  loop275_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P277, exception, 'type'
    eq $P277, 65, loop275_next
    eq $P277, 67, loop275_redo
  loop275_done:
    pop_eh 
  for_undef_43:
.annotate "line", 79
    set $P234, $P262
.annotate "line", 76
    goto if_235_end
  if_235:
.annotate "line", 77
    find_lex $P243, "%items"
    defined $I244, $P243
    unless $I244, for_undef_45
    iter $P242, $P243
    new $P260, 'ExceptionHandler'
    set_addr $P260, loop259_handler
    $P260."handle_types"(65, 67, 66)
    push_eh $P260
  loop259_test:
    unless $P242, loop259_done
    shift $P245, $P242
  loop259_redo:
    .const 'Sub' $P247 = "23_1271336381.18625" 
    capture_lex $P247
    $P247($P245)
  loop259_next:
    goto loop259_test
  loop259_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P261, exception, 'type'
    eq $P261, 65, loop259_next
    eq $P261, 67, loop259_redo
  loop259_done:
    pop_eh 
  for_undef_45:
.annotate "line", 76
    set $P234, $P242
  if_235_end:
    set $P205, $P234
.annotate "line", 73
    goto if_206_end
  if_206:
.annotate "line", 74
    find_lex $P214, "%items"
    defined $I215, $P214
    unless $I215, for_undef_46
    iter $P213, $P214
    new $P232, 'ExceptionHandler'
    set_addr $P232, loop231_handler
    $P232."handle_types"(65, 67, 66)
    push_eh $P232
  loop231_test:
    unless $P213, loop231_done
    shift $P216, $P213
  loop231_redo:
    .const 'Sub' $P218 = "22_1271336381.18625" 
    capture_lex $P218
    $P218($P216)
  loop231_next:
    goto loop231_test
  loop231_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, 'type'
    eq $P233, 65, loop231_next
    eq $P233, 67, loop231_redo
  loop231_done:
    pop_eh 
  for_undef_46:
.annotate "line", 73
    set $P205, $P213
  if_206_end:
.annotate "line", 70
    .return ($P205)
.end


.namespace ["HLL";"Compiler"]
.sub "_block266"  :anon :subid("24_1271336381.18625") :outer("21_1271336381.18625")
    .param pmc param_268
.annotate "line", 80
    .lex "$_", param_268
    find_lex $P269, "$_"
    $P270 = $P269."value"()
    find_lex $P271, "$_"
    $P272 = $P271."key"()
    set $S273, $P272
    find_lex $P274, "$target"
    unless_null $P274, vivify_44
    $P274 = root_new ['parrot';'Hash']
    store_lex "$target", $P274
  vivify_44:
    set $P274[$S273], $P270
    .return ($P270)
.end


.namespace ["HLL";"Compiler"]
.sub "_block246"  :anon :subid("23_1271336381.18625") :outer("21_1271336381.18625")
    .param pmc param_248
.annotate "line", 77
    .lex "$_", param_248
    find_lex $P249, "$target"
    find_lex $P250, "$_"
    $P251 = $P250."key"()
    find_lex $P252, "$_"
    $P253 = $P252."value"()
    new $P254, 'String'
    set $P254, "add_"
    find_lex $P255, "$type"
    concat $P256, $P254, $P255
    set $S257, $P256
    $P258 = $P249.$S257($P251, $P253)
    .return ($P258)
.end


.namespace ["HLL";"Compiler"]
.sub "_block217"  :anon :subid("22_1271336381.18625") :outer("21_1271336381.18625")
    .param pmc param_219
.annotate "line", 74
    .lex "$_", param_219
    find_lex $P220, "self"
    find_lex $P221, "$target"
    find_lex $P222, "$_"
    $P223 = $P222."key"()
    find_lex $P224, "$_"
    $P225 = $P224."value"()
    new $P226, 'String'
    set $P226, "import_"
    find_lex $P227, "$type"
    concat $P228, $P226, $P227
    set $S229, $P228
    $P230 = $P220.$S229($P221, $P223, $P225)
    .return ($P230)
.end


=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.

=head1 COPYRIGHT

Copyright (C) 2009, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
