=head1 TITLE

PGE/Util.pir - useful rules for working with PGE grammars

=head1 DESCRIPTION

This module defines a number of useful rules for various
parsing tasks using PGE.

=head2 Functions

=cut

.namespace [ 'PGE::Util' ]

.include 'cclass.pasm'

.sub "__onload" :load
    .local pmc base
    $P0 = subclass 'PGE::Grammar', 'PGE::Util'
    .return ()
.end 

=over 4

=item C<die(PMC match, [, message [, ...]] )>

Throws an exception at the current point in the match.  If message
doesn't end with a newline, also produces the line number and offset
of the match.

=cut

.sub 'die'
    .param pmc mob                                 # match object
    .param pmc list            :slurpy             # message arguments

    .local pmc iter                                
    .local string message
    message = ''
    iter = new .Iterator, list
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    message .= $S0
    goto iter_loop
  iter_end:

    # get a copy of the match object
    .local pmc newfrom, mfrom, mpos
    .local string target
    newfrom = find_global 'PGE::Match', 'newfrom'
    (mob, target, mfrom, mpos) = newfrom(mob, 0)
    $I0 = length message
    dec $I0
    $I0 = is_cclass .CCLASS_NEWLINE, message, $I0
    if $I0 goto throw_message

    # count newlines to the current position of the parse
    .local int pos, npos, lines
    pos = mfrom
    npos = 0
    lines = 1
  newline_loop:
    $I0 = find_cclass .CCLASS_NEWLINE, target, npos, pos
    if $I0 >= pos goto add_position
    npos = $I0 + 1
    inc lines
    goto newline_loop
  add_position:
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
    $P0 = new .Exception
    $P0['_message'] = message
    throw $P0

    mpos = -3
    .return (mob)
.end
   
=item C<split(PMC regex, STR string [, INT count]>

Split the string where the regex matches, returning an array. Optionally limit
the number of splits. (This works like Perl's C<split> except it doesn't add
captures to the return array.)

=back

=cut

.sub 'split'
    .param pmc    regex
    .param string str
    .param int    count     :optional
    .param int    has_count :opt_flag
    
    .local pmc result, match
    .local int pos, n
    
    result = new .ResizablePMCArray
    pos    = 0
    n      = 1
    
split_loop:
    match = regex(str, 'continue'=>pos)
    ##  if regex not found in target, we're done
    unless match goto split_end
    
    ##  save substring up to current match
    $I0 = match.from()
    $I0 -= pos
    $S0 = substr str, pos, $I0
    push result, $S0
    pos = match.to()
    
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
