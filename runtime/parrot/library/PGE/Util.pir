# Copyright (C) 2005-2009, Parrot Foundation.
# $Id$

=head1 TITLE

PGE/Util.pir - useful rules for working with PGE grammars

=head1 DESCRIPTION

This module defines a number of useful rules for various
parsing tasks using PGE.

=head2 Functions

=cut

.namespace [ 'PGE';'Util' ]

.include 'cclass.pasm'

.sub "__onload" :load
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PGE::Util', 'parent'=>'PGE::Grammar')
    .return ()
.end

=over 4

=item die(match, [, message [, ...]] )

Throws an exception at the current point in the match.  If message
doesn't end with a newline, also produces the line number and offset
of the match.

=cut

.sub 'die'
    .param pmc mob                                 # match object
    .param pmc list            :slurpy             # message arguments

    .local pmc it
    .local string message
    message = ''
    it = iter list
  iter_loop:
    unless it goto iter_end
    $S0 = shift it
    message .= $S0
    goto iter_loop
  iter_end:

    # get a copy of the match object
    .local string target
    .local int pos
    $P0 = get_hll_global ['PGE'], 'Match'
    (mob, pos, target) = $P0.'new'(mob)
    $I0 = length message
    dec $I0
    $I0 = is_cclass .CCLASS_NEWLINE, message, $I0
    if $I0 goto throw_message

    .local int lines
    .local pmc line_number
    #  FIXME: use 'line_number' method instead?
    line_number = get_hll_global ['PGE';'Util'], 'line_number'
    (lines) = mob.line_number(pos)
    inc lines
    message .= ' at line '
    $S0 = lines
    message .= $S0
    message .= ', near "'
    $I0 = length target
    $I0 -= pos
    if $I0 < 10 goto add_position_1
    $I0 = 10
  add_position_1:
    $S0 = substr target, pos, $I0
    $S0 = escape $S0
    message .= $S0
    message .= "\"\n"

  throw_message:
    $P0 = new 'Exception'
    $P0 = message
    throw $P0

    mob.'to'(-3)
    .return (mob)
.end


=item warn(match, [, message [, ...]] )

Emits the list of messages to stderr.

=cut

.sub 'warn'
    .param pmc mob                                 # match object
    .param pmc list            :slurpy             # message arguments

    .local pmc it
    .local string message
    message = ''
    it = iter list
  iter_loop:
    unless it goto iter_end
    $S0 = shift it
    message .= $S0
    goto iter_loop
  iter_end:

    # get a copy of the match object
    .local string target
    .local int pos
    $P0 = get_hll_global ['PGE'], 'Match'
    (mob, pos, target) = $P0.'new'(mob)
    $I0 = length message
    dec $I0
    $I0 = is_cclass .CCLASS_NEWLINE, message, $I0
    if $I0 goto emit_message

    .local int lines
    .local pmc line_number
    #  FIXME: use 'line_number' method instead?
    line_number = get_hll_global ['PGE';'Util'], 'line_number'
    (lines) = mob.line_number(pos)
    inc lines
    message .= ' at line '
    $S0 = lines
    message .= $S0
    message .= "\n"
  emit_message:
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(2)
    $P1.'print'(message)

    mob.'to'(pos)
    .return (mob)
.end



=item line_number(match [, pos])

Return the line number and offset of the of the line corresponding to
offset C<pos> in the string targeted by C<match>.  If C<pos> isn't
supplied, then use the C<from> value of C<match> as the offset.
For this function the line number for the first line in the
string is treated as '0'.

=cut

.sub 'line_number'
    .param pmc match
    .param int pos             :optional
    .param int has_pos         :opt_flag

    if has_pos goto have_pos
    pos = match.'from'()
  have_pos:

    # count newlines to the current position of the parse
    .local int npos, lines
    .local string target
    $P99 = getattribute match, '$.target'
    target = $P99
    npos = 0
    lines = 0
  newline_loop:
    $I0 = find_cclass .CCLASS_NEWLINE, target, npos, pos
    if $I0 >= pos goto newline_done
    $S0 = substr target, $I0, 2
    npos = $I0 + 1
    inc lines
    if $S0 != "\r\n" goto newline_loop
    inc npos
    goto newline_loop
  newline_done:
    .return (lines, npos)
.end


=item split(regex, string [, count])

Split the string where the regex matches, returning an array. Optionally limit
the number of splits.

=back

=cut

.sub 'split'
    .param pmc    regex
    .param string str
    .param int    count     :optional
    .param int    has_count :opt_flag

    .local pmc result, match
    .local int pos, n

    result = new 'ResizablePMCArray'
    pos    = 0
    n      = 1

split_loop:
    match = regex(str, 'continue'=>pos)
    ##  if regex not found in target, we're done
    unless match goto split_end

    ##  save substring up to current match
    $I0 = match.'from'()
    $I0 -= pos
    $S0 = substr str, pos, $I0
    push result, $S0
    pos = match.'to'()

    .local pmc captures
    captures = match.'list'()
    if null captures goto capture_end
    $I0 = elements captures
    $I1 = 0
capture_loop:
    if $I1 == $I0 goto capture_end
    $P0 = captures[$I1]
    $S0 = $P0
    push result, $S0
    inc $I1
    goto capture_loop
capture_end:

    ##  are we counting matches?
    unless has_count goto split_loop
    ##  check if we've already split enough
    inc n
    if n < count goto split_loop
    # goto split_end

split_end:
    ##   save string from end of last match to end of string
    $S0 = substr str, pos
    if $S0 == "" goto end
    push result, $S0

end:
   .return (result)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
