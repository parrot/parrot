# Copyright (C) 2008, The Perl Foundation.
# $Id$

=for comment

PHP 5.3 has four kinds of literal strings.

=over 4

=item single quoted

Neither variable nor backslash interpolation, besides B<\'> and B<\\> is done within single quotes.
Single quotes need to be escaped with a backslash in order to be not taken for the delimiter.
A backslash escapes a following backslash.
A literal backslash needs to be escaped at end of string, as otherwise the delimiting single quote
would be recognised as a literal single quote.
In contrast to Perl 5, backslashes that preceede any other character are literal.

=item double quoted

The escape sequences
\n, \r, \t, \v, \f, \\, \$, \"
are recognised.

Charactes can alse be written in octal notation, \[0-7]{1,3},
and hexadecimal notation, \x[0-9A-Fa-f]{1,2}.
The octal notation allows to specify values greater 256. In theses
cases the value is taken as mod 256.

=item heredoc

   $param = 'dummy';
   $example = <<<EXAMPLE
   Variables are interpolated.
   $param
   EXAMPLE

Double quotes are literal.
The backslashes before a double quote are literal.
Unlike in Perl 5, the newline before the delimiter is not part of the string.

=item nowdoc

A heredoc with single quotes.

   $param = 'dummy';
   $example = <<<'EXAMPLE'
   Variables are not interpolated.
   $param
   EXAMPLE

Single quotes are literal.
Backslashes are literal.
Unlike in Perl 5, the newline before the delimiter is not part of the string.

=cut

.namespace ['Pipp';'Grammar']

## called from code in grammar.pg
.sub 'quote_expression' :method
    .param string flags
    .param pmc    options    :slurpy :named

    ##  create a new match object
    .local pmc mob
    .local int pos
    .local string target
    (mob, pos, target) = self.'new'(self)

    ##  get action object
    .local pmc action
    action = options['action']

    ##  set up options based on flags
    .local pmc flagarray, iter
    flagarray = split ' ', flags
    iter = new 'Iterator', flagarray
  iter_loop:
    unless iter goto iter_end
    .local string oname
    oname = shift iter
    oname = substr oname, 1   # remove the leading colon
    options[oname] = 1
    if oname == 'qq' goto opt_qq
    goto iter_loop
  opt_qq:
    options['s'] = 1        # interpolate variables
    options['c'] = 1        # interpolate stuff in '{ }', when there is a $ right after the '{'
    options['b'] = 1        # Interpolate \n, \t, etc. 'b' stands for backslash
    options['q'] = 1        # Interpolate \\, \q and \' (or whatever)
    goto iter_loop
  iter_end:

    ## there is no heredoc-support yet, so the delimiter are either single or double quotes
    .local string start, stop
    start = substr target, pos, 1
    stop  = start
    options['stop'] = stop
    pos = pos + 1

    ##  determine lastpos
    .local int lastpos
    lastpos = length target
    lastpos -= 1

    .local string key
    ##  handle word parsing
  word_start:
    ##  set up escapes based on flags
    .local string escapes
    escapes = ''
    $I0 = options['s']
    unless $I0 goto escape_s_done
    escapes = '$'
  escape_s_done:
    $I0 = options['c']
    unless $I0 goto escape_c_done
    escapes .= '{'
  escape_c_done:
  have_escapes:
    options['escapes'] = escapes

    .local pmc quote_concat
    quote_concat = new 'ResizablePMCArray'

    goto word_plain
  word_loop:
    $S0 = substr target, pos, 1
    if $S0 == stop goto word_succeed
    if pos >= lastpos goto fail
    goto word_plain

  word_plain:
    mob.'to'(pos)
    $P0 = mob.'quote_concat'(options)
    unless $P0 goto fail
    push quote_concat, $P0
    pos = $P0.'to'()
    goto word_loop
  word_succeed:
    key = 'quote_concat'
    mob[key] = quote_concat

  succeed:
    pos += 1
    mob.'to'(pos)
    if null action goto succeed_done
    $I0 = can action, 'quote_expression'
    unless $I0 goto succeed_done
    action.'quote_expression'(mob, key)
  succeed_done:
    .return (mob)
  fail:
    mob.'to'(-1)
    .return (mob)
.end


.sub 'quote_concat' :method
    .param pmc options

    ##  create a new match object
    .local pmc mob
    .local int pos
    .local string target
    (mob, pos, target) = self.'new'(self)

    ##  determine pos, lastpos
    .local string stop
    .local int lastpos
    stop = options['stop']
    lastpos = length target
    lastpos -= 1

    .local string escapes
    escapes = options['escapes']

    .local pmc quote_term
    quote_term = new 'ResizablePMCArray'

  term_loop:
    mob.'to'(pos)
    $P0 = mob.'quote_term'(options)
    unless $P0 goto fail
    push quote_term, $P0
    pos = $P0.'to'()
    if pos > lastpos goto fail
    $S0 = substr target, pos, 1
    if $S0 == stop goto succeed
    goto term_loop
  succeed:
    ##  save the array of captured terms
    mob['quote_term'] = quote_term
    mob.'to'(pos)
    ##  call any related {*} actions
    .local pmc action
    action = options['action']
    if null action goto succeed_done
    $I0 = can action, 'quote_concat'
    unless $I0 goto succeed_done
    action.'quote_concat'(mob)
  succeed_done:
    .return (mob)
  fail:
    mob.'to'(-1)
    .return (mob)
.end


.sub 'quote_term' :method
    .param pmc options

    .local pmc action
    action = options['action']

    .local pmc mob
    .local int pos
    .local string target
    (mob, pos, target) = self.'new'(self)

    .local int dollar_is_literal
    dollar_is_literal = 0

    .local string leadchar, escapes
    escapes = options['escapes']
    leadchar = substr target, pos, 1
    $I0 = index escapes, leadchar
    if $I0 < 0 goto term_literal
    if leadchar == '$' goto term_scalar
    if leadchar == '{' goto term_closure
  term_literal:
    mob.'to'(pos)
    $P0 = mob.'quote_literal'(options, dollar_is_literal)
    unless $P0 goto fail
    pos = $P0.'to'()
    mob['quote_literal'] = $P0
    .local string key
    key = 'literal'
    goto succeed

  term_scalar:
    mob.'to'(pos)
    $P0 = mob.'var'('action'=>action)
    unless $P0 goto var_did_not_match
    pos = $P0.'to'()
    key = 'var'
    mob[key] = $P0
    goto succeed
  var_did_not_match:
    dollar_is_literal = 1
    goto term_literal

  term_closure:
    mob.'to'(pos)
    $P0 = mob.'curly_interpolation'('action'=>action)
    unless $P0 goto term_literal
    pos = $P0.'to'()
    key = 'curly_interpolation'
    mob[key] = $P0
    goto succeed

  succeed:
    mob.'to'(pos)
    if null action goto succeed_done
    $I0 = can action, 'quote_term'
    unless $I0 goto succeed_done
    action.'quote_term'(mob, key)
  succeed_done:
    .return (mob)

  fail:
    mob.'to'(-1)
    .return (mob)
.end


.sub 'quote_literal' :method
    .param pmc options
    .param int dollar_is_literal

    .local pmc mob
    .local int pos
    .local string target
    (mob, pos, target) = self.'new'(self)

    .local string stop, stop1
    .local int lastpos
    stop = options['stop']
    stop1 = substr stop, 0, 1
    lastpos = length target
    lastpos -= 1

    .local string escapes
    .local int optq, optb
    escapes = options['escapes']
    optq = options['q']
    optb = options['b']

    .local string literal
    literal = ''
  scan_loop:
    if pos > lastpos goto fail
    $S0 = substr target, pos, 1
    if $S0 == stop goto succeed
    goto scan_loop_1
  scan_loop_1:
    if pos >= lastpos goto fail

  scan_char:
    .local string litchar
    litchar = substr target, pos, 1
    ##  if we've reached an escape char, we're done
    if litchar == '{' goto add_litchar
    unless dollar_is_literal goto dollar_is_not_a_literal
        if litchar == '$' goto add_litchar
    dollar_is_not_a_literal:
    $I0 = index escapes, litchar
    if $I0 >= 0 goto succeed
    ##  if this isn't an interpolation, add the char
    unless optq goto add_litchar
    if litchar != "\\" goto add_litchar
    ##  okay, we have a backslash, let's process it
    .local string backchar
    $I0 = pos + 1
    backchar = substr target, $I0, 1
    ##  handle :q options, \\ and \+stop
    if backchar == "\\" goto add_backchar
    if backchar == stop1 goto add_backchar
    unless optb goto add_litchar
    ##  handle :b options
    $I0 = index "vfnrt\\$\"x0123456789", backchar
    if $I0 < 0 goto add_backslash_and_backchar
    if $I0 >  8 goto scan_octal
    if $I0 == 8 goto scan_hex
    litchar = substr "\v\f\n\r\t\\$\"", $I0, 1
  add_litchar2:
    pos += 2
    literal .= litchar
    goto scan_loop
  add_backslash_and_backchar:
    literal .= '\'
  add_backchar:
    pos += 2
    literal .= backchar
    goto scan_loop
  add_litchar:
    pos += 1
    literal .= litchar
    goto scan_loop


    .local int base, decnum, max_digits, cnt_digit
  scan_octal:
    base = 8
    max_digits = 3
    pos += 1     # octal digits come right after the '\'
    goto got_base
  scan_hex:
    base = 16
    max_digits = 2
    pos += 2     # skip the 'x'
  got_base:
    ##  Handle hex and octal escapes.
    ##  The base is either 8 or 16.
    ##  Then loop through the characters
    ##  that follow to compute the decimal value of codepoints,
    ##  and add the codepoints to our literal.
    decnum = 0
    cnt_digit = 1
    $S0 = substr target, pos, 1
  scan_xo_char_loop:
    if cnt_digit > max_digits goto scan_xo_char_end
    inc cnt_digit
    $S0 = substr target, pos, 1
    $I0 = index '0123456789abcdef0123456789ABCDEF', $S0
    if $I0 < 0 goto scan_xo_char_end
    $I0 %= 16
    if $I0 >= base goto scan_xo_char_end
    decnum *= base
    decnum += $I0
    inc pos
    goto scan_xo_char_loop
  scan_xo_char_end:
    $S1 = chr decnum
    concat literal, $S1
  scan_xo_end:
    goto scan_loop

  succeed:
    mob.'result_object'(literal)
    mob.'to'(pos)
    .return (mob)
  fail_backchar_digit:
    self.'panic'('encountered invalid octal digit')
  fail:
    mob.'to'(-1)
    .return (mob)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
