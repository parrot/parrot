# $Id$

=head1 NAME

Regex - Regex library

=head1 DESCRIPTION

This file brings together the various Regex modules needed for Regex.pbc .

=cut

### .include 'src/Regex/Cursor.pir'
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

Regex::Cursor - Regex Cursor nodes

=head1 DESCRIPTION

This file implements the Regex::Cursor class, used for managing regular
expression control flow.  Regex::Cursor is also a base class for
grammars.

=cut

.include 'cclass.pasm'
### .include 'src/Regex/constants.pir'
.const int CURSOR_FAIL = -1
.const int CURSOR_FAIL_GROUP = -2
.const int CURSOR_FAIL_RULE = -3
.const int CURSOR_FAIL_MATCH = -4

.const int CURSOR_TYPE_SCAN = 1
.const int CURSOR_TYPE_PEEK = 2

.namespace ['Regex';'Cursor']

.sub '' :anon :load :init
    load_bytecode 'P6object.pbc'
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    $P0 = p6meta.'new_class'('Regex::Cursor', 'attr'=>'$!target $!from $!pos $!match $!names $!debug @!bstack @!cstack @!caparray')
    $P0 = box 0
    set_global '$!generation', $P0
    $P0 = new ['Boolean']
    assign $P0, 0
    set_global '$!FALSE', $P0
    $P0 = new ['Boolean']
    assign $P0, 1
    set_global '$!TRUE', $P0
    .return ()
.end

=head2 Methods

=over 4

=item new_match()

A method that creates an empty Match object, by default of type
C<Regex::Match>. This method can be overridden for generating HLL-specific
Match objects.

=cut

.sub 'new_match' :method
    .local pmc match
    match = new ['Regex';'Match']
    .return (match)
.end

=item new_array()

A method that creates an empty array object, by default of type
C<ResizablePMCArray>. This method can be overridden for generating HLL-specific
arrays for usage within Match objects.

=cut

.sub 'new_array' :method
    .local pmc arr
    arr = new ['ResizablePMCArray']
    .return (arr)
.end

=item MATCH()

Return this cursor's current Match object, generating a new one
for the Cursor if one hasn't been created yet.

=cut

.sub 'MATCH' :method
    .local pmc match
    match = getattribute self, '$!match'
    if null match goto match_make
    $P0 = get_global '$!TRUE'
    $I0 = issame match, $P0
    unless $I0 goto match_done

    # First, create a Match object and bind it
  match_make:
    match = self.'new_match'()
    setattribute self, '$!match', match
    setattribute match, '$!cursor', self
    .local pmc target, from, to
    target = getattribute self, '$!target'
    setattribute match, '$!target', target
    from = getattribute self, '$!from'
    setattribute match, '$!from', from
    to = getattribute self, '$!pos'
    setattribute match, '$!to', to

    # Create any arrayed subcaptures.
    .local pmc caparray, caparray_it, caphash
    caparray = getattribute self, '@!caparray'
    if null caparray goto caparray_done
    caparray_it = iter caparray
    caphash = new ['Hash']
  caparray_loop:
    unless caparray_it goto caparray_done
    .local string subname
    .local pmc arr
    .local int keyint
    subname = shift caparray_it
    arr = self.'new_array'()
    caphash[subname] = arr
    keyint = is_cclass .CCLASS_NUMERIC, subname, 0
    if keyint goto caparray_int
    match[subname] = arr
    goto caparray_loop
  caparray_int:
    $I0 = subname
    match[$I0] = arr
  caparray_done:

    # If it's not a successful match, or if there are
    # no saved subcursors, we're done.
    if to < from goto match_done
    .local pmc cstack, cstack_it
    cstack = getattribute self, '@!cstack'
    if null cstack goto cstack_done
    unless cstack goto cstack_done
    cstack_it = iter cstack
  cstack_loop:
    unless cstack_it goto cstack_done
    .local pmc subcur, submatch, names
    subcur = shift cstack_it
    # If the subcursor isn't bound with a name, skip it
    names = getattribute subcur, '$!names'
    if null names goto cstack_loop
    $I0 = isa subcur, ['Regex';'Cursor']
    unless $I0 goto cstack_1
    submatch = subcur.'MATCH'()
    goto cstack_2
  cstack_1:
    submatch = subcur
  cstack_2:
    # See if we have multiple binds
    .local pmc names_it
    subname = names
    names_it = get_global '$!FALSE'
    $I0 = index subname, '='
    if $I0 < 0 goto cstack_subname
    names_it = split '=', subname
  cstack_subname_loop:
    subname = shift names_it
  cstack_subname:
    keyint = is_cclass .CCLASS_NUMERIC, subname, 0
    if null caparray goto cstack_bind
    $I0 = exists caphash[subname]
    unless $I0 goto cstack_bind
    if keyint goto cstack_array_int
    $P0 = match[subname]
    push $P0, submatch
    goto cstack_bind_done
  cstack_array_int:
    $I0 = subname
    $P0 = match[$I0]
    push $P0, submatch
    goto cstack_bind_done
  cstack_bind:
    if keyint goto cstack_bind_int
    match[subname] = submatch
    goto cstack_bind_done
  cstack_bind_int:
    $I0 = subname
    match[$I0] = submatch
  cstack_bind_done:
    if names_it goto cstack_subname_loop
    goto cstack_loop
  cstack_done:

  match_done:
    .return (match)
.end


=item parse(target [, 'rule'=>regex])

Parse C<target> in the current grammar starting with C<regex>.
If C<regex> is omitted, then use the C<TOP> rule for the grammar.

=cut

.sub 'parse' :method
    .param pmc target
    .param pmc regex           :named('rule') :optional
    .param int has_regex       :opt_flag
    .param pmc actions         :named('actions') :optional
    .param int rxtrace         :named('rxtrace') :optional
    .param pmc options         :slurpy :named

    if has_regex goto have_regex
    regex = box 'TOP'
  have_regex:
    $I0 = isa regex, ['String']
    unless $I0 goto regex_done
    $S0 = regex
    regex = find_method self, $S0
  regex_done:

    .lex '$*ACTIONS', actions

    .local pmc cur, match
    cur = self.'!cursor_init'(target, options :flat :named)
    unless rxtrace goto rxtrace_done
    cur.'DEBUG'()
  rxtrace_done:
    cur = cur.regex()
    match = cur.'MATCH'()
    .return (match)
.end


=item pos()

Return the cursor's current position.

=cut

.sub 'pos' :method
    $P0 = getattribute self, '$!pos'
    .return ($P0)
.end


=item from()

Return the cursor's from position.

=cut

.sub 'from' :method
    $P0 = getattribute self, '$!from'
    .return ($P0)
.end

=back

=head2 Private methods

=over 4

=item !cursor_init(target)

Create a new cursor for matching C<target>.

=cut

.sub '!cursor_init' :method
    .param string target
    .param int pos             :named('p') :optional
    .param int has_pos         :opt_flag
    .param int cont            :named('c') :optional
    .param int has_cont        :opt_flag

    .local pmc parrotclass, cur
    $P0 = self.'HOW'()
    parrotclass = getattribute $P0, 'parrotclass'
    cur = new parrotclass

    $P0 = new ['CodeString']
    $P0 = target
    setattribute cur, '$!target', $P0

    if has_cont goto cursor_cont
    $P0 = box pos
    setattribute cur, '$!from', $P0
    $P0 = box pos
    setattribute cur, '$!pos', $P0
    goto cursor_done
  cursor_cont:
    $P0 = box CURSOR_FAIL
    setattribute cur, '$!from', $P0
    $P0 = box cont
    setattribute cur, '$!pos', $P0
  cursor_done:

    .return (cur)
.end

=item !cursor_start([lang])

Create and initialize a new cursor from C<self>.  If C<lang> is
provided, then the new cursor has the same type as lang.

=cut

.sub '!cursor_start' :method
    .param pmc lang            :optional
    .param int has_lang        :opt_flag

    if has_lang goto have_lang
    lang = self
  have_lang:

    .local pmc parrotclass, cur
    $P0 = lang.'HOW'()
    parrotclass = getattribute $P0, 'parrotclass'
    cur = new parrotclass

    .local pmc from, target, debug

    from = getattribute self, '$!pos'
    setattribute cur, '$!from', from
    setattribute cur, '$!pos', from

    target = getattribute self, '$!target'
    setattribute cur, '$!target', target
    debug = getattribute self, '$!debug'
    setattribute cur, '$!debug', debug

    .return (cur, from, target)
.end


=item !cursor_fail(pos)

Permanently fail this cursor.

=cut

.sub '!cursor_fail' :method
    .local pmc pos
    pos = box CURSOR_FAIL_RULE
    setattribute self, '$!pos', pos
    null $P0
    setattribute self, '$!match', $P0
    setattribute self, '@!bstack', $P0
    setattribute self, '@!cstack', $P0
.end


=item !cursor_pass(pos, name)

Set the Cursor as passing at C<pos>; calling any reduction action
C<name> associated with the cursor.  This method simply sets
C<$!match> to a boolean true value to indicate the regex was
successful; the C<MATCH> method above replaces this boolean true
with a "real" Match object when requested.

=cut

.sub '!cursor_pass' :method
    .param pmc pos
    .param string name

    setattribute self, '$!pos', pos
    .local pmc match
    match = get_global '$!TRUE'
    setattribute self, '$!match', match
    unless name goto done
    self.'!reduce'(name)
  done:
    .return (self)
.end


=item !cursor_caparray(caparray :slurpy)

Set the list of subcaptures that produce arrays to C<caparray>.

=cut

.sub '!cursor_caparray' :method
    .param pmc caparray        :slurpy
    setattribute self, '@!caparray', caparray
.end


=item !cursor_names(names)

Set the Cursor's name (for binding) to C<names>.

=cut

.sub '!cursor_names' :method
    .param pmc names
    setattribute self, '$!names', names
.end


=item !cursor_pos(pos)

Set the cursor's position to C<pos>.

=cut

.sub '!cursor_pos' :method
    .param pmc pos
    setattribute self, '$!pos', pos
.end


=item !cursor_debug(args :slurpy)

Log a debug message.

=cut

.sub '!cursor_debug' :method
    .param pmc args            :slurpy
    $P0 = getattribute self, '$!debug'
    if null $P0 goto done
    unless $P0 goto done
    .local pmc from, pos, orig
    .local int line
    from = getattribute self, '$!from'
    orig = getattribute self, '$!target'
    line = orig.'lineof'(from)
    inc line
    printerr from
    printerr '/'
    printerr line
    printerr ': '
    $S0 = join '', args
    printerr $S0
    printerr "\n"
  done:
    .return (self)
.end


=item !mark_push(rep, pos, mark)

Push a new backtracking point onto the cursor with the given
C<rep>, C<pos>, and backtracking C<mark>.  (The C<mark> is typically
the address of a label to branch to when backtracking occurs.)

=cut

.sub '!mark_push' :method
    .param int rep
    .param int pos
    .param int mark
    .param pmc subcur          :optional
    .param int has_subcur      :opt_flag

    # cptr contains the desired number of elements in the cstack
    .local int cptr
    cptr = 0

    # Initialize bstack if needed, and set cptr to be the cstack
    # size requested by the top frame.
    .local pmc bstack
    bstack = getattribute self, '@!bstack'
    if null bstack goto bstack_new
    unless bstack goto bstack_done
    $I0 = elements bstack
    dec $I0
    cptr = bstack[$I0]
    goto bstack_done
  bstack_new:
    bstack = new ['ResizableIntegerArray']
    setattribute self, '@!bstack', bstack
  bstack_done:

    # If a new subcursor is being pushed, then save it in cstack
    # and change cptr to include the new subcursor.  Also clear
    # any existing match object, as we may have just changed the
    # match state.
    unless has_subcur goto subcur_done
    null $P0
    setattribute self, '$!match', $P0
    .local pmc cstack
    cstack = getattribute self, '@!cstack'
    unless null cstack goto have_cstack
    cstack = new ['ResizablePMCArray']
    setattribute self, '@!cstack', cstack
  have_cstack:
    cstack[cptr] = subcur
    inc cptr
  subcur_done:

    # Save our mark frame information.
    push bstack, mark
    push bstack, pos
    push bstack, rep
    push bstack, cptr
.end


=item !mark_peek(mark)

Return information about the latest frame for C<mark>.
If C<mark> is zero, return information about the latest frame.

=cut

.sub '!mark_peek' :method
    .param int tomark

    .local pmc bstack
    bstack = getattribute self, '@!bstack'
    if null bstack goto no_mark
    unless bstack goto no_mark

    .local int bptr
    bptr = elements bstack

  bptr_loop:
    bptr = bptr - 4
    if bptr < 0 goto no_mark
    .local int rep, pos, mark, cptr
    mark = bstack[bptr]
    unless tomark goto bptr_done
    unless mark == tomark goto bptr_loop
  bptr_done:
    $I0  = bptr + 1
    pos  = bstack[$I0]
    inc $I0
    rep  = bstack[$I0]
    inc $I0
    cptr = bstack[$I0]
    .return (rep, pos, mark, bptr, bstack, cptr)

  no_mark:
    .return (0, CURSOR_FAIL_GROUP, 0, 0, bstack, 0)
.end


=item !mark_fail(tomark)

Remove the most recent C<mark> and backtrack the cursor to the
point given by that mark.  If C<mark> is zero, then
backtracks the most recent mark.  Returns the backtracked
values of repetition count, cursor position, and mark (address).

=cut

.sub '!mark_fail' :method
    .param int mark

    # Get the frame information for C<mark>.
    .local int rep, pos, mark, bptr, cptr
    .local pmc bstack
    (rep, pos, mark, bptr, bstack, cptr) = self.'!mark_peek'(mark)

    # clear any existing Match object
    null $P0
    setattribute self, '$!match', $P0

    .local pmc subcur
    null subcur

    # If there's no bstack, there's nothing else to do.
    if null bstack goto done

    # If there's a subcursor associated with this mark, return it.
    unless cptr > 0 goto cstack_done
    .local pmc cstack
    cstack = getattribute self, '@!cstack'
    dec cptr
    subcur = cstack[cptr]
    # Set the cstack to the size requested by the soon-to-be-top mark frame.
    unless bptr > 0 goto cstack_zero
    $I0 = bptr - 1
    $I0 = bstack[$I0]
    assign cstack, $I0
    goto cstack_done
  cstack_zero:
    assign cstack, 0
  cstack_done:

    # Pop the current mark frame and all above it.
    assign bstack, bptr

  done:
    .return (rep, pos, mark, subcur)
.end


=item !mark_commit(mark)

Like C<!mark_fail> above this backtracks the cursor to C<mark>
(releasing any intermediate marks), but preserves the current
capture states.

=cut

.sub '!mark_commit' :method
    .param int mark

    # find mark
    .local int rep, pos, mark, bptr, cptr
    .local pmc bstack
    (rep, pos, mark, bptr, bstack) = self.'!mark_peek'(mark)

    # get current cstack size into cptr
    if null bstack goto done
    unless bstack goto done
    $I0 = elements bstack
    dec $I0
    cptr = bstack[$I0]

    # Pop the mark frame and everything above it.
    assign bstack, bptr

    # If we don't need to hold any cstack information, we're done.
    unless cptr > 0 goto done

    # If the top frame is an auto-fail frame, (re)use it to hold
    # our needed cptr, otherwise create a new auto-fail frame to do it.
    unless bptr > 0 goto cstack_push
    $I0 = bptr - 3             # pos is at top-3
    $I1 = bstack[$I0]
    unless $I1 < 0 goto cstack_push
    $I0 = bptr - 1             # cptr is at top-1
    bstack[$I0] = cptr
    goto done
  cstack_push:
    push bstack, 0             # mark
    push bstack, CURSOR_FAIL   # pos
    push bstack, 0             # rep
    push bstack, cptr          # cptr

  done:
    .return (rep, pos, mark)
.end


=item !reduce(name [, key] [, match])

Perform any action associated with the current regex match.

=cut

.sub '!reduce' :method
    .param string name
    .param string key          :optional
    .param int has_key         :opt_flag
    .param pmc match           :optional
    .param int has_match       :opt_flag
    .local pmc actions
    actions = find_dynamic_lex '$*ACTIONS'
    if null actions goto actions_done
    $I0 = can actions, name
    unless $I0 goto actions_done
    if has_match goto match_done
    match = self.'MATCH'()
  match_done:
    if has_key goto actions_key
    actions.name(match)
    goto actions_done
  actions_key:
    .tailcall actions.name(match, key)
  actions_done:
    .return ()
.end


=item !BACKREF(name)

Match the backreference given by C<name>.

=cut

.sub '!BACKREF' :method
    .param string name
    .local pmc cur
    .local int pos, eos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()

    # search the cursor cstack for the latest occurrence of C<name>
    .local pmc cstack
    cstack = getattribute self, '@!cstack'
    if null cstack goto pass
    .local int cstack_it
    cstack_it = elements cstack
  cstack_loop:
    dec cstack_it
    unless cstack_it >= 0 goto pass
    .local pmc subcur
    subcur = cstack[cstack_it]
    $P0 = getattribute subcur, '$!names'
    if null $P0 goto cstack_loop
    $S0 = $P0
    if name != $S0 goto cstack_loop
    # we found a matching subcursor, get the literal it matched
  cstack_done:
    .local int litlen
    .local string litstr
    $I1 = subcur.'pos'()
    $I0 = subcur.'from'()
    litlen = $I1 - $I0
    litstr = substr tgt, $I0, litlen
    # now test the literal against our target
    $S0 = substr tgt, pos, litlen
    unless $S0 == litstr goto fail
    pos += litlen
  pass:
    cur.'!cursor_pass'(pos, '')
  fail:
    .return (cur)
.end

=item !process_pastnode_results_for_interpolation

Used by the pastnode PAST::Regex type to prepare the results of the evaluation for interpolation.

Takes two arguments:

=over 4

=item The node results

=item The subtype of the PAST::Regex node, which is one of:

=over 4

=item interp_regex

String values should be compiled into regexes and then interpolated.

=item interp_literal

String values should be treated as literals.

=item interp_literal_i

String values should be treated as literals and matched case-insensitively.

=back

=back

Returns a RPA containing the elements to be interpolated

=cut

.sub '!process_pastnode_results_for_interpolation' :method
    .param pmc node
    .param string subtype

    .local pmc it, result, compiler, context
    .local string codestr

    result = new ['ResizablePMCArray']
    $S0 = typeof node
    if $S0 == 'ResizablePMCArray' goto array
    $P1 = node
    it = box 0
    goto not_array
  array:
    it = iter node
  loop:
    unless it, loop_done
    $P1 = shift it
  not_array:
    if subtype != 'interp_regex' goto literal 
    # Don't need to compile it if it's already a Sub
    $I0 = isa $P1, ['Sub']
    if $I0 goto literal
    codestr = $P1
    $P1 = split '/', codestr
    codestr = join '\\/', $P1
    codestr = concat '/', codestr
    codestr = concat codestr, '/'
    compiler = compreg 'NQP-rx'
    $P2 = getinterp
    context = $P2['context';0]
    $P2 = compiler.'compile'(codestr, 'outer_ctx'=>context)
    $P1 = $P2[0]
    $P2 = getattribute context, 'current_sub'
    $P1.'set_outer'($P2)
    $P1 = $P1()
  literal:
    push result, $P1
    goto loop
  loop_done:
    .return (result)
.end

=back

=head2 Vtable functions

=over 4

=item get_bool

=cut

.sub '' :vtable('get_bool') :method
    .local pmc match
    match = getattribute self, '$!match'
    if null match goto false
    $I0 = istrue match
    .return ($I0)
  false:
    .return (0)
.end

=back

=head1 AUTHORS

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
### .include 'src/Regex/Cursor-builtins.pir'
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

Regex::Cursor-builtins - builtin regexes for Cursor objects

=cut

.include 'cclass.pasm'

.namespace ['Regex';'Cursor']

.sub 'before' :method
    .param pmc regex           :optional
    .local pmc cur
    .local int pos
    (cur, pos) = self.'!cursor_start'()
    if null regex goto fail
    $P0 = cur.regex()
    unless $P0 goto fail
    cur.'!cursor_pass'(pos, 'before')
  fail:
    .return (cur)
.end


.sub 'ident' :method
    .local pmc cur
    .local int pos, eos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()
    eos = length tgt
    $S0 = substr tgt, pos, 1
    if $S0 == '_' goto ident_1
    $I0 = is_cclass .CCLASS_ALPHABETIC, tgt, pos
    unless $I0 goto fail
  ident_1:
    pos = find_not_cclass .CCLASS_WORD, tgt, pos, eos
    cur.'!cursor_pass'(pos, 'ident')
  fail:
    .return (cur)
.end

.sub 'wb' :method
    .local pmc cur
    .local int pos, eos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()
    if pos == 0 goto pass
    eos = length tgt
    if pos == eos goto pass
    $I0 = pos - 1
    $I1 = is_cclass .CCLASS_WORD, tgt, $I0
    $I2 = is_cclass .CCLASS_WORD, tgt, pos
    if $I1 == $I2 goto fail
  pass:
    cur.'!cursor_pass'(pos, 'wb')
  fail:
    .return (cur)
.end

.sub 'ww' :method
    .local pmc cur
    .local int pos, eos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()
    if pos == 0 goto fail
    eos = length tgt
    if pos == eos goto fail
    $I0 = is_cclass .CCLASS_WORD, tgt, pos
    unless $I0 goto fail
    $I1 = pos - 1
    $I0 = is_cclass .CCLASS_WORD, tgt, $I1
    unless $I0 goto fail
  pass:
    cur.'!cursor_pass'(pos, 'ww')
  fail:
    .return (cur)
.end

.sub 'ws' :method
    .local pmc cur
    .local int pos, eos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()
    eos = length tgt
    if pos >= eos goto pass
    if pos == 0 goto ws_scan
    $I0 = is_cclass .CCLASS_WORD, tgt, pos
    unless $I0 goto ws_scan
    $I1 = pos - 1
    $I0 = is_cclass .CCLASS_WORD, tgt, $I1
    if $I0 goto fail
  ws_scan:
    pos = find_not_cclass .CCLASS_WHITESPACE, tgt, pos, eos
  pass:
    cur.'!cursor_pass'(pos, 'ws')
  fail:
    .return (cur)
.end

.sub '!cclass' :anon
    .param pmc self
    .param string name
    .param int cclass
    .local pmc cur
    .local int pos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()
    $I0 = is_cclass cclass, tgt, pos
    unless $I0 goto fail
    inc pos
    cur.'!cursor_pass'(pos, name)
  fail:
    .return (cur)
.end

.sub 'alpha' :method
    .local pmc cur
    .local int pos
    .local string tgt
    (cur, pos, tgt) = self.'!cursor_start'()
    $I0 = is_cclass .CCLASS_ALPHABETIC, tgt, pos
    if $I0 goto pass
    $S0 = substr tgt, pos, 1
    if $S0 != '_' goto fail
  pass:
    inc pos
    cur.'!cursor_pass'(pos, 'alpha')
  fail:
    .return (cur)
.end

.sub 'upper' :method
    .tailcall '!cclass'(self, 'upper', .CCLASS_UPPERCASE)
.end

.sub 'lower' :method
    .tailcall '!cclass'(self, 'lower', .CCLASS_LOWERCASE)
.end

.sub 'digit' :method
    .tailcall '!cclass'(self, 'digit', .CCLASS_NUMERIC)
.end

.sub 'xdigit' :method
    .tailcall '!cclass'(self, 'xdigit', .CCLASS_HEXADECIMAL)
.end

.sub 'print' :method
    .tailcall '!cclass'(self, 'print', .CCLASS_PRINTING)
.end

.sub 'graph' :method
    .tailcall '!cclass'(self, 'graph', .CCLASS_GRAPHICAL)
.end

.sub 'cntrl' :method
    .tailcall '!cclass'(self, 'cntrl', .CCLASS_CONTROL)
.end

.sub 'punct' :method
    .tailcall '!cclass'(self, 'punct', .CCLASS_PUNCTUATION)
.end

.sub 'alnum' :method
    .tailcall '!cclass'(self, 'alnum', .CCLASS_ALPHANUMERIC)
.end

.sub 'space' :method
    .tailcall '!cclass'(self, 'space', .CCLASS_WHITESPACE)
.end

.sub 'blank' :method
    .tailcall '!cclass'(self, 'blank', .CCLASS_BLANK)
.end

.sub 'FAILGOAL' :method
    .param string goal
    .local string dba
    $P0 = getinterp
    $P0 = $P0['sub';1]
    dba = $P0
  have_dba:
    .local string message
    message = concat "Unable to parse ", dba
    message .= ", couldn't find final "
    message .= goal
    $P0 = getattribute self, '$!target'
    $I0 = can $P0, 'lineof'
    unless $I0 goto have_line
    message .= ' at line '
    $I0 = self.'pos'()
    $I0 = $P0.'lineof'($I0)
    inc $I0
    $S0 = $I0
    message .= $S0
  have_line:
    die message
.end

.sub 'DEBUG' :method
    .param pmc arg             :optional
    .param int has_arg         :opt_flag

    if has_arg goto have_arg
    arg = get_global '$!TRUE'
  have_arg:

    setattribute self, '$!debug', arg
    .return (1)
.end

=head1 AUTHORS

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
### .include 'src/Regex/Cursor-protoregex-peek.pir'
# Copyright (C) 2009, The Perl Foundation.

=head1 NAME

Regex::Cursor-protoregex-peek - simple protoregex implementation

=head1 DESCRIPTION

=over 4

=item !protoregex(name)

Perform a match for protoregex C<name>.

=cut

.sub '!protoregex' :method
    .param string name

    .local pmc tokrx, toklen
    (tokrx, toklen) = self.'!protoregex_tokrx'(name)
  have_tokrx:

    self.'!cursor_debug'('PROTO ', name)

    # If there are no entries at all for this protoregex, we fail outright.
    unless tokrx goto fail

    # Figure out where we are in the current match.
    .local pmc target
    .local int pos
    target = getattribute self, '$!target'
    $P1 = getattribute self, '$!pos'
    pos = $P1

    # Use the character at the current match position to determine
    # the longest possible token we could encounter at this point.
    .local string token1, token
    token1 = substr target, pos, 1
    $I0 = toklen[token1]
    token = substr target, pos, $I0
    $S0 = escape token
    $S1 = escape token1
    self.'!cursor_debug'('        token1="', $S1, '", token="', $S0, '"')

    # Create a hash to keep track of the methods we've already called,
    # so that we don't end up calling it twice.
    .local pmc mcalled
    mcalled = new ['Hash']

    # Look in the tokrx hash for any rules that are keyed with the
    # current token.  If there aren't any, or the rules we have don't
    # match, then shorten the token by one character and try again
    # until we either have a match or we've run out of candidates.
  token_loop:
    .local pmc rx, result
    rx = tokrx[token]
    if null rx goto token_next
    $I0 = isa rx, ['ResizablePMCArray']
    if $I0 goto rx_array
    .local int rxaddr
    rxaddr = get_addr rx
    $P0 = mcalled[rxaddr]
    unless null $P0 goto token_next
    result = self.rx()
    mcalled[rxaddr] = mcalled
    if result goto done
    goto token_next
  rx_array:
    .local pmc rx_it
    rx_it = iter rx
  cand_loop:
    unless rx_it goto cand_done
    rx = shift rx_it
    rxaddr = get_addr rx
    $P0 = mcalled[rxaddr]
    unless null $P0 goto token_next
    result = self.rx()
    mcalled[rxaddr] = mcalled
    if result goto done
    goto cand_loop
  cand_done:
  token_next:
    unless token > '' goto fail
    token = chopn token, 1
    goto token_loop

  done:
    pos = result.'pos'()
    self.'!cursor_debug'('PASS  ', name, ' at pos=', pos)
    .return (result)

  fail:
    self.'!cursor_debug'('FAIL  ', name)
    unless null result goto fail_1
    result = self.'!cursor_start'()
    result.'!cursor_fail'()
  fail_1:
    .return (result)
.end


=item !protoregex_generation()

Reset the C<$!generation> flag to indicate that protoregexes
need to be recalculated (because new protoregexes have been
added).

=cut

.sub '!protoregex_generation' :method
    $P0 = get_global '$!generation'
    # don't change this to 'inc' -- we want to ensure new PMC
    $P1 = add $P0, 1
    set_global '$!generation', $P1
    .return ($P1)
.end

=item !protoregex_tokrx(name)

Return the token list for protoregex C<name>.  If the list
doesn't already exist, or if the existing list is stale,
create a new one and return it.

=cut

.sub '!protoregex_tokrx' :method
    .param string name

    .local pmc generation
    generation = get_global '$!generation'

    # Get the protoregex table for the current grammar.  If
    # a table doesn't exist or it's out of date, generate a
    # new one.
    .local pmc parrotclass, prototable
    parrotclass = typeof self
    prototable = getprop '%!prototable', parrotclass
    if null prototable goto make_prototable
    $P0 = getprop '$!generation', prototable
    $I0 = issame $P0, generation
    if $I0 goto have_prototable
  make_prototable:
    prototable = self.'!protoregex_gen_table'(parrotclass)
  have_prototable:

    # Obtain the toxrk and toklen hashes for the current grammar
    # from the protoregex table.  If they already exist, we're
    # done, otherwise we create new ones below.
    # yet for this table, then do that now.
    .local pmc tokrx, toklen
    $S0 = concat name, '.tokrx'
    tokrx = prototable[$S0]
    $S0 = concat name, '.toklen'
    toklen = prototable[$S0]
    unless null tokrx goto tokrx_done

    self.'!cursor_debug'('Generating protoregex table for ', name)

    .local pmc toklen, tokrx
    toklen = new ['Hash']
    tokrx  = new ['Hash']

    # The prototable has already collected all of the names of
    # protoregex methods as keys in C<prototable>.  First
    # get a list of all of the methods that begin with "name:sym<".
    .local string mprefix
    .local int mlen
    mprefix = concat name, ':sym<'
    mlen   = length mprefix
    .local pmc methodlist, proto_it
    methodlist = new ['ResizableStringArray']
    proto_it = iter prototable
  proto_loop:
    unless proto_it goto proto_done
    .local string methodname
    methodname = shift proto_it
    $S0 = substr methodname, 0, mlen
    if $S0 != mprefix goto proto_loop
    push methodlist, methodname
    goto proto_loop
  proto_done:

    # Now, walk through all of the methods, building the
    # tokrx and toklen tables as we go.
    .local pmc sorttok
    sorttok = new ['ResizablePMCArray']
  method_loop:
    unless methodlist goto method_done
    methodname = shift methodlist

    # Look up the method itself.
    .local pmc rx
    rx = find_method self, methodname

    # Now find the prefix tokens for the method; calling the
    # method name with a !PREFIX__ prefix should return us a list
    # of valid token prefixes.  If no such method exists, then
    # our token prefix is a null string.
    .local pmc tokens, tokens_it
    $S0 = concat '!PREFIX__', methodname
    $I0 = can self, $S0
    unless $I0 goto method_peek_none
    tokens = self.$S0()
    goto method_peek_done
  method_peek_none:
    tokens = new ['ResizablePMCArray']
    push tokens, ''
  method_peek_done:

    # Now loop through all of the tokens for the method, updating
    # the longest length per initial token character and adding
    # the token to the tokrx hash.  Entries in the tokrx hash
    # are automatically promoted to arrays when there's more
    # than one candidate, and any arrays created are placed into
    # sorttok so they can have a secondary sort below.
    .local pmc seentok
    seentok = new ['Hash']
  tokens_loop:
    unless tokens goto tokens_done
    .local string tkey, tfirst
    $P0 = shift tokens
    $I0 = isa $P0, ['ResizablePMCArray']
    unless $I0 goto token_item
    splice tokens, $P0, 0, 0
    goto tokens_loop
  token_item:
    tkey = $P0

    # If we've already processed this token for this rule,
    # don't enter it twice into tokrx.
    $I0 = exists seentok[tkey]
    if $I0 goto tokens_loop
    seentok[tkey] = seentok

    # Keep track of longest token lengths by initial character
    tfirst = substr tkey, 0, 1
    $I0 = length tkey
    $I1 = toklen[tfirst]
    if $I0 <= $I1 goto toklen_done
    toklen[tfirst] = $I0
  toklen_done:

    # Add the regex to the list under the token key, promoting
    # entries to lists as appropriate.
    .local pmc rxlist
    rxlist = tokrx[tkey]
    if null rxlist goto rxlist_0
    $I0 = isa rxlist, ['ResizablePMCArray']
    if $I0 goto rxlist_n
  rxlist_1:
    $I0 = issame rx, rxlist
    if $I0 goto tokens_loop
    $P0 = rxlist
    rxlist = new ['ResizablePMCArray']
    push sorttok, rxlist
    push rxlist, $P0
    push rxlist, rx
    tokrx[tkey] = rxlist
    goto tokens_loop
  rxlist_n:
    push rxlist, rx
    goto tokens_loop
  rxlist_0:
    tokrx[tkey] = rx
    goto tokens_loop
  tokens_done:
    goto method_loop
  method_done:

    # in-place sort the keys that ended up with multiple entries
    .const 'Sub' $P99 = '!protoregex_cmp'
  sorttok_loop:
    unless sorttok goto sorttok_done
    rxlist = shift sorttok
    rxlist.'sort'($P99)
    goto sorttok_loop
  sorttok_done:

    # It's built!  Now store the tokrx and toklen hashes in the
    # prototable and return them to the caller.
    $S0 = concat name, '.tokrx'
    prototable[$S0] = tokrx
    $S0 = concat name, '.toklen'
    prototable[$S0] = toklen

  tokrx_done:
    .return (tokrx, toklen)
.end

.sub '!protoregex_cmp' :anon
    .param pmc a
    .param pmc b
    $S0 = a
    $I0 = length $S0
    $S1 = b
    $I1 = length $S1
    $I2 = cmp $I1, $I0
    .return ($I2)
.end

=item !protoregex_gen_table(parrotclass)

Generate a new protoregex table for C<parrotclass>.  This involves
creating a hash keyed with method names containing ':sym<' from
C<parrotclass> and all of its superclasses.  This new hash is
then given the current C<$!generate> property so we can avoid
recreating it on future calls.

=cut

.sub '!protoregex_gen_table' :method
    .param pmc parrotclass

    .local pmc prototable
    prototable = new ['Hash']
    .local pmc class_it, method_it
    $P0 = parrotclass.'inspect'('all_parents')
    class_it = iter $P0
  class_loop:
    unless class_it goto class_done
    $P0 = shift class_it
    $P0 = $P0.'methods'()
    method_it = iter $P0
  method_loop:
    unless method_it goto class_loop
    $S0 = shift method_it
    $I0 = index $S0, ':sym<'
    if $I0 < 0 goto method_loop
    prototable[$S0] = prototable
    goto method_loop
  class_done:
    $P0 = get_global '$!generation'
    setprop prototable, '$!generation', $P0
    setprop parrotclass, '%!prototable', prototable
    .return (prototable)
.end


=item !PREFIX__!protoregex(name)

Return the set of initial tokens for protoregex C<name>.
These are conveniently available as the keys of the
tokrx hash.

=cut

.sub '!PREFIX__!protoregex' :method
    .param string name

    .local pmc tokrx
    tokrx = self.'!protoregex_tokrx'(name)
    unless tokrx goto peek_none

    .local pmc results, tokrx_it
    results = new ['ResizablePMCArray']
    tokrx_it = iter tokrx
  tokrx_loop:
    unless tokrx_it goto tokrx_done
    $S0 = shift tokrx_it
    push results, $S0
    goto tokrx_loop
  tokrx_done:
    .return (results)

  peek_none:
    .return ('')
.end


.sub '!PREFIX__!subrule' :method
    .param string name
    .param string prefix

    .local string peekname
    peekname = concat '!PREFIX__', name
    $I0 = can self, peekname
    unless $I0 goto subrule_none

    # make sure we aren't recursing
    .local pmc context
    $P0 = getinterp
    context = $P0['context';1]
  caller_loop:
    if null context goto caller_done
    $P0 = getattribute context, 'current_sub'
    $S0 = $P0
    # stop if we find a name that doesn't begin with ! (33)
    $I0 = ord $S0
    if $I0 != 33 goto caller_done
    if $S0 == peekname goto subrule_none
    context = getattribute context, 'caller_ctx'
    goto caller_loop
  caller_done:

    .local pmc subtokens, tokens
    subtokens = self.peekname()
    unless subtokens goto subrule_none
    unless prefix goto prefix_none
    tokens = new ['ResizablePMCArray']
  subtokens_loop:
    unless subtokens goto subtokens_done
    $P0 = shift subtokens
    $I0 = isa $P0, ['ResizablePMCArray']
    unless $I0 goto subtokens_item
    splice subtokens, $P0, 0, 0
    goto subtokens_loop
  subtokens_item:
    $S0 = $P0
    $S0 = concat prefix, $S0
    push tokens, $S0
    goto subtokens_loop
  subtokens_done:
    .return (tokens)

  prefix_none:
    .return (subtokens)

  subrule_none:
    .return (prefix)
.end


.sub 'DUMP_TOKRX' :method
    .param string name

    .local pmc tokrx
    tokrx = self.'!protoregex_tokrx'(name)
    _dumper(tokrx, name)
    .return (1)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

### .include 'src/Regex/Match.pir'
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

Regex::Match - Regex Match objects

=head1 DESCRIPTION

This file implements Match objects for the regex engine.

=cut

.namespace ['Regex';'Match']

.sub '' :anon :load :init
    load_bytecode 'P6object.pbc'
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    $P0 = p6meta.'new_class'('Regex::Match', 'parent'=>'Capture', 'attr'=>'$!cursor $!target $!from $!to $!ast')
    .return ()
.end

=head2 Methods

=over 4

=item CURSOR()

Returns the Cursor associated with this match object.

=cut

.sub 'CURSOR' :method
    $P0 = getattribute self, '$!cursor'
    .return ($P0)
.end

=item from()

Returns the offset in the target string of the beginning of the match.

=cut

.sub 'from' :method
    $P0 = getattribute self, '$!from'
    .return ($P0)
.end


=item to()

Returns the offset in the target string of the end of the match.

=cut

.sub 'to' :method
    $P0 = getattribute self, '$!to'
    .return ($P0)
.end


=item chars()

Returns C<.to() - .from()>

=cut

.sub 'chars' :method
    $I0 = self.'to'()
    $I1 = self.'from'()
    $I2 = $I0 - $I1
    .return ($I2)
.end


=item orig()

Return the original item that was matched against.

=cut

.sub 'orig' :method
    $P0 = getattribute self, '$!target'
    .return ($P0)
.end


=item Str()

Returns the portion of the target corresponding to this match.

=cut

.sub 'Str' :method
    $S0 = self.'orig'()
    $I0 = self.'from'()
    $I1 = self.'to'()
    $I1 -= $I0
    $S1 = substr $S0, $I0, $I1
    .return ($S1)
.end


=item ast()

Returns the "abstract object" for the Match; if no abstract object
has been set then returns C<Str> above.

=cut

.sub 'ast' :method
    .local pmc ast
    ast = getattribute self, '$!ast'
    unless null ast goto have_ast
    ast = new ['Undef']
    setattribute self, '$!ast', ast
  have_ast:
    .return (ast)
.end

=back

=head2 Vtable functions

=over 4

=item get_bool()

Returns 1 (true) if this is the result of a successful match,
otherwise returns 0 (false).

=cut

.sub '' :vtable('get_bool') :method
    $P0 = getattribute self, '$!from'
    $P1 = getattribute self, '$!to'
    $I0 = isge $P1, $P0
    .return ($I0)
.end


=item get_integer()

Returns the integer value of the matched text.

=cut

.sub '' :vtable('get_integer') :method
    $I0 = self.'Str'()
    .return ($I0)
.end


=item get_number()

Returns the numeric value of this match

=cut

.sub '' :vtable('get_number') :method
    $N0 = self.'Str'()
    .return ($N0)
.end


=item get_string()

Returns the string value of the match

=cut

.sub '' :vtable('get_string') :method
    $S0 = self.'Str'()
    .return ($S0)
.end


=item !make(obj)

Set the "ast object" for the invocant.

=cut

.sub '!make' :method
    .param pmc obj
    setattribute self, '$!ast', obj
    .return (obj)
.end


=back

=head1 AUTHORS

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
### .include 'src/Regex/Method.pir'
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

Regex::Regex, Regex::Method - Regex subs

=head1 DESCRIPTION

This file implements the Regex::Method and Regex::Regex types, used as 
containers for Regex subs that need .ACCEPTS and other regex attributes.

=cut

.namespace ['Regex';'Method']

.sub '' :anon :load :init
    load_bytecode 'P6object.pbc'
    .local pmc p6meta, mproto, rproto
    p6meta = new 'P6metaclass'
    mproto = p6meta.'new_class'('Regex::Method', 'parent'=>'parrot;Sub')
    rproto = p6meta.'new_class'('Regex::Regex', 'parent'=>mproto)
.end

=head2 Methods

=over 4

=item new(sub)

Create a new Regex::Regex object from C<sub>.

=cut

.sub 'new' :method
    .param pmc parrotsub
    $P0 = self.'WHO'()
    $P0 = new $P0
    assign $P0, parrotsub
    .return ($P0)
.end


=item ACCEPTS(target)

Perform a match against target, return the result.

=cut

.sub 'ACCEPTS' :method
    .param pmc target

    .local pmc curproto, match
    curproto = get_hll_global ['Regex'], 'Cursor'
    match = curproto.'parse'(target, 'rule'=>self)
    .return (match)
.end

.namespace ['Regex';'Regex']

.sub 'ACCEPTS' :method
    .param pmc target

    .local pmc curproto, match
    curproto = get_hll_global ['Regex'], 'Cursor'
    match = curproto.'parse'(target, 'rule'=>self, 'c'=>0)
    .return (match)
.end


=back

=head1 AUTHORS

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
### .include 'src/Regex/Dumper.pir'
# Copyright (C) 2005-2009, Parrot Foundation.
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 TITLE

Regex::Dumper - various methods for displaying Match structures

=head2 C<Regex::Match> Methods

=over 4

=item C<__dump(PMC dumper, STR label)>

This method enables Data::Dumper to work on Regex::Match objects.

=cut

.namespace ['Regex';'Match']

.sub "__dump" :method
    .param pmc dumper
    .param string label
    .local string indent, subindent
    .local pmc it, val
    .local string key
    .local pmc hash, array
    .local int hascapts

    (subindent, indent) = dumper."newIndent"()
    print "=> "
    $S0 = self
    dumper."genericString"("", $S0)
    print " @ "
    $I0 = self.'from'()
    print $I0
    hascapts = 0
    hash = self.'hash'()
    if_null hash, dump_array
    it = iter hash
  dump_hash_1:
    unless it goto dump_array
    if hascapts goto dump_hash_2
    print " {"
    hascapts = 1
  dump_hash_2:
    print "\n"
    print subindent
    key = shift it
    val = hash[key]
    print "<"
    print key
    print "> => "
    dumper."dump"(label, val)
    goto dump_hash_1
  dump_array:
    array = self.'list'()
    if_null array, dump_end
    $I1 = elements array
    $I0 = 0
  dump_array_1:
    if $I0 >= $I1 goto dump_end
    if hascapts goto dump_array_2
    print " {"
    hascapts = 1
  dump_array_2:
    print "\n"
    print subindent
    val = array[$I0]
    print "["
    print $I0
    print "] => "
    dumper."dump"(label, val)
    inc $I0
    goto dump_array_1
  dump_end:
    unless hascapts goto end
    print "\n"
    print indent
    print "}"
  end:
    dumper."deleteIndent"()
.end


=item C<dump_str()>

An alternate dump output for a Match object and all of its subcaptures.

=cut

.sub "dump_str" :method
    .param string prefix       :optional           # name of match variable
    .param int has_prefix      :opt_flag
    .param string b1           :optional           # bracket open
    .param int has_b1          :opt_flag
    .param string b2           :optional           # bracket close
    .param int has_b2          :opt_flag

    .local pmc capt
    .local int spi, spc
    .local pmc it
    .local string prefix1, prefix2
    .local pmc jmpstack
    jmpstack = new 'ResizableIntegerArray'

    if has_b2 goto start
    b2 = "]"
    if has_b1 goto start
    b1 = "["
  start:
    .local string out
    out = concat prefix, ':'
    unless self goto subpats
    out .= ' <'
    $S0 = self
    out .= $S0
    out .= ' @ '
    $S0 = self.'from'()
    out .= $S0
    out .= '> '

  subpats:
    $I0 = self
    $S0 = $I0
    out .= $S0
    out .= "\n"
    capt = self.'list'()
    if_null capt, subrules
    spi = 0
    spc = elements capt
  subpats_1:
    unless spi < spc goto subrules
    prefix1 = concat prefix, b1
    $S0 = spi
    concat prefix1, $S0
    concat prefix1, b2
    $I0 = defined capt[spi]
    unless $I0 goto subpats_2
    $P0 = capt[spi]
    local_branch jmpstack, dumper
  subpats_2:
    inc spi
    goto subpats_1

  subrules:
    capt = self.'hash'()
    if_null capt, end
    it = iter capt
  subrules_1:
    unless it goto end
    $S0 = shift it
    prefix1 = concat prefix, '<'
    concat prefix1, $S0
    concat prefix1, ">"
    $I0 = defined capt[$S0]
    unless $I0 goto subrules_1
    $P0 = capt[$S0]
    local_branch jmpstack, dumper
    goto subrules_1

  dumper:
    $I0 = isa $P0, ['Regex';'Match']
    unless $I0 goto dumper_0
    $S0 = $P0.'dump_str'(prefix1, b1, b2)
    out .= $S0
    local_return jmpstack
  dumper_0:
    $I0 = does $P0, 'array'
    unless $I0 goto dumper_3
    $I0 = 0
    $I1 = elements $P0
  dumper_1:
    if $I0 >= $I1 goto dumper_2
    $P1 = $P0[$I0]
    prefix2 = concat prefix1, b1
    $S0 = $I0
    concat prefix2, $S0
    concat prefix2, b2
    $S0 = $P1.'dump_str'(prefix2, b1, b2)
    out .= $S0
    inc $I0
    goto dumper_1
  dumper_2:
    local_return jmpstack
  dumper_3:
    out .= prefix1
    out .= ': '
    $S0 = $P0
    out .= $S0
    out .= "\n"
    local_return jmpstack

  end:
    .return (out)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

### .include 'src/PAST/Regex.pir'
# $Id$

=head1 NAME

PAST::Regex - Regex nodes for PAST

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
for regular expressions.

=over 4

=cut

.namespace ['PAST';'Regex']

.sub '' :init :load
    load_bytecode 'PCT/PAST.pbc'
    .local pmc p6meta
    p6meta = get_hll_global 'P6metaclass'
    p6meta.'new_class'('PAST::Regex', 'parent'=>'PAST::Node')
.end


.sub 'backtrack' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('backtrack', value, has_value)
.end


.sub 'capnames' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('capnames', value, has_value)
.end


.sub 'negate' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('negate', value, has_value)
.end


.sub 'min' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('min', value, has_value)
.end


.sub 'max' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('max', value, has_value)
.end


.sub 'pasttype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pasttype', value, has_value)
.end


.sub 'sep' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('sep', value, has_value)
.end


.sub 'subtype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('subtype', value, has_value)
.end


.sub 'zerowidth' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('zerowidth', value, has_value)
.end


=item prefix()

Returns the prefixes associated with the regex tree rooted
at this node.

=cut

.sub 'prefix' :method
    .param string prefix
    .param pmc tail            :slurpy

    .local string pasttype
    pasttype = self.'pasttype'()
    if pasttype goto have_pasttype
    pasttype = 'concat'
  have_pasttype:

    if pasttype == 'scan' goto prefix_skip

    $S0 = concat 'prefix_', pasttype
    $I0 = can self, $S0
    unless $I0 goto prefix_done
    .tailcall self.$S0(prefix, tail)

  prefix_skip:
    unless tail goto prefix_done
    .local pmc head
    head = shift tail
    .tailcall head.'prefix'(prefix, tail :flat)

  prefix_done:
    .return (prefix)
.end


.sub 'prefix_alt' :method
    .param string prefix
    .param pmc tail

    .local pmc child_it, results
    child_it = self.'iterator'()
    results = new ['ResizablePMCArray']
  child_loop:
    unless child_it goto child_done
    $P0 = shift child_it
    ($P1 :slurpy) = $P0.'prefix'(prefix, tail :flat)
    splice results, $P1, 0, 0
    goto child_loop
  child_done:
    .return (results :flat)
.end


.sub 'prefix_alt_longest' :method
    .param string prefix
    .param pmc tail
    .tailcall self.'prefix_alt'(prefix, tail :flat)
.end


.sub 'prefix_anchor' :method
    .param string prefix
    .param pmc tail

    unless tail goto anchor_done
    .local pmc head
    head = shift tail
    .tailcall head.'prefix'(prefix, tail :flat)
  anchor_done:
    .return (prefix)
.end


.sub 'prefix_concat' :method
    .param string prefix
    .param pmc tail

    $P0 = self.'list'()
    splice tail, $P0, 0, 0
    unless tail goto done
    $P1 = shift tail
    .tailcall $P1.'prefix'(prefix, tail :flat)
  done:
    .return (prefix)
.end


.sub 'prefix_literal' :method
    .param string prefix
    .param pmc tail

    .local pmc lpast
    lpast = self[0]
    $I0 = isa lpast, ['String']
    unless $I0 goto done

    .local string subtype
    subtype = self.'subtype'()
    if subtype == 'ignorecase' goto done

    $S0 = lpast
    prefix = concat prefix, $S0
    unless tail goto done
    $P0 = shift tail
    .tailcall $P0.'prefix'(prefix, tail :flat)

  done:
    .return (prefix)
.end


.sub 'prefix_enumcharlist' :method
    .param string prefix
    .param pmc tail

    .local pmc negate
    negate = self.'negate'()
    .local string subtype, charlist
    subtype = self.'subtype'()
    charlist = self[0]

    if negate goto charlist_negate

    unless tail goto charlist_notail
    if subtype == 'zerowidth' goto charlist_notail

    .local pmc result, head
    result = new ['ResizablePMCArray']
    head = shift tail

    .local int pos, eos
    eos = length charlist
    pos = 0
  charlist_loop:
    unless pos < eos goto charlist_done
    .local string char
    char = substr charlist, pos, 1
    $S0 = concat prefix, char
    ($P0 :slurpy) = head.'prefix'($S0, tail :flat)
    splice result, $P0, 0, 0
    inc pos
    goto charlist_loop
  charlist_done:
    .return (result :flat)

  charlist_notail:
    $P0 = split '', charlist
    .return ($P0 :flat)

  charlist_negate:
    if subtype == 'zerowidth' goto charlist_negate_0
    unless tail goto charlist_negate_0
    .return (prefix)
  charlist_negate_0:
    head = shift tail
    .tailcall head.'prefix'(prefix, tail :flat)
.end


.sub 'prefix_subcapture' :method
    .param string prefix
    .param pmc tail

    .tailcall self.'prefix_concat'(prefix, tail)
.end

.sub 'prefix_subrule' :method
    .param string prefix
    .param pmc tail

    .local pmc name, negate, subtype
    name = self.'name'()
    negate = self.'negate'()
    subtype = self.'subtype'()
    $I0 = does name, 'string'
    unless $I0 goto subrule_none
    if negate goto subrule_none
    if subtype == 'zerowidth' goto subrule_none

    .local pmc selfpast, spast
    $P99 = get_hll_global ['PAST'], 'Var'
    selfpast = $P99.'new'( 'name'=>'self', 'scope'=>'register')
    $P99 = get_hll_global ['PAST'], 'Op'
    spast = $P99.'new'( selfpast, name, prefix, 'name'=>'!PREFIX__!subrule', 'pasttype'=>'callmethod')
    .return (spast)

  subrule_none:
    .return (prefix)
.end

=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 COPYRIGHT

Copyright (C) 2009, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
### .include 'src/PAST/Compiler-Regex.pir'
# $Id$

=head1 NAME

PAST::Compiler-Regex - Compiler for PAST::Regex nodes

=head1 DESCRIPTION

PAST::Compiler-Regex implements the transformations to convert
PAST::Regex nodes into POST.  It's still a part of PAST::Compiler;
we've separated out the regex-specific transformations here for
better code management and debugging.

=head2 Compiler methods

=head3 C<PAST::Regex>

=over 4

=item as_post(PAST::Regex node)

Return the POST representation of the regex AST rooted by C<node>.

=cut

.include 'cclass.pasm'
### .include 'src/Regex/constants.pir'
.const int CURSOR_FAIL = -1
.const int CURSOR_FAIL_GROUP = -2
.const int CURSOR_FAIL_RULE = -3
.const int CURSOR_FAIL_MATCH = -4

.const int CURSOR_TYPE_SCAN = 1
.const int CURSOR_TYPE_PEEK = 2

.namespace ['PAST';'Compiler']

.sub 'as_post' :method :multi(_, ['PAST';'Regex'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    ops = self.'post_new'('Ops', 'node'=>node)

    .local pmc reghash
    reghash = new ['Hash']
    .lex '$*REG', reghash

    .local pmc regexname, regexname_esc
    $P0 = get_global '@?BLOCK'
    $P1 = $P0[0]
    $S0 = $P1.'name'()
    regexname = box $S0
    regexname_esc = self.'escape'($S0)
    .lex '$*REGEXNAME', regexname

    .local string prefix, rname, rtype
    prefix = self.'unique'('rx')
    concat prefix, '_'
    $P0 = split ' ', 'tgt string pos int off int eos int rep int cur pmc'
    $P1 = iter $P0
  iter_loop:
    unless $P1 goto iter_done
    rname = shift $P1
    rtype = shift $P1
    $S1 = concat prefix, rname
    reghash[rname] = $S1
    $S2 = concat '.local ', rtype
    ops.'push_pirop'($S2, $S1)
    goto iter_loop
  iter_done:

    .local pmc startlabel, donelabel, faillabel
    $S0 = concat prefix, 'start'
    startlabel = self.'post_new'('Label', 'result'=>$S0)
    $S0 = concat prefix, 'done'
    donelabel = self.'post_new'('Label', 'result'=>$S0)
    $S0 = concat prefix, 'fail'
    faillabel = self.'post_new'('Label', 'result'=>$S0)
    reghash['fail'] = faillabel

    # If capnames is available, it's a hash where each key is the
    # name of a potential subcapture and the value is greater than 1
    # if it's to be an array.  This builds a list of arrayed subcaptures
    # for use by "!cursor_caparray" below.
    .local pmc capnames, capnames_it, caparray
    capnames = node.'capnames'()
    caparray = box 0
    unless capnames goto capnames_done
    capnames_it = iter capnames
    caparray = new ['ResizablePMCArray']
  capnames_loop:
    unless capnames_it goto capnames_done
    $S0 = shift capnames_it
    $I0 = capnames[$S0]
    unless $I0 > 1 goto capnames_loop
    $S0 = self.'escape'($S0)
    push caparray, $S0
    goto capnames_loop
  capnames_done:

    .local string cur, rep, pos, tgt, off, eos
    (cur, rep, pos, tgt, off, eos) = self.'!rxregs'('cur rep pos tgt off eos')

    unless regexname goto peek_done
    .local pmc tpast, token, tpost
    $P99 = get_hll_global ['PAST'], 'Op'
    tpast = $P99.'new'( 'pasttype'=>'list', 'node'=>node )
    (token :slurpy) = node.'prefix'('')
  token_loop:
    unless token goto token_done
    $P0 = shift token
    push tpast, $P0
    goto token_loop
  token_done:
    $S0 = regexname
    $S0 = concat '!PREFIX__', $S0
    $P99 = get_hll_global ['PAST'], 'Block'
    tpast = $P99.'new'(tpast, 'name'=>$S0, 'lexical'=>0, 'blocktype'=>'method')
    tpost = self.'as_post'(tpast, 'rtype'=>'v')
    ops.'push'(tpost)
  peek_done:

    $S0 = concat '(', cur
    concat $S0, ', '
    concat $S0, pos
    concat $S0, ', '
    concat $S0, tgt
    concat $S0, ')'
    ops.'push_pirop'('callmethod', '"!cursor_start"', 'self', 'result'=>$S0)
    self.'!cursorop'(ops, '!cursor_debug', 0, '"START "', regexname_esc)
    unless caparray goto caparray_skip
    self.'!cursorop'(ops, '!cursor_caparray', 0, caparray :flat)
  caparray_skip:

    ops.'push_pirop'('.lex', 'unicode:"$\x{a2}"', cur)
    ops.'push_pirop'('.local pmc', 'match')
    ops.'push_pirop'('.lex', '"$/"', 'match')
    ops.'push_pirop'('length', eos, tgt, 'result'=>eos)

    # On Parrot, indexing into variable-width encoded strings
    # (such as utf8) becomes much more expensive as we move
    # farther away from the beginning of the string (via calls
    # to utf8_skip_forward).  For regexes that are starting a match
    # at a position other than the beginning of the string (e.g.,
    # a subrule call), we can save a lot of useless scanning work
    # in utf8_skip_forward by removing the first C<off = from-1>
    # characters from the target and then performing all indexed
    # operations on the resulting target relative to C<off>.

    ops.'push_pirop'('set', off, 0)
    ops.'push_pirop'('lt', pos, 2, startlabel)
    ops.'push_pirop'('sub', off, pos, 1, 'result'=>off)
    ops.'push_pirop'('substr', tgt, tgt, off, 'result'=>tgt)
    ops.'push'(startlabel)

    $P0 = self.'post_regex'(node)
    ops.'push'($P0)
    ops.'push'(faillabel)
    self.'!cursorop'(ops, '!mark_fail', 4, rep, pos, '$I10', '$P10', 0)
    ops.'push_pirop'('lt', pos, CURSOR_FAIL, donelabel)
    ops.'push_pirop'('eq', pos, CURSOR_FAIL, faillabel)
    ops.'push_pirop'('jump', '$I10')
    ops.'push'(donelabel)
    self.'!cursorop'(ops, '!cursor_fail', 0)
    self.'!cursorop'(ops, '!cursor_debug', 0, '"FAIL  "', regexname_esc)
    ops.'push_pirop'('return', cur)
    .return (ops)
.end

=item !cursorop(ops, func, retelems, arg :slurpy)

Helper function to push POST nodes onto C<ops> that perform C<func>
on the regex's current cursor.  By default this ends up being a method
call on the cursor, but some values of C<func> can result in inlined
code to perform the equivalent operation without using the method call.

The C<retelems> argument is the number of elements in C<arg> that
represent return values from the function; any remaining elements in arg
are passed to the function as input arguments.

=cut

.sub '!cursorop' :method
    .param pmc ops
    .param string func
    .param int retelems
    .param pmc args            :slurpy

    if retelems < 1 goto result_done
    .local pmc retargs
    retargs = new ['ResizableStringArray']
    $I0 = retelems
  retargs_loop:
    unless $I0 > 0 goto retargs_done
    $S0 = shift args
    push retargs, $S0
    dec $I0
    goto retargs_loop
  retargs_done:
    .local string result
    result = join ', ', retargs
    result = concat '(', result
    concat result, ')'
  result_done:

    .local pmc cur
    cur = self.'!rxregs'('cur')
    $S0 = self.'escape'(func)
    $P0 = ops.'push_pirop'('callmethod', $S0, cur, args :flat)
    if retelems < 1 goto done
    $P0.'result'(result)
  done:
    .return (ops)
.end


=item !rxregs(keystr)

Helper function -- looks up the current regex register table
in the dynamic scope and returns a slice based on the keys
given in C<keystr>.

=cut

.sub '!rxregs' :method
    .param string keystr

    .local pmc keys, reghash, vals
    keys = split ' ', keystr
    reghash = find_dynamic_lex '$*REG'
    vals = new ['ResizablePMCArray']
  keys_loop:
    unless keys goto keys_done
    $S0 = shift keys
    $P0 = reghash[$S0]
    push vals, $P0
    goto keys_loop
  keys_done:
    .return (vals :flat)
.end


=item post_regex(PAST::Regex node)

Return the POST representation of the regex component given by C<node>.
Normally this is handled by redispatching to a method corresponding to
the node's "pasttype" and "backtrack" attributes.  If no "pasttype" is
given, then "concat" is assumed.

=cut

.sub 'post_regex' :method :multi(_, ['PAST';'Regex'])
    .param pmc node
    .param string cur          :optional
    .param int have_cur        :opt_flag

    .local string pasttype
    pasttype = node.'pasttype'()
    if pasttype goto have_pasttype
    pasttype = 'concat'
  have_pasttype:
    $P0 = find_method self, pasttype
    $P1 = self.$P0(node)
    unless have_cur goto done
    $S0 = $P1.'result'()
    if $S0 == cur goto done
    $P1 = self.'coerce'($P1, cur)
  done:
    .return ($P1)
.end


.sub 'post_regex' :method :multi(_, _)
    .param pmc node
    .param string cur          :optional
    .param int have_cur        :opt_flag

    $P0 = self.'as_post'(node)
    unless have_cur goto done
    $P0 = self.'coerce'($P0, cur)
  done:
    .return ($P0)
.end


=item alt(PAST::Regex node)

=cut

.sub 'alt' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos
    (cur, pos) = self.'!rxregs'('cur pos')

    .local string name
    name = self.'unique'('alt')
    concat name, '_'

    .local pmc ops, iter
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)
    iter = node.'iterator'()
    unless iter goto done

    .local int acount
    .local pmc alabel, endlabel
    acount = 0
    $S0 = acount
    $S0 = concat name, $S0
    alabel = self.'post_new'('Label', 'result'=>$S0)
    $S0 = concat name, 'end'
    endlabel = self.'post_new'('Label', 'result'=>$S0)

  iter_loop:
    ops.'push'(alabel)
    .local pmc apast, apost
    apast = shift iter
    apost = self.'post_regex'(apast, cur)
    unless iter goto iter_done
    inc acount
    $S0 = acount
    $S0 = concat name, $S0
    alabel = self.'post_new'('Label', 'result'=>$S0)
    ops.'push_pirop'('set_addr', '$I10', alabel)
    self.'!cursorop'(ops, '!mark_push', 0, 0, pos, '$I10')
    ops.'push'(apost)
    ops.'push_pirop'('goto', endlabel)
    goto iter_loop
  iter_done:
    ops.'push'(apost)
    ops.'push'(endlabel)
  done:
    .return (ops)
.end


=item alt_longest(PAST::Regex node)

Same as 'alt' above, but use declarative/LTM semantics.
(Currently we cheat and just use 'alt' above.)

=cut

.sub 'alt_longest' :method
    .param pmc node
    .tailcall self.'alt'(node)
.end


=item anchor(PAST::Regex node)

Match various anchor points, including ^, ^^, $, $$.

=cut

.sub 'anchor' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, tgt, pos, off, eos, fail, ops
    (cur, tgt, pos, off, eos, fail) = self.'!rxregs'('cur tgt pos off eos fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    .local string subtype
    subtype = node.'subtype'()

    ops.'push_pirop'('inline', subtype, 'inline'=>'  # rxanchor %0')

    if subtype == 'null' goto done
    if subtype == 'fail' goto anchor_fail
    if subtype == 'bos' goto anchor_bos
    if subtype == 'eos' goto anchor_eos
    if subtype == 'lwb' goto anchor_lwb
    if subtype == 'rwb' goto anchor_rwb

    .local pmc donelabel
    $S0 = self.'unique'('rxanchor')
    concat $S0, '_done'
    donelabel = self.'post_new'('Label', 'result'=>$S0)

    if subtype == 'bol' goto anchor_bol
    if subtype == 'eol' goto anchor_eol

    self.'panic'('Unrecognized subtype "', subtype, '" in PAST::Regex anchor node')

  anchor_fail:
    ops.'push_pirop'('goto', fail)
    goto done

  anchor_bos:
    ops.'push_pirop'('ne', pos, 0, fail)
    goto done

  anchor_eos:
    ops.'push_pirop'('ne', pos, eos, fail)
    goto done

  anchor_bol:
    ops.'push_pirop'('eq', pos, 0, donelabel)
    ops.'push_pirop'('ge', pos, eos, fail)
    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'('dec', '$I10')
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_NEWLINE, tgt, '$I10')
    ops.'push_pirop'('unless', '$I11', fail)
    ops.'push'(donelabel)
    goto done

  anchor_eol:
    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_NEWLINE, tgt, '$I10')
    ops.'push_pirop'('if', '$I11', donelabel)
    ops.'push_pirop'('ne', pos, eos, fail)
    ops.'push_pirop'('eq', pos, 0, donelabel)
    ops.'push_pirop'('dec', '$I10')
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_NEWLINE, tgt, '$I10')
    ops.'push_pirop'('if', '$I11', fail)
    ops.'push'(donelabel)
    goto done

  anchor_lwb:
    ops.'push_pirop'('ge', pos, eos, fail)
    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_WORD, tgt, '$I10')
    ops.'push_pirop'('unless', '$I11', fail)
    ops.'push_pirop'('dec', '$I10')
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_WORD, tgt, '$I10')
    ops.'push_pirop'('if', '$I11', fail)
    goto done

  anchor_rwb:
    ops.'push_pirop'('le', pos, 0, fail)
    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_WORD, tgt, '$I10')
    ops.'push_pirop'('if', '$I11', fail)
    ops.'push_pirop'('dec', '$I10')
    ops.'push_pirop'('is_cclass', '$I11', .CCLASS_WORD, tgt, '$I10')
    ops.'push_pirop'('unless', '$I11', fail)
    goto done

  done:
    .return (ops)
.end


=item charclass(PAST::Regex node)

Match something in a character class, such as \w, \d, \s, dot, etc.

=cut

.sub 'charclass' :method
    .param pmc node

    .local string subtype
    .local int cclass, negate
    (subtype, cclass, negate) = self.'!charclass_init'(node)

    .local pmc cur, tgt, pos, off, eos, fail, ops
    (cur, tgt, pos, off, eos, fail) = self.'!rxregs'('cur tgt pos off eos fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    ops.'push_pirop'('inline', subtype, 'inline'=>'  # rx charclass %0')
    ops.'push_pirop'('ge', pos, eos, fail)
    if cclass == .CCLASS_ANY goto charclass_done

    .local pmc cctest
    cctest = self.'??!!'(negate, 'if', 'unless')

    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'('is_cclass', '$I11', cclass, tgt, '$I10')
    ops.'push_pirop'(cctest, '$I11', fail)
    unless subtype == 'nl' goto charclass_done
    # handle logical newline here
    ops.'push_pirop'('substr', '$S10', tgt, '$I10', 2)
    ops.'push_pirop'('iseq', '$I11', '$S10', '"\r\n"')
    ops.'push_pirop'('add', pos, '$I11')

  charclass_done:
    ops.'push_pirop'('inc', pos)

    .return (ops)
.end


=item !charclass_init(PAST::Regex node)

Return the subtype, cclass value, and negation for a
charclass C<node>.

=cut

.sub '!charclass_init' :method
    .param pmc node

    .local string subtype
    .local int negate
    subtype = node.'subtype'()
    $S0 = downcase subtype
    negate = isne subtype, $S0

    $I0 = node.'negate'()
    negate = xor negate, $I0

    if $S0 == '.' goto cclass_dot
    if $S0 == 'd' goto cclass_digit
    if $S0 == 's' goto cclass_space
    if $S0 == 'w' goto cclass_word
    if $S0 == 'n' goto cclass_newline
    if $S0 == 'nl' goto cclass_newline
    self.'panic'('Unrecognized subtype "', subtype, '" in PAST::Regex charclass node')
  cclass_dot:
    .local int cclass
    cclass = .CCLASS_ANY
    goto cclass_done
  cclass_digit:
    cclass = .CCLASS_NUMERIC
    goto cclass_done
  cclass_space:
    cclass = .CCLASS_WHITESPACE
    goto cclass_done
  cclass_word:
    cclass = .CCLASS_WORD
    goto cclass_done
  cclass_newline:
    cclass = .CCLASS_NEWLINE
  cclass_done:
    .return (subtype, cclass, negate)
.end


=item charclass_q(PAST::Regex node)

Optimize certain quantified character class shortcuts, if it
makes sense to do so.  If not, return a null PMC and the
standard quantifier code will handle it.

=cut

.sub 'charclass_q' :method :multi(_, ['PAST';'Regex'])
    .param pmc node
    .param string backtrack
    .param int min
    .param int max

    if backtrack != 'r' goto pessimistic

    .local string subtype
    .local int cclass, negate
    (subtype, cclass, negate) = self.'!charclass_init'(node)

    # positive logical newline matching is special, don't try to optimize it
    if negate goto nl_done
    if subtype == 'nl' goto pessimistic
  nl_done:

    .local pmc findop
    findop = self.'??!!'(negate, 'find_cclass', 'find_not_cclass')

  quant_r:
    .local pmc cur, tgt, pos, off, eos, fail, ops
    (cur, tgt, pos, off, eos, fail) = self.'!rxregs'('cur tgt pos off eos fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    ops.'push_pirop'('inline', subtype, backtrack, min, max, 'inline'=>'  # rx charclass_q %0 %1 %2..%3')
    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'(findop, '$I11', cclass, tgt, '$I10', eos)
    unless min > 0 goto min_done
    ops.'push_pirop'('add', '$I12', '$I10', min)
    ops.'push_pirop'('lt', '$I11', '$I12', fail)
  min_done:
    unless max > 0 goto max_done
    .local pmc maxlabel
    maxlabel = self.'post_new'('Label', 'name'=>'rx_charclass_')
    ops.'push_pirop'('add', '$I12', '$I10', max)
    ops.'push_pirop'('le', '$I11', '$I12', maxlabel)
    ops.'push_pirop'('set', '$I11', '$I12')
    ops.'push'(maxlabel)
  max_done:
    ops.'push_pirop'('add', pos, off, '$I11')
    .return (ops)

  pessimistic:
    null ops
    .return (ops)
.end


=item concat(PAST::Regex node)

Handle a concatenation of regexes.

=cut

.sub 'concat' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, ops, iter
    (cur) = self.'!rxregs'('cur')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)
    iter = node.'iterator'()

  iter_loop:
    unless iter goto iter_done
    .local pmc cpast, cpost
    cpast = shift iter
    cpost = self.'post_regex'(cpast, cur)
    ops.'push'(cpost)
    goto iter_loop
  iter_done:

    .return (ops)
.end


=item cut(PAST::Regex node)

Generate POST for the cut-group and cut-rule operators.

=cut

.sub 'cut' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, fail, ops
    (cur, fail) = self.'!rxregs'('cur fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)
    ops.'push_pirop'('set_addr', '$I10', fail)
    self.'!cursorop'(ops, '!mark_commit', 0, '$I10')
    .return (ops)
.end


=item enumcharlist(PAST::Regex node)

Generate POST for matching a character from an enumerated
character list.

=cut

.sub 'enumcharlist' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, tgt, pos, off, eos, fail, ops
    (cur, tgt, pos, off, eos, fail) = self.'!rxregs'('cur tgt pos off eos fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    .local string charlist
    charlist = node[0]
    charlist = self.'escape'(charlist)
    .local pmc  negate, testop
    negate = node.'negate'()
    testop = self.'??!!'(negate, 'ge', 'lt')
    .local string subtype
    .local int zerowidth
    subtype = node.'subtype'()
    zerowidth = iseq subtype, 'zerowidth'

    ops.'push_pirop'('inline', negate, subtype, 'inline'=>'  # rx enumcharlist negate=%0 %1')

    ops.'push_pirop'('ge', pos, eos, fail)
    ops.'push_pirop'('sub', '$I10', pos, off)
    ops.'push_pirop'('substr', '$S10', tgt, '$I10', 1)
    ops.'push_pirop'('index', '$I11', charlist, '$S10')
    ops.'push_pirop'(testop, '$I11', 0, fail)
    if zerowidth goto skip_zero_2
    ops.'push_pirop'('inc', pos)
  skip_zero_2:
    .return (ops)
.end


=item literal(PAST::Regex node)

Generate POST for matching a literal string provided as the
second child of this node.

=cut

.sub 'literal' :method :multi(_,['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos, eos, tgt, fail, off
    (cur, pos, eos, tgt, fail, off) = self.'!rxregs'('cur pos eos tgt fail off')
    .local pmc ops, lpast, lpost
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    .local string subtype
    .local int ignorecase
    subtype = node.'subtype'()
    ignorecase = iseq subtype, 'ignorecase'

    # literal to be matched is our first child
    .local int litconst
    lpast = node[0]
    litconst = isa lpast, ['String']
    if litconst goto lpast_string
    litconst = isa lpast, ['PAST';'Val']
    if litconst goto lpast_val
  lpast_expr:
    lpost = self.'as_post'(lpast, 'rtype'=>'~')
    unless ignorecase goto lpast_done
    $S0 = lpost.'result'()
    lpost.'push_pirop'('downcase', $S0, $S0)
    goto lpast_done
  lpast_val:
    $S0 = lpast.'value'()
    lpast = box $S0
  lpast_string:
    unless ignorecase goto lpast_const
    $S0 = lpast
    $S0 = downcase $S0
    lpast = box $S0
  lpast_const:
    unless lpast > '' goto done
    lpost = self.'as_post'(lpast, 'rtype'=>'~')
  lpast_done:

    $S0 = lpost.'result'()
    ops.'push_pirop'('inline', subtype, $S0, 'inline'=>'  # rx literal %0 %1')
    ops.'push'(lpost)

    .local int litlen
    if litconst goto litlen_const
    litlen = '$I10'
    ops.'push_pirop'('length', '$I10', lpost)
    goto have_litlen
  litlen_const:
    $S0 = lpast
    $I0 = length $S0
    litlen = $I0
  have_litlen:

    # fail if there aren't enough characters left in string
    ops.'push_pirop'('add', '$I11', pos, litlen)
    ops.'push_pirop'('gt', '$I11', eos, fail)

    # compute string to be matched and fail if mismatch
    ops.'push_pirop'('sub', '$I11', pos, off)
    ops.'push_pirop'('substr', '$S10', tgt, '$I11', litlen)
    unless ignorecase goto literal_test
    ops.'push_pirop'('downcase', '$S10', '$S10')
  literal_test:
    ops.'push_pirop'('ne', '$S10', lpost, fail)

    # increase position by literal length and move on
    ops.'push_pirop'('add', pos, litlen)
  done:
    .return (ops)
.end


=item 'pastnode'(PAST::Regex node)

Evaluates the supplied PAST node and does various things with the result, based on subtype.

Subtype can be any of:

=over 4

=item zerowidth

Only test for truthiness and fail or not.  No interpolation.

=item interp_regex

String values should be compiled into regexes and then interpolated.

=item interp_literal

String values should be treated as literals.

=item interp_literal_i

String values should be treated as literals and matched case-insensitively.

=item <nothing>

Don't interpolate anything, just execute the PAST code

=back

=cut

.sub 'pastnode' :method :multi(_, ['PAST'; 'Regex'])
    .param pmc node
    .local pmc cur, pos, fail, ops, eos, off, tgt
    (cur, pos, eos, off, tgt, fail) = self.'!rxregs'('cur pos eos off tgt fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)
 
    .local pmc zerowidth, negate, testop, subtype
    subtype = node.'subtype'()

    ops.'push_pirop'('inline', subtype, negate, 'inline'=>'  # rx pastnode subtype=%1 negate=%2')
    .local pmc cpast, cpost
    cpast = node[0]
    cpost = self.'as_post'(cpast, 'rtype'=>'P')
 
    self.'!cursorop'(ops, '!cursor_pos', 0, pos)
    ops.'push'(cpost)

    # If this is just a zerowidth assertion, we don't actually interpolate anything.  Just evaluate
    # and fail or not. 
    if subtype == 'zerowidth' goto zerowidth_test

    # Retain backwards compatibility with old pastnode semantics
    unless subtype goto done

    .local string prefix
    prefix = self.'unique'('pastnode_')
    .local pmc precompiled_label, done_label, loop_label, iterator_reg, label_reg
    $S0 =  concat prefix, '_precompiled'
    precompiled_label = self.'post_new'('Label', 'result'=>$S0)
    $S0 =  concat prefix, '_done'
    done_label = self.'post_new'('Label', 'result'=>$S0)
    $S0 =  concat prefix, '_loop'
    loop_label = self.'post_new'('Label', 'result'=>$S0)
    iterator_reg = self.'uniquereg'("P")
    label_reg = self.'uniquereg'("I")

    $S10 = subtype
    $S10 = concat '"', $S10
    $S10 = concat $S10, '"'
    self.'!cursorop'(ops, '!process_pastnode_results_for_interpolation', 1, '$P10', cpost, $S10)

    ops.'push_pirop'('iter', iterator_reg, '$P10')
    ops.'push_pirop'('set_addr', label_reg, loop_label)
    ops.'push'(loop_label)
    ops.'push_pirop'('unless', iterator_reg, fail)
    ops.'push_pirop'('shift', '$P10', iterator_reg)
    self.'!cursorop'(ops, '!mark_push', 0, 0, pos, label_reg)

    # Check if it's already a compiled Regex, and call it as a method if so
    ops.'push_pirop'('isa', '$I10', '$P10', "['Sub']")
    ops.'push_pirop'('if', '$I10', precompiled_label)

    # XXX This is rakudo's Regex class.  I'm not sure why the above test doesn't catch it, but
    # need to figure it out so NQP doesn't have rakudo knowledge :(
    ops.'push_pirop'('isa', '$I10', '$P10', "['Regex']")
    ops.'push_pirop'('if', '$I10', precompiled_label)

    # Otherwise, treat it as a literal
    ops.'push_pirop'('set', '$S10', '$P10')
    ops.'push_pirop'('length', '$I10', '$S10')
    ops.'push_pirop'('add', '$I11', pos, '$I10')
    ops.'push_pirop'('gt', '$I11', eos, fail)
    ops.'push_pirop'('sub', '$I11', pos, off)
    ops.'push_pirop'('substr', '$S11', tgt, '$I11', '$I10')
    ne subtype, 'interp_literal_i', dont_downcase
    ops.'push_pirop'('downcase', '$S10', '$S10')
    ops.'push_pirop'('downcase', '$S11', '$S11')
  dont_downcase:
    ops.'push_pirop'('ne', '$S11', '$S10', fail)
    ops.'push_pirop'('add', pos, '$I10')
    ops.'push_pirop'('goto', done_label)

    ops.'push'(precompiled_label)
    ops.'push_pirop'('callmethod', '$P10', cur, 'result'=>'$P10')
    ops.'push_pirop'('unless', '$P10', fail)
    self.'!cursorop'(ops, '!mark_push', 0, 0, CURSOR_FAIL, 0, '$P10')
    ops.'push_pirop'('callmethod', '"pos"', '$P10', 'result'=>pos)
    
    ops.'push'(done_label)

    goto done

  zerowidth_test:
    negate = node.'negate'()
    testop = self.'??!!'(negate, 'if', 'unless')
    ops.'push_pirop'(testop, cpost, fail)
  done:
    .return (ops)

.end

=item pass(PAST::Regex node)

=cut

.sub 'pass' :method :multi(_,['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos, ops
    (cur, pos) = self.'!rxregs'('cur pos')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    .local string regexname
    $P0 = find_dynamic_lex '$*REGEXNAME'
    regexname = self.'escape'($P0)

    ops.'push_pirop'('inline', 'inline'=>'  # rx pass')
    self.'!cursorop'(ops, '!cursor_pass', 0, pos, regexname)
    self.'!cursorop'(ops, '!cursor_debug', 0, '"PASS  "', regexname, '" at pos="', pos)
    ops.'push_pirop'('return', cur)
    .return (ops)
.end


=item reduce

=cut

.sub 'reduce' :method :multi(_,['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos, ops
    (cur, pos) = self.'!rxregs'('cur pos')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    .local pmc cpost, posargs, namedargs
    (cpost, posargs, namedargs) = self.'post_children'(node, 'signature'=>'v:')

    .local string regexname, key
    $P0 = find_dynamic_lex '$*REGEXNAME'
    regexname = self.'escape'($P0)
    key = posargs[0]

    ops.'push_pirop'('inline', regexname, key, 'inline'=>'  # rx reduce name=%0 key=%1')
    ops.'push'(cpost)
    self.'!cursorop'(ops, '!cursor_pos', 0, pos)
    self.'!cursorop'(ops, '!reduce', 0, regexname, posargs :flat, namedargs :flat)
    .return (ops)
.end


=item quant(PAST::Regex node)

=cut

.sub 'quant' :method :multi(_,['PAST';'Regex'])
    .param pmc node

    .local string backtrack
    backtrack = node.'backtrack'()
    if backtrack goto have_backtrack
    backtrack = 'g'
  have_backtrack:

     .local int min, max
     min = node.'min'()
     $P0 = node.'max'()
     max = $P0
     $I0 = defined $P0
     if $I0 goto have_max
     max = -1                          # -1 represents Inf
   have_max:

   optimize:
     $I0 = node.'list'()
     if $I0 != 1 goto optimize_done
     .local pmc cpast
     cpast = node[0]
     $S0 = cpast.'pasttype'()
     $S0 = concat $S0, '_q'
     $I0 = can self, $S0
     unless $I0 goto optimize_done
     $P0 = self.$S0(cpast, backtrack, min, max)
     if null $P0 goto optimize_done
     .return ($P0)
  optimize_done:

    .local pmc cur, pos, rep, fail
    (cur, pos, rep, fail) = self.'!rxregs'('cur pos rep fail')

    .local string qname
    .local pmc ops, q1label, q2label, btreg, cpost
    $S0 = concat 'rxquant', backtrack
    qname = self.'unique'($S0)
    ops = self.'post_new'('Ops', 'node'=>node)
    $S0 = concat qname, '_loop'
    q1label = self.'post_new'('Label', 'result'=>$S0)
    $S0 = concat qname, '_done'
    q2label = self.'post_new'('Label', 'result'=>$S0)
    cpost = self.'concat'(node)

    .local pmc seppast, seppost
    null seppost
    seppast = node.'sep'()
    unless seppast goto have_seppost
    seppost = self.'post_regex'(seppast)
  have_seppost:

    $S0 = max
    .local int needrep
    $I0 = isgt min, 1
    $I1 = isgt max, 1
    needrep = or $I0, $I1

    unless max < 0 goto have_s0
    $S0 = '*'
  have_s0:
    ops.'push_pirop'('inline', qname, min, $S0, 'inline'=>'  # rx %0 ** %1..%2')

  if backtrack == 'f' goto frugal

  greedy:
    btreg = self.'uniquereg'('I')
    ops.'push_pirop'('set_addr', btreg, q2label)
    .local int needmark
    .local string peekcut
    needmark = needrep
    peekcut = '!mark_peek'
    if backtrack != 'r' goto greedy_1
    needmark = 1
    peekcut = '!mark_commit'
  greedy_1:
    if min == 0 goto greedy_2
    unless needmark goto greedy_loop
    self.'!cursorop'(ops, '!mark_push', 0, 0, CURSOR_FAIL, btreg)
    goto greedy_loop
  greedy_2:
    self.'!cursorop'(ops, '!mark_push', 0, 0, pos, btreg)
  greedy_loop:
    ops.'push'(q1label)
    ops.'push'(cpost)
    unless needmark goto greedy_3
    self.'!cursorop'(ops, peekcut, 1, rep, btreg)
    unless needrep goto greedy_3
    ops.'push_pirop'('inc', rep)
  greedy_3:
    unless max > 1 goto greedy_4
    ops.'push_pirop'('ge', rep, max, q2label)
  greedy_4:
    unless max != 1 goto greedy_5
    self.'!cursorop'(ops, '!mark_push', 0, rep, pos, btreg)
    if null seppost goto greedy_4a
    ops.'push'(seppost)
  greedy_4a:
    ops.'push_pirop'('goto', q1label)
  greedy_5:
    ops.'push'(q2label)
    unless min > 1 goto greedy_6
    ops.'push_pirop'('lt', rep, min, fail)
  greedy_6:
    .return (ops)

  frugal:
    .local pmc ireg
    ireg = self.'uniquereg'('I')
    if min == 0 goto frugal_1
    unless needrep goto frugal_0
    ops.'push_pirop'('set', rep, 0)
  frugal_0:
    if null seppost goto frugal_2
    .local pmc seplabel
    $S0 = concat qname, '_sep'
    seplabel = self.'post_new'('Label', 'result'=>$S0)
    ops.'push_pirop'('goto', seplabel)
    goto frugal_2
  frugal_1:
    ops.'push_pirop'('set_addr', '$I10', q1label)
    self.'!cursorop'(ops, '!mark_push', 0, 0, pos, '$I10')
    ops.'push_pirop'('goto', q2label)
  frugal_2:
    ops.'push'(q1label)
    if null seppost goto frugal_2a
    ops.'push'(seppost)
    ops.'push'(seplabel)
  frugal_2a:
    unless needrep goto frugal_3
    ops.'push_pirop'('set', ireg, rep)
  frugal_3:
    ops.'push'(cpost)
    unless needrep goto frugal_4
    ops.'push_pirop'('add', rep, ireg, 1)
  frugal_4:
    unless min > 1 goto frugal_5
    ops.'push_pirop'('lt', rep, min, q1label)
  frugal_5:
    unless max > 1 goto frugal_6
    ops.'push_pirop'('ge', rep, max, q2label)
  frugal_6:
    unless max != 1 goto frugal_7
    ops.'push_pirop'('set_addr', '$I10', q1label)
    self.'!cursorop'(ops, '!mark_push', 0, ireg, pos, '$I10')
  frugal_7:
    ops.'push'(q2label)
    .return (ops)
.end


=item scan(POST::Regex)

Code for initial regex scan.

=cut

.sub 'scan' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos, eos, ops
    (cur, pos, eos) = self.'!rxregs'('cur pos eos')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)
    .local pmc looplabel, scanlabel, donelabel
    $S0 = self.'unique'('rxscan')
    $S1 = concat $S0, '_loop'
    looplabel = self.'post_new'('Label', 'result'=>$S1)
    $S1 = concat $S0, '_scan'
    scanlabel = self.'post_new'('Label', 'result'=>$S1)
    $S1 = concat $S0, '_done'
    donelabel = self.'post_new'('Label', 'result'=>$S1)

    ops.'push_pirop'('callmethod', "'from'", 'self', 'result'=>'$I10')
    ops.'push_pirop'('ne', '$I10', CURSOR_FAIL, donelabel)
    ops.'push_pirop'('goto', scanlabel)
    ops.'push'(looplabel)
    self.'!cursorop'(ops, 'from', 1, '$P10')
    ops.'push_pirop'('inc', '$P10')
    ops.'push_pirop'('set', pos, '$P10')
    ops.'push_pirop'('ge', pos, eos, donelabel)
    ops.'push'(scanlabel)
    ops.'push_pirop'('set_addr', '$I10', looplabel)
    self.'!cursorop'(ops, '!mark_push', 0, 0, pos, '$I10')
    ops.'push'(donelabel)
    .return (ops)
.end


=item subcapture(PAST::Regex node)

Perform a subcapture (capture of a portion of a regex).

=cut

.sub 'subcapture' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos, tgt, fail
    (cur, pos, tgt, fail) = self.'!rxregs'('cur pos tgt fail')
    .local pmc ops, cpast, cpost
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)
    cpast = node[0]
    cpost = self.'post_regex'(cpast)

    .local pmc name
    $P0 = node.'name'()
    name = self.'as_post'($P0, 'rtype'=>'*')

    .local string rxname
    rxname = self.'unique'('rxcap_')

    .local pmc caplabel, donelabel
    $S0 = concat rxname, '_fail'
    caplabel = self.'post_new'('Label', 'result'=>$S0)
    $S0 = concat rxname, '_done'
    donelabel = self.'post_new'('Label', 'result'=>$S0)

    ops.'push_pirop'('inline', name, 'inline'=>'  # rx subcapture %0')
    ops.'push_pirop'('set_addr', '$I10', caplabel)
    self.'!cursorop'(ops, '!mark_push', 0, 0, pos, '$I10')
    ops.'push'(cpost)
    ops.'push_pirop'('set_addr', '$I10', caplabel)
    self.'!cursorop'(ops, '!mark_peek', 2, '$I12', '$I11', '$I10')
    self.'!cursorop'(ops, '!cursor_pos', 0, '$I11')
    self.'!cursorop'(ops, '!cursor_start', 1, '$P10')
    ops.'push_pirop'('callmethod', '"!cursor_pass"', '$P10', pos, '""')
    ops.'push'(name)
    self.'!cursorop'(ops, '!mark_push', 0, 0, CURSOR_FAIL, 0, '$P10')
    ops.'push_pirop'('callmethod', '"!cursor_names"', '$P10', name)
    ops.'push_pirop'('goto', donelabel)
    ops.'push'(caplabel)
    ops.'push_pirop'('goto', fail)
    ops.'push'(donelabel)
    .return (ops)
.end


=item subrule(PAST::Regex node)

Perform a subrule call.

=cut

.sub 'subrule' :method :multi(_, ['PAST';'Regex'])
    .param pmc node

    .local pmc cur, pos, fail, ops
    (cur, pos, fail) = self.'!rxregs'('cur pos fail')
    ops = self.'post_new'('Ops', 'node'=>node, 'result'=>cur)

    .local pmc name
    $P0 = node.'name'()
    name = self.'as_post'($P0, 'rtype'=>'*')

    .local pmc cpost, posargs, namedargs, subpost
    (cpost, posargs, namedargs) = self.'post_children'(node, 'signature'=>'v:')
    subpost = shift posargs

    .local pmc negate
    .local string testop
    negate = node.'negate'()
    testop = self.'??!!'(negate, 'if', 'unless')

    .local pmc subtype
    subtype = node.'subtype'()

    ops.'push_pirop'('inline', subpost, subtype, negate, 'inline'=>"  # rx subrule %0 subtype=%1 negate=%2")

    self.'!cursorop'(ops, '!cursor_pos', 0, pos)
    ops.'push'(cpost)
    ops.'push_pirop'('callmethod', subpost, cur, posargs :flat, namedargs :flat, 'result'=>'$P10')
    ops.'push_pirop'(testop, '$P10', fail)
    if subtype == 'zerowidth' goto done
    if subtype == 'method' goto subrule_pos
    self.'!cursorop'(ops, '!mark_push', 0, 0, CURSOR_FAIL, 0, '$P10')
    ops.'push'(name)
    ops.'push_pirop'('callmethod', '"!cursor_names"', '$P10', name)
  subrule_pos:
    ops.'push_pirop'('callmethod', '"pos"', '$P10', 'result'=>pos)
  done:
    .return (ops)
.end


=item post_new(type, args :slurpy, options :slurpy :named)

Helper method to create a new POST node of C<type>.

=cut

.sub 'post_new' :method
    .param string type
    .param pmc args            :slurpy
    .param pmc options         :slurpy :named

    $P0 = get_hll_global ['POST'], type
    .tailcall $P0.'new'(args :flat, options :flat :named)
.end

=item ??!!(test, trueval, falseval)

Helper method to perform ternary operation -- returns C<trueval>
if C<test> is true, C<falseval> otherwise.

=cut

.sub '??!!' :method
    .param pmc test
    .param pmc trueval
    .param pmc falseval

    if test goto true
    .return (falseval)
  true:
    .return (trueval)
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
