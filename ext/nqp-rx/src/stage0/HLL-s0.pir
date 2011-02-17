# $Id$

=head1 NAME

HLL - Parrot HLL library

=head1 DESCRIPTION

This file brings together the various modules needed for HLL::Compiler
and HLL::Grammar.

=over 4

=cut

.sub '' :anon :load :init
    load_bytecode 'Regex.pbc'
.end

### .include 'src/cheats/hll-compiler.pir'
# we have to overload PCT::HLLCompiler's parse method to support P6Regex grammars

.include 'cclass.pasm'

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
    $S0 = replace $S0, 0, 1, ''
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


# Temporarily backport PCT::HLLCompiler's 'lineof' method
# from Parrot r48866 into HLL::Compiler, so that nqp-rx can
# continue to build from an older Parrot until parrot's trunk
# is working again.  When we're able to bump PARROT_REVISION,
# this code can go away to fall back to Parrot's version (DRY).
=item lineof(target, pos [, cache :named('cache')])

Return the line number of offset C<pos> within C<target>.  The return
value uses zero for the first line.  If C<cache> is true, then
memoize the line offsets as a C<!lineof> property on C<target>.

=cut

.sub 'lineof' :method
    .param pmc target
    .param int pos
    .param int cache           :optional :named('cache')
    .local pmc linepos

    # If we've previously cached C<linepos> for target, we use it.
    unless cache goto linepos_build
    linepos = getprop '!linepos', target
    unless null linepos goto linepos_done

    # calculate a new linepos array.
  linepos_build:
    linepos = new ['ResizableIntegerArray']
    unless cache goto linepos_build_1
    setprop target, '!linepos', linepos
  linepos_build_1:
    .local string s
    .local int jpos, eos
    s = target
    eos = length s
    jpos = 0
    # Search for all of the newline markers in C<target>.  When we
    # find one, mark the ending offset of the line in C<linepos>.
  linepos_loop:
    jpos = find_cclass .CCLASS_NEWLINE, s, jpos, eos
    unless jpos < eos goto linepos_done
    $I0 = ord s, jpos
    inc jpos
    push linepos, jpos
    # Treat \r\n as a single logical newline.
    if $I0 != 13 goto linepos_loop
    $I0 = ord s, jpos
    if $I0 != 10 goto linepos_loop
    inc jpos
    goto linepos_loop
  linepos_done:

    # We have C<linepos>, so now we search the array for the largest
    # element that is not greater than C<pos>.  The index of that
    # element is the line number to be returned.
    # (Potential optimization: use a binary search.)
    .local int line, count
    count = elements linepos
    line = 0
  line_loop:
    if line >= count goto line_done
    $I0 = linepos[line]
    if $I0 > pos goto line_done
    inc line
    goto line_loop
  line_done:
    .return (line)
.end


# This sub serves as a cumulative "outer context" for code
# executed in HLL::Compiler's interactive REPL.  It's invoked
# exactly once upon load/init to obtain a context, and its
# default LexPad is replaced with a Hash that we can use to
# cumulatively store outer context information.  Both the
# context and hash are then made available via package
# variables.
.namespace []
.sub '&interactive_outer' :lex :init :load
    .local pmc ctx, pad
    $P0 = getinterp
    ctx = $P0['context']
    set_global ['HLL';'Compiler'], '$interactive_ctx', ctx
    pad = getattribute ctx, 'lex_pad'
    $P1 = new ['Hash']
    copy pad, $P1
    set_global ['HLL';'Compiler'], '%interactive_pad', pad
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

    $P0 = get_hll_global ['HLL'], 'Compiler'
    $I1 = $P0.'lineof'(target, pos)
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

    .local pmc cur, debug
    .local string target
    .local int pos

    (cur, pos, target) = self.'!cursor_start'()
    debug = getattribute cur, '$!debug'
    if null debug goto debug_1
    cur.'!cursor_debug'('START', 'quote_EXPR')
  debug_1:

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
    if null debug goto done
    cur.'!cursor_debug'('PASS', 'quote_EXPR')
    goto done
  fail:
    if null debug goto done
    cur.'!cursor_debug'('FAIL', 'quote_EXPR')
  done:
    .return (cur)
.end


.sub 'quotemod_check' :method :nsentry
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


.sub 'split_words' :method :nsentry
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

    .local pmc here, pos, debug
    (here, pos) = self.'!cursor_start'()
    debug = getattribute here, '$!debug'
    if null debug goto debug_1
    here.'!cursor_debug'('START', 'EXPR')
  debug_1:

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

    $P0 = inO['sub']
    if null $P0 goto subprec_done
    inO['prec'] = $P0
  subprec_done:

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
    if null debug goto done
    here.'!cursor_debug'('PASS', 'EXPR')
    goto done

  fail:
    if null debug goto done
    here.'!cursor_debug'('FAIL', 'EXPR')
  done:
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
    self.'!cursor_debug'('START', 'MARKER name=', markname, ', pos=', pos)

    .local pmc markhash
    markhash = get_global '%!MARKHASH'
    unless null markhash goto have_markhash
    markhash = new ['Hash']
    set_global '%!MARKHASH', markhash
  have_markhash:
    markhash[markname] = pos
    self.'!cursor_debug'('PASS', 'MARKER')
    .return (1)
.end


.sub 'MARKED' :method
    .param pmc markname

    self.'!cursor_debug'('START','MARKED name=', markname)

    .local pmc markhash
    markhash = get_global '%!MARKHASH'
    if null markhash goto fail
    $P0 = markhash[markname]
    if null $P0 goto fail
    $P1 = self.'pos'()
    unless $P0 == $P1 goto fail
    self.'!cursor_debug'('PASS','MARKED')
    .return (1)
  fail:
    self.'!cursor_debug'('FAIL','MARKED')
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

### .include 'src/cheats/parrot-callcontext.pir'
.namespace ['CallContext']
.sub 'lexpad_full' :method
    .local pmc ctx, lexall, lexpad, lexpad_it
    ctx = self
    lexall = root_new ['parrot';'Hash']

  context_loop:
    if null ctx goto context_done
    lexpad = getattribute ctx, 'lex_pad'
    if null lexpad goto lexpad_done
    lexpad_it = iter lexpad
  lexpad_loop:
    unless lexpad_it goto lexpad_done
    $S0 = shift lexpad_it
    $I0 = exists lexall[$S0]
    if $I0 goto lexpad_loop
    $P0 = lexpad[$S0]
    lexall[$S0] = $P0
    goto lexpad_loop
  lexpad_done:
    ctx = getattribute ctx, 'outer_ctx'
    goto context_loop
  context_done:
    .return (lexall)
.end

### .include 'gen/hllgrammar-grammar.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1297880734.85639")
.annotate 'line', 0
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 5
    get_hll_global $P14, ["HLL";"Grammar"], "_block13" 
    capture_lex $P14
    $P339 = $P14()
.annotate 'line', 1
    .return ($P339)
    .const 'Sub' $P341 = "107_1297880734.85639" 
    .return ($P341)
.end


.namespace []
.sub "" :load :init :subid("post108") :outer("10_1297880734.85639")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880734.85639" 
    .local pmc block
    set block, $P12
    $P344 = get_root_global ["parrot"], "P6metaclass"
    $P344."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block13"  :subid("11_1297880734.85639") :outer("10_1297880734.85639")
.annotate 'line', 5
    .const 'Sub' $P319 = "103_1297880734.85639" 
    capture_lex $P319
    .const 'Sub' $P313 = "101_1297880734.85639" 
    capture_lex $P313
    .const 'Sub' $P300 = "98_1297880734.85639" 
    capture_lex $P300
    .const 'Sub' $P268 = "93_1297880734.85639" 
    capture_lex $P268
    .const 'Sub' $P262 = "91_1297880734.85639" 
    capture_lex $P262
    .const 'Sub' $P257 = "89_1297880734.85639" 
    capture_lex $P257
    .const 'Sub' $P251 = "87_1297880734.85639" 
    capture_lex $P251
    .const 'Sub' $P245 = "85_1297880734.85639" 
    capture_lex $P245
    .const 'Sub' $P240 = "83_1297880734.85639" 
    capture_lex $P240
    .const 'Sub' $P235 = "81_1297880734.85639" 
    capture_lex $P235
    .const 'Sub' $P230 = "79_1297880734.85639" 
    capture_lex $P230
    .const 'Sub' $P225 = "77_1297880734.85639" 
    capture_lex $P225
    .const 'Sub' $P220 = "75_1297880734.85639" 
    capture_lex $P220
    .const 'Sub' $P215 = "73_1297880734.85639" 
    capture_lex $P215
    .const 'Sub' $P210 = "71_1297880734.85639" 
    capture_lex $P210
    .const 'Sub' $P205 = "69_1297880734.85639" 
    capture_lex $P205
    .const 'Sub' $P195 = "65_1297880734.85639" 
    capture_lex $P195
    .const 'Sub' $P182 = "63_1297880734.85639" 
    capture_lex $P182
    .const 'Sub' $P170 = "61_1297880734.85639" 
    capture_lex $P170
    .const 'Sub' $P164 = "59_1297880734.85639" 
    capture_lex $P164
    .const 'Sub' $P157 = "57_1297880734.85639" 
    capture_lex $P157
    .const 'Sub' $P151 = "55_1297880734.85639" 
    capture_lex $P151
    .const 'Sub' $P144 = "53_1297880734.85639" 
    capture_lex $P144
    .const 'Sub' $P138 = "51_1297880734.85639" 
    capture_lex $P138
    .const 'Sub' $P131 = "49_1297880734.85639" 
    capture_lex $P131
    .const 'Sub' $P125 = "47_1297880734.85639" 
    capture_lex $P125
    .const 'Sub' $P119 = "45_1297880734.85639" 
    capture_lex $P119
    .const 'Sub' $P110 = "43_1297880734.85639" 
    capture_lex $P110
    .const 'Sub' $P102 = "41_1297880734.85639" 
    capture_lex $P102
    .const 'Sub' $P92 = "40_1297880734.85639" 
    capture_lex $P92
    .const 'Sub' $P86 = "38_1297880734.85639" 
    capture_lex $P86
    .const 'Sub' $P81 = "36_1297880734.85639" 
    capture_lex $P81
    .const 'Sub' $P73 = "34_1297880734.85639" 
    capture_lex $P73
    .const 'Sub' $P67 = "32_1297880734.85639" 
    capture_lex $P67
    .const 'Sub' $P61 = "30_1297880734.85639" 
    capture_lex $P61
    .const 'Sub' $P55 = "28_1297880734.85639" 
    capture_lex $P55
    .const 'Sub' $P22 = "14_1297880734.85639" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1297880734.85639" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 33
    .const 'Sub' $P319 = "103_1297880734.85639" 
    capture_lex $P319
.annotate 'line', 5
    .return ($P319)
    .const 'Sub' $P336 = "106_1297880734.85639" 
    .return ($P336)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx16_tgt
    .local int rx16_pos
    .local int rx16_off
    .local int rx16_eos
    .local int rx16_rep
    .local pmc rx16_cur
    .local pmc rx16_debug
    (rx16_cur, rx16_pos, rx16_tgt, $I10) = self."!cursor_start"()
    getattribute rx16_debug, rx16_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx16_cur
    .local pmc match
    .lex "$/", match
    length rx16_eos, rx16_tgt
    gt rx16_pos, rx16_eos, rx16_done
    set rx16_off, 0
    lt rx16_pos, 2, rx16_start
    sub rx16_off, rx16_pos, 1
    substr rx16_tgt, rx16_tgt, rx16_off
  rx16_start:
    eq $I10, 1, rx16_restart
    if_null rx16_debug, debug_109
    rx16_cur."!cursor_debug"("START", "ws")
  debug_109:
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
    set_addr $I10, rxquantr20_done
    rx16_cur."!mark_push"(0, rx16_pos, $I10)
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
    ord $I11, rx16_tgt, $I11
    ne $I11, 35, rx16_fail
    add rx16_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx16_pos, rx16_off
    find_cclass $I11, 4096, rx16_tgt, $I10, rx16_eos
    add rx16_pos, rx16_off, $I11
  alt21_end:
    set_addr $I10, rxquantr20_done
    (rx16_rep) = rx16_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr20_done
    rx16_cur."!mark_push"(rx16_rep, rx16_pos, $I10)
    goto rxquantr20_loop
  rxquantr20_done:
  # rx pass
    rx16_cur."!cursor_pass"(rx16_pos, "ws")
    if_null rx16_debug, debug_110
    rx16_cur."!cursor_debug"("PASS", "ws", " at pos=", rx16_pos)
  debug_110:
    .return (rx16_cur)
  rx16_restart:
    if_null rx16_debug, debug_111
    rx16_cur."!cursor_debug"("NEXT", "ws")
  debug_111:
  rx16_fail:
    (rx16_rep, rx16_pos, $I10, $P10) = rx16_cur."!mark_fail"(0)
    lt rx16_pos, -1, rx16_done
    eq rx16_pos, -1, rx16_fail
    jump $I10
  rx16_done:
    rx16_cur."!cursor_fail"()
    if_null rx16_debug, debug_112
    rx16_cur."!cursor_debug"("FAIL", "ws")
  debug_112:
    .return (rx16_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__ws"  :subid("13_1297880734.85639") :method
.annotate 'line', 5
    new $P18, "ResizablePMCArray"
    push $P18, ""
    .return ($P18)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx23_tgt
    .local int rx23_pos
    .local int rx23_off
    .local int rx23_eos
    .local int rx23_rep
    .local pmc rx23_cur
    .local pmc rx23_debug
    (rx23_cur, rx23_pos, rx23_tgt, $I10) = self."!cursor_start"()
    rx23_cur."!cursor_caparray"("prefixish", "postfixish")
    getattribute rx23_debug, rx23_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx23_cur
    .local pmc match
    .lex "$/", match
    length rx23_eos, rx23_tgt
    gt rx23_pos, rx23_eos, rx23_done
    set rx23_off, 0
    lt rx23_pos, 2, rx23_start
    sub rx23_off, rx23_pos, 1
    substr rx23_tgt, rx23_tgt, rx23_off
  rx23_start:
    eq $I10, 1, rx23_restart
    if_null rx23_debug, debug_113
    rx23_cur."!cursor_debug"("START", "termish")
  debug_113:
    $I10 = self.'from'()
    ne $I10, -1, rxscan26_done
    goto rxscan26_scan
  rxscan26_loop:
    ($P10) = rx23_cur."from"()
    inc $P10
    set rx23_pos, $P10
    ge rx23_pos, rx23_eos, rxscan26_done
  rxscan26_scan:
    set_addr $I10, rxscan26_loop
    rx23_cur."!mark_push"(0, rx23_pos, $I10)
  rxscan26_done:
.annotate 'line', 8
  # rx rxquantr27 ** 0..*
    set_addr $I10, rxquantr27_done
    rx23_cur."!mark_push"(0, rx23_pos, $I10)
  rxquantr27_loop:
  # rx subrule "prefixish" subtype=capture negate=
    rx23_cur."!cursor_pos"(rx23_pos)
    $P10 = rx23_cur."prefixish"()
    unless $P10, rx23_fail
    goto rxsubrule28_pass
  rxsubrule28_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx23_fail
  rxsubrule28_pass:
    set_addr $I10, rxsubrule28_back
    rx23_cur."!mark_push"(0, rx23_pos, $I10, $P10)
    $P10."!cursor_names"("prefixish")
    rx23_pos = $P10."pos"()
    set_addr $I10, rxquantr27_done
    (rx23_rep) = rx23_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr27_done
    rx23_cur."!mark_push"(rx23_rep, rx23_pos, $I10)
    goto rxquantr27_loop
  rxquantr27_done:
.annotate 'line', 9
  # rx subrule "term" subtype=capture negate=
    rx23_cur."!cursor_pos"(rx23_pos)
    $P10 = rx23_cur."term"()
    unless $P10, rx23_fail
    rx23_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx23_pos = $P10."pos"()
.annotate 'line', 10
  # rx rxquantr29 ** 0..*
    set_addr $I10, rxquantr29_done
    rx23_cur."!mark_push"(0, rx23_pos, $I10)
  rxquantr29_loop:
  # rx subrule "postfixish" subtype=capture negate=
    rx23_cur."!cursor_pos"(rx23_pos)
    $P10 = rx23_cur."postfixish"()
    unless $P10, rx23_fail
    goto rxsubrule30_pass
  rxsubrule30_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx23_fail
  rxsubrule30_pass:
    set_addr $I10, rxsubrule30_back
    rx23_cur."!mark_push"(0, rx23_pos, $I10, $P10)
    $P10."!cursor_names"("postfixish")
    rx23_pos = $P10."pos"()
    set_addr $I10, rxquantr29_done
    (rx23_rep) = rx23_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr29_done
    rx23_cur."!mark_push"(rx23_rep, rx23_pos, $I10)
    goto rxquantr29_loop
  rxquantr29_done:
.annotate 'line', 7
  # rx pass
    rx23_cur."!cursor_pass"(rx23_pos, "termish")
    if_null rx23_debug, debug_114
    rx23_cur."!cursor_debug"("PASS", "termish", " at pos=", rx23_pos)
  debug_114:
    .return (rx23_cur)
  rx23_restart:
.annotate 'line', 5
    if_null rx23_debug, debug_115
    rx23_cur."!cursor_debug"("NEXT", "termish")
  debug_115:
  rx23_fail:
    (rx23_rep, rx23_pos, $I10, $P10) = rx23_cur."!mark_fail"(0)
    lt rx23_pos, -1, rx23_done
    eq rx23_pos, -1, rx23_fail
    jump $I10
  rx23_done:
    rx23_cur."!cursor_fail"()
    if_null rx23_debug, debug_116
    rx23_cur."!cursor_debug"("FAIL", "termish")
  debug_116:
    .return (rx23_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__termish"  :subid("15_1297880734.85639") :method
.annotate 'line', 5
    new $P25, "ResizablePMCArray"
    push $P25, ""
    .return ($P25)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1297880734.85639") :method
.annotate 'line', 13
    $P32 = self."!protoregex"("term")
    .return ($P32)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1297880734.85639") :method
.annotate 'line', 13
    $P34 = self."!PREFIX__!protoregex"("term")
    .return ($P34)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1297880734.85639") :method
.annotate 'line', 14
    $P36 = self."!protoregex"("infix")
    .return ($P36)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1297880734.85639") :method
.annotate 'line', 14
    $P38 = self."!PREFIX__!protoregex"("infix")
    .return ($P38)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1297880734.85639") :method
.annotate 'line', 15
    $P40 = self."!protoregex"("prefix")
    .return ($P40)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1297880734.85639") :method
.annotate 'line', 15
    $P42 = self."!PREFIX__!protoregex"("prefix")
    .return ($P42)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1297880734.85639") :method
.annotate 'line', 16
    $P44 = self."!protoregex"("postfix")
    .return ($P44)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1297880734.85639") :method
.annotate 'line', 16
    $P46 = self."!PREFIX__!protoregex"("postfix")
    .return ($P46)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1297880734.85639") :method
.annotate 'line', 17
    $P48 = self."!protoregex"("circumfix")
    .return ($P48)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1297880734.85639") :method
.annotate 'line', 17
    $P50 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P50)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1297880734.85639") :method
.annotate 'line', 18
    $P52 = self."!protoregex"("postcircumfix")
    .return ($P52)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1297880734.85639") :method
.annotate 'line', 18
    $P54 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P54)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx56_tgt
    .local int rx56_pos
    .local int rx56_off
    .local int rx56_eos
    .local int rx56_rep
    .local pmc rx56_cur
    .local pmc rx56_debug
    (rx56_cur, rx56_pos, rx56_tgt, $I10) = self."!cursor_start"()
    getattribute rx56_debug, rx56_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx56_cur
    .local pmc match
    .lex "$/", match
    length rx56_eos, rx56_tgt
    gt rx56_pos, rx56_eos, rx56_done
    set rx56_off, 0
    lt rx56_pos, 2, rx56_start
    sub rx56_off, rx56_pos, 1
    substr rx56_tgt, rx56_tgt, rx56_off
  rx56_start:
    eq $I10, 1, rx56_restart
    if_null rx56_debug, debug_117
    rx56_cur."!cursor_debug"("START", "term:sym<circumfix>")
  debug_117:
    $I10 = self.'from'()
    ne $I10, -1, rxscan60_done
    goto rxscan60_scan
  rxscan60_loop:
    ($P10) = rx56_cur."from"()
    inc $P10
    set rx56_pos, $P10
    ge rx56_pos, rx56_eos, rxscan60_done
  rxscan60_scan:
    set_addr $I10, rxscan60_loop
    rx56_cur."!mark_push"(0, rx56_pos, $I10)
  rxscan60_done:
.annotate 'line', 20
  # rx subrule "circumfix" subtype=capture negate=
    rx56_cur."!cursor_pos"(rx56_pos)
    $P10 = rx56_cur."circumfix"()
    unless $P10, rx56_fail
    rx56_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx56_pos = $P10."pos"()
  # rx pass
    rx56_cur."!cursor_pass"(rx56_pos, "term:sym<circumfix>")
    if_null rx56_debug, debug_118
    rx56_cur."!cursor_debug"("PASS", "term:sym<circumfix>", " at pos=", rx56_pos)
  debug_118:
    .return (rx56_cur)
  rx56_restart:
.annotate 'line', 5
    if_null rx56_debug, debug_119
    rx56_cur."!cursor_debug"("NEXT", "term:sym<circumfix>")
  debug_119:
  rx56_fail:
    (rx56_rep, rx56_pos, $I10, $P10) = rx56_cur."!mark_fail"(0)
    lt rx56_pos, -1, rx56_done
    eq rx56_pos, -1, rx56_fail
    jump $I10
  rx56_done:
    rx56_cur."!cursor_fail"()
    if_null rx56_debug, debug_120
    rx56_cur."!cursor_debug"("FAIL", "term:sym<circumfix>")
  debug_120:
    .return (rx56_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1297880734.85639") :method
.annotate 'line', 5
    $P58 = self."!PREFIX__!subrule"("circumfix", "")
    new $P59, "ResizablePMCArray"
    push $P59, $P58
    .return ($P59)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    .local pmc rx62_debug
    (rx62_cur, rx62_pos, rx62_tgt, $I10) = self."!cursor_start"()
    getattribute rx62_debug, rx62_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx62_cur
    .local pmc match
    .lex "$/", match
    length rx62_eos, rx62_tgt
    gt rx62_pos, rx62_eos, rx62_done
    set rx62_off, 0
    lt rx62_pos, 2, rx62_start
    sub rx62_off, rx62_pos, 1
    substr rx62_tgt, rx62_tgt, rx62_off
  rx62_start:
    eq $I10, 1, rx62_restart
    if_null rx62_debug, debug_121
    rx62_cur."!cursor_debug"("START", "infixish")
  debug_121:
    $I10 = self.'from'()
    ne $I10, -1, rxscan66_done
    goto rxscan66_scan
  rxscan66_loop:
    ($P10) = rx62_cur."from"()
    inc $P10
    set rx62_pos, $P10
    ge rx62_pos, rx62_eos, rxscan66_done
  rxscan66_scan:
    set_addr $I10, rxscan66_loop
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
  rxscan66_done:
.annotate 'line', 22
  # rx subrule "infix" subtype=capture negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."infix"()
    unless $P10, rx62_fail
    rx62_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx62_pos = $P10."pos"()
  # rx pass
    rx62_cur."!cursor_pass"(rx62_pos, "infixish")
    if_null rx62_debug, debug_122
    rx62_cur."!cursor_debug"("PASS", "infixish", " at pos=", rx62_pos)
  debug_122:
    .return (rx62_cur)
  rx62_restart:
.annotate 'line', 5
    if_null rx62_debug, debug_123
    rx62_cur."!cursor_debug"("NEXT", "infixish")
  debug_123:
  rx62_fail:
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    if_null rx62_debug, debug_124
    rx62_cur."!cursor_debug"("FAIL", "infixish")
  debug_124:
    .return (rx62_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infixish"  :subid("31_1297880734.85639") :method
.annotate 'line', 5
    $P64 = self."!PREFIX__!subrule"("infix", "")
    new $P65, "ResizablePMCArray"
    push $P65, $P64
    .return ($P65)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx68_tgt
    .local int rx68_pos
    .local int rx68_off
    .local int rx68_eos
    .local int rx68_rep
    .local pmc rx68_cur
    .local pmc rx68_debug
    (rx68_cur, rx68_pos, rx68_tgt, $I10) = self."!cursor_start"()
    getattribute rx68_debug, rx68_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx68_cur
    .local pmc match
    .lex "$/", match
    length rx68_eos, rx68_tgt
    gt rx68_pos, rx68_eos, rx68_done
    set rx68_off, 0
    lt rx68_pos, 2, rx68_start
    sub rx68_off, rx68_pos, 1
    substr rx68_tgt, rx68_tgt, rx68_off
  rx68_start:
    eq $I10, 1, rx68_restart
    if_null rx68_debug, debug_125
    rx68_cur."!cursor_debug"("START", "prefixish")
  debug_125:
    $I10 = self.'from'()
    ne $I10, -1, rxscan72_done
    goto rxscan72_scan
  rxscan72_loop:
    ($P10) = rx68_cur."from"()
    inc $P10
    set rx68_pos, $P10
    ge rx68_pos, rx68_eos, rxscan72_done
  rxscan72_scan:
    set_addr $I10, rxscan72_loop
    rx68_cur."!mark_push"(0, rx68_pos, $I10)
  rxscan72_done:
.annotate 'line', 23
  # rx subrule "prefix" subtype=capture negate=
    rx68_cur."!cursor_pos"(rx68_pos)
    $P10 = rx68_cur."prefix"()
    unless $P10, rx68_fail
    rx68_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=prefix")
    rx68_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx68_cur."!cursor_pos"(rx68_pos)
    $P10 = rx68_cur."ws"()
    unless $P10, rx68_fail
    rx68_pos = $P10."pos"()
  # rx pass
    rx68_cur."!cursor_pass"(rx68_pos, "prefixish")
    if_null rx68_debug, debug_126
    rx68_cur."!cursor_debug"("PASS", "prefixish", " at pos=", rx68_pos)
  debug_126:
    .return (rx68_cur)
  rx68_restart:
.annotate 'line', 5
    if_null rx68_debug, debug_127
    rx68_cur."!cursor_debug"("NEXT", "prefixish")
  debug_127:
  rx68_fail:
    (rx68_rep, rx68_pos, $I10, $P10) = rx68_cur."!mark_fail"(0)
    lt rx68_pos, -1, rx68_done
    eq rx68_pos, -1, rx68_fail
    jump $I10
  rx68_done:
    rx68_cur."!cursor_fail"()
    if_null rx68_debug, debug_128
    rx68_cur."!cursor_debug"("FAIL", "prefixish")
  debug_128:
    .return (rx68_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefixish"  :subid("33_1297880734.85639") :method
.annotate 'line', 5
    $P70 = self."!PREFIX__!subrule"("prefix", "")
    new $P71, "ResizablePMCArray"
    push $P71, $P70
    .return ($P71)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx74_tgt
    .local int rx74_pos
    .local int rx74_off
    .local int rx74_eos
    .local int rx74_rep
    .local pmc rx74_cur
    .local pmc rx74_debug
    (rx74_cur, rx74_pos, rx74_tgt, $I10) = self."!cursor_start"()
    getattribute rx74_debug, rx74_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx74_cur
    .local pmc match
    .lex "$/", match
    length rx74_eos, rx74_tgt
    gt rx74_pos, rx74_eos, rx74_done
    set rx74_off, 0
    lt rx74_pos, 2, rx74_start
    sub rx74_off, rx74_pos, 1
    substr rx74_tgt, rx74_tgt, rx74_off
  rx74_start:
    eq $I10, 1, rx74_restart
    if_null rx74_debug, debug_129
    rx74_cur."!cursor_debug"("START", "postfixish")
  debug_129:
    $I10 = self.'from'()
    ne $I10, -1, rxscan79_done
    goto rxscan79_scan
  rxscan79_loop:
    ($P10) = rx74_cur."from"()
    inc $P10
    set rx74_pos, $P10
    ge rx74_pos, rx74_eos, rxscan79_done
  rxscan79_scan:
    set_addr $I10, rxscan79_loop
    rx74_cur."!mark_push"(0, rx74_pos, $I10)
  rxscan79_done:
  alt80_0:
.annotate 'line', 24
    set_addr $I10, alt80_1
    rx74_cur."!mark_push"(0, rx74_pos, $I10)
.annotate 'line', 25
  # rx subrule "postfix" subtype=capture negate=
    rx74_cur."!cursor_pos"(rx74_pos)
    $P10 = rx74_cur."postfix"()
    unless $P10, rx74_fail
    rx74_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postfix")
    rx74_pos = $P10."pos"()
    goto alt80_end
  alt80_1:
.annotate 'line', 26
  # rx subrule "postcircumfix" subtype=capture negate=
    rx74_cur."!cursor_pos"(rx74_pos)
    $P10 = rx74_cur."postcircumfix"()
    unless $P10, rx74_fail
    rx74_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postcircumfix")
    rx74_pos = $P10."pos"()
  alt80_end:
.annotate 'line', 24
  # rx pass
    rx74_cur."!cursor_pass"(rx74_pos, "postfixish")
    if_null rx74_debug, debug_130
    rx74_cur."!cursor_debug"("PASS", "postfixish", " at pos=", rx74_pos)
  debug_130:
    .return (rx74_cur)
  rx74_restart:
.annotate 'line', 5
    if_null rx74_debug, debug_131
    rx74_cur."!cursor_debug"("NEXT", "postfixish")
  debug_131:
  rx74_fail:
    (rx74_rep, rx74_pos, $I10, $P10) = rx74_cur."!mark_fail"(0)
    lt rx74_pos, -1, rx74_done
    eq rx74_pos, -1, rx74_fail
    jump $I10
  rx74_done:
    rx74_cur."!cursor_fail"()
    if_null rx74_debug, debug_132
    rx74_cur."!cursor_debug"("FAIL", "postfixish")
  debug_132:
    .return (rx74_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfixish"  :subid("35_1297880734.85639") :method
.annotate 'line', 5
    $P76 = self."!PREFIX__!subrule"("postcircumfix", "")
    $P77 = self."!PREFIX__!subrule"("postfix", "")
    new $P78, "ResizablePMCArray"
    push $P78, $P76
    push $P78, $P77
    .return ($P78)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm"  :subid("36_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx82_tgt
    .local int rx82_pos
    .local int rx82_off
    .local int rx82_eos
    .local int rx82_rep
    .local pmc rx82_cur
    .local pmc rx82_debug
    (rx82_cur, rx82_pos, rx82_tgt, $I10) = self."!cursor_start"()
    getattribute rx82_debug, rx82_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx82_cur
    .local pmc match
    .lex "$/", match
    length rx82_eos, rx82_tgt
    gt rx82_pos, rx82_eos, rx82_done
    set rx82_off, 0
    lt rx82_pos, 2, rx82_start
    sub rx82_off, rx82_pos, 1
    substr rx82_tgt, rx82_tgt, rx82_off
  rx82_start:
    eq $I10, 1, rx82_restart
    if_null rx82_debug, debug_133
    rx82_cur."!cursor_debug"("START", "nullterm")
  debug_133:
    $I10 = self.'from'()
    ne $I10, -1, rxscan85_done
    goto rxscan85_scan
  rxscan85_loop:
    ($P10) = rx82_cur."from"()
    inc $P10
    set rx82_pos, $P10
    ge rx82_pos, rx82_eos, rxscan85_done
  rxscan85_scan:
    set_addr $I10, rxscan85_loop
    rx82_cur."!mark_push"(0, rx82_pos, $I10)
  rxscan85_done:
.annotate 'line', 29
  # rx pass
    rx82_cur."!cursor_pass"(rx82_pos, "nullterm")
    if_null rx82_debug, debug_134
    rx82_cur."!cursor_debug"("PASS", "nullterm", " at pos=", rx82_pos)
  debug_134:
    .return (rx82_cur)
  rx82_restart:
.annotate 'line', 5
    if_null rx82_debug, debug_135
    rx82_cur."!cursor_debug"("NEXT", "nullterm")
  debug_135:
  rx82_fail:
    (rx82_rep, rx82_pos, $I10, $P10) = rx82_cur."!mark_fail"(0)
    lt rx82_pos, -1, rx82_done
    eq rx82_pos, -1, rx82_fail
    jump $I10
  rx82_done:
    rx82_cur."!cursor_fail"()
    if_null rx82_debug, debug_136
    rx82_cur."!cursor_debug"("FAIL", "nullterm")
  debug_136:
    .return (rx82_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm"  :subid("37_1297880734.85639") :method
.annotate 'line', 5
    new $P84, "ResizablePMCArray"
    push $P84, ""
    .return ($P84)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm_alt"  :subid("38_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 5
    .local string rx87_tgt
    .local int rx87_pos
    .local int rx87_off
    .local int rx87_eos
    .local int rx87_rep
    .local pmc rx87_cur
    .local pmc rx87_debug
    (rx87_cur, rx87_pos, rx87_tgt, $I10) = self."!cursor_start"()
    getattribute rx87_debug, rx87_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx87_cur
    .local pmc match
    .lex "$/", match
    length rx87_eos, rx87_tgt
    gt rx87_pos, rx87_eos, rx87_done
    set rx87_off, 0
    lt rx87_pos, 2, rx87_start
    sub rx87_off, rx87_pos, 1
    substr rx87_tgt, rx87_tgt, rx87_off
  rx87_start:
    eq $I10, 1, rx87_restart
    if_null rx87_debug, debug_137
    rx87_cur."!cursor_debug"("START", "nullterm_alt")
  debug_137:
    $I10 = self.'from'()
    ne $I10, -1, rxscan91_done
    goto rxscan91_scan
  rxscan91_loop:
    ($P10) = rx87_cur."from"()
    inc $P10
    set rx87_pos, $P10
    ge rx87_pos, rx87_eos, rxscan91_done
  rxscan91_scan:
    set_addr $I10, rxscan91_loop
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
  rxscan91_done:
.annotate 'line', 30
  # rx subrule "nullterm" subtype=capture negate=
    rx87_cur."!cursor_pos"(rx87_pos)
    $P10 = rx87_cur."nullterm"()
    unless $P10, rx87_fail
    rx87_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx87_pos = $P10."pos"()
  # rx pass
    rx87_cur."!cursor_pass"(rx87_pos, "nullterm_alt")
    if_null rx87_debug, debug_138
    rx87_cur."!cursor_debug"("PASS", "nullterm_alt", " at pos=", rx87_pos)
  debug_138:
    .return (rx87_cur)
  rx87_restart:
.annotate 'line', 5
    if_null rx87_debug, debug_139
    rx87_cur."!cursor_debug"("NEXT", "nullterm_alt")
  debug_139:
  rx87_fail:
    (rx87_rep, rx87_pos, $I10, $P10) = rx87_cur."!mark_fail"(0)
    lt rx87_pos, -1, rx87_done
    eq rx87_pos, -1, rx87_fail
    jump $I10
  rx87_done:
    rx87_cur."!cursor_fail"()
    if_null rx87_debug, debug_140
    rx87_cur."!cursor_debug"("FAIL", "nullterm_alt")
  debug_140:
    .return (rx87_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm_alt"  :subid("39_1297880734.85639") :method
.annotate 'line', 5
    $P89 = self."!PREFIX__!subrule"("nullterm", "")
    new $P90, "ResizablePMCArray"
    push $P90, $P89
    .return ($P90)
.end


.namespace ["HLL";"Grammar"]
.include "except_types.pasm"
.sub "nulltermish"  :subid("40_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    new $P94, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P94, control_93
    push_eh $P94
    .lex "self", self
    find_lex $P97, "self"
    $P98 = $P97."termish"()
    unless $P98, unless_96
    set $P95, $P98
    goto unless_96_end
  unless_96:
    find_lex $P99, "self"
    $P100 = $P99."nullterm_alt"()
    set $P95, $P100
  unless_96_end:
    .return ($P95)
  control_93:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("41_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    .local pmc rx103_debug
    (rx103_cur, rx103_pos, rx103_tgt, $I10) = self."!cursor_start"()
    rx103_cur."!cursor_caparray"("quote_atom")
    getattribute rx103_debug, rx103_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx103_cur
    .local pmc match
    .lex "$/", match
    length rx103_eos, rx103_tgt
    gt rx103_pos, rx103_eos, rx103_done
    set rx103_off, 0
    lt rx103_pos, 2, rx103_start
    sub rx103_off, rx103_pos, 1
    substr rx103_tgt, rx103_tgt, rx103_off
  rx103_start:
    eq $I10, 1, rx103_restart
    if_null rx103_debug, debug_141
    rx103_cur."!cursor_debug"("START", "quote_delimited")
  debug_141:
    $I10 = self.'from'()
    ne $I10, -1, rxscan107_done
    goto rxscan107_scan
  rxscan107_loop:
    ($P10) = rx103_cur."from"()
    inc $P10
    set rx103_pos, $P10
    ge rx103_pos, rx103_eos, rxscan107_done
  rxscan107_scan:
    set_addr $I10, rxscan107_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  rxscan107_done:
.annotate 'line', 37
  # rx subrule "starter" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."starter"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("starter")
    rx103_pos = $P10."pos"()
  # rx rxquantr108 ** 0..*
    set_addr $I10, rxquantr108_done
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  rxquantr108_loop:
  # rx subrule "quote_atom" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."quote_atom"()
    unless $P10, rx103_fail
    goto rxsubrule109_pass
  rxsubrule109_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx103_fail
  rxsubrule109_pass:
    set_addr $I10, rxsubrule109_back
    rx103_cur."!mark_push"(0, rx103_pos, $I10, $P10)
    $P10."!cursor_names"("quote_atom")
    rx103_pos = $P10."pos"()
    set_addr $I10, rxquantr108_done
    (rx103_rep) = rx103_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr108_done
    rx103_cur."!mark_push"(rx103_rep, rx103_pos, $I10)
    goto rxquantr108_loop
  rxquantr108_done:
  # rx subrule "stopper" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."stopper"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx103_pos = $P10."pos"()
.annotate 'line', 36
  # rx pass
    rx103_cur."!cursor_pass"(rx103_pos, "quote_delimited")
    if_null rx103_debug, debug_142
    rx103_cur."!cursor_debug"("PASS", "quote_delimited", " at pos=", rx103_pos)
  debug_142:
    .return (rx103_cur)
  rx103_restart:
.annotate 'line', 33
    if_null rx103_debug, debug_143
    rx103_cur."!cursor_debug"("NEXT", "quote_delimited")
  debug_143:
  rx103_fail:
    (rx103_rep, rx103_pos, $I10, $P10) = rx103_cur."!mark_fail"(0)
    lt rx103_pos, -1, rx103_done
    eq rx103_pos, -1, rx103_fail
    jump $I10
  rx103_done:
    rx103_cur."!cursor_fail"()
    if_null rx103_debug, debug_144
    rx103_cur."!cursor_debug"("FAIL", "quote_delimited")
  debug_144:
    .return (rx103_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_delimited"  :subid("42_1297880734.85639") :method
.annotate 'line', 33
    $P105 = self."!PREFIX__!subrule"("starter", "")
    new $P106, "ResizablePMCArray"
    push $P106, $P105
    .return ($P106)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("43_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx111_tgt
    .local int rx111_pos
    .local int rx111_off
    .local int rx111_eos
    .local int rx111_rep
    .local pmc rx111_cur
    .local pmc rx111_debug
    (rx111_cur, rx111_pos, rx111_tgt, $I10) = self."!cursor_start"()
    getattribute rx111_debug, rx111_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx111_cur
    .local pmc match
    .lex "$/", match
    length rx111_eos, rx111_tgt
    gt rx111_pos, rx111_eos, rx111_done
    set rx111_off, 0
    lt rx111_pos, 2, rx111_start
    sub rx111_off, rx111_pos, 1
    substr rx111_tgt, rx111_tgt, rx111_off
  rx111_start:
    eq $I10, 1, rx111_restart
    if_null rx111_debug, debug_145
    rx111_cur."!cursor_debug"("START", "quote_atom")
  debug_145:
    $I10 = self.'from'()
    ne $I10, -1, rxscan114_done
    goto rxscan114_scan
  rxscan114_loop:
    ($P10) = rx111_cur."from"()
    inc $P10
    set rx111_pos, $P10
    ge rx111_pos, rx111_eos, rxscan114_done
  rxscan114_scan:
    set_addr $I10, rxscan114_loop
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
  rxscan114_done:
.annotate 'line', 41
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."stopper"()
    if $P10, rx111_fail
  alt115_0:
.annotate 'line', 42
    set_addr $I10, alt115_1
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
.annotate 'line', 43
  # rx subrule "quote_escape" subtype=capture negate=
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."quote_escape"()
    unless $P10, rx111_fail
    rx111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_escape")
    rx111_pos = $P10."pos"()
    goto alt115_end
  alt115_1:
.annotate 'line', 44
  # rx rxquantr116 ** 1..*
    set_addr $I10, rxquantr116_done
    rx111_cur."!mark_push"(0, -1, $I10)
  rxquantr116_loop:
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."stopper"()
    if $P10, rx111_fail
  # rx subrule "quote_escape" subtype=zerowidth negate=1
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."quote_escape"()
    if $P10, rx111_fail
  # rx charclass .
    ge rx111_pos, rx111_eos, rx111_fail
    inc rx111_pos
    set_addr $I10, rxquantr116_done
    (rx111_rep) = rx111_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr116_done
    rx111_cur."!mark_push"(rx111_rep, rx111_pos, $I10)
    goto rxquantr116_loop
  rxquantr116_done:
  alt115_end:
.annotate 'line', 40
  # rx pass
    rx111_cur."!cursor_pass"(rx111_pos, "quote_atom")
    if_null rx111_debug, debug_146
    rx111_cur."!cursor_debug"("PASS", "quote_atom", " at pos=", rx111_pos)
  debug_146:
    .return (rx111_cur)
  rx111_restart:
.annotate 'line', 33
    if_null rx111_debug, debug_147
    rx111_cur."!cursor_debug"("NEXT", "quote_atom")
  debug_147:
  rx111_fail:
    (rx111_rep, rx111_pos, $I10, $P10) = rx111_cur."!mark_fail"(0)
    lt rx111_pos, -1, rx111_done
    eq rx111_pos, -1, rx111_fail
    jump $I10
  rx111_done:
    rx111_cur."!cursor_fail"()
    if_null rx111_debug, debug_148
    rx111_cur."!cursor_debug"("FAIL", "quote_atom")
  debug_148:
    .return (rx111_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_atom"  :subid("44_1297880734.85639") :method
.annotate 'line', 33
    new $P113, "ResizablePMCArray"
    push $P113, ""
    .return ($P113)
.end


.namespace ["HLL";"Grammar"]
.sub "decint"  :subid("45_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx120_tgt
    .local int rx120_pos
    .local int rx120_off
    .local int rx120_eos
    .local int rx120_rep
    .local pmc rx120_cur
    .local pmc rx120_debug
    (rx120_cur, rx120_pos, rx120_tgt, $I10) = self."!cursor_start"()
    getattribute rx120_debug, rx120_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx120_cur
    .local pmc match
    .lex "$/", match
    length rx120_eos, rx120_tgt
    gt rx120_pos, rx120_eos, rx120_done
    set rx120_off, 0
    lt rx120_pos, 2, rx120_start
    sub rx120_off, rx120_pos, 1
    substr rx120_tgt, rx120_tgt, rx120_off
  rx120_start:
    eq $I10, 1, rx120_restart
    if_null rx120_debug, debug_149
    rx120_cur."!cursor_debug"("START", "decint")
  debug_149:
    $I10 = self.'from'()
    ne $I10, -1, rxscan123_done
    goto rxscan123_scan
  rxscan123_loop:
    ($P10) = rx120_cur."from"()
    inc $P10
    set rx120_pos, $P10
    ge rx120_pos, rx120_eos, rxscan123_done
  rxscan123_scan:
    set_addr $I10, rxscan123_loop
    rx120_cur."!mark_push"(0, rx120_pos, $I10)
  rxscan123_done:
.annotate 'line', 48
  # rx rxquantr124 ** 1..*
    set_addr $I10, rxquantr124_done
    rx120_cur."!mark_push"(0, -1, $I10)
  rxquantr124_loop:
  # rx charclass_q d r 1..-1
    sub $I10, rx120_pos, rx120_off
    find_not_cclass $I11, 8, rx120_tgt, $I10, rx120_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx120_fail
    add rx120_pos, rx120_off, $I11
    set_addr $I10, rxquantr124_done
    (rx120_rep) = rx120_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr124_done
    rx120_cur."!mark_push"(rx120_rep, rx120_pos, $I10)
  # rx literal  "_"
    add $I11, rx120_pos, 1
    gt $I11, rx120_eos, rx120_fail
    sub $I11, rx120_pos, rx120_off
    ord $I11, rx120_tgt, $I11
    ne $I11, 95, rx120_fail
    add rx120_pos, 1
    goto rxquantr124_loop
  rxquantr124_done:
  # rx pass
    rx120_cur."!cursor_pass"(rx120_pos, "decint")
    if_null rx120_debug, debug_150
    rx120_cur."!cursor_debug"("PASS", "decint", " at pos=", rx120_pos)
  debug_150:
    .return (rx120_cur)
  rx120_restart:
.annotate 'line', 33
    if_null rx120_debug, debug_151
    rx120_cur."!cursor_debug"("NEXT", "decint")
  debug_151:
  rx120_fail:
    (rx120_rep, rx120_pos, $I10, $P10) = rx120_cur."!mark_fail"(0)
    lt rx120_pos, -1, rx120_done
    eq rx120_pos, -1, rx120_fail
    jump $I10
  rx120_done:
    rx120_cur."!cursor_fail"()
    if_null rx120_debug, debug_152
    rx120_cur."!cursor_debug"("FAIL", "decint")
  debug_152:
    .return (rx120_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decint"  :subid("46_1297880734.85639") :method
.annotate 'line', 33
    new $P122, "ResizablePMCArray"
    push $P122, ""
    .return ($P122)
.end


.namespace ["HLL";"Grammar"]
.sub "decints"  :subid("47_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx126_tgt
    .local int rx126_pos
    .local int rx126_off
    .local int rx126_eos
    .local int rx126_rep
    .local pmc rx126_cur
    .local pmc rx126_debug
    (rx126_cur, rx126_pos, rx126_tgt, $I10) = self."!cursor_start"()
    rx126_cur."!cursor_caparray"("decint")
    getattribute rx126_debug, rx126_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx126_cur
    .local pmc match
    .lex "$/", match
    length rx126_eos, rx126_tgt
    gt rx126_pos, rx126_eos, rx126_done
    set rx126_off, 0
    lt rx126_pos, 2, rx126_start
    sub rx126_off, rx126_pos, 1
    substr rx126_tgt, rx126_tgt, rx126_off
  rx126_start:
    eq $I10, 1, rx126_restart
    if_null rx126_debug, debug_153
    rx126_cur."!cursor_debug"("START", "decints")
  debug_153:
    $I10 = self.'from'()
    ne $I10, -1, rxscan129_done
    goto rxscan129_scan
  rxscan129_loop:
    ($P10) = rx126_cur."from"()
    inc $P10
    set rx126_pos, $P10
    ge rx126_pos, rx126_eos, rxscan129_done
  rxscan129_scan:
    set_addr $I10, rxscan129_loop
    rx126_cur."!mark_push"(0, rx126_pos, $I10)
  rxscan129_done:
.annotate 'line', 49
  # rx rxquantr130 ** 1..*
    set_addr $I10, rxquantr130_done
    rx126_cur."!mark_push"(0, -1, $I10)
  rxquantr130_loop:
  # rx subrule "ws" subtype=method negate=
    rx126_cur."!cursor_pos"(rx126_pos)
    $P10 = rx126_cur."ws"()
    unless $P10, rx126_fail
    rx126_pos = $P10."pos"()
  # rx subrule "decint" subtype=capture negate=
    rx126_cur."!cursor_pos"(rx126_pos)
    $P10 = rx126_cur."decint"()
    unless $P10, rx126_fail
    rx126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    rx126_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx126_cur."!cursor_pos"(rx126_pos)
    $P10 = rx126_cur."ws"()
    unless $P10, rx126_fail
    rx126_pos = $P10."pos"()
    set_addr $I10, rxquantr130_done
    (rx126_rep) = rx126_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr130_done
    rx126_cur."!mark_push"(rx126_rep, rx126_pos, $I10)
  # rx literal  ","
    add $I11, rx126_pos, 1
    gt $I11, rx126_eos, rx126_fail
    sub $I11, rx126_pos, rx126_off
    ord $I11, rx126_tgt, $I11
    ne $I11, 44, rx126_fail
    add rx126_pos, 1
    goto rxquantr130_loop
  rxquantr130_done:
  # rx pass
    rx126_cur."!cursor_pass"(rx126_pos, "decints")
    if_null rx126_debug, debug_154
    rx126_cur."!cursor_debug"("PASS", "decints", " at pos=", rx126_pos)
  debug_154:
    .return (rx126_cur)
  rx126_restart:
.annotate 'line', 33
    if_null rx126_debug, debug_155
    rx126_cur."!cursor_debug"("NEXT", "decints")
  debug_155:
  rx126_fail:
    (rx126_rep, rx126_pos, $I10, $P10) = rx126_cur."!mark_fail"(0)
    lt rx126_pos, -1, rx126_done
    eq rx126_pos, -1, rx126_fail
    jump $I10
  rx126_done:
    rx126_cur."!cursor_fail"()
    if_null rx126_debug, debug_156
    rx126_cur."!cursor_debug"("FAIL", "decints")
  debug_156:
    .return (rx126_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decints"  :subid("48_1297880734.85639") :method
.annotate 'line', 33
    new $P128, "ResizablePMCArray"
    push $P128, ""
    .return ($P128)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("49_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx132_tgt
    .local int rx132_pos
    .local int rx132_off
    .local int rx132_eos
    .local int rx132_rep
    .local pmc rx132_cur
    .local pmc rx132_debug
    (rx132_cur, rx132_pos, rx132_tgt, $I10) = self."!cursor_start"()
    getattribute rx132_debug, rx132_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx132_cur
    .local pmc match
    .lex "$/", match
    length rx132_eos, rx132_tgt
    gt rx132_pos, rx132_eos, rx132_done
    set rx132_off, 0
    lt rx132_pos, 2, rx132_start
    sub rx132_off, rx132_pos, 1
    substr rx132_tgt, rx132_tgt, rx132_off
  rx132_start:
    eq $I10, 1, rx132_restart
    if_null rx132_debug, debug_157
    rx132_cur."!cursor_debug"("START", "hexint")
  debug_157:
    $I10 = self.'from'()
    ne $I10, -1, rxscan135_done
    goto rxscan135_scan
  rxscan135_loop:
    ($P10) = rx132_cur."from"()
    inc $P10
    set rx132_pos, $P10
    ge rx132_pos, rx132_eos, rxscan135_done
  rxscan135_scan:
    set_addr $I10, rxscan135_loop
    rx132_cur."!mark_push"(0, rx132_pos, $I10)
  rxscan135_done:
.annotate 'line', 51
  # rx rxquantr136 ** 1..*
    set_addr $I10, rxquantr136_done
    rx132_cur."!mark_push"(0, -1, $I10)
  rxquantr136_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx132_pos, rx132_off
    set rx132_rep, 0
    sub $I12, rx132_eos, rx132_pos
  rxenumcharlistq137_loop:
    le $I12, 0, rxenumcharlistq137_done
    substr $S10, rx132_tgt, $I10, 1
    index $I11, "0123456789abcdefABCDEF", $S10
    lt $I11, 0, rxenumcharlistq137_done
    inc rx132_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq137_loop
  rxenumcharlistq137_done:
    lt rx132_rep, 1, rx132_fail
    add rx132_pos, rx132_pos, rx132_rep
    set_addr $I10, rxquantr136_done
    (rx132_rep) = rx132_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr136_done
    rx132_cur."!mark_push"(rx132_rep, rx132_pos, $I10)
  # rx literal  "_"
    add $I11, rx132_pos, 1
    gt $I11, rx132_eos, rx132_fail
    sub $I11, rx132_pos, rx132_off
    ord $I11, rx132_tgt, $I11
    ne $I11, 95, rx132_fail
    add rx132_pos, 1
    goto rxquantr136_loop
  rxquantr136_done:
  # rx pass
    rx132_cur."!cursor_pass"(rx132_pos, "hexint")
    if_null rx132_debug, debug_158
    rx132_cur."!cursor_debug"("PASS", "hexint", " at pos=", rx132_pos)
  debug_158:
    .return (rx132_cur)
  rx132_restart:
.annotate 'line', 33
    if_null rx132_debug, debug_159
    rx132_cur."!cursor_debug"("NEXT", "hexint")
  debug_159:
  rx132_fail:
    (rx132_rep, rx132_pos, $I10, $P10) = rx132_cur."!mark_fail"(0)
    lt rx132_pos, -1, rx132_done
    eq rx132_pos, -1, rx132_fail
    jump $I10
  rx132_done:
    rx132_cur."!cursor_fail"()
    if_null rx132_debug, debug_160
    rx132_cur."!cursor_debug"("FAIL", "hexint")
  debug_160:
    .return (rx132_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexint"  :subid("50_1297880734.85639") :method
.annotate 'line', 33
    new $P134, "ResizablePMCArray"
    push $P134, ""
    .return ($P134)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("51_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx139_tgt
    .local int rx139_pos
    .local int rx139_off
    .local int rx139_eos
    .local int rx139_rep
    .local pmc rx139_cur
    .local pmc rx139_debug
    (rx139_cur, rx139_pos, rx139_tgt, $I10) = self."!cursor_start"()
    rx139_cur."!cursor_caparray"("hexint")
    getattribute rx139_debug, rx139_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx139_cur
    .local pmc match
    .lex "$/", match
    length rx139_eos, rx139_tgt
    gt rx139_pos, rx139_eos, rx139_done
    set rx139_off, 0
    lt rx139_pos, 2, rx139_start
    sub rx139_off, rx139_pos, 1
    substr rx139_tgt, rx139_tgt, rx139_off
  rx139_start:
    eq $I10, 1, rx139_restart
    if_null rx139_debug, debug_161
    rx139_cur."!cursor_debug"("START", "hexints")
  debug_161:
    $I10 = self.'from'()
    ne $I10, -1, rxscan142_done
    goto rxscan142_scan
  rxscan142_loop:
    ($P10) = rx139_cur."from"()
    inc $P10
    set rx139_pos, $P10
    ge rx139_pos, rx139_eos, rxscan142_done
  rxscan142_scan:
    set_addr $I10, rxscan142_loop
    rx139_cur."!mark_push"(0, rx139_pos, $I10)
  rxscan142_done:
.annotate 'line', 52
  # rx rxquantr143 ** 1..*
    set_addr $I10, rxquantr143_done
    rx139_cur."!mark_push"(0, -1, $I10)
  rxquantr143_loop:
  # rx subrule "ws" subtype=method negate=
    rx139_cur."!cursor_pos"(rx139_pos)
    $P10 = rx139_cur."ws"()
    unless $P10, rx139_fail
    rx139_pos = $P10."pos"()
  # rx subrule "hexint" subtype=capture negate=
    rx139_cur."!cursor_pos"(rx139_pos)
    $P10 = rx139_cur."hexint"()
    unless $P10, rx139_fail
    rx139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx139_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx139_cur."!cursor_pos"(rx139_pos)
    $P10 = rx139_cur."ws"()
    unless $P10, rx139_fail
    rx139_pos = $P10."pos"()
    set_addr $I10, rxquantr143_done
    (rx139_rep) = rx139_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr143_done
    rx139_cur."!mark_push"(rx139_rep, rx139_pos, $I10)
  # rx literal  ","
    add $I11, rx139_pos, 1
    gt $I11, rx139_eos, rx139_fail
    sub $I11, rx139_pos, rx139_off
    ord $I11, rx139_tgt, $I11
    ne $I11, 44, rx139_fail
    add rx139_pos, 1
    goto rxquantr143_loop
  rxquantr143_done:
  # rx pass
    rx139_cur."!cursor_pass"(rx139_pos, "hexints")
    if_null rx139_debug, debug_162
    rx139_cur."!cursor_debug"("PASS", "hexints", " at pos=", rx139_pos)
  debug_162:
    .return (rx139_cur)
  rx139_restart:
.annotate 'line', 33
    if_null rx139_debug, debug_163
    rx139_cur."!cursor_debug"("NEXT", "hexints")
  debug_163:
  rx139_fail:
    (rx139_rep, rx139_pos, $I10, $P10) = rx139_cur."!mark_fail"(0)
    lt rx139_pos, -1, rx139_done
    eq rx139_pos, -1, rx139_fail
    jump $I10
  rx139_done:
    rx139_cur."!cursor_fail"()
    if_null rx139_debug, debug_164
    rx139_cur."!cursor_debug"("FAIL", "hexints")
  debug_164:
    .return (rx139_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("52_1297880734.85639") :method
.annotate 'line', 33
    new $P141, "ResizablePMCArray"
    push $P141, ""
    .return ($P141)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("53_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx145_tgt
    .local int rx145_pos
    .local int rx145_off
    .local int rx145_eos
    .local int rx145_rep
    .local pmc rx145_cur
    .local pmc rx145_debug
    (rx145_cur, rx145_pos, rx145_tgt, $I10) = self."!cursor_start"()
    getattribute rx145_debug, rx145_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx145_cur
    .local pmc match
    .lex "$/", match
    length rx145_eos, rx145_tgt
    gt rx145_pos, rx145_eos, rx145_done
    set rx145_off, 0
    lt rx145_pos, 2, rx145_start
    sub rx145_off, rx145_pos, 1
    substr rx145_tgt, rx145_tgt, rx145_off
  rx145_start:
    eq $I10, 1, rx145_restart
    if_null rx145_debug, debug_165
    rx145_cur."!cursor_debug"("START", "octint")
  debug_165:
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
.annotate 'line', 54
  # rx rxquantr149 ** 1..*
    set_addr $I10, rxquantr149_done
    rx145_cur."!mark_push"(0, -1, $I10)
  rxquantr149_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx145_pos, rx145_off
    set rx145_rep, 0
    sub $I12, rx145_eos, rx145_pos
  rxenumcharlistq150_loop:
    le $I12, 0, rxenumcharlistq150_done
    substr $S10, rx145_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rxenumcharlistq150_done
    inc rx145_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq150_loop
  rxenumcharlistq150_done:
    lt rx145_rep, 1, rx145_fail
    add rx145_pos, rx145_pos, rx145_rep
    set_addr $I10, rxquantr149_done
    (rx145_rep) = rx145_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr149_done
    rx145_cur."!mark_push"(rx145_rep, rx145_pos, $I10)
  # rx literal  "_"
    add $I11, rx145_pos, 1
    gt $I11, rx145_eos, rx145_fail
    sub $I11, rx145_pos, rx145_off
    ord $I11, rx145_tgt, $I11
    ne $I11, 95, rx145_fail
    add rx145_pos, 1
    goto rxquantr149_loop
  rxquantr149_done:
  # rx pass
    rx145_cur."!cursor_pass"(rx145_pos, "octint")
    if_null rx145_debug, debug_166
    rx145_cur."!cursor_debug"("PASS", "octint", " at pos=", rx145_pos)
  debug_166:
    .return (rx145_cur)
  rx145_restart:
.annotate 'line', 33
    if_null rx145_debug, debug_167
    rx145_cur."!cursor_debug"("NEXT", "octint")
  debug_167:
  rx145_fail:
    (rx145_rep, rx145_pos, $I10, $P10) = rx145_cur."!mark_fail"(0)
    lt rx145_pos, -1, rx145_done
    eq rx145_pos, -1, rx145_fail
    jump $I10
  rx145_done:
    rx145_cur."!cursor_fail"()
    if_null rx145_debug, debug_168
    rx145_cur."!cursor_debug"("FAIL", "octint")
  debug_168:
    .return (rx145_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octint"  :subid("54_1297880734.85639") :method
.annotate 'line', 33
    new $P147, "ResizablePMCArray"
    push $P147, ""
    .return ($P147)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("55_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx152_tgt
    .local int rx152_pos
    .local int rx152_off
    .local int rx152_eos
    .local int rx152_rep
    .local pmc rx152_cur
    .local pmc rx152_debug
    (rx152_cur, rx152_pos, rx152_tgt, $I10) = self."!cursor_start"()
    rx152_cur."!cursor_caparray"("octint")
    getattribute rx152_debug, rx152_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx152_cur
    .local pmc match
    .lex "$/", match
    length rx152_eos, rx152_tgt
    gt rx152_pos, rx152_eos, rx152_done
    set rx152_off, 0
    lt rx152_pos, 2, rx152_start
    sub rx152_off, rx152_pos, 1
    substr rx152_tgt, rx152_tgt, rx152_off
  rx152_start:
    eq $I10, 1, rx152_restart
    if_null rx152_debug, debug_169
    rx152_cur."!cursor_debug"("START", "octints")
  debug_169:
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
.annotate 'line', 55
  # rx rxquantr156 ** 1..*
    set_addr $I10, rxquantr156_done
    rx152_cur."!mark_push"(0, -1, $I10)
  rxquantr156_loop:
  # rx subrule "ws" subtype=method negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."ws"()
    unless $P10, rx152_fail
    rx152_pos = $P10."pos"()
  # rx subrule "octint" subtype=capture negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."octint"()
    unless $P10, rx152_fail
    rx152_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx152_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."ws"()
    unless $P10, rx152_fail
    rx152_pos = $P10."pos"()
    set_addr $I10, rxquantr156_done
    (rx152_rep) = rx152_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr156_done
    rx152_cur."!mark_push"(rx152_rep, rx152_pos, $I10)
  # rx literal  ","
    add $I11, rx152_pos, 1
    gt $I11, rx152_eos, rx152_fail
    sub $I11, rx152_pos, rx152_off
    ord $I11, rx152_tgt, $I11
    ne $I11, 44, rx152_fail
    add rx152_pos, 1
    goto rxquantr156_loop
  rxquantr156_done:
  # rx pass
    rx152_cur."!cursor_pass"(rx152_pos, "octints")
    if_null rx152_debug, debug_170
    rx152_cur."!cursor_debug"("PASS", "octints", " at pos=", rx152_pos)
  debug_170:
    .return (rx152_cur)
  rx152_restart:
.annotate 'line', 33
    if_null rx152_debug, debug_171
    rx152_cur."!cursor_debug"("NEXT", "octints")
  debug_171:
  rx152_fail:
    (rx152_rep, rx152_pos, $I10, $P10) = rx152_cur."!mark_fail"(0)
    lt rx152_pos, -1, rx152_done
    eq rx152_pos, -1, rx152_fail
    jump $I10
  rx152_done:
    rx152_cur."!cursor_fail"()
    if_null rx152_debug, debug_172
    rx152_cur."!cursor_debug"("FAIL", "octints")
  debug_172:
    .return (rx152_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octints"  :subid("56_1297880734.85639") :method
.annotate 'line', 33
    new $P154, "ResizablePMCArray"
    push $P154, ""
    .return ($P154)
.end


.namespace ["HLL";"Grammar"]
.sub "binint"  :subid("57_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx158_tgt
    .local int rx158_pos
    .local int rx158_off
    .local int rx158_eos
    .local int rx158_rep
    .local pmc rx158_cur
    .local pmc rx158_debug
    (rx158_cur, rx158_pos, rx158_tgt, $I10) = self."!cursor_start"()
    getattribute rx158_debug, rx158_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx158_cur
    .local pmc match
    .lex "$/", match
    length rx158_eos, rx158_tgt
    gt rx158_pos, rx158_eos, rx158_done
    set rx158_off, 0
    lt rx158_pos, 2, rx158_start
    sub rx158_off, rx158_pos, 1
    substr rx158_tgt, rx158_tgt, rx158_off
  rx158_start:
    eq $I10, 1, rx158_restart
    if_null rx158_debug, debug_173
    rx158_cur."!cursor_debug"("START", "binint")
  debug_173:
    $I10 = self.'from'()
    ne $I10, -1, rxscan161_done
    goto rxscan161_scan
  rxscan161_loop:
    ($P10) = rx158_cur."from"()
    inc $P10
    set rx158_pos, $P10
    ge rx158_pos, rx158_eos, rxscan161_done
  rxscan161_scan:
    set_addr $I10, rxscan161_loop
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  rxscan161_done:
.annotate 'line', 57
  # rx rxquantr162 ** 1..*
    set_addr $I10, rxquantr162_done
    rx158_cur."!mark_push"(0, -1, $I10)
  rxquantr162_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx158_pos, rx158_off
    set rx158_rep, 0
    sub $I12, rx158_eos, rx158_pos
  rxenumcharlistq163_loop:
    le $I12, 0, rxenumcharlistq163_done
    substr $S10, rx158_tgt, $I10, 1
    index $I11, "01", $S10
    lt $I11, 0, rxenumcharlistq163_done
    inc rx158_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq163_loop
  rxenumcharlistq163_done:
    lt rx158_rep, 1, rx158_fail
    add rx158_pos, rx158_pos, rx158_rep
    set_addr $I10, rxquantr162_done
    (rx158_rep) = rx158_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr162_done
    rx158_cur."!mark_push"(rx158_rep, rx158_pos, $I10)
  # rx literal  "_"
    add $I11, rx158_pos, 1
    gt $I11, rx158_eos, rx158_fail
    sub $I11, rx158_pos, rx158_off
    ord $I11, rx158_tgt, $I11
    ne $I11, 95, rx158_fail
    add rx158_pos, 1
    goto rxquantr162_loop
  rxquantr162_done:
  # rx pass
    rx158_cur."!cursor_pass"(rx158_pos, "binint")
    if_null rx158_debug, debug_174
    rx158_cur."!cursor_debug"("PASS", "binint", " at pos=", rx158_pos)
  debug_174:
    .return (rx158_cur)
  rx158_restart:
.annotate 'line', 33
    if_null rx158_debug, debug_175
    rx158_cur."!cursor_debug"("NEXT", "binint")
  debug_175:
  rx158_fail:
    (rx158_rep, rx158_pos, $I10, $P10) = rx158_cur."!mark_fail"(0)
    lt rx158_pos, -1, rx158_done
    eq rx158_pos, -1, rx158_fail
    jump $I10
  rx158_done:
    rx158_cur."!cursor_fail"()
    if_null rx158_debug, debug_176
    rx158_cur."!cursor_debug"("FAIL", "binint")
  debug_176:
    .return (rx158_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binint"  :subid("58_1297880734.85639") :method
.annotate 'line', 33
    new $P160, "ResizablePMCArray"
    push $P160, ""
    .return ($P160)
.end


.namespace ["HLL";"Grammar"]
.sub "binints"  :subid("59_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx165_tgt
    .local int rx165_pos
    .local int rx165_off
    .local int rx165_eos
    .local int rx165_rep
    .local pmc rx165_cur
    .local pmc rx165_debug
    (rx165_cur, rx165_pos, rx165_tgt, $I10) = self."!cursor_start"()
    rx165_cur."!cursor_caparray"("binint")
    getattribute rx165_debug, rx165_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx165_cur
    .local pmc match
    .lex "$/", match
    length rx165_eos, rx165_tgt
    gt rx165_pos, rx165_eos, rx165_done
    set rx165_off, 0
    lt rx165_pos, 2, rx165_start
    sub rx165_off, rx165_pos, 1
    substr rx165_tgt, rx165_tgt, rx165_off
  rx165_start:
    eq $I10, 1, rx165_restart
    if_null rx165_debug, debug_177
    rx165_cur."!cursor_debug"("START", "binints")
  debug_177:
    $I10 = self.'from'()
    ne $I10, -1, rxscan168_done
    goto rxscan168_scan
  rxscan168_loop:
    ($P10) = rx165_cur."from"()
    inc $P10
    set rx165_pos, $P10
    ge rx165_pos, rx165_eos, rxscan168_done
  rxscan168_scan:
    set_addr $I10, rxscan168_loop
    rx165_cur."!mark_push"(0, rx165_pos, $I10)
  rxscan168_done:
.annotate 'line', 58
  # rx rxquantr169 ** 1..*
    set_addr $I10, rxquantr169_done
    rx165_cur."!mark_push"(0, -1, $I10)
  rxquantr169_loop:
  # rx subrule "ws" subtype=method negate=
    rx165_cur."!cursor_pos"(rx165_pos)
    $P10 = rx165_cur."ws"()
    unless $P10, rx165_fail
    rx165_pos = $P10."pos"()
  # rx subrule "binint" subtype=capture negate=
    rx165_cur."!cursor_pos"(rx165_pos)
    $P10 = rx165_cur."binint"()
    unless $P10, rx165_fail
    rx165_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("binint")
    rx165_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx165_cur."!cursor_pos"(rx165_pos)
    $P10 = rx165_cur."ws"()
    unless $P10, rx165_fail
    rx165_pos = $P10."pos"()
    set_addr $I10, rxquantr169_done
    (rx165_rep) = rx165_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr169_done
    rx165_cur."!mark_push"(rx165_rep, rx165_pos, $I10)
  # rx literal  ","
    add $I11, rx165_pos, 1
    gt $I11, rx165_eos, rx165_fail
    sub $I11, rx165_pos, rx165_off
    ord $I11, rx165_tgt, $I11
    ne $I11, 44, rx165_fail
    add rx165_pos, 1
    goto rxquantr169_loop
  rxquantr169_done:
  # rx pass
    rx165_cur."!cursor_pass"(rx165_pos, "binints")
    if_null rx165_debug, debug_178
    rx165_cur."!cursor_debug"("PASS", "binints", " at pos=", rx165_pos)
  debug_178:
    .return (rx165_cur)
  rx165_restart:
.annotate 'line', 33
    if_null rx165_debug, debug_179
    rx165_cur."!cursor_debug"("NEXT", "binints")
  debug_179:
  rx165_fail:
    (rx165_rep, rx165_pos, $I10, $P10) = rx165_cur."!mark_fail"(0)
    lt rx165_pos, -1, rx165_done
    eq rx165_pos, -1, rx165_fail
    jump $I10
  rx165_done:
    rx165_cur."!cursor_fail"()
    if_null rx165_debug, debug_180
    rx165_cur."!cursor_debug"("FAIL", "binints")
  debug_180:
    .return (rx165_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binints"  :subid("60_1297880734.85639") :method
.annotate 'line', 33
    new $P167, "ResizablePMCArray"
    push $P167, ""
    .return ($P167)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("61_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    .local pmc rx171_debug
    (rx171_cur, rx171_pos, rx171_tgt, $I10) = self."!cursor_start"()
    getattribute rx171_debug, rx171_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx171_cur
    .local pmc match
    .lex "$/", match
    length rx171_eos, rx171_tgt
    gt rx171_pos, rx171_eos, rx171_done
    set rx171_off, 0
    lt rx171_pos, 2, rx171_start
    sub rx171_off, rx171_pos, 1
    substr rx171_tgt, rx171_tgt, rx171_off
  rx171_start:
    eq $I10, 1, rx171_restart
    if_null rx171_debug, debug_181
    rx171_cur."!cursor_debug"("START", "integer")
  debug_181:
    $I10 = self.'from'()
    ne $I10, -1, rxscan179_done
    goto rxscan179_scan
  rxscan179_loop:
    ($P10) = rx171_cur."from"()
    inc $P10
    set rx171_pos, $P10
    ge rx171_pos, rx171_eos, rxscan179_done
  rxscan179_scan:
    set_addr $I10, rxscan179_loop
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  rxscan179_done:
  alt180_0:
.annotate 'line', 61
    set_addr $I10, alt180_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 62
  # rx literal  "0"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    ord $I11, rx171_tgt, $I11
    ne $I11, 48, rx171_fail
    add rx171_pos, 1
  alt181_0:
    set_addr $I10, alt181_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  # rx literal  "b"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    ord $I11, rx171_tgt, $I11
    ne $I11, 98, rx171_fail
    add rx171_pos, 1
  # rx subrule "binint" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."binint"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=binint")
    rx171_pos = $P10."pos"()
    goto alt181_end
  alt181_1:
    set_addr $I10, alt181_2
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 63
  # rx literal  "o"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    ord $I11, rx171_tgt, $I11
    ne $I11, 111, rx171_fail
    add rx171_pos, 1
  # rx subrule "octint" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."octint"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=octint")
    rx171_pos = $P10."pos"()
    goto alt181_end
  alt181_2:
    set_addr $I10, alt181_3
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 64
  # rx literal  "x"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    ord $I11, rx171_tgt, $I11
    ne $I11, 120, rx171_fail
    add rx171_pos, 1
  # rx subrule "hexint" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."hexint"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=hexint")
    rx171_pos = $P10."pos"()
    goto alt181_end
  alt181_3:
.annotate 'line', 65
  # rx literal  "d"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    ord $I11, rx171_tgt, $I11
    ne $I11, 100, rx171_fail
    add rx171_pos, 1
  # rx subrule "decint" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."decint"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx171_pos = $P10."pos"()
  alt181_end:
.annotate 'line', 62
    goto alt180_end
  alt180_1:
.annotate 'line', 67
  # rx subrule "decint" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."decint"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx171_pos = $P10."pos"()
  alt180_end:
.annotate 'line', 60
  # rx pass
    rx171_cur."!cursor_pass"(rx171_pos, "integer")
    if_null rx171_debug, debug_182
    rx171_cur."!cursor_debug"("PASS", "integer", " at pos=", rx171_pos)
  debug_182:
    .return (rx171_cur)
  rx171_restart:
.annotate 'line', 33
    if_null rx171_debug, debug_183
    rx171_cur."!cursor_debug"("NEXT", "integer")
  debug_183:
  rx171_fail:
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    if_null rx171_debug, debug_184
    rx171_cur."!cursor_debug"("FAIL", "integer")
  debug_184:
    .return (rx171_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__integer"  :subid("62_1297880734.85639") :method
.annotate 'line', 33
    $P173 = self."!PREFIX__!subrule"("decint", "")
    $P174 = self."!PREFIX__!subrule"("decint", "0d")
    $P175 = self."!PREFIX__!subrule"("hexint", "0x")
    $P176 = self."!PREFIX__!subrule"("octint", "0o")
    $P177 = self."!PREFIX__!subrule"("binint", "0b")
    new $P178, "ResizablePMCArray"
    push $P178, $P173
    push $P178, $P174
    push $P178, $P175
    push $P178, $P176
    push $P178, $P177
    .return ($P178)
.end


.namespace ["HLL";"Grammar"]
.sub "dec_number"  :subid("63_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    .local pmc rx183_debug
    (rx183_cur, rx183_pos, rx183_tgt, $I10) = self."!cursor_start"()
    rx183_cur."!cursor_caparray"("escale")
    getattribute rx183_debug, rx183_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx183_cur
    .local pmc match
    .lex "$/", match
    length rx183_eos, rx183_tgt
    gt rx183_pos, rx183_eos, rx183_done
    set rx183_off, 0
    lt rx183_pos, 2, rx183_start
    sub rx183_off, rx183_pos, 1
    substr rx183_tgt, rx183_tgt, rx183_off
  rx183_start:
    eq $I10, 1, rx183_restart
    if_null rx183_debug, debug_185
    rx183_cur."!cursor_debug"("START", "dec_number")
  debug_185:
    $I10 = self.'from'()
    ne $I10, -1, rxscan186_done
    goto rxscan186_scan
  rxscan186_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan186_done
  rxscan186_scan:
    set_addr $I10, rxscan186_loop
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxscan186_done:
  alt187_0:
.annotate 'line', 71
    set_addr $I10, alt187_1
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate 'line', 72
  # rx subcapture "coeff"
    set_addr $I10, rxcap_188_fail
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  # rx literal  "."
    add $I11, rx183_pos, 1
    gt $I11, rx183_eos, rx183_fail
    sub $I11, rx183_pos, rx183_off
    ord $I11, rx183_tgt, $I11
    ne $I11, 46, rx183_fail
    add rx183_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx183_pos, rx183_off
    find_not_cclass $I11, 8, rx183_tgt, $I10, rx183_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx183_fail
    add rx183_pos, rx183_off, $I11
    set_addr $I10, rxcap_188_fail
    ($I12, $I11) = rx183_cur."!mark_peek"($I10)
    rx183_cur."!cursor_pos"($I11)
    ($P10) = rx183_cur."!cursor_start"()
    $P10."!cursor_pass"(rx183_pos, "")
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_188_done
  rxcap_188_fail:
    goto rx183_fail
  rxcap_188_done:
  # rx rxquantr189 ** 0..1
    set_addr $I10, rxquantr189_done
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxquantr189_loop:
  # rx subrule "escale" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."escale"()
    unless $P10, rx183_fail
    goto rxsubrule190_pass
  rxsubrule190_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx183_fail
  rxsubrule190_pass:
    set_addr $I10, rxsubrule190_back
    rx183_cur."!mark_push"(0, rx183_pos, $I10, $P10)
    $P10."!cursor_names"("escale")
    rx183_pos = $P10."pos"()
    set_addr $I10, rxquantr189_done
    (rx183_rep) = rx183_cur."!mark_commit"($I10)
  rxquantr189_done:
    goto alt187_end
  alt187_1:
    set_addr $I10, alt187_2
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate 'line', 73
  # rx subcapture "coeff"
    set_addr $I10, rxcap_191_fail
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx183_pos, rx183_off
    find_not_cclass $I11, 8, rx183_tgt, $I10, rx183_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx183_fail
    add rx183_pos, rx183_off, $I11
  # rx literal  "."
    add $I11, rx183_pos, 1
    gt $I11, rx183_eos, rx183_fail
    sub $I11, rx183_pos, rx183_off
    ord $I11, rx183_tgt, $I11
    ne $I11, 46, rx183_fail
    add rx183_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx183_pos, rx183_off
    find_not_cclass $I11, 8, rx183_tgt, $I10, rx183_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx183_fail
    add rx183_pos, rx183_off, $I11
    set_addr $I10, rxcap_191_fail
    ($I12, $I11) = rx183_cur."!mark_peek"($I10)
    rx183_cur."!cursor_pos"($I11)
    ($P10) = rx183_cur."!cursor_start"()
    $P10."!cursor_pass"(rx183_pos, "")
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_191_done
  rxcap_191_fail:
    goto rx183_fail
  rxcap_191_done:
  # rx rxquantr192 ** 0..1
    set_addr $I10, rxquantr192_done
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxquantr192_loop:
  # rx subrule "escale" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."escale"()
    unless $P10, rx183_fail
    goto rxsubrule193_pass
  rxsubrule193_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx183_fail
  rxsubrule193_pass:
    set_addr $I10, rxsubrule193_back
    rx183_cur."!mark_push"(0, rx183_pos, $I10, $P10)
    $P10."!cursor_names"("escale")
    rx183_pos = $P10."pos"()
    set_addr $I10, rxquantr192_done
    (rx183_rep) = rx183_cur."!mark_commit"($I10)
  rxquantr192_done:
    goto alt187_end
  alt187_2:
.annotate 'line', 74
  # rx subcapture "coeff"
    set_addr $I10, rxcap_194_fail
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx183_pos, rx183_off
    find_not_cclass $I11, 8, rx183_tgt, $I10, rx183_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx183_fail
    add rx183_pos, rx183_off, $I11
    set_addr $I10, rxcap_194_fail
    ($I12, $I11) = rx183_cur."!mark_peek"($I10)
    rx183_cur."!cursor_pos"($I11)
    ($P10) = rx183_cur."!cursor_start"()
    $P10."!cursor_pass"(rx183_pos, "")
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_194_done
  rxcap_194_fail:
    goto rx183_fail
  rxcap_194_done:
  # rx subrule "escale" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."escale"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx183_pos = $P10."pos"()
  alt187_end:
.annotate 'line', 71
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "dec_number")
    if_null rx183_debug, debug_186
    rx183_cur."!cursor_debug"("PASS", "dec_number", " at pos=", rx183_pos)
  debug_186:
    .return (rx183_cur)
  rx183_restart:
.annotate 'line', 33
    if_null rx183_debug, debug_187
    rx183_cur."!cursor_debug"("NEXT", "dec_number")
  debug_187:
  rx183_fail:
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    if_null rx183_debug, debug_188
    rx183_cur."!cursor_debug"("FAIL", "dec_number")
  debug_188:
    .return (rx183_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__dec_number"  :subid("64_1297880734.85639") :method
.annotate 'line', 33
    new $P185, "ResizablePMCArray"
    push $P185, ""
    push $P185, ""
    push $P185, "."
    .return ($P185)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("65_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    .local pmc rx196_debug
    (rx196_cur, rx196_pos, rx196_tgt, $I10) = self."!cursor_start"()
    getattribute rx196_debug, rx196_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    gt rx196_pos, rx196_eos, rx196_done
    set rx196_off, 0
    lt rx196_pos, 2, rx196_start
    sub rx196_off, rx196_pos, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
    eq $I10, 1, rx196_restart
    if_null rx196_debug, debug_189
    rx196_cur."!cursor_debug"("START", "escale")
  debug_189:
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
.annotate 'line', 77
  # rx enumcharlist negate=0 
    ge rx196_pos, rx196_eos, rx196_fail
    sub $I10, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I10, 1
    index $I11, "Ee", $S10
    lt $I11, 0, rx196_fail
    inc rx196_pos
  # rx enumcharlist_q negate=0  r 0..1
    sub $I10, rx196_pos, rx196_off
    set rx196_rep, 0
    sub $I12, rx196_eos, rx196_pos
    le $I12, 1, rxenumcharlistq200_loop
    set $I12, 1
  rxenumcharlistq200_loop:
    le $I12, 0, rxenumcharlistq200_done
    substr $S10, rx196_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rxenumcharlistq200_done
    inc rx196_rep
  rxenumcharlistq200_done:
    add rx196_pos, rx196_pos, rx196_rep
  # rx charclass_q d r 1..-1
    sub $I10, rx196_pos, rx196_off
    find_not_cclass $I11, 8, rx196_tgt, $I10, rx196_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx196_fail
    add rx196_pos, rx196_off, $I11
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "escale")
    if_null rx196_debug, debug_190
    rx196_cur."!cursor_debug"("PASS", "escale", " at pos=", rx196_pos)
  debug_190:
    .return (rx196_cur)
  rx196_restart:
.annotate 'line', 33
    if_null rx196_debug, debug_191
    rx196_cur."!cursor_debug"("NEXT", "escale")
  debug_191:
  rx196_fail:
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    if_null rx196_debug, debug_192
    rx196_cur."!cursor_debug"("FAIL", "escale")
  debug_192:
    .return (rx196_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__escale"  :subid("66_1297880734.85639") :method
.annotate 'line', 33
    new $P198, "ResizablePMCArray"
    push $P198, "e"
    push $P198, "E"
    .return ($P198)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("67_1297880734.85639") :method
.annotate 'line', 79
    $P202 = self."!protoregex"("quote_escape")
    .return ($P202)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("68_1297880734.85639") :method
.annotate 'line', 79
    $P204 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P204)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("69_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    .local pmc rx206_debug
    (rx206_cur, rx206_pos, rx206_tgt, $I10) = self."!cursor_start"()
    getattribute rx206_debug, rx206_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx206_cur
    .local pmc match
    .lex "$/", match
    length rx206_eos, rx206_tgt
    gt rx206_pos, rx206_eos, rx206_done
    set rx206_off, 0
    lt rx206_pos, 2, rx206_start
    sub rx206_off, rx206_pos, 1
    substr rx206_tgt, rx206_tgt, rx206_off
  rx206_start:
    eq $I10, 1, rx206_restart
    if_null rx206_debug, debug_193
    rx206_cur."!cursor_debug"("START", "quote_escape:sym<backslash>")
  debug_193:
    $I10 = self.'from'()
    ne $I10, -1, rxscan209_done
    goto rxscan209_scan
  rxscan209_loop:
    ($P10) = rx206_cur."from"()
    inc $P10
    set rx206_pos, $P10
    ge rx206_pos, rx206_eos, rxscan209_done
  rxscan209_scan:
    set_addr $I10, rxscan209_loop
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  rxscan209_done:
.annotate 'line', 80
  # rx literal  "\\\\"
    add $I11, rx206_pos, 2
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 2
    ne $S10, "\\\\", rx206_fail
    add rx206_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."quotemod_check"("q")
    unless $P10, rx206_fail
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "quote_escape:sym<backslash>")
    if_null rx206_debug, debug_194
    rx206_cur."!cursor_debug"("PASS", "quote_escape:sym<backslash>", " at pos=", rx206_pos)
  debug_194:
    .return (rx206_cur)
  rx206_restart:
.annotate 'line', 33
    if_null rx206_debug, debug_195
    rx206_cur."!cursor_debug"("NEXT", "quote_escape:sym<backslash>")
  debug_195:
  rx206_fail:
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    if_null rx206_debug, debug_196
    rx206_cur."!cursor_debug"("FAIL", "quote_escape:sym<backslash>")
  debug_196:
    .return (rx206_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("70_1297880734.85639") :method
.annotate 'line', 33
    new $P208, "ResizablePMCArray"
    push $P208, "\\\\"
    .return ($P208)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("71_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx211_tgt
    .local int rx211_pos
    .local int rx211_off
    .local int rx211_eos
    .local int rx211_rep
    .local pmc rx211_cur
    .local pmc rx211_debug
    (rx211_cur, rx211_pos, rx211_tgt, $I10) = self."!cursor_start"()
    getattribute rx211_debug, rx211_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx211_cur
    .local pmc match
    .lex "$/", match
    length rx211_eos, rx211_tgt
    gt rx211_pos, rx211_eos, rx211_done
    set rx211_off, 0
    lt rx211_pos, 2, rx211_start
    sub rx211_off, rx211_pos, 1
    substr rx211_tgt, rx211_tgt, rx211_off
  rx211_start:
    eq $I10, 1, rx211_restart
    if_null rx211_debug, debug_197
    rx211_cur."!cursor_debug"("START", "quote_escape:sym<stopper>")
  debug_197:
    $I10 = self.'from'()
    ne $I10, -1, rxscan214_done
    goto rxscan214_scan
  rxscan214_loop:
    ($P10) = rx211_cur."from"()
    inc $P10
    set rx211_pos, $P10
    ge rx211_pos, rx211_eos, rxscan214_done
  rxscan214_scan:
    set_addr $I10, rxscan214_loop
    rx211_cur."!mark_push"(0, rx211_pos, $I10)
  rxscan214_done:
.annotate 'line', 81
  # rx literal  "\\"
    add $I11, rx211_pos, 1
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    ord $I11, rx211_tgt, $I11
    ne $I11, 92, rx211_fail
    add rx211_pos, 1
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."quotemod_check"("q")
    unless $P10, rx211_fail
  # rx subrule "stopper" subtype=capture negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."stopper"()
    unless $P10, rx211_fail
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx211_pos = $P10."pos"()
  # rx pass
    rx211_cur."!cursor_pass"(rx211_pos, "quote_escape:sym<stopper>")
    if_null rx211_debug, debug_198
    rx211_cur."!cursor_debug"("PASS", "quote_escape:sym<stopper>", " at pos=", rx211_pos)
  debug_198:
    .return (rx211_cur)
  rx211_restart:
.annotate 'line', 33
    if_null rx211_debug, debug_199
    rx211_cur."!cursor_debug"("NEXT", "quote_escape:sym<stopper>")
  debug_199:
  rx211_fail:
    (rx211_rep, rx211_pos, $I10, $P10) = rx211_cur."!mark_fail"(0)
    lt rx211_pos, -1, rx211_done
    eq rx211_pos, -1, rx211_fail
    jump $I10
  rx211_done:
    rx211_cur."!cursor_fail"()
    if_null rx211_debug, debug_200
    rx211_cur."!cursor_debug"("FAIL", "quote_escape:sym<stopper>")
  debug_200:
    .return (rx211_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("72_1297880734.85639") :method
.annotate 'line', 33
    new $P213, "ResizablePMCArray"
    push $P213, "\\"
    .return ($P213)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("73_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx216_tgt
    .local int rx216_pos
    .local int rx216_off
    .local int rx216_eos
    .local int rx216_rep
    .local pmc rx216_cur
    .local pmc rx216_debug
    (rx216_cur, rx216_pos, rx216_tgt, $I10) = self."!cursor_start"()
    getattribute rx216_debug, rx216_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx216_cur
    .local pmc match
    .lex "$/", match
    length rx216_eos, rx216_tgt
    gt rx216_pos, rx216_eos, rx216_done
    set rx216_off, 0
    lt rx216_pos, 2, rx216_start
    sub rx216_off, rx216_pos, 1
    substr rx216_tgt, rx216_tgt, rx216_off
  rx216_start:
    eq $I10, 1, rx216_restart
    if_null rx216_debug, debug_201
    rx216_cur."!cursor_debug"("START", "quote_escape:sym<bs>")
  debug_201:
    $I10 = self.'from'()
    ne $I10, -1, rxscan219_done
    goto rxscan219_scan
  rxscan219_loop:
    ($P10) = rx216_cur."from"()
    inc $P10
    set rx216_pos, $P10
    ge rx216_pos, rx216_eos, rxscan219_done
  rxscan219_scan:
    set_addr $I10, rxscan219_loop
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  rxscan219_done:
.annotate 'line', 83
  # rx literal  "\\b"
    add $I11, rx216_pos, 2
    gt $I11, rx216_eos, rx216_fail
    sub $I11, rx216_pos, rx216_off
    substr $S10, rx216_tgt, $I11, 2
    ne $S10, "\\b", rx216_fail
    add rx216_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."quotemod_check"("b")
    unless $P10, rx216_fail
  # rx pass
    rx216_cur."!cursor_pass"(rx216_pos, "quote_escape:sym<bs>")
    if_null rx216_debug, debug_202
    rx216_cur."!cursor_debug"("PASS", "quote_escape:sym<bs>", " at pos=", rx216_pos)
  debug_202:
    .return (rx216_cur)
  rx216_restart:
.annotate 'line', 33
    if_null rx216_debug, debug_203
    rx216_cur."!cursor_debug"("NEXT", "quote_escape:sym<bs>")
  debug_203:
  rx216_fail:
    (rx216_rep, rx216_pos, $I10, $P10) = rx216_cur."!mark_fail"(0)
    lt rx216_pos, -1, rx216_done
    eq rx216_pos, -1, rx216_fail
    jump $I10
  rx216_done:
    rx216_cur."!cursor_fail"()
    if_null rx216_debug, debug_204
    rx216_cur."!cursor_debug"("FAIL", "quote_escape:sym<bs>")
  debug_204:
    .return (rx216_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("74_1297880734.85639") :method
.annotate 'line', 33
    new $P218, "ResizablePMCArray"
    push $P218, "\\b"
    .return ($P218)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("75_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx221_tgt
    .local int rx221_pos
    .local int rx221_off
    .local int rx221_eos
    .local int rx221_rep
    .local pmc rx221_cur
    .local pmc rx221_debug
    (rx221_cur, rx221_pos, rx221_tgt, $I10) = self."!cursor_start"()
    getattribute rx221_debug, rx221_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx221_cur
    .local pmc match
    .lex "$/", match
    length rx221_eos, rx221_tgt
    gt rx221_pos, rx221_eos, rx221_done
    set rx221_off, 0
    lt rx221_pos, 2, rx221_start
    sub rx221_off, rx221_pos, 1
    substr rx221_tgt, rx221_tgt, rx221_off
  rx221_start:
    eq $I10, 1, rx221_restart
    if_null rx221_debug, debug_205
    rx221_cur."!cursor_debug"("START", "quote_escape:sym<nl>")
  debug_205:
    $I10 = self.'from'()
    ne $I10, -1, rxscan224_done
    goto rxscan224_scan
  rxscan224_loop:
    ($P10) = rx221_cur."from"()
    inc $P10
    set rx221_pos, $P10
    ge rx221_pos, rx221_eos, rxscan224_done
  rxscan224_scan:
    set_addr $I10, rxscan224_loop
    rx221_cur."!mark_push"(0, rx221_pos, $I10)
  rxscan224_done:
.annotate 'line', 84
  # rx literal  "\\n"
    add $I11, rx221_pos, 2
    gt $I11, rx221_eos, rx221_fail
    sub $I11, rx221_pos, rx221_off
    substr $S10, rx221_tgt, $I11, 2
    ne $S10, "\\n", rx221_fail
    add rx221_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx221_cur."!cursor_pos"(rx221_pos)
    $P10 = rx221_cur."quotemod_check"("b")
    unless $P10, rx221_fail
  # rx pass
    rx221_cur."!cursor_pass"(rx221_pos, "quote_escape:sym<nl>")
    if_null rx221_debug, debug_206
    rx221_cur."!cursor_debug"("PASS", "quote_escape:sym<nl>", " at pos=", rx221_pos)
  debug_206:
    .return (rx221_cur)
  rx221_restart:
.annotate 'line', 33
    if_null rx221_debug, debug_207
    rx221_cur."!cursor_debug"("NEXT", "quote_escape:sym<nl>")
  debug_207:
  rx221_fail:
    (rx221_rep, rx221_pos, $I10, $P10) = rx221_cur."!mark_fail"(0)
    lt rx221_pos, -1, rx221_done
    eq rx221_pos, -1, rx221_fail
    jump $I10
  rx221_done:
    rx221_cur."!cursor_fail"()
    if_null rx221_debug, debug_208
    rx221_cur."!cursor_debug"("FAIL", "quote_escape:sym<nl>")
  debug_208:
    .return (rx221_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("76_1297880734.85639") :method
.annotate 'line', 33
    new $P223, "ResizablePMCArray"
    push $P223, "\\n"
    .return ($P223)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("77_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx226_tgt
    .local int rx226_pos
    .local int rx226_off
    .local int rx226_eos
    .local int rx226_rep
    .local pmc rx226_cur
    .local pmc rx226_debug
    (rx226_cur, rx226_pos, rx226_tgt, $I10) = self."!cursor_start"()
    getattribute rx226_debug, rx226_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx226_cur
    .local pmc match
    .lex "$/", match
    length rx226_eos, rx226_tgt
    gt rx226_pos, rx226_eos, rx226_done
    set rx226_off, 0
    lt rx226_pos, 2, rx226_start
    sub rx226_off, rx226_pos, 1
    substr rx226_tgt, rx226_tgt, rx226_off
  rx226_start:
    eq $I10, 1, rx226_restart
    if_null rx226_debug, debug_209
    rx226_cur."!cursor_debug"("START", "quote_escape:sym<cr>")
  debug_209:
    $I10 = self.'from'()
    ne $I10, -1, rxscan229_done
    goto rxscan229_scan
  rxscan229_loop:
    ($P10) = rx226_cur."from"()
    inc $P10
    set rx226_pos, $P10
    ge rx226_pos, rx226_eos, rxscan229_done
  rxscan229_scan:
    set_addr $I10, rxscan229_loop
    rx226_cur."!mark_push"(0, rx226_pos, $I10)
  rxscan229_done:
.annotate 'line', 85
  # rx literal  "\\r"
    add $I11, rx226_pos, 2
    gt $I11, rx226_eos, rx226_fail
    sub $I11, rx226_pos, rx226_off
    substr $S10, rx226_tgt, $I11, 2
    ne $S10, "\\r", rx226_fail
    add rx226_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx226_cur."!cursor_pos"(rx226_pos)
    $P10 = rx226_cur."quotemod_check"("b")
    unless $P10, rx226_fail
  # rx pass
    rx226_cur."!cursor_pass"(rx226_pos, "quote_escape:sym<cr>")
    if_null rx226_debug, debug_210
    rx226_cur."!cursor_debug"("PASS", "quote_escape:sym<cr>", " at pos=", rx226_pos)
  debug_210:
    .return (rx226_cur)
  rx226_restart:
.annotate 'line', 33
    if_null rx226_debug, debug_211
    rx226_cur."!cursor_debug"("NEXT", "quote_escape:sym<cr>")
  debug_211:
  rx226_fail:
    (rx226_rep, rx226_pos, $I10, $P10) = rx226_cur."!mark_fail"(0)
    lt rx226_pos, -1, rx226_done
    eq rx226_pos, -1, rx226_fail
    jump $I10
  rx226_done:
    rx226_cur."!cursor_fail"()
    if_null rx226_debug, debug_212
    rx226_cur."!cursor_debug"("FAIL", "quote_escape:sym<cr>")
  debug_212:
    .return (rx226_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("78_1297880734.85639") :method
.annotate 'line', 33
    new $P228, "ResizablePMCArray"
    push $P228, "\\r"
    .return ($P228)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("79_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx231_tgt
    .local int rx231_pos
    .local int rx231_off
    .local int rx231_eos
    .local int rx231_rep
    .local pmc rx231_cur
    .local pmc rx231_debug
    (rx231_cur, rx231_pos, rx231_tgt, $I10) = self."!cursor_start"()
    getattribute rx231_debug, rx231_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx231_cur
    .local pmc match
    .lex "$/", match
    length rx231_eos, rx231_tgt
    gt rx231_pos, rx231_eos, rx231_done
    set rx231_off, 0
    lt rx231_pos, 2, rx231_start
    sub rx231_off, rx231_pos, 1
    substr rx231_tgt, rx231_tgt, rx231_off
  rx231_start:
    eq $I10, 1, rx231_restart
    if_null rx231_debug, debug_213
    rx231_cur."!cursor_debug"("START", "quote_escape:sym<tab>")
  debug_213:
    $I10 = self.'from'()
    ne $I10, -1, rxscan234_done
    goto rxscan234_scan
  rxscan234_loop:
    ($P10) = rx231_cur."from"()
    inc $P10
    set rx231_pos, $P10
    ge rx231_pos, rx231_eos, rxscan234_done
  rxscan234_scan:
    set_addr $I10, rxscan234_loop
    rx231_cur."!mark_push"(0, rx231_pos, $I10)
  rxscan234_done:
.annotate 'line', 86
  # rx literal  "\\t"
    add $I11, rx231_pos, 2
    gt $I11, rx231_eos, rx231_fail
    sub $I11, rx231_pos, rx231_off
    substr $S10, rx231_tgt, $I11, 2
    ne $S10, "\\t", rx231_fail
    add rx231_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx231_cur."!cursor_pos"(rx231_pos)
    $P10 = rx231_cur."quotemod_check"("b")
    unless $P10, rx231_fail
  # rx pass
    rx231_cur."!cursor_pass"(rx231_pos, "quote_escape:sym<tab>")
    if_null rx231_debug, debug_214
    rx231_cur."!cursor_debug"("PASS", "quote_escape:sym<tab>", " at pos=", rx231_pos)
  debug_214:
    .return (rx231_cur)
  rx231_restart:
.annotate 'line', 33
    if_null rx231_debug, debug_215
    rx231_cur."!cursor_debug"("NEXT", "quote_escape:sym<tab>")
  debug_215:
  rx231_fail:
    (rx231_rep, rx231_pos, $I10, $P10) = rx231_cur."!mark_fail"(0)
    lt rx231_pos, -1, rx231_done
    eq rx231_pos, -1, rx231_fail
    jump $I10
  rx231_done:
    rx231_cur."!cursor_fail"()
    if_null rx231_debug, debug_216
    rx231_cur."!cursor_debug"("FAIL", "quote_escape:sym<tab>")
  debug_216:
    .return (rx231_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("80_1297880734.85639") :method
.annotate 'line', 33
    new $P233, "ResizablePMCArray"
    push $P233, "\\t"
    .return ($P233)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<ff>"  :subid("81_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx236_tgt
    .local int rx236_pos
    .local int rx236_off
    .local int rx236_eos
    .local int rx236_rep
    .local pmc rx236_cur
    .local pmc rx236_debug
    (rx236_cur, rx236_pos, rx236_tgt, $I10) = self."!cursor_start"()
    getattribute rx236_debug, rx236_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx236_cur
    .local pmc match
    .lex "$/", match
    length rx236_eos, rx236_tgt
    gt rx236_pos, rx236_eos, rx236_done
    set rx236_off, 0
    lt rx236_pos, 2, rx236_start
    sub rx236_off, rx236_pos, 1
    substr rx236_tgt, rx236_tgt, rx236_off
  rx236_start:
    eq $I10, 1, rx236_restart
    if_null rx236_debug, debug_217
    rx236_cur."!cursor_debug"("START", "quote_escape:sym<ff>")
  debug_217:
    $I10 = self.'from'()
    ne $I10, -1, rxscan239_done
    goto rxscan239_scan
  rxscan239_loop:
    ($P10) = rx236_cur."from"()
    inc $P10
    set rx236_pos, $P10
    ge rx236_pos, rx236_eos, rxscan239_done
  rxscan239_scan:
    set_addr $I10, rxscan239_loop
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
  rxscan239_done:
.annotate 'line', 87
  # rx literal  "\\f"
    add $I11, rx236_pos, 2
    gt $I11, rx236_eos, rx236_fail
    sub $I11, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I11, 2
    ne $S10, "\\f", rx236_fail
    add rx236_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx236_cur."!cursor_pos"(rx236_pos)
    $P10 = rx236_cur."quotemod_check"("b")
    unless $P10, rx236_fail
  # rx pass
    rx236_cur."!cursor_pass"(rx236_pos, "quote_escape:sym<ff>")
    if_null rx236_debug, debug_218
    rx236_cur."!cursor_debug"("PASS", "quote_escape:sym<ff>", " at pos=", rx236_pos)
  debug_218:
    .return (rx236_cur)
  rx236_restart:
.annotate 'line', 33
    if_null rx236_debug, debug_219
    rx236_cur."!cursor_debug"("NEXT", "quote_escape:sym<ff>")
  debug_219:
  rx236_fail:
    (rx236_rep, rx236_pos, $I10, $P10) = rx236_cur."!mark_fail"(0)
    lt rx236_pos, -1, rx236_done
    eq rx236_pos, -1, rx236_fail
    jump $I10
  rx236_done:
    rx236_cur."!cursor_fail"()
    if_null rx236_debug, debug_220
    rx236_cur."!cursor_debug"("FAIL", "quote_escape:sym<ff>")
  debug_220:
    .return (rx236_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<ff>"  :subid("82_1297880734.85639") :method
.annotate 'line', 33
    new $P238, "ResizablePMCArray"
    push $P238, "\\f"
    .return ($P238)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("83_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx241_tgt
    .local int rx241_pos
    .local int rx241_off
    .local int rx241_eos
    .local int rx241_rep
    .local pmc rx241_cur
    .local pmc rx241_debug
    (rx241_cur, rx241_pos, rx241_tgt, $I10) = self."!cursor_start"()
    getattribute rx241_debug, rx241_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx241_cur
    .local pmc match
    .lex "$/", match
    length rx241_eos, rx241_tgt
    gt rx241_pos, rx241_eos, rx241_done
    set rx241_off, 0
    lt rx241_pos, 2, rx241_start
    sub rx241_off, rx241_pos, 1
    substr rx241_tgt, rx241_tgt, rx241_off
  rx241_start:
    eq $I10, 1, rx241_restart
    if_null rx241_debug, debug_221
    rx241_cur."!cursor_debug"("START", "quote_escape:sym<esc>")
  debug_221:
    $I10 = self.'from'()
    ne $I10, -1, rxscan244_done
    goto rxscan244_scan
  rxscan244_loop:
    ($P10) = rx241_cur."from"()
    inc $P10
    set rx241_pos, $P10
    ge rx241_pos, rx241_eos, rxscan244_done
  rxscan244_scan:
    set_addr $I10, rxscan244_loop
    rx241_cur."!mark_push"(0, rx241_pos, $I10)
  rxscan244_done:
.annotate 'line', 88
  # rx literal  "\\e"
    add $I11, rx241_pos, 2
    gt $I11, rx241_eos, rx241_fail
    sub $I11, rx241_pos, rx241_off
    substr $S10, rx241_tgt, $I11, 2
    ne $S10, "\\e", rx241_fail
    add rx241_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx241_cur."!cursor_pos"(rx241_pos)
    $P10 = rx241_cur."quotemod_check"("b")
    unless $P10, rx241_fail
  # rx pass
    rx241_cur."!cursor_pass"(rx241_pos, "quote_escape:sym<esc>")
    if_null rx241_debug, debug_222
    rx241_cur."!cursor_debug"("PASS", "quote_escape:sym<esc>", " at pos=", rx241_pos)
  debug_222:
    .return (rx241_cur)
  rx241_restart:
.annotate 'line', 33
    if_null rx241_debug, debug_223
    rx241_cur."!cursor_debug"("NEXT", "quote_escape:sym<esc>")
  debug_223:
  rx241_fail:
    (rx241_rep, rx241_pos, $I10, $P10) = rx241_cur."!mark_fail"(0)
    lt rx241_pos, -1, rx241_done
    eq rx241_pos, -1, rx241_fail
    jump $I10
  rx241_done:
    rx241_cur."!cursor_fail"()
    if_null rx241_debug, debug_224
    rx241_cur."!cursor_debug"("FAIL", "quote_escape:sym<esc>")
  debug_224:
    .return (rx241_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("84_1297880734.85639") :method
.annotate 'line', 33
    new $P243, "ResizablePMCArray"
    push $P243, "\\e"
    .return ($P243)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("85_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    .local pmc rx246_debug
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    getattribute rx246_debug, rx246_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    gt rx246_pos, rx246_eos, rx246_done
    set rx246_off, 0
    lt rx246_pos, 2, rx246_start
    sub rx246_off, rx246_pos, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
    eq $I10, 1, rx246_restart
    if_null rx246_debug, debug_225
    rx246_cur."!cursor_debug"("START", "quote_escape:sym<hex>")
  debug_225:
    $I10 = self.'from'()
    ne $I10, -1, rxscan249_done
    goto rxscan249_scan
  rxscan249_loop:
    ($P10) = rx246_cur."from"()
    inc $P10
    set rx246_pos, $P10
    ge rx246_pos, rx246_eos, rxscan249_done
  rxscan249_scan:
    set_addr $I10, rxscan249_loop
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxscan249_done:
.annotate 'line', 90
  # rx literal  unicode:"\\x"
    add $I11, rx246_pos, 2
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 2
    ne $S10, unicode:"\\x", rx246_fail
    add rx246_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."quotemod_check"("b")
    unless $P10, rx246_fail
  alt250_0:
.annotate 'line', 91
    set_addr $I10, alt250_1
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."hexint"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx246_pos = $P10."pos"()
    goto alt250_end
  alt250_1:
  # rx literal  "["
    add $I11, rx246_pos, 1
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    ord $I11, rx246_tgt, $I11
    ne $I11, 91, rx246_fail
    add rx246_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."hexints"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx246_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx246_pos, 1
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    ord $I11, rx246_tgt, $I11
    ne $I11, 93, rx246_fail
    add rx246_pos, 1
  alt250_end:
.annotate 'line', 89
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "quote_escape:sym<hex>")
    if_null rx246_debug, debug_226
    rx246_cur."!cursor_debug"("PASS", "quote_escape:sym<hex>", " at pos=", rx246_pos)
  debug_226:
    .return (rx246_cur)
  rx246_restart:
.annotate 'line', 33
    if_null rx246_debug, debug_227
    rx246_cur."!cursor_debug"("NEXT", "quote_escape:sym<hex>")
  debug_227:
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    if_null rx246_debug, debug_228
    rx246_cur."!cursor_debug"("FAIL", "quote_escape:sym<hex>")
  debug_228:
    .return (rx246_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("86_1297880734.85639") :method
.annotate 'line', 33
    new $P248, "ResizablePMCArray"
    push $P248, unicode:"\\x"
    .return ($P248)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("87_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    .local pmc rx252_debug
    (rx252_cur, rx252_pos, rx252_tgt, $I10) = self."!cursor_start"()
    getattribute rx252_debug, rx252_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    gt rx252_pos, rx252_eos, rx252_done
    set rx252_off, 0
    lt rx252_pos, 2, rx252_start
    sub rx252_off, rx252_pos, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
    eq $I10, 1, rx252_restart
    if_null rx252_debug, debug_229
    rx252_cur."!cursor_debug"("START", "quote_escape:sym<oct>")
  debug_229:
    $I10 = self.'from'()
    ne $I10, -1, rxscan255_done
    goto rxscan255_scan
  rxscan255_loop:
    ($P10) = rx252_cur."from"()
    inc $P10
    set rx252_pos, $P10
    ge rx252_pos, rx252_eos, rxscan255_done
  rxscan255_scan:
    set_addr $I10, rxscan255_loop
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  rxscan255_done:
.annotate 'line', 94
  # rx literal  "\\o"
    add $I11, rx252_pos, 2
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 2
    ne $S10, "\\o", rx252_fail
    add rx252_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."quotemod_check"("b")
    unless $P10, rx252_fail
  alt256_0:
.annotate 'line', 95
    set_addr $I10, alt256_1
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."octint"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx252_pos = $P10."pos"()
    goto alt256_end
  alt256_1:
  # rx literal  "["
    add $I11, rx252_pos, 1
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    ord $I11, rx252_tgt, $I11
    ne $I11, 91, rx252_fail
    add rx252_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."octints"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx252_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx252_pos, 1
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    ord $I11, rx252_tgt, $I11
    ne $I11, 93, rx252_fail
    add rx252_pos, 1
  alt256_end:
.annotate 'line', 93
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "quote_escape:sym<oct>")
    if_null rx252_debug, debug_230
    rx252_cur."!cursor_debug"("PASS", "quote_escape:sym<oct>", " at pos=", rx252_pos)
  debug_230:
    .return (rx252_cur)
  rx252_restart:
.annotate 'line', 33
    if_null rx252_debug, debug_231
    rx252_cur."!cursor_debug"("NEXT", "quote_escape:sym<oct>")
  debug_231:
  rx252_fail:
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    if_null rx252_debug, debug_232
    rx252_cur."!cursor_debug"("FAIL", "quote_escape:sym<oct>")
  debug_232:
    .return (rx252_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("88_1297880734.85639") :method
.annotate 'line', 33
    new $P254, "ResizablePMCArray"
    push $P254, "\\o"
    .return ($P254)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("89_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx258_tgt
    .local int rx258_pos
    .local int rx258_off
    .local int rx258_eos
    .local int rx258_rep
    .local pmc rx258_cur
    .local pmc rx258_debug
    (rx258_cur, rx258_pos, rx258_tgt, $I10) = self."!cursor_start"()
    getattribute rx258_debug, rx258_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx258_cur
    .local pmc match
    .lex "$/", match
    length rx258_eos, rx258_tgt
    gt rx258_pos, rx258_eos, rx258_done
    set rx258_off, 0
    lt rx258_pos, 2, rx258_start
    sub rx258_off, rx258_pos, 1
    substr rx258_tgt, rx258_tgt, rx258_off
  rx258_start:
    eq $I10, 1, rx258_restart
    if_null rx258_debug, debug_233
    rx258_cur."!cursor_debug"("START", "quote_escape:sym<chr>")
  debug_233:
    $I10 = self.'from'()
    ne $I10, -1, rxscan261_done
    goto rxscan261_scan
  rxscan261_loop:
    ($P10) = rx258_cur."from"()
    inc $P10
    set rx258_pos, $P10
    ge rx258_pos, rx258_eos, rxscan261_done
  rxscan261_scan:
    set_addr $I10, rxscan261_loop
    rx258_cur."!mark_push"(0, rx258_pos, $I10)
  rxscan261_done:
.annotate 'line', 97
  # rx literal  "\\c"
    add $I11, rx258_pos, 2
    gt $I11, rx258_eos, rx258_fail
    sub $I11, rx258_pos, rx258_off
    substr $S10, rx258_tgt, $I11, 2
    ne $S10, "\\c", rx258_fail
    add rx258_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx258_cur."!cursor_pos"(rx258_pos)
    $P10 = rx258_cur."quotemod_check"("b")
    unless $P10, rx258_fail
  # rx subrule "charspec" subtype=capture negate=
    rx258_cur."!cursor_pos"(rx258_pos)
    $P10 = rx258_cur."charspec"()
    unless $P10, rx258_fail
    rx258_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx258_pos = $P10."pos"()
  # rx pass
    rx258_cur."!cursor_pass"(rx258_pos, "quote_escape:sym<chr>")
    if_null rx258_debug, debug_234
    rx258_cur."!cursor_debug"("PASS", "quote_escape:sym<chr>", " at pos=", rx258_pos)
  debug_234:
    .return (rx258_cur)
  rx258_restart:
.annotate 'line', 33
    if_null rx258_debug, debug_235
    rx258_cur."!cursor_debug"("NEXT", "quote_escape:sym<chr>")
  debug_235:
  rx258_fail:
    (rx258_rep, rx258_pos, $I10, $P10) = rx258_cur."!mark_fail"(0)
    lt rx258_pos, -1, rx258_done
    eq rx258_pos, -1, rx258_fail
    jump $I10
  rx258_done:
    rx258_cur."!cursor_fail"()
    if_null rx258_debug, debug_236
    rx258_cur."!cursor_debug"("FAIL", "quote_escape:sym<chr>")
  debug_236:
    .return (rx258_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("90_1297880734.85639") :method
.annotate 'line', 33
    new $P260, "ResizablePMCArray"
    push $P260, "\\c"
    .return ($P260)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<0>"  :subid("91_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx263_tgt
    .local int rx263_pos
    .local int rx263_off
    .local int rx263_eos
    .local int rx263_rep
    .local pmc rx263_cur
    .local pmc rx263_debug
    (rx263_cur, rx263_pos, rx263_tgt, $I10) = self."!cursor_start"()
    getattribute rx263_debug, rx263_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx263_cur
    .local pmc match
    .lex "$/", match
    length rx263_eos, rx263_tgt
    gt rx263_pos, rx263_eos, rx263_done
    set rx263_off, 0
    lt rx263_pos, 2, rx263_start
    sub rx263_off, rx263_pos, 1
    substr rx263_tgt, rx263_tgt, rx263_off
  rx263_start:
    eq $I10, 1, rx263_restart
    if_null rx263_debug, debug_237
    rx263_cur."!cursor_debug"("START", "quote_escape:sym<0>")
  debug_237:
    $I10 = self.'from'()
    ne $I10, -1, rxscan266_done
    goto rxscan266_scan
  rxscan266_loop:
    ($P10) = rx263_cur."from"()
    inc $P10
    set rx263_pos, $P10
    ge rx263_pos, rx263_eos, rxscan266_done
  rxscan266_scan:
    set_addr $I10, rxscan266_loop
    rx263_cur."!mark_push"(0, rx263_pos, $I10)
  rxscan266_done:
.annotate 'line', 98
  # rx literal  "\\"
    add $I11, rx263_pos, 1
    gt $I11, rx263_eos, rx263_fail
    sub $I11, rx263_pos, rx263_off
    ord $I11, rx263_tgt, $I11
    ne $I11, 92, rx263_fail
    add rx263_pos, 1
  # rx subcapture "sym"
    set_addr $I10, rxcap_267_fail
    rx263_cur."!mark_push"(0, rx263_pos, $I10)
  # rx literal  "0"
    add $I11, rx263_pos, 1
    gt $I11, rx263_eos, rx263_fail
    sub $I11, rx263_pos, rx263_off
    ord $I11, rx263_tgt, $I11
    ne $I11, 48, rx263_fail
    add rx263_pos, 1
    set_addr $I10, rxcap_267_fail
    ($I12, $I11) = rx263_cur."!mark_peek"($I10)
    rx263_cur."!cursor_pos"($I11)
    ($P10) = rx263_cur."!cursor_start"()
    $P10."!cursor_pass"(rx263_pos, "")
    rx263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_267_done
  rxcap_267_fail:
    goto rx263_fail
  rxcap_267_done:
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx263_cur."!cursor_pos"(rx263_pos)
    $P10 = rx263_cur."quotemod_check"("b")
    unless $P10, rx263_fail
  # rx pass
    rx263_cur."!cursor_pass"(rx263_pos, "quote_escape:sym<0>")
    if_null rx263_debug, debug_238
    rx263_cur."!cursor_debug"("PASS", "quote_escape:sym<0>", " at pos=", rx263_pos)
  debug_238:
    .return (rx263_cur)
  rx263_restart:
.annotate 'line', 33
    if_null rx263_debug, debug_239
    rx263_cur."!cursor_debug"("NEXT", "quote_escape:sym<0>")
  debug_239:
  rx263_fail:
    (rx263_rep, rx263_pos, $I10, $P10) = rx263_cur."!mark_fail"(0)
    lt rx263_pos, -1, rx263_done
    eq rx263_pos, -1, rx263_fail
    jump $I10
  rx263_done:
    rx263_cur."!cursor_fail"()
    if_null rx263_debug, debug_240
    rx263_cur."!cursor_debug"("FAIL", "quote_escape:sym<0>")
  debug_240:
    .return (rx263_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<0>"  :subid("92_1297880734.85639") :method
.annotate 'line', 33
    new $P265, "ResizablePMCArray"
    push $P265, "\\0"
    .return ($P265)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<misc>"  :subid("93_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .const 'Sub' $P288 = "97_1297880734.85639" 
    capture_lex $P288
    .const 'Sub' $P281 = "96_1297880734.85639" 
    capture_lex $P281
    .const 'Sub' $P276 = "95_1297880734.85639" 
    capture_lex $P276
    .local string rx269_tgt
    .local int rx269_pos
    .local int rx269_off
    .local int rx269_eos
    .local int rx269_rep
    .local pmc rx269_cur
    .local pmc rx269_debug
    (rx269_cur, rx269_pos, rx269_tgt, $I10) = self."!cursor_start"()
    getattribute rx269_debug, rx269_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx269_cur
    .local pmc match
    .lex "$/", match
    length rx269_eos, rx269_tgt
    gt rx269_pos, rx269_eos, rx269_done
    set rx269_off, 0
    lt rx269_pos, 2, rx269_start
    sub rx269_off, rx269_pos, 1
    substr rx269_tgt, rx269_tgt, rx269_off
  rx269_start:
    eq $I10, 1, rx269_restart
    if_null rx269_debug, debug_241
    rx269_cur."!cursor_debug"("START", "quote_escape:sym<misc>")
  debug_241:
    $I10 = self.'from'()
    ne $I10, -1, rxscan272_done
    goto rxscan272_scan
  rxscan272_loop:
    ($P10) = rx269_cur."from"()
    inc $P10
    set rx269_pos, $P10
    ge rx269_pos, rx269_eos, rxscan272_done
  rxscan272_scan:
    set_addr $I10, rxscan272_loop
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  rxscan272_done:
.annotate 'line', 100
    rx269_cur."!cursor_pos"(rx269_pos)
    find_lex $P273, unicode:"$\x{a2}"
    $P274 = $P273."MATCH"()
    store_lex "$/", $P274
    .const 'Sub' $P276 = "95_1297880734.85639" 
    capture_lex $P276
    $P277 = $P276()
  # rx literal  "\\"
    add $I11, rx269_pos, 1
    gt $I11, rx269_eos, rx269_fail
    sub $I11, rx269_pos, rx269_off
    ord $I11, rx269_tgt, $I11
    ne $I11, 92, rx269_fail
    add rx269_pos, 1
  alt278_0:
.annotate 'line', 101
    set_addr $I10, alt278_1
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
.annotate 'line', 102
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx269_cur."!cursor_pos"(rx269_pos)
    $P10 = rx269_cur."quotemod_check"("b")
    unless $P10, rx269_fail
  alt279_0:
.annotate 'line', 103
    set_addr $I10, alt279_1
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
.annotate 'line', 104
  # rx subrule $P281 subtype=capture negate=
    rx269_cur."!cursor_pos"(rx269_pos)
    .const 'Sub' $P281 = "96_1297880734.85639" 
    capture_lex $P281
    $P10 = rx269_cur.$P281()
    unless $P10, rx269_fail
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("textqq")
    rx269_pos = $P10."pos"()
    goto alt279_end
  alt279_1:
.annotate 'line', 105
  # rx subcapture "x"
    set_addr $I10, rxcap_284_fail
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  # rx charclass w
    ge rx269_pos, rx269_eos, rx269_fail
    sub $I10, rx269_pos, rx269_off
    is_cclass $I11, 8192, rx269_tgt, $I10
    unless $I11, rx269_fail
    inc rx269_pos
    set_addr $I10, rxcap_284_fail
    ($I12, $I11) = rx269_cur."!mark_peek"($I10)
    rx269_cur."!cursor_pos"($I11)
    ($P10) = rx269_cur."!cursor_start"()
    $P10."!cursor_pass"(rx269_pos, "")
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("x")
    goto rxcap_284_done
  rxcap_284_fail:
    goto rx269_fail
  rxcap_284_done:
    rx269_cur."!cursor_pos"(rx269_pos)
    find_lex $P285, unicode:"$\x{a2}"
    $P286 = $P285."MATCH"()
    store_lex "$/", $P286
    .const 'Sub' $P288 = "97_1297880734.85639" 
    capture_lex $P288
    $P298 = $P288()
  alt279_end:
.annotate 'line', 102
    goto alt278_end
  alt278_1:
.annotate 'line', 107
  # rx subcapture "textq"
    set_addr $I10, rxcap_299_fail
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  # rx charclass .
    ge rx269_pos, rx269_eos, rx269_fail
    inc rx269_pos
    set_addr $I10, rxcap_299_fail
    ($I12, $I11) = rx269_cur."!mark_peek"($I10)
    rx269_cur."!cursor_pos"($I11)
    ($P10) = rx269_cur."!cursor_start"()
    $P10."!cursor_pass"(rx269_pos, "")
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("textq")
    goto rxcap_299_done
  rxcap_299_fail:
    goto rx269_fail
  rxcap_299_done:
  alt278_end:
.annotate 'line', 99
  # rx pass
    rx269_cur."!cursor_pass"(rx269_pos, "quote_escape:sym<misc>")
    if_null rx269_debug, debug_248
    rx269_cur."!cursor_debug"("PASS", "quote_escape:sym<misc>", " at pos=", rx269_pos)
  debug_248:
    .return (rx269_cur)
  rx269_restart:
.annotate 'line', 33
    if_null rx269_debug, debug_249
    rx269_cur."!cursor_debug"("NEXT", "quote_escape:sym<misc>")
  debug_249:
  rx269_fail:
    (rx269_rep, rx269_pos, $I10, $P10) = rx269_cur."!mark_fail"(0)
    lt rx269_pos, -1, rx269_done
    eq rx269_pos, -1, rx269_fail
    jump $I10
  rx269_done:
    rx269_cur."!cursor_fail"()
    if_null rx269_debug, debug_250
    rx269_cur."!cursor_debug"("FAIL", "quote_escape:sym<misc>")
  debug_250:
    .return (rx269_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<misc>"  :subid("94_1297880734.85639") :method
.annotate 'line', 33
    new $P271, "ResizablePMCArray"
    push $P271, ""
    .return ($P271)
.end


.namespace ["HLL";"Grammar"]
.sub "_block275"  :anon :subid("95_1297880734.85639") :outer("93_1297880734.85639")
.annotate 'line', 100
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "_block280"  :anon :subid("96_1297880734.85639") :method :outer("93_1297880734.85639")
.annotate 'line', 104
    .local string rx282_tgt
    .local int rx282_pos
    .local int rx282_off
    .local int rx282_eos
    .local int rx282_rep
    .local pmc rx282_cur
    .local pmc rx282_debug
    (rx282_cur, rx282_pos, rx282_tgt, $I10) = self."!cursor_start"()
    getattribute rx282_debug, rx282_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx282_cur
    .local pmc match
    .lex "$/", match
    length rx282_eos, rx282_tgt
    gt rx282_pos, rx282_eos, rx282_done
    set rx282_off, 0
    lt rx282_pos, 2, rx282_start
    sub rx282_off, rx282_pos, 1
    substr rx282_tgt, rx282_tgt, rx282_off
  rx282_start:
    eq $I10, 1, rx282_restart
    if_null rx282_debug, debug_242
    rx282_cur."!cursor_debug"("START", "")
  debug_242:
    $I10 = self.'from'()
    ne $I10, -1, rxscan283_done
    goto rxscan283_scan
  rxscan283_loop:
    ($P10) = rx282_cur."from"()
    inc $P10
    set rx282_pos, $P10
    ge rx282_pos, rx282_eos, rxscan283_done
  rxscan283_scan:
    set_addr $I10, rxscan283_loop
    rx282_cur."!mark_push"(0, rx282_pos, $I10)
  rxscan283_done:
  # rx charclass W
    ge rx282_pos, rx282_eos, rx282_fail
    sub $I10, rx282_pos, rx282_off
    is_cclass $I11, 8192, rx282_tgt, $I10
    if $I11, rx282_fail
    inc rx282_pos
  # rx pass
    rx282_cur."!cursor_pass"(rx282_pos, "")
    if_null rx282_debug, debug_243
    rx282_cur."!cursor_debug"("PASS", "", " at pos=", rx282_pos)
  debug_243:
    .return (rx282_cur)
  rx282_restart:
    if_null rx282_debug, debug_244
    rx282_cur."!cursor_debug"("NEXT", "")
  debug_244:
  rx282_fail:
    (rx282_rep, rx282_pos, $I10, $P10) = rx282_cur."!mark_fail"(0)
    lt rx282_pos, -1, rx282_done
    eq rx282_pos, -1, rx282_fail
    jump $I10
  rx282_done:
    rx282_cur."!cursor_fail"()
    if_null rx282_debug, debug_245
    rx282_cur."!cursor_debug"("FAIL", "")
  debug_245:
    .return (rx282_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "_block287"  :anon :subid("97_1297880734.85639") :outer("93_1297880734.85639")
.annotate 'line', 105
    find_lex $P289, "$/"
    $P290 = $P289."CURSOR"()
    new $P291, "String"
    assign $P291, "Unrecognized backslash sequence: '\\"
    find_lex $P292, "$/"
    unless_null $P292, vivify_246
    $P292 = root_new ['parrot';'Hash']
  vivify_246:
    set $P293, $P292["x"]
    unless_null $P293, vivify_247
    new $P293, "Undef"
  vivify_247:
    $S294 = $P293."Str"()
    concat $P295, $P291, $S294
    concat $P296, $P295, "'"
    $P297 = $P290."panic"($P296)
    .return ($P297)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("98_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .const 'Sub' $P310 = "100_1297880734.85639" 
    capture_lex $P310
    .local string rx301_tgt
    .local int rx301_pos
    .local int rx301_off
    .local int rx301_eos
    .local int rx301_rep
    .local pmc rx301_cur
    .local pmc rx301_debug
    (rx301_cur, rx301_pos, rx301_tgt, $I10) = self."!cursor_start"()
    getattribute rx301_debug, rx301_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx301_cur
    .local pmc match
    .lex "$/", match
    length rx301_eos, rx301_tgt
    gt rx301_pos, rx301_eos, rx301_done
    set rx301_off, 0
    lt rx301_pos, 2, rx301_start
    sub rx301_off, rx301_pos, 1
    substr rx301_tgt, rx301_tgt, rx301_off
  rx301_start:
    eq $I10, 1, rx301_restart
    if_null rx301_debug, debug_251
    rx301_cur."!cursor_debug"("START", "charname")
  debug_251:
    $I10 = self.'from'()
    ne $I10, -1, rxscan305_done
    goto rxscan305_scan
  rxscan305_loop:
    ($P10) = rx301_cur."from"()
    inc $P10
    set rx301_pos, $P10
    ge rx301_pos, rx301_eos, rxscan305_done
  rxscan305_scan:
    set_addr $I10, rxscan305_loop
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  rxscan305_done:
  alt306_0:
.annotate 'line', 111
    set_addr $I10, alt306_1
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
.annotate 'line', 112
  # rx subrule "integer" subtype=capture negate=
    rx301_cur."!cursor_pos"(rx301_pos)
    $P10 = rx301_cur."integer"()
    unless $P10, rx301_fail
    rx301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx301_pos = $P10."pos"()
    goto alt306_end
  alt306_1:
.annotate 'line', 113
  # rx enumcharlist negate=0 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx301_fail
    inc rx301_pos
  # rx rxquantf307 ** 0..*
    set_addr $I10, rxquantf307_loop
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
    goto rxquantf307_done
  rxquantf307_loop:
  # rx enumcharlist negate=1 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, "],#", $S10
    ge $I11, 0, rx301_fail
    inc rx301_pos
    set_addr $I10, rxquantf307_loop
    rx301_cur."!mark_push"(rx301_rep, rx301_pos, $I10)
  rxquantf307_done:
  # rx enumcharlist negate=0 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)", $S10
    lt $I11, 0, rx301_fail
    inc rx301_pos
.annotate 'line', 114
  # rx subrule "before" subtype=zerowidth negate=
    rx301_cur."!cursor_pos"(rx301_pos)
    .const 'Sub' $P310 = "100_1297880734.85639" 
    capture_lex $P310
    $P10 = rx301_cur."before"($P310)
    unless $P10, rx301_fail
  alt306_end:
.annotate 'line', 111
  # rx pass
    rx301_cur."!cursor_pass"(rx301_pos, "charname")
    if_null rx301_debug, debug_256
    rx301_cur."!cursor_debug"("PASS", "charname", " at pos=", rx301_pos)
  debug_256:
    .return (rx301_cur)
  rx301_restart:
.annotate 'line', 33
    if_null rx301_debug, debug_257
    rx301_cur."!cursor_debug"("NEXT", "charname")
  debug_257:
  rx301_fail:
    (rx301_rep, rx301_pos, $I10, $P10) = rx301_cur."!mark_fail"(0)
    lt rx301_pos, -1, rx301_done
    eq rx301_pos, -1, rx301_fail
    jump $I10
  rx301_done:
    rx301_cur."!cursor_fail"()
    if_null rx301_debug, debug_258
    rx301_cur."!cursor_debug"("FAIL", "charname")
  debug_258:
    .return (rx301_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charname"  :subid("99_1297880734.85639") :method
.annotate 'line', 33
    $P303 = self."!PREFIX__!subrule"("integer", "")
    new $P304, "ResizablePMCArray"
    push $P304, "Z"
    push $P304, "Y"
    push $P304, "X"
    push $P304, "W"
    push $P304, "V"
    push $P304, "U"
    push $P304, "T"
    push $P304, "S"
    push $P304, "R"
    push $P304, "Q"
    push $P304, "P"
    push $P304, "O"
    push $P304, "N"
    push $P304, "M"
    push $P304, "L"
    push $P304, "K"
    push $P304, "J"
    push $P304, "I"
    push $P304, "H"
    push $P304, "G"
    push $P304, "F"
    push $P304, "E"
    push $P304, "D"
    push $P304, "C"
    push $P304, "B"
    push $P304, "A"
    push $P304, "z"
    push $P304, "y"
    push $P304, "x"
    push $P304, "w"
    push $P304, "v"
    push $P304, "u"
    push $P304, "t"
    push $P304, "s"
    push $P304, "r"
    push $P304, "q"
    push $P304, "p"
    push $P304, "o"
    push $P304, "n"
    push $P304, "m"
    push $P304, "l"
    push $P304, "k"
    push $P304, "j"
    push $P304, "i"
    push $P304, "h"
    push $P304, "g"
    push $P304, "f"
    push $P304, "e"
    push $P304, "d"
    push $P304, "c"
    push $P304, "b"
    push $P304, "a"
    push $P304, $P303
    .return ($P304)
.end


.namespace ["HLL";"Grammar"]
.sub "_block309"  :anon :subid("100_1297880734.85639") :method :outer("98_1297880734.85639")
.annotate 'line', 114
    .local string rx311_tgt
    .local int rx311_pos
    .local int rx311_off
    .local int rx311_eos
    .local int rx311_rep
    .local pmc rx311_cur
    .local pmc rx311_debug
    (rx311_cur, rx311_pos, rx311_tgt, $I10) = self."!cursor_start"()
    getattribute rx311_debug, rx311_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx311_cur
    .local pmc match
    .lex "$/", match
    length rx311_eos, rx311_tgt
    gt rx311_pos, rx311_eos, rx311_done
    set rx311_off, 0
    lt rx311_pos, 2, rx311_start
    sub rx311_off, rx311_pos, 1
    substr rx311_tgt, rx311_tgt, rx311_off
  rx311_start:
    eq $I10, 1, rx311_restart
    if_null rx311_debug, debug_252
    rx311_cur."!cursor_debug"("START", "")
  debug_252:
    $I10 = self.'from'()
    ne $I10, -1, rxscan312_done
    goto rxscan312_scan
  rxscan312_loop:
    ($P10) = rx311_cur."from"()
    inc $P10
    set rx311_pos, $P10
    ge rx311_pos, rx311_eos, rxscan312_done
  rxscan312_scan:
    set_addr $I10, rxscan312_loop
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  rxscan312_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx311_pos, rx311_off
    find_not_cclass $I11, 32, rx311_tgt, $I10, rx311_eos
    add rx311_pos, rx311_off, $I11
  # rx enumcharlist negate=0 
    ge rx311_pos, rx311_eos, rx311_fail
    sub $I10, rx311_pos, rx311_off
    substr $S10, rx311_tgt, $I10, 1
    index $I11, "],#", $S10
    lt $I11, 0, rx311_fail
    inc rx311_pos
  # rx pass
    rx311_cur."!cursor_pass"(rx311_pos, "")
    if_null rx311_debug, debug_253
    rx311_cur."!cursor_debug"("PASS", "", " at pos=", rx311_pos)
  debug_253:
    .return (rx311_cur)
  rx311_restart:
    if_null rx311_debug, debug_254
    rx311_cur."!cursor_debug"("NEXT", "")
  debug_254:
  rx311_fail:
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    if_null rx311_debug, debug_255
    rx311_cur."!cursor_debug"("FAIL", "")
  debug_255:
    .return (rx311_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "charnames"  :subid("101_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .local string rx314_tgt
    .local int rx314_pos
    .local int rx314_off
    .local int rx314_eos
    .local int rx314_rep
    .local pmc rx314_cur
    .local pmc rx314_debug
    (rx314_cur, rx314_pos, rx314_tgt, $I10) = self."!cursor_start"()
    rx314_cur."!cursor_caparray"("charname")
    getattribute rx314_debug, rx314_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx314_cur
    .local pmc match
    .lex "$/", match
    length rx314_eos, rx314_tgt
    gt rx314_pos, rx314_eos, rx314_done
    set rx314_off, 0
    lt rx314_pos, 2, rx314_start
    sub rx314_off, rx314_pos, 1
    substr rx314_tgt, rx314_tgt, rx314_off
  rx314_start:
    eq $I10, 1, rx314_restart
    if_null rx314_debug, debug_259
    rx314_cur."!cursor_debug"("START", "charnames")
  debug_259:
    $I10 = self.'from'()
    ne $I10, -1, rxscan317_done
    goto rxscan317_scan
  rxscan317_loop:
    ($P10) = rx314_cur."from"()
    inc $P10
    set rx314_pos, $P10
    ge rx314_pos, rx314_eos, rxscan317_done
  rxscan317_scan:
    set_addr $I10, rxscan317_loop
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  rxscan317_done:
.annotate 'line', 116
  # rx rxquantr318 ** 1..*
    set_addr $I10, rxquantr318_done
    rx314_cur."!mark_push"(0, -1, $I10)
  rxquantr318_loop:
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  # rx subrule "charname" subtype=capture negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."charname"()
    unless $P10, rx314_fail
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charname")
    rx314_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
    set_addr $I10, rxquantr318_done
    (rx314_rep) = rx314_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr318_done
    rx314_cur."!mark_push"(rx314_rep, rx314_pos, $I10)
  # rx literal  ","
    add $I11, rx314_pos, 1
    gt $I11, rx314_eos, rx314_fail
    sub $I11, rx314_pos, rx314_off
    ord $I11, rx314_tgt, $I11
    ne $I11, 44, rx314_fail
    add rx314_pos, 1
    goto rxquantr318_loop
  rxquantr318_done:
  # rx pass
    rx314_cur."!cursor_pass"(rx314_pos, "charnames")
    if_null rx314_debug, debug_260
    rx314_cur."!cursor_debug"("PASS", "charnames", " at pos=", rx314_pos)
  debug_260:
    .return (rx314_cur)
  rx314_restart:
.annotate 'line', 33
    if_null rx314_debug, debug_261
    rx314_cur."!cursor_debug"("NEXT", "charnames")
  debug_261:
  rx314_fail:
    (rx314_rep, rx314_pos, $I10, $P10) = rx314_cur."!mark_fail"(0)
    lt rx314_pos, -1, rx314_done
    eq rx314_pos, -1, rx314_fail
    jump $I10
  rx314_done:
    rx314_cur."!cursor_fail"()
    if_null rx314_debug, debug_262
    rx314_cur."!cursor_debug"("FAIL", "charnames")
  debug_262:
    .return (rx314_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charnames"  :subid("102_1297880734.85639") :method
.annotate 'line', 33
    new $P316, "ResizablePMCArray"
    push $P316, ""
    .return ($P316)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("103_1297880734.85639") :method :outer("11_1297880734.85639")
.annotate 'line', 33
    .const 'Sub' $P330 = "105_1297880734.85639" 
    capture_lex $P330
    .local string rx320_tgt
    .local int rx320_pos
    .local int rx320_off
    .local int rx320_eos
    .local int rx320_rep
    .local pmc rx320_cur
    .local pmc rx320_debug
    (rx320_cur, rx320_pos, rx320_tgt, $I10) = self."!cursor_start"()
    getattribute rx320_debug, rx320_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx320_cur
    .local pmc match
    .lex "$/", match
    length rx320_eos, rx320_tgt
    gt rx320_pos, rx320_eos, rx320_done
    set rx320_off, 0
    lt rx320_pos, 2, rx320_start
    sub rx320_off, rx320_pos, 1
    substr rx320_tgt, rx320_tgt, rx320_off
  rx320_start:
    eq $I10, 1, rx320_restart
    if_null rx320_debug, debug_263
    rx320_cur."!cursor_debug"("START", "charspec")
  debug_263:
    $I10 = self.'from'()
    ne $I10, -1, rxscan324_done
    goto rxscan324_scan
  rxscan324_loop:
    ($P10) = rx320_cur."from"()
    inc $P10
    set rx320_pos, $P10
    ge rx320_pos, rx320_eos, rxscan324_done
  rxscan324_scan:
    set_addr $I10, rxscan324_loop
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  rxscan324_done:
  alt325_0:
.annotate 'line', 118
    set_addr $I10, alt325_1
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
.annotate 'line', 119
  # rx literal  "["
    add $I11, rx320_pos, 1
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    ord $I11, rx320_tgt, $I11
    ne $I11, 91, rx320_fail
    add rx320_pos, 1
  # rx subrule "charnames" subtype=capture negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."charnames"()
    unless $P10, rx320_fail
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charnames")
    rx320_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx320_pos, 1
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    ord $I11, rx320_tgt, $I11
    ne $I11, 93, rx320_fail
    add rx320_pos, 1
    goto alt325_end
  alt325_1:
    set_addr $I10, alt325_2
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
.annotate 'line', 120
  # rx charclass_q d r 1..-1
    sub $I10, rx320_pos, rx320_off
    find_not_cclass $I11, 8, rx320_tgt, $I10, rx320_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx320_fail
    add rx320_pos, rx320_off, $I11
  # rx rxquantr326 ** 0..*
    set_addr $I10, rxquantr326_done
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  rxquantr326_loop:
  # rx literal  "_"
    add $I11, rx320_pos, 1
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    ord $I11, rx320_tgt, $I11
    ne $I11, 95, rx320_fail
    add rx320_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx320_pos, rx320_off
    find_not_cclass $I11, 8, rx320_tgt, $I10, rx320_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx320_fail
    add rx320_pos, rx320_off, $I11
    set_addr $I10, rxquantr326_done
    (rx320_rep) = rx320_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr326_done
    rx320_cur."!mark_push"(rx320_rep, rx320_pos, $I10)
    goto rxquantr326_loop
  rxquantr326_done:
    goto alt325_end
  alt325_2:
    set_addr $I10, alt325_3
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
.annotate 'line', 121
  # rx enumcharlist negate=0 
    ge rx320_pos, rx320_eos, rx320_fail
    sub $I10, rx320_pos, rx320_off
    substr $S10, rx320_tgt, $I10, 1
    index $I11, "?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx320_fail
    inc rx320_pos
    goto alt325_end
  alt325_3:
.annotate 'line', 122
    rx320_cur."!cursor_pos"(rx320_pos)
    find_lex $P327, unicode:"$\x{a2}"
    $P328 = $P327."MATCH"()
    store_lex "$/", $P328
    .const 'Sub' $P330 = "105_1297880734.85639" 
    capture_lex $P330
    $P334 = $P330()
  alt325_end:
.annotate 'line', 117
  # rx pass
    rx320_cur."!cursor_pass"(rx320_pos, "charspec")
    if_null rx320_debug, debug_264
    rx320_cur."!cursor_debug"("PASS", "charspec", " at pos=", rx320_pos)
  debug_264:
    .return (rx320_cur)
  rx320_restart:
.annotate 'line', 33
    if_null rx320_debug, debug_265
    rx320_cur."!cursor_debug"("NEXT", "charspec")
  debug_265:
  rx320_fail:
    (rx320_rep, rx320_pos, $I10, $P10) = rx320_cur."!mark_fail"(0)
    lt rx320_pos, -1, rx320_done
    eq rx320_pos, -1, rx320_fail
    jump $I10
  rx320_done:
    rx320_cur."!cursor_fail"()
    if_null rx320_debug, debug_266
    rx320_cur."!cursor_debug"("FAIL", "charspec")
  debug_266:
    .return (rx320_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charspec"  :subid("104_1297880734.85639") :method
.annotate 'line', 33
    $P322 = self."!PREFIX__!subrule"("charnames", "[")
    new $P323, "ResizablePMCArray"
    push $P323, ""
    push $P323, "Z"
    push $P323, "Y"
    push $P323, "X"
    push $P323, "W"
    push $P323, "V"
    push $P323, "U"
    push $P323, "T"
    push $P323, "S"
    push $P323, "R"
    push $P323, "Q"
    push $P323, "P"
    push $P323, "O"
    push $P323, "N"
    push $P323, "M"
    push $P323, "L"
    push $P323, "K"
    push $P323, "J"
    push $P323, "I"
    push $P323, "H"
    push $P323, "G"
    push $P323, "F"
    push $P323, "E"
    push $P323, "D"
    push $P323, "C"
    push $P323, "B"
    push $P323, "A"
    push $P323, "@"
    push $P323, "?"
    push $P323, ""
    push $P323, $P322
    .return ($P323)
.end


.namespace ["HLL";"Grammar"]
.sub "_block329"  :anon :subid("105_1297880734.85639") :outer("103_1297880734.85639")
.annotate 'line', 122
    find_lex $P331, "$/"
    $P332 = $P331."CURSOR"()
    $P333 = $P332."panic"("Unrecognized \\c character")
    .return ($P333)
.end


.namespace ["HLL";"Grammar"]
.sub "_block335" :load :anon :subid("106_1297880734.85639")
.annotate 'line', 5
    .const 'Sub' $P337 = "11_1297880734.85639" 
    $P338 = $P337()
    .return ($P338)
.end


.namespace []
.sub "_block340" :load :anon :subid("107_1297880734.85639")
.annotate 'line', 1
    .const 'Sub' $P342 = "10_1297880734.85639" 
    $P343 = $P342()
    .return ($P343)
.end

### .include 'gen/hllgrammar-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1297880737.84663")
.annotate 'line', 0
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    get_hll_global $P14, ["HLL";"Actions"], "_block13" 
    capture_lex $P14
    $P627 = $P14()
.annotate 'line', 1
    .return ($P627)
    .const 'Sub' $P629 = "55_1297880737.84663" 
    .return ($P629)
.end


.namespace []
.sub "" :load :init :subid("post56") :outer("10_1297880737.84663")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880737.84663" 
    .local pmc block
    set block, $P12
    $P632 = get_root_global ["parrot"], "P6metaclass"
    $P632."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block13"  :subid("11_1297880737.84663") :outer("10_1297880737.84663")
.annotate 'line', 3
    .const 'Sub' $P605 = "53_1297880737.84663" 
    capture_lex $P605
    .const 'Sub' $P580 = "51_1297880737.84663" 
    capture_lex $P580
    .const 'Sub' $P550 = "50_1297880737.84663" 
    capture_lex $P550
    .const 'Sub' $P531 = "49_1297880737.84663" 
    capture_lex $P531
    .const 'Sub' $P524 = "48_1297880737.84663" 
    capture_lex $P524
    .const 'Sub' $P514 = "47_1297880737.84663" 
    capture_lex $P514
    .const 'Sub' $P497 = "46_1297880737.84663" 
    capture_lex $P497
    .const 'Sub' $P480 = "45_1297880737.84663" 
    capture_lex $P480
    .const 'Sub' $P473 = "44_1297880737.84663" 
    capture_lex $P473
    .const 'Sub' $P466 = "43_1297880737.84663" 
    capture_lex $P466
    .const 'Sub' $P459 = "42_1297880737.84663" 
    capture_lex $P459
    .const 'Sub' $P452 = "41_1297880737.84663" 
    capture_lex $P452
    .const 'Sub' $P445 = "40_1297880737.84663" 
    capture_lex $P445
    .const 'Sub' $P438 = "39_1297880737.84663" 
    capture_lex $P438
    .const 'Sub' $P428 = "38_1297880737.84663" 
    capture_lex $P428
    .const 'Sub' $P421 = "37_1297880737.84663" 
    capture_lex $P421
    .const 'Sub' $P405 = "36_1297880737.84663" 
    capture_lex $P405
    .const 'Sub' $P330 = "34_1297880737.84663" 
    capture_lex $P330
    .const 'Sub' $P267 = "31_1297880737.84663" 
    capture_lex $P267
    .const 'Sub' $P258 = "30_1297880737.84663" 
    capture_lex $P258
    .const 'Sub' $P249 = "29_1297880737.84663" 
    capture_lex $P249
    .const 'Sub' $P240 = "28_1297880737.84663" 
    capture_lex $P240
    .const 'Sub' $P231 = "27_1297880737.84663" 
    capture_lex $P231
    .const 'Sub' $P222 = "26_1297880737.84663" 
    capture_lex $P222
    .const 'Sub' $P212 = "25_1297880737.84663" 
    capture_lex $P212
    .const 'Sub' $P202 = "24_1297880737.84663" 
    capture_lex $P202
    .const 'Sub' $P194 = "23_1297880737.84663" 
    capture_lex $P194
    .const 'Sub' $P184 = "22_1297880737.84663" 
    capture_lex $P184
    .const 'Sub' $P174 = "21_1297880737.84663" 
    capture_lex $P174
    .const 'Sub' $P73 = "18_1297880737.84663" 
    capture_lex $P73
    .const 'Sub' $P35 = "15_1297880737.84663" 
    capture_lex $P35
    .const 'Sub' $P28 = "14_1297880737.84663" 
    capture_lex $P28
    .const 'Sub' $P22 = "13_1297880737.84663" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1297880737.84663" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 225
    .const 'Sub' $P605 = "53_1297880737.84663" 
    newclosure $P622, $P605
.annotate 'line', 3
    .return ($P622)
    .const 'Sub' $P624 = "54_1297880737.84663" 
    .return ($P624)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "string_to_int"  :subid("12_1297880737.84663") :outer("11_1297880737.84663")
    .param pmc param_18
    .param pmc param_19
.annotate 'line', 3
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "$src", param_18
    .lex "$base", param_19
.annotate 'line', 4

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
    
.annotate 'line', 3
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "ints_to_string"  :subid("13_1297880737.84663") :outer("11_1297880737.84663")
    .param pmc param_25
.annotate 'line', 37
    new $P24, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P24, control_23
    push_eh $P24
    .lex "$ints", param_25
.annotate 'line', 38

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
        result = concat result, $S0
        goto ints_loop
      ints_1:
        $I0 = ints.'ast'()
        result = chr $I0
      ints_done:
        $P26 = box result
    
.annotate 'line', 37
    .return ($P26)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "CTXSAVE"  :subid("14_1297880737.84663") :method :outer("11_1297880737.84663")
.annotate 'line', 62
    new $P30, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P30, control_29
    push_eh $P30
    .lex "self", self
.annotate 'line', 63
    get_hll_global $P31, ["PAST"], "Op"
.annotate 'line', 69
    new $P32, "ResizablePMCArray"
    push $P32, "    $P0 = find_dynamic_lex \"$*CTXSAVE\""
    push $P32, "    if null $P0 goto ctxsave_done"
    push $P32, "    $I0 = can $P0, \"ctxsave\""
    push $P32, "    unless $I0 goto ctxsave_done"
    push $P32, "    $P0.\"ctxsave\"()"
    push $P32, "  ctxsave_done:"
    $P33 = $P31."new"($P32 :named("inline"))
.annotate 'line', 62
    .return ($P33)
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "SET_BLOCK_OUTER_CTX"  :subid("15_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_38
.annotate 'line', 76
    .const 'Sub' $P48 = "16_1297880737.84663" 
    capture_lex $P48
    new $P37, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P37, control_36
    push_eh $P37
    .lex "self", self
    .lex "$block", param_38
.annotate 'line', 77
    new $P39, "Undef"
    .lex "$outer_ctx", $P39
    find_dynamic_lex $P40, "%*COMPILING"
    unless_null $P40, vivify_57
    get_hll_global $P40, "%COMPILING"
    unless_null $P40, vivify_58
    die "Contextual %*COMPILING not found"
  vivify_58:
  vivify_57:
    set $P41, $P40["%?OPTIONS"]
    unless_null $P41, vivify_59
    $P41 = root_new ['parrot';'Hash']
  vivify_59:
    set $P42, $P41["outer_ctx"]
    unless_null $P42, vivify_60
    new $P42, "Undef"
  vivify_60:
    store_lex "$outer_ctx", $P42
.annotate 'line', 78
    find_lex $P45, "$outer_ctx"
    defined $I46, $P45
    if $I46, if_44
    new $P43, 'Integer'
    set $P43, $I46
    goto if_44_end
  if_44:
    .const 'Sub' $P48 = "16_1297880737.84663" 
    capture_lex $P48
    $P71 = $P48()
    set $P43, $P71
  if_44_end:
.annotate 'line', 76
    .return ($P43)
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "_block47"  :anon :subid("16_1297880737.84663") :outer("15_1297880737.84663")
.annotate 'line', 78
    .const 'Sub' $P62 = "17_1297880737.84663" 
    capture_lex $P62
.annotate 'line', 79
    $P49 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P49
    find_lex $P50, "$outer_ctx"
    getattribute $P51, $P50, "current_namespace"
    $P52 = $P51."get_name"()
    store_lex "@ns", $P52
.annotate 'line', 80
    find_lex $P53, "@ns"
    $P53."shift"()
.annotate 'line', 81
    find_lex $P54, "$block"
    find_lex $P55, "@ns"
    $P54."namespace"($P55)
.annotate 'line', 82
    find_lex $P57, "$outer_ctx"
    $P58 = $P57."lexpad_full"()
    defined $I59, $P58
    unless $I59, for_undef_61
    iter $P56, $P58
    new $P69, 'ExceptionHandler'
    set_addr $P69, loop68_handler
    $P69."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P69
  loop68_test:
    unless $P56, loop68_done
    shift $P60, $P56
  loop68_redo:
    .const 'Sub' $P62 = "17_1297880737.84663" 
    capture_lex $P62
    $P62($P60)
  loop68_next:
    goto loop68_test
  loop68_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, 'type'
    eq $P70, .CONTROL_LOOP_NEXT, loop68_next
    eq $P70, .CONTROL_LOOP_REDO, loop68_redo
  loop68_done:
    pop_eh 
  for_undef_61:
.annotate 'line', 78
    .return ($P56)
.end


.namespace ["HLL";"Actions"]
.sub "_block61"  :anon :subid("17_1297880737.84663") :outer("16_1297880737.84663")
    .param pmc param_63
.annotate 'line', 82
    .lex "$_", param_63
.annotate 'line', 83
    find_lex $P64, "$block"
    find_lex $P65, "$_"
    $P66 = $P65."key"()
    $P67 = $P64."symbol"($P66, "lexical" :named("scope"))
.annotate 'line', 82
    .return ($P67)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "EXPR"  :subid("18_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_76
    .param pmc param_77 :optional
    .param int has_param_77 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P156 = "20_1297880737.84663" 
    capture_lex $P156
    .const 'Sub' $P123 = "19_1297880737.84663" 
    capture_lex $P123
    new $P75, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P75, control_74
    push_eh $P75
    .lex "self", self
    .lex "$/", param_76
    if has_param_77, optparam_62
    new $P78, "Undef"
    set param_77, $P78
  optparam_62:
    .lex "$key", param_77
.annotate 'line', 91
    new $P79, "Undef"
    .lex "$past", $P79
.annotate 'line', 90
    find_lex $P81, "$key"
    if $P81, unless_80_end
    new $P82, "Exception"
    set $P82['type'], .CONTROL_RETURN
    new $P83, "Integer"
    assign $P83, 0
    setattribute $P82, 'payload', $P83
    throw $P82
  unless_80_end:
.annotate 'line', 91
    find_lex $P85, "$/"
    $P86 = $P85."ast"()
    set $P84, $P86
    defined $I88, $P84
    if $I88, default_87
    find_lex $P89, "$/"
    unless_null $P89, vivify_63
    $P89 = root_new ['parrot';'Hash']
  vivify_63:
    set $P90, $P89["OPER"]
    unless_null $P90, vivify_64
    new $P90, "Undef"
  vivify_64:
    $P91 = $P90."ast"()
    set $P84, $P91
  default_87:
    store_lex "$past", $P84
.annotate 'line', 92
    find_lex $P93, "$past"
    if $P93, unless_92_end
.annotate 'line', 93
    get_hll_global $P94, ["PAST"], "Op"
    find_lex $P95, "$/"
    $P96 = $P94."new"($P95 :named("node"))
    store_lex "$past", $P96
.annotate 'line', 94
    find_lex $P98, "$/"
    unless_null $P98, vivify_65
    $P98 = root_new ['parrot';'Hash']
  vivify_65:
    set $P99, $P98["OPER"]
    unless_null $P99, vivify_66
    $P99 = root_new ['parrot';'Hash']
  vivify_66:
    set $P100, $P99["O"]
    unless_null $P100, vivify_67
    $P100 = root_new ['parrot';'Hash']
  vivify_67:
    set $P101, $P100["pasttype"]
    unless_null $P101, vivify_68
    new $P101, "Undef"
  vivify_68:
    if $P101, if_97
.annotate 'line', 95
    find_lex $P109, "$/"
    unless_null $P109, vivify_69
    $P109 = root_new ['parrot';'Hash']
  vivify_69:
    set $P110, $P109["OPER"]
    unless_null $P110, vivify_70
    $P110 = root_new ['parrot';'Hash']
  vivify_70:
    set $P111, $P110["O"]
    unless_null $P111, vivify_71
    $P111 = root_new ['parrot';'Hash']
  vivify_71:
    set $P112, $P111["pirop"]
    unless_null $P112, vivify_72
    new $P112, "Undef"
  vivify_72:
    unless $P112, if_108_end
    find_lex $P113, "$past"
    find_lex $P114, "$/"
    unless_null $P114, vivify_73
    $P114 = root_new ['parrot';'Hash']
  vivify_73:
    set $P115, $P114["OPER"]
    unless_null $P115, vivify_74
    $P115 = root_new ['parrot';'Hash']
  vivify_74:
    set $P116, $P115["O"]
    unless_null $P116, vivify_75
    $P116 = root_new ['parrot';'Hash']
  vivify_75:
    set $P117, $P116["pirop"]
    unless_null $P117, vivify_76
    new $P117, "Undef"
  vivify_76:
    set $S118, $P117
    $P113."pirop"($S118)
  if_108_end:
    goto if_97_end
  if_97:
.annotate 'line', 94
    find_lex $P102, "$past"
    find_lex $P103, "$/"
    unless_null $P103, vivify_77
    $P103 = root_new ['parrot';'Hash']
  vivify_77:
    set $P104, $P103["OPER"]
    unless_null $P104, vivify_78
    $P104 = root_new ['parrot';'Hash']
  vivify_78:
    set $P105, $P104["O"]
    unless_null $P105, vivify_79
    $P105 = root_new ['parrot';'Hash']
  vivify_79:
    set $P106, $P105["pasttype"]
    unless_null $P106, vivify_80
    new $P106, "Undef"
  vivify_80:
    set $S107, $P106
    $P102."pasttype"($S107)
  if_97_end:
.annotate 'line', 96
    find_lex $P120, "$past"
    $P121 = $P120."name"()
    if $P121, unless_119_end
    .const 'Sub' $P123 = "19_1297880737.84663" 
    capture_lex $P123
    $P123()
  unless_119_end:
  unless_92_end:
.annotate 'line', 107
    find_lex $P143, "$key"
    set $S144, $P143
    iseq $I145, $S144, "POSTFIX"
    if $I145, if_142
.annotate 'line', 109
    find_lex $P151, "$/"
    $P152 = $P151."list"()
    defined $I153, $P152
    unless $I153, for_undef_84
    iter $P150, $P152
    new $P168, 'ExceptionHandler'
    set_addr $P168, loop167_handler
    $P168."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P168
  loop167_test:
    unless $P150, loop167_done
    shift $P154, $P150
  loop167_redo:
    .const 'Sub' $P156 = "20_1297880737.84663" 
    capture_lex $P156
    $P156($P154)
  loop167_next:
    goto loop167_test
  loop167_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P169, exception, 'type'
    eq $P169, .CONTROL_LOOP_NEXT, loop167_next
    eq $P169, .CONTROL_LOOP_REDO, loop167_redo
  loop167_done:
    pop_eh 
  for_undef_84:
.annotate 'line', 108
    goto if_142_end
  if_142:
.annotate 'line', 107
    find_lex $P146, "$past"
    find_lex $P147, "$/"
    unless_null $P147, vivify_85
    $P147 = root_new ['parrot';'ResizablePMCArray']
  vivify_85:
    set $P148, $P147[0]
    unless_null $P148, vivify_86
    new $P148, "Undef"
  vivify_86:
    $P149 = $P148."ast"()
    $P146."unshift"($P149)
  if_142_end:
.annotate 'line', 111
    find_lex $P170, "$/"
    find_lex $P171, "$past"
    $P172 = $P170."!make"($P171)
.annotate 'line', 89
    .return ($P172)
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace ["HLL";"Actions"]
.sub "_block122"  :anon :subid("19_1297880737.84663") :outer("18_1297880737.84663")
.annotate 'line', 98
    new $P124, "Undef"
    .lex "$name", $P124
.annotate 'line', 97
    find_lex $P126, "$key"
    set $S127, $P126
    iseq $I128, $S127, "LIST"
    unless $I128, if_125_end
    new $P129, "String"
    assign $P129, "infix"
    store_lex "$key", $P129
  if_125_end:
.annotate 'line', 98

                $P0 = find_lex '$key'
                $S0 = $P0
                $S0 = downcase $S0
                $P130 = box $S0
            
    concat $P131, $P130, ":<"
.annotate 'line', 103
    find_lex $P132, "$/"
    unless_null $P132, vivify_81
    $P132 = root_new ['parrot';'Hash']
  vivify_81:
    set $P133, $P132["OPER"]
    unless_null $P133, vivify_82
    $P133 = root_new ['parrot';'Hash']
  vivify_82:
    set $P134, $P133["sym"]
    unless_null $P134, vivify_83
    new $P134, "Undef"
  vivify_83:
    concat $P135, $P131, $P134
    concat $P136, $P135, ">"
    store_lex "$name", $P136
.annotate 'line', 104
    find_lex $P137, "$past"
    new $P138, "String"
    assign $P138, "&"
    find_lex $P139, "$name"
    concat $P140, $P138, $P139
    $P141 = $P137."name"($P140)
.annotate 'line', 96
    .return ($P141)
.end


.namespace ["HLL";"Actions"]
.sub "_block155"  :anon :subid("20_1297880737.84663") :outer("18_1297880737.84663")
    .param pmc param_157
.annotate 'line', 109
    .lex "$_", param_157
    find_lex $P160, "$_"
    $P161 = $P160."ast"()
    defined $I162, $P161
    if $I162, if_159
    new $P158, 'Integer'
    set $P158, $I162
    goto if_159_end
  if_159:
    find_lex $P163, "$past"
    find_lex $P164, "$_"
    $P165 = $P164."ast"()
    $P166 = $P163."push"($P165)
    set $P158, $P166
  if_159_end:
    .return ($P158)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "term:sym<circumfix>"  :subid("21_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_177
.annotate 'line', 114
    new $P176, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P176, control_175
    push_eh $P176
    .lex "self", self
    .lex "$/", param_177
    find_lex $P178, "$/"
    find_lex $P179, "$/"
    unless_null $P179, vivify_87
    $P179 = root_new ['parrot';'Hash']
  vivify_87:
    set $P180, $P179["circumfix"]
    unless_null $P180, vivify_88
    new $P180, "Undef"
  vivify_88:
    $P181 = $P180."ast"()
    $P182 = $P178."!make"($P181)
    .return ($P182)
  control_175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P183, exception, "payload"
    .return ($P183)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("22_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_187
.annotate 'line', 116
    new $P186, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P186, control_185
    push_eh $P186
    .lex "self", self
    .lex "$/", param_187
    find_lex $P188, "$/"
    find_lex $P189, "$/"
    unless_null $P189, vivify_89
    $P189 = root_new ['parrot';'Hash']
  vivify_89:
    set $P190, $P189["term"]
    unless_null $P190, vivify_90
    new $P190, "Undef"
  vivify_90:
    $P191 = $P190."ast"()
    $P192 = $P188."!make"($P191)
    .return ($P192)
  control_185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "nullterm"  :subid("23_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_197
.annotate 'line', 117
    new $P196, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P196, control_195
    push_eh $P196
    .lex "self", self
    .lex "$/", param_197
    find_lex $P198, "$/"
 $P199 = new ['Undef'] 
    $P200 = $P198."!make"($P199)
    .return ($P200)
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "nullterm_alt"  :subid("24_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_205
.annotate 'line', 118
    new $P204, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P204, control_203
    push_eh $P204
    .lex "self", self
    .lex "$/", param_205
    find_lex $P206, "$/"
    find_lex $P207, "$/"
    unless_null $P207, vivify_91
    $P207 = root_new ['parrot';'Hash']
  vivify_91:
    set $P208, $P207["term"]
    unless_null $P208, vivify_92
    new $P208, "Undef"
  vivify_92:
    $P209 = $P208."ast"()
    $P210 = $P206."!make"($P209)
    .return ($P210)
  control_203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "integer"  :subid("25_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_215
.annotate 'line', 120
    new $P214, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P214, control_213
    push_eh $P214
    .lex "self", self
    .lex "$/", param_215
    find_lex $P216, "$/"
    find_lex $P217, "$/"
    unless_null $P217, vivify_93
    $P217 = root_new ['parrot';'Hash']
  vivify_93:
    set $P218, $P217["VALUE"]
    unless_null $P218, vivify_94
    new $P218, "Undef"
  vivify_94:
    $P219 = $P218."ast"()
    $P220 = $P216."!make"($P219)
    .return ($P220)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P221, exception, "payload"
    .return ($P221)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "dec_number"  :subid("26_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_225
.annotate 'line', 122
    new $P224, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P224, control_223
    push_eh $P224
    .lex "self", self
    .lex "$/", param_225
    find_lex $P226, "$/"
    find_lex $P227, "$/"
    set $N228, $P227
    $P229 = $P226."!make"($N228)
    .return ($P229)
  control_223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, "payload"
    .return ($P230)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "decint"  :subid("27_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_234
.annotate 'line', 124
    new $P233, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P233, control_232
    push_eh $P233
    .lex "self", self
    .lex "$/", param_234
    find_lex $P235, "$/"
    find_lex $P236, "$/"
    $P237 = "string_to_int"($P236, 10)
    $P238 = $P235."!make"($P237)
    .return ($P238)
  control_232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P239, exception, "payload"
    .return ($P239)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "hexint"  :subid("28_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_243
.annotate 'line', 125
    new $P242, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P242, control_241
    push_eh $P242
    .lex "self", self
    .lex "$/", param_243
    find_lex $P244, "$/"
    find_lex $P245, "$/"
    $P246 = "string_to_int"($P245, 16)
    $P247 = $P244."!make"($P246)
    .return ($P247)
  control_241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, "payload"
    .return ($P248)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "octint"  :subid("29_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_252
.annotate 'line', 126
    new $P251, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P251, control_250
    push_eh $P251
    .lex "self", self
    .lex "$/", param_252
    find_lex $P253, "$/"
    find_lex $P254, "$/"
    $P255 = "string_to_int"($P254, 8)
    $P256 = $P253."!make"($P255)
    .return ($P256)
  control_250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "binint"  :subid("30_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_261
.annotate 'line', 127
    new $P260, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P260, control_259
    push_eh $P260
    .lex "self", self
    .lex "$/", param_261
    find_lex $P262, "$/"
    find_lex $P263, "$/"
    $P264 = "string_to_int"($P263, 2)
    $P265 = $P262."!make"($P264)
    .return ($P265)
  control_259:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_EXPR"  :subid("31_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_270
.annotate 'line', 129
    .const 'Sub' $P286 = "32_1297880737.84663" 
    capture_lex $P286
    new $P269, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P269, control_268
    push_eh $P269
    .lex "self", self
    .lex "$/", param_270
.annotate 'line', 130
    new $P271, "Undef"
    .lex "$past", $P271
    find_lex $P272, "$/"
    unless_null $P272, vivify_95
    $P272 = root_new ['parrot';'Hash']
  vivify_95:
    set $P273, $P272["quote_delimited"]
    unless_null $P273, vivify_96
    new $P273, "Undef"
  vivify_96:
    $P274 = $P273."ast"()
    store_lex "$past", $P274
.annotate 'line', 131
    find_lex $P276, "$/"
    $P277 = $P276."CURSOR"()
    $P278 = $P277."quotemod_check"("w")
    unless $P278, if_275_end
.annotate 'line', 132
    get_hll_global $P280, ["PAST"], "Node"
    find_lex $P281, "$past"
    $P282 = $P280."ACCEPTS"($P281)
    if $P282, if_279
.annotate 'line', 135
    .const 'Sub' $P286 = "32_1297880737.84663" 
    capture_lex $P286
    $P286()
    goto if_279_end
  if_279:
.annotate 'line', 133
    find_lex $P283, "$/"
    $P284 = $P283."CURSOR"()
    $P284."panic"("Can't form :w list from non-constant strings (yet)")
  if_279_end:
  if_275_end:
.annotate 'line', 146
    get_hll_global $P318, ["PAST"], "Node"
    find_lex $P319, "$past"
    $P320 = $P318."ACCEPTS"($P319)
    isfalse $I321, $P320
    unless $I321, if_317_end
.annotate 'line', 147
    get_hll_global $P322, ["PAST"], "Val"
    find_lex $P323, "$past"
    set $S324, $P323
    $P325 = $P322."new"($S324 :named("value"))
    store_lex "$past", $P325
  if_317_end:
.annotate 'line', 149
    find_lex $P326, "$/"
    find_lex $P327, "$past"
    $P328 = $P326."!make"($P327)
.annotate 'line', 129
    .return ($P328)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P329, exception, "payload"
    .return ($P329)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "_block285"  :anon :subid("32_1297880737.84663") :outer("31_1297880737.84663")
.annotate 'line', 135
    .const 'Sub' $P305 = "33_1297880737.84663" 
    capture_lex $P305
.annotate 'line', 136
    $P287 = root_new ['parrot';'ResizablePMCArray']
    .lex "@words", $P287
    get_hll_global $P288, ["HLL";"Grammar"], "split_words"
    find_lex $P289, "$/"
    find_lex $P290, "$past"
    $P291 = $P288($P289, $P290)
    store_lex "@words", $P291
.annotate 'line', 137
    find_lex $P294, "@words"
    set $N295, $P294
    isne $I296, $N295, 1.0
    if $I296, if_293
.annotate 'line', 142
    find_lex $P313, "@words"
    unless_null $P313, vivify_97
    $P313 = root_new ['parrot';'ResizablePMCArray']
  vivify_97:
    set $P314, $P313[0]
    unless_null $P314, vivify_98
    new $P314, "Undef"
  vivify_98:
    set $S315, $P314
    new $P316, 'String'
    set $P316, $S315
    store_lex "$past", $P316
.annotate 'line', 141
    set $P292, $P316
.annotate 'line', 137
    goto if_293_end
  if_293:
.annotate 'line', 138
    get_hll_global $P297, ["PAST"], "Op"
    find_lex $P298, "$/"
    $P299 = $P297."new"("list" :named("pasttype"), $P298 :named("node"))
    store_lex "$past", $P299
.annotate 'line', 139
    find_lex $P301, "@words"
    defined $I302, $P301
    unless $I302, for_undef_99
    iter $P300, $P301
    new $P311, 'ExceptionHandler'
    set_addr $P311, loop310_handler
    $P311."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P311
  loop310_test:
    unless $P300, loop310_done
    shift $P303, $P300
  loop310_redo:
    .const 'Sub' $P305 = "33_1297880737.84663" 
    capture_lex $P305
    $P305($P303)
  loop310_next:
    goto loop310_test
  loop310_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P312, exception, 'type'
    eq $P312, .CONTROL_LOOP_NEXT, loop310_next
    eq $P312, .CONTROL_LOOP_REDO, loop310_redo
  loop310_done:
    pop_eh 
  for_undef_99:
.annotate 'line', 137
    set $P292, $P300
  if_293_end:
.annotate 'line', 135
    .return ($P292)
.end


.namespace ["HLL";"Actions"]
.sub "_block304"  :anon :subid("33_1297880737.84663") :outer("32_1297880737.84663")
    .param pmc param_306
.annotate 'line', 139
    .lex "$_", param_306
    find_lex $P307, "$past"
    find_lex $P308, "$_"
    $P309 = $P307."push"($P308)
    .return ($P309)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_delimited"  :subid("34_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_333
.annotate 'line', 152
    .const 'Sub' $P345 = "35_1297880737.84663" 
    capture_lex $P345
    new $P332, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P332, control_331
    push_eh $P332
    .lex "self", self
    .lex "$/", param_333
.annotate 'line', 153
    $P334 = root_new ['parrot';'ResizablePMCArray']
    .lex "@parts", $P334
.annotate 'line', 154
    new $P335, "Undef"
    .lex "$lastlit", $P335
.annotate 'line', 170
    new $P336, "Undef"
    .lex "$past", $P336
.annotate 'line', 152
    find_lex $P337, "@parts"
.annotate 'line', 154
    new $P338, "String"
    assign $P338, ""
    store_lex "$lastlit", $P338
.annotate 'line', 155
    find_lex $P340, "$/"
    unless_null $P340, vivify_100
    $P340 = root_new ['parrot';'Hash']
  vivify_100:
    set $P341, $P340["quote_atom"]
    unless_null $P341, vivify_101
    new $P341, "Undef"
  vivify_101:
    defined $I342, $P341
    unless $I342, for_undef_102
    iter $P339, $P341
    new $P378, 'ExceptionHandler'
    set_addr $P378, loop377_handler
    $P378."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P378
  loop377_test:
    unless $P339, loop377_done
    shift $P343, $P339
  loop377_redo:
    .const 'Sub' $P345 = "35_1297880737.84663" 
    capture_lex $P345
    $P345($P343)
  loop377_next:
    goto loop377_test
  loop377_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P379, exception, 'type'
    eq $P379, .CONTROL_LOOP_NEXT, loop377_next
    eq $P379, .CONTROL_LOOP_REDO, loop377_redo
  loop377_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 169
    find_lex $P381, "$lastlit"
    set $S382, $P381
    isgt $I383, $S382, ""
    unless $I383, if_380_end
    find_lex $P384, "@parts"
    find_lex $P385, "$lastlit"
    $P384."push"($P385)
  if_380_end:
.annotate 'line', 170
    find_lex $P388, "@parts"
    if $P388, if_387
    new $P391, "String"
    assign $P391, ""
    set $P386, $P391
    goto if_387_end
  if_387:
    find_lex $P389, "@parts"
    $P390 = $P389."shift"()
    set $P386, $P390
  if_387_end:
    store_lex "$past", $P386
.annotate 'line', 171
    new $P399, 'ExceptionHandler'
    set_addr $P399, loop398_handler
    $P399."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P399
  loop398_test:
    find_lex $P392, "@parts"
    unless $P392, loop398_done
  loop398_redo:
.annotate 'line', 172
    get_hll_global $P393, ["PAST"], "Op"
    find_lex $P394, "$past"
    find_lex $P395, "@parts"
    $P396 = $P395."shift"()
    $P397 = $P393."new"($P394, $P396, "concat" :named("pirop"))
    store_lex "$past", $P397
  loop398_next:
.annotate 'line', 171
    goto loop398_test
  loop398_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P400, exception, 'type'
    eq $P400, .CONTROL_LOOP_NEXT, loop398_next
    eq $P400, .CONTROL_LOOP_REDO, loop398_redo
  loop398_done:
    pop_eh 
.annotate 'line', 174
    find_lex $P401, "$/"
    find_lex $P402, "$past"
    $P403 = $P401."!make"($P402)
.annotate 'line', 152
    .return ($P403)
  control_331:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
.end


.namespace ["HLL";"Actions"]
.sub "_block344"  :anon :subid("35_1297880737.84663") :outer("34_1297880737.84663")
    .param pmc param_347
.annotate 'line', 156
    new $P346, "Undef"
    .lex "$ast", $P346
    .lex "$_", param_347
    find_lex $P348, "$_"
    $P349 = $P348."ast"()
    store_lex "$ast", $P349
.annotate 'line', 157
    get_hll_global $P352, ["PAST"], "Node"
    find_lex $P353, "$ast"
    $P354 = $P352."ACCEPTS"($P353)
    isfalse $I355, $P354
    if $I355, if_351
.annotate 'line', 160
    find_lex $P361, "$ast"
    get_hll_global $P362, ["PAST"], "Val"
    $P363 = $P361."isa"($P362)
    if $P363, if_360
.annotate 'line', 164
    find_lex $P369, "$lastlit"
    set $S370, $P369
    isgt $I371, $S370, ""
    unless $I371, if_368_end
    find_lex $P372, "@parts"
    find_lex $P373, "$lastlit"
    $P372."push"($P373)
  if_368_end:
.annotate 'line', 165
    find_lex $P374, "@parts"
    find_lex $P375, "$ast"
    $P374."push"($P375)
.annotate 'line', 166
    new $P376, "String"
    assign $P376, ""
    store_lex "$lastlit", $P376
.annotate 'line', 163
    set $P359, $P376
.annotate 'line', 160
    goto if_360_end
  if_360:
.annotate 'line', 161
    find_lex $P364, "$lastlit"
    find_lex $P365, "$ast"
    $S366 = $P365."value"()
    concat $P367, $P364, $S366
    store_lex "$lastlit", $P367
.annotate 'line', 160
    set $P359, $P367
  if_360_end:
    set $P350, $P359
.annotate 'line', 157
    goto if_351_end
  if_351:
.annotate 'line', 158
    find_lex $P356, "$lastlit"
    find_lex $P357, "$ast"
    concat $P358, $P356, $P357
    store_lex "$lastlit", $P358
.annotate 'line', 157
    set $P350, $P358
  if_351_end:
.annotate 'line', 155
    .return ($P350)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_atom"  :subid("36_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_408
.annotate 'line', 177
    new $P407, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P407, control_406
    push_eh $P407
    .lex "self", self
    .lex "$/", param_408
.annotate 'line', 178
    find_lex $P409, "$/"
    find_lex $P412, "$/"
    unless_null $P412, vivify_103
    $P412 = root_new ['parrot';'Hash']
  vivify_103:
    set $P413, $P412["quote_escape"]
    unless_null $P413, vivify_104
    new $P413, "Undef"
  vivify_104:
    if $P413, if_411
    find_lex $P417, "$/"
    set $S418, $P417
    new $P410, 'String'
    set $P410, $S418
    goto if_411_end
  if_411:
    find_lex $P414, "$/"
    unless_null $P414, vivify_105
    $P414 = root_new ['parrot';'Hash']
  vivify_105:
    set $P415, $P414["quote_escape"]
    unless_null $P415, vivify_106
    new $P415, "Undef"
  vivify_106:
    $P416 = $P415."ast"()
    set $P410, $P416
  if_411_end:
    $P419 = $P409."!make"($P410)
.annotate 'line', 177
    .return ($P419)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P420, exception, "payload"
    .return ($P420)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<backslash>"  :subid("37_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_424
.annotate 'line', 181
    new $P423, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P423, control_422
    push_eh $P423
    .lex "self", self
    .lex "$/", param_424
    find_lex $P425, "$/"
    $P426 = $P425."!make"("\\")
    .return ($P426)
  control_422:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P427, exception, "payload"
    .return ($P427)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<stopper>"  :subid("38_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_431
.annotate 'line', 182
    new $P430, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P430, control_429
    push_eh $P430
    .lex "self", self
    .lex "$/", param_431
    find_lex $P432, "$/"
    find_lex $P433, "$/"
    unless_null $P433, vivify_107
    $P433 = root_new ['parrot';'Hash']
  vivify_107:
    set $P434, $P433["stopper"]
    unless_null $P434, vivify_108
    new $P434, "Undef"
  vivify_108:
    set $S435, $P434
    $P436 = $P432."!make"($S435)
    .return ($P436)
  control_429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P437, exception, "payload"
    .return ($P437)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<bs>"  :subid("39_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_441
.annotate 'line', 184
    new $P440, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P440, control_439
    push_eh $P440
    .lex "self", self
    .lex "$/", param_441
    find_lex $P442, "$/"
    $P443 = $P442."!make"("\b")
    .return ($P443)
  control_439:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P444, exception, "payload"
    .return ($P444)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<nl>"  :subid("40_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_448
.annotate 'line', 185
    new $P447, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P447, control_446
    push_eh $P447
    .lex "self", self
    .lex "$/", param_448
    find_lex $P449, "$/"
    $P450 = $P449."!make"("\n")
    .return ($P450)
  control_446:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P451, exception, "payload"
    .return ($P451)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<cr>"  :subid("41_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_455
.annotate 'line', 186
    new $P454, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P454, control_453
    push_eh $P454
    .lex "self", self
    .lex "$/", param_455
    find_lex $P456, "$/"
    $P457 = $P456."!make"("\r")
    .return ($P457)
  control_453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P458, exception, "payload"
    .return ($P458)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<tab>"  :subid("42_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_462
.annotate 'line', 187
    new $P461, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P461, control_460
    push_eh $P461
    .lex "self", self
    .lex "$/", param_462
    find_lex $P463, "$/"
    $P464 = $P463."!make"("\t")
    .return ($P464)
  control_460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P465, exception, "payload"
    .return ($P465)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<ff>"  :subid("43_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_469
.annotate 'line', 188
    new $P468, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P468, control_467
    push_eh $P468
    .lex "self", self
    .lex "$/", param_469
    find_lex $P470, "$/"
    $P471 = $P470."!make"("\f")
    .return ($P471)
  control_467:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("44_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_476
.annotate 'line', 189
    new $P475, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P475, control_474
    push_eh $P475
    .lex "self", self
    .lex "$/", param_476
    find_lex $P477, "$/"
    $P478 = $P477."!make"("\e")
    .return ($P478)
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P479, exception, "payload"
    .return ($P479)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<hex>"  :subid("45_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_483
.annotate 'line', 191
    new $P482, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P482, control_481
    push_eh $P482
    .lex "self", self
    .lex "$/", param_483
.annotate 'line', 192
    find_lex $P484, "$/"
    find_lex $P487, "$/"
    unless_null $P487, vivify_109
    $P487 = root_new ['parrot';'Hash']
  vivify_109:
    set $P488, $P487["hexint"]
    unless_null $P488, vivify_110
    new $P488, "Undef"
  vivify_110:
    if $P488, if_486
    find_lex $P491, "$/"
    unless_null $P491, vivify_111
    $P491 = root_new ['parrot';'Hash']
  vivify_111:
    set $P492, $P491["hexints"]
    unless_null $P492, vivify_112
    $P492 = root_new ['parrot';'Hash']
  vivify_112:
    set $P493, $P492["hexint"]
    unless_null $P493, vivify_113
    new $P493, "Undef"
  vivify_113:
    set $P485, $P493
    goto if_486_end
  if_486:
    find_lex $P489, "$/"
    unless_null $P489, vivify_114
    $P489 = root_new ['parrot';'Hash']
  vivify_114:
    set $P490, $P489["hexint"]
    unless_null $P490, vivify_115
    new $P490, "Undef"
  vivify_115:
    set $P485, $P490
  if_486_end:
    $P494 = "ints_to_string"($P485)
    $P495 = $P484."!make"($P494)
.annotate 'line', 191
    .return ($P495)
  control_481:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, "payload"
    .return ($P496)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<oct>"  :subid("46_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_500
.annotate 'line', 195
    new $P499, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P499, control_498
    push_eh $P499
    .lex "self", self
    .lex "$/", param_500
.annotate 'line', 196
    find_lex $P501, "$/"
    find_lex $P504, "$/"
    unless_null $P504, vivify_116
    $P504 = root_new ['parrot';'Hash']
  vivify_116:
    set $P505, $P504["octint"]
    unless_null $P505, vivify_117
    new $P505, "Undef"
  vivify_117:
    if $P505, if_503
    find_lex $P508, "$/"
    unless_null $P508, vivify_118
    $P508 = root_new ['parrot';'Hash']
  vivify_118:
    set $P509, $P508["octints"]
    unless_null $P509, vivify_119
    $P509 = root_new ['parrot';'Hash']
  vivify_119:
    set $P510, $P509["octint"]
    unless_null $P510, vivify_120
    new $P510, "Undef"
  vivify_120:
    set $P502, $P510
    goto if_503_end
  if_503:
    find_lex $P506, "$/"
    unless_null $P506, vivify_121
    $P506 = root_new ['parrot';'Hash']
  vivify_121:
    set $P507, $P506["octint"]
    unless_null $P507, vivify_122
    new $P507, "Undef"
  vivify_122:
    set $P502, $P507
  if_503_end:
    $P511 = "ints_to_string"($P502)
    $P512 = $P501."!make"($P511)
.annotate 'line', 195
    .return ($P512)
  control_498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<chr>"  :subid("47_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_517
.annotate 'line', 199
    new $P516, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P516, control_515
    push_eh $P516
    .lex "self", self
    .lex "$/", param_517
.annotate 'line', 200
    find_lex $P518, "$/"
    find_lex $P519, "$/"
    unless_null $P519, vivify_123
    $P519 = root_new ['parrot';'Hash']
  vivify_123:
    set $P520, $P519["charspec"]
    unless_null $P520, vivify_124
    new $P520, "Undef"
  vivify_124:
    $P521 = $P520."ast"()
    $P522 = $P518."!make"($P521)
.annotate 'line', 199
    .return ($P522)
  control_515:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P523, exception, "payload"
    .return ($P523)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<0>"  :subid("48_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_527
.annotate 'line', 203
    new $P526, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P526, control_525
    push_eh $P526
    .lex "self", self
    .lex "$/", param_527
.annotate 'line', 204
    find_lex $P528, "$/"
    $P529 = $P528."!make"(unicode:"\x{0}")
.annotate 'line', 203
    .return ($P529)
  control_525:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P530, exception, "payload"
    .return ($P530)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<misc>"  :subid("49_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_534
.annotate 'line', 207
    new $P533, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P533, control_532
    push_eh $P533
    .lex "self", self
    .lex "$/", param_534
.annotate 'line', 208
    find_lex $P535, "$/"
    find_lex $P538, "$/"
    unless_null $P538, vivify_125
    $P538 = root_new ['parrot';'Hash']
  vivify_125:
    set $P539, $P538["textq"]
    unless_null $P539, vivify_126
    new $P539, "Undef"
  vivify_126:
    if $P539, if_537
    find_lex $P545, "$/"
    unless_null $P545, vivify_127
    $P545 = root_new ['parrot';'Hash']
  vivify_127:
    set $P546, $P545["textqq"]
    unless_null $P546, vivify_128
    new $P546, "Undef"
  vivify_128:
    $P547 = $P546."Str"()
    set $P536, $P547
    goto if_537_end
  if_537:
    new $P540, "String"
    assign $P540, "\\"
    find_lex $P541, "$/"
    unless_null $P541, vivify_129
    $P541 = root_new ['parrot';'Hash']
  vivify_129:
    set $P542, $P541["textq"]
    unless_null $P542, vivify_130
    new $P542, "Undef"
  vivify_130:
    $S543 = $P542."Str"()
    concat $P544, $P540, $S543
    set $P536, $P544
  if_537_end:
    $P548 = $P535."!make"($P536)
.annotate 'line', 207
    .return ($P548)
  control_532:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P549, exception, "payload"
    .return ($P549)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "charname"  :subid("50_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_553
.annotate 'line', 211
    new $P552, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P552, control_551
    push_eh $P552
    .lex "self", self
    .lex "$/", param_553
.annotate 'line', 212
    new $P554, "Undef"
    .lex "$codepoint", $P554
.annotate 'line', 213
    find_lex $P557, "$/"
    unless_null $P557, vivify_131
    $P557 = root_new ['parrot';'Hash']
  vivify_131:
    set $P558, $P557["integer"]
    unless_null $P558, vivify_132
    new $P558, "Undef"
  vivify_132:
    if $P558, if_556
.annotate 'line', 214
    find_lex $P562, "$/"
    set $S563, $P562
    find_codepoint $I564, $S563
    new $P555, 'Integer'
    set $P555, $I564
.annotate 'line', 213
    goto if_556_end
  if_556:
    find_lex $P559, "$/"
    unless_null $P559, vivify_133
    $P559 = root_new ['parrot';'Hash']
  vivify_133:
    set $P560, $P559["integer"]
    unless_null $P560, vivify_134
    new $P560, "Undef"
  vivify_134:
    $P561 = $P560."ast"()
    set $P555, $P561
  if_556_end:
    store_lex "$codepoint", $P555
.annotate 'line', 215
    find_lex $P566, "$codepoint"
    set $N567, $P566
    islt $I568, $N567, 0.0
    unless $I568, if_565_end
    find_lex $P569, "$/"
    $P570 = $P569."CURSOR"()
    new $P571, 'String'
    set $P571, "Unrecognized character name "
    find_lex $P572, "$/"
    concat $P573, $P571, $P572
    $P570."panic"($P573)
  if_565_end:
.annotate 'line', 216
    find_lex $P574, "$/"
    find_lex $P575, "$codepoint"
    set $I576, $P575
    chr $S577, $I576
    $P578 = $P574."!make"($S577)
.annotate 'line', 211
    .return ($P578)
  control_551:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P579, exception, "payload"
    .return ($P579)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "charnames"  :subid("51_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_583
.annotate 'line', 219
    .const 'Sub' $P592 = "52_1297880737.84663" 
    capture_lex $P592
    new $P582, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P582, control_581
    push_eh $P582
    .lex "self", self
    .lex "$/", param_583
.annotate 'line', 220
    new $P584, "Undef"
    .lex "$str", $P584
    new $P585, "String"
    assign $P585, ""
    store_lex "$str", $P585
.annotate 'line', 221
    find_lex $P587, "$/"
    unless_null $P587, vivify_135
    $P587 = root_new ['parrot';'Hash']
  vivify_135:
    set $P588, $P587["charname"]
    unless_null $P588, vivify_136
    new $P588, "Undef"
  vivify_136:
    defined $I589, $P588
    unless $I589, for_undef_137
    iter $P586, $P588
    new $P599, 'ExceptionHandler'
    set_addr $P599, loop598_handler
    $P599."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P599
  loop598_test:
    unless $P586, loop598_done
    shift $P590, $P586
  loop598_redo:
    .const 'Sub' $P592 = "52_1297880737.84663" 
    capture_lex $P592
    $P592($P590)
  loop598_next:
    goto loop598_test
  loop598_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P600, exception, 'type'
    eq $P600, .CONTROL_LOOP_NEXT, loop598_next
    eq $P600, .CONTROL_LOOP_REDO, loop598_redo
  loop598_done:
    pop_eh 
  for_undef_137:
.annotate 'line', 222
    find_lex $P601, "$/"
    find_lex $P602, "$str"
    $P603 = $P601."!make"($P602)
.annotate 'line', 219
    .return ($P603)
  control_581:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P604, exception, "payload"
    .return ($P604)
.end


.namespace ["HLL";"Actions"]
.sub "_block591"  :anon :subid("52_1297880737.84663") :outer("51_1297880737.84663")
    .param pmc param_593
.annotate 'line', 221
    .lex "$_", param_593
    find_lex $P594, "$str"
    find_lex $P595, "$_"
    $S596 = $P595."ast"()
    concat $P597, $P594, $S596
    store_lex "$str", $P597
    .return ($P597)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "charspec"  :subid("53_1297880737.84663") :method :outer("11_1297880737.84663")
    .param pmc param_608
.annotate 'line', 225
    new $P607, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P607, control_606
    push_eh $P607
    .lex "self", self
    .lex "$/", param_608
.annotate 'line', 226
    find_lex $P609, "$/"
    find_lex $P612, "$/"
    unless_null $P612, vivify_138
    $P612 = root_new ['parrot';'Hash']
  vivify_138:
    set $P613, $P612["charnames"]
    unless_null $P613, vivify_139
    new $P613, "Undef"
  vivify_139:
    if $P613, if_611
    find_lex $P617, "$/"
    $I618 = "string_to_int"($P617, 10)
    chr $S619, $I618
    new $P610, 'String'
    set $P610, $S619
    goto if_611_end
  if_611:
    find_lex $P614, "$/"
    unless_null $P614, vivify_140
    $P614 = root_new ['parrot';'Hash']
  vivify_140:
    set $P615, $P614["charnames"]
    unless_null $P615, vivify_141
    new $P615, "Undef"
  vivify_141:
    $P616 = $P615."ast"()
    set $P610, $P616
  if_611_end:
    $P620 = $P609."!make"($P610)
.annotate 'line', 225
    .return ($P620)
  control_606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P621, exception, "payload"
    .return ($P621)
.end


.namespace ["HLL";"Actions"]
.sub "_block623" :load :anon :subid("54_1297880737.84663")
.annotate 'line', 3
    .const 'Sub' $P625 = "11_1297880737.84663" 
    $P626 = $P625()
    .return ($P626)
.end


.namespace []
.sub "_block628" :load :anon :subid("55_1297880737.84663")
.annotate 'line', 1
    .const 'Sub' $P630 = "10_1297880737.84663" 
    $P631 = $P630()
    .return ($P631)
.end

### .include 'gen/hllcompiler.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1297880739.68671")
.annotate 'line', 0
    get_hll_global $P14, ["HLL";"Compiler"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    get_hll_global $P14, ["HLL";"Compiler"], "_block13" 
    capture_lex $P14
    $P497 = $P14()
.annotate 'line', 1
    .return ($P497)
    .const 'Sub' $P499 = "36_1297880739.68671" 
    .return ($P499)
.end


.namespace []
.sub "" :load :init :subid("post37") :outer("10_1297880739.68671")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880739.68671" 
    .local pmc block
    set block, $P12
.annotate 'line', 2
    load_bytecode "PCT/HLLCompiler.pbc"
.annotate 'line', 1
    $P502 = get_root_global ["parrot"], "P6metaclass"
    new $P503, "ResizablePMCArray"
    push $P503, "$!language"
    $P502."new_class"("HLL::Compiler", "PCT::HLLCompiler" :named("parent"), $P503 :named("attr"))
.end


.namespace ["HLL";"Compiler"]
.sub "_block13"  :subid("11_1297880739.68671") :outer("10_1297880739.68671")
.annotate 'line', 6
    .const 'Sub' $P489 = "35_1297880739.68671" 
    capture_lex $P489
    .const 'Sub' $P447 = "33_1297880739.68671" 
    capture_lex $P447
    .const 'Sub' $P298 = "26_1297880739.68671" 
    capture_lex $P298
    .const 'Sub' $P283 = "25_1297880739.68671" 
    capture_lex $P283
    .const 'Sub' $P188 = "20_1297880739.68671" 
    capture_lex $P188
    .const 'Sub' $P153 = "18_1297880739.68671" 
    capture_lex $P153
    .const 'Sub' $P138 = "17_1297880739.68671" 
    capture_lex $P138
    .const 'Sub' $P122 = "16_1297880739.68671" 
    capture_lex $P122
    .const 'Sub' $P33 = "13_1297880739.68671" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1297880739.68671" 
    capture_lex $P15
.annotate 'line', 14
    .const 'Sub' $P15 = "12_1297880739.68671" 
    newclosure $P31, $P15
    .lex "value_type", $P31
.annotate 'line', 10
    find_lex $P32, "value_type"
.annotate 'line', 165
    .const 'Sub' $P489 = "35_1297880739.68671" 
    newclosure $P495, $P489
.annotate 'line', 6
    .return ($P495)
.end


.namespace ["HLL";"Compiler"]
.sub "" :load :init :subid("post38") :outer("11_1297880739.68671")
.annotate 'line', 6
    get_hll_global $P14, ["HLL";"Compiler"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 11
    get_hll_global $P496, ["HLL"], "Compiler"
    $P496."language"("parrot")
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "value_type"  :subid("12_1297880739.68671") :outer("11_1297880739.68671")
    .param pmc param_18
.annotate 'line', 14
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "$value", param_18
.annotate 'line', 15
    find_lex $P21, "$value"
    isa $I22, $P21, "NameSpace"
    if $I22, if_20
.annotate 'line', 17
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
.annotate 'line', 15
    goto if_20_end
  if_20:
    new $P23, "String"
    assign $P23, "namespace"
    set $P19, $P23
  if_20_end:
.annotate 'line', 14
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "get_exports"  :subid("13_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_36
    .param pmc param_39 :slurpy
    .param pmc param_37 :optional :named("tagset")
    .param int has_param_37 :opt_flag
.annotate 'line', 20
    .const 'Sub' $P105 = "15_1297880739.68671" 
    capture_lex $P105
    .const 'Sub' $P84 = "14_1297880739.68671" 
    capture_lex $P84
    new $P35, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P35, control_34
    push_eh $P35
    .lex "self", self
    .lex "$module", param_36
    if has_param_37, optparam_39
    new $P38, "Undef"
    set param_37, $P38
  optparam_39:
    .lex "$tagset", param_37
    .lex "@symbols", param_39
.annotate 'line', 27
    $P40 = root_new ['parrot';'Hash']
    .lex "%exports", $P40
.annotate 'line', 28
    $P41 = root_new ['parrot';'Hash']
    .lex "%source", $P41
.annotate 'line', 22
    find_lex $P43, "$module"
    does $I44, $P43, "hash"
    new $P45, 'Integer'
    set $P45, $I44
    isfalse $I46, $P45
    unless $I46, if_42_end
.annotate 'line', 23
    find_lex $P47, "self"
    find_lex $P48, "$module"
    $P49 = $P47."get_module"($P48)
    store_lex "$module", $P49
  if_42_end:
.annotate 'line', 26
    find_lex $P51, "$tagset"
    set $P50, $P51
    defined $I53, $P50
    if $I53, default_52
    find_lex $P56, "@symbols"
    if $P56, if_55
    new $P58, "String"
    assign $P58, "DEFAULT"
    set $P54, $P58
    goto if_55_end
  if_55:
    new $P57, "String"
    assign $P57, "ALL"
    set $P54, $P57
  if_55_end:
    set $P50, $P54
  default_52:
    store_lex "$tagset", $P50
    find_lex $P59, "%exports"
.annotate 'line', 28
    find_lex $P60, "$tagset"
    set $S61, $P60
    find_lex $P62, "$module"
    unless_null $P62, vivify_40
    $P62 = root_new ['parrot';'Hash']
  vivify_40:
    set $P63, $P62["EXPORT"]
    unless_null $P63, vivify_41
    $P63 = root_new ['parrot';'Hash']
  vivify_41:
    set $P64, $P63[$S61]
    unless_null $P64, vivify_42
    new $P64, "Undef"
  vivify_42:
    store_lex "%source", $P64
.annotate 'line', 29
    find_lex $P66, "%source"
    defined $I67, $P66
    new $P68, 'Integer'
    set $P68, $I67
    isfalse $I69, $P68
    unless $I69, if_65_end
.annotate 'line', 30
    find_lex $P72, "$tagset"
    set $S73, $P72
    iseq $I74, $S73, "ALL"
    if $I74, if_71
    $P76 = root_new ['parrot';'Hash']
    set $P70, $P76
    goto if_71_end
  if_71:
    find_lex $P75, "$module"
    set $P70, $P75
  if_71_end:
    store_lex "%source", $P70
  if_65_end:
.annotate 'line', 32
    find_lex $P78, "@symbols"
    if $P78, if_77
.annotate 'line', 39
    find_lex $P101, "%source"
    defined $I102, $P101
    unless $I102, for_undef_43
    iter $P100, $P101
    new $P118, 'ExceptionHandler'
    set_addr $P118, loop117_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop117_test:
    unless $P100, loop117_done
    shift $P103, $P100
  loop117_redo:
    .const 'Sub' $P105 = "15_1297880739.68671" 
    capture_lex $P105
    $P105($P103)
  loop117_next:
    goto loop117_test
  loop117_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop117_next
    eq $P119, .CONTROL_LOOP_REDO, loop117_redo
  loop117_done:
    pop_eh 
  for_undef_43:
.annotate 'line', 38
    goto if_77_end
  if_77:
.annotate 'line', 33
    find_lex $P80, "@symbols"
    defined $I81, $P80
    unless $I81, for_undef_46
    iter $P79, $P80
    new $P98, 'ExceptionHandler'
    set_addr $P98, loop97_handler
    $P98."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P98
  loop97_test:
    unless $P79, loop97_done
    shift $P82, $P79
  loop97_redo:
    .const 'Sub' $P84 = "14_1297880739.68671" 
    capture_lex $P84
    $P84($P82)
  loop97_next:
    goto loop97_test
  loop97_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P99, exception, 'type'
    eq $P99, .CONTROL_LOOP_NEXT, loop97_next
    eq $P99, .CONTROL_LOOP_REDO, loop97_redo
  loop97_done:
    pop_eh 
  for_undef_46:
  if_77_end:
.annotate 'line', 32
    find_lex $P120, "%exports"
.annotate 'line', 20
    .return ($P120)
  control_34:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["HLL";"Compiler"]
.sub "_block104"  :anon :subid("15_1297880739.68671") :outer("13_1297880739.68671")
    .param pmc param_107
.annotate 'line', 40
    new $P106, "Undef"
    .lex "$value", $P106
    .lex "$_", param_107
    find_lex $P108, "$_"
    $P109 = $P108."value"()
    store_lex "$value", $P109
.annotate 'line', 41
    find_lex $P110, "$value"
    find_lex $P111, "$_"
    $P112 = $P111."key"()
    find_lex $P113, "$value"
    $P114 = "value_type"($P113)
    find_lex $P115, "%exports"
    unless_null $P115, vivify_44
    $P115 = root_new ['parrot';'Hash']
    store_lex "%exports", $P115
  vivify_44:
    set $P116, $P115[$P114]
    unless_null $P116, vivify_45
    $P116 = root_new ['parrot';'Hash']
    set $P115[$P114], $P116
  vivify_45:
    set $P116[$P112], $P110
.annotate 'line', 39
    .return ($P110)
.end


.namespace ["HLL";"Compiler"]
.sub "_block83"  :anon :subid("14_1297880739.68671") :outer("13_1297880739.68671")
    .param pmc param_86
.annotate 'line', 34
    new $P85, "Undef"
    .lex "$value", $P85
    .lex "$_", param_86
    find_lex $P87, "$_"
    set $S88, $P87
    find_lex $P89, "%source"
    unless_null $P89, vivify_47
    $P89 = root_new ['parrot';'Hash']
  vivify_47:
    set $P90, $P89[$S88]
    unless_null $P90, vivify_48
    new $P90, "Undef"
  vivify_48:
    store_lex "$value", $P90
.annotate 'line', 35
    find_lex $P91, "$value"
    find_lex $P92, "$_"
    find_lex $P93, "$value"
    $P94 = "value_type"($P93)
    find_lex $P95, "%exports"
    unless_null $P95, vivify_49
    $P95 = root_new ['parrot';'Hash']
    store_lex "%exports", $P95
  vivify_49:
    set $P96, $P95[$P94]
    unless_null $P96, vivify_50
    $P96 = root_new ['parrot';'Hash']
    set $P95[$P94], $P96
  vivify_50:
    set $P96[$P92], $P91
.annotate 'line', 33
    .return ($P91)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "get_module"  :subid("16_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_125
.annotate 'line', 47
    new $P124, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P124, control_123
    push_eh $P124
    .lex "self", self
    .lex "$name", param_125
.annotate 'line', 48
    $P126 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P126
    find_lex $P127, "self"
    find_lex $P128, "$name"
    $P129 = $P127."parse_name"($P128)
    store_lex "@name", $P129
.annotate 'line', 49
    find_lex $P130, "@name"
    find_lex $P131, "self"
    getattribute $P132, $P131, "$!language"
    unless_null $P132, vivify_51
    new $P132, "Undef"
  vivify_51:
    set $S133, $P132
    downcase $S134, $S133
    $P130."unshift"($S134)
.annotate 'line', 50
    find_lex $P135, "@name"
    get_root_namespace $P136, $P135
.annotate 'line', 47
    .return ($P136)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "language"  :subid("17_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_141 :optional
    .param int has_param_141 :opt_flag
.annotate 'line', 53
    new $P140, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P140, control_139
    push_eh $P140
    .lex "self", self
    if has_param_141, optparam_52
    new $P142, "Undef"
    set param_141, $P142
  optparam_52:
    .lex "$name", param_141
.annotate 'line', 54
    find_lex $P144, "$name"
    unless $P144, if_143_end
.annotate 'line', 55
    find_lex $P145, "$name"
    find_lex $P146, "self"
    setattribute $P146, "$!language", $P145
.annotate 'line', 56
    find_lex $P147, "$name"
    set $S148, $P147
    find_lex $P149, "self"
    compreg $S148, $P149
  if_143_end:
.annotate 'line', 54
    find_lex $P150, "self"
    getattribute $P151, $P150, "$!language"
    unless_null $P151, vivify_53
    new $P151, "Undef"
  vivify_53:
.annotate 'line', 53
    .return ($P151)
  control_139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "load_module"  :subid("18_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_156
.annotate 'line', 61
    .const 'Sub' $P166 = "19_1297880739.68671" 
    capture_lex $P166
    new $P155, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P155, control_154
    push_eh $P155
    .lex "self", self
    .lex "$name", param_156
.annotate 'line', 62
    new $P157, "Undef"
    .lex "$base", $P157
.annotate 'line', 63
    new $P158, "Undef"
    .lex "$loaded", $P158
.annotate 'line', 62
    find_lex $P159, "self"
    find_lex $P160, "$name"
    $P161 = $P159."parse_name"($P160)
    join $S162, "/", $P161
    new $P163, 'String'
    set $P163, $S162
    store_lex "$base", $P163
.annotate 'line', 63
    new $P164, "Integer"
    assign $P164, 0
    store_lex "$loaded", $P164
.annotate 'line', 64
    .const 'Sub' $P166 = "19_1297880739.68671" 
    capture_lex $P166
    $P166()
.annotate 'line', 65
    find_lex $P179, "$loaded"
    if $P179, unless_178_end
    find_lex $P180, "$base"
    concat $P181, $P180, ".pir"
    set $S182, $P181
    load_bytecode $S182
    new $P183, "Integer"
    assign $P183, 1
    store_lex "$loaded", $P183
  unless_178_end:
.annotate 'line', 66
    find_lex $P184, "self"
    find_lex $P185, "$name"
    $P186 = $P184."get_module"($P185)
.annotate 'line', 61
    .return ($P186)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P187, exception, "payload"
    .return ($P187)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block165"  :anon :subid("19_1297880739.68671") :outer("18_1297880739.68671")
.annotate 'line', 64
    new $P173, 'ExceptionHandler'
    set_addr $P173, control_172
    $P173."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P173
    find_lex $P167, "$base"
    concat $P168, $P167, ".pbc"
    set $S169, $P168
    load_bytecode $S169
    new $P170, "Integer"
    assign $P170, 1
    store_lex "$loaded", $P170
    pop_eh 
    goto skip_handler_171
  control_172:
    .local pmc exception 
    .get_results (exception) 
    new $P176, 'Integer'
    set $P176, 1
    set exception["handled"], $P176
    set $I177, exception["handled"]
    ne $I177, 1, nothandled_175
  handled_174:
    .return (exception)
  nothandled_175:
    rethrow exception
  skip_handler_171:
    .return ($P170)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "import"  :subid("20_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_191
    .param pmc param_192
.annotate 'line', 69
    .const 'Sub' $P198 = "21_1297880739.68671" 
    capture_lex $P198
    new $P190, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P190, control_189
    push_eh $P190
    .lex "self", self
    .lex "$target", param_191
    .lex "%exports", param_192
.annotate 'line', 70
    find_lex $P194, "%exports"
    defined $I195, $P194
    unless $I195, for_undef_54
    iter $P193, $P194
    new $P280, 'ExceptionHandler'
    set_addr $P280, loop279_handler
    $P280."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P280
  loop279_test:
    unless $P193, loop279_done
    shift $P196, $P193
  loop279_redo:
    .const 'Sub' $P198 = "21_1297880739.68671" 
    capture_lex $P198
    $P198($P196)
  loop279_next:
    goto loop279_test
  loop279_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, 'type'
    eq $P281, .CONTROL_LOOP_NEXT, loop279_next
    eq $P281, .CONTROL_LOOP_REDO, loop279_redo
  loop279_done:
    pop_eh 
  for_undef_54:
.annotate 'line', 69
    .return ($P193)
  control_189:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P282, exception, "payload"
    .return ($P282)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block197"  :anon :subid("21_1297880739.68671") :outer("20_1297880739.68671")
    .param pmc param_201
.annotate 'line', 70
    .const 'Sub' $P268 = "24_1297880739.68671" 
    capture_lex $P268
    .const 'Sub' $P248 = "23_1297880739.68671" 
    capture_lex $P248
    .const 'Sub' $P219 = "22_1297880739.68671" 
    capture_lex $P219
.annotate 'line', 71
    new $P199, "Undef"
    .lex "$type", $P199
.annotate 'line', 72
    $P200 = root_new ['parrot';'Hash']
    .lex "%items", $P200
    .lex "$_", param_201
.annotate 'line', 71
    find_lex $P202, "$_"
    $P203 = $P202."key"()
    store_lex "$type", $P203
.annotate 'line', 72
    find_lex $P204, "$_"
    $P205 = $P204."value"()
    store_lex "%items", $P205
.annotate 'line', 73
    find_lex $P208, "self"
    new $P209, 'String'
    set $P209, "import_"
    find_lex $P210, "$type"
    concat $P211, $P209, $P210
    set $S212, $P211
    can $I213, $P208, $S212
    if $I213, if_207
.annotate 'line', 76
    find_lex $P237, "$target"
    new $P238, 'String'
    set $P238, "add_"
    find_lex $P239, "$type"
    concat $P240, $P238, $P239
    set $S241, $P240
    can $I242, $P237, $S241
    if $I242, if_236
.annotate 'line', 80
    find_lex $P264, "%items"
    defined $I265, $P264
    unless $I265, for_undef_55
    iter $P263, $P264
    new $P277, 'ExceptionHandler'
    set_addr $P277, loop276_handler
    $P277."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P277
  loop276_test:
    unless $P263, loop276_done
    shift $P266, $P263
  loop276_redo:
    .const 'Sub' $P268 = "24_1297880739.68671" 
    capture_lex $P268
    $P268($P266)
  loop276_next:
    goto loop276_test
  loop276_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, 'type'
    eq $P278, .CONTROL_LOOP_NEXT, loop276_next
    eq $P278, .CONTROL_LOOP_REDO, loop276_redo
  loop276_done:
    pop_eh 
  for_undef_55:
.annotate 'line', 79
    set $P235, $P263
.annotate 'line', 76
    goto if_236_end
  if_236:
.annotate 'line', 77
    find_lex $P244, "%items"
    defined $I245, $P244
    unless $I245, for_undef_57
    iter $P243, $P244
    new $P261, 'ExceptionHandler'
    set_addr $P261, loop260_handler
    $P261."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P261
  loop260_test:
    unless $P243, loop260_done
    shift $P246, $P243
  loop260_redo:
    .const 'Sub' $P248 = "23_1297880739.68671" 
    capture_lex $P248
    $P248($P246)
  loop260_next:
    goto loop260_test
  loop260_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P262, exception, 'type'
    eq $P262, .CONTROL_LOOP_NEXT, loop260_next
    eq $P262, .CONTROL_LOOP_REDO, loop260_redo
  loop260_done:
    pop_eh 
  for_undef_57:
.annotate 'line', 76
    set $P235, $P243
  if_236_end:
    set $P206, $P235
.annotate 'line', 73
    goto if_207_end
  if_207:
.annotate 'line', 74
    find_lex $P215, "%items"
    defined $I216, $P215
    unless $I216, for_undef_58
    iter $P214, $P215
    new $P233, 'ExceptionHandler'
    set_addr $P233, loop232_handler
    $P233."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P233
  loop232_test:
    unless $P214, loop232_done
    shift $P217, $P214
  loop232_redo:
    .const 'Sub' $P219 = "22_1297880739.68671" 
    capture_lex $P219
    $P219($P217)
  loop232_next:
    goto loop232_test
  loop232_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, 'type'
    eq $P234, .CONTROL_LOOP_NEXT, loop232_next
    eq $P234, .CONTROL_LOOP_REDO, loop232_redo
  loop232_done:
    pop_eh 
  for_undef_58:
.annotate 'line', 73
    set $P206, $P214
  if_207_end:
.annotate 'line', 70
    .return ($P206)
.end


.namespace ["HLL";"Compiler"]
.sub "_block267"  :anon :subid("24_1297880739.68671") :outer("21_1297880739.68671")
    .param pmc param_269
.annotate 'line', 80
    .lex "$_", param_269
    find_lex $P270, "$_"
    $P271 = $P270."value"()
    find_lex $P272, "$_"
    $P273 = $P272."key"()
    set $S274, $P273
    find_lex $P275, "$target"
    unless_null $P275, vivify_56
    $P275 = root_new ['parrot';'Hash']
    store_lex "$target", $P275
  vivify_56:
    set $P275[$S274], $P271
    .return ($P271)
.end


.namespace ["HLL";"Compiler"]
.sub "_block247"  :anon :subid("23_1297880739.68671") :outer("21_1297880739.68671")
    .param pmc param_249
.annotate 'line', 77
    .lex "$_", param_249
    find_lex $P250, "$target"
    find_lex $P251, "$_"
    $P252 = $P251."key"()
    find_lex $P253, "$_"
    $P254 = $P253."value"()
    new $P255, 'String'
    set $P255, "add_"
    find_lex $P256, "$type"
    concat $P257, $P255, $P256
    set $S258, $P257
    $P259 = $P250.$S258($P252, $P254)
    .return ($P259)
.end


.namespace ["HLL";"Compiler"]
.sub "_block218"  :anon :subid("22_1297880739.68671") :outer("21_1297880739.68671")
    .param pmc param_220
.annotate 'line', 74
    .lex "$_", param_220
    find_lex $P221, "self"
    find_lex $P222, "$target"
    find_lex $P223, "$_"
    $P224 = $P223."key"()
    find_lex $P225, "$_"
    $P226 = $P225."value"()
    new $P227, 'String'
    set $P227, "import_"
    find_lex $P228, "$type"
    concat $P229, $P227, $P228
    set $S230, $P229
    $P231 = $P221.$S230($P222, $P224, $P226)
    .return ($P231)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "autoprint"  :subid("25_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_286
.annotate 'line', 85
    new $P285, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P285, control_284
    push_eh $P285
    .lex "self", self
    .lex "$value", param_286
.annotate 'line', 87
    getinterp $P289
    $P290 = $P289."stdout_handle"()
    $N291 = $P290."tell"()
    find_dynamic_lex $P292, "$*AUTOPRINTPOS"
    unless_null $P292, vivify_59
    get_hll_global $P292, "$AUTOPRINTPOS"
    unless_null $P292, vivify_60
    die "Contextual $*AUTOPRINTPOS not found"
  vivify_60:
  vivify_59:
    set $N293, $P292
    isgt $I294, $N291, $N293
    unless $I294, unless_288
    new $P287, 'Integer'
    set $P287, $I294
    goto unless_288_end
  unless_288:
.annotate 'line', 86
    find_lex $P295, "$value"
    set $S296, $P295
    say $S296
  unless_288_end:
.annotate 'line', 85
    .return ($P287)
  control_284:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, "payload"
    .return ($P297)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "interactive"  :subid("26_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_301 :slurpy :named
.annotate 'line', 90
    .const 'Sub' $P333 = "27_1297880739.68671" 
    capture_lex $P333
    new $P300, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P300, control_299
    push_eh $P300
    .lex "self", self
    .lex "%adverbs", param_301
.annotate 'line', 91
    new $P302, "Undef"
    .lex "$target", $P302
.annotate 'line', 95
    new $P303, "Undef"
    .lex "$stdin", $P303
.annotate 'line', 96
    new $P304, "Undef"
    .lex "$encoding", $P304
.annotate 'line', 101
    new $P305, "Undef"
    .lex "$save_ctx", $P305
.annotate 'line', 91
    find_lex $P306, "%adverbs"
    unless_null $P306, vivify_61
    $P306 = root_new ['parrot';'Hash']
  vivify_61:
    set $P307, $P306["target"]
    unless_null $P307, vivify_62
    new $P307, "Undef"
  vivify_62:
    set $S308, $P307
    downcase $S309, $S308
    new $P310, 'String'
    set $P310, $S309
    store_lex "$target", $P310
.annotate 'line', 93
    getinterp $P311
    $P312 = $P311."stderr_handle"()
    find_lex $P313, "self"
    $S314 = $P313."commandline_banner"()
    print $P312, $S314
.annotate 'line', 95
    getinterp $P315
    $P316 = $P315."stdin_handle"()
    store_lex "$stdin", $P316
.annotate 'line', 96
    find_lex $P317, "%adverbs"
    unless_null $P317, vivify_63
    $P317 = root_new ['parrot';'Hash']
  vivify_63:
    set $P318, $P317["encoding"]
    unless_null $P318, vivify_64
    new $P318, "Undef"
  vivify_64:
    set $S319, $P318
    new $P320, 'String'
    set $P320, $S319
    store_lex "$encoding", $P320
.annotate 'line', 97
    find_lex $P324, "$encoding"
    if $P324, if_323
    set $P322, $P324
    goto if_323_end
  if_323:
    find_lex $P325, "$encoding"
    set $S326, $P325
    isne $I327, $S326, "fixed_8"
    new $P322, 'Integer'
    set $P322, $I327
  if_323_end:
    unless $P322, if_321_end
.annotate 'line', 98
    find_lex $P328, "$stdin"
    find_lex $P329, "$encoding"
    $P328."encoding"($P329)
  if_321_end:
.annotate 'line', 97
    find_lex $P330, "$save_ctx"
.annotate 'line', 102
    new $P444, 'ExceptionHandler'
    set_addr $P444, loop443_handler
    $P444."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P444
  loop443_test:
    new $P331, "Integer"
    assign $P331, 1
    unless $P331, loop443_done
  loop443_redo:
    .const 'Sub' $P333 = "27_1297880739.68671" 
    capture_lex $P333
    $P333()
  loop443_next:
    goto loop443_test
  loop443_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P445, exception, 'type'
    eq $P445, .CONTROL_LOOP_NEXT, loop443_next
    eq $P445, .CONTROL_LOOP_REDO, loop443_redo
  loop443_done:
    pop_eh 
.annotate 'line', 90
    .return ($P331)
  control_299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P446, exception, "payload"
    .return ($P446)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block332"  :anon :subid("27_1297880739.68671") :outer("26_1297880739.68671")
.annotate 'line', 102
    .const 'Sub' $P365 = "28_1297880739.68671" 
    capture_lex $P365
.annotate 'line', 105
    new $P334, "Undef"
    .lex "$prompt", $P334
.annotate 'line', 106
    new $P335, "Undef"
    .lex "$code", $P335
.annotate 'line', 111
    new $P336, "Undef"
    .lex "$*AUTOPRINTPOS", $P336
.annotate 'line', 112
    new $P337, "Undef"
    .lex "$*CTXSAVE", $P337
.annotate 'line', 113
    new $P338, "Undef"
    .lex "$*MAIN_CTX", $P338
.annotate 'line', 103
    find_lex $P340, "$stdin"
    if $P340, unless_339_end
    set $I341, .CONTROL_LOOP_LAST
    die 0, $I341
  unless_339_end:
.annotate 'line', 105
    find_lex $P343, "self"
    $P344 = $P343."commandline_prompt"()
    set $P342, $P344
    defined $I346, $P342
    if $I346, default_345
    new $P347, "String"
    assign $P347, "> "
    set $P342, $P347
  default_345:
    store_lex "$prompt", $P342
.annotate 'line', 106
    find_lex $P348, "$stdin"
    find_lex $P349, "$prompt"
    set $S350, $P349
    $P351 = $P348."readline_interactive"($S350)
    store_lex "$code", $P351
.annotate 'line', 108
    find_lex $P353, "$code"
    isnull $I354, $P353
    unless $I354, if_352_end
    set $I355, .CONTROL_LOOP_LAST
    die 0, $I355
  if_352_end:
.annotate 'line', 111
    getinterp $P356
    $P357 = $P356."stdout_handle"()
    $P358 = $P357."tell"()
    store_lex "$*AUTOPRINTPOS", $P358
.annotate 'line', 112
    find_lex $P359, "self"
    store_lex "$*CTXSAVE", $P359
    find_lex $P360, "$*MAIN_CTX"
    unless_null $P360, vivify_65
    get_hll_global $P360, "$MAIN_CTX"
    unless_null $P360, vivify_66
    die "Contextual $*MAIN_CTX not found"
  vivify_66:
  vivify_65:
.annotate 'line', 115
    find_lex $P363, "$code"
    if $P363, if_362
    set $P361, $P363
    goto if_362_end
  if_362:
    .const 'Sub' $P365 = "28_1297880739.68671" 
    capture_lex $P365
    $P442 = $P365()
    set $P361, $P442
  if_362_end:
.annotate 'line', 102
    .return ($P361)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block364"  :anon :subid("28_1297880739.68671") :outer("27_1297880739.68671")
.annotate 'line', 115
    .const 'Sub' $P398 = "31_1297880739.68671" 
    capture_lex $P398
    .const 'Sub' $P371 = "29_1297880739.68671" 
    capture_lex $P371
.annotate 'line', 117
    new $P366, "Undef"
    .lex "$output", $P366
.annotate 'line', 116
    find_lex $P367, "$code"
    concat $P368, $P367, "\n"
    store_lex "$code", $P368
    find_lex $P369, "$output"
.annotate 'line', 118
    .const 'Sub' $P371 = "29_1297880739.68671" 
    capture_lex $P371
    $P371()
.annotate 'line', 125
    find_dynamic_lex $P395, "$*MAIN_CTX"
    unless_null $P395, vivify_67
    get_hll_global $P395, "$MAIN_CTX"
    unless_null $P395, vivify_68
    die "Contextual $*MAIN_CTX not found"
  vivify_68:
  vivify_67:
    defined $I396, $P395
    unless $I396, if_394_end
    .const 'Sub' $P398 = "31_1297880739.68671" 
    capture_lex $P398
    $P398()
  if_394_end:
.annotate 'line', 133
    find_lex $P421, "$output"
    isnull $I422, $P421
    unless $I422, if_420_end
    set $I423, .CONTROL_LOOP_NEXT
    die 0, $I423
  if_420_end:
.annotate 'line', 135
    find_lex $P426, "$target"
    isfalse $I427, $P426
    if $I427, if_425
.annotate 'line', 137
    find_lex $P433, "$target"
    set $S434, $P433
    iseq $I435, $S434, "pir"
    if $I435, if_432
.annotate 'line', 140
    find_lex $P437, "self"
    find_lex $P438, "$output"
    find_lex $P439, "$target"
    find_lex $P440, "%adverbs"
    $P441 = $P437."dumper"($P438, $P439, $P440 :flat)
.annotate 'line', 139
    set $P431, $P441
.annotate 'line', 137
    goto if_432_end
  if_432:
.annotate 'line', 138
    find_lex $P436, "$output"
    say $P436
  if_432_end:
.annotate 'line', 137
    set $P424, $P431
.annotate 'line', 135
    goto if_425_end
  if_425:
.annotate 'line', 136
    find_lex $P428, "self"
    find_lex $P429, "$output"
    $P430 = $P428."autoprint"($P429)
.annotate 'line', 135
    set $P424, $P430
  if_425_end:
.annotate 'line', 115
    .return ($P424)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block370"  :anon :subid("29_1297880739.68671") :outer("28_1297880739.68671")
.annotate 'line', 118
    .const 'Sub' $P383 = "30_1297880739.68671" 
    capture_lex $P383
    new $P379, 'ExceptionHandler'
    set_addr $P379, control_378
    $P379."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P379
.annotate 'line', 119
    find_lex $P372, "self"
    find_lex $P373, "$code"
    find_lex $P374, "$save_ctx"
    find_lex $P375, "%adverbs"
    $P376 = $P372."eval"($P373, $P375 :flat, $P374 :named("outer_ctx"))
    store_lex "$output", $P376
.annotate 'line', 118
    pop_eh 
    goto skip_handler_377
  control_378:
.annotate 'line', 120
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P383 = "30_1297880739.68671" 
    newclosure $P391, $P383
    $P391(exception)
    new $P392, 'Integer'
    set $P392, 1
    set exception["handled"], $P392
    set $I393, exception["handled"]
    ne $I393, 1, nothandled_381
  handled_380:
    .return (exception)
  nothandled_381:
    rethrow exception
  skip_handler_377:
.annotate 'line', 118
    .return ()
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block382"  :anon :subid("30_1297880739.68671") :outer("29_1297880739.68671")
    .param pmc param_384
.annotate 'line', 120
    .lex "$_", param_384
    find_lex $P385, "$_"
    .lex "$!", $P385
.annotate 'line', 121
    find_lex $P386, "$!"
    set $S387, $P386
    new $P388, 'String'
    set $P388, $S387
    concat $P389, $P388, "\n"
    print $P389
.annotate 'line', 122
    set $I390, .CONTROL_LOOP_NEXT
    die 0, $I390
.annotate 'line', 120
    .return ()
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block397"  :anon :subid("31_1297880739.68671") :outer("28_1297880739.68671")
.annotate 'line', 125
    .const 'Sub' $P409 = "32_1297880739.68671" 
    capture_lex $P409
.annotate 'line', 126
    get_global $P399, "$interactive_ctx"
    unless_null $P399, vivify_69
    new $P399, "Undef"
    set_global "$interactive_ctx", $P399
  vivify_69:
.annotate 'line', 127
    get_global $P400, "%interactive_pad"
    unless_null $P400, vivify_70
    $P400 = root_new ['parrot';'Hash']
    set_global "%interactive_pad", $P400
  vivify_70:
.annotate 'line', 125
    get_global $P401, "$interactive_ctx"
    get_global $P402, "%interactive_pad"
.annotate 'line', 128
    find_dynamic_lex $P404, "$*MAIN_CTX"
    unless_null $P404, vivify_71
    get_hll_global $P404, "$MAIN_CTX"
    unless_null $P404, vivify_72
    die "Contextual $*MAIN_CTX not found"
  vivify_72:
  vivify_71:
    $P405 = $P404."lexpad_full"()
    defined $I406, $P405
    unless $I406, for_undef_73
    iter $P403, $P405
    new $P417, 'ExceptionHandler'
    set_addr $P417, loop416_handler
    $P417."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P417
  loop416_test:
    unless $P403, loop416_done
    shift $P407, $P403
  loop416_redo:
    .const 'Sub' $P409 = "32_1297880739.68671" 
    capture_lex $P409
    $P409($P407)
  loop416_next:
    goto loop416_test
  loop416_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P418, exception, 'type'
    eq $P418, .CONTROL_LOOP_NEXT, loop416_next
    eq $P418, .CONTROL_LOOP_REDO, loop416_redo
  loop416_done:
    pop_eh 
  for_undef_73:
.annotate 'line', 131
    get_global $P419, "$interactive_ctx"
    store_lex "$save_ctx", $P419
.annotate 'line', 125
    .return ($P419)
.end


.namespace ["HLL";"Compiler"]
.sub "_block408"  :anon :subid("32_1297880739.68671") :outer("31_1297880739.68671")
    .param pmc param_410
.annotate 'line', 128
    .lex "$_", param_410
.annotate 'line', 129
    find_lex $P411, "$_"
    $P412 = $P411."value"()
    find_lex $P413, "$_"
    $P414 = $P413."key"()
    get_global $P415, "%interactive_pad"
    unless_null $P415, vivify_74
    $P415 = root_new ['parrot';'Hash']
    set_global "%interactive_pad", $P415
  vivify_74:
    set $P415[$P414], $P412
.annotate 'line', 128
    .return ($P412)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "eval"  :subid("33_1297880739.68671") :method :outer("11_1297880739.68671")
    .param pmc param_450
    .param pmc param_451 :slurpy
    .param pmc param_452 :slurpy :named
.annotate 'line', 146
    .const 'Sub' $P471 = "34_1297880739.68671" 
    capture_lex $P471
    new $P449, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P449, control_448
    push_eh $P449
    .lex "self", self
    .lex "$code", param_450
    .lex "@args", param_451
    .lex "%adverbs", param_452
.annotate 'line', 147
    new $P453, "Undef"
    .lex "$output", $P453
.annotate 'line', 146
    find_lex $P454, "$output"
.annotate 'line', 148
    find_lex $P455, "self"
    find_lex $P456, "$code"
    find_lex $P457, "%adverbs"
    $P458 = $P455."compile"($P456, $P457 :flat)
    store_lex "$output", $P458
.annotate 'line', 150
    find_lex $P462, "$output"
    isa $I463, $P462, "String"
    new $P464, 'Integer'
    set $P464, $I463
    isfalse $I465, $P464
    if $I465, if_461
    new $P460, 'Integer'
    set $P460, $I465
    goto if_461_end
  if_461:
.annotate 'line', 151
    find_lex $P466, "%adverbs"
    unless_null $P466, vivify_75
    $P466 = root_new ['parrot';'Hash']
  vivify_75:
    set $P467, $P466["target"]
    unless_null $P467, vivify_76
    new $P467, "Undef"
  vivify_76:
    set $S468, $P467
    iseq $I469, $S468, ""
    new $P460, 'Integer'
    set $P460, $I469
  if_461_end:
    unless $P460, if_459_end
    .const 'Sub' $P471 = "34_1297880739.68671" 
    capture_lex $P471
    $P471()
  if_459_end:
.annotate 'line', 150
    find_lex $P487, "$output"
.annotate 'line', 146
    .return ($P487)
  control_448:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P488, exception, "payload"
    .return ($P488)
.end


.namespace ["HLL";"Compiler"]
.sub "_block470"  :anon :subid("34_1297880739.68671") :outer("33_1297880739.68671")
.annotate 'line', 152
    new $P472, "Undef"
    .lex "$outer_ctx", $P472
    find_lex $P473, "%adverbs"
    unless_null $P473, vivify_77
    $P473 = root_new ['parrot';'Hash']
  vivify_77:
    set $P474, $P473["outer_ctx"]
    unless_null $P474, vivify_78
    new $P474, "Undef"
  vivify_78:
    store_lex "$outer_ctx", $P474
.annotate 'line', 153
    find_lex $P476, "$outer_ctx"
    defined $I477, $P476
    unless $I477, if_475_end
.annotate 'line', 154
    find_lex $P478, "$output"
    unless_null $P478, vivify_79
    $P478 = root_new ['parrot';'ResizablePMCArray']
  vivify_79:
    set $P479, $P478[0]
    unless_null $P479, vivify_80
    new $P479, "Undef"
  vivify_80:
    find_lex $P480, "$outer_ctx"
    $P479."set_outer_ctx"($P480)
  if_475_end:
.annotate 'line', 157
    find_lex $P481, "%adverbs"
    unless_null $P481, vivify_81
    $P481 = root_new ['parrot';'Hash']
  vivify_81:
    set $P482, $P481["trace"]
    unless_null $P482, vivify_82
    new $P482, "Undef"
  vivify_82:
    set $I483, $P482
    trace $I483
.annotate 'line', 158
    find_lex $P484, "$output"
    find_lex $P485, "@args"
    $P486 = $P484($P485 :flat)
    store_lex "$output", $P486
.annotate 'line', 159
    trace 0
.annotate 'line', 151
    .return ()
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "ctxsave"  :subid("35_1297880739.68671") :method :outer("11_1297880739.68671")
.annotate 'line', 165
    new $P491, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P491, control_490
    push_eh $P491
    .lex "self", self
.annotate 'line', 167

                $P0 = getinterp
                $P492 = $P0['context';1]
            
    store_dynamic_lex "$*MAIN_CTX", $P492
.annotate 'line', 171
    new $P493, "Integer"
    assign $P493, 0
    store_dynamic_lex "$*CTXSAVE", $P493
.annotate 'line', 165
    .return ($P493)
  control_490:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P494, exception, "payload"
    .return ($P494)
.end


.namespace []
.sub "_block498" :load :anon :subid("36_1297880739.68671")
.annotate 'line', 1
    .const 'Sub' $P500 = "10_1297880739.68671" 
    $P501 = $P500()
    .return ($P501)
.end


=back

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
