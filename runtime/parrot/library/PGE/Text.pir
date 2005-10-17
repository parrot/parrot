=head1 TITLE

PGE::Rule::Text - rules for extracting delimited text sequences from strings

=head1 DESCRIPTION

The various rules in this module may be used to extract delimited
strings from within PGE rules.  (They can of course be called directly,
also.)

=cut

.namespace [ "PGE::Text" ]

.include "cclass.pasm"

.sub "__onload" @LOAD
    .local pmc base
    base = getclass "PGE::Rule"
    $P0 = subclass base, "PGE::Text"
.end

=head2 Available rules

=item C<bracketed(PMC target, string delim)>

Extracts a balanced-bracket-delimited substring from the
current position of C<target> using the delimiters specified
by C<delim>, and returns a C<Match> object containing the result
of the extraction.  

=cut

.sub "bracketed"
    .param pmc tgt                                 # target to match
    .param string delim        :optional           # optional delimiters
    .param int has_delim       :opt_flag
    .local pmc mob                                 # return match object
    .local string target                           # target as string
    .local string bal, bra, ket                    # balanced brackets
    .local string delim_bra, delim_ket             # delims for this match
    .local string lookket                          # closing bracket char
    .local int pos                                 # current match position
    .local int balanced                            # in balanced match

    $P0 = find_global "PGE::Match", "newfrom"
    mob = $P0(tgt, 0)
    $P0 = getattribute mob, "PGE::Match\x0$:target"
    target = $P0
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0

    if has_delim goto mkdelims
    delim = "{}()[]<>"

  mkdelims:                                        # set up delimiters
    delim_bra = ''                                 # list of open delims
    delim_ket = ''                                 # list of close delims
    bal = '{}()[]<>'                               # list of balance delims
    bra = '{{(([[<<'                               # balanced openers
    ket = '}}))]]>>'                               # balanced closers
    $I0 = length delim                             # length of delim string
  mkdelims_1:
    dec $I0                          
    if $I0 < 0 goto extract
    $S0 = substr delim, $I0, 1
    $I1 = index bal, $S0
    if $I1 < 0 goto mkdelims_2
    $S1 = substr bra, $I1, 1
    delim_bra .= $S1
    $S1 = substr ket, $I1, 1
    delim_ket .= $S1
    goto mkdelims_1
  mkdelims_2:
    delim_bra .= $S0
    delim_ket .= $S0
    goto mkdelims_1

  extract:
    $S0 = substr target, pos, 1                    
    if $S0 == "\\" goto end                        # leading escape fails
    $I0 = index delim_bra, $S0
    if $I0 < 0 goto end                            # no leading delim fails
    lookket = ''
    balanced = 1
  next:                                       
    $S0 = substr target, pos, 1                    # check current pos
    if $S0 == '' goto fail                         # end of string -> fail
    if $S0 == "\\" goto escape                     # skip escaped pos
    if $S0 == lookket goto close                   # end of current nest
    if balanced < 0 goto skip                      # skip to next char
    $I0 = index delim_bra, $S0                     # open new nest?
    if $I0 >= 0 goto open
    $I0 = index delim_ket, $S0                     # unbalanced nest?>
    if $I0 >= 0 goto fail
  skip:                                       
    inc pos                                        # move to next char
    goto next                                      # try next
  escape:
    pos += 2                                       # skip escape + char
    goto next                                      # try next
  open:                                            # open new nesting
    save lookket                                   # save current nest
    lookket = substr delim_ket, $I0, 1             # search to end of nest
    balanced = index bra, $S0                      # is this a balanced nest?
    inc pos                                        # skip open char
    goto next                                      # continue scanning
  close:                                           # close current nesting
    restore lookket                                # restore previous nest
    balanced = 1                                   # we're balancing again
    inc pos                                        # skip close char
    if lookket != '' goto next                     # still nested?
    $P0 = getattribute mob, "PGE::Match\x0$:pos"   # we have a match!
    $P0 = pos
    goto end
  fail:                                            # fail match
    if lookket == '' goto end                      # clean up restore stack
    restore lookket
    goto fail
  end:
    .return (mob)
.end

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
