# $Id$

.namespace ['lolcode';'Grammar']

.sub 'yarn_literal' :method
    .param pmc adverbs         :slurpy :named

    .local string delim
    delim = '"'

    ##  create a new match object, get the new match position
    .local pmc mob
    .local int pos, lastpos, delimlen
    .local string target
    (mob, pos, target) = self.'new'(self)
    lastpos = length target

    ##  leave space for close delimiter
    delimlen = length delim
    lastpos -= delimlen

    ##  now initialize and loop through target
  literal_init:
    .local string literal, litchar, escaped
    literal = ''
    litchar = substr target, pos, 1
    inc pos
    if litchar == delim goto literal_loop
    self.'panic'('Missing open delimiter for YARN literal.')

  literal_loop:
    ##  if we're beyond the last possible position, fail
    if pos > lastpos goto fail

    ##  get next character in literal
    litchar = substr target, pos, 1
    inc pos
    if litchar == delim goto literal_end

    ##  add non-escape characters to literal
    if litchar != ':' goto add_litchar

    ##  interpolate escaped
    escaped = substr target, pos, 1
    $I0 = index ':)>o"(', escaped
    if $I0 < 0 goto add_litchar
    inc pos
    if $I0 == 5 goto scan_hexchar

    litchar = substr ":\n\t\a\"", $I0, 1
    goto add_litchar

  scan_hexchar:
    .local int decnum
    decnum = 0

  scan_hexchar_loop:
    if pos > lastpos goto fail
    $S0 = substr target, pos, 1
    inc pos
    if $S0 == ')' goto add_hexchar
    $I0 = index '0123456789abcdefABCDEF', $S0
    if $I0 < 0 goto fail_hexchar
    if $I0 < 16 goto shift_hexchar
    $I0 -= 6
  shift_hexchar:
    decnum *= 16
    decnum += $I0
    goto scan_hexchar_loop

  fail_hexchar:
    self.'panic'('Invalid character in hex escape.')

  add_hexchar:
    litchar = chr decnum
    goto add_litchar

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
# vim: expandtab shiftwidth=4 ft=pir:
