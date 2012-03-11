# Copyright (C) 2007-2008, Parrot Foundation.

=head1 NAME

PCT::Grammar - base grammar with useful rules

=head1 SYNOPSIS

    grammar MyGrammar is PCT::Grammar;

    rule abc { [ word | <panic: word not found> ] }

    rule quote {
        [ \' <string_literal: '> \'
        | \" <string_literal: "> \"
        ]
    }

=head1 DESCRIPTION

This file implements C<PCT::Grammar>, which is a basic grammar object
with a few useful methods for parsing thrown in.

=head2 Methods

=over 4

=item panic(match [, message, ...] )

Throws an exception at the current point of the match, with message
as part of the exception payload.  The message doesn't end with
a newline, then the line number and offset of the match are
also included.

=cut

.namespace [ 'PCT';'Grammar' ]

.sub 'load_bytecode' :anon
    .param string libname
    $P0 = load_bytecode libname
    $I0 = $P0.'is_initialized'('load')
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'('load')
  done_initialization:
.end

.sub 'onload' :anon :tag('init') :tag('load')
    'load_bytecode'('PGE.pbc')
    'load_bytecode'('PGE/Util.pbc')
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PCT::Grammar', 'parent'=>'PGE::Grammar')
    $P0 = split '::', 'PCT::Grammar'
    $P0 = get_class $P0
    $P1 = get_hll_global ['PGE';'Util'], 'die'
    $P0.'add_method'('panic', $P1)
    .return ()
.end


=item FAILGOAL($goal [, 'dba'=>dba])

Invoked when goal matching fails to find the goal.  Builds an appropriate
error message and delegates the rest to C<panic>.

=cut

.sub 'FAILGOAL' :method
    .param string goal
    .param pmc options         :named :slurpy
    .local string dba
    dba = options['dba']
    if dba goto have_dba
    ##  if no dba supplied, use the name of the caller sub
    $P0 = getinterp
    $P0 = $P0['sub';1]
    dba = $P0
  have_dba:
    .tailcall self.'panic'("Unable to parse ", dba, "; couldn't find final ", goal)
.end


=item item()

Here we overload the item() method from PGE::Match to
throw an exception if a result object hasn't been set.

=cut

.sub 'ast' :method
    .local pmc obj
    obj = getattribute self, '$!ast'
    unless null obj goto end
    die "No result object"
  end:
    .return (obj)
.end


=item ww()

Special-purpose rule to return true if we're in the middle
of a word -- i.e., if the previous and next character are
both "word characters".  This is roughly equivalent to
C<< <?after \w><?before \w> >> except it's much quicker.
In particular, C<< <!ww> >> can be used by :sigspace rules
to enforce whitespace between lexical words.

=cut

.include 'cclass.pasm'

.sub 'ww' :method
    .param pmc adverbs         :slurpy :named
    .local pmc mob
    .local int pos
    .local string target
    $P0 = get_hll_global ['PGE'], 'Match'
    (mob, pos, target) = $P0.'new'(self)
    if pos == 0 goto fail
    $I0 = is_cclass .CCLASS_WORD, target, pos
    unless $I0 goto fail
    $I1 = pos - 1
    $I0 = is_cclass .CCLASS_WORD, target, $I1
    unless $I0 goto fail
    mob.'to'(pos)
  fail:
    .return (mob)
.end


.sub 'string_literal' :method
    .param string stop
    .param pmc adverbs         :slurpy :named

    ##  create a new match object, get the new match position
    .local pmc mob
    .local int pos, lastpos, stoplen
    .local string target, escapechars
    (mob, pos, target) = self.'new'(self)
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
    base = index '        o d     x', litchar
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
    literal = concat literal, $S1
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
    mob.'!make'(literal)
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
