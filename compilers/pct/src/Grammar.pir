# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    load_bytecode 'PGE/Util.pbc'
    $P0 = subclass 'PGE::Grammar', 'PCT::Grammar'
    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['PCT::Grammar'], 'panic', $P0
    .return ()
.end

.sub 'string_literal'
    .param pmc mob
    .param string stop
    .param pmc adverbs         :slurpy :named

    ##  create a new match object, get the new match position
    .local int pos, lastpos, stoplen
    .local string target, escapechars
    (mob, pos, target) = mob.'new'(mob)
    lastpos = length target
    stoplen = length stop
    $S0 = substr stop, 0, 1
    escapechars = concat "\\", $S0

    ##  leave space for close delimiter
    lastpos -= stoplen

    ##  now initialize and loop through target
  literal_init:
    .local string literal, litchar
    literal = ''

  literal_loop:
    ##  if we're beyond the last possible position, fail
    if pos > lastpos goto fail

    ##  if ending delimiter, then we're done
    $S0 = substr target, pos, stoplen
    if $S0 == stop goto literal_end
    if pos >= lastpos goto fail

    ##  get next character in literal
    litchar = substr target, pos, 1
    inc pos

    ##  add non-escape characters to literal
    if litchar != "\\" goto add_litchar

    ##  look at the next character, if it's always escaped, add it and
    ##  move on
    .local string escaped
    escaped = substr target, pos, 1
    $I0 = index escapechars, escaped
    if $I0 < 0 goto interpolated_escape
    inc pos
    literal .= escaped
    goto literal_loop

  interpolated_escape:
    ##  if not double-quoted delim, no interpolation
    if stop != '"' goto add_litchar
    litchar = escaped
    inc pos
    $I0 = index "abefnrt0xdo", litchar
    if $I0 < 0 goto add_litchar

    ##  if it's one of "xdo", then handle that specially
    if $I0 >= 8 goto literal_xdo

    litchar = substr "\a\b\e\f\n\r\t\0", $I0, 1
    goto add_litchar

  literal_xdo:
    ##  handle \x, \d, and \o escapes.  start by converting 
    ##  the 'o', 'd', or 'x' into 8, 10, or 16 (yes, it's hack 
    ##  but it works).  Then loop through the characters that
    ##  follow to compute the integer value of the codepoint,
    ##  and add that codepoint to our literal.
    .local int base, codepoint, isbracketed
    base = index '        o d     x', $S0
    codepoint = 0
    $S0 = substr target, pos, 1
    isbracketed = iseq $S0, '['
    pos += isbracketed
  literal_xdo_char_loop:
    $S0 = substr target, pos, 1
    $I0 = index '0123456789abcdef', $S0
    if $I0 < 0 goto literal_xdo_char_end
    if $I0 >= base goto literal_xdo_char_end
    codepoint *= base
    codepoint += $I0
    inc pos
    goto literal_xdo_char_loop
  literal_xdo_char_end:
    $S1 = chr codepoint
    concat literal, $S1
    unless isbracketed goto literal_xdo_end
    if $S0 == ']' goto literal_xdo_end
    if $S0 != ',' goto fail
    inc pos
    codepoint = 0
    goto literal_xdo_char_loop
  literal_xdo_end:
    pos += isbracketed
    goto literal_loop

  add_litchar:
    literal .= litchar
    goto literal_loop

  literal_end:
    mob.'to'(pos)
    mob.'result_object'(literal)
    .return (mob)

  fail:
    mob.'to'(-1)
    .return (mob)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
