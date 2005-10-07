=head1 NAME

PGE::Match - implementation of PGE match objects

=head1 DESCRIPTION

This file implements match objects returned by the Parrot Grammar Engine.

=cut

.namespace [ "PGE::Match" ]

.sub "__onload"
    .local pmc base
    newclass base, "PGE::Match"
    addattribute base, "$:target"                  # target
    addattribute base, "$:from"                    # start of match
    addattribute base, "$:pos"                     # current match position
    addattribute base, "&:yield"                   # match's yield
    addattribute base, "@:capt"                    # subpattern captures
    addattribute base, "%:capt"                    # subpattern captures
    .return ()
.end

=head2 Methods

=item C<newat(PMC mob, INT pos)>

Create a new match object in the same class as the invocant, from
the match state given by C<mob>, and initialized to start from
C<pos>.

=cut

.sub "newat" method
    .param pmc mob
    .param int pos
    .local pmc me
    $S0 = classname self
    $I0 = find_type $S0
    me = new $I0
    $P0 = getattribute mob, "PGE::Match\x0$:target"
    setattribute me, "PGE::Match\x0$:target", $P0
    $P0 = new PerlInt
    $P0 = pos
    setattribute me, "PGE::Match\x0$:from", $P0
    $P0 = new PerlInt
    $P0 = -1
    setattribute me, "PGE::Match\x0$:pos", $P0
    .return (me)
.end

=head2 Methods

=item C<next()>

Tell a Match object to continue the previous match from where
it left off.

=cut

.sub "next" method
    .local pmc yield

    yield = getattribute self, "PGE::Match\x0&:yield"
    if_null yield, next_1
    goto next_2
  next_1:
    $P0 = getattribute self, "PGE::Match\x0$:pos"
    $P0 = -1
    goto end
  next_2:
    .pcc_begin
    .pcc_call yield
    .pcc_end
  end:
    .return ()
.end

=item C<from()>

Returns the offset in the target string of the first item
this object matched.

=cut

.sub "from" method
    .local pmc from
    from = getattribute self, "PGE::Match\x0$:from"
    $I0 = from
    .return ($I0)
.end

=item C<to()>

Returns the offset at the end of this match.

=cut

.sub "to" method
    .local pmc to
    to = getattribute self, "PGE::Match\x0$:pos"
    $I0 = to
    .return ($I0)
.end

=item C<__get_bool()>

Returns 1 if this object successfully matched the target string,
0 otherwise.

=cut

.sub "__get_bool" method
    $P0 = getattribute self, "PGE::Match\x0$:pos"
    $I0 = $P0
    isge $I1, $I0, 0
    .return ($I1)
.end

=item C<__get_integer()>

Returns the integer value of this match.

=cut

.sub "__get_integer" method
    $S0 = self
    $I0 = $S0
    .return ($I0)
.end

=item C<__get_number()>

Returns the numeric value of this match.

=cut

.sub "__get_number" method
    $S0 = self
    $N0 = $S0
    .return ($N0)
.end

=item C<__get_string()>

Returns the portion of the target string matched by this object.

=cut

.sub "__get_string" method
    $P0 = getattribute self, "PGE::Match\x0$:target"
    $P1 = getattribute self, "PGE::Match\x0$:from"
    $P2 = getattribute self, "PGE::Match\x0$:pos"
    if $P2 < 0 goto false
    if $P2 <= $P1 goto false
    $I1 = $P1
    $I2 = $P2
    $I2 -= $I1
    $S1 = substr $P0, $I1, $I2
    .return ($S1)
  false:
    .return ("")
.end

=item C<__get_pmc_keyed(PMC key)>

Returns the subpattern or subrule capture associated with C<key>.
If the first character of C<key> is a digit then return the
subpattern, otherwise return the subrule.  Note that this will
return either a single Match object or an array of match objects
depending on the rule.

=cut

.sub "__get_pmc_keyed" method
    .param pmc key
    .local pmc capt
    $S0 = key
    .include "cclass.pasm"
    $I0 = is_cclass .CCLASS_NUMERIC, $S0, 0
    unless $I0 goto keyed_1
    capt = getattribute self, "PGE::Match\x0@:capt"
    goto keyed_2
  keyed_1:
    capt = getattribute self, "PGE::Match\x0%:capt"
  keyed_2:
    $P0 = capt[key]
    $P1 = getprop "isarray", $P0
    if $P1 goto end
    $P0 = $P0[-1]
  end:
    .return ($P0)
.end

=item C<get_hash()>

Returns the hash component of the match object.

=cut

.sub "get_hash" method
    .param pmc hash
    hash = getattribute self, "PGE::Match\x0%:capt"
    .return (hash)
.end

=item C<get_array()>

Returns the array component of the match object.

=cut

.sub "get_array" method
    .param pmc array
    array = getattribute self, "PGE::Match\x0@:capt"
    .return (array)
.end

=item C<dump()>

Produces a data dump of the match object and all of its subcaptures.

=cut

.sub "dump" method
    .param string prefix       :optional           # name of match variable
    .param int has_prefix      :opt_flag
    .param string b1           :optional           # bracket open
    .param int has_b1          :opt_flag
    .param string b2           :optional           # bracket close
    .param int has_b2          :opt_flag

    .local pmc capt
    .local int spi, spc
    .local pmc iter
    .local string prefix1, prefix2

    if has_b2 goto start
    b2 = "]"
    if has_b1 goto start
    b1 = "["
  start:
    print prefix
    print ":"
    unless self goto subpats
    print " <"
    print self
    print " @ "
    $I0 = self."from"()
    print $I0
    print "> "

  subpats:
    $I0 = self
    print $I0
    print "\n"
    capt = getattribute self, "PGE::Match\x0@:capt"
    if_null capt, subrules
    spi = 0
    spc = elements capt
  subpats_1:
    unless spi < spc goto subrules
    prefix1 = concat prefix, b1
    $S0 = spi
    concat prefix1, $S0
    concat prefix1, b2
    $I0 = defined capt[spi]
    unless $I0 goto subpats_2
    $P0 = capt[spi]
    bsr dumper
  subpats_2:
    inc spi
    goto subpats_1

  subrules:
    capt = getattribute self, "PGE::Match\x0%:capt"
    if_null capt, end
    iter = new Iterator, capt
    iter = 0
  subrules_1:
    unless iter goto end
    $S0 = shift iter
    prefix1 = concat prefix, "<"
    concat prefix1, $S0
    concat prefix1, ">"
    $I0 = defined capt[$S0]
    unless $I0 goto subrules_1
    $P0 = capt[$S0]
    bsr dumper
    goto subrules_1

  dumper:
    $I0 = 0
    $I1 = elements $P0
    unless $I0 < $I1 goto dumper_1
    $P1 = getprop "isarray", $P0
    if $P1 goto dumper_2
    $P1 = $P0[-1]
    $P1."dump"(prefix1, b1, b2)
  dumper_1:
    ret
  dumper_2:
    unless $I0 < $I1 goto dumper_1
    $P1 = $P0[$I0]
    prefix2 = concat prefix1, b1
    $S0 = $I0
    concat prefix2, $S0
    concat prefix2, b2
    $P1."dump"(prefix2, b1, b2)
    inc $I0
    goto dumper_2
  end:
    .return ()
.end

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
