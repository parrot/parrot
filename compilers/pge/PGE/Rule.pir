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
.end

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
