## $Id: parse.pir $

=head1 TITLE

parse.pir - Parsing support subroutines

=head2 DESCRIPTION

This file contains support subroutines for parsing Lua programs.  
Specialized parsing subroutines will appear here as the parser grows.

=over 4

=item C<quoted_literal>

Handles parsing of the various types of quoted literals.

=cut

.sub 'quoted_literal'
    .param pmc mob                                 # object to parse
    .param string delim                            # string delimiter (XXX)
    .param pmc adv             :slurpy :named      # adverbs

    ##   XXX: This is a temporary hack to set adverbs based
    ##   on the delimiter.  We'll remove this when we have full
    ##   qq[...] adverb capability.
    if delim == "'" goto q_string
    adv['double'] = 1
  q_string:
    adv['single'] = 1

    .local string target
    .local pmc mfrom, mpos
    .local int pos
    (mob, pos, target, mfrom, mpos) = mob.'new'(mob)

    .local int capt, lastpos, delimlen
    capt = 0
    lastpos = length target
    delimlen = length delim

    .local string lstop
    lstop = ''

  outer_loop:
    .local string literal
    .local int litfrom
    literal = ''
    litfrom = pos
    if pos >= lastpos goto fail
    $S0 = substr target, pos, delimlen
    if $S0 == delim goto outer_end

  scan_literal_loop:
    if pos >= lastpos goto fail
    $S0 = substr target, pos, delimlen
    if $S0 == delim goto scan_literal_end
    $S0 = substr target, pos, 1
    $I0 = index lstop, $S0
    if $I0 >= 0 goto scan_literal_end
    if $S0 != "\\" goto scan_literal_1
    inc pos
    $S0 = substr target, pos, 1
    $I0 = index '0123456789', $S0
    if $I0 >= 0 goto scan_backslash_d
    $I0 = index "abefnrtv", $S0
    if $I0 < 0 goto scan_literal_1
    $S0 = substr "\x07\x08\f\n\r\t\x0b", $I0, 1
  scan_literal_1:
    concat literal, $S0
    inc pos
    goto scan_literal_loop

  ## parse \ddd
  scan_backslash_d:
    .local int base
    base = 10
    .local int decnum
    decnum = 0
    $S0 = substr target, pos, 1
  scan_bxdo_chars_loop:
    $S0 = substr target, pos, 1
    $I0 = index '0123456789', $S0
    if $I0 < 0 goto scan_bxdo_chars_end
    if $I0 >= base goto scan_bxdo_chars_end
    decnum *= base
    decnum += $I0
    inc pos
    goto scan_bxdo_chars_loop
  scan_bxdo_chars_end:
    ##   add the character to the literal
    $S1 = chr decnum
    concat literal, $S1
    goto scan_literal_loop

  scan_literal_end:
    ($P0, $P1, $P2, $P3, $P4) = mob.'new'(mob)
    $P3 = litfrom
    $P4 = pos
    $P0.'value'(literal)
    $P0['type'] = 'str'
    mob[capt] = $P0
    inc capt
    goto outer_loop

  outer_end:
    mpos = pos
    .return (mob)
  fail:
    mpos = -1
    .return (mob)
.end

=item C<long_string>

TODO

=cut


=item C<long_comment>

TODO

=cut


=back

=cut

