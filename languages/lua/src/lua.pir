
.namespace [ 'Lua' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('Lua')
    $P0.'parsegrammar'('Lua::Grammar')
    $P0.'astgrammar'('ASTGrammar')
.end


.namespace [ 'Lua::Grammar' ]

.sub 'warning'
    .param pmc self
    .param string message

    if null self goto NO_SELF
    if null message goto NO_MSG

    printerr "Warning: "
    $P0 = get_hll_global ['PGE::Util'], 'warn'
    if null $P0 goto NO_WARN
    self.$P0(message)
    .return()
  NO_WARN:
    printerr "Cannot find method 'warn'\n"
    .return()
  NO_MSG:
    printerr "Warning: 'no message specified for warning()\n"
    .return()
  NO_SELF:
    printerr "No 'self' in warning()\n"

    .return()
.end


.sub 'syntax_error'
    .param pmc self
    .param string message

    $P0 = get_hll_global ['PGE::Util'], 'line_number'
    if null $P0 goto NO_LINE_NR_METHOD
    $I0 = self.$P0()

    # line_number() starts counting at line 0, so increment:
    inc $I0

    printerr "Syntax error (line "
    printerr $I0
    printerr "): "
    printerr message
    printerr "\n\n"

    # increment parse errors
    .local pmc errs
    errs = get_root_global 'errors'
    inc errs

    .return()

  NO_LINE_NR_METHOD:
    printerr "can't find PGE::Util::line_number"
    exit 1
.end


.sub 'long_string'
    .param pmc mob
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local int sep
    sep = 0
    $S0 = substr target, pos, 1
    if $S0 != '[' goto END
    inc pos
    (pos, sep) = _skip_sep(target, pos, '[')
    if sep >= 0 goto L1
    if sep == -1 goto END
    error(mob, "invalid long string delimiter")
L1:
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L2
    inc pos
L2:

    .local string literal
    literal = ''
LOOP:
    if pos < lastpos goto L3
    error(mob, "unfinished long string")
L3:
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L4
    inc pos
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L5
    error(mob, "nesting of [[...]] is deprecated")
L5:
    dec pos
    goto CONCAT
L4:
    if $S0 != ']' goto L6
    inc pos
    ($I0, $I1) = _skip_sep(target, pos, ']')
    if $I1 != sep goto L7
    pos = $I0 + 1
    mob.'value'(literal)
    mpos = pos
    goto END
L7:
    dec pos
    goto CONCAT
L6:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L8
    $S0 = "\n"
    goto CONCAT
L8:

CONCAT:
    concat literal, $S0
    inc pos
    goto LOOP

END:
    .return (mob)
.end


.sub 'long_comment'
    .param pmc mob
    .param pmc adv :slurpy :named

    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos
    (mob, target, mfrom, mpos) = mob.'newfrom'(mob)
    pos = mfrom
    lastpos = length target

    .local int sep
    sep = 0
    $S0 = substr target, pos, 1
    if $S0 != '[' goto END
    inc pos
    (pos, sep) = _skip_sep(target, pos, '[')
    if sep < 0 goto END
    inc pos
#    $S0 = substr target, pos, 1
#    $I0 = index "\n\r", $S0
#    if $I0 < 0 goto L2
#    inc pos
#L2:

#    .local string literal
#    literal = ''
LOOP:
    if pos < lastpos goto L3
    error(mob, "unfinished long comment")
L3:
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L4
    inc pos
    $S0 = substr target, pos, 1
    if $S0 != '[' goto L5
    error(mob, "nesting of [[...]] is deprecated")
L5:
    dec pos
    goto CONCAT
L4:
    if $S0 != ']' goto L6
    inc pos
    ($I0, $I1) = _skip_sep(target, pos, ']')
    if $I1 != sep goto L7
    pos = $I0 + 1
#    mob.'value'(literal)
    mpos = pos
    goto END
L7:
    dec pos
    goto CONCAT
L6:
    $I0 = index "\n\r", $S0
    if $I0 < 0 goto L8
#    $S0 = "\n"
    goto CONCAT
L8:

CONCAT:
#    concat literal, $S0
    inc pos
    goto LOOP

END:
    .return (mob)
.end

.sub '_skip_sep' :anon
    .param string target
    .param int pos
    .param string delim
    .local int count
    count = 0
L1:
    $S0 = substr target, pos, 1
    if $S0 != '=' goto L2
    inc count
    inc pos
    goto L1
L2:
    if $S0 == delim goto L3
    neg count
    dec count
L3:
    .return (pos, count)
.end


.include 'languages/lua/src/ASTGrammar.pir'
.include 'languages/lua/src/lua_grammar_gen.pir'

=head1 LICENSE

Copyright (C) 2007, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHORS

Klaas-Jan Stol <parrotcode@gmail.com>

Francois Perrad

=cut
