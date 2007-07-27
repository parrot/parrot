# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    load_bytecode 'PGE/Util.pbc'
    $P0 = subclass 'PGE::Grammar', 'PCT::Grammar'
    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['PCT::Grammar'], 'panic', $P0
    .return ()
.end    

.sub 'quote_literal'
    .param pmc mob
    .param pmc adverbs         :slurpy :named

    ##  create a new match object, get the new match position
    .local int pos, lastpos
    .local string target
    (mob, pos, target) = mob.'new'(mob)
    lastpos = length target

    ##  see if we have a single or double quote
    .local string delim
    delim = substr target, pos, 1
    $I0 = index "'\"", delim
    if $I0 < 0 goto fail
  
    ##  leave space for close delimiter
    dec lastpos
    ##  skip beyond open delimiter
    inc pos

  quote_init:
    .local string literal, litchar
    literal = ''

  quote_loop:
    ##  see if we've reached close delim
    if pos > lastpos goto fail

    ##  get next character in string
    litchar = substr target, pos, 1
    inc pos

    ##  if ending delimiter, then we're done
    if litchar == delim goto quote_end
    if pos > lastpos goto fail

    ##  add non-escape characters to literal
    if litchar != "\\" goto add_litchar

    ##  figure out what we're escaping
    $S0 = substr target, pos, 1
    inc pos
    ##  if the escaped thing isn't meta, add it directly
    $I0 = index "abefnrt0xdo", $S0
    if $I0 < 0 goto add_litchar

    ##  if it's one of "xdo", then handle that specially
    if $I0 >= 8 goto quote_xdo

    litchar = substr "\a\b\e\f\n\r\t\0", $I0, 1
    goto add_litchar

  quote_xdo:
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
  quote_xdo_char_loop:
    $S0 = substr target, pos, 1
    $I0 = index '0123456789abcdef', $S0
    if $I0 < 0 goto quote_xdo_char_end
    if $I0 >= base goto quote_xdo_char_end
    codepoint *= base
    codepoint += $I0
    inc pos
    goto quote_xdo_char_loop
  quote_xdo_char_end:
    $S1 = chr codepoint
    concat literal, $S1
    unless isbracketed goto quote_xdo_end
    if $S0 == ']' goto quote_xdo_end
    if $S0 != ',' goto fail
    inc pos
    codepoint = 0
    goto quote_xdo_char_loop
  quote_xdo_end:
    pos += isbracketed
    goto quote_loop

  add_litchar:
    literal .= litchar
    goto quote_loop

  quote_end:
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
