=head1 TITLE

Regex - base class for grammars and built-in rules

=head1 DESCRIPTION

This implements the base classes for forming grammars, and provides
a number of built-in rules.

=cut

.namespace [ 'PGE::Match' ]

.include 'cclass.pasm'
.include 'interpinfo.pasm'

.sub '__onload' :load
    .local pmc base
    $P0 = subclass 'PGE::Match', 'PGE::Grammar'
    $P0 = new .Hash
    store_global '%!cache', $P0
    .return ()
.end


=head2 Built-in regex

=over 4

=item C<ident()>

Match an identifier.

=cut

.sub 'ident'
    .param pmc mob
    .param pmc adverbs         :slurpy :named
    .local string target
    .local pmc mfrom, mpos
    .local int pos, lastpos

    $P0 = find_global 'PGE::Match', 'newfrom'
    (mob, target, mfrom, mpos) = $P0(mob)

    pos = mfrom
    lastpos = length target
    $S0 = substr target, pos, 1
    if $S0 == '_' goto ident_1
    $I0 = is_cclass .CCLASS_ALPHABETIC, target, pos
    if $I0 == 0 goto end
  ident_1:
    pos = find_not_cclass .CCLASS_WORD, target, pos, lastpos
    mpos = pos
  end:
    .return (mob)
.end


=item C<null()>

Match a null string (always returns true on first match).

=cut

.sub "null"
    .param pmc mob
    .local pmc target, mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    assign mpos, mfrom
    .return (mob)    
.end

=item C<fail()>

Force a backtrack.  (Taken from A05.)

=cut

.sub "fail"
    .param pmc mob
    $P0 = find_global "PGE::Match", "newfrom"
    .return $P0(mob)
.end

=item C<upper()>

Match a single uppercase character.

=cut

.sub "upper"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_UPPERCASE, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<lower()>

Match a single lowercase character.

=cut

.sub "lower"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_LOWERCASE, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<alpha()>

Match a single alphabetic character.

=cut

.sub "alpha"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_ALPHABETIC, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<digit()>

Match a single digit.

=cut

.sub "digit"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_NUMERIC, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<xdigit()>

Match a single alphanumeric character.

=cut

.sub "xdigit"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_HEXADECIMAL, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<space()>

Match a single whitespace character.

=cut

.sub "space"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_WHITESPACE, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<print()>

Match a single printable character.

=cut

.sub "print"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_PRINTING, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<graph()>

Match a single "graphical" character.

=cut

.sub "graph"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_GRAPHICAL, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<blank()>

Match a single "blank" character.

=cut

.sub "blank"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_BLANK, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<cntrl()>

Match a single "control" character.

=cut

.sub "cntrl"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_CONTROL, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<punct()>

Match a single punctuation character.

=cut

.sub "punct"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_PUNCTUATION, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<alnum()>

Match a single alphanumeric character.

=cut

.sub "alnum"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $I1 = is_cclass .CCLASS_ALPHANUMERIC, target, $I0
    unless $I1 goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<sp()>

Match a single space character.  (Taken from E05.)

=cut

.sub "sp"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $S0 = substr target, $I0, 1
    if $S0 != " " goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<lt()>

Match a single left angle bracket.  (Taken from E05.)

=cut

.sub "lt"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $S0 = substr target, $I0, 1
    if $S0 != "<" goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<gt()>

Match a single right angle bracket. (Taken from E05.)

=cut

.sub "gt"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $S0 = substr target, $I0, 1
    if $S0 != ">" goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<dot()>

Match a single dot ('.').  (Taken from E05.)

=cut

.sub "dot"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    $I0 = mfrom
    $S0 = substr target, $I0, 1
    if $S0 != "." goto end
    mpos = mfrom + 1
  end:
    .return (mob)
.end

=item C<ws()>

Match whitespace between tokens.

=cut

.sub "ws"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local int rep, pos, lastpos
    .local string nextchars
    .const .Sub corou = "ws_corou"
    nextchars = ""
  ws_1:
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    lastpos = length target
    pos = mfrom
    if pos >= lastpos goto found
    if pos < 1 goto ws_scan
    $I0 = is_cclass .CCLASS_WORD, target, pos
    if $I0 == 0 goto ws_scan
    $I1 = pos - 1
    $I0 = is_cclass .CCLASS_WORD, target, $I1
    if $I0 == 0 goto ws_scan
    goto end
  ws_scan:
    $I0 = pos
    pos = find_not_cclass .CCLASS_WHITESPACE, target, pos, lastpos
    if pos == $I0 goto nobacktrack
    $I0 = length nextchars
    if $I0 == 0 goto backtrack
    $I1 = find_cclass .CCLASS_WHITESPACE, nextchars, 0, $I0
    if $I1 >= $I0 goto nobacktrack
  backtrack:
    mpos = pos
    $P0 = corou
    $P0 = clone $P0
    setattribute mob, "PGE::Match\x0&!corou", $P0
    $P0(mob, mfrom, mpos)
    .return (mob)
  nobacktrack:
    if nextchars == "" goto found
    $S1 = substr target, pos, 1
    $I1 = index nextchars, $S1
    if $I1 < 0 goto end
  found:
    mpos = pos
  end:
    .return (mob)
.end
.sub "ws_corou" :anon
    .param pmc mob
    .param pmc mfrom
    .param pmc mpos
  loop:
    .yield (mob)
    dec mpos
    if mpos > mfrom goto loop
    null $P0
    setattribute mob, "PGE::Match\x0&!corou", $P0
    goto loop
.end


=item C<wb(PMC mob)>

Returns true if we're at a word boundary (as defined by
Perl 5's \b regex).

=cut

.sub "wb"
    .param pmc mob
    .local string target
    .local pmc mfrom, mpos
    .local int pos
    $P0 = find_global "PGE::Match", "newfrom"
    (mob, target, mfrom, mpos) = $P0(mob)
    pos = mfrom
    if pos == 0 goto succeed
    $I0 = length target
    if pos == $I0 goto succeed
    $I1 = is_cclass .CCLASS_WORD, target, pos
    dec pos
    $I0 = is_cclass .CCLASS_WORD, target, pos
    if $I0 == $I1 goto end    
  succeed:
    assign mpos, mfrom
  end:
    .return (mob)
.end


=item C<before(PMC mob, STR pattern)>

Perform lookahead -- i.e., check if we're at a position where
C<pattern> matches.  Returns a zero-width Match object on
success.

=cut

.sub "before"
    .param pmc mob
    .param string pattern      :optional
    .param int has_pattern     :opt_flag
    .local pmc cache, rule

    if has_pattern goto lookahead
    mob = fail(mob)
    .return (mob)
  lookahead:
    cache = find_global '%!cache'
    $I0 = exists cache[pattern]
    if $I0 == 0 goto new_pattern
    rule = cache[pattern]
    goto match
  new_pattern:
    $P0 = compreg 'PGE::P6Regex'
    rule = $P0(pattern)
    cache[pattern] = rule
  match:
    mob = rule(mob)
    unless mob goto end
    $P0 = getattribute mob, '$.from'
    $P1 = getattribute mob, '$.pos'
    assign $P1, $P0
    null $P0
    setattribute mob, "PGE::Match\x0&!corou", $P0
  end:
    .return (mob)
.end

=item C<after(PMC mob, STR pattern)>

Perform lookbehind -- i.e., check if the string before the
current position matches <pattern> (anchored at the end).
Returns a zero-width Match object on success.

XXX: Note that this implementation cheats in a big way.
S05 says that C<after> is implemented by reversing the 
syntax tree and looking for things in opposite order going
to the left.  This implementation just grabs the (sub)string
up to the current match position and tests that, anchoring
the pattern to the end of the substring.  It's cheap and
potentially very inefficient, but it "works" for now.

=cut

.sub "after"
    .param pmc mob
    .param string pattern      :optional
    .param int has_pattern     :opt_flag
    .local pmc cache, rule
    .local int from

    if has_pattern goto lookbehind
    mob = fail(mob)
    .return (mob)
  lookbehind:
    pattern = concat '[', pattern
    pattern = concat pattern, ']$'
    cache = find_global '%!cache'
    $I0 = exists cache[pattern]
    if $I0 == 0 goto new_pattern
    rule = cache[pattern]
    goto match
  new_pattern:
    $P0 = compreg 'PGE::P6Regex'
    rule = $P0(pattern)
    cache[pattern] = rule
  match:
    $P0 = getattribute mob, '$.target'
    $S0 = $P0
    $P0 = getattribute mob, '$.pos'
    from = $P0
    $S0 = substr $S0, 0, from
    mob = rule($S0)
    unless mob goto end
    $P0 = getattribute mob, '$.from'
    $P1 = getattribute mob, '$.pos'
    $P0 = from
    $P1 = from
    null $P0
    setattribute mob, '&!corou', $P0
  end:
    .return (mob)
.end

=back
    
=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
