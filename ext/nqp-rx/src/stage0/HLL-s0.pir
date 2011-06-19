# 

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
.sub "_block1000"  :anon :subid("10_1308504717.31993")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308504717.31993" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 5
    .const 'Sub' $P1003 = "11_1308504717.31993" 
    capture_lex $P1003
    $P101 = $P1003()
.annotate 'line', 1
    .return ($P101)
    .const 'Sub' $P1235 = "107_1308504717.31993" 
    .return ($P1235)
.end


.namespace []
.sub "" :load :init :subid("post108") :outer("10_1308504717.31993")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308504717.31993" 
    .local pmc block
    set block, $P1001
    $P1237 = get_root_global ["parrot"], "P6metaclass"
    $P1237."new_class"("HLL::Grammar", "Regex::Cursor" :named("parent"))
.end


.namespace ["HLL";"Grammar"]
.sub "_block1002"  :subid("11_1308504717.31993") :outer("10_1308504717.31993")
.annotate 'line', 5
    .const 'Sub' $P1223 = "103_1308504717.31993" 
    capture_lex $P1223
    .const 'Sub' $P1218 = "101_1308504717.31993" 
    capture_lex $P1218
    .const 'Sub' $P1207 = "98_1308504717.31993" 
    capture_lex $P1207
    .const 'Sub' $P1190 = "93_1308504717.31993" 
    capture_lex $P1190
    .const 'Sub' $P1185 = "91_1308504717.31993" 
    capture_lex $P1185
    .const 'Sub' $P1181 = "89_1308504717.31993" 
    capture_lex $P1181
    .const 'Sub' $P1176 = "87_1308504717.31993" 
    capture_lex $P1176
    .const 'Sub' $P1171 = "85_1308504717.31993" 
    capture_lex $P1171
    .const 'Sub' $P1167 = "83_1308504717.31993" 
    capture_lex $P1167
    .const 'Sub' $P1163 = "81_1308504717.31993" 
    capture_lex $P1163
    .const 'Sub' $P1159 = "79_1308504717.31993" 
    capture_lex $P1159
    .const 'Sub' $P1155 = "77_1308504717.31993" 
    capture_lex $P1155
    .const 'Sub' $P1151 = "75_1308504717.31993" 
    capture_lex $P1151
    .const 'Sub' $P1147 = "73_1308504717.31993" 
    capture_lex $P1147
    .const 'Sub' $P1143 = "71_1308504717.31993" 
    capture_lex $P1143
    .const 'Sub' $P1139 = "69_1308504717.31993" 
    capture_lex $P1139
    .const 'Sub' $P1132 = "65_1308504717.31993" 
    capture_lex $P1132
    .const 'Sub' $P1120 = "63_1308504717.31993" 
    capture_lex $P1120
    .const 'Sub' $P1114 = "61_1308504717.31993" 
    capture_lex $P1114
    .const 'Sub' $P1109 = "59_1308504717.31993" 
    capture_lex $P1109
    .const 'Sub' $P1103 = "57_1308504717.31993" 
    capture_lex $P1103
    .const 'Sub' $P1098 = "55_1308504717.31993" 
    capture_lex $P1098
    .const 'Sub' $P1092 = "53_1308504717.31993" 
    capture_lex $P1092
    .const 'Sub' $P1087 = "51_1308504717.31993" 
    capture_lex $P1087
    .const 'Sub' $P1081 = "49_1308504717.31993" 
    capture_lex $P1081
    .const 'Sub' $P1076 = "47_1308504717.31993" 
    capture_lex $P1076
    .const 'Sub' $P1071 = "45_1308504717.31993" 
    capture_lex $P1071
    .const 'Sub' $P1065 = "43_1308504717.31993" 
    capture_lex $P1065
    .const 'Sub' $P1059 = "41_1308504717.31993" 
    capture_lex $P1059
    .const 'Sub' $P1055 = "40_1308504717.31993" 
    capture_lex $P1055
    .const 'Sub' $P1051 = "38_1308504717.31993" 
    capture_lex $P1051
    .const 'Sub' $P1047 = "36_1308504717.31993" 
    capture_lex $P1047
    .const 'Sub' $P1042 = "34_1308504717.31993" 
    capture_lex $P1042
    .const 'Sub' $P1038 = "32_1308504717.31993" 
    capture_lex $P1038
    .const 'Sub' $P1034 = "30_1308504717.31993" 
    capture_lex $P1034
    .const 'Sub' $P1030 = "28_1308504717.31993" 
    capture_lex $P1030
    .const 'Sub' $P1010 = "14_1308504717.31993" 
    capture_lex $P1010
    .const 'Sub' $P1004 = "12_1308504717.31993" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P1223 = "103_1308504717.31993" 
    capture_lex $P1223
    .return ($P1223)
    .const 'Sub' $P1232 = "106_1308504717.31993" 
    .return ($P1232)
.end


.namespace ["HLL";"Grammar"]
.sub "ws"  :subid("12_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1005_tgt
    .local int rx1005_pos
    .local int rx1005_off
    .local int rx1005_eos
    .local int rx1005_rep
    .local pmc rx1005_cur
    .local pmc rx1005_debug
    (rx1005_cur, rx1005_pos, rx1005_tgt, $I10) = self."!cursor_start"()
    getattribute rx1005_debug, rx1005_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1005_cur
    .local pmc match
    .lex "$/", match
    length rx1005_eos, rx1005_tgt
    gt rx1005_pos, rx1005_eos, rx1005_done
    set rx1005_off, 0
    lt rx1005_pos, 2, rx1005_start
    sub rx1005_off, rx1005_pos, 1
    substr rx1005_tgt, rx1005_tgt, rx1005_off
  rx1005_start:
    eq $I10, 1, rx1005_restart
    if_null rx1005_debug, debug_109
    rx1005_cur."!cursor_debug"("START", "ws")
  debug_109:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1007_done
    goto rxscan1007_scan
  rxscan1007_loop:
    ($P10) = rx1005_cur."from"()
    inc $P10
    set rx1005_pos, $P10
    ge rx1005_pos, rx1005_eos, rxscan1007_done
  rxscan1007_scan:
    set_addr $I10, rxscan1007_loop
    rx1005_cur."!mark_push"(0, rx1005_pos, $I10)
  rxscan1007_done:
  # rx subrule "ww" subtype=zerowidth negate=1
    rx1005_cur."!cursor_pos"(rx1005_pos)
    $P10 = rx1005_cur."ww"()
    if $P10, rx1005_fail
  # rx rxquantr1008 ** 0..*
    set_addr $I10, rxquantr1008_done
    rx1005_cur."!mark_push"(0, rx1005_pos, $I10)
  rxquantr1008_loop:
  alt1009_0:
    set_addr $I10, alt1009_1
    rx1005_cur."!mark_push"(0, rx1005_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx1005_pos, rx1005_off
    find_not_cclass $I11, 32, rx1005_tgt, $I10, rx1005_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1005_fail
    add rx1005_pos, rx1005_off, $I11
    goto alt1009_end
  alt1009_1:
  # rx literal  "#"
    add $I11, rx1005_pos, 1
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    ord $I11, rx1005_tgt, $I11
    ne $I11, 35, rx1005_fail
    add rx1005_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx1005_pos, rx1005_off
    find_cclass $I11, 4096, rx1005_tgt, $I10, rx1005_eos
    add rx1005_pos, rx1005_off, $I11
  alt1009_end:
    set_addr $I10, rxquantr1008_done
    (rx1005_rep) = rx1005_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1008_done
    rx1005_cur."!mark_push"(rx1005_rep, rx1005_pos, $I10)
    goto rxquantr1008_loop
  rxquantr1008_done:
  # rx pass
    rx1005_cur."!cursor_pass"(rx1005_pos, "ws")
    if_null rx1005_debug, debug_110
    rx1005_cur."!cursor_debug"("PASS", "ws", " at pos=", rx1005_pos)
  debug_110:
    .return (rx1005_cur)
  rx1005_restart:
    if_null rx1005_debug, debug_111
    rx1005_cur."!cursor_debug"("NEXT", "ws")
  debug_111:
  rx1005_fail:
    (rx1005_rep, rx1005_pos, $I10, $P10) = rx1005_cur."!mark_fail"(0)
    lt rx1005_pos, -1, rx1005_done
    eq rx1005_pos, -1, rx1005_fail
    jump $I10
  rx1005_done:
    rx1005_cur."!cursor_fail"()
    if_null rx1005_debug, debug_112
    rx1005_cur."!cursor_debug"("FAIL", "ws")
  debug_112:
    .return (rx1005_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__ws"  :subid("13_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "termish"  :subid("14_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1011_tgt
    .local int rx1011_pos
    .local int rx1011_off
    .local int rx1011_eos
    .local int rx1011_rep
    .local pmc rx1011_cur
    .local pmc rx1011_debug
    (rx1011_cur, rx1011_pos, rx1011_tgt, $I10) = self."!cursor_start"()
    rx1011_cur."!cursor_caparray"("prefixish", "postfixish")
    getattribute rx1011_debug, rx1011_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1011_cur
    .local pmc match
    .lex "$/", match
    length rx1011_eos, rx1011_tgt
    gt rx1011_pos, rx1011_eos, rx1011_done
    set rx1011_off, 0
    lt rx1011_pos, 2, rx1011_start
    sub rx1011_off, rx1011_pos, 1
    substr rx1011_tgt, rx1011_tgt, rx1011_off
  rx1011_start:
    eq $I10, 1, rx1011_restart
    if_null rx1011_debug, debug_113
    rx1011_cur."!cursor_debug"("START", "termish")
  debug_113:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1013_done
    goto rxscan1013_scan
  rxscan1013_loop:
    ($P10) = rx1011_cur."from"()
    inc $P10
    set rx1011_pos, $P10
    ge rx1011_pos, rx1011_eos, rxscan1013_done
  rxscan1013_scan:
    set_addr $I10, rxscan1013_loop
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxscan1013_done:
.annotate 'line', 8
  # rx rxquantr1014 ** 0..*
    set_addr $I10, rxquantr1014_done
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxquantr1014_loop:
  # rx subrule "prefixish" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."prefixish"()
    unless $P10, rx1011_fail
    goto rxsubrule1015_pass
  rxsubrule1015_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1011_fail
  rxsubrule1015_pass:
    set_addr $I10, rxsubrule1015_back
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10, $P10)
    $P10."!cursor_names"("prefixish")
    rx1011_pos = $P10."pos"()
    set_addr $I10, rxquantr1014_done
    (rx1011_rep) = rx1011_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1014_done
    rx1011_cur."!mark_push"(rx1011_rep, rx1011_pos, $I10)
    goto rxquantr1014_loop
  rxquantr1014_done:
.annotate 'line', 9
  # rx subrule "term" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."term"()
    unless $P10, rx1011_fail
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx1011_pos = $P10."pos"()
.annotate 'line', 10
  # rx rxquantr1016 ** 0..*
    set_addr $I10, rxquantr1016_done
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxquantr1016_loop:
  # rx subrule "postfixish" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."postfixish"()
    unless $P10, rx1011_fail
    goto rxsubrule1017_pass
  rxsubrule1017_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1011_fail
  rxsubrule1017_pass:
    set_addr $I10, rxsubrule1017_back
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10, $P10)
    $P10."!cursor_names"("postfixish")
    rx1011_pos = $P10."pos"()
    set_addr $I10, rxquantr1016_done
    (rx1011_rep) = rx1011_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1016_done
    rx1011_cur."!mark_push"(rx1011_rep, rx1011_pos, $I10)
    goto rxquantr1016_loop
  rxquantr1016_done:
.annotate 'line', 7
  # rx pass
    rx1011_cur."!cursor_pass"(rx1011_pos, "termish")
    if_null rx1011_debug, debug_114
    rx1011_cur."!cursor_debug"("PASS", "termish", " at pos=", rx1011_pos)
  debug_114:
    .return (rx1011_cur)
  rx1011_restart:
.annotate 'line', 5
    if_null rx1011_debug, debug_115
    rx1011_cur."!cursor_debug"("NEXT", "termish")
  debug_115:
  rx1011_fail:
    (rx1011_rep, rx1011_pos, $I10, $P10) = rx1011_cur."!mark_fail"(0)
    lt rx1011_pos, -1, rx1011_done
    eq rx1011_pos, -1, rx1011_fail
    jump $I10
  rx1011_done:
    rx1011_cur."!cursor_fail"()
    if_null rx1011_debug, debug_116
    rx1011_cur."!cursor_debug"("FAIL", "termish")
  debug_116:
    .return (rx1011_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__termish"  :subid("15_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "term"  :subid("16_1308504717.31993") :method
.annotate 'line', 13
    $P100 = self."!protoregex"("term")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term"  :subid("17_1308504717.31993") :method
.annotate 'line', 13
    $P101 = self."!PREFIX__!protoregex"("term")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "infix"  :subid("18_1308504717.31993") :method
.annotate 'line', 14
    $P100 = self."!protoregex"("infix")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infix"  :subid("19_1308504717.31993") :method
.annotate 'line', 14
    $P101 = self."!PREFIX__!protoregex"("infix")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "prefix"  :subid("20_1308504717.31993") :method
.annotate 'line', 15
    $P100 = self."!protoregex"("prefix")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefix"  :subid("21_1308504717.31993") :method
.annotate 'line', 15
    $P101 = self."!PREFIX__!protoregex"("prefix")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "postfix"  :subid("22_1308504717.31993") :method
.annotate 'line', 16
    $P100 = self."!protoregex"("postfix")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfix"  :subid("23_1308504717.31993") :method
.annotate 'line', 16
    $P101 = self."!PREFIX__!protoregex"("postfix")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "circumfix"  :subid("24_1308504717.31993") :method
.annotate 'line', 17
    $P100 = self."!protoregex"("circumfix")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__circumfix"  :subid("25_1308504717.31993") :method
.annotate 'line', 17
    $P101 = self."!PREFIX__!protoregex"("circumfix")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "postcircumfix"  :subid("26_1308504717.31993") :method
.annotate 'line', 18
    $P100 = self."!protoregex"("postcircumfix")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postcircumfix"  :subid("27_1308504717.31993") :method
.annotate 'line', 18
    $P101 = self."!PREFIX__!protoregex"("postcircumfix")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "term:sym<circumfix>"  :subid("28_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    .local pmc rx1031_debug
    (rx1031_cur, rx1031_pos, rx1031_tgt, $I10) = self."!cursor_start"()
    getattribute rx1031_debug, rx1031_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1031_cur
    .local pmc match
    .lex "$/", match
    length rx1031_eos, rx1031_tgt
    gt rx1031_pos, rx1031_eos, rx1031_done
    set rx1031_off, 0
    lt rx1031_pos, 2, rx1031_start
    sub rx1031_off, rx1031_pos, 1
    substr rx1031_tgt, rx1031_tgt, rx1031_off
  rx1031_start:
    eq $I10, 1, rx1031_restart
    if_null rx1031_debug, debug_117
    rx1031_cur."!cursor_debug"("START", "term:sym<circumfix>")
  debug_117:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1033_done
    goto rxscan1033_scan
  rxscan1033_loop:
    ($P10) = rx1031_cur."from"()
    inc $P10
    set rx1031_pos, $P10
    ge rx1031_pos, rx1031_eos, rxscan1033_done
  rxscan1033_scan:
    set_addr $I10, rxscan1033_loop
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  rxscan1033_done:
.annotate 'line', 20
  # rx subrule "circumfix" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."circumfix"()
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx1031_pos = $P10."pos"()
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "term:sym<circumfix>")
    if_null rx1031_debug, debug_118
    rx1031_cur."!cursor_debug"("PASS", "term:sym<circumfix>", " at pos=", rx1031_pos)
  debug_118:
    .return (rx1031_cur)
  rx1031_restart:
.annotate 'line', 5
    if_null rx1031_debug, debug_119
    rx1031_cur."!cursor_debug"("NEXT", "term:sym<circumfix>")
  debug_119:
  rx1031_fail:
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    if_null rx1031_debug, debug_120
    rx1031_cur."!cursor_debug"("FAIL", "term:sym<circumfix>")
  debug_120:
    .return (rx1031_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__term:sym<circumfix>"  :subid("29_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("circumfix", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "infixish"  :subid("30_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1035_tgt
    .local int rx1035_pos
    .local int rx1035_off
    .local int rx1035_eos
    .local int rx1035_rep
    .local pmc rx1035_cur
    .local pmc rx1035_debug
    (rx1035_cur, rx1035_pos, rx1035_tgt, $I10) = self."!cursor_start"()
    getattribute rx1035_debug, rx1035_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1035_cur
    .local pmc match
    .lex "$/", match
    length rx1035_eos, rx1035_tgt
    gt rx1035_pos, rx1035_eos, rx1035_done
    set rx1035_off, 0
    lt rx1035_pos, 2, rx1035_start
    sub rx1035_off, rx1035_pos, 1
    substr rx1035_tgt, rx1035_tgt, rx1035_off
  rx1035_start:
    eq $I10, 1, rx1035_restart
    if_null rx1035_debug, debug_121
    rx1035_cur."!cursor_debug"("START", "infixish")
  debug_121:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1037_done
    goto rxscan1037_scan
  rxscan1037_loop:
    ($P10) = rx1035_cur."from"()
    inc $P10
    set rx1035_pos, $P10
    ge rx1035_pos, rx1035_eos, rxscan1037_done
  rxscan1037_scan:
    set_addr $I10, rxscan1037_loop
    rx1035_cur."!mark_push"(0, rx1035_pos, $I10)
  rxscan1037_done:
.annotate 'line', 22
  # rx subrule "infix" subtype=capture negate=
    rx1035_cur."!cursor_pos"(rx1035_pos)
    $P10 = rx1035_cur."infix"()
    unless $P10, rx1035_fail
    rx1035_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx1035_pos = $P10."pos"()
  # rx pass
    rx1035_cur."!cursor_pass"(rx1035_pos, "infixish")
    if_null rx1035_debug, debug_122
    rx1035_cur."!cursor_debug"("PASS", "infixish", " at pos=", rx1035_pos)
  debug_122:
    .return (rx1035_cur)
  rx1035_restart:
.annotate 'line', 5
    if_null rx1035_debug, debug_123
    rx1035_cur."!cursor_debug"("NEXT", "infixish")
  debug_123:
  rx1035_fail:
    (rx1035_rep, rx1035_pos, $I10, $P10) = rx1035_cur."!mark_fail"(0)
    lt rx1035_pos, -1, rx1035_done
    eq rx1035_pos, -1, rx1035_fail
    jump $I10
  rx1035_done:
    rx1035_cur."!cursor_fail"()
    if_null rx1035_debug, debug_124
    rx1035_cur."!cursor_debug"("FAIL", "infixish")
  debug_124:
    .return (rx1035_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__infixish"  :subid("31_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("infix", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "prefixish"  :subid("32_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1039_tgt
    .local int rx1039_pos
    .local int rx1039_off
    .local int rx1039_eos
    .local int rx1039_rep
    .local pmc rx1039_cur
    .local pmc rx1039_debug
    (rx1039_cur, rx1039_pos, rx1039_tgt, $I10) = self."!cursor_start"()
    getattribute rx1039_debug, rx1039_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1039_cur
    .local pmc match
    .lex "$/", match
    length rx1039_eos, rx1039_tgt
    gt rx1039_pos, rx1039_eos, rx1039_done
    set rx1039_off, 0
    lt rx1039_pos, 2, rx1039_start
    sub rx1039_off, rx1039_pos, 1
    substr rx1039_tgt, rx1039_tgt, rx1039_off
  rx1039_start:
    eq $I10, 1, rx1039_restart
    if_null rx1039_debug, debug_125
    rx1039_cur."!cursor_debug"("START", "prefixish")
  debug_125:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1041_done
    goto rxscan1041_scan
  rxscan1041_loop:
    ($P10) = rx1039_cur."from"()
    inc $P10
    set rx1039_pos, $P10
    ge rx1039_pos, rx1039_eos, rxscan1041_done
  rxscan1041_scan:
    set_addr $I10, rxscan1041_loop
    rx1039_cur."!mark_push"(0, rx1039_pos, $I10)
  rxscan1041_done:
.annotate 'line', 23
  # rx subrule "prefix" subtype=capture negate=
    rx1039_cur."!cursor_pos"(rx1039_pos)
    $P10 = rx1039_cur."prefix"()
    unless $P10, rx1039_fail
    rx1039_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=prefix")
    rx1039_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1039_cur."!cursor_pos"(rx1039_pos)
    $P10 = rx1039_cur."ws"()
    unless $P10, rx1039_fail
    rx1039_pos = $P10."pos"()
  # rx pass
    rx1039_cur."!cursor_pass"(rx1039_pos, "prefixish")
    if_null rx1039_debug, debug_126
    rx1039_cur."!cursor_debug"("PASS", "prefixish", " at pos=", rx1039_pos)
  debug_126:
    .return (rx1039_cur)
  rx1039_restart:
.annotate 'line', 5
    if_null rx1039_debug, debug_127
    rx1039_cur."!cursor_debug"("NEXT", "prefixish")
  debug_127:
  rx1039_fail:
    (rx1039_rep, rx1039_pos, $I10, $P10) = rx1039_cur."!mark_fail"(0)
    lt rx1039_pos, -1, rx1039_done
    eq rx1039_pos, -1, rx1039_fail
    jump $I10
  rx1039_done:
    rx1039_cur."!cursor_fail"()
    if_null rx1039_debug, debug_128
    rx1039_cur."!cursor_debug"("FAIL", "prefixish")
  debug_128:
    .return (rx1039_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__prefixish"  :subid("33_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("prefix", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "postfixish"  :subid("34_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1043_tgt
    .local int rx1043_pos
    .local int rx1043_off
    .local int rx1043_eos
    .local int rx1043_rep
    .local pmc rx1043_cur
    .local pmc rx1043_debug
    (rx1043_cur, rx1043_pos, rx1043_tgt, $I10) = self."!cursor_start"()
    getattribute rx1043_debug, rx1043_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1043_cur
    .local pmc match
    .lex "$/", match
    length rx1043_eos, rx1043_tgt
    gt rx1043_pos, rx1043_eos, rx1043_done
    set rx1043_off, 0
    lt rx1043_pos, 2, rx1043_start
    sub rx1043_off, rx1043_pos, 1
    substr rx1043_tgt, rx1043_tgt, rx1043_off
  rx1043_start:
    eq $I10, 1, rx1043_restart
    if_null rx1043_debug, debug_129
    rx1043_cur."!cursor_debug"("START", "postfixish")
  debug_129:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1045_done
    goto rxscan1045_scan
  rxscan1045_loop:
    ($P10) = rx1043_cur."from"()
    inc $P10
    set rx1043_pos, $P10
    ge rx1043_pos, rx1043_eos, rxscan1045_done
  rxscan1045_scan:
    set_addr $I10, rxscan1045_loop
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
  rxscan1045_done:
  alt1046_0:
.annotate 'line', 24
    set_addr $I10, alt1046_1
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
.annotate 'line', 25
  # rx subrule "postfix" subtype=capture negate=
    rx1043_cur."!cursor_pos"(rx1043_pos)
    $P10 = rx1043_cur."postfix"()
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postfix")
    rx1043_pos = $P10."pos"()
    goto alt1046_end
  alt1046_1:
.annotate 'line', 26
  # rx subrule "postcircumfix" subtype=capture negate=
    rx1043_cur."!cursor_pos"(rx1043_pos)
    $P10 = rx1043_cur."postcircumfix"()
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=postcircumfix")
    rx1043_pos = $P10."pos"()
  alt1046_end:
.annotate 'line', 24
  # rx pass
    rx1043_cur."!cursor_pass"(rx1043_pos, "postfixish")
    if_null rx1043_debug, debug_130
    rx1043_cur."!cursor_debug"("PASS", "postfixish", " at pos=", rx1043_pos)
  debug_130:
    .return (rx1043_cur)
  rx1043_restart:
.annotate 'line', 5
    if_null rx1043_debug, debug_131
    rx1043_cur."!cursor_debug"("NEXT", "postfixish")
  debug_131:
  rx1043_fail:
    (rx1043_rep, rx1043_pos, $I10, $P10) = rx1043_cur."!mark_fail"(0)
    lt rx1043_pos, -1, rx1043_done
    eq rx1043_pos, -1, rx1043_fail
    jump $I10
  rx1043_done:
    rx1043_cur."!cursor_fail"()
    if_null rx1043_debug, debug_132
    rx1043_cur."!cursor_debug"("FAIL", "postfixish")
  debug_132:
    .return (rx1043_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__postfixish"  :subid("35_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("postcircumfix", "")
    $P101 = self."!PREFIX__!subrule"("postfix", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm"  :subid("36_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1048_tgt
    .local int rx1048_pos
    .local int rx1048_off
    .local int rx1048_eos
    .local int rx1048_rep
    .local pmc rx1048_cur
    .local pmc rx1048_debug
    (rx1048_cur, rx1048_pos, rx1048_tgt, $I10) = self."!cursor_start"()
    getattribute rx1048_debug, rx1048_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1048_cur
    .local pmc match
    .lex "$/", match
    length rx1048_eos, rx1048_tgt
    gt rx1048_pos, rx1048_eos, rx1048_done
    set rx1048_off, 0
    lt rx1048_pos, 2, rx1048_start
    sub rx1048_off, rx1048_pos, 1
    substr rx1048_tgt, rx1048_tgt, rx1048_off
  rx1048_start:
    eq $I10, 1, rx1048_restart
    if_null rx1048_debug, debug_133
    rx1048_cur."!cursor_debug"("START", "nullterm")
  debug_133:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1050_done
    goto rxscan1050_scan
  rxscan1050_loop:
    ($P10) = rx1048_cur."from"()
    inc $P10
    set rx1048_pos, $P10
    ge rx1048_pos, rx1048_eos, rxscan1050_done
  rxscan1050_scan:
    set_addr $I10, rxscan1050_loop
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
  rxscan1050_done:
.annotate 'line', 29
  # rx pass
    rx1048_cur."!cursor_pass"(rx1048_pos, "nullterm")
    if_null rx1048_debug, debug_134
    rx1048_cur."!cursor_debug"("PASS", "nullterm", " at pos=", rx1048_pos)
  debug_134:
    .return (rx1048_cur)
  rx1048_restart:
.annotate 'line', 5
    if_null rx1048_debug, debug_135
    rx1048_cur."!cursor_debug"("NEXT", "nullterm")
  debug_135:
  rx1048_fail:
    (rx1048_rep, rx1048_pos, $I10, $P10) = rx1048_cur."!mark_fail"(0)
    lt rx1048_pos, -1, rx1048_done
    eq rx1048_pos, -1, rx1048_fail
    jump $I10
  rx1048_done:
    rx1048_cur."!cursor_fail"()
    if_null rx1048_debug, debug_136
    rx1048_cur."!cursor_debug"("FAIL", "nullterm")
  debug_136:
    .return (rx1048_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm"  :subid("37_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "nullterm_alt"  :subid("38_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1052_tgt
    .local int rx1052_pos
    .local int rx1052_off
    .local int rx1052_eos
    .local int rx1052_rep
    .local pmc rx1052_cur
    .local pmc rx1052_debug
    (rx1052_cur, rx1052_pos, rx1052_tgt, $I10) = self."!cursor_start"()
    getattribute rx1052_debug, rx1052_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1052_cur
    .local pmc match
    .lex "$/", match
    length rx1052_eos, rx1052_tgt
    gt rx1052_pos, rx1052_eos, rx1052_done
    set rx1052_off, 0
    lt rx1052_pos, 2, rx1052_start
    sub rx1052_off, rx1052_pos, 1
    substr rx1052_tgt, rx1052_tgt, rx1052_off
  rx1052_start:
    eq $I10, 1, rx1052_restart
    if_null rx1052_debug, debug_137
    rx1052_cur."!cursor_debug"("START", "nullterm_alt")
  debug_137:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1054_done
    goto rxscan1054_scan
  rxscan1054_loop:
    ($P10) = rx1052_cur."from"()
    inc $P10
    set rx1052_pos, $P10
    ge rx1052_pos, rx1052_eos, rxscan1054_done
  rxscan1054_scan:
    set_addr $I10, rxscan1054_loop
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  rxscan1054_done:
.annotate 'line', 30
  # rx subrule "nullterm" subtype=capture negate=
    rx1052_cur."!cursor_pos"(rx1052_pos)
    $P10 = rx1052_cur."nullterm"()
    unless $P10, rx1052_fail
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("term")
    rx1052_pos = $P10."pos"()
  # rx pass
    rx1052_cur."!cursor_pass"(rx1052_pos, "nullterm_alt")
    if_null rx1052_debug, debug_138
    rx1052_cur."!cursor_debug"("PASS", "nullterm_alt", " at pos=", rx1052_pos)
  debug_138:
    .return (rx1052_cur)
  rx1052_restart:
.annotate 'line', 5
    if_null rx1052_debug, debug_139
    rx1052_cur."!cursor_debug"("NEXT", "nullterm_alt")
  debug_139:
  rx1052_fail:
    (rx1052_rep, rx1052_pos, $I10, $P10) = rx1052_cur."!mark_fail"(0)
    lt rx1052_pos, -1, rx1052_done
    eq rx1052_pos, -1, rx1052_fail
    jump $I10
  rx1052_done:
    rx1052_cur."!cursor_fail"()
    if_null rx1052_debug, debug_140
    rx1052_cur."!cursor_debug"("FAIL", "nullterm_alt")
  debug_140:
    .return (rx1052_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__nullterm_alt"  :subid("39_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("nullterm", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.include "except_types.pasm"
.sub "nulltermish"  :subid("40_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 33
    new $P1057, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1057, control_1056
    push_eh $P1057
    .lex "self", self
    find_lex $P101, "self"
    $P102 = $P101."termish"()
    unless $P102, unless_1058
    set $P100, $P102
    goto unless_1058_end
  unless_1058:
    find_lex $P103, "self"
    $P104 = $P103."nullterm_alt"()
    set $P100, $P104
  unless_1058_end:
    .return ($P100)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_delimited"  :subid("41_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1060_tgt
    .local int rx1060_pos
    .local int rx1060_off
    .local int rx1060_eos
    .local int rx1060_rep
    .local pmc rx1060_cur
    .local pmc rx1060_debug
    (rx1060_cur, rx1060_pos, rx1060_tgt, $I10) = self."!cursor_start"()
    rx1060_cur."!cursor_caparray"("quote_atom")
    getattribute rx1060_debug, rx1060_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1060_cur
    .local pmc match
    .lex "$/", match
    length rx1060_eos, rx1060_tgt
    gt rx1060_pos, rx1060_eos, rx1060_done
    set rx1060_off, 0
    lt rx1060_pos, 2, rx1060_start
    sub rx1060_off, rx1060_pos, 1
    substr rx1060_tgt, rx1060_tgt, rx1060_off
  rx1060_start:
    eq $I10, 1, rx1060_restart
    if_null rx1060_debug, debug_141
    rx1060_cur."!cursor_debug"("START", "quote_delimited")
  debug_141:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1062_done
    goto rxscan1062_scan
  rxscan1062_loop:
    ($P10) = rx1060_cur."from"()
    inc $P10
    set rx1060_pos, $P10
    ge rx1060_pos, rx1060_eos, rxscan1062_done
  rxscan1062_scan:
    set_addr $I10, rxscan1062_loop
    rx1060_cur."!mark_push"(0, rx1060_pos, $I10)
  rxscan1062_done:
.annotate 'line', 37
  # rx subrule "starter" subtype=capture negate=
    rx1060_cur."!cursor_pos"(rx1060_pos)
    $P10 = rx1060_cur."starter"()
    unless $P10, rx1060_fail
    rx1060_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("starter")
    rx1060_pos = $P10."pos"()
  # rx rxquantr1063 ** 0..*
    set_addr $I10, rxquantr1063_done
    rx1060_cur."!mark_push"(0, rx1060_pos, $I10)
  rxquantr1063_loop:
  # rx subrule "quote_atom" subtype=capture negate=
    rx1060_cur."!cursor_pos"(rx1060_pos)
    $P10 = rx1060_cur."quote_atom"()
    unless $P10, rx1060_fail
    goto rxsubrule1064_pass
  rxsubrule1064_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1060_fail
  rxsubrule1064_pass:
    set_addr $I10, rxsubrule1064_back
    rx1060_cur."!mark_push"(0, rx1060_pos, $I10, $P10)
    $P10."!cursor_names"("quote_atom")
    rx1060_pos = $P10."pos"()
    set_addr $I10, rxquantr1063_done
    (rx1060_rep) = rx1060_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1063_done
    rx1060_cur."!mark_push"(rx1060_rep, rx1060_pos, $I10)
    goto rxquantr1063_loop
  rxquantr1063_done:
  # rx subrule "stopper" subtype=capture negate=
    rx1060_cur."!cursor_pos"(rx1060_pos)
    $P10 = rx1060_cur."stopper"()
    unless $P10, rx1060_fail
    rx1060_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx1060_pos = $P10."pos"()
.annotate 'line', 36
  # rx pass
    rx1060_cur."!cursor_pass"(rx1060_pos, "quote_delimited")
    if_null rx1060_debug, debug_142
    rx1060_cur."!cursor_debug"("PASS", "quote_delimited", " at pos=", rx1060_pos)
  debug_142:
    .return (rx1060_cur)
  rx1060_restart:
.annotate 'line', 5
    if_null rx1060_debug, debug_143
    rx1060_cur."!cursor_debug"("NEXT", "quote_delimited")
  debug_143:
  rx1060_fail:
    (rx1060_rep, rx1060_pos, $I10, $P10) = rx1060_cur."!mark_fail"(0)
    lt rx1060_pos, -1, rx1060_done
    eq rx1060_pos, -1, rx1060_fail
    jump $I10
  rx1060_done:
    rx1060_cur."!cursor_fail"()
    if_null rx1060_debug, debug_144
    rx1060_cur."!cursor_debug"("FAIL", "quote_delimited")
  debug_144:
    .return (rx1060_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_delimited"  :subid("42_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("starter", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_atom"  :subid("43_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1066_tgt
    .local int rx1066_pos
    .local int rx1066_off
    .local int rx1066_eos
    .local int rx1066_rep
    .local pmc rx1066_cur
    .local pmc rx1066_debug
    (rx1066_cur, rx1066_pos, rx1066_tgt, $I10) = self."!cursor_start"()
    getattribute rx1066_debug, rx1066_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1066_cur
    .local pmc match
    .lex "$/", match
    length rx1066_eos, rx1066_tgt
    gt rx1066_pos, rx1066_eos, rx1066_done
    set rx1066_off, 0
    lt rx1066_pos, 2, rx1066_start
    sub rx1066_off, rx1066_pos, 1
    substr rx1066_tgt, rx1066_tgt, rx1066_off
  rx1066_start:
    eq $I10, 1, rx1066_restart
    if_null rx1066_debug, debug_145
    rx1066_cur."!cursor_debug"("START", "quote_atom")
  debug_145:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1068_done
    goto rxscan1068_scan
  rxscan1068_loop:
    ($P10) = rx1066_cur."from"()
    inc $P10
    set rx1066_pos, $P10
    ge rx1066_pos, rx1066_eos, rxscan1068_done
  rxscan1068_scan:
    set_addr $I10, rxscan1068_loop
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  rxscan1068_done:
.annotate 'line', 41
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx1066_cur."!cursor_pos"(rx1066_pos)
    $P10 = rx1066_cur."stopper"()
    if $P10, rx1066_fail
  alt1069_0:
.annotate 'line', 42
    set_addr $I10, alt1069_1
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
.annotate 'line', 43
  # rx subrule "quote_escape" subtype=capture negate=
    rx1066_cur."!cursor_pos"(rx1066_pos)
    $P10 = rx1066_cur."quote_escape"()
    unless $P10, rx1066_fail
    rx1066_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_escape")
    rx1066_pos = $P10."pos"()
    goto alt1069_end
  alt1069_1:
.annotate 'line', 44
  # rx rxquantr1070 ** 1..*
    set_addr $I10, rxquantr1070_done
    rx1066_cur."!mark_push"(0, -1, $I10)
  rxquantr1070_loop:
  # rx subrule "stopper" subtype=zerowidth negate=1
    rx1066_cur."!cursor_pos"(rx1066_pos)
    $P10 = rx1066_cur."stopper"()
    if $P10, rx1066_fail
  # rx subrule "quote_escape" subtype=zerowidth negate=1
    rx1066_cur."!cursor_pos"(rx1066_pos)
    $P10 = rx1066_cur."quote_escape"()
    if $P10, rx1066_fail
  # rx charclass .
    ge rx1066_pos, rx1066_eos, rx1066_fail
    inc rx1066_pos
    set_addr $I10, rxquantr1070_done
    (rx1066_rep) = rx1066_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1070_done
    rx1066_cur."!mark_push"(rx1066_rep, rx1066_pos, $I10)
    goto rxquantr1070_loop
  rxquantr1070_done:
  alt1069_end:
.annotate 'line', 40
  # rx pass
    rx1066_cur."!cursor_pass"(rx1066_pos, "quote_atom")
    if_null rx1066_debug, debug_146
    rx1066_cur."!cursor_debug"("PASS", "quote_atom", " at pos=", rx1066_pos)
  debug_146:
    .return (rx1066_cur)
  rx1066_restart:
.annotate 'line', 5
    if_null rx1066_debug, debug_147
    rx1066_cur."!cursor_debug"("NEXT", "quote_atom")
  debug_147:
  rx1066_fail:
    (rx1066_rep, rx1066_pos, $I10, $P10) = rx1066_cur."!mark_fail"(0)
    lt rx1066_pos, -1, rx1066_done
    eq rx1066_pos, -1, rx1066_fail
    jump $I10
  rx1066_done:
    rx1066_cur."!cursor_fail"()
    if_null rx1066_debug, debug_148
    rx1066_cur."!cursor_debug"("FAIL", "quote_atom")
  debug_148:
    .return (rx1066_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_atom"  :subid("44_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "decint"  :subid("45_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1072_tgt
    .local int rx1072_pos
    .local int rx1072_off
    .local int rx1072_eos
    .local int rx1072_rep
    .local pmc rx1072_cur
    .local pmc rx1072_debug
    (rx1072_cur, rx1072_pos, rx1072_tgt, $I10) = self."!cursor_start"()
    getattribute rx1072_debug, rx1072_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1072_cur
    .local pmc match
    .lex "$/", match
    length rx1072_eos, rx1072_tgt
    gt rx1072_pos, rx1072_eos, rx1072_done
    set rx1072_off, 0
    lt rx1072_pos, 2, rx1072_start
    sub rx1072_off, rx1072_pos, 1
    substr rx1072_tgt, rx1072_tgt, rx1072_off
  rx1072_start:
    eq $I10, 1, rx1072_restart
    if_null rx1072_debug, debug_149
    rx1072_cur."!cursor_debug"("START", "decint")
  debug_149:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1074_done
    goto rxscan1074_scan
  rxscan1074_loop:
    ($P10) = rx1072_cur."from"()
    inc $P10
    set rx1072_pos, $P10
    ge rx1072_pos, rx1072_eos, rxscan1074_done
  rxscan1074_scan:
    set_addr $I10, rxscan1074_loop
    rx1072_cur."!mark_push"(0, rx1072_pos, $I10)
  rxscan1074_done:
.annotate 'line', 48
  # rx rxquantr1075 ** 1..*
    set_addr $I10, rxquantr1075_done
    rx1072_cur."!mark_push"(0, -1, $I10)
  rxquantr1075_loop:
  # rx charclass_q d r 1..-1
    sub $I10, rx1072_pos, rx1072_off
    find_not_cclass $I11, 8, rx1072_tgt, $I10, rx1072_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1072_fail
    add rx1072_pos, rx1072_off, $I11
    set_addr $I10, rxquantr1075_done
    (rx1072_rep) = rx1072_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1075_done
    rx1072_cur."!mark_push"(rx1072_rep, rx1072_pos, $I10)
  # rx literal  "_"
    add $I11, rx1072_pos, 1
    gt $I11, rx1072_eos, rx1072_fail
    sub $I11, rx1072_pos, rx1072_off
    ord $I11, rx1072_tgt, $I11
    ne $I11, 95, rx1072_fail
    add rx1072_pos, 1
    goto rxquantr1075_loop
  rxquantr1075_done:
  # rx pass
    rx1072_cur."!cursor_pass"(rx1072_pos, "decint")
    if_null rx1072_debug, debug_150
    rx1072_cur."!cursor_debug"("PASS", "decint", " at pos=", rx1072_pos)
  debug_150:
    .return (rx1072_cur)
  rx1072_restart:
.annotate 'line', 5
    if_null rx1072_debug, debug_151
    rx1072_cur."!cursor_debug"("NEXT", "decint")
  debug_151:
  rx1072_fail:
    (rx1072_rep, rx1072_pos, $I10, $P10) = rx1072_cur."!mark_fail"(0)
    lt rx1072_pos, -1, rx1072_done
    eq rx1072_pos, -1, rx1072_fail
    jump $I10
  rx1072_done:
    rx1072_cur."!cursor_fail"()
    if_null rx1072_debug, debug_152
    rx1072_cur."!cursor_debug"("FAIL", "decint")
  debug_152:
    .return (rx1072_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decint"  :subid("46_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "decints"  :subid("47_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1077_tgt
    .local int rx1077_pos
    .local int rx1077_off
    .local int rx1077_eos
    .local int rx1077_rep
    .local pmc rx1077_cur
    .local pmc rx1077_debug
    (rx1077_cur, rx1077_pos, rx1077_tgt, $I10) = self."!cursor_start"()
    rx1077_cur."!cursor_caparray"("decint")
    getattribute rx1077_debug, rx1077_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1077_cur
    .local pmc match
    .lex "$/", match
    length rx1077_eos, rx1077_tgt
    gt rx1077_pos, rx1077_eos, rx1077_done
    set rx1077_off, 0
    lt rx1077_pos, 2, rx1077_start
    sub rx1077_off, rx1077_pos, 1
    substr rx1077_tgt, rx1077_tgt, rx1077_off
  rx1077_start:
    eq $I10, 1, rx1077_restart
    if_null rx1077_debug, debug_153
    rx1077_cur."!cursor_debug"("START", "decints")
  debug_153:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1079_done
    goto rxscan1079_scan
  rxscan1079_loop:
    ($P10) = rx1077_cur."from"()
    inc $P10
    set rx1077_pos, $P10
    ge rx1077_pos, rx1077_eos, rxscan1079_done
  rxscan1079_scan:
    set_addr $I10, rxscan1079_loop
    rx1077_cur."!mark_push"(0, rx1077_pos, $I10)
  rxscan1079_done:
.annotate 'line', 49
  # rx rxquantr1080 ** 1..*
    set_addr $I10, rxquantr1080_done
    rx1077_cur."!mark_push"(0, -1, $I10)
  rxquantr1080_loop:
  # rx subrule "ws" subtype=method negate=
    rx1077_cur."!cursor_pos"(rx1077_pos)
    $P10 = rx1077_cur."ws"()
    unless $P10, rx1077_fail
    rx1077_pos = $P10."pos"()
  # rx subrule "decint" subtype=capture negate=
    rx1077_cur."!cursor_pos"(rx1077_pos)
    $P10 = rx1077_cur."decint"()
    unless $P10, rx1077_fail
    rx1077_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("decint")
    rx1077_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1077_cur."!cursor_pos"(rx1077_pos)
    $P10 = rx1077_cur."ws"()
    unless $P10, rx1077_fail
    rx1077_pos = $P10."pos"()
    set_addr $I10, rxquantr1080_done
    (rx1077_rep) = rx1077_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1080_done
    rx1077_cur."!mark_push"(rx1077_rep, rx1077_pos, $I10)
  # rx literal  ","
    add $I11, rx1077_pos, 1
    gt $I11, rx1077_eos, rx1077_fail
    sub $I11, rx1077_pos, rx1077_off
    ord $I11, rx1077_tgt, $I11
    ne $I11, 44, rx1077_fail
    add rx1077_pos, 1
    goto rxquantr1080_loop
  rxquantr1080_done:
  # rx pass
    rx1077_cur."!cursor_pass"(rx1077_pos, "decints")
    if_null rx1077_debug, debug_154
    rx1077_cur."!cursor_debug"("PASS", "decints", " at pos=", rx1077_pos)
  debug_154:
    .return (rx1077_cur)
  rx1077_restart:
.annotate 'line', 5
    if_null rx1077_debug, debug_155
    rx1077_cur."!cursor_debug"("NEXT", "decints")
  debug_155:
  rx1077_fail:
    (rx1077_rep, rx1077_pos, $I10, $P10) = rx1077_cur."!mark_fail"(0)
    lt rx1077_pos, -1, rx1077_done
    eq rx1077_pos, -1, rx1077_fail
    jump $I10
  rx1077_done:
    rx1077_cur."!cursor_fail"()
    if_null rx1077_debug, debug_156
    rx1077_cur."!cursor_debug"("FAIL", "decints")
  debug_156:
    .return (rx1077_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__decints"  :subid("48_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "hexint"  :subid("49_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1082_tgt
    .local int rx1082_pos
    .local int rx1082_off
    .local int rx1082_eos
    .local int rx1082_rep
    .local pmc rx1082_cur
    .local pmc rx1082_debug
    (rx1082_cur, rx1082_pos, rx1082_tgt, $I10) = self."!cursor_start"()
    getattribute rx1082_debug, rx1082_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1082_cur
    .local pmc match
    .lex "$/", match
    length rx1082_eos, rx1082_tgt
    gt rx1082_pos, rx1082_eos, rx1082_done
    set rx1082_off, 0
    lt rx1082_pos, 2, rx1082_start
    sub rx1082_off, rx1082_pos, 1
    substr rx1082_tgt, rx1082_tgt, rx1082_off
  rx1082_start:
    eq $I10, 1, rx1082_restart
    if_null rx1082_debug, debug_157
    rx1082_cur."!cursor_debug"("START", "hexint")
  debug_157:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1084_done
    goto rxscan1084_scan
  rxscan1084_loop:
    ($P10) = rx1082_cur."from"()
    inc $P10
    set rx1082_pos, $P10
    ge rx1082_pos, rx1082_eos, rxscan1084_done
  rxscan1084_scan:
    set_addr $I10, rxscan1084_loop
    rx1082_cur."!mark_push"(0, rx1082_pos, $I10)
  rxscan1084_done:
.annotate 'line', 51
  # rx rxquantr1085 ** 1..*
    set_addr $I10, rxquantr1085_done
    rx1082_cur."!mark_push"(0, -1, $I10)
  rxquantr1085_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1082_pos, rx1082_off
    set rx1082_rep, 0
    sub $I12, rx1082_eos, rx1082_pos
  rxenumcharlistq1086_loop:
    le $I12, 0, rxenumcharlistq1086_done
    substr $S10, rx1082_tgt, $I10, 1
    index $I11, "0123456789abcdefABCDEF", $S10
    lt $I11, 0, rxenumcharlistq1086_done
    inc rx1082_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1086_loop
  rxenumcharlistq1086_done:
    lt rx1082_rep, 1, rx1082_fail
    add rx1082_pos, rx1082_pos, rx1082_rep
    set_addr $I10, rxquantr1085_done
    (rx1082_rep) = rx1082_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1085_done
    rx1082_cur."!mark_push"(rx1082_rep, rx1082_pos, $I10)
  # rx literal  "_"
    add $I11, rx1082_pos, 1
    gt $I11, rx1082_eos, rx1082_fail
    sub $I11, rx1082_pos, rx1082_off
    ord $I11, rx1082_tgt, $I11
    ne $I11, 95, rx1082_fail
    add rx1082_pos, 1
    goto rxquantr1085_loop
  rxquantr1085_done:
  # rx pass
    rx1082_cur."!cursor_pass"(rx1082_pos, "hexint")
    if_null rx1082_debug, debug_158
    rx1082_cur."!cursor_debug"("PASS", "hexint", " at pos=", rx1082_pos)
  debug_158:
    .return (rx1082_cur)
  rx1082_restart:
.annotate 'line', 5
    if_null rx1082_debug, debug_159
    rx1082_cur."!cursor_debug"("NEXT", "hexint")
  debug_159:
  rx1082_fail:
    (rx1082_rep, rx1082_pos, $I10, $P10) = rx1082_cur."!mark_fail"(0)
    lt rx1082_pos, -1, rx1082_done
    eq rx1082_pos, -1, rx1082_fail
    jump $I10
  rx1082_done:
    rx1082_cur."!cursor_fail"()
    if_null rx1082_debug, debug_160
    rx1082_cur."!cursor_debug"("FAIL", "hexint")
  debug_160:
    .return (rx1082_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexint"  :subid("50_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "hexints"  :subid("51_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1088_tgt
    .local int rx1088_pos
    .local int rx1088_off
    .local int rx1088_eos
    .local int rx1088_rep
    .local pmc rx1088_cur
    .local pmc rx1088_debug
    (rx1088_cur, rx1088_pos, rx1088_tgt, $I10) = self."!cursor_start"()
    rx1088_cur."!cursor_caparray"("hexint")
    getattribute rx1088_debug, rx1088_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1088_cur
    .local pmc match
    .lex "$/", match
    length rx1088_eos, rx1088_tgt
    gt rx1088_pos, rx1088_eos, rx1088_done
    set rx1088_off, 0
    lt rx1088_pos, 2, rx1088_start
    sub rx1088_off, rx1088_pos, 1
    substr rx1088_tgt, rx1088_tgt, rx1088_off
  rx1088_start:
    eq $I10, 1, rx1088_restart
    if_null rx1088_debug, debug_161
    rx1088_cur."!cursor_debug"("START", "hexints")
  debug_161:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1090_done
    goto rxscan1090_scan
  rxscan1090_loop:
    ($P10) = rx1088_cur."from"()
    inc $P10
    set rx1088_pos, $P10
    ge rx1088_pos, rx1088_eos, rxscan1090_done
  rxscan1090_scan:
    set_addr $I10, rxscan1090_loop
    rx1088_cur."!mark_push"(0, rx1088_pos, $I10)
  rxscan1090_done:
.annotate 'line', 52
  # rx rxquantr1091 ** 1..*
    set_addr $I10, rxquantr1091_done
    rx1088_cur."!mark_push"(0, -1, $I10)
  rxquantr1091_loop:
  # rx subrule "ws" subtype=method negate=
    rx1088_cur."!cursor_pos"(rx1088_pos)
    $P10 = rx1088_cur."ws"()
    unless $P10, rx1088_fail
    rx1088_pos = $P10."pos"()
  # rx subrule "hexint" subtype=capture negate=
    rx1088_cur."!cursor_pos"(rx1088_pos)
    $P10 = rx1088_cur."hexint"()
    unless $P10, rx1088_fail
    rx1088_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx1088_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1088_cur."!cursor_pos"(rx1088_pos)
    $P10 = rx1088_cur."ws"()
    unless $P10, rx1088_fail
    rx1088_pos = $P10."pos"()
    set_addr $I10, rxquantr1091_done
    (rx1088_rep) = rx1088_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1091_done
    rx1088_cur."!mark_push"(rx1088_rep, rx1088_pos, $I10)
  # rx literal  ","
    add $I11, rx1088_pos, 1
    gt $I11, rx1088_eos, rx1088_fail
    sub $I11, rx1088_pos, rx1088_off
    ord $I11, rx1088_tgt, $I11
    ne $I11, 44, rx1088_fail
    add rx1088_pos, 1
    goto rxquantr1091_loop
  rxquantr1091_done:
  # rx pass
    rx1088_cur."!cursor_pass"(rx1088_pos, "hexints")
    if_null rx1088_debug, debug_162
    rx1088_cur."!cursor_debug"("PASS", "hexints", " at pos=", rx1088_pos)
  debug_162:
    .return (rx1088_cur)
  rx1088_restart:
.annotate 'line', 5
    if_null rx1088_debug, debug_163
    rx1088_cur."!cursor_debug"("NEXT", "hexints")
  debug_163:
  rx1088_fail:
    (rx1088_rep, rx1088_pos, $I10, $P10) = rx1088_cur."!mark_fail"(0)
    lt rx1088_pos, -1, rx1088_done
    eq rx1088_pos, -1, rx1088_fail
    jump $I10
  rx1088_done:
    rx1088_cur."!cursor_fail"()
    if_null rx1088_debug, debug_164
    rx1088_cur."!cursor_debug"("FAIL", "hexints")
  debug_164:
    .return (rx1088_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__hexints"  :subid("52_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "octint"  :subid("53_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1093_tgt
    .local int rx1093_pos
    .local int rx1093_off
    .local int rx1093_eos
    .local int rx1093_rep
    .local pmc rx1093_cur
    .local pmc rx1093_debug
    (rx1093_cur, rx1093_pos, rx1093_tgt, $I10) = self."!cursor_start"()
    getattribute rx1093_debug, rx1093_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1093_cur
    .local pmc match
    .lex "$/", match
    length rx1093_eos, rx1093_tgt
    gt rx1093_pos, rx1093_eos, rx1093_done
    set rx1093_off, 0
    lt rx1093_pos, 2, rx1093_start
    sub rx1093_off, rx1093_pos, 1
    substr rx1093_tgt, rx1093_tgt, rx1093_off
  rx1093_start:
    eq $I10, 1, rx1093_restart
    if_null rx1093_debug, debug_165
    rx1093_cur."!cursor_debug"("START", "octint")
  debug_165:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1095_done
    goto rxscan1095_scan
  rxscan1095_loop:
    ($P10) = rx1093_cur."from"()
    inc $P10
    set rx1093_pos, $P10
    ge rx1093_pos, rx1093_eos, rxscan1095_done
  rxscan1095_scan:
    set_addr $I10, rxscan1095_loop
    rx1093_cur."!mark_push"(0, rx1093_pos, $I10)
  rxscan1095_done:
.annotate 'line', 54
  # rx rxquantr1096 ** 1..*
    set_addr $I10, rxquantr1096_done
    rx1093_cur."!mark_push"(0, -1, $I10)
  rxquantr1096_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1093_pos, rx1093_off
    set rx1093_rep, 0
    sub $I12, rx1093_eos, rx1093_pos
  rxenumcharlistq1097_loop:
    le $I12, 0, rxenumcharlistq1097_done
    substr $S10, rx1093_tgt, $I10, 1
    index $I11, "01234567", $S10
    lt $I11, 0, rxenumcharlistq1097_done
    inc rx1093_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1097_loop
  rxenumcharlistq1097_done:
    lt rx1093_rep, 1, rx1093_fail
    add rx1093_pos, rx1093_pos, rx1093_rep
    set_addr $I10, rxquantr1096_done
    (rx1093_rep) = rx1093_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1096_done
    rx1093_cur."!mark_push"(rx1093_rep, rx1093_pos, $I10)
  # rx literal  "_"
    add $I11, rx1093_pos, 1
    gt $I11, rx1093_eos, rx1093_fail
    sub $I11, rx1093_pos, rx1093_off
    ord $I11, rx1093_tgt, $I11
    ne $I11, 95, rx1093_fail
    add rx1093_pos, 1
    goto rxquantr1096_loop
  rxquantr1096_done:
  # rx pass
    rx1093_cur."!cursor_pass"(rx1093_pos, "octint")
    if_null rx1093_debug, debug_166
    rx1093_cur."!cursor_debug"("PASS", "octint", " at pos=", rx1093_pos)
  debug_166:
    .return (rx1093_cur)
  rx1093_restart:
.annotate 'line', 5
    if_null rx1093_debug, debug_167
    rx1093_cur."!cursor_debug"("NEXT", "octint")
  debug_167:
  rx1093_fail:
    (rx1093_rep, rx1093_pos, $I10, $P10) = rx1093_cur."!mark_fail"(0)
    lt rx1093_pos, -1, rx1093_done
    eq rx1093_pos, -1, rx1093_fail
    jump $I10
  rx1093_done:
    rx1093_cur."!cursor_fail"()
    if_null rx1093_debug, debug_168
    rx1093_cur."!cursor_debug"("FAIL", "octint")
  debug_168:
    .return (rx1093_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octint"  :subid("54_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "octints"  :subid("55_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1099_tgt
    .local int rx1099_pos
    .local int rx1099_off
    .local int rx1099_eos
    .local int rx1099_rep
    .local pmc rx1099_cur
    .local pmc rx1099_debug
    (rx1099_cur, rx1099_pos, rx1099_tgt, $I10) = self."!cursor_start"()
    rx1099_cur."!cursor_caparray"("octint")
    getattribute rx1099_debug, rx1099_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1099_cur
    .local pmc match
    .lex "$/", match
    length rx1099_eos, rx1099_tgt
    gt rx1099_pos, rx1099_eos, rx1099_done
    set rx1099_off, 0
    lt rx1099_pos, 2, rx1099_start
    sub rx1099_off, rx1099_pos, 1
    substr rx1099_tgt, rx1099_tgt, rx1099_off
  rx1099_start:
    eq $I10, 1, rx1099_restart
    if_null rx1099_debug, debug_169
    rx1099_cur."!cursor_debug"("START", "octints")
  debug_169:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1101_done
    goto rxscan1101_scan
  rxscan1101_loop:
    ($P10) = rx1099_cur."from"()
    inc $P10
    set rx1099_pos, $P10
    ge rx1099_pos, rx1099_eos, rxscan1101_done
  rxscan1101_scan:
    set_addr $I10, rxscan1101_loop
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  rxscan1101_done:
.annotate 'line', 55
  # rx rxquantr1102 ** 1..*
    set_addr $I10, rxquantr1102_done
    rx1099_cur."!mark_push"(0, -1, $I10)
  rxquantr1102_loop:
  # rx subrule "ws" subtype=method negate=
    rx1099_cur."!cursor_pos"(rx1099_pos)
    $P10 = rx1099_cur."ws"()
    unless $P10, rx1099_fail
    rx1099_pos = $P10."pos"()
  # rx subrule "octint" subtype=capture negate=
    rx1099_cur."!cursor_pos"(rx1099_pos)
    $P10 = rx1099_cur."octint"()
    unless $P10, rx1099_fail
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx1099_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1099_cur."!cursor_pos"(rx1099_pos)
    $P10 = rx1099_cur."ws"()
    unless $P10, rx1099_fail
    rx1099_pos = $P10."pos"()
    set_addr $I10, rxquantr1102_done
    (rx1099_rep) = rx1099_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1102_done
    rx1099_cur."!mark_push"(rx1099_rep, rx1099_pos, $I10)
  # rx literal  ","
    add $I11, rx1099_pos, 1
    gt $I11, rx1099_eos, rx1099_fail
    sub $I11, rx1099_pos, rx1099_off
    ord $I11, rx1099_tgt, $I11
    ne $I11, 44, rx1099_fail
    add rx1099_pos, 1
    goto rxquantr1102_loop
  rxquantr1102_done:
  # rx pass
    rx1099_cur."!cursor_pass"(rx1099_pos, "octints")
    if_null rx1099_debug, debug_170
    rx1099_cur."!cursor_debug"("PASS", "octints", " at pos=", rx1099_pos)
  debug_170:
    .return (rx1099_cur)
  rx1099_restart:
.annotate 'line', 5
    if_null rx1099_debug, debug_171
    rx1099_cur."!cursor_debug"("NEXT", "octints")
  debug_171:
  rx1099_fail:
    (rx1099_rep, rx1099_pos, $I10, $P10) = rx1099_cur."!mark_fail"(0)
    lt rx1099_pos, -1, rx1099_done
    eq rx1099_pos, -1, rx1099_fail
    jump $I10
  rx1099_done:
    rx1099_cur."!cursor_fail"()
    if_null rx1099_debug, debug_172
    rx1099_cur."!cursor_debug"("FAIL", "octints")
  debug_172:
    .return (rx1099_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__octints"  :subid("56_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "binint"  :subid("57_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1104_tgt
    .local int rx1104_pos
    .local int rx1104_off
    .local int rx1104_eos
    .local int rx1104_rep
    .local pmc rx1104_cur
    .local pmc rx1104_debug
    (rx1104_cur, rx1104_pos, rx1104_tgt, $I10) = self."!cursor_start"()
    getattribute rx1104_debug, rx1104_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1104_cur
    .local pmc match
    .lex "$/", match
    length rx1104_eos, rx1104_tgt
    gt rx1104_pos, rx1104_eos, rx1104_done
    set rx1104_off, 0
    lt rx1104_pos, 2, rx1104_start
    sub rx1104_off, rx1104_pos, 1
    substr rx1104_tgt, rx1104_tgt, rx1104_off
  rx1104_start:
    eq $I10, 1, rx1104_restart
    if_null rx1104_debug, debug_173
    rx1104_cur."!cursor_debug"("START", "binint")
  debug_173:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1106_done
    goto rxscan1106_scan
  rxscan1106_loop:
    ($P10) = rx1104_cur."from"()
    inc $P10
    set rx1104_pos, $P10
    ge rx1104_pos, rx1104_eos, rxscan1106_done
  rxscan1106_scan:
    set_addr $I10, rxscan1106_loop
    rx1104_cur."!mark_push"(0, rx1104_pos, $I10)
  rxscan1106_done:
.annotate 'line', 57
  # rx rxquantr1107 ** 1..*
    set_addr $I10, rxquantr1107_done
    rx1104_cur."!mark_push"(0, -1, $I10)
  rxquantr1107_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1104_pos, rx1104_off
    set rx1104_rep, 0
    sub $I12, rx1104_eos, rx1104_pos
  rxenumcharlistq1108_loop:
    le $I12, 0, rxenumcharlistq1108_done
    substr $S10, rx1104_tgt, $I10, 1
    index $I11, "01", $S10
    lt $I11, 0, rxenumcharlistq1108_done
    inc rx1104_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1108_loop
  rxenumcharlistq1108_done:
    lt rx1104_rep, 1, rx1104_fail
    add rx1104_pos, rx1104_pos, rx1104_rep
    set_addr $I10, rxquantr1107_done
    (rx1104_rep) = rx1104_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1107_done
    rx1104_cur."!mark_push"(rx1104_rep, rx1104_pos, $I10)
  # rx literal  "_"
    add $I11, rx1104_pos, 1
    gt $I11, rx1104_eos, rx1104_fail
    sub $I11, rx1104_pos, rx1104_off
    ord $I11, rx1104_tgt, $I11
    ne $I11, 95, rx1104_fail
    add rx1104_pos, 1
    goto rxquantr1107_loop
  rxquantr1107_done:
  # rx pass
    rx1104_cur."!cursor_pass"(rx1104_pos, "binint")
    if_null rx1104_debug, debug_174
    rx1104_cur."!cursor_debug"("PASS", "binint", " at pos=", rx1104_pos)
  debug_174:
    .return (rx1104_cur)
  rx1104_restart:
.annotate 'line', 5
    if_null rx1104_debug, debug_175
    rx1104_cur."!cursor_debug"("NEXT", "binint")
  debug_175:
  rx1104_fail:
    (rx1104_rep, rx1104_pos, $I10, $P10) = rx1104_cur."!mark_fail"(0)
    lt rx1104_pos, -1, rx1104_done
    eq rx1104_pos, -1, rx1104_fail
    jump $I10
  rx1104_done:
    rx1104_cur."!cursor_fail"()
    if_null rx1104_debug, debug_176
    rx1104_cur."!cursor_debug"("FAIL", "binint")
  debug_176:
    .return (rx1104_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binint"  :subid("58_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "binints"  :subid("59_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1110_tgt
    .local int rx1110_pos
    .local int rx1110_off
    .local int rx1110_eos
    .local int rx1110_rep
    .local pmc rx1110_cur
    .local pmc rx1110_debug
    (rx1110_cur, rx1110_pos, rx1110_tgt, $I10) = self."!cursor_start"()
    rx1110_cur."!cursor_caparray"("binint")
    getattribute rx1110_debug, rx1110_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1110_cur
    .local pmc match
    .lex "$/", match
    length rx1110_eos, rx1110_tgt
    gt rx1110_pos, rx1110_eos, rx1110_done
    set rx1110_off, 0
    lt rx1110_pos, 2, rx1110_start
    sub rx1110_off, rx1110_pos, 1
    substr rx1110_tgt, rx1110_tgt, rx1110_off
  rx1110_start:
    eq $I10, 1, rx1110_restart
    if_null rx1110_debug, debug_177
    rx1110_cur."!cursor_debug"("START", "binints")
  debug_177:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1112_done
    goto rxscan1112_scan
  rxscan1112_loop:
    ($P10) = rx1110_cur."from"()
    inc $P10
    set rx1110_pos, $P10
    ge rx1110_pos, rx1110_eos, rxscan1112_done
  rxscan1112_scan:
    set_addr $I10, rxscan1112_loop
    rx1110_cur."!mark_push"(0, rx1110_pos, $I10)
  rxscan1112_done:
.annotate 'line', 58
  # rx rxquantr1113 ** 1..*
    set_addr $I10, rxquantr1113_done
    rx1110_cur."!mark_push"(0, -1, $I10)
  rxquantr1113_loop:
  # rx subrule "ws" subtype=method negate=
    rx1110_cur."!cursor_pos"(rx1110_pos)
    $P10 = rx1110_cur."ws"()
    unless $P10, rx1110_fail
    rx1110_pos = $P10."pos"()
  # rx subrule "binint" subtype=capture negate=
    rx1110_cur."!cursor_pos"(rx1110_pos)
    $P10 = rx1110_cur."binint"()
    unless $P10, rx1110_fail
    rx1110_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("binint")
    rx1110_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1110_cur."!cursor_pos"(rx1110_pos)
    $P10 = rx1110_cur."ws"()
    unless $P10, rx1110_fail
    rx1110_pos = $P10."pos"()
    set_addr $I10, rxquantr1113_done
    (rx1110_rep) = rx1110_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1113_done
    rx1110_cur."!mark_push"(rx1110_rep, rx1110_pos, $I10)
  # rx literal  ","
    add $I11, rx1110_pos, 1
    gt $I11, rx1110_eos, rx1110_fail
    sub $I11, rx1110_pos, rx1110_off
    ord $I11, rx1110_tgt, $I11
    ne $I11, 44, rx1110_fail
    add rx1110_pos, 1
    goto rxquantr1113_loop
  rxquantr1113_done:
  # rx pass
    rx1110_cur."!cursor_pass"(rx1110_pos, "binints")
    if_null rx1110_debug, debug_178
    rx1110_cur."!cursor_debug"("PASS", "binints", " at pos=", rx1110_pos)
  debug_178:
    .return (rx1110_cur)
  rx1110_restart:
.annotate 'line', 5
    if_null rx1110_debug, debug_179
    rx1110_cur."!cursor_debug"("NEXT", "binints")
  debug_179:
  rx1110_fail:
    (rx1110_rep, rx1110_pos, $I10, $P10) = rx1110_cur."!mark_fail"(0)
    lt rx1110_pos, -1, rx1110_done
    eq rx1110_pos, -1, rx1110_fail
    jump $I10
  rx1110_done:
    rx1110_cur."!cursor_fail"()
    if_null rx1110_debug, debug_180
    rx1110_cur."!cursor_debug"("FAIL", "binints")
  debug_180:
    .return (rx1110_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__binints"  :subid("60_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "integer"  :subid("61_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1115_tgt
    .local int rx1115_pos
    .local int rx1115_off
    .local int rx1115_eos
    .local int rx1115_rep
    .local pmc rx1115_cur
    .local pmc rx1115_debug
    (rx1115_cur, rx1115_pos, rx1115_tgt, $I10) = self."!cursor_start"()
    getattribute rx1115_debug, rx1115_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1115_cur
    .local pmc match
    .lex "$/", match
    length rx1115_eos, rx1115_tgt
    gt rx1115_pos, rx1115_eos, rx1115_done
    set rx1115_off, 0
    lt rx1115_pos, 2, rx1115_start
    sub rx1115_off, rx1115_pos, 1
    substr rx1115_tgt, rx1115_tgt, rx1115_off
  rx1115_start:
    eq $I10, 1, rx1115_restart
    if_null rx1115_debug, debug_181
    rx1115_cur."!cursor_debug"("START", "integer")
  debug_181:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1117_done
    goto rxscan1117_scan
  rxscan1117_loop:
    ($P10) = rx1115_cur."from"()
    inc $P10
    set rx1115_pos, $P10
    ge rx1115_pos, rx1115_eos, rxscan1117_done
  rxscan1117_scan:
    set_addr $I10, rxscan1117_loop
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
  rxscan1117_done:
  alt1118_0:
.annotate 'line', 61
    set_addr $I10, alt1118_1
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
.annotate 'line', 62
  # rx literal  "0"
    add $I11, rx1115_pos, 1
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    ord $I11, rx1115_tgt, $I11
    ne $I11, 48, rx1115_fail
    add rx1115_pos, 1
  alt1119_0:
    set_addr $I10, alt1119_1
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
  # rx literal  "b"
    add $I11, rx1115_pos, 1
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    ord $I11, rx1115_tgt, $I11
    ne $I11, 98, rx1115_fail
    add rx1115_pos, 1
  # rx subrule "binint" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."binint"()
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=binint")
    rx1115_pos = $P10."pos"()
    goto alt1119_end
  alt1119_1:
    set_addr $I10, alt1119_2
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
.annotate 'line', 63
  # rx literal  "o"
    add $I11, rx1115_pos, 1
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    ord $I11, rx1115_tgt, $I11
    ne $I11, 111, rx1115_fail
    add rx1115_pos, 1
  # rx subrule "octint" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."octint"()
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=octint")
    rx1115_pos = $P10."pos"()
    goto alt1119_end
  alt1119_2:
    set_addr $I10, alt1119_3
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
.annotate 'line', 64
  # rx literal  "x"
    add $I11, rx1115_pos, 1
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    ord $I11, rx1115_tgt, $I11
    ne $I11, 120, rx1115_fail
    add rx1115_pos, 1
  # rx subrule "hexint" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."hexint"()
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=hexint")
    rx1115_pos = $P10."pos"()
    goto alt1119_end
  alt1119_3:
.annotate 'line', 65
  # rx literal  "d"
    add $I11, rx1115_pos, 1
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    ord $I11, rx1115_tgt, $I11
    ne $I11, 100, rx1115_fail
    add rx1115_pos, 1
  # rx subrule "decint" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."decint"()
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx1115_pos = $P10."pos"()
  alt1119_end:
.annotate 'line', 62
    goto alt1118_end
  alt1118_1:
.annotate 'line', 67
  # rx subrule "decint" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."decint"()
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("VALUE=decint")
    rx1115_pos = $P10."pos"()
  alt1118_end:
.annotate 'line', 60
  # rx pass
    rx1115_cur."!cursor_pass"(rx1115_pos, "integer")
    if_null rx1115_debug, debug_182
    rx1115_cur."!cursor_debug"("PASS", "integer", " at pos=", rx1115_pos)
  debug_182:
    .return (rx1115_cur)
  rx1115_restart:
.annotate 'line', 5
    if_null rx1115_debug, debug_183
    rx1115_cur."!cursor_debug"("NEXT", "integer")
  debug_183:
  rx1115_fail:
    (rx1115_rep, rx1115_pos, $I10, $P10) = rx1115_cur."!mark_fail"(0)
    lt rx1115_pos, -1, rx1115_done
    eq rx1115_pos, -1, rx1115_fail
    jump $I10
  rx1115_done:
    rx1115_cur."!cursor_fail"()
    if_null rx1115_debug, debug_184
    rx1115_cur."!cursor_debug"("FAIL", "integer")
  debug_184:
    .return (rx1115_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__integer"  :subid("62_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("decint", "")
    $P101 = self."!PREFIX__!subrule"("decint", "0d")
    $P102 = self."!PREFIX__!subrule"("hexint", "0x")
    $P103 = self."!PREFIX__!subrule"("octint", "0o")
    $P104 = self."!PREFIX__!subrule"("binint", "0b")
    new $P105, "ResizablePMCArray"
    push $P105, $P100
    push $P105, $P101
    push $P105, $P102
    push $P105, $P103
    push $P105, $P104
    .return ($P105)
.end


.namespace ["HLL";"Grammar"]
.sub "dec_number"  :subid("63_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1121_tgt
    .local int rx1121_pos
    .local int rx1121_off
    .local int rx1121_eos
    .local int rx1121_rep
    .local pmc rx1121_cur
    .local pmc rx1121_debug
    (rx1121_cur, rx1121_pos, rx1121_tgt, $I10) = self."!cursor_start"()
    rx1121_cur."!cursor_caparray"("escale")
    getattribute rx1121_debug, rx1121_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1121_cur
    .local pmc match
    .lex "$/", match
    length rx1121_eos, rx1121_tgt
    gt rx1121_pos, rx1121_eos, rx1121_done
    set rx1121_off, 0
    lt rx1121_pos, 2, rx1121_start
    sub rx1121_off, rx1121_pos, 1
    substr rx1121_tgt, rx1121_tgt, rx1121_off
  rx1121_start:
    eq $I10, 1, rx1121_restart
    if_null rx1121_debug, debug_185
    rx1121_cur."!cursor_debug"("START", "dec_number")
  debug_185:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1123_done
    goto rxscan1123_scan
  rxscan1123_loop:
    ($P10) = rx1121_cur."from"()
    inc $P10
    set rx1121_pos, $P10
    ge rx1121_pos, rx1121_eos, rxscan1123_done
  rxscan1123_scan:
    set_addr $I10, rxscan1123_loop
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  rxscan1123_done:
  alt1124_0:
.annotate 'line', 71
    set_addr $I10, alt1124_1
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
.annotate 'line', 72
  # rx subcapture "coeff"
    set_addr $I10, rxcap_1125_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx literal  "."
    add $I11, rx1121_pos, 1
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    ord $I11, rx1121_tgt, $I11
    ne $I11, 46, rx1121_fail
    add rx1121_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx1121_pos, rx1121_off
    find_not_cclass $I11, 8, rx1121_tgt, $I10, rx1121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1121_fail
    add rx1121_pos, rx1121_off, $I11
    set_addr $I10, rxcap_1125_fail
    ($I12, $I11) = rx1121_cur."!mark_peek"($I10)
    rx1121_cur."!cursor_pos"($I11)
    ($P10) = rx1121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1121_pos, "")
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_1125_done
  rxcap_1125_fail:
    goto rx1121_fail
  rxcap_1125_done:
  # rx rxquantr1126 ** 0..1
    set_addr $I10, rxquantr1126_done
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  rxquantr1126_loop:
  # rx subrule "escale" subtype=capture negate=
    rx1121_cur."!cursor_pos"(rx1121_pos)
    $P10 = rx1121_cur."escale"()
    unless $P10, rx1121_fail
    goto rxsubrule1127_pass
  rxsubrule1127_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1121_fail
  rxsubrule1127_pass:
    set_addr $I10, rxsubrule1127_back
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10, $P10)
    $P10."!cursor_names"("escale")
    rx1121_pos = $P10."pos"()
    set_addr $I10, rxquantr1126_done
    (rx1121_rep) = rx1121_cur."!mark_commit"($I10)
  rxquantr1126_done:
    goto alt1124_end
  alt1124_1:
    set_addr $I10, alt1124_2
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
.annotate 'line', 73
  # rx subcapture "coeff"
    set_addr $I10, rxcap_1128_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1121_pos, rx1121_off
    find_not_cclass $I11, 8, rx1121_tgt, $I10, rx1121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1121_fail
    add rx1121_pos, rx1121_off, $I11
  # rx literal  "."
    add $I11, rx1121_pos, 1
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    ord $I11, rx1121_tgt, $I11
    ne $I11, 46, rx1121_fail
    add rx1121_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx1121_pos, rx1121_off
    find_not_cclass $I11, 8, rx1121_tgt, $I10, rx1121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1121_fail
    add rx1121_pos, rx1121_off, $I11
    set_addr $I10, rxcap_1128_fail
    ($I12, $I11) = rx1121_cur."!mark_peek"($I10)
    rx1121_cur."!cursor_pos"($I11)
    ($P10) = rx1121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1121_pos, "")
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_1128_done
  rxcap_1128_fail:
    goto rx1121_fail
  rxcap_1128_done:
  # rx rxquantr1129 ** 0..1
    set_addr $I10, rxquantr1129_done
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  rxquantr1129_loop:
  # rx subrule "escale" subtype=capture negate=
    rx1121_cur."!cursor_pos"(rx1121_pos)
    $P10 = rx1121_cur."escale"()
    unless $P10, rx1121_fail
    goto rxsubrule1130_pass
  rxsubrule1130_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1121_fail
  rxsubrule1130_pass:
    set_addr $I10, rxsubrule1130_back
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10, $P10)
    $P10."!cursor_names"("escale")
    rx1121_pos = $P10."pos"()
    set_addr $I10, rxquantr1129_done
    (rx1121_rep) = rx1121_cur."!mark_commit"($I10)
  rxquantr1129_done:
    goto alt1124_end
  alt1124_2:
.annotate 'line', 74
  # rx subcapture "coeff"
    set_addr $I10, rxcap_1131_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1121_pos, rx1121_off
    find_not_cclass $I11, 8, rx1121_tgt, $I10, rx1121_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1121_fail
    add rx1121_pos, rx1121_off, $I11
    set_addr $I10, rxcap_1131_fail
    ($I12, $I11) = rx1121_cur."!mark_peek"($I10)
    rx1121_cur."!cursor_pos"($I11)
    ($P10) = rx1121_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1121_pos, "")
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("coeff")
    goto rxcap_1131_done
  rxcap_1131_fail:
    goto rx1121_fail
  rxcap_1131_done:
  # rx subrule "escale" subtype=capture negate=
    rx1121_cur."!cursor_pos"(rx1121_pos)
    $P10 = rx1121_cur."escale"()
    unless $P10, rx1121_fail
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("escale")
    rx1121_pos = $P10."pos"()
  alt1124_end:
.annotate 'line', 71
  # rx pass
    rx1121_cur."!cursor_pass"(rx1121_pos, "dec_number")
    if_null rx1121_debug, debug_186
    rx1121_cur."!cursor_debug"("PASS", "dec_number", " at pos=", rx1121_pos)
  debug_186:
    .return (rx1121_cur)
  rx1121_restart:
.annotate 'line', 5
    if_null rx1121_debug, debug_187
    rx1121_cur."!cursor_debug"("NEXT", "dec_number")
  debug_187:
  rx1121_fail:
    (rx1121_rep, rx1121_pos, $I10, $P10) = rx1121_cur."!mark_fail"(0)
    lt rx1121_pos, -1, rx1121_done
    eq rx1121_pos, -1, rx1121_fail
    jump $I10
  rx1121_done:
    rx1121_cur."!cursor_fail"()
    if_null rx1121_debug, debug_188
    rx1121_cur."!cursor_debug"("FAIL", "dec_number")
  debug_188:
    .return (rx1121_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__dec_number"  :subid("64_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    push $P100, ""
    push $P100, "."
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "escale"  :subid("65_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1133_tgt
    .local int rx1133_pos
    .local int rx1133_off
    .local int rx1133_eos
    .local int rx1133_rep
    .local pmc rx1133_cur
    .local pmc rx1133_debug
    (rx1133_cur, rx1133_pos, rx1133_tgt, $I10) = self."!cursor_start"()
    getattribute rx1133_debug, rx1133_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1133_cur
    .local pmc match
    .lex "$/", match
    length rx1133_eos, rx1133_tgt
    gt rx1133_pos, rx1133_eos, rx1133_done
    set rx1133_off, 0
    lt rx1133_pos, 2, rx1133_start
    sub rx1133_off, rx1133_pos, 1
    substr rx1133_tgt, rx1133_tgt, rx1133_off
  rx1133_start:
    eq $I10, 1, rx1133_restart
    if_null rx1133_debug, debug_189
    rx1133_cur."!cursor_debug"("START", "escale")
  debug_189:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1135_done
    goto rxscan1135_scan
  rxscan1135_loop:
    ($P10) = rx1133_cur."from"()
    inc $P10
    set rx1133_pos, $P10
    ge rx1133_pos, rx1133_eos, rxscan1135_done
  rxscan1135_scan:
    set_addr $I10, rxscan1135_loop
    rx1133_cur."!mark_push"(0, rx1133_pos, $I10)
  rxscan1135_done:
.annotate 'line', 77
  # rx enumcharlist negate=0 
    ge rx1133_pos, rx1133_eos, rx1133_fail
    sub $I10, rx1133_pos, rx1133_off
    substr $S10, rx1133_tgt, $I10, 1
    index $I11, "Ee", $S10
    lt $I11, 0, rx1133_fail
    inc rx1133_pos
  # rx enumcharlist_q negate=0  r 0..1
    sub $I10, rx1133_pos, rx1133_off
    set rx1133_rep, 0
    sub $I12, rx1133_eos, rx1133_pos
    le $I12, 1, rxenumcharlistq1136_loop
    set $I12, 1
  rxenumcharlistq1136_loop:
    le $I12, 0, rxenumcharlistq1136_done
    substr $S10, rx1133_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rxenumcharlistq1136_done
    inc rx1133_rep
  rxenumcharlistq1136_done:
    add rx1133_pos, rx1133_pos, rx1133_rep
  # rx charclass_q d r 1..-1
    sub $I10, rx1133_pos, rx1133_off
    find_not_cclass $I11, 8, rx1133_tgt, $I10, rx1133_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1133_fail
    add rx1133_pos, rx1133_off, $I11
  # rx pass
    rx1133_cur."!cursor_pass"(rx1133_pos, "escale")
    if_null rx1133_debug, debug_190
    rx1133_cur."!cursor_debug"("PASS", "escale", " at pos=", rx1133_pos)
  debug_190:
    .return (rx1133_cur)
  rx1133_restart:
.annotate 'line', 5
    if_null rx1133_debug, debug_191
    rx1133_cur."!cursor_debug"("NEXT", "escale")
  debug_191:
  rx1133_fail:
    (rx1133_rep, rx1133_pos, $I10, $P10) = rx1133_cur."!mark_fail"(0)
    lt rx1133_pos, -1, rx1133_done
    eq rx1133_pos, -1, rx1133_fail
    jump $I10
  rx1133_done:
    rx1133_cur."!cursor_fail"()
    if_null rx1133_debug, debug_192
    rx1133_cur."!cursor_debug"("FAIL", "escale")
  debug_192:
    .return (rx1133_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__escale"  :subid("66_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "e"
    push $P100, "E"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape"  :subid("67_1308504717.31993") :method
.annotate 'line', 79
    $P100 = self."!protoregex"("quote_escape")
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape"  :subid("68_1308504717.31993") :method
.annotate 'line', 79
    $P101 = self."!PREFIX__!protoregex"("quote_escape")
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<backslash>"  :subid("69_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1140_tgt
    .local int rx1140_pos
    .local int rx1140_off
    .local int rx1140_eos
    .local int rx1140_rep
    .local pmc rx1140_cur
    .local pmc rx1140_debug
    (rx1140_cur, rx1140_pos, rx1140_tgt, $I10) = self."!cursor_start"()
    getattribute rx1140_debug, rx1140_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1140_cur
    .local pmc match
    .lex "$/", match
    length rx1140_eos, rx1140_tgt
    gt rx1140_pos, rx1140_eos, rx1140_done
    set rx1140_off, 0
    lt rx1140_pos, 2, rx1140_start
    sub rx1140_off, rx1140_pos, 1
    substr rx1140_tgt, rx1140_tgt, rx1140_off
  rx1140_start:
    eq $I10, 1, rx1140_restart
    if_null rx1140_debug, debug_193
    rx1140_cur."!cursor_debug"("START", "quote_escape:sym<backslash>")
  debug_193:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1142_done
    goto rxscan1142_scan
  rxscan1142_loop:
    ($P10) = rx1140_cur."from"()
    inc $P10
    set rx1140_pos, $P10
    ge rx1140_pos, rx1140_eos, rxscan1142_done
  rxscan1142_scan:
    set_addr $I10, rxscan1142_loop
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  rxscan1142_done:
.annotate 'line', 80
  # rx literal  "\\\\"
    add $I11, rx1140_pos, 2
    gt $I11, rx1140_eos, rx1140_fail
    sub $I11, rx1140_pos, rx1140_off
    substr $S10, rx1140_tgt, $I11, 2
    ne $S10, "\\\\", rx1140_fail
    add rx1140_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1140_cur."!cursor_pos"(rx1140_pos)
    $P10 = rx1140_cur."quotemod_check"("q")
    unless $P10, rx1140_fail
  # rx pass
    rx1140_cur."!cursor_pass"(rx1140_pos, "quote_escape:sym<backslash>")
    if_null rx1140_debug, debug_194
    rx1140_cur."!cursor_debug"("PASS", "quote_escape:sym<backslash>", " at pos=", rx1140_pos)
  debug_194:
    .return (rx1140_cur)
  rx1140_restart:
.annotate 'line', 5
    if_null rx1140_debug, debug_195
    rx1140_cur."!cursor_debug"("NEXT", "quote_escape:sym<backslash>")
  debug_195:
  rx1140_fail:
    (rx1140_rep, rx1140_pos, $I10, $P10) = rx1140_cur."!mark_fail"(0)
    lt rx1140_pos, -1, rx1140_done
    eq rx1140_pos, -1, rx1140_fail
    jump $I10
  rx1140_done:
    rx1140_cur."!cursor_fail"()
    if_null rx1140_debug, debug_196
    rx1140_cur."!cursor_debug"("FAIL", "quote_escape:sym<backslash>")
  debug_196:
    .return (rx1140_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<backslash>"  :subid("70_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\\\"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<stopper>"  :subid("71_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1144_tgt
    .local int rx1144_pos
    .local int rx1144_off
    .local int rx1144_eos
    .local int rx1144_rep
    .local pmc rx1144_cur
    .local pmc rx1144_debug
    (rx1144_cur, rx1144_pos, rx1144_tgt, $I10) = self."!cursor_start"()
    getattribute rx1144_debug, rx1144_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1144_cur
    .local pmc match
    .lex "$/", match
    length rx1144_eos, rx1144_tgt
    gt rx1144_pos, rx1144_eos, rx1144_done
    set rx1144_off, 0
    lt rx1144_pos, 2, rx1144_start
    sub rx1144_off, rx1144_pos, 1
    substr rx1144_tgt, rx1144_tgt, rx1144_off
  rx1144_start:
    eq $I10, 1, rx1144_restart
    if_null rx1144_debug, debug_197
    rx1144_cur."!cursor_debug"("START", "quote_escape:sym<stopper>")
  debug_197:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1146_done
    goto rxscan1146_scan
  rxscan1146_loop:
    ($P10) = rx1144_cur."from"()
    inc $P10
    set rx1144_pos, $P10
    ge rx1144_pos, rx1144_eos, rxscan1146_done
  rxscan1146_scan:
    set_addr $I10, rxscan1146_loop
    rx1144_cur."!mark_push"(0, rx1144_pos, $I10)
  rxscan1146_done:
.annotate 'line', 81
  # rx literal  "\\"
    add $I11, rx1144_pos, 1
    gt $I11, rx1144_eos, rx1144_fail
    sub $I11, rx1144_pos, rx1144_off
    ord $I11, rx1144_tgt, $I11
    ne $I11, 92, rx1144_fail
    add rx1144_pos, 1
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1144_cur."!cursor_pos"(rx1144_pos)
    $P10 = rx1144_cur."quotemod_check"("q")
    unless $P10, rx1144_fail
  # rx subrule "stopper" subtype=capture negate=
    rx1144_cur."!cursor_pos"(rx1144_pos)
    $P10 = rx1144_cur."stopper"()
    unless $P10, rx1144_fail
    rx1144_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("stopper")
    rx1144_pos = $P10."pos"()
  # rx pass
    rx1144_cur."!cursor_pass"(rx1144_pos, "quote_escape:sym<stopper>")
    if_null rx1144_debug, debug_198
    rx1144_cur."!cursor_debug"("PASS", "quote_escape:sym<stopper>", " at pos=", rx1144_pos)
  debug_198:
    .return (rx1144_cur)
  rx1144_restart:
.annotate 'line', 5
    if_null rx1144_debug, debug_199
    rx1144_cur."!cursor_debug"("NEXT", "quote_escape:sym<stopper>")
  debug_199:
  rx1144_fail:
    (rx1144_rep, rx1144_pos, $I10, $P10) = rx1144_cur."!mark_fail"(0)
    lt rx1144_pos, -1, rx1144_done
    eq rx1144_pos, -1, rx1144_fail
    jump $I10
  rx1144_done:
    rx1144_cur."!cursor_fail"()
    if_null rx1144_debug, debug_200
    rx1144_cur."!cursor_debug"("FAIL", "quote_escape:sym<stopper>")
  debug_200:
    .return (rx1144_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<stopper>"  :subid("72_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<bs>"  :subid("73_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1148_tgt
    .local int rx1148_pos
    .local int rx1148_off
    .local int rx1148_eos
    .local int rx1148_rep
    .local pmc rx1148_cur
    .local pmc rx1148_debug
    (rx1148_cur, rx1148_pos, rx1148_tgt, $I10) = self."!cursor_start"()
    getattribute rx1148_debug, rx1148_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1148_cur
    .local pmc match
    .lex "$/", match
    length rx1148_eos, rx1148_tgt
    gt rx1148_pos, rx1148_eos, rx1148_done
    set rx1148_off, 0
    lt rx1148_pos, 2, rx1148_start
    sub rx1148_off, rx1148_pos, 1
    substr rx1148_tgt, rx1148_tgt, rx1148_off
  rx1148_start:
    eq $I10, 1, rx1148_restart
    if_null rx1148_debug, debug_201
    rx1148_cur."!cursor_debug"("START", "quote_escape:sym<bs>")
  debug_201:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1150_done
    goto rxscan1150_scan
  rxscan1150_loop:
    ($P10) = rx1148_cur."from"()
    inc $P10
    set rx1148_pos, $P10
    ge rx1148_pos, rx1148_eos, rxscan1150_done
  rxscan1150_scan:
    set_addr $I10, rxscan1150_loop
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  rxscan1150_done:
.annotate 'line', 83
  # rx literal  "\\b"
    add $I11, rx1148_pos, 2
    gt $I11, rx1148_eos, rx1148_fail
    sub $I11, rx1148_pos, rx1148_off
    substr $S10, rx1148_tgt, $I11, 2
    ne $S10, "\\b", rx1148_fail
    add rx1148_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1148_cur."!cursor_pos"(rx1148_pos)
    $P10 = rx1148_cur."quotemod_check"("b")
    unless $P10, rx1148_fail
  # rx pass
    rx1148_cur."!cursor_pass"(rx1148_pos, "quote_escape:sym<bs>")
    if_null rx1148_debug, debug_202
    rx1148_cur."!cursor_debug"("PASS", "quote_escape:sym<bs>", " at pos=", rx1148_pos)
  debug_202:
    .return (rx1148_cur)
  rx1148_restart:
.annotate 'line', 5
    if_null rx1148_debug, debug_203
    rx1148_cur."!cursor_debug"("NEXT", "quote_escape:sym<bs>")
  debug_203:
  rx1148_fail:
    (rx1148_rep, rx1148_pos, $I10, $P10) = rx1148_cur."!mark_fail"(0)
    lt rx1148_pos, -1, rx1148_done
    eq rx1148_pos, -1, rx1148_fail
    jump $I10
  rx1148_done:
    rx1148_cur."!cursor_fail"()
    if_null rx1148_debug, debug_204
    rx1148_cur."!cursor_debug"("FAIL", "quote_escape:sym<bs>")
  debug_204:
    .return (rx1148_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<bs>"  :subid("74_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\b"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<nl>"  :subid("75_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1152_tgt
    .local int rx1152_pos
    .local int rx1152_off
    .local int rx1152_eos
    .local int rx1152_rep
    .local pmc rx1152_cur
    .local pmc rx1152_debug
    (rx1152_cur, rx1152_pos, rx1152_tgt, $I10) = self."!cursor_start"()
    getattribute rx1152_debug, rx1152_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1152_cur
    .local pmc match
    .lex "$/", match
    length rx1152_eos, rx1152_tgt
    gt rx1152_pos, rx1152_eos, rx1152_done
    set rx1152_off, 0
    lt rx1152_pos, 2, rx1152_start
    sub rx1152_off, rx1152_pos, 1
    substr rx1152_tgt, rx1152_tgt, rx1152_off
  rx1152_start:
    eq $I10, 1, rx1152_restart
    if_null rx1152_debug, debug_205
    rx1152_cur."!cursor_debug"("START", "quote_escape:sym<nl>")
  debug_205:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1154_done
    goto rxscan1154_scan
  rxscan1154_loop:
    ($P10) = rx1152_cur."from"()
    inc $P10
    set rx1152_pos, $P10
    ge rx1152_pos, rx1152_eos, rxscan1154_done
  rxscan1154_scan:
    set_addr $I10, rxscan1154_loop
    rx1152_cur."!mark_push"(0, rx1152_pos, $I10)
  rxscan1154_done:
.annotate 'line', 84
  # rx literal  "\\n"
    add $I11, rx1152_pos, 2
    gt $I11, rx1152_eos, rx1152_fail
    sub $I11, rx1152_pos, rx1152_off
    substr $S10, rx1152_tgt, $I11, 2
    ne $S10, "\\n", rx1152_fail
    add rx1152_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1152_cur."!cursor_pos"(rx1152_pos)
    $P10 = rx1152_cur."quotemod_check"("b")
    unless $P10, rx1152_fail
  # rx pass
    rx1152_cur."!cursor_pass"(rx1152_pos, "quote_escape:sym<nl>")
    if_null rx1152_debug, debug_206
    rx1152_cur."!cursor_debug"("PASS", "quote_escape:sym<nl>", " at pos=", rx1152_pos)
  debug_206:
    .return (rx1152_cur)
  rx1152_restart:
.annotate 'line', 5
    if_null rx1152_debug, debug_207
    rx1152_cur."!cursor_debug"("NEXT", "quote_escape:sym<nl>")
  debug_207:
  rx1152_fail:
    (rx1152_rep, rx1152_pos, $I10, $P10) = rx1152_cur."!mark_fail"(0)
    lt rx1152_pos, -1, rx1152_done
    eq rx1152_pos, -1, rx1152_fail
    jump $I10
  rx1152_done:
    rx1152_cur."!cursor_fail"()
    if_null rx1152_debug, debug_208
    rx1152_cur."!cursor_debug"("FAIL", "quote_escape:sym<nl>")
  debug_208:
    .return (rx1152_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<nl>"  :subid("76_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\n"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<cr>"  :subid("77_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1156_tgt
    .local int rx1156_pos
    .local int rx1156_off
    .local int rx1156_eos
    .local int rx1156_rep
    .local pmc rx1156_cur
    .local pmc rx1156_debug
    (rx1156_cur, rx1156_pos, rx1156_tgt, $I10) = self."!cursor_start"()
    getattribute rx1156_debug, rx1156_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1156_cur
    .local pmc match
    .lex "$/", match
    length rx1156_eos, rx1156_tgt
    gt rx1156_pos, rx1156_eos, rx1156_done
    set rx1156_off, 0
    lt rx1156_pos, 2, rx1156_start
    sub rx1156_off, rx1156_pos, 1
    substr rx1156_tgt, rx1156_tgt, rx1156_off
  rx1156_start:
    eq $I10, 1, rx1156_restart
    if_null rx1156_debug, debug_209
    rx1156_cur."!cursor_debug"("START", "quote_escape:sym<cr>")
  debug_209:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1158_done
    goto rxscan1158_scan
  rxscan1158_loop:
    ($P10) = rx1156_cur."from"()
    inc $P10
    set rx1156_pos, $P10
    ge rx1156_pos, rx1156_eos, rxscan1158_done
  rxscan1158_scan:
    set_addr $I10, rxscan1158_loop
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  rxscan1158_done:
.annotate 'line', 85
  # rx literal  "\\r"
    add $I11, rx1156_pos, 2
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    substr $S10, rx1156_tgt, $I11, 2
    ne $S10, "\\r", rx1156_fail
    add rx1156_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1156_cur."!cursor_pos"(rx1156_pos)
    $P10 = rx1156_cur."quotemod_check"("b")
    unless $P10, rx1156_fail
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "quote_escape:sym<cr>")
    if_null rx1156_debug, debug_210
    rx1156_cur."!cursor_debug"("PASS", "quote_escape:sym<cr>", " at pos=", rx1156_pos)
  debug_210:
    .return (rx1156_cur)
  rx1156_restart:
.annotate 'line', 5
    if_null rx1156_debug, debug_211
    rx1156_cur."!cursor_debug"("NEXT", "quote_escape:sym<cr>")
  debug_211:
  rx1156_fail:
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    if_null rx1156_debug, debug_212
    rx1156_cur."!cursor_debug"("FAIL", "quote_escape:sym<cr>")
  debug_212:
    .return (rx1156_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<cr>"  :subid("78_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\r"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<tab>"  :subid("79_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1160_tgt
    .local int rx1160_pos
    .local int rx1160_off
    .local int rx1160_eos
    .local int rx1160_rep
    .local pmc rx1160_cur
    .local pmc rx1160_debug
    (rx1160_cur, rx1160_pos, rx1160_tgt, $I10) = self."!cursor_start"()
    getattribute rx1160_debug, rx1160_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1160_cur
    .local pmc match
    .lex "$/", match
    length rx1160_eos, rx1160_tgt
    gt rx1160_pos, rx1160_eos, rx1160_done
    set rx1160_off, 0
    lt rx1160_pos, 2, rx1160_start
    sub rx1160_off, rx1160_pos, 1
    substr rx1160_tgt, rx1160_tgt, rx1160_off
  rx1160_start:
    eq $I10, 1, rx1160_restart
    if_null rx1160_debug, debug_213
    rx1160_cur."!cursor_debug"("START", "quote_escape:sym<tab>")
  debug_213:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1162_done
    goto rxscan1162_scan
  rxscan1162_loop:
    ($P10) = rx1160_cur."from"()
    inc $P10
    set rx1160_pos, $P10
    ge rx1160_pos, rx1160_eos, rxscan1162_done
  rxscan1162_scan:
    set_addr $I10, rxscan1162_loop
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  rxscan1162_done:
.annotate 'line', 86
  # rx literal  "\\t"
    add $I11, rx1160_pos, 2
    gt $I11, rx1160_eos, rx1160_fail
    sub $I11, rx1160_pos, rx1160_off
    substr $S10, rx1160_tgt, $I11, 2
    ne $S10, "\\t", rx1160_fail
    add rx1160_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1160_cur."!cursor_pos"(rx1160_pos)
    $P10 = rx1160_cur."quotemod_check"("b")
    unless $P10, rx1160_fail
  # rx pass
    rx1160_cur."!cursor_pass"(rx1160_pos, "quote_escape:sym<tab>")
    if_null rx1160_debug, debug_214
    rx1160_cur."!cursor_debug"("PASS", "quote_escape:sym<tab>", " at pos=", rx1160_pos)
  debug_214:
    .return (rx1160_cur)
  rx1160_restart:
.annotate 'line', 5
    if_null rx1160_debug, debug_215
    rx1160_cur."!cursor_debug"("NEXT", "quote_escape:sym<tab>")
  debug_215:
  rx1160_fail:
    (rx1160_rep, rx1160_pos, $I10, $P10) = rx1160_cur."!mark_fail"(0)
    lt rx1160_pos, -1, rx1160_done
    eq rx1160_pos, -1, rx1160_fail
    jump $I10
  rx1160_done:
    rx1160_cur."!cursor_fail"()
    if_null rx1160_debug, debug_216
    rx1160_cur."!cursor_debug"("FAIL", "quote_escape:sym<tab>")
  debug_216:
    .return (rx1160_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<tab>"  :subid("80_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\t"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<ff>"  :subid("81_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1164_tgt
    .local int rx1164_pos
    .local int rx1164_off
    .local int rx1164_eos
    .local int rx1164_rep
    .local pmc rx1164_cur
    .local pmc rx1164_debug
    (rx1164_cur, rx1164_pos, rx1164_tgt, $I10) = self."!cursor_start"()
    getattribute rx1164_debug, rx1164_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1164_cur
    .local pmc match
    .lex "$/", match
    length rx1164_eos, rx1164_tgt
    gt rx1164_pos, rx1164_eos, rx1164_done
    set rx1164_off, 0
    lt rx1164_pos, 2, rx1164_start
    sub rx1164_off, rx1164_pos, 1
    substr rx1164_tgt, rx1164_tgt, rx1164_off
  rx1164_start:
    eq $I10, 1, rx1164_restart
    if_null rx1164_debug, debug_217
    rx1164_cur."!cursor_debug"("START", "quote_escape:sym<ff>")
  debug_217:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1166_done
    goto rxscan1166_scan
  rxscan1166_loop:
    ($P10) = rx1164_cur."from"()
    inc $P10
    set rx1164_pos, $P10
    ge rx1164_pos, rx1164_eos, rxscan1166_done
  rxscan1166_scan:
    set_addr $I10, rxscan1166_loop
    rx1164_cur."!mark_push"(0, rx1164_pos, $I10)
  rxscan1166_done:
.annotate 'line', 87
  # rx literal  "\\f"
    add $I11, rx1164_pos, 2
    gt $I11, rx1164_eos, rx1164_fail
    sub $I11, rx1164_pos, rx1164_off
    substr $S10, rx1164_tgt, $I11, 2
    ne $S10, "\\f", rx1164_fail
    add rx1164_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1164_cur."!cursor_pos"(rx1164_pos)
    $P10 = rx1164_cur."quotemod_check"("b")
    unless $P10, rx1164_fail
  # rx pass
    rx1164_cur."!cursor_pass"(rx1164_pos, "quote_escape:sym<ff>")
    if_null rx1164_debug, debug_218
    rx1164_cur."!cursor_debug"("PASS", "quote_escape:sym<ff>", " at pos=", rx1164_pos)
  debug_218:
    .return (rx1164_cur)
  rx1164_restart:
.annotate 'line', 5
    if_null rx1164_debug, debug_219
    rx1164_cur."!cursor_debug"("NEXT", "quote_escape:sym<ff>")
  debug_219:
  rx1164_fail:
    (rx1164_rep, rx1164_pos, $I10, $P10) = rx1164_cur."!mark_fail"(0)
    lt rx1164_pos, -1, rx1164_done
    eq rx1164_pos, -1, rx1164_fail
    jump $I10
  rx1164_done:
    rx1164_cur."!cursor_fail"()
    if_null rx1164_debug, debug_220
    rx1164_cur."!cursor_debug"("FAIL", "quote_escape:sym<ff>")
  debug_220:
    .return (rx1164_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<ff>"  :subid("82_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\f"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("83_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1168_tgt
    .local int rx1168_pos
    .local int rx1168_off
    .local int rx1168_eos
    .local int rx1168_rep
    .local pmc rx1168_cur
    .local pmc rx1168_debug
    (rx1168_cur, rx1168_pos, rx1168_tgt, $I10) = self."!cursor_start"()
    getattribute rx1168_debug, rx1168_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1168_cur
    .local pmc match
    .lex "$/", match
    length rx1168_eos, rx1168_tgt
    gt rx1168_pos, rx1168_eos, rx1168_done
    set rx1168_off, 0
    lt rx1168_pos, 2, rx1168_start
    sub rx1168_off, rx1168_pos, 1
    substr rx1168_tgt, rx1168_tgt, rx1168_off
  rx1168_start:
    eq $I10, 1, rx1168_restart
    if_null rx1168_debug, debug_221
    rx1168_cur."!cursor_debug"("START", "quote_escape:sym<esc>")
  debug_221:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1170_done
    goto rxscan1170_scan
  rxscan1170_loop:
    ($P10) = rx1168_cur."from"()
    inc $P10
    set rx1168_pos, $P10
    ge rx1168_pos, rx1168_eos, rxscan1170_done
  rxscan1170_scan:
    set_addr $I10, rxscan1170_loop
    rx1168_cur."!mark_push"(0, rx1168_pos, $I10)
  rxscan1170_done:
.annotate 'line', 88
  # rx literal  "\\e"
    add $I11, rx1168_pos, 2
    gt $I11, rx1168_eos, rx1168_fail
    sub $I11, rx1168_pos, rx1168_off
    substr $S10, rx1168_tgt, $I11, 2
    ne $S10, "\\e", rx1168_fail
    add rx1168_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1168_cur."!cursor_pos"(rx1168_pos)
    $P10 = rx1168_cur."quotemod_check"("b")
    unless $P10, rx1168_fail
  # rx pass
    rx1168_cur."!cursor_pass"(rx1168_pos, "quote_escape:sym<esc>")
    if_null rx1168_debug, debug_222
    rx1168_cur."!cursor_debug"("PASS", "quote_escape:sym<esc>", " at pos=", rx1168_pos)
  debug_222:
    .return (rx1168_cur)
  rx1168_restart:
.annotate 'line', 5
    if_null rx1168_debug, debug_223
    rx1168_cur."!cursor_debug"("NEXT", "quote_escape:sym<esc>")
  debug_223:
  rx1168_fail:
    (rx1168_rep, rx1168_pos, $I10, $P10) = rx1168_cur."!mark_fail"(0)
    lt rx1168_pos, -1, rx1168_done
    eq rx1168_pos, -1, rx1168_fail
    jump $I10
  rx1168_done:
    rx1168_cur."!cursor_fail"()
    if_null rx1168_debug, debug_224
    rx1168_cur."!cursor_debug"("FAIL", "quote_escape:sym<esc>")
  debug_224:
    .return (rx1168_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("84_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\e"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<hex>"  :subid("85_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    .local pmc rx1172_debug
    (rx1172_cur, rx1172_pos, rx1172_tgt, $I10) = self."!cursor_start"()
    getattribute rx1172_debug, rx1172_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1172_cur
    .local pmc match
    .lex "$/", match
    length rx1172_eos, rx1172_tgt
    gt rx1172_pos, rx1172_eos, rx1172_done
    set rx1172_off, 0
    lt rx1172_pos, 2, rx1172_start
    sub rx1172_off, rx1172_pos, 1
    substr rx1172_tgt, rx1172_tgt, rx1172_off
  rx1172_start:
    eq $I10, 1, rx1172_restart
    if_null rx1172_debug, debug_225
    rx1172_cur."!cursor_debug"("START", "quote_escape:sym<hex>")
  debug_225:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1174_done
    goto rxscan1174_scan
  rxscan1174_loop:
    ($P10) = rx1172_cur."from"()
    inc $P10
    set rx1172_pos, $P10
    ge rx1172_pos, rx1172_eos, rxscan1174_done
  rxscan1174_scan:
    set_addr $I10, rxscan1174_loop
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  rxscan1174_done:
.annotate 'line', 90
  # rx literal  unicode:"\\x"
    add $I11, rx1172_pos, 2
    gt $I11, rx1172_eos, rx1172_fail
    sub $I11, rx1172_pos, rx1172_off
    substr $S10, rx1172_tgt, $I11, 2
    ne $S10, unicode:"\\x", rx1172_fail
    add rx1172_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1172_cur."!cursor_pos"(rx1172_pos)
    $P10 = rx1172_cur."quotemod_check"("b")
    unless $P10, rx1172_fail
  alt1175_0:
.annotate 'line', 91
    set_addr $I10, alt1175_1
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx1172_cur."!cursor_pos"(rx1172_pos)
    $P10 = rx1172_cur."hexint"()
    unless $P10, rx1172_fail
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx1172_pos = $P10."pos"()
    goto alt1175_end
  alt1175_1:
  # rx literal  "["
    add $I11, rx1172_pos, 1
    gt $I11, rx1172_eos, rx1172_fail
    sub $I11, rx1172_pos, rx1172_off
    ord $I11, rx1172_tgt, $I11
    ne $I11, 91, rx1172_fail
    add rx1172_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx1172_cur."!cursor_pos"(rx1172_pos)
    $P10 = rx1172_cur."hexints"()
    unless $P10, rx1172_fail
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx1172_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1172_pos, 1
    gt $I11, rx1172_eos, rx1172_fail
    sub $I11, rx1172_pos, rx1172_off
    ord $I11, rx1172_tgt, $I11
    ne $I11, 93, rx1172_fail
    add rx1172_pos, 1
  alt1175_end:
.annotate 'line', 89
  # rx pass
    rx1172_cur."!cursor_pass"(rx1172_pos, "quote_escape:sym<hex>")
    if_null rx1172_debug, debug_226
    rx1172_cur."!cursor_debug"("PASS", "quote_escape:sym<hex>", " at pos=", rx1172_pos)
  debug_226:
    .return (rx1172_cur)
  rx1172_restart:
.annotate 'line', 5
    if_null rx1172_debug, debug_227
    rx1172_cur."!cursor_debug"("NEXT", "quote_escape:sym<hex>")
  debug_227:
  rx1172_fail:
    (rx1172_rep, rx1172_pos, $I10, $P10) = rx1172_cur."!mark_fail"(0)
    lt rx1172_pos, -1, rx1172_done
    eq rx1172_pos, -1, rx1172_fail
    jump $I10
  rx1172_done:
    rx1172_cur."!cursor_fail"()
    if_null rx1172_debug, debug_228
    rx1172_cur."!cursor_debug"("FAIL", "quote_escape:sym<hex>")
  debug_228:
    .return (rx1172_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<hex>"  :subid("86_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, unicode:"\\x"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<oct>"  :subid("87_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    .local pmc rx1177_debug
    (rx1177_cur, rx1177_pos, rx1177_tgt, $I10) = self."!cursor_start"()
    getattribute rx1177_debug, rx1177_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1177_cur
    .local pmc match
    .lex "$/", match
    length rx1177_eos, rx1177_tgt
    gt rx1177_pos, rx1177_eos, rx1177_done
    set rx1177_off, 0
    lt rx1177_pos, 2, rx1177_start
    sub rx1177_off, rx1177_pos, 1
    substr rx1177_tgt, rx1177_tgt, rx1177_off
  rx1177_start:
    eq $I10, 1, rx1177_restart
    if_null rx1177_debug, debug_229
    rx1177_cur."!cursor_debug"("START", "quote_escape:sym<oct>")
  debug_229:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1179_done
    goto rxscan1179_scan
  rxscan1179_loop:
    ($P10) = rx1177_cur."from"()
    inc $P10
    set rx1177_pos, $P10
    ge rx1177_pos, rx1177_eos, rxscan1179_done
  rxscan1179_scan:
    set_addr $I10, rxscan1179_loop
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  rxscan1179_done:
.annotate 'line', 94
  # rx literal  "\\o"
    add $I11, rx1177_pos, 2
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I11, 2
    ne $S10, "\\o", rx1177_fail
    add rx1177_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."quotemod_check"("b")
    unless $P10, rx1177_fail
  alt1180_0:
.annotate 'line', 95
    set_addr $I10, alt1180_1
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."octint"()
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx1177_pos = $P10."pos"()
    goto alt1180_end
  alt1180_1:
  # rx literal  "["
    add $I11, rx1177_pos, 1
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    ord $I11, rx1177_tgt, $I11
    ne $I11, 91, rx1177_fail
    add rx1177_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."octints"()
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx1177_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1177_pos, 1
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    ord $I11, rx1177_tgt, $I11
    ne $I11, 93, rx1177_fail
    add rx1177_pos, 1
  alt1180_end:
.annotate 'line', 93
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "quote_escape:sym<oct>")
    if_null rx1177_debug, debug_230
    rx1177_cur."!cursor_debug"("PASS", "quote_escape:sym<oct>", " at pos=", rx1177_pos)
  debug_230:
    .return (rx1177_cur)
  rx1177_restart:
.annotate 'line', 5
    if_null rx1177_debug, debug_231
    rx1177_cur."!cursor_debug"("NEXT", "quote_escape:sym<oct>")
  debug_231:
  rx1177_fail:
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    if_null rx1177_debug, debug_232
    rx1177_cur."!cursor_debug"("FAIL", "quote_escape:sym<oct>")
  debug_232:
    .return (rx1177_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<oct>"  :subid("88_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\o"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<chr>"  :subid("89_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1182_tgt
    .local int rx1182_pos
    .local int rx1182_off
    .local int rx1182_eos
    .local int rx1182_rep
    .local pmc rx1182_cur
    .local pmc rx1182_debug
    (rx1182_cur, rx1182_pos, rx1182_tgt, $I10) = self."!cursor_start"()
    getattribute rx1182_debug, rx1182_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1182_cur
    .local pmc match
    .lex "$/", match
    length rx1182_eos, rx1182_tgt
    gt rx1182_pos, rx1182_eos, rx1182_done
    set rx1182_off, 0
    lt rx1182_pos, 2, rx1182_start
    sub rx1182_off, rx1182_pos, 1
    substr rx1182_tgt, rx1182_tgt, rx1182_off
  rx1182_start:
    eq $I10, 1, rx1182_restart
    if_null rx1182_debug, debug_233
    rx1182_cur."!cursor_debug"("START", "quote_escape:sym<chr>")
  debug_233:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1184_done
    goto rxscan1184_scan
  rxscan1184_loop:
    ($P10) = rx1182_cur."from"()
    inc $P10
    set rx1182_pos, $P10
    ge rx1182_pos, rx1182_eos, rxscan1184_done
  rxscan1184_scan:
    set_addr $I10, rxscan1184_loop
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  rxscan1184_done:
.annotate 'line', 97
  # rx literal  "\\c"
    add $I11, rx1182_pos, 2
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 2
    ne $S10, "\\c", rx1182_fail
    add rx1182_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."quotemod_check"("b")
    unless $P10, rx1182_fail
  # rx subrule "charspec" subtype=capture negate=
    rx1182_cur."!cursor_pos"(rx1182_pos)
    $P10 = rx1182_cur."charspec"()
    unless $P10, rx1182_fail
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx1182_pos = $P10."pos"()
  # rx pass
    rx1182_cur."!cursor_pass"(rx1182_pos, "quote_escape:sym<chr>")
    if_null rx1182_debug, debug_234
    rx1182_cur."!cursor_debug"("PASS", "quote_escape:sym<chr>", " at pos=", rx1182_pos)
  debug_234:
    .return (rx1182_cur)
  rx1182_restart:
.annotate 'line', 5
    if_null rx1182_debug, debug_235
    rx1182_cur."!cursor_debug"("NEXT", "quote_escape:sym<chr>")
  debug_235:
  rx1182_fail:
    (rx1182_rep, rx1182_pos, $I10, $P10) = rx1182_cur."!mark_fail"(0)
    lt rx1182_pos, -1, rx1182_done
    eq rx1182_pos, -1, rx1182_fail
    jump $I10
  rx1182_done:
    rx1182_cur."!cursor_fail"()
    if_null rx1182_debug, debug_236
    rx1182_cur."!cursor_debug"("FAIL", "quote_escape:sym<chr>")
  debug_236:
    .return (rx1182_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<chr>"  :subid("90_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\c"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<0>"  :subid("91_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1186_tgt
    .local int rx1186_pos
    .local int rx1186_off
    .local int rx1186_eos
    .local int rx1186_rep
    .local pmc rx1186_cur
    .local pmc rx1186_debug
    (rx1186_cur, rx1186_pos, rx1186_tgt, $I10) = self."!cursor_start"()
    getattribute rx1186_debug, rx1186_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1186_cur
    .local pmc match
    .lex "$/", match
    length rx1186_eos, rx1186_tgt
    gt rx1186_pos, rx1186_eos, rx1186_done
    set rx1186_off, 0
    lt rx1186_pos, 2, rx1186_start
    sub rx1186_off, rx1186_pos, 1
    substr rx1186_tgt, rx1186_tgt, rx1186_off
  rx1186_start:
    eq $I10, 1, rx1186_restart
    if_null rx1186_debug, debug_237
    rx1186_cur."!cursor_debug"("START", "quote_escape:sym<0>")
  debug_237:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1188_done
    goto rxscan1188_scan
  rxscan1188_loop:
    ($P10) = rx1186_cur."from"()
    inc $P10
    set rx1186_pos, $P10
    ge rx1186_pos, rx1186_eos, rxscan1188_done
  rxscan1188_scan:
    set_addr $I10, rxscan1188_loop
    rx1186_cur."!mark_push"(0, rx1186_pos, $I10)
  rxscan1188_done:
.annotate 'line', 98
  # rx literal  "\\"
    add $I11, rx1186_pos, 1
    gt $I11, rx1186_eos, rx1186_fail
    sub $I11, rx1186_pos, rx1186_off
    ord $I11, rx1186_tgt, $I11
    ne $I11, 92, rx1186_fail
    add rx1186_pos, 1
  # rx subcapture "sym"
    set_addr $I10, rxcap_1189_fail
    rx1186_cur."!mark_push"(0, rx1186_pos, $I10)
  # rx literal  "0"
    add $I11, rx1186_pos, 1
    gt $I11, rx1186_eos, rx1186_fail
    sub $I11, rx1186_pos, rx1186_off
    ord $I11, rx1186_tgt, $I11
    ne $I11, 48, rx1186_fail
    add rx1186_pos, 1
    set_addr $I10, rxcap_1189_fail
    ($I12, $I11) = rx1186_cur."!mark_peek"($I10)
    rx1186_cur."!cursor_pos"($I11)
    ($P10) = rx1186_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1186_pos, "")
    rx1186_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1189_done
  rxcap_1189_fail:
    goto rx1186_fail
  rxcap_1189_done:
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1186_cur."!cursor_pos"(rx1186_pos)
    $P10 = rx1186_cur."quotemod_check"("b")
    unless $P10, rx1186_fail
  # rx pass
    rx1186_cur."!cursor_pass"(rx1186_pos, "quote_escape:sym<0>")
    if_null rx1186_debug, debug_238
    rx1186_cur."!cursor_debug"("PASS", "quote_escape:sym<0>", " at pos=", rx1186_pos)
  debug_238:
    .return (rx1186_cur)
  rx1186_restart:
.annotate 'line', 5
    if_null rx1186_debug, debug_239
    rx1186_cur."!cursor_debug"("NEXT", "quote_escape:sym<0>")
  debug_239:
  rx1186_fail:
    (rx1186_rep, rx1186_pos, $I10, $P10) = rx1186_cur."!mark_fail"(0)
    lt rx1186_pos, -1, rx1186_done
    eq rx1186_pos, -1, rx1186_fail
    jump $I10
  rx1186_done:
    rx1186_cur."!cursor_fail"()
    if_null rx1186_debug, debug_240
    rx1186_cur."!cursor_debug"("FAIL", "quote_escape:sym<0>")
  debug_240:
    .return (rx1186_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<0>"  :subid("92_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, "\\0"
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "quote_escape:sym<misc>"  :subid("93_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .const 'Sub' $P1204 = "97_1308504717.31993" 
    capture_lex $P1204
    .const 'Sub' $P1199 = "96_1308504717.31993" 
    capture_lex $P1199
    .const 'Sub' $P1195 = "95_1308504717.31993" 
    capture_lex $P1195
    .local string rx1191_tgt
    .local int rx1191_pos
    .local int rx1191_off
    .local int rx1191_eos
    .local int rx1191_rep
    .local pmc rx1191_cur
    .local pmc rx1191_debug
    (rx1191_cur, rx1191_pos, rx1191_tgt, $I10) = self."!cursor_start"()
    getattribute rx1191_debug, rx1191_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1191_cur
    .local pmc match
    .lex "$/", match
    length rx1191_eos, rx1191_tgt
    gt rx1191_pos, rx1191_eos, rx1191_done
    set rx1191_off, 0
    lt rx1191_pos, 2, rx1191_start
    sub rx1191_off, rx1191_pos, 1
    substr rx1191_tgt, rx1191_tgt, rx1191_off
  rx1191_start:
    eq $I10, 1, rx1191_restart
    if_null rx1191_debug, debug_241
    rx1191_cur."!cursor_debug"("START", "quote_escape:sym<misc>")
  debug_241:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1193_done
    goto rxscan1193_scan
  rxscan1193_loop:
    ($P10) = rx1191_cur."from"()
    inc $P10
    set rx1191_pos, $P10
    ge rx1191_pos, rx1191_eos, rxscan1193_done
  rxscan1193_scan:
    set_addr $I10, rxscan1193_loop
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  rxscan1193_done:
.annotate 'line', 100
    rx1191_cur."!cursor_pos"(rx1191_pos)
    find_lex $P101, unicode:"$\x{a2}"
    $P102 = $P101."MATCH"()
    store_lex "$/", $P102
    .const 'Sub' $P1195 = "95_1308504717.31993" 
    capture_lex $P1195
    $P103 = $P1195()
  # rx literal  "\\"
    add $I11, rx1191_pos, 1
    gt $I11, rx1191_eos, rx1191_fail
    sub $I11, rx1191_pos, rx1191_off
    ord $I11, rx1191_tgt, $I11
    ne $I11, 92, rx1191_fail
    add rx1191_pos, 1
  alt1196_0:
.annotate 'line', 101
    set_addr $I10, alt1196_1
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
.annotate 'line', 102
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1191_cur."!cursor_pos"(rx1191_pos)
    $P10 = rx1191_cur."quotemod_check"("b")
    unless $P10, rx1191_fail
  alt1197_0:
.annotate 'line', 103
    set_addr $I10, alt1197_1
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
.annotate 'line', 104
  # rx subrule $P1199 subtype=capture negate=
    rx1191_cur."!cursor_pos"(rx1191_pos)
    .const 'Sub' $P1199 = "96_1308504717.31993" 
    capture_lex $P1199
    $P10 = rx1191_cur.$P1199()
    unless $P10, rx1191_fail
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("textqq")
    rx1191_pos = $P10."pos"()
    goto alt1197_end
  alt1197_1:
.annotate 'line', 105
  # rx subcapture "x"
    set_addr $I10, rxcap_1202_fail
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  # rx charclass w
    ge rx1191_pos, rx1191_eos, rx1191_fail
    sub $I10, rx1191_pos, rx1191_off
    is_cclass $I11, 8192, rx1191_tgt, $I10
    unless $I11, rx1191_fail
    inc rx1191_pos
    set_addr $I10, rxcap_1202_fail
    ($I12, $I11) = rx1191_cur."!mark_peek"($I10)
    rx1191_cur."!cursor_pos"($I11)
    ($P10) = rx1191_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1191_pos, "")
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("x")
    goto rxcap_1202_done
  rxcap_1202_fail:
    goto rx1191_fail
  rxcap_1202_done:
    rx1191_cur."!cursor_pos"(rx1191_pos)
    find_lex $P104, unicode:"$\x{a2}"
    $P105 = $P104."MATCH"()
    store_lex "$/", $P105
    .const 'Sub' $P1204 = "97_1308504717.31993" 
    capture_lex $P1204
    $P106 = $P1204()
  alt1197_end:
.annotate 'line', 102
    goto alt1196_end
  alt1196_1:
.annotate 'line', 107
  # rx subcapture "textq"
    set_addr $I10, rxcap_1206_fail
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  # rx charclass .
    ge rx1191_pos, rx1191_eos, rx1191_fail
    inc rx1191_pos
    set_addr $I10, rxcap_1206_fail
    ($I12, $I11) = rx1191_cur."!mark_peek"($I10)
    rx1191_cur."!cursor_pos"($I11)
    ($P10) = rx1191_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1191_pos, "")
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("textq")
    goto rxcap_1206_done
  rxcap_1206_fail:
    goto rx1191_fail
  rxcap_1206_done:
  alt1196_end:
.annotate 'line', 99
  # rx pass
    rx1191_cur."!cursor_pass"(rx1191_pos, "quote_escape:sym<misc>")
    if_null rx1191_debug, debug_248
    rx1191_cur."!cursor_debug"("PASS", "quote_escape:sym<misc>", " at pos=", rx1191_pos)
  debug_248:
    .return (rx1191_cur)
  rx1191_restart:
.annotate 'line', 5
    if_null rx1191_debug, debug_249
    rx1191_cur."!cursor_debug"("NEXT", "quote_escape:sym<misc>")
  debug_249:
  rx1191_fail:
    (rx1191_rep, rx1191_pos, $I10, $P10) = rx1191_cur."!mark_fail"(0)
    lt rx1191_pos, -1, rx1191_done
    eq rx1191_pos, -1, rx1191_fail
    jump $I10
  rx1191_done:
    rx1191_cur."!cursor_fail"()
    if_null rx1191_debug, debug_250
    rx1191_cur."!cursor_debug"("FAIL", "quote_escape:sym<misc>")
  debug_250:
    .return (rx1191_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__quote_escape:sym<misc>"  :subid("94_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "_block1194"  :anon :subid("95_1308504717.31993") :outer("93_1308504717.31993")
.annotate 'line', 100
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "_block1198"  :anon :subid("96_1308504717.31993") :method :outer("93_1308504717.31993")
.annotate 'line', 104
    .local string rx1200_tgt
    .local int rx1200_pos
    .local int rx1200_off
    .local int rx1200_eos
    .local int rx1200_rep
    .local pmc rx1200_cur
    .local pmc rx1200_debug
    (rx1200_cur, rx1200_pos, rx1200_tgt, $I10) = self."!cursor_start"()
    getattribute rx1200_debug, rx1200_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1200_cur
    .local pmc match
    .lex "$/", match
    length rx1200_eos, rx1200_tgt
    gt rx1200_pos, rx1200_eos, rx1200_done
    set rx1200_off, 0
    lt rx1200_pos, 2, rx1200_start
    sub rx1200_off, rx1200_pos, 1
    substr rx1200_tgt, rx1200_tgt, rx1200_off
  rx1200_start:
    eq $I10, 1, rx1200_restart
    if_null rx1200_debug, debug_242
    rx1200_cur."!cursor_debug"("START", "")
  debug_242:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1201_done
    goto rxscan1201_scan
  rxscan1201_loop:
    ($P10) = rx1200_cur."from"()
    inc $P10
    set rx1200_pos, $P10
    ge rx1200_pos, rx1200_eos, rxscan1201_done
  rxscan1201_scan:
    set_addr $I10, rxscan1201_loop
    rx1200_cur."!mark_push"(0, rx1200_pos, $I10)
  rxscan1201_done:
  # rx charclass W
    ge rx1200_pos, rx1200_eos, rx1200_fail
    sub $I10, rx1200_pos, rx1200_off
    is_cclass $I11, 8192, rx1200_tgt, $I10
    if $I11, rx1200_fail
    inc rx1200_pos
  # rx pass
    rx1200_cur."!cursor_pass"(rx1200_pos, "")
    if_null rx1200_debug, debug_243
    rx1200_cur."!cursor_debug"("PASS", "", " at pos=", rx1200_pos)
  debug_243:
    .return (rx1200_cur)
  rx1200_restart:
    if_null rx1200_debug, debug_244
    rx1200_cur."!cursor_debug"("NEXT", "")
  debug_244:
  rx1200_fail:
    (rx1200_rep, rx1200_pos, $I10, $P10) = rx1200_cur."!mark_fail"(0)
    lt rx1200_pos, -1, rx1200_done
    eq rx1200_pos, -1, rx1200_fail
    jump $I10
  rx1200_done:
    rx1200_cur."!cursor_fail"()
    if_null rx1200_debug, debug_245
    rx1200_cur."!cursor_debug"("FAIL", "")
  debug_245:
    .return (rx1200_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "_block1203"  :anon :subid("97_1308504717.31993") :outer("93_1308504717.31993")
.annotate 'line', 105
    find_lex $P106, "$/"
    $P107 = $P106."CURSOR"()
    new $P108, "String"
    assign $P108, "Unrecognized backslash sequence: '\\"
    find_lex $P1205, "$/"
    unless_null $P1205, vivify_246
    $P1205 = root_new ['parrot';'Hash']
  vivify_246:
    set $P109, $P1205["x"]
    unless_null $P109, vivify_247
    new $P109, "Undef"
  vivify_247:
    $S100 = $P109."Str"()
    concat $P110, $P108, $S100
    concat $P111, $P110, "'"
    $P112 = $P107."panic"($P111)
    .return ($P112)
.end


.namespace ["HLL";"Grammar"]
.sub "charname"  :subid("98_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .const 'Sub' $P1215 = "100_1308504717.31993" 
    capture_lex $P1215
    .local string rx1208_tgt
    .local int rx1208_pos
    .local int rx1208_off
    .local int rx1208_eos
    .local int rx1208_rep
    .local pmc rx1208_cur
    .local pmc rx1208_debug
    (rx1208_cur, rx1208_pos, rx1208_tgt, $I10) = self."!cursor_start"()
    getattribute rx1208_debug, rx1208_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1208_cur
    .local pmc match
    .lex "$/", match
    length rx1208_eos, rx1208_tgt
    gt rx1208_pos, rx1208_eos, rx1208_done
    set rx1208_off, 0
    lt rx1208_pos, 2, rx1208_start
    sub rx1208_off, rx1208_pos, 1
    substr rx1208_tgt, rx1208_tgt, rx1208_off
  rx1208_start:
    eq $I10, 1, rx1208_restart
    if_null rx1208_debug, debug_251
    rx1208_cur."!cursor_debug"("START", "charname")
  debug_251:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1210_done
    goto rxscan1210_scan
  rxscan1210_loop:
    ($P10) = rx1208_cur."from"()
    inc $P10
    set rx1208_pos, $P10
    ge rx1208_pos, rx1208_eos, rxscan1210_done
  rxscan1210_scan:
    set_addr $I10, rxscan1210_loop
    rx1208_cur."!mark_push"(0, rx1208_pos, $I10)
  rxscan1210_done:
  alt1211_0:
.annotate 'line', 111
    set_addr $I10, alt1211_1
    rx1208_cur."!mark_push"(0, rx1208_pos, $I10)
.annotate 'line', 112
  # rx subrule "integer" subtype=capture negate=
    rx1208_cur."!cursor_pos"(rx1208_pos)
    $P10 = rx1208_cur."integer"()
    unless $P10, rx1208_fail
    rx1208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx1208_pos = $P10."pos"()
    goto alt1211_end
  alt1211_1:
.annotate 'line', 113
  # rx enumcharlist negate=0 
    ge rx1208_pos, rx1208_eos, rx1208_fail
    sub $I10, rx1208_pos, rx1208_off
    substr $S10, rx1208_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx1208_fail
    inc rx1208_pos
  # rx rxquantf1212 ** 0..*
    set_addr $I10, rxquantf1212_loop
    rx1208_cur."!mark_push"(0, rx1208_pos, $I10)
    goto rxquantf1212_done
  rxquantf1212_loop:
  # rx enumcharlist negate=1 
    ge rx1208_pos, rx1208_eos, rx1208_fail
    sub $I10, rx1208_pos, rx1208_off
    substr $S10, rx1208_tgt, $I10, 1
    index $I11, "],#", $S10
    ge $I11, 0, rx1208_fail
    inc rx1208_pos
    set_addr $I10, rxquantf1212_loop
    rx1208_cur."!mark_push"(rx1208_rep, rx1208_pos, $I10)
  rxquantf1212_done:
  # rx enumcharlist negate=0 
    ge rx1208_pos, rx1208_eos, rx1208_fail
    sub $I10, rx1208_pos, rx1208_off
    substr $S10, rx1208_tgt, $I10, 1
    index $I11, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)", $S10
    lt $I11, 0, rx1208_fail
    inc rx1208_pos
.annotate 'line', 114
  # rx subrule "before" subtype=zerowidth negate=
    rx1208_cur."!cursor_pos"(rx1208_pos)
    .const 'Sub' $P1215 = "100_1308504717.31993" 
    capture_lex $P1215
    $P10 = rx1208_cur."before"($P1215)
    unless $P10, rx1208_fail
  alt1211_end:
.annotate 'line', 111
  # rx pass
    rx1208_cur."!cursor_pass"(rx1208_pos, "charname")
    if_null rx1208_debug, debug_256
    rx1208_cur."!cursor_debug"("PASS", "charname", " at pos=", rx1208_pos)
  debug_256:
    .return (rx1208_cur)
  rx1208_restart:
.annotate 'line', 5
    if_null rx1208_debug, debug_257
    rx1208_cur."!cursor_debug"("NEXT", "charname")
  debug_257:
  rx1208_fail:
    (rx1208_rep, rx1208_pos, $I10, $P10) = rx1208_cur."!mark_fail"(0)
    lt rx1208_pos, -1, rx1208_done
    eq rx1208_pos, -1, rx1208_fail
    jump $I10
  rx1208_done:
    rx1208_cur."!cursor_fail"()
    if_null rx1208_debug, debug_258
    rx1208_cur."!cursor_debug"("FAIL", "charname")
  debug_258:
    .return (rx1208_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charname"  :subid("99_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("integer", "")
    new $P101, "ResizablePMCArray"
    push $P101, "Z"
    push $P101, "Y"
    push $P101, "X"
    push $P101, "W"
    push $P101, "V"
    push $P101, "U"
    push $P101, "T"
    push $P101, "S"
    push $P101, "R"
    push $P101, "Q"
    push $P101, "P"
    push $P101, "O"
    push $P101, "N"
    push $P101, "M"
    push $P101, "L"
    push $P101, "K"
    push $P101, "J"
    push $P101, "I"
    push $P101, "H"
    push $P101, "G"
    push $P101, "F"
    push $P101, "E"
    push $P101, "D"
    push $P101, "C"
    push $P101, "B"
    push $P101, "A"
    push $P101, "z"
    push $P101, "y"
    push $P101, "x"
    push $P101, "w"
    push $P101, "v"
    push $P101, "u"
    push $P101, "t"
    push $P101, "s"
    push $P101, "r"
    push $P101, "q"
    push $P101, "p"
    push $P101, "o"
    push $P101, "n"
    push $P101, "m"
    push $P101, "l"
    push $P101, "k"
    push $P101, "j"
    push $P101, "i"
    push $P101, "h"
    push $P101, "g"
    push $P101, "f"
    push $P101, "e"
    push $P101, "d"
    push $P101, "c"
    push $P101, "b"
    push $P101, "a"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "_block1214"  :anon :subid("100_1308504717.31993") :method :outer("98_1308504717.31993")
.annotate 'line', 114
    .local string rx1216_tgt
    .local int rx1216_pos
    .local int rx1216_off
    .local int rx1216_eos
    .local int rx1216_rep
    .local pmc rx1216_cur
    .local pmc rx1216_debug
    (rx1216_cur, rx1216_pos, rx1216_tgt, $I10) = self."!cursor_start"()
    getattribute rx1216_debug, rx1216_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1216_cur
    .local pmc match
    .lex "$/", match
    length rx1216_eos, rx1216_tgt
    gt rx1216_pos, rx1216_eos, rx1216_done
    set rx1216_off, 0
    lt rx1216_pos, 2, rx1216_start
    sub rx1216_off, rx1216_pos, 1
    substr rx1216_tgt, rx1216_tgt, rx1216_off
  rx1216_start:
    eq $I10, 1, rx1216_restart
    if_null rx1216_debug, debug_252
    rx1216_cur."!cursor_debug"("START", "")
  debug_252:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1217_done
    goto rxscan1217_scan
  rxscan1217_loop:
    ($P10) = rx1216_cur."from"()
    inc $P10
    set rx1216_pos, $P10
    ge rx1216_pos, rx1216_eos, rxscan1217_done
  rxscan1217_scan:
    set_addr $I10, rxscan1217_loop
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  rxscan1217_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx1216_pos, rx1216_off
    find_not_cclass $I11, 32, rx1216_tgt, $I10, rx1216_eos
    add rx1216_pos, rx1216_off, $I11
  # rx enumcharlist negate=0 
    ge rx1216_pos, rx1216_eos, rx1216_fail
    sub $I10, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I10, 1
    index $I11, "],#", $S10
    lt $I11, 0, rx1216_fail
    inc rx1216_pos
  # rx pass
    rx1216_cur."!cursor_pass"(rx1216_pos, "")
    if_null rx1216_debug, debug_253
    rx1216_cur."!cursor_debug"("PASS", "", " at pos=", rx1216_pos)
  debug_253:
    .return (rx1216_cur)
  rx1216_restart:
    if_null rx1216_debug, debug_254
    rx1216_cur."!cursor_debug"("NEXT", "")
  debug_254:
  rx1216_fail:
    (rx1216_rep, rx1216_pos, $I10, $P10) = rx1216_cur."!mark_fail"(0)
    lt rx1216_pos, -1, rx1216_done
    eq rx1216_pos, -1, rx1216_fail
    jump $I10
  rx1216_done:
    rx1216_cur."!cursor_fail"()
    if_null rx1216_debug, debug_255
    rx1216_cur."!cursor_debug"("FAIL", "")
  debug_255:
    .return (rx1216_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "charnames"  :subid("101_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .local string rx1219_tgt
    .local int rx1219_pos
    .local int rx1219_off
    .local int rx1219_eos
    .local int rx1219_rep
    .local pmc rx1219_cur
    .local pmc rx1219_debug
    (rx1219_cur, rx1219_pos, rx1219_tgt, $I10) = self."!cursor_start"()
    rx1219_cur."!cursor_caparray"("charname")
    getattribute rx1219_debug, rx1219_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1219_cur
    .local pmc match
    .lex "$/", match
    length rx1219_eos, rx1219_tgt
    gt rx1219_pos, rx1219_eos, rx1219_done
    set rx1219_off, 0
    lt rx1219_pos, 2, rx1219_start
    sub rx1219_off, rx1219_pos, 1
    substr rx1219_tgt, rx1219_tgt, rx1219_off
  rx1219_start:
    eq $I10, 1, rx1219_restart
    if_null rx1219_debug, debug_259
    rx1219_cur."!cursor_debug"("START", "charnames")
  debug_259:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1221_done
    goto rxscan1221_scan
  rxscan1221_loop:
    ($P10) = rx1219_cur."from"()
    inc $P10
    set rx1219_pos, $P10
    ge rx1219_pos, rx1219_eos, rxscan1221_done
  rxscan1221_scan:
    set_addr $I10, rxscan1221_loop
    rx1219_cur."!mark_push"(0, rx1219_pos, $I10)
  rxscan1221_done:
.annotate 'line', 116
  # rx rxquantr1222 ** 1..*
    set_addr $I10, rxquantr1222_done
    rx1219_cur."!mark_push"(0, -1, $I10)
  rxquantr1222_loop:
  # rx subrule "ws" subtype=method negate=
    rx1219_cur."!cursor_pos"(rx1219_pos)
    $P10 = rx1219_cur."ws"()
    unless $P10, rx1219_fail
    rx1219_pos = $P10."pos"()
  # rx subrule "charname" subtype=capture negate=
    rx1219_cur."!cursor_pos"(rx1219_pos)
    $P10 = rx1219_cur."charname"()
    unless $P10, rx1219_fail
    rx1219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charname")
    rx1219_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1219_cur."!cursor_pos"(rx1219_pos)
    $P10 = rx1219_cur."ws"()
    unless $P10, rx1219_fail
    rx1219_pos = $P10."pos"()
    set_addr $I10, rxquantr1222_done
    (rx1219_rep) = rx1219_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1222_done
    rx1219_cur."!mark_push"(rx1219_rep, rx1219_pos, $I10)
  # rx literal  ","
    add $I11, rx1219_pos, 1
    gt $I11, rx1219_eos, rx1219_fail
    sub $I11, rx1219_pos, rx1219_off
    ord $I11, rx1219_tgt, $I11
    ne $I11, 44, rx1219_fail
    add rx1219_pos, 1
    goto rxquantr1222_loop
  rxquantr1222_done:
  # rx pass
    rx1219_cur."!cursor_pass"(rx1219_pos, "charnames")
    if_null rx1219_debug, debug_260
    rx1219_cur."!cursor_debug"("PASS", "charnames", " at pos=", rx1219_pos)
  debug_260:
    .return (rx1219_cur)
  rx1219_restart:
.annotate 'line', 5
    if_null rx1219_debug, debug_261
    rx1219_cur."!cursor_debug"("NEXT", "charnames")
  debug_261:
  rx1219_fail:
    (rx1219_rep, rx1219_pos, $I10, $P10) = rx1219_cur."!mark_fail"(0)
    lt rx1219_pos, -1, rx1219_done
    eq rx1219_pos, -1, rx1219_fail
    jump $I10
  rx1219_done:
    rx1219_cur."!cursor_fail"()
    if_null rx1219_debug, debug_262
    rx1219_cur."!cursor_debug"("FAIL", "charnames")
  debug_262:
    .return (rx1219_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charnames"  :subid("102_1308504717.31993") :method
.annotate 'line', 5
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["HLL";"Grammar"]
.sub "charspec"  :subid("103_1308504717.31993") :method :outer("11_1308504717.31993")
.annotate 'line', 5
    .const 'Sub' $P1230 = "105_1308504717.31993" 
    capture_lex $P1230
    .local string rx1224_tgt
    .local int rx1224_pos
    .local int rx1224_off
    .local int rx1224_eos
    .local int rx1224_rep
    .local pmc rx1224_cur
    .local pmc rx1224_debug
    (rx1224_cur, rx1224_pos, rx1224_tgt, $I10) = self."!cursor_start"()
    getattribute rx1224_debug, rx1224_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1224_cur
    .local pmc match
    .lex "$/", match
    length rx1224_eos, rx1224_tgt
    gt rx1224_pos, rx1224_eos, rx1224_done
    set rx1224_off, 0
    lt rx1224_pos, 2, rx1224_start
    sub rx1224_off, rx1224_pos, 1
    substr rx1224_tgt, rx1224_tgt, rx1224_off
  rx1224_start:
    eq $I10, 1, rx1224_restart
    if_null rx1224_debug, debug_263
    rx1224_cur."!cursor_debug"("START", "charspec")
  debug_263:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1226_done
    goto rxscan1226_scan
  rxscan1226_loop:
    ($P10) = rx1224_cur."from"()
    inc $P10
    set rx1224_pos, $P10
    ge rx1224_pos, rx1224_eos, rxscan1226_done
  rxscan1226_scan:
    set_addr $I10, rxscan1226_loop
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  rxscan1226_done:
  alt1227_0:
.annotate 'line', 118
    set_addr $I10, alt1227_1
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
.annotate 'line', 119
  # rx literal  "["
    add $I11, rx1224_pos, 1
    gt $I11, rx1224_eos, rx1224_fail
    sub $I11, rx1224_pos, rx1224_off
    ord $I11, rx1224_tgt, $I11
    ne $I11, 91, rx1224_fail
    add rx1224_pos, 1
  # rx subrule "charnames" subtype=capture negate=
    rx1224_cur."!cursor_pos"(rx1224_pos)
    $P10 = rx1224_cur."charnames"()
    unless $P10, rx1224_fail
    rx1224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charnames")
    rx1224_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1224_pos, 1
    gt $I11, rx1224_eos, rx1224_fail
    sub $I11, rx1224_pos, rx1224_off
    ord $I11, rx1224_tgt, $I11
    ne $I11, 93, rx1224_fail
    add rx1224_pos, 1
    goto alt1227_end
  alt1227_1:
    set_addr $I10, alt1227_2
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
.annotate 'line', 120
  # rx charclass_q d r 1..-1
    sub $I10, rx1224_pos, rx1224_off
    find_not_cclass $I11, 8, rx1224_tgt, $I10, rx1224_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1224_fail
    add rx1224_pos, rx1224_off, $I11
  # rx rxquantr1228 ** 0..*
    set_addr $I10, rxquantr1228_done
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  rxquantr1228_loop:
  # rx literal  "_"
    add $I11, rx1224_pos, 1
    gt $I11, rx1224_eos, rx1224_fail
    sub $I11, rx1224_pos, rx1224_off
    ord $I11, rx1224_tgt, $I11
    ne $I11, 95, rx1224_fail
    add rx1224_pos, 1
  # rx charclass_q d r 1..-1
    sub $I10, rx1224_pos, rx1224_off
    find_not_cclass $I11, 8, rx1224_tgt, $I10, rx1224_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1224_fail
    add rx1224_pos, rx1224_off, $I11
    set_addr $I10, rxquantr1228_done
    (rx1224_rep) = rx1224_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1228_done
    rx1224_cur."!mark_push"(rx1224_rep, rx1224_pos, $I10)
    goto rxquantr1228_loop
  rxquantr1228_done:
    goto alt1227_end
  alt1227_2:
    set_addr $I10, alt1227_3
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
.annotate 'line', 121
  # rx enumcharlist negate=0 
    ge rx1224_pos, rx1224_eos, rx1224_fail
    sub $I10, rx1224_pos, rx1224_off
    substr $S10, rx1224_tgt, $I10, 1
    index $I11, "?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", $S10
    lt $I11, 0, rx1224_fail
    inc rx1224_pos
    goto alt1227_end
  alt1227_3:
.annotate 'line', 122
    rx1224_cur."!cursor_pos"(rx1224_pos)
    find_lex $P102, unicode:"$\x{a2}"
    $P103 = $P102."MATCH"()
    store_lex "$/", $P103
    .const 'Sub' $P1230 = "105_1308504717.31993" 
    capture_lex $P1230
    $P104 = $P1230()
  alt1227_end:
.annotate 'line', 117
  # rx pass
    rx1224_cur."!cursor_pass"(rx1224_pos, "charspec")
    if_null rx1224_debug, debug_264
    rx1224_cur."!cursor_debug"("PASS", "charspec", " at pos=", rx1224_pos)
  debug_264:
    .return (rx1224_cur)
  rx1224_restart:
.annotate 'line', 5
    if_null rx1224_debug, debug_265
    rx1224_cur."!cursor_debug"("NEXT", "charspec")
  debug_265:
  rx1224_fail:
    (rx1224_rep, rx1224_pos, $I10, $P10) = rx1224_cur."!mark_fail"(0)
    lt rx1224_pos, -1, rx1224_done
    eq rx1224_pos, -1, rx1224_fail
    jump $I10
  rx1224_done:
    rx1224_cur."!cursor_fail"()
    if_null rx1224_debug, debug_266
    rx1224_cur."!cursor_debug"("FAIL", "charspec")
  debug_266:
    .return (rx1224_cur)
    .return ()
.end


.namespace ["HLL";"Grammar"]
.sub "!PREFIX__charspec"  :subid("104_1308504717.31993") :method
.annotate 'line', 5
    $P100 = self."!PREFIX__!subrule"("charnames", "[")
    new $P101, "ResizablePMCArray"
    push $P101, ""
    push $P101, "Z"
    push $P101, "Y"
    push $P101, "X"
    push $P101, "W"
    push $P101, "V"
    push $P101, "U"
    push $P101, "T"
    push $P101, "S"
    push $P101, "R"
    push $P101, "Q"
    push $P101, "P"
    push $P101, "O"
    push $P101, "N"
    push $P101, "M"
    push $P101, "L"
    push $P101, "K"
    push $P101, "J"
    push $P101, "I"
    push $P101, "H"
    push $P101, "G"
    push $P101, "F"
    push $P101, "E"
    push $P101, "D"
    push $P101, "C"
    push $P101, "B"
    push $P101, "A"
    push $P101, "@"
    push $P101, "?"
    push $P101, ""
    push $P101, $P100
    .return ($P101)
.end


.namespace ["HLL";"Grammar"]
.sub "_block1229"  :anon :subid("105_1308504717.31993") :outer("103_1308504717.31993")
.annotate 'line', 122
    find_lex $P104, "$/"
    $P105 = $P104."CURSOR"()
    $P106 = $P105."panic"("Unrecognized \\c character")
    .return ($P106)
.end


.namespace ["HLL";"Grammar"]
.sub "_block1231" :load :anon :subid("106_1308504717.31993")
.annotate 'line', 5
    .const 'Sub' $P1233 = "11_1308504717.31993" 
    $P100 = $P1233()
    .return ($P100)
.end


.namespace []
.sub "_block1234" :load :anon :subid("107_1308504717.31993")
.annotate 'line', 1
    .const 'Sub' $P1236 = "10_1308504717.31993" 
    $P100 = $P1236()
    .return ($P100)
.end

### .include 'gen/hllgrammar-actions.pir'

.namespace []
.sub "_block1000"  :anon :subid("10_1308504718.83038")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308504718.83038" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    .const 'Sub' $P1003 = "11_1308504718.83038" 
    capture_lex $P1003
    $P101 = $P1003()
.annotate 'line', 1
    .return ($P101)
    .const 'Sub' $P1264 = "55_1308504718.83038" 
    .return ($P1264)
.end


.namespace []
.sub "" :load :init :subid("post56") :outer("10_1308504718.83038")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308504718.83038" 
    .local pmc block
    set block, $P1001
    $P1266 = get_root_global ["parrot"], "P6metaclass"
    $P1266."new_class"("HLL::Actions")
.end


.namespace ["HLL";"Actions"]
.sub "_block1002"  :subid("11_1308504718.83038") :outer("10_1308504718.83038")
.annotate 'line', 3
    .const 'Sub' $P1252 = "53_1308504718.83038" 
    capture_lex $P1252
    .const 'Sub' $P1242 = "51_1308504718.83038" 
    capture_lex $P1242
    .const 'Sub' $P1233 = "50_1308504718.83038" 
    capture_lex $P1233
    .const 'Sub' $P1225 = "49_1308504718.83038" 
    capture_lex $P1225
    .const 'Sub' $P1221 = "48_1308504718.83038" 
    capture_lex $P1221
    .const 'Sub' $P1216 = "47_1308504718.83038" 
    capture_lex $P1216
    .const 'Sub' $P1207 = "46_1308504718.83038" 
    capture_lex $P1207
    .const 'Sub' $P1198 = "45_1308504718.83038" 
    capture_lex $P1198
    .const 'Sub' $P1194 = "44_1308504718.83038" 
    capture_lex $P1194
    .const 'Sub' $P1190 = "43_1308504718.83038" 
    capture_lex $P1190
    .const 'Sub' $P1186 = "42_1308504718.83038" 
    capture_lex $P1186
    .const 'Sub' $P1182 = "41_1308504718.83038" 
    capture_lex $P1182
    .const 'Sub' $P1178 = "40_1308504718.83038" 
    capture_lex $P1178
    .const 'Sub' $P1174 = "39_1308504718.83038" 
    capture_lex $P1174
    .const 'Sub' $P1169 = "38_1308504718.83038" 
    capture_lex $P1169
    .const 'Sub' $P1165 = "37_1308504718.83038" 
    capture_lex $P1165
    .const 'Sub' $P1158 = "36_1308504718.83038" 
    capture_lex $P1158
    .const 'Sub' $P1138 = "34_1308504718.83038" 
    capture_lex $P1138
    .const 'Sub' $P1119 = "31_1308504718.83038" 
    capture_lex $P1119
    .const 'Sub' $P1115 = "30_1308504718.83038" 
    capture_lex $P1115
    .const 'Sub' $P1111 = "29_1308504718.83038" 
    capture_lex $P1111
    .const 'Sub' $P1107 = "28_1308504718.83038" 
    capture_lex $P1107
    .const 'Sub' $P1103 = "27_1308504718.83038" 
    capture_lex $P1103
    .const 'Sub' $P1099 = "26_1308504718.83038" 
    capture_lex $P1099
    .const 'Sub' $P1094 = "25_1308504718.83038" 
    capture_lex $P1094
    .const 'Sub' $P1089 = "24_1308504718.83038" 
    capture_lex $P1089
    .const 'Sub' $P1084 = "23_1308504718.83038" 
    capture_lex $P1084
    .const 'Sub' $P1079 = "22_1308504718.83038" 
    capture_lex $P1079
    .const 'Sub' $P1074 = "21_1308504718.83038" 
    capture_lex $P1074
    .const 'Sub' $P1033 = "18_1308504718.83038" 
    capture_lex $P1033
    .const 'Sub' $P1018 = "15_1308504718.83038" 
    capture_lex $P1018
    .const 'Sub' $P1015 = "14_1308504718.83038" 
    capture_lex $P1015
    .const 'Sub' $P1010 = "13_1308504718.83038" 
    capture_lex $P1010
    .const 'Sub' $P1004 = "12_1308504718.83038" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 225
    .const 'Sub' $P1252 = "53_1308504718.83038" 
    newclosure $P1259, $P1252
.annotate 'line', 3
    .return ($P1259)
    .const 'Sub' $P1261 = "54_1308504718.83038" 
    .return ($P1261)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "string_to_int"  :subid("12_1308504718.83038") :outer("11_1308504718.83038")
    .param pmc param_1007
    .param pmc param_1008
.annotate 'line', 3
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "$src", param_1007
    .lex "$base", param_1008
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
        $P1009 = box result
    
.annotate 'line', 3
    .return ($P1009)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "ints_to_string"  :subid("13_1308504718.83038") :outer("11_1308504718.83038")
    .param pmc param_1013
.annotate 'line', 37
    new $P1012, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1012, control_1011
    push_eh $P1012
    .lex "$ints", param_1013
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
        $P1014 = box result
    
.annotate 'line', 37
    .return ($P1014)
  control_1011:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "CTXSAVE"  :subid("14_1308504718.83038") :method :outer("11_1308504718.83038")
.annotate 'line', 62
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
.annotate 'line', 63
    get_hll_global $P100, ["PAST"], "Op"
.annotate 'line', 69
    new $P101, "ResizablePMCArray"
    push $P101, "    $P0 = find_dynamic_lex \"$*CTXSAVE\""
    push $P101, "    if null $P0 goto ctxsave_done"
    push $P101, "    $I0 = can $P0, \"ctxsave\""
    push $P101, "    unless $I0 goto ctxsave_done"
    push $P101, "    $P0.\"ctxsave\"()"
    push $P101, "  ctxsave_done:"
.annotate 'line', 63
    $P102 = $P100."new"($P101 :named("inline"))
.annotate 'line', 62
    .return ($P102)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "SET_BLOCK_OUTER_CTX"  :subid("15_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1021
.annotate 'line', 76
    .const 'Sub' $P1026 = "16_1308504718.83038" 
    capture_lex $P1026
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .lex "$block", param_1021
.annotate 'line', 77
    new $P100, "Undef"
    set $P1022, $P100
    .lex "$outer_ctx", $P1022
    find_dynamic_lex $P101, "%*COMPILING"
    unless_null $P101, vivify_57
    get_hll_global $P101, "%COMPILING"
    unless_null $P101, vivify_58
    die "Contextual %*COMPILING not found"
  vivify_58:
  vivify_57:
    set $P1023, $P101["%?OPTIONS"]
    unless_null $P1023, vivify_59
    $P1023 = root_new ['parrot';'Hash']
  vivify_59:
    set $P102, $P1023["outer_ctx"]
    unless_null $P102, vivify_60
    new $P102, "Undef"
  vivify_60:
    store_lex "$outer_ctx", $P102
.annotate 'line', 78
    find_lex $P102, "$outer_ctx"
    defined $I100, $P102
    if $I100, if_1024
    new $P101, 'Integer'
    set $P101, $I100
    goto if_1024_end
  if_1024:
    .const 'Sub' $P1026 = "16_1308504718.83038" 
    capture_lex $P1026
    $P104 = $P1026()
    set $P101, $P104
  if_1024_end:
.annotate 'line', 76
    .return ($P101)
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "_block1025"  :anon :subid("16_1308504718.83038") :outer("15_1308504718.83038")
.annotate 'line', 78
    .const 'Sub' $P1030 = "17_1308504718.83038" 
    capture_lex $P1030
.annotate 'line', 79
    $P1028 = root_new ['parrot';'ResizablePMCArray']
    set $P1027, $P1028
    .lex "@ns", $P1027
    find_lex $P103, "$outer_ctx"
    getattribute $P104, $P103, "current_namespace"
    $P105 = $P104."get_name"()
    store_lex "@ns", $P105
.annotate 'line', 80
    find_lex $P103, "@ns"
    $P103."shift"()
.annotate 'line', 81
    find_lex $P103, "$block"
    find_lex $P104, "@ns"
    $P103."namespace"($P104)
.annotate 'line', 82
    find_lex $P104, "$outer_ctx"
    $P105 = $P104."lexpad_full"()
    defined $I101, $P105
    unless $I101, for_undef_61
    iter $P103, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1032_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1032_test:
    unless $P103, loop1032_done
    shift $P106, $P103
  loop1032_redo:
    .const 'Sub' $P1030 = "17_1308504718.83038" 
    capture_lex $P1030
    $P1030($P106)
  loop1032_next:
    goto loop1032_test
  loop1032_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1032_next
    eq $P108, .CONTROL_LOOP_REDO, loop1032_redo
  loop1032_done:
    pop_eh 
  for_undef_61:
.annotate 'line', 78
    .return ($P103)
.end


.namespace ["HLL";"Actions"]
.sub "_block1029"  :anon :subid("17_1308504718.83038") :outer("16_1308504718.83038")
    .param pmc param_1031
.annotate 'line', 82
    .lex "$_", param_1031
.annotate 'line', 83
    find_lex $P107, "$block"
    find_lex $P108, "$_"
    $P109 = $P108."key"()
    $P110 = $P107."symbol"($P109, "lexical" :named("scope"))
.annotate 'line', 82
    .return ($P110)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "EXPR"  :subid("18_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1036
    .param pmc param_1037 :optional
    .param int has_param_1037 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P1070 = "20_1308504718.83038" 
    capture_lex $P1070
    .const 'Sub' $P1061 = "19_1308504718.83038" 
    capture_lex $P1061
    new $P1035, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1035, control_1034
    push_eh $P1035
    .lex "self", self
    .lex "$/", param_1036
    if has_param_1037, optparam_62
    new $P100, "Undef"
    set param_1037, $P100
  optparam_62:
    .lex "$key", param_1037
.annotate 'line', 91
    new $P101, "Undef"
    set $P1038, $P101
    .lex "$past", $P1038
.annotate 'line', 90
    find_lex $P102, "$key"
    if $P102, unless_1039_end
    new $P103, "Exception"
    set $P103['type'], .CONTROL_RETURN
    new $P104, "Integer"
    assign $P104, 0
    setattribute $P103, 'payload', $P104
    throw $P103
  unless_1039_end:
.annotate 'line', 91
    find_lex $P102, "$/"
    $P103 = $P102."ast"()
    set $P1040, $P103
    defined $I1042, $P1040
    if $I1042, default_1041
    find_lex $P1043, "$/"
    unless_null $P1043, vivify_63
    $P1043 = root_new ['parrot';'Hash']
  vivify_63:
    set $P104, $P1043["OPER"]
    unless_null $P104, vivify_64
    new $P104, "Undef"
  vivify_64:
    $P105 = $P104."ast"()
    set $P1040, $P105
  default_1041:
    store_lex "$past", $P1040
.annotate 'line', 92
    find_lex $P102, "$past"
    if $P102, unless_1044_end
.annotate 'line', 93
    get_hll_global $P103, ["PAST"], "Op"
    find_lex $P104, "$/"
    $P105 = $P103."new"($P104 :named("node"))
    store_lex "$past", $P105
.annotate 'line', 94
    find_lex $P1046, "$/"
    unless_null $P1046, vivify_65
    $P1046 = root_new ['parrot';'Hash']
  vivify_65:
    set $P1047, $P1046["OPER"]
    unless_null $P1047, vivify_66
    $P1047 = root_new ['parrot';'Hash']
  vivify_66:
    set $P1048, $P1047["O"]
    unless_null $P1048, vivify_67
    $P1048 = root_new ['parrot';'Hash']
  vivify_67:
    set $P103, $P1048["pasttype"]
    unless_null $P103, vivify_68
    new $P103, "Undef"
  vivify_68:
    if $P103, if_1045
.annotate 'line', 95
    find_lex $P1053, "$/"
    unless_null $P1053, vivify_69
    $P1053 = root_new ['parrot';'Hash']
  vivify_69:
    set $P1054, $P1053["OPER"]
    unless_null $P1054, vivify_70
    $P1054 = root_new ['parrot';'Hash']
  vivify_70:
    set $P1055, $P1054["O"]
    unless_null $P1055, vivify_71
    $P1055 = root_new ['parrot';'Hash']
  vivify_71:
    set $P104, $P1055["pirop"]
    unless_null $P104, vivify_72
    new $P104, "Undef"
  vivify_72:
    unless $P104, if_1052_end
    find_lex $P105, "$past"
    find_lex $P1056, "$/"
    unless_null $P1056, vivify_73
    $P1056 = root_new ['parrot';'Hash']
  vivify_73:
    set $P1057, $P1056["OPER"]
    unless_null $P1057, vivify_74
    $P1057 = root_new ['parrot';'Hash']
  vivify_74:
    set $P1058, $P1057["O"]
    unless_null $P1058, vivify_75
    $P1058 = root_new ['parrot';'Hash']
  vivify_75:
    set $P106, $P1058["pirop"]
    unless_null $P106, vivify_76
    new $P106, "Undef"
  vivify_76:
    set $S100, $P106
    $P105."pirop"($S100)
  if_1052_end:
    goto if_1045_end
  if_1045:
.annotate 'line', 94
    find_lex $P104, "$past"
    find_lex $P1049, "$/"
    unless_null $P1049, vivify_77
    $P1049 = root_new ['parrot';'Hash']
  vivify_77:
    set $P1050, $P1049["OPER"]
    unless_null $P1050, vivify_78
    $P1050 = root_new ['parrot';'Hash']
  vivify_78:
    set $P1051, $P1050["O"]
    unless_null $P1051, vivify_79
    $P1051 = root_new ['parrot';'Hash']
  vivify_79:
    set $P105, $P1051["pasttype"]
    unless_null $P105, vivify_80
    new $P105, "Undef"
  vivify_80:
    set $S100, $P105
    $P104."pasttype"($S100)
  if_1045_end:
.annotate 'line', 96
    find_lex $P103, "$past"
    $P104 = $P103."name"()
    if $P104, unless_1059_end
    .const 'Sub' $P1061 = "19_1308504718.83038" 
    capture_lex $P1061
    $P1061()
  unless_1059_end:
  unless_1044_end:
.annotate 'line', 107
    find_lex $P102, "$key"
    set $S100, $P102
    iseq $I100, $S100, "POSTFIX"
    if $I100, if_1067
.annotate 'line', 109
    find_lex $P104, "$/"
    $P105 = $P104."list"()
    defined $I101, $P105
    unless $I101, for_undef_84
    iter $P103, $P105
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1073_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1073_test:
    unless $P103, loop1073_done
    shift $P106, $P103
  loop1073_redo:
    .const 'Sub' $P1070 = "20_1308504718.83038" 
    capture_lex $P1070
    $P1070($P106)
  loop1073_next:
    goto loop1073_test
  loop1073_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1073_next
    eq $P109, .CONTROL_LOOP_REDO, loop1073_redo
  loop1073_done:
    pop_eh 
  for_undef_84:
.annotate 'line', 108
    goto if_1067_end
  if_1067:
.annotate 'line', 107
    find_lex $P103, "$past"
    find_lex $P1068, "$/"
    unless_null $P1068, vivify_85
    $P1068 = root_new ['parrot';'ResizablePMCArray']
  vivify_85:
    set $P104, $P1068[0]
    unless_null $P104, vivify_86
    new $P104, "Undef"
  vivify_86:
    $P105 = $P104."ast"()
    $P103."unshift"($P105)
  if_1067_end:
.annotate 'line', 111
    find_lex $P102, "$/"
    find_lex $P103, "$past"
    $P104 = $P102."!make"($P103)
.annotate 'line', 89
    .return ($P104)
  control_1034:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["HLL";"Actions"]
.sub "_block1060"  :anon :subid("19_1308504718.83038") :outer("18_1308504718.83038")
.annotate 'line', 98
    new $P105, "Undef"
    set $P1062, $P105
    .lex "$name", $P1062
.annotate 'line', 97
    find_lex $P106, "$key"
    set $S100, $P106
    iseq $I100, $S100, "LIST"
    unless $I100, if_1063_end
    new $P107, "String"
    assign $P107, "infix"
    store_lex "$key", $P107
  if_1063_end:
.annotate 'line', 98

                $P0 = find_lex '$key'
                $S0 = $P0
                $S0 = downcase $S0
                $P1064 = box $S0
            
    concat $P106, $P1064, ":<"
.annotate 'line', 103
    find_lex $P1065, "$/"
    unless_null $P1065, vivify_81
    $P1065 = root_new ['parrot';'Hash']
  vivify_81:
    set $P1066, $P1065["OPER"]
    unless_null $P1066, vivify_82
    $P1066 = root_new ['parrot';'Hash']
  vivify_82:
    set $P107, $P1066["sym"]
    unless_null $P107, vivify_83
    new $P107, "Undef"
  vivify_83:
    concat $P108, $P106, $P107
    concat $P109, $P108, ">"
    store_lex "$name", $P109
.annotate 'line', 104
    find_lex $P106, "$past"
    new $P107, "String"
    assign $P107, "&"
    find_lex $P108, "$name"
    concat $P109, $P107, $P108
    $P110 = $P106."name"($P109)
.annotate 'line', 96
    .return ($P110)
.end


.namespace ["HLL";"Actions"]
.sub "_block1069"  :anon :subid("20_1308504718.83038") :outer("18_1308504718.83038")
    .param pmc param_1071
.annotate 'line', 109
    .lex "$_", param_1071
    find_lex $P108, "$_"
    $P109 = $P108."ast"()
    defined $I102, $P109
    if $I102, if_1072
    new $P107, 'Integer'
    set $P107, $I102
    goto if_1072_end
  if_1072:
    find_lex $P110, "$past"
    find_lex $P111, "$_"
    $P112 = $P111."ast"()
    $P113 = $P110."push"($P112)
    set $P107, $P113
  if_1072_end:
    .return ($P107)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "term:sym<circumfix>"  :subid("21_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1077
.annotate 'line', 114
    new $P1076, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1076, control_1075
    push_eh $P1076
    .lex "self", self
    .lex "$/", param_1077
    find_lex $P100, "$/"
    find_lex $P1078, "$/"
    unless_null $P1078, vivify_87
    $P1078 = root_new ['parrot';'Hash']
  vivify_87:
    set $P101, $P1078["circumfix"]
    unless_null $P101, vivify_88
    new $P101, "Undef"
  vivify_88:
    $P102 = $P101."ast"()
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1075:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("22_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1082
.annotate 'line', 116
    new $P1081, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1081, control_1080
    push_eh $P1081
    .lex "self", self
    .lex "$/", param_1082
    find_lex $P100, "$/"
    find_lex $P1083, "$/"
    unless_null $P1083, vivify_89
    $P1083 = root_new ['parrot';'Hash']
  vivify_89:
    set $P101, $P1083["term"]
    unless_null $P101, vivify_90
    new $P101, "Undef"
  vivify_90:
    $P102 = $P101."ast"()
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "nullterm"  :subid("23_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1087
.annotate 'line', 117
    new $P1086, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1086, control_1085
    push_eh $P1086
    .lex "self", self
    .lex "$/", param_1087
    find_lex $P100, "$/"
 $P1088 = new ['Undef'] 
    $P101 = $P100."!make"($P1088)
    .return ($P101)
  control_1085:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "nullterm_alt"  :subid("24_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1092
.annotate 'line', 118
    new $P1091, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1091, control_1090
    push_eh $P1091
    .lex "self", self
    .lex "$/", param_1092
    find_lex $P100, "$/"
    find_lex $P1093, "$/"
    unless_null $P1093, vivify_91
    $P1093 = root_new ['parrot';'Hash']
  vivify_91:
    set $P101, $P1093["term"]
    unless_null $P101, vivify_92
    new $P101, "Undef"
  vivify_92:
    $P102 = $P101."ast"()
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1090:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "integer"  :subid("25_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1097
.annotate 'line', 120
    new $P1096, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1096, control_1095
    push_eh $P1096
    .lex "self", self
    .lex "$/", param_1097
    find_lex $P100, "$/"
    find_lex $P1098, "$/"
    unless_null $P1098, vivify_93
    $P1098 = root_new ['parrot';'Hash']
  vivify_93:
    set $P101, $P1098["VALUE"]
    unless_null $P101, vivify_94
    new $P101, "Undef"
  vivify_94:
    $P102 = $P101."ast"()
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1095:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "dec_number"  :subid("26_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1102
.annotate 'line', 122
    new $P1101, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1101, control_1100
    push_eh $P1101
    .lex "self", self
    .lex "$/", param_1102
    find_lex $P100, "$/"
    find_lex $P101, "$/"
    set $N100, $P101
    $P102 = $P100."!make"($N100)
    .return ($P102)
  control_1100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "decint"  :subid("27_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1106
.annotate 'line', 124
    new $P1105, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1105, control_1104
    push_eh $P1105
    .lex "self", self
    .lex "$/", param_1106
    find_lex $P100, "$/"
    find_lex $P101, "$/"
    $P102 = "string_to_int"($P101, 10)
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "hexint"  :subid("28_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1110
.annotate 'line', 125
    new $P1109, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1109, control_1108
    push_eh $P1109
    .lex "self", self
    .lex "$/", param_1110
    find_lex $P100, "$/"
    find_lex $P101, "$/"
    $P102 = "string_to_int"($P101, 16)
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "octint"  :subid("29_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1114
.annotate 'line', 126
    new $P1113, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1113, control_1112
    push_eh $P1113
    .lex "self", self
    .lex "$/", param_1114
    find_lex $P100, "$/"
    find_lex $P101, "$/"
    $P102 = "string_to_int"($P101, 8)
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "binint"  :subid("30_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1118
.annotate 'line', 127
    new $P1117, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1117, control_1116
    push_eh $P1117
    .lex "self", self
    .lex "$/", param_1118
    find_lex $P100, "$/"
    find_lex $P101, "$/"
    $P102 = "string_to_int"($P101, 2)
    $P103 = $P100."!make"($P102)
    .return ($P103)
  control_1116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_EXPR"  :subid("31_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1122
.annotate 'line', 129
    .const 'Sub' $P1128 = "32_1308504718.83038" 
    capture_lex $P1128
    new $P1121, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1121, control_1120
    push_eh $P1121
    .lex "self", self
    .lex "$/", param_1122
.annotate 'line', 130
    new $P100, "Undef"
    set $P1123, $P100
    .lex "$past", $P1123
    find_lex $P1124, "$/"
    unless_null $P1124, vivify_95
    $P1124 = root_new ['parrot';'Hash']
  vivify_95:
    set $P101, $P1124["quote_delimited"]
    unless_null $P101, vivify_96
    new $P101, "Undef"
  vivify_96:
    $P102 = $P101."ast"()
    store_lex "$past", $P102
.annotate 'line', 131
    find_lex $P101, "$/"
    $P102 = $P101."CURSOR"()
    $P103 = $P102."quotemod_check"("w")
    unless $P103, if_1125_end
.annotate 'line', 132
    get_hll_global $P104, ["PAST"], "Node"
    find_lex $P105, "$past"
    $P106 = $P104."ACCEPTS"($P105)
    if $P106, if_1126
.annotate 'line', 135
    .const 'Sub' $P1128 = "32_1308504718.83038" 
    capture_lex $P1128
    $P1128()
    goto if_1126_end
  if_1126:
.annotate 'line', 133
    find_lex $P107, "$/"
    $P108 = $P107."CURSOR"()
    $P108."panic"("Can't form :w list from non-constant strings (yet)")
  if_1126_end:
  if_1125_end:
.annotate 'line', 146
    get_hll_global $P101, ["PAST"], "Node"
    find_lex $P102, "$past"
    $P103 = $P101."ACCEPTS"($P102)
    isfalse $I100, $P103
    unless $I100, if_1137_end
.annotate 'line', 147
    get_hll_global $P104, ["PAST"], "Val"
    find_lex $P105, "$past"
    set $S100, $P105
    $P106 = $P104."new"($S100 :named("value"))
    store_lex "$past", $P106
  if_1137_end:
.annotate 'line', 149
    find_lex $P101, "$/"
    find_lex $P102, "$past"
    $P103 = $P101."!make"($P102)
.annotate 'line', 129
    .return ($P103)
  control_1120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "_block1127"  :anon :subid("32_1308504718.83038") :outer("31_1308504718.83038")
.annotate 'line', 135
    .const 'Sub' $P1133 = "33_1308504718.83038" 
    capture_lex $P1133
.annotate 'line', 136
    $P1130 = root_new ['parrot';'ResizablePMCArray']
    set $P1129, $P1130
    .lex "@words", $P1129
    get_hll_global $P107, ["HLL";"Grammar"], "split_words"
    find_lex $P108, "$/"
    find_lex $P109, "$past"
    $P110 = $P107($P108, $P109)
    store_lex "@words", $P110
.annotate 'line', 137
    find_lex $P108, "@words"
    set $N100, $P108
    isne $I100, $N100, 1.0
    if $I100, if_1131
.annotate 'line', 142
    find_lex $P1136, "@words"
    unless_null $P1136, vivify_97
    $P1136 = root_new ['parrot';'ResizablePMCArray']
  vivify_97:
    set $P110, $P1136[0]
    unless_null $P110, vivify_98
    new $P110, "Undef"
  vivify_98:
    set $S100, $P110
    new $P111, 'String'
    set $P111, $S100
    store_lex "$past", $P111
.annotate 'line', 141
    set $P107, $P111
.annotate 'line', 137
    goto if_1131_end
  if_1131:
.annotate 'line', 138
    get_hll_global $P109, ["PAST"], "Op"
    find_lex $P110, "$/"
    $P111 = $P109."new"("list" :named("pasttype"), $P110 :named("node"))
    store_lex "$past", $P111
.annotate 'line', 139
    find_lex $P110, "@words"
    defined $I101, $P110
    unless $I101, for_undef_99
    iter $P109, $P110
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1135_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1135_test:
    unless $P109, loop1135_done
    shift $P111, $P109
  loop1135_redo:
    .const 'Sub' $P1133 = "33_1308504718.83038" 
    capture_lex $P1133
    $P1133($P111)
  loop1135_next:
    goto loop1135_test
  loop1135_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1135_next
    eq $P113, .CONTROL_LOOP_REDO, loop1135_redo
  loop1135_done:
    pop_eh 
  for_undef_99:
.annotate 'line', 137
    set $P107, $P109
  if_1131_end:
.annotate 'line', 135
    .return ($P107)
.end


.namespace ["HLL";"Actions"]
.sub "_block1132"  :anon :subid("33_1308504718.83038") :outer("32_1308504718.83038")
    .param pmc param_1134
.annotate 'line', 139
    .lex "$_", param_1134
    find_lex $P112, "$past"
    find_lex $P113, "$_"
    $P114 = $P112."push"($P113)
    .return ($P114)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_delimited"  :subid("34_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1141
.annotate 'line', 152
    .const 'Sub' $P1148 = "35_1308504718.83038" 
    capture_lex $P1148
    new $P1140, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1140, control_1139
    push_eh $P1140
    .lex "self", self
    .lex "$/", param_1141
.annotate 'line', 153
    $P1143 = root_new ['parrot';'ResizablePMCArray']
    set $P1142, $P1143
    .lex "@parts", $P1142
.annotate 'line', 154
    new $P100, "Undef"
    set $P1144, $P100
    .lex "$lastlit", $P1144
.annotate 'line', 170
    new $P101, "Undef"
    set $P1145, $P101
    .lex "$past", $P1145
.annotate 'line', 152
    find_lex $P102, "@parts"
.annotate 'line', 154
    new $P102, "String"
    assign $P102, ""
    store_lex "$lastlit", $P102
.annotate 'line', 155
    find_lex $P1146, "$/"
    unless_null $P1146, vivify_100
    $P1146 = root_new ['parrot';'Hash']
  vivify_100:
    set $P103, $P1146["quote_atom"]
    unless_null $P103, vivify_101
    new $P103, "Undef"
  vivify_101:
    defined $I100, $P103
    unless $I100, for_undef_102
    iter $P102, $P103
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1154_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1154_test:
    unless $P102, loop1154_done
    shift $P104, $P102
  loop1154_redo:
    .const 'Sub' $P1148 = "35_1308504718.83038" 
    capture_lex $P1148
    $P1148($P104)
  loop1154_next:
    goto loop1154_test
  loop1154_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1154_next
    eq $P108, .CONTROL_LOOP_REDO, loop1154_redo
  loop1154_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 169
    find_lex $P102, "$lastlit"
    set $S100, $P102
    isgt $I100, $S100, ""
    unless $I100, if_1155_end
    find_lex $P103, "@parts"
    find_lex $P104, "$lastlit"
    $P103."push"($P104)
  if_1155_end:
.annotate 'line', 170
    find_lex $P103, "@parts"
    if $P103, if_1156
    new $P106, "String"
    assign $P106, ""
    set $P102, $P106
    goto if_1156_end
  if_1156:
    find_lex $P104, "@parts"
    $P105 = $P104."shift"()
    set $P102, $P105
  if_1156_end:
    store_lex "$past", $P102
.annotate 'line', 171
    new $P103, 'ExceptionHandler'
    set_label $P103, loop1157_handler
    $P103."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P103
  loop1157_test:
    find_lex $P102, "@parts"
    unless $P102, loop1157_done
  loop1157_redo:
.annotate 'line', 172
    get_hll_global $P103, ["PAST"], "Op"
    find_lex $P104, "$past"
    find_lex $P105, "@parts"
    $P106 = $P105."shift"()
    $P107 = $P103."new"($P104, $P106, "concat" :named("pirop"))
    store_lex "$past", $P107
  loop1157_next:
.annotate 'line', 171
    goto loop1157_test
  loop1157_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, 'type'
    eq $P104, .CONTROL_LOOP_NEXT, loop1157_next
    eq $P104, .CONTROL_LOOP_REDO, loop1157_redo
  loop1157_done:
    pop_eh 
.annotate 'line', 174
    find_lex $P102, "$/"
    find_lex $P103, "$past"
    $P104 = $P102."!make"($P103)
.annotate 'line', 152
    .return ($P104)
  control_1139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["HLL";"Actions"]
.sub "_block1147"  :anon :subid("35_1308504718.83038") :outer("34_1308504718.83038")
    .param pmc param_1150
.annotate 'line', 156
    new $P105, "Undef"
    set $P1149, $P105
    .lex "$ast", $P1149
    .lex "$_", param_1150
    find_lex $P106, "$_"
    $P107 = $P106."ast"()
    store_lex "$ast", $P107
.annotate 'line', 157
    get_hll_global $P107, ["PAST"], "Node"
    find_lex $P108, "$ast"
    $P109 = $P107."ACCEPTS"($P108)
    isfalse $I101, $P109
    if $I101, if_1151
.annotate 'line', 160
    find_lex $P111, "$ast"
    get_hll_global $P113, ["PAST"], "Val"
    $P114 = $P111."isa"($P113)
    if $P114, if_1152
.annotate 'line', 164
    find_lex $P115, "$lastlit"
    set $S100, $P115
    isgt $I102, $S100, ""
    unless $I102, if_1153_end
    find_lex $P116, "@parts"
    find_lex $P118, "$lastlit"
    $P116."push"($P118)
  if_1153_end:
.annotate 'line', 165
    find_lex $P115, "@parts"
    find_lex $P116, "$ast"
    $P115."push"($P116)
.annotate 'line', 166
    new $P115, "String"
    assign $P115, ""
    store_lex "$lastlit", $P115
.annotate 'line', 163
    set $P110, $P115
.annotate 'line', 160
    goto if_1152_end
  if_1152:
.annotate 'line', 161
    find_lex $P115, "$lastlit"
    find_lex $P116, "$ast"
    $S100 = $P116."value"()
    concat $P117, $P115, $S100
    store_lex "$lastlit", $P117
.annotate 'line', 160
    set $P110, $P117
  if_1152_end:
    set $P106, $P110
.annotate 'line', 157
    goto if_1151_end
  if_1151:
.annotate 'line', 158
    find_lex $P110, "$lastlit"
    find_lex $P111, "$ast"
    concat $P112, $P110, $P111
    store_lex "$lastlit", $P112
.annotate 'line', 157
    set $P106, $P112
  if_1151_end:
.annotate 'line', 155
    .return ($P106)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_atom"  :subid("36_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1161
.annotate 'line', 177
    new $P1160, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1160, control_1159
    push_eh $P1160
    .lex "self", self
    .lex "$/", param_1161
.annotate 'line', 178
    find_lex $P100, "$/"
    find_lex $P1163, "$/"
    unless_null $P1163, vivify_103
    $P1163 = root_new ['parrot';'Hash']
  vivify_103:
    set $P102, $P1163["quote_escape"]
    unless_null $P102, vivify_104
    new $P102, "Undef"
  vivify_104:
    if $P102, if_1162
    find_lex $P105, "$/"
    set $S100, $P105
    new $P101, 'String'
    set $P101, $S100
    goto if_1162_end
  if_1162:
    find_lex $P1164, "$/"
    unless_null $P1164, vivify_105
    $P1164 = root_new ['parrot';'Hash']
  vivify_105:
    set $P103, $P1164["quote_escape"]
    unless_null $P103, vivify_106
    new $P103, "Undef"
  vivify_106:
    $P104 = $P103."ast"()
    set $P101, $P104
  if_1162_end:
    $P106 = $P100."!make"($P101)
.annotate 'line', 177
    .return ($P106)
  control_1159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<backslash>"  :subid("37_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1168
.annotate 'line', 181
    new $P1167, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1167, control_1166
    push_eh $P1167
    .lex "self", self
    .lex "$/", param_1168
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\\")
    .return ($P101)
  control_1166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<stopper>"  :subid("38_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1172
.annotate 'line', 182
    new $P1171, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1171, control_1170
    push_eh $P1171
    .lex "self", self
    .lex "$/", param_1172
    find_lex $P100, "$/"
    find_lex $P1173, "$/"
    unless_null $P1173, vivify_107
    $P1173 = root_new ['parrot';'Hash']
  vivify_107:
    set $P101, $P1173["stopper"]
    unless_null $P101, vivify_108
    new $P101, "Undef"
  vivify_108:
    set $S100, $P101
    $P102 = $P100."!make"($S100)
    .return ($P102)
  control_1170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<bs>"  :subid("39_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1177
.annotate 'line', 184
    new $P1176, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1176, control_1175
    push_eh $P1176
    .lex "self", self
    .lex "$/", param_1177
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\b")
    .return ($P101)
  control_1175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<nl>"  :subid("40_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1181
.annotate 'line', 185
    new $P1180, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1180, control_1179
    push_eh $P1180
    .lex "self", self
    .lex "$/", param_1181
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\n")
    .return ($P101)
  control_1179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<cr>"  :subid("41_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1185
.annotate 'line', 186
    new $P1184, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1184, control_1183
    push_eh $P1184
    .lex "self", self
    .lex "$/", param_1185
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\r")
    .return ($P101)
  control_1183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<tab>"  :subid("42_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1189
.annotate 'line', 187
    new $P1188, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1188, control_1187
    push_eh $P1188
    .lex "self", self
    .lex "$/", param_1189
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\t")
    .return ($P101)
  control_1187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<ff>"  :subid("43_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1193
.annotate 'line', 188
    new $P1192, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1192, control_1191
    push_eh $P1192
    .lex "self", self
    .lex "$/", param_1193
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\f")
    .return ($P101)
  control_1191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("44_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1197
.annotate 'line', 189
    new $P1196, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1196, control_1195
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
    find_lex $P100, "$/"
    $P101 = $P100."!make"("\e")
    .return ($P101)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<hex>"  :subid("45_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1201
.annotate 'line', 191
    new $P1200, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1200, control_1199
    push_eh $P1200
    .lex "self", self
    .lex "$/", param_1201
.annotate 'line', 192
    find_lex $P100, "$/"
    find_lex $P1203, "$/"
    unless_null $P1203, vivify_109
    $P1203 = root_new ['parrot';'Hash']
  vivify_109:
    set $P102, $P1203["hexint"]
    unless_null $P102, vivify_110
    new $P102, "Undef"
  vivify_110:
    if $P102, if_1202
    find_lex $P1205, "$/"
    unless_null $P1205, vivify_111
    $P1205 = root_new ['parrot';'Hash']
  vivify_111:
    set $P1206, $P1205["hexints"]
    unless_null $P1206, vivify_112
    $P1206 = root_new ['parrot';'Hash']
  vivify_112:
    set $P104, $P1206["hexint"]
    unless_null $P104, vivify_113
    new $P104, "Undef"
  vivify_113:
    set $P101, $P104
    goto if_1202_end
  if_1202:
    find_lex $P1204, "$/"
    unless_null $P1204, vivify_114
    $P1204 = root_new ['parrot';'Hash']
  vivify_114:
    set $P103, $P1204["hexint"]
    unless_null $P103, vivify_115
    new $P103, "Undef"
  vivify_115:
    set $P101, $P103
  if_1202_end:
    $P105 = "ints_to_string"($P101)
    $P106 = $P100."!make"($P105)
.annotate 'line', 191
    .return ($P106)
  control_1199:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<oct>"  :subid("46_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1210
.annotate 'line', 195
    new $P1209, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1209, control_1208
    push_eh $P1209
    .lex "self", self
    .lex "$/", param_1210
.annotate 'line', 196
    find_lex $P100, "$/"
    find_lex $P1212, "$/"
    unless_null $P1212, vivify_116
    $P1212 = root_new ['parrot';'Hash']
  vivify_116:
    set $P102, $P1212["octint"]
    unless_null $P102, vivify_117
    new $P102, "Undef"
  vivify_117:
    if $P102, if_1211
    find_lex $P1214, "$/"
    unless_null $P1214, vivify_118
    $P1214 = root_new ['parrot';'Hash']
  vivify_118:
    set $P1215, $P1214["octints"]
    unless_null $P1215, vivify_119
    $P1215 = root_new ['parrot';'Hash']
  vivify_119:
    set $P104, $P1215["octint"]
    unless_null $P104, vivify_120
    new $P104, "Undef"
  vivify_120:
    set $P101, $P104
    goto if_1211_end
  if_1211:
    find_lex $P1213, "$/"
    unless_null $P1213, vivify_121
    $P1213 = root_new ['parrot';'Hash']
  vivify_121:
    set $P103, $P1213["octint"]
    unless_null $P103, vivify_122
    new $P103, "Undef"
  vivify_122:
    set $P101, $P103
  if_1211_end:
    $P105 = "ints_to_string"($P101)
    $P106 = $P100."!make"($P105)
.annotate 'line', 195
    .return ($P106)
  control_1208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<chr>"  :subid("47_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1219
.annotate 'line', 199
    new $P1218, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1218, control_1217
    push_eh $P1218
    .lex "self", self
    .lex "$/", param_1219
.annotate 'line', 200
    find_lex $P100, "$/"
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_123
    $P1220 = root_new ['parrot';'Hash']
  vivify_123:
    set $P101, $P1220["charspec"]
    unless_null $P101, vivify_124
    new $P101, "Undef"
  vivify_124:
    $P102 = $P101."ast"()
    $P103 = $P100."!make"($P102)
.annotate 'line', 199
    .return ($P103)
  control_1217:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<0>"  :subid("48_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1224
.annotate 'line', 203
    new $P1223, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1223, control_1222
    push_eh $P1223
    .lex "self", self
    .lex "$/", param_1224
.annotate 'line', 204
    find_lex $P100, "$/"
    $P101 = $P100."!make"(unicode:"\x{0}")
.annotate 'line', 203
    .return ($P101)
  control_1222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<misc>"  :subid("49_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1228
.annotate 'line', 207
    new $P1227, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1227, control_1226
    push_eh $P1227
    .lex "self", self
    .lex "$/", param_1228
.annotate 'line', 208
    find_lex $P100, "$/"
    find_lex $P1230, "$/"
    unless_null $P1230, vivify_125
    $P1230 = root_new ['parrot';'Hash']
  vivify_125:
    set $P102, $P1230["textq"]
    unless_null $P102, vivify_126
    new $P102, "Undef"
  vivify_126:
    if $P102, if_1229
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_127
    $P1232 = root_new ['parrot';'Hash']
  vivify_127:
    set $P106, $P1232["textqq"]
    unless_null $P106, vivify_128
    new $P106, "Undef"
  vivify_128:
    $P107 = $P106."Str"()
    set $P101, $P107
    goto if_1229_end
  if_1229:
    new $P103, "String"
    assign $P103, "\\"
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_129
    $P1231 = root_new ['parrot';'Hash']
  vivify_129:
    set $P104, $P1231["textq"]
    unless_null $P104, vivify_130
    new $P104, "Undef"
  vivify_130:
    $S100 = $P104."Str"()
    concat $P105, $P103, $S100
    set $P101, $P105
  if_1229_end:
    $P108 = $P100."!make"($P101)
.annotate 'line', 207
    .return ($P108)
  control_1226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "charname"  :subid("50_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1236
.annotate 'line', 211
    new $P1235, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1235, control_1234
    push_eh $P1235
    .lex "self", self
    .lex "$/", param_1236
.annotate 'line', 212
    new $P100, "Undef"
    set $P1237, $P100
    .lex "$codepoint", $P1237
.annotate 'line', 213
    find_lex $P1239, "$/"
    unless_null $P1239, vivify_131
    $P1239 = root_new ['parrot';'Hash']
  vivify_131:
    set $P102, $P1239["integer"]
    unless_null $P102, vivify_132
    new $P102, "Undef"
  vivify_132:
    if $P102, if_1238
.annotate 'line', 214
    find_lex $P105, "$/"
    set $S100, $P105
    find_codepoint $I100, $S100
    new $P101, 'Integer'
    set $P101, $I100
.annotate 'line', 213
    goto if_1238_end
  if_1238:
    find_lex $P1240, "$/"
    unless_null $P1240, vivify_133
    $P1240 = root_new ['parrot';'Hash']
  vivify_133:
    set $P103, $P1240["integer"]
    unless_null $P103, vivify_134
    new $P103, "Undef"
  vivify_134:
    $P104 = $P103."ast"()
    set $P101, $P104
  if_1238_end:
    store_lex "$codepoint", $P101
.annotate 'line', 215
    find_lex $P101, "$codepoint"
    set $N100, $P101
    islt $I100, $N100, 0.0
    unless $I100, if_1241_end
    find_lex $P102, "$/"
    $P103 = $P102."CURSOR"()
    new $P104, 'String'
    set $P104, "Unrecognized character name "
    find_lex $P105, "$/"
    concat $P106, $P104, $P105
    $P103."panic"($P106)
  if_1241_end:
.annotate 'line', 216
    find_lex $P101, "$/"
    find_lex $P102, "$codepoint"
    set $I100, $P102
    chr $S100, $I100
    $P103 = $P101."!make"($S100)
.annotate 'line', 211
    .return ($P103)
  control_1234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "charnames"  :subid("51_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1245
.annotate 'line', 219
    .const 'Sub' $P1249 = "52_1308504718.83038" 
    capture_lex $P1249
    new $P1244, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1244, control_1243
    push_eh $P1244
    .lex "self", self
    .lex "$/", param_1245
.annotate 'line', 220
    new $P100, "Undef"
    set $P1246, $P100
    .lex "$str", $P1246
    new $P101, "String"
    assign $P101, ""
    store_lex "$str", $P101
.annotate 'line', 221
    find_lex $P1247, "$/"
    unless_null $P1247, vivify_135
    $P1247 = root_new ['parrot';'Hash']
  vivify_135:
    set $P102, $P1247["charname"]
    unless_null $P102, vivify_136
    new $P102, "Undef"
  vivify_136:
    defined $I100, $P102
    unless $I100, for_undef_137
    iter $P101, $P102
    new $P104, 'ExceptionHandler'
    set_label $P104, loop1251_handler
    $P104."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P104
  loop1251_test:
    unless $P101, loop1251_done
    shift $P103, $P101
  loop1251_redo:
    .const 'Sub' $P1249 = "52_1308504718.83038" 
    capture_lex $P1249
    $P1249($P103)
  loop1251_next:
    goto loop1251_test
  loop1251_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, 'type'
    eq $P105, .CONTROL_LOOP_NEXT, loop1251_next
    eq $P105, .CONTROL_LOOP_REDO, loop1251_redo
  loop1251_done:
    pop_eh 
  for_undef_137:
.annotate 'line', 222
    find_lex $P101, "$/"
    find_lex $P102, "$str"
    $P103 = $P101."!make"($P102)
.annotate 'line', 219
    .return ($P103)
  control_1243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["HLL";"Actions"]
.sub "_block1248"  :anon :subid("52_1308504718.83038") :outer("51_1308504718.83038")
    .param pmc param_1250
.annotate 'line', 221
    .lex "$_", param_1250
    find_lex $P104, "$str"
    find_lex $P105, "$_"
    $S100 = $P105."ast"()
    concat $P106, $P104, $S100
    store_lex "$str", $P106
    .return ($P106)
.end


.namespace ["HLL";"Actions"]
.include "except_types.pasm"
.sub "charspec"  :subid("53_1308504718.83038") :method :outer("11_1308504718.83038")
    .param pmc param_1255
.annotate 'line', 225
    new $P1254, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1254, control_1253
    push_eh $P1254
    .lex "self", self
    .lex "$/", param_1255
.annotate 'line', 226
    find_lex $P100, "$/"
    find_lex $P1257, "$/"
    unless_null $P1257, vivify_138
    $P1257 = root_new ['parrot';'Hash']
  vivify_138:
    set $P102, $P1257["charnames"]
    unless_null $P102, vivify_139
    new $P102, "Undef"
  vivify_139:
    if $P102, if_1256
    find_lex $P105, "$/"
    $I100 = "string_to_int"($P105, 10)
    chr $S100, $I100
    new $P101, 'String'
    set $P101, $S100
    goto if_1256_end
  if_1256:
    find_lex $P1258, "$/"
    unless_null $P1258, vivify_140
    $P1258 = root_new ['parrot';'Hash']
  vivify_140:
    set $P103, $P1258["charnames"]
    unless_null $P103, vivify_141
    new $P103, "Undef"
  vivify_141:
    $P104 = $P103."ast"()
    set $P101, $P104
  if_1256_end:
    $P106 = $P100."!make"($P101)
.annotate 'line', 225
    .return ($P106)
  control_1253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["HLL";"Actions"]
.sub "_block1260" :load :anon :subid("54_1308504718.83038")
.annotate 'line', 3
    .const 'Sub' $P1262 = "11_1308504718.83038" 
    $P100 = $P1262()
    .return ($P100)
.end


.namespace []
.sub "_block1263" :load :anon :subid("55_1308504718.83038")
.annotate 'line', 1
    .const 'Sub' $P1265 = "10_1308504718.83038" 
    $P100 = $P1265()
    .return ($P100)
.end

### .include 'gen/hllcompiler.pir'

.namespace []
.sub "_block1000"  :anon :subid("10_1308504719.80411")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308504719.80411" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    .const 'Sub' $P1003 = "11_1308504719.80411" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1190 = "36_1308504719.80411" 
    .return ($P1190)
.end


.namespace []
.sub "" :load :init :subid("post37") :outer("10_1308504719.80411")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308504719.80411" 
    .local pmc block
    set block, $P1001
.annotate 'line', 2
    load_bytecode "PCT/HLLCompiler.pbc"
.annotate 'line', 1
    $P1192 = get_root_global ["parrot"], "P6metaclass"
    new $P101, "ResizablePMCArray"
    push $P101, "$!language"
    $P1192."new_class"("HLL::Compiler", "PCT::HLLCompiler" :named("parent"), $P101 :named("attr"))
.end


.namespace ["HLL";"Compiler"]
.sub "_block1002"  :subid("11_1308504719.80411") :outer("10_1308504719.80411")
.annotate 'line', 6
    .const 'Sub' $P1184 = "35_1308504719.80411" 
    capture_lex $P1184
    .const 'Sub' $P1167 = "33_1308504719.80411" 
    capture_lex $P1167
    .const 'Sub' $P1107 = "26_1308504719.80411" 
    capture_lex $P1107
    .const 'Sub' $P1102 = "25_1308504719.80411" 
    capture_lex $P1102
    .const 'Sub' $P1075 = "20_1308504719.80411" 
    capture_lex $P1075
    .const 'Sub' $P1059 = "18_1308504719.80411" 
    capture_lex $P1059
    .const 'Sub' $P1054 = "17_1308504719.80411" 
    capture_lex $P1054
    .const 'Sub' $P1048 = "16_1308504719.80411" 
    capture_lex $P1048
    .const 'Sub' $P1012 = "13_1308504719.80411" 
    capture_lex $P1012
    .const 'Sub' $P1005 = "12_1308504719.80411" 
    capture_lex $P1005
.annotate 'line', 14
    .const 'Sub' $P1005 = "12_1308504719.80411" 
    newclosure $P1011, $P1005
    set $P1004, $P1011
    .lex "value_type", $P1004
.annotate 'line', 6
    find_lex $P102, "value_type"
.annotate 'line', 165
    .const 'Sub' $P1184 = "35_1308504719.80411" 
    newclosure $P1188, $P1184
.annotate 'line', 6
    .return ($P1188)
.end


.namespace ["HLL";"Compiler"]
.sub "" :load :init :subid("post38") :outer("11_1308504719.80411")
.annotate 'line', 6
    .const 'Sub' $P1003 = "11_1308504719.80411" 
    .local pmc block
    set block, $P1003
.annotate 'line', 11
    get_hll_global $P102, ["HLL"], "Compiler"
    $P102."language"("parrot")
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "value_type"  :subid("12_1308504719.80411") :outer("11_1308504719.80411")
    .param pmc param_1008
.annotate 'line', 14
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "$value", param_1008
.annotate 'line', 15
    find_lex $P101, "$value"
    isa $I100, $P101, "NameSpace"
    if $I100, if_1009
.annotate 'line', 17
    find_lex $P104, "$value"
    isa $I101, $P104, "Sub"
    if $I101, if_1010
    new $P106, "String"
    assign $P106, "var"
    set $P103, $P106
    goto if_1010_end
  if_1010:
    new $P105, "String"
    assign $P105, "sub"
    set $P103, $P105
  if_1010_end:
    set $P100, $P103
.annotate 'line', 15
    goto if_1009_end
  if_1009:
    new $P102, "String"
    assign $P102, "namespace"
    set $P100, $P102
  if_1009_end:
.annotate 'line', 14
    .return ($P100)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "get_exports"  :subid("13_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1015
    .param pmc param_1017 :slurpy
    .param pmc param_1016 :optional :named("tagset")
    .param int has_param_1016 :opt_flag
.annotate 'line', 20
    .const 'Sub' $P1042 = "15_1308504719.80411" 
    capture_lex $P1042
    .const 'Sub' $P1034 = "14_1308504719.80411" 
    capture_lex $P1034
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    .lex "$module", param_1015
    if has_param_1016, optparam_39
    new $P102, "Undef"
    set param_1016, $P102
  optparam_39:
    .lex "$tagset", param_1016
    .lex "@symbols", param_1017
.annotate 'line', 27
    $P1019 = root_new ['parrot';'Hash']
    set $P1018, $P1019
    .lex "%exports", $P1018
.annotate 'line', 28
    $P1021 = root_new ['parrot';'Hash']
    set $P1020, $P1021
    .lex "%source", $P1020
.annotate 'line', 22
    find_lex $P103, "$module"
    does $I100, $P103, "hash"
    new $P104, 'Integer'
    set $P104, $I100
    isfalse $I101, $P104
    unless $I101, if_1022_end
.annotate 'line', 23
    find_lex $P105, "self"
    find_lex $P106, "$module"
    $P107 = $P105."get_module"($P106)
    store_lex "$module", $P107
  if_1022_end:
.annotate 'line', 26
    find_lex $P103, "$tagset"
    set $P1023, $P103
    defined $I1025, $P1023
    if $I1025, default_1024
    find_lex $P105, "@symbols"
    if $P105, if_1026
    new $P107, "String"
    assign $P107, "DEFAULT"
    set $P104, $P107
    goto if_1026_end
  if_1026:
    new $P106, "String"
    assign $P106, "ALL"
    set $P104, $P106
  if_1026_end:
    set $P1023, $P104
  default_1024:
    store_lex "$tagset", $P1023
.annotate 'line', 20
    find_lex $P103, "%exports"
.annotate 'line', 28
    find_lex $P103, "$tagset"
    set $S100, $P103
    find_lex $P1027, "$module"
    unless_null $P1027, vivify_40
    $P1027 = root_new ['parrot';'Hash']
  vivify_40:
    set $P1028, $P1027["EXPORT"]
    unless_null $P1028, vivify_41
    $P1028 = root_new ['parrot';'Hash']
  vivify_41:
    set $P104, $P1028[$S100]
    unless_null $P104, vivify_42
    new $P104, "Undef"
  vivify_42:
    store_lex "%source", $P104
.annotate 'line', 29
    find_lex $P103, "%source"
    defined $I100, $P103
    new $P104, 'Integer'
    set $P104, $I100
    isfalse $I101, $P104
    unless $I101, if_1029_end
.annotate 'line', 30
    find_lex $P106, "$tagset"
    set $S100, $P106
    iseq $I102, $S100, "ALL"
    if $I102, if_1030
    $P1031 = root_new ['parrot';'Hash']
    set $P105, $P1031
    goto if_1030_end
  if_1030:
    find_lex $P107, "$module"
    set $P105, $P107
  if_1030_end:
    store_lex "%source", $P105
  if_1029_end:
.annotate 'line', 32
    find_lex $P103, "@symbols"
    if $P103, if_1032
.annotate 'line', 39
    find_lex $P105, "%source"
    defined $I100, $P105
    unless $I100, for_undef_43
    iter $P104, $P105
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1047_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1047_test:
    unless $P104, loop1047_done
    shift $P106, $P104
  loop1047_redo:
    .const 'Sub' $P1042 = "15_1308504719.80411" 
    capture_lex $P1042
    $P1042($P106)
  loop1047_next:
    goto loop1047_test
  loop1047_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1047_next
    eq $P110, .CONTROL_LOOP_REDO, loop1047_redo
  loop1047_done:
    pop_eh 
  for_undef_43:
.annotate 'line', 38
    goto if_1032_end
  if_1032:
.annotate 'line', 33
    find_lex $P105, "@symbols"
    defined $I100, $P105
    unless $I100, for_undef_46
    iter $P104, $P105
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1040_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1040_test:
    unless $P104, loop1040_done
    shift $P106, $P104
  loop1040_redo:
    .const 'Sub' $P1034 = "14_1308504719.80411" 
    capture_lex $P1034
    $P1034($P106)
  loop1040_next:
    goto loop1040_test
  loop1040_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1040_next
    eq $P110, .CONTROL_LOOP_REDO, loop1040_redo
  loop1040_done:
    pop_eh 
  for_undef_46:
  if_1032_end:
.annotate 'line', 20
    find_lex $P103, "%exports"
    .return ($P103)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1041"  :anon :subid("15_1308504719.80411") :outer("13_1308504719.80411")
    .param pmc param_1044
.annotate 'line', 40
    new $P107, "Undef"
    set $P1043, $P107
    .lex "$value", $P1043
    .lex "$_", param_1044
    find_lex $P108, "$_"
    $P109 = $P108."value"()
    store_lex "$value", $P109
.annotate 'line', 41
    find_lex $P108, "$value"
    find_lex $P109, "$_"
    $P110 = $P109."key"()
    find_lex $P111, "$value"
    $P112 = "value_type"($P111)
    find_lex $P1045, "%exports"
    unless_null $P1045, vivify_44
    $P1045 = root_new ['parrot';'Hash']
    store_lex "%exports", $P1045
  vivify_44:
    set $P1046, $P1045[$P112]
    unless_null $P1046, vivify_45
    $P1046 = root_new ['parrot';'Hash']
    set $P1045[$P112], $P1046
  vivify_45:
    set $P1046[$P110], $P108
.annotate 'line', 39
    .return ($P108)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1033"  :anon :subid("14_1308504719.80411") :outer("13_1308504719.80411")
    .param pmc param_1036
.annotate 'line', 34
    new $P107, "Undef"
    set $P1035, $P107
    .lex "$value", $P1035
    .lex "$_", param_1036
    find_lex $P108, "$_"
    set $S100, $P108
    find_lex $P1037, "%source"
    unless_null $P1037, vivify_47
    $P1037 = root_new ['parrot';'Hash']
  vivify_47:
    set $P109, $P1037[$S100]
    unless_null $P109, vivify_48
    new $P109, "Undef"
  vivify_48:
    store_lex "$value", $P109
.annotate 'line', 35
    find_lex $P108, "$value"
    find_lex $P109, "$_"
    find_lex $P110, "$value"
    $P111 = "value_type"($P110)
    find_lex $P1038, "%exports"
    unless_null $P1038, vivify_49
    $P1038 = root_new ['parrot';'Hash']
    store_lex "%exports", $P1038
  vivify_49:
    set $P1039, $P1038[$P111]
    unless_null $P1039, vivify_50
    $P1039 = root_new ['parrot';'Hash']
    set $P1038[$P111], $P1039
  vivify_50:
    set $P1039[$P109], $P108
.annotate 'line', 33
    .return ($P108)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "get_module"  :subid("16_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1051
.annotate 'line', 47
    new $P1050, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1050, control_1049
    push_eh $P1050
    .lex "self", self
    .lex "$name", param_1051
.annotate 'line', 48
    $P1053 = root_new ['parrot';'ResizablePMCArray']
    set $P1052, $P1053
    .lex "@name", $P1052
    find_lex $P102, "self"
    find_lex $P103, "$name"
    $P104 = $P102."parse_name"($P103)
    store_lex "@name", $P104
.annotate 'line', 49
    find_lex $P102, "@name"
    find_lex $P103, "self"
    getattribute $P104, $P103, "$!language"
    unless_null $P104, vivify_51
    new $P104, "Undef"
  vivify_51:
    set $S100, $P104
    downcase $S101, $S100
    $P102."unshift"($S101)
.annotate 'line', 50
    find_lex $P102, "@name"
    get_root_namespace $P103, $P102
.annotate 'line', 47
    .return ($P103)
  control_1049:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "language"  :subid("17_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1057 :optional
    .param int has_param_1057 :opt_flag
.annotate 'line', 53
    new $P1056, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1056, control_1055
    push_eh $P1056
    .lex "self", self
    if has_param_1057, optparam_52
    new $P102, "Undef"
    set param_1057, $P102
  optparam_52:
    .lex "$name", param_1057
.annotate 'line', 54
    find_lex $P103, "$name"
    unless $P103, if_1058_end
.annotate 'line', 55
    find_lex $P104, "$name"
    find_lex $P105, "self"
    setattribute $P105, "$!language", $P104
.annotate 'line', 56
    find_lex $P104, "$name"
    set $S100, $P104
    find_lex $P105, "self"
    compreg $S100, $P105
  if_1058_end:
.annotate 'line', 53
    find_lex $P103, "self"
    getattribute $P104, $P103, "$!language"
    unless_null $P104, vivify_53
    new $P104, "Undef"
  vivify_53:
    .return ($P104)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "load_module"  :subid("18_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1062
.annotate 'line', 61
    .const 'Sub' $P1066 = "19_1308504719.80411" 
    capture_lex $P1066
    new $P1061, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1061, control_1060
    push_eh $P1061
    .lex "self", self
    .lex "$name", param_1062
.annotate 'line', 62
    new $P102, "Undef"
    set $P1063, $P102
    .lex "$base", $P1063
.annotate 'line', 63
    new $P103, "Undef"
    set $P1064, $P103
    .lex "$loaded", $P1064
.annotate 'line', 62
    find_lex $P104, "self"
    find_lex $P105, "$name"
    $P106 = $P104."parse_name"($P105)
    join $S100, "/", $P106
    new $P107, 'String'
    set $P107, $S100
    store_lex "$base", $P107
.annotate 'line', 63
    new $P104, "Integer"
    assign $P104, 0
    store_lex "$loaded", $P104
.annotate 'line', 64
    .const 'Sub' $P1066 = "19_1308504719.80411" 
    capture_lex $P1066
    $P1066()
.annotate 'line', 65
    find_lex $P104, "$loaded"
    if $P104, unless_1074_end
    find_lex $P105, "$base"
    concat $P106, $P105, ".pir"
    set $S100, $P106
    load_bytecode $S100
    new $P105, "Integer"
    assign $P105, 1
    store_lex "$loaded", $P105
  unless_1074_end:
.annotate 'line', 66
    find_lex $P104, "self"
    find_lex $P105, "$name"
    $P106 = $P104."get_module"($P105)
.annotate 'line', 61
    .return ($P106)
  control_1060:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1065"  :anon :subid("19_1308504719.80411") :outer("18_1308504719.80411")
.annotate 'line', 64
    new $P1069, 'ExceptionHandler'
    set_label $P1069, control_1068
    $P1069."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1069
    find_lex $P104, "$base"
    concat $P105, $P104, ".pbc"
    set $S100, $P105
    load_bytecode $S100
    new $P104, "Integer"
    assign $P104, 1
    store_lex "$loaded", $P104
    pop_eh 
    goto skip_handler_1067
  control_1068:
    .local pmc exception 
    .get_results (exception) 
    new $P1072, 'Integer'
    set $P1072, 1
    set exception["handled"], $P1072
    set $I1073, exception["handled"]
    ne $I1073, 1, nothandled_1071
  handled_1070:
    .return (exception)
  nothandled_1071:
    rethrow exception
  skip_handler_1067:
    .return ($P104)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "import"  :subid("20_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1078
    .param pmc param_1079
.annotate 'line', 69
    .const 'Sub' $P1081 = "21_1308504719.80411" 
    capture_lex $P1081
    new $P1077, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1077, control_1076
    push_eh $P1077
    .lex "self", self
    .lex "$target", param_1078
    .lex "%exports", param_1079
.annotate 'line', 70
    find_lex $P103, "%exports"
    defined $I100, $P103
    unless $I100, for_undef_54
    iter $P102, $P103
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1101_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1101_test:
    unless $P102, loop1101_done
    shift $P104, $P102
  loop1101_redo:
    .const 'Sub' $P1081 = "21_1308504719.80411" 
    capture_lex $P1081
    $P1081($P104)
  loop1101_next:
    goto loop1101_test
  loop1101_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1101_next
    eq $P108, .CONTROL_LOOP_REDO, loop1101_redo
  loop1101_done:
    pop_eh 
  for_undef_54:
.annotate 'line', 69
    .return ($P102)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1080"  :anon :subid("21_1308504719.80411") :outer("20_1308504719.80411")
    .param pmc param_1085
.annotate 'line', 70
    .const 'Sub' $P1097 = "24_1308504719.80411" 
    capture_lex $P1097
    .const 'Sub' $P1093 = "23_1308504719.80411" 
    capture_lex $P1093
    .const 'Sub' $P1088 = "22_1308504719.80411" 
    capture_lex $P1088
.annotate 'line', 71
    new $P105, "Undef"
    set $P1082, $P105
    .lex "$type", $P1082
.annotate 'line', 72
    $P1084 = root_new ['parrot';'Hash']
    set $P1083, $P1084
    .lex "%items", $P1083
    .lex "$_", param_1085
.annotate 'line', 71
    find_lex $P106, "$_"
    $P107 = $P106."key"()
    store_lex "$type", $P107
.annotate 'line', 72
    find_lex $P106, "$_"
    $P107 = $P106."value"()
    store_lex "%items", $P107
.annotate 'line', 73
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "import_"
    find_lex $P109, "$type"
    concat $P110, $P108, $P109
    set $S100, $P110
    can $I101, $P107, $S100
    if $I101, if_1086
.annotate 'line', 76
    find_lex $P113, "$target"
    new $P114, 'String'
    set $P114, "add_"
    find_lex $P115, "$type"
    concat $P116, $P114, $P115
    set $S101, $P116
    can $I102, $P113, $S101
    if $I102, if_1091
.annotate 'line', 80
    find_lex $P119, "%items"
    defined $I103, $P119
    unless $I103, for_undef_55
    iter $P118, $P119
    new $P121, 'ExceptionHandler'
    set_label $P121, loop1100_handler
    $P121."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P121
  loop1100_test:
    unless $P118, loop1100_done
    shift $P120, $P118
  loop1100_redo:
    .const 'Sub' $P1097 = "24_1308504719.80411" 
    capture_lex $P1097
    $P1097($P120)
  loop1100_next:
    goto loop1100_test
  loop1100_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, .CONTROL_LOOP_NEXT, loop1100_next
    eq $P123, .CONTROL_LOOP_REDO, loop1100_redo
  loop1100_done:
    pop_eh 
  for_undef_55:
.annotate 'line', 79
    set $P112, $P118
.annotate 'line', 76
    goto if_1091_end
  if_1091:
.annotate 'line', 77
    find_lex $P118, "%items"
    defined $I103, $P118
    unless $I103, for_undef_57
    iter $P117, $P118
    new $P120, 'ExceptionHandler'
    set_label $P120, loop1095_handler
    $P120."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P120
  loop1095_test:
    unless $P117, loop1095_done
    shift $P119, $P117
  loop1095_redo:
    .const 'Sub' $P1093 = "23_1308504719.80411" 
    capture_lex $P1093
    $P1093($P119)
  loop1095_next:
    goto loop1095_test
  loop1095_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, 'type'
    eq $P121, .CONTROL_LOOP_NEXT, loop1095_next
    eq $P121, .CONTROL_LOOP_REDO, loop1095_redo
  loop1095_done:
    pop_eh 
  for_undef_57:
.annotate 'line', 76
    set $P112, $P117
  if_1091_end:
    set $P106, $P112
.annotate 'line', 73
    goto if_1086_end
  if_1086:
.annotate 'line', 74
    find_lex $P112, "%items"
    defined $I102, $P112
    unless $I102, for_undef_58
    iter $P111, $P112
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1090_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1090_test:
    unless $P111, loop1090_done
    shift $P113, $P111
  loop1090_redo:
    .const 'Sub' $P1088 = "22_1308504719.80411" 
    capture_lex $P1088
    $P1088($P113)
  loop1090_next:
    goto loop1090_test
  loop1090_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1090_next
    eq $P115, .CONTROL_LOOP_REDO, loop1090_redo
  loop1090_done:
    pop_eh 
  for_undef_58:
.annotate 'line', 73
    set $P106, $P111
  if_1086_end:
.annotate 'line', 70
    .return ($P106)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1096"  :anon :subid("24_1308504719.80411") :outer("21_1308504719.80411")
    .param pmc param_1098
.annotate 'line', 80
    .lex "$_", param_1098
    find_lex $P121, "$_"
    $P122 = $P121."value"()
    find_lex $P123, "$_"
    $P124 = $P123."key"()
    set $S102, $P124
    find_lex $P1099, "$target"
    unless_null $P1099, vivify_56
    $P1099 = root_new ['parrot';'Hash']
    store_lex "$target", $P1099
  vivify_56:
    set $P1099[$S102], $P122
    .return ($P122)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1092"  :anon :subid("23_1308504719.80411") :outer("21_1308504719.80411")
    .param pmc param_1094
.annotate 'line', 77
    .lex "$_", param_1094
    find_lex $P120, "$target"
    find_lex $P121, "$_"
    $P122 = $P121."key"()
    find_lex $P123, "$_"
    $P124 = $P123."value"()
    new $P125, 'String'
    set $P125, "add_"
    find_lex $P126, "$type"
    concat $P127, $P125, $P126
    set $S102, $P127
    $P128 = $P120.$S102($P122, $P124)
    .return ($P128)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1087"  :anon :subid("22_1308504719.80411") :outer("21_1308504719.80411")
    .param pmc param_1089
.annotate 'line', 74
    .lex "$_", param_1089
    find_lex $P114, "self"
    find_lex $P115, "$target"
    find_lex $P116, "$_"
    $P117 = $P116."key"()
    find_lex $P118, "$_"
    $P119 = $P118."value"()
    new $P120, 'String'
    set $P120, "import_"
    find_lex $P121, "$type"
    concat $P122, $P120, $P121
    set $S101, $P122
    $P123 = $P114.$S101($P115, $P117, $P119)
    .return ($P123)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "autoprint"  :subid("25_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1105
.annotate 'line', 85
    new $P1104, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1104, control_1103
    push_eh $P1104
    .lex "self", self
    .lex "$value", param_1105
.annotate 'line', 87
    getinterp $P103
    $P104 = $P103."stdout_handle"()
    $N100 = $P104."tell"()
    find_dynamic_lex $P105, "$*AUTOPRINTPOS"
    unless_null $P105, vivify_59
    get_hll_global $P105, "$AUTOPRINTPOS"
    unless_null $P105, vivify_60
    die "Contextual $*AUTOPRINTPOS not found"
  vivify_60:
  vivify_59:
    set $N101, $P105
    isgt $I100, $N100, $N101
    unless $I100, unless_1106
    new $P102, 'Integer'
    set $P102, $I100
    goto unless_1106_end
  unless_1106:
.annotate 'line', 86
    find_lex $P106, "$value"
    set $S100, $P106
    say $S100
  unless_1106_end:
.annotate 'line', 85
    .return ($P102)
  control_1103:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "interactive"  :subid("26_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1110 :slurpy :named
.annotate 'line', 90
    .const 'Sub' $P1120 = "27_1308504719.80411" 
    capture_lex $P1120
    new $P1109, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1109, control_1108
    push_eh $P1109
    .lex "self", self
    .lex "%adverbs", param_1110
.annotate 'line', 91
    new $P102, "Undef"
    set $P1111, $P102
    .lex "$target", $P1111
.annotate 'line', 95
    new $P103, "Undef"
    set $P1112, $P103
    .lex "$stdin", $P1112
.annotate 'line', 96
    new $P104, "Undef"
    set $P1113, $P104
    .lex "$encoding", $P1113
.annotate 'line', 101
    new $P105, "Undef"
    set $P1114, $P105
    .lex "$save_ctx", $P1114
.annotate 'line', 91
    find_lex $P1115, "%adverbs"
    unless_null $P1115, vivify_61
    $P1115 = root_new ['parrot';'Hash']
  vivify_61:
    set $P106, $P1115["target"]
    unless_null $P106, vivify_62
    new $P106, "Undef"
  vivify_62:
    set $S100, $P106
    downcase $S101, $S100
    new $P107, 'String'
    set $P107, $S101
    store_lex "$target", $P107
.annotate 'line', 93
    getinterp $P106
    $P107 = $P106."stderr_handle"()
    find_lex $P108, "self"
    $S100 = $P108."commandline_banner"()
    print $P107, $S100
.annotate 'line', 95
    getinterp $P106
    $P107 = $P106."stdin_handle"()
    store_lex "$stdin", $P107
.annotate 'line', 96
    find_lex $P1116, "%adverbs"
    unless_null $P1116, vivify_63
    $P1116 = root_new ['parrot';'Hash']
  vivify_63:
    set $P106, $P1116["encoding"]
    unless_null $P106, vivify_64
    new $P106, "Undef"
  vivify_64:
    set $S100, $P106
    new $P107, 'String'
    set $P107, $S100
    store_lex "$encoding", $P107
.annotate 'line', 97
    find_lex $P107, "$encoding"
    if $P107, if_1118
    set $P106, $P107
    goto if_1118_end
  if_1118:
    find_lex $P108, "$encoding"
    set $S100, $P108
    isne $I100, $S100, "fixed_8"
    new $P106, 'Integer'
    set $P106, $I100
  if_1118_end:
    unless $P106, if_1117_end
.annotate 'line', 98
    find_lex $P109, "$stdin"
    find_lex $P110, "$encoding"
    $P109."encoding"($P110)
  if_1117_end:
.annotate 'line', 90
    find_lex $P106, "$save_ctx"
.annotate 'line', 102
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1166_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1166_test:
    new $P106, "Integer"
    assign $P106, 1
    unless $P106, loop1166_done
  loop1166_redo:
    .const 'Sub' $P1120 = "27_1308504719.80411" 
    capture_lex $P1120
    $P1120()
  loop1166_next:
    goto loop1166_test
  loop1166_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1166_next
    eq $P114, .CONTROL_LOOP_REDO, loop1166_redo
  loop1166_done:
    pop_eh 
.annotate 'line', 90
    .return ($P106)
  control_1108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1119"  :anon :subid("27_1308504719.80411") :outer("26_1308504719.80411")
.annotate 'line', 102
    .const 'Sub' $P1133 = "28_1308504719.80411" 
    capture_lex $P1133
.annotate 'line', 105
    new $P107, "Undef"
    set $P1121, $P107
    .lex "$prompt", $P1121
.annotate 'line', 106
    new $P108, "Undef"
    set $P1122, $P108
    .lex "$code", $P1122
.annotate 'line', 111
    new $P109, "Undef"
    set $P1123, $P109
    .lex "$*AUTOPRINTPOS", $P1123
.annotate 'line', 112
    new $P110, "Undef"
    set $P1124, $P110
    .lex "$*CTXSAVE", $P1124
.annotate 'line', 113
    new $P111, "Undef"
    set $P1125, $P111
    .lex "$*MAIN_CTX", $P1125
.annotate 'line', 103
    find_lex $P112, "$stdin"
    if $P112, unless_1126_end
    die 0, .CONTROL_LOOP_LAST
  unless_1126_end:
.annotate 'line', 105
    find_lex $P112, "self"
    $P113 = $P112."commandline_prompt"()
    set $P1127, $P113
    defined $I1129, $P1127
    if $I1129, default_1128
    new $P114, "String"
    assign $P114, "> "
    set $P1127, $P114
  default_1128:
    store_lex "$prompt", $P1127
.annotate 'line', 106
    find_lex $P112, "$stdin"
    find_lex $P113, "$prompt"
    set $S100, $P113
    $P114 = $P112."readline_interactive"($S100)
    store_lex "$code", $P114
.annotate 'line', 108
    find_lex $P112, "$code"
    isnull $I100, $P112
    unless $I100, if_1130_end
    die 0, .CONTROL_LOOP_LAST
  if_1130_end:
.annotate 'line', 111
    getinterp $P112
    $P113 = $P112."stdout_handle"()
    $P114 = $P113."tell"()
    store_lex "$*AUTOPRINTPOS", $P114
.annotate 'line', 112
    find_lex $P112, "self"
    store_lex "$*CTXSAVE", $P112
.annotate 'line', 102
    find_lex $P112, "$*MAIN_CTX"
    unless_null $P112, vivify_65
    get_hll_global $P112, "$MAIN_CTX"
    unless_null $P112, vivify_66
    die "Contextual $*MAIN_CTX not found"
  vivify_66:
  vivify_65:
.annotate 'line', 115
    find_lex $P113, "$code"
    if $P113, if_1131
    set $P112, $P113
    goto if_1131_end
  if_1131:
    .const 'Sub' $P1133 = "28_1308504719.80411" 
    capture_lex $P1133
    $P116 = $P1133()
    set $P112, $P116
  if_1131_end:
.annotate 'line', 102
    .return ($P112)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1132"  :anon :subid("28_1308504719.80411") :outer("27_1308504719.80411")
.annotate 'line', 115
    .const 'Sub' $P1156 = "31_1308504719.80411" 
    capture_lex $P1156
    .const 'Sub' $P1136 = "29_1308504719.80411" 
    capture_lex $P1136
.annotate 'line', 117
    new $P114, "Undef"
    set $P1134, $P114
    .lex "$output", $P1134
.annotate 'line', 116
    find_lex $P115, "$code"
    concat $P116, $P115, "\n"
    store_lex "$code", $P116
.annotate 'line', 115
    find_lex $P115, "$output"
.annotate 'line', 118
    .const 'Sub' $P1136 = "29_1308504719.80411" 
    capture_lex $P1136
    $P1136()
.annotate 'line', 125
    find_dynamic_lex $P115, "$*MAIN_CTX"
    unless_null $P115, vivify_67
    get_hll_global $P115, "$MAIN_CTX"
    unless_null $P115, vivify_68
    die "Contextual $*MAIN_CTX not found"
  vivify_68:
  vivify_67:
    defined $I100, $P115
    unless $I100, if_1154_end
    .const 'Sub' $P1156 = "31_1308504719.80411" 
    capture_lex $P1156
    $P1156()
  if_1154_end:
.annotate 'line', 133
    find_lex $P115, "$output"
    isnull $I100, $P115
    unless $I100, if_1163_end
    die 0, .CONTROL_LOOP_NEXT
  if_1163_end:
.annotate 'line', 135
    find_lex $P116, "$target"
    isfalse $I100, $P116
    if $I100, if_1164
.annotate 'line', 137
    find_lex $P118, "$target"
    set $S100, $P118
    iseq $I101, $S100, "pir"
    if $I101, if_1165
.annotate 'line', 140
    find_lex $P120, "self"
    find_lex $P121, "$output"
    find_lex $P122, "$target"
    find_lex $P123, "%adverbs"
    $P124 = $P120."dumper"($P121, $P122, $P123 :flat)
.annotate 'line', 139
    set $P117, $P124
.annotate 'line', 137
    goto if_1165_end
  if_1165:
.annotate 'line', 138
    find_lex $P120, "$output"
    say $P120
  if_1165_end:
.annotate 'line', 137
    set $P115, $P117
.annotate 'line', 135
    goto if_1164_end
  if_1164:
.annotate 'line', 136
    find_lex $P117, "self"
    find_lex $P118, "$output"
    $P119 = $P117."autoprint"($P118)
.annotate 'line', 135
    set $P115, $P119
  if_1164_end:
.annotate 'line', 115
    .return ($P115)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1135"  :anon :subid("29_1308504719.80411") :outer("28_1308504719.80411")
.annotate 'line', 118
    .const 'Sub' $P1143 = "30_1308504719.80411" 
    capture_lex $P1143
    new $P1139, 'ExceptionHandler'
    set_label $P1139, control_1138
    $P1139."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1139
.annotate 'line', 119
    find_lex $P115, "self"
    find_lex $P116, "$code"
    find_lex $P117, "$save_ctx"
    find_lex $P118, "%adverbs"
    $P119 = $P115."eval"($P116, $P118 :flat, $P117 :named("outer_ctx"))
    store_lex "$output", $P119
.annotate 'line', 118
    pop_eh 
    goto skip_handler_1137
  control_1138:
.annotate 'line', 120
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1143 = "30_1308504719.80411" 
    newclosure $P1151, $P1143
    $P1151(exception)
    new $P1152, 'Integer'
    set $P1152, 1
    set exception["handled"], $P1152
    set $I1153, exception["handled"]
    ne $I1153, 1, nothandled_1141
  handled_1140:
    .return (exception)
  nothandled_1141:
    rethrow exception
  skip_handler_1137:
.annotate 'line', 118
    .return ()
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1142"  :anon :subid("30_1308504719.80411") :outer("29_1308504719.80411")
    .param pmc param_1144
.annotate 'line', 120
    .lex "$_", param_1144
    find_lex $P1145, "$_"
    set $P1146, $P1145
    .lex "$!", $P1146
.annotate 'line', 121
    find_lex $P1147, "$!"
    set $S1148, $P1147
    new $P1149, 'String'
    set $P1149, $S1148
    concat $P1150, $P1149, "\n"
    print $P1150
.annotate 'line', 122
    die 0, .CONTROL_LOOP_NEXT
.annotate 'line', 120
    .return ()
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "_block1155"  :anon :subid("31_1308504719.80411") :outer("28_1308504719.80411")
.annotate 'line', 125
    .const 'Sub' $P1159 = "32_1308504719.80411" 
    capture_lex $P1159
.annotate 'line', 126
    get_global $P116, "$interactive_ctx"
    unless_null $P116, vivify_69
    new $P116, "Undef"
    set_global "$interactive_ctx", $P116
  vivify_69:
.annotate 'line', 127
    get_global $P1157, "%interactive_pad"
    unless_null $P1157, vivify_70
    $P1157 = root_new ['parrot';'Hash']
    set_global "%interactive_pad", $P1157
  vivify_70:
.annotate 'line', 125
    get_global $P117, "$interactive_ctx"
    get_global $P117, "%interactive_pad"
.annotate 'line', 128
    find_dynamic_lex $P118, "$*MAIN_CTX"
    unless_null $P118, vivify_71
    get_hll_global $P118, "$MAIN_CTX"
    unless_null $P118, vivify_72
    die "Contextual $*MAIN_CTX not found"
  vivify_72:
  vivify_71:
    $P119 = $P118."lexpad_full"()
    defined $I101, $P119
    unless $I101, for_undef_73
    iter $P117, $P119
    new $P121, 'ExceptionHandler'
    set_label $P121, loop1162_handler
    $P121."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P121
  loop1162_test:
    unless $P117, loop1162_done
    shift $P120, $P117
  loop1162_redo:
    .const 'Sub' $P1159 = "32_1308504719.80411" 
    capture_lex $P1159
    $P1159($P120)
  loop1162_next:
    goto loop1162_test
  loop1162_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, .CONTROL_LOOP_NEXT, loop1162_next
    eq $P123, .CONTROL_LOOP_REDO, loop1162_redo
  loop1162_done:
    pop_eh 
  for_undef_73:
.annotate 'line', 131
    get_global $P117, "$interactive_ctx"
    store_lex "$save_ctx", $P117
.annotate 'line', 125
    .return ($P117)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1158"  :anon :subid("32_1308504719.80411") :outer("31_1308504719.80411")
    .param pmc param_1160
.annotate 'line', 128
    .lex "$_", param_1160
.annotate 'line', 129
    find_lex $P121, "$_"
    $P122 = $P121."value"()
    find_lex $P123, "$_"
    $P124 = $P123."key"()
    get_global $P1161, "%interactive_pad"
    unless_null $P1161, vivify_74
    $P1161 = root_new ['parrot';'Hash']
    set_global "%interactive_pad", $P1161
  vivify_74:
    set $P1161[$P124], $P122
.annotate 'line', 128
    .return ($P122)
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "eval"  :subid("33_1308504719.80411") :method :outer("11_1308504719.80411")
    .param pmc param_1170
    .param pmc param_1171 :slurpy
    .param pmc param_1172 :slurpy :named
.annotate 'line', 146
    .const 'Sub' $P1178 = "34_1308504719.80411" 
    capture_lex $P1178
    new $P1169, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1169, control_1168
    push_eh $P1169
    .lex "self", self
    .lex "$code", param_1170
    .lex "@args", param_1171
    .lex "%adverbs", param_1172
.annotate 'line', 147
    new $P102, "Undef"
    set $P1173, $P102
    .lex "$output", $P1173
.annotate 'line', 146
    find_lex $P103, "$output"
.annotate 'line', 148
    find_lex $P103, "self"
    find_lex $P104, "$code"
    find_lex $P105, "%adverbs"
    $P106 = $P103."compile"($P104, $P105 :flat)
    store_lex "$output", $P106
.annotate 'line', 150
    find_lex $P104, "$output"
    isa $I100, $P104, "String"
    new $P105, 'Integer'
    set $P105, $I100
    isfalse $I101, $P105
    if $I101, if_1175
    new $P103, 'Integer'
    set $P103, $I101
    goto if_1175_end
  if_1175:
.annotate 'line', 151
    find_lex $P1176, "%adverbs"
    unless_null $P1176, vivify_75
    $P1176 = root_new ['parrot';'Hash']
  vivify_75:
    set $P106, $P1176["target"]
    unless_null $P106, vivify_76
    new $P106, "Undef"
  vivify_76:
    set $S100, $P106
    iseq $I102, $S100, ""
    new $P103, 'Integer'
    set $P103, $I102
  if_1175_end:
    unless $P103, if_1174_end
    .const 'Sub' $P1178 = "34_1308504719.80411" 
    capture_lex $P1178
    $P1178()
  if_1174_end:
.annotate 'line', 146
    find_lex $P103, "$output"
    .return ($P103)
  control_1168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["HLL";"Compiler"]
.sub "_block1177"  :anon :subid("34_1308504719.80411") :outer("33_1308504719.80411")
.annotate 'line', 152
    new $P107, "Undef"
    set $P1179, $P107
    .lex "$outer_ctx", $P1179
    find_lex $P1180, "%adverbs"
    unless_null $P1180, vivify_77
    $P1180 = root_new ['parrot';'Hash']
  vivify_77:
    set $P108, $P1180["outer_ctx"]
    unless_null $P108, vivify_78
    new $P108, "Undef"
  vivify_78:
    store_lex "$outer_ctx", $P108
.annotate 'line', 153
    find_lex $P108, "$outer_ctx"
    defined $I103, $P108
    unless $I103, if_1181_end
.annotate 'line', 154
    find_lex $P1182, "$output"
    unless_null $P1182, vivify_79
    $P1182 = root_new ['parrot';'ResizablePMCArray']
  vivify_79:
    set $P109, $P1182[0]
    unless_null $P109, vivify_80
    new $P109, "Undef"
  vivify_80:
    find_lex $P110, "$outer_ctx"
    $P109."set_outer_ctx"($P110)
  if_1181_end:
.annotate 'line', 157
    find_lex $P1183, "%adverbs"
    unless_null $P1183, vivify_81
    $P1183 = root_new ['parrot';'Hash']
  vivify_81:
    set $P108, $P1183["trace"]
    unless_null $P108, vivify_82
    new $P108, "Undef"
  vivify_82:
    set $I103, $P108
    trace $I103
.annotate 'line', 158
    find_lex $P108, "$output"
    find_lex $P109, "@args"
    $P110 = $P108($P109 :flat)
    store_lex "$output", $P110
.annotate 'line', 159
    trace 0
.annotate 'line', 151
    .return ()
.end


.namespace ["HLL";"Compiler"]
.include "except_types.pasm"
.sub "ctxsave"  :subid("35_1308504719.80411") :method :outer("11_1308504719.80411")
.annotate 'line', 165
    new $P1186, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1186, control_1185
    push_eh $P1186
    .lex "self", self
.annotate 'line', 167

                $P0 = getinterp
                $P1187 = $P0['context';1]
            
    store_dynamic_lex "$*MAIN_CTX", $P1187
.annotate 'line', 171
    new $P102, "Integer"
    assign $P102, 0
    store_dynamic_lex "$*CTXSAVE", $P102
.annotate 'line', 165
    .return ($P102)
  control_1185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace []
.sub "_block1189" :load :anon :subid("36_1308504719.80411")
.annotate 'line', 1
    .const 'Sub' $P1191 = "10_1308504719.80411" 
    $P100 = $P1191()
    .return ($P100)
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
