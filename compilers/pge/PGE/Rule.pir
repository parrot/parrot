=head1 NAME

PGE::Rule - base class for grammars and built-in rules

=head1 DESCRIPTION

This implements the base classes for forming grammars, and provides
a number of built-in rules.

=cut

.namespace [ "PGE::Rule" ]

.include "cclass.pasm"

.sub "__onload" 
    .local pmc base
    .local pmc p6rule
    base = getclass "PGE::Match"
    $P0 = subclass base, "PGE::Rule"
    p6rule = find_global "PGE", "p6rule"
    p6rule("[_ | <?alpha>] \w*", "PGE::Rule", "ident")
.end

=head2 Built-in rules

=item C<null()>

Match a null string (always returns true on first match).

=cut

.sub null
    .param pmc mob
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    assign $P1, $P0
    .return (mob)    
.end

=item C<fail()>

Force a backtrack.  (Taken from A05.)

=cut

.sub fail
    .param pmc mob
    $P0 = getattribute mob, "PGE::Match\x0$:pos"
    $P0 = -1
    .return (mob)
.end

=item C<upper()>

Match a single uppercase character.

=cut

.sub "upper"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_UPPERCASE, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<lower()>

Match a single lowercase character.

=cut

.sub "lower"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_LOWERCASE, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<alpha()>

Match a single alphabetic character.

=cut

.sub "alpha"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_ALPHABETIC, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<digit()>

Match a single digit.

=cut

.sub "digit"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_NUMERIC, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<xdigit()>

Match a single alphanumeric character.

=cut

.sub "xdigit"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_HEXADECIMAL, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<space()>

Match a single whitespace character.

=cut

.sub "space"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_WHITESPACE, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<print()>

Match a single printable character.

=cut

.sub "print"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_PRINTING, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<graph()>

Match a single "graphical" character.

=cut

.sub "graph"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_GRAPHICAL, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<blank()>

Match a single "blank" character.

=cut

.sub "blank"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_BLANK, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<cntrl()>

Match a single "control" character.

=cut

.sub "cntrl"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_CONTROL, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<punct()>

Match a single punctuation character.

=cut

.sub "punct"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_PUNCTUATION, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<alnum()>

Match a single alphanumeric character.

=cut

.sub "alnum"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $I0 = is_cclass .CCLASS_ALPHANUMERIC, target, pos
    unless $I0 goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<sp()>

Match a single space character.  (Taken from E05.)

=cut

.sub "sp"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $S0 = substr target, pos, 1
    unless $S0 == " " goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<lt()>

Match a single left angle bracket.  (Taken from E05.)

=cut

.sub "lt"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $S0 = substr target, pos, 1
    unless $S0 == "<" goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<gt()>

Match a single right angle bracket. (Taken from E05.)

=cut

.sub "gt"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $S0 = substr target, pos, 1
    unless $S0 == ">" goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=item C<dot()>

Match a single dot ('.').  (Taken from E05.)

=cut

.sub "dot"
    .param pmc mob
    .local string target
    .local int pos
    $P0 = getattribute mob, "PGE::Match\x0$:from"
    pos = $P0
    $P1 = getattribute mob, "PGE::Match\x0$:target"
    target = $P1
    $S0 = substr target, pos, 1
    unless $S0 == "." goto end
    inc pos
    $P1 = getattribute mob, "PGE::Match\x0$:pos"
    $P1 = pos
  end:
    .return (mob)
.end

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
