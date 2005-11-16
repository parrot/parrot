=head1 NAME

PGE::Match - implementation of PGE match objects

=head1 DESCRIPTION

This file implements match objects returned by the Parrot Grammar Engine.

=cut

.namespace [ "PGE::Match" ]

.sub "__onload" :load
    .local pmc base
    $I0 = find_type "PGE::Match"
    if $I0 goto end
    $P0 = getclass "PerlHash"
    base = subclass $P0, "PGE::Match"
    addattribute base, "$:target"                  # target
    addattribute base, "$:from"                    # start of match
    addattribute base, "$:pos"                     # current match position
    addattribute base, "&:corou"                   # match's corou
    addattribute base, "@:capt"                    # subpattern captures
  end:
    .return ()
.end

=head2 Functions

=item C<newfrom(PMC mob [, int from [, string grammar]])>

Creates a new Match object, based on C<mob>.  If C<grammar> is
specified then the newly created object is an instance of that class,
otherwise if C<isa mob, "PGE::Match"> then the new object is the
same class as C<mob>, otherwise the new object is a "PGE::Match"
object.  The optional C<from> parameter says how to initialize
the C<$:from> attribute of the new object if it can't start from
the current position of C<mob>.

=cut

.sub "newfrom"
    .param pmc mob
    .param int fromd           :optional           # default from for new
    .param int has_fromd       :opt_flag
    .param string grammar      :optional           # grammar to use
    .param int has_grammar     :opt_flag
    .local pmc me, target, from, pos

  newfrom_1:
    $I0 = isa mob, "PGE::Match"
    if $I0 goto newfrom_mob
    target = new String
    assign target, mob
    from = new PerlInt
    from = -1
    if has_grammar goto new_me
    grammar = "PGE::Rule"
    goto new_me
  newfrom_mob:
    if has_grammar goto newfrom_2
    grammar = classname mob
  newfrom_2:
    target = getattribute mob, "PGE::Match\x0$:target"
    from = getattribute mob, "PGE::Match\x0$:pos"
    from = clone from
  new_me:
    $I0 = find_type grammar
    me = new $I0
    setattribute me, "PGE::Match\x0$:target", target
    setattribute me, "PGE::Match\x0$:from", from
    pos = new PerlInt
    pos = -1
    setattribute me, "PGE::Match\x0$:pos", pos
    if has_fromd == 0 goto end
    if from >= 0 goto end
    from = fromd
  end:
    .return (me, target, from, pos)
.end

=head2 Methods

=item C<next()>

Tell a Match object to continue the previous match from where
it left off.

=cut

.sub "next" method
    .local pmc corou

    corou = getattribute self, "PGE::Match\x0&:corou"
    if_null corou, next_1
    goto next_2
  next_1:
    $P0 = getattribute self, "PGE::Match\x0$:pos"
    $P0 = -1
    goto end
  next_2:
    corou()
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
    .return (from)
.end

=item C<to()>

Returns the offset at the end of this match.

=cut

.sub "to" method
    .local pmc to
    to = getattribute self, "PGE::Match\x0$:pos"
    .return (to)
.end

=item C<__get_bool()>

Returns 1 if this object successfully matched the target string,
0 otherwise.

=cut

.sub "__get_bool" method
    $P1 = getattribute self, "PGE::Match\x0$:pos"
    $I0 = $P1
    $I1 = isge $I0, 0
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

=item C<__get_pmc_keyed_int(int key)>

Returns the subpattern capture associated with C<key>.  This
returns either a single Match object or an array of match
objects depending on the rule.

=cut

.sub "__get_pmc_keyed_int" method
    .param int key
    $P0 = getattribute self, "PGE::Match\x0@:capt"
    if_null $P0, get_1
    $P0 = $P0[key]
  get_1:
    .return ($P0)
.end

.sub "__set_pmc_keyed_int" method
    .param int key
    .param pmc val
    .local pmc capt
    capt = getattribute self, "PGE::Match\x0@:capt"
    unless_null capt, set_1
    capt = new PerlArray
    setattribute self, "PGE::Match\x0@:capt", capt
  set_1:
    capt[key] = val
.end

.sub "__delete_keyed_int" :method
    .param int key
    .local pmc capt
    capt = getattribute self, "PGE::Match\x0@:capt"
    delete capt[key]
.end

.sub "__defined_keyed_int" :method
    .param int key
    .local pmc capt
    $I0 = 0
    capt = getattribute self, "PGE::Match\x0@:capt"
    if_null capt, end
    $I0 = defined capt[key]
  end:
    .return ($I0)
.end


=item C<get_hash()>

Returns the hash component of the match object.

=cut

.sub "get_hash" method
    .return (self)
.end

=item C<get_array()>

Returns the array component of the match object.

=cut

.sub "get_array" method
    .param pmc array
    array = getattribute self, "PGE::Match\x0@:capt"
    .return (array)
.end

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
