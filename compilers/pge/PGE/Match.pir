=head1 NAME

PGE::Match - implementation of PGE match objects

=head1 DESCRIPTION

This file implements match objects returned by the Parrot Grammar Engine.

=cut

.namespace [ 'PGE::Match' ]

.sub '__onload' :load
    .local pmc base
    base = subclass 'Hash', 'PGE::Match'
    addattribute base, '$.target'                  # target
    addattribute base, '$.from'                    # start of match
    addattribute base, '$.pos'                     # current match position
    addattribute base, '&!corou'                   # match's corou
    addattribute base, '@!capt'                    # subpattern captures
    addattribute base, '$!result'                  # result object

    .return ()
.end

=head2 Functions

=over 4

=item C<newfrom(PMC mob [, int from [, string grammar]])>

Creates a new Match object, based on C<mob>.  If C<grammar> is
specified then the newly created object is an instance of that class,
otherwise if C<isa mob, 'PGE::Match'> then the new object is the
same class as C<mob>, otherwise the new object is a 'PGE::Match'
object.  The optional C<from> parameter says how to initialize
the C<$.from> attribute of the new object if it can't start from
the current position of C<mob>.

=cut

.sub 'newfrom'
    .param pmc mob
    .param int fromd           :optional           # default from for new
    .param int has_fromd       :opt_flag
    .param string grammar      :optional           # grammar to use
    .param int has_grammar     :opt_flag
    .local pmc me, target, from, pos

  newfrom_1:
    $I0 = isa mob, 'PGE::Match'
    if $I0 goto newfrom_mob
    target = new .String
    assign target, mob
    from = new .Integer
    from = -1
    if has_grammar goto new_me
    grammar = 'PGE::Match'
    goto new_me
  newfrom_mob:
    if has_grammar goto newfrom_2
    grammar = classname mob
  newfrom_2:
    target = getattribute mob, '$.target'
    from = getattribute mob, '$.pos'
    from = clone from
  new_me:
    $I0 = find_type grammar
    me = new $I0
    setattribute me, '$.target', target
    setattribute me, '$.from', from
    pos = new .Integer
    pos = -1
    setattribute me, '$.pos', pos
    if has_fromd == 0 goto end
    if from >= 0 goto end
    from = fromd
  end:
    .return (me, target, from, pos)
.end

=back

=head2 Methods

=over 4

=item C<new(PMC src, [ PMC adverbs :slurpy :named ])>

Creates a new Match object based on C<src>.  If the C<grammar>
adverb is specified, then the new Match object is of the given
grammar class, otherwise if C<src> is an instance of C<Match>
(or a subclass) then that class is used to create the object, 
otherwise it uses the class of the invocant.  

The C<pos>, C<p>, C<continue>, or C<c> adverbs specify where 
the match object should begin.  If no starting position is
given, the current position of C<src> is used if it has one,
otherwise the start position is at offset zero.  The C<from>
adverb can be used to initialize the Match's C<$.from>
attribute to a value other than the starting position.

The C<rw> adverb causes the invocant to be modified and
returned instead of creating a new Match object.

The C<new> method returns several values to the caller: the
initialized match object, the target the object is matching against,
a reference to its $.from attribute, a reference to its $.pos
attribute, the value of C<pos/p/continue/c> used to
initialize the object, and whether or not a continue flag
is set or implied.

=cut

.sub 'new' :method
    .param pmc src
    .param pmc adverbs         :slurpy :named

    ##   set values based on src param
    .local int issrcmatch, pos, iscont
    .local string grammar
    .local pmc target
    issrcmatch = isa src, 'PGE::Match'
    if issrcmatch goto target_from_src
    .local pmc target
    target = new .String
    target = src
    pos = 0
    iscont = 1
    grammar = classname self
    goto adverb_pos
  target_from_src:
    target = getattribute src, '$.target'
    $P0 = getattribute src, '$.pos'
    pos = $P0
    iscont = 0
    grammar = classname src
    if pos >= 0 goto adverb_pos
    pos = 0

  adverb_pos:
    unless adverbs goto with_adverbs
    ##   determine the value of pos
    $I0 = exists adverbs['pos']
    unless $I0 goto adverb_p
    pos = adverbs['pos']
    iscont = 0
    goto with_pos
  adverb_p:
    $I0 = exists adverbs['p']
    unless $I0 goto adverb_continue
    pos = adverbs['p']
    iscont = 0
    goto with_pos
  adverb_continue:
    $I0 = exists adverbs['continue']
    unless $I0 goto adverb_c
    pos = adverbs['continue']
    iscont = 1
    goto with_pos
  adverb_c:
    $I0 = exists adverbs['c']
    unless $I0 goto with_pos
    pos = adverbs['c']
    iscont = 1
  with_pos:

    ##   figure out the class of the new object
    $I0 = exists adverbs['grammar']
    unless $I0 goto with_grammar
    grammar = adverbs['grammar']
  with_grammar:
  with_adverbs:

    ##   create the new match object
    .local pmc mob, mfrom, mpos
    $I0 = find_type grammar
    mob = new $I0
    setattribute mob, '$.target', target
    mfrom = new .Integer
    mfrom = pos
    setattribute mob, '$.from', mfrom
    mpos = new .Integer
    mpos = -1
    setattribute mob, '$.pos', mpos

    .return (mob, pos, target, mfrom, mpos, iscont)
.end

    
=item C<next()>

Tell a Match object to continue the previous match from where
it left off.

=cut

.sub 'next' :method
    .local pmc corou

    corou = getattribute self, '&!corou'
    if_null corou, next_1
    goto next_2
  next_1:
    $P0 = getattribute self, '$.pos'
    $P0 = -1
    goto end
  next_2:
    corou()
  end:
    .return ()
.end


=item C<from([int pos])>

Returns or sets the offset in the target string of the first item
this object matched.

=cut

.sub 'from' :method
    .param int from            :optional
    .param int has_from        :opt_flag
    $P0 = getattribute self, '$.from'
    if has_from == 0 goto get
    $P0 = from
  get:
    .return ($P0)
.end


=item C<to([int pos])>

Returns or sets the offset at the end of this match.

=cut

.sub 'to' :method
    .param int to              :optional
    .param int has_to          :opt_flag
    $P0 = getattribute self, '$.pos'
    if has_to == 0 goto get
    $P0 = to
  get:
    .return ($P0)
.end


=item C<text()>

Returns the portion of the target string matched by this object.

=cut

.sub 'text' :method
    $P0 = getattribute self, '$.target'
    $P1 = getattribute self, '$.from'
    $P2 = getattribute self, '$.pos'
    if $P2 < 0 goto false
    if $P2 <= $P1 goto false
    $I1 = $P1
    $I2 = $P2
    $I2 -= $I1
    $S1 = substr $P0, $I1, $I2
    .return ($S1)
  false:
    .return ('')
.end


=item C<result_object([pmc obj])>

Returns or sets the "result object" for the match object.  If no 
result object has been explicitly set (by an embedded closure), 
return the substring that was matched by this match object.

=cut

.sub 'result_object' :method
    .param pmc obj             :optional
    .param int has_obj         :opt_flag
    if has_obj == 0 goto get
    setattribute self, '$!result', obj
  get:
    obj = getattribute self, '$!result'
    if null obj goto result_text
    .return (obj)
  result_text:
    $S0 = self.'text'()
    .return ($S0)
.end


=item C<_failcut(int cutvalue)>

Immediately "fail" this Match object, removing any 
captured entities and coroutine continuation.  Set
the position of the match object to C<cutvalue>.

=cut

.sub '_failcut' :method
    .param int cutvalue
    $P0 = getattribute self, '$.pos'
    $P0 = cutvalue
    null $P0
    setattribute self, '$.target', $P0
    setattribute self, '&!corou', $P0
    setattribute self, '@!capt', $P0
    setattribute self, '$!result', $P0
    .local pmc iter
    iter = new .Iterator, self
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    delete self[$S0]
    goto iter_loop
  iter_end:
    .return ()
.end
    

=item C<__get_bool()>

Returns 1 if this object successfully matched the target string,
0 otherwise.

=cut

.sub '__get_bool' :method
    $P1 = getattribute self, '$.pos'
    $I0 = $P1
    $I1 = isge $I0, 0
    .return ($I1)
.end

=item C<__get_integer()>

Returns the integer value of this match.

=cut

.sub '__get_integer' :method
    $I0 = self.'result_object'()
    .return ($I0)
.end

=item C<__get_number()>

Returns the numeric value of this match.

=cut

.sub '__get_number' :method
    $N0 = self.'result_object'()
    .return ($N0)
.end

=item C<__get_string()>

Returns the portion of the target string matched by this object.

=cut

.sub '__get_string' :method
    $S0 = self.'result_object'()
    .return ($S0)
.end

=item C<__get_string_keyed_int(int key)>

Returns the portion of the target string matched by C<key>,
in string context. If the Match object contains an array of
matches, a space seperated list of matches is returned.

=cut

.sub '__get_string_keyed_int' :method
	.param int key
    $P0 = getattribute self, '@!capt'
	$S0 = ''
    if_null $P0, get_1
    $P0 = $P0[key]
	$S0 = $P0
  get_1:
    .return ($S0)
.end

=item C<__get_pmc_keyed_int(int key)>

Returns the subpattern capture associated with C<key>.  This
returns either a single Match object or an array of match
objects depending on the rule.

=cut

.sub '__get_pmc_keyed_int' :method
    .param int key
    $P0 = getattribute self, '@!capt'
    if_null $P0, get_1
    $P0 = $P0[key]
  get_1:
    .return ($P0)
.end

.sub '__set_pmc_keyed_int' :method
    .param int key
    .param pmc val
    .local pmc capt
    capt = getattribute self, '@!capt'
    unless_null capt, set_1
    capt = new .ResizablePMCArray
    setattribute self, '@!capt', capt
  set_1:
    capt[key] = val
.end

.sub '__delete_keyed_int' :method
    .param int key
    .local pmc capt
    capt = getattribute self, '@!capt'
    delete capt[key]
.end

.sub '__defined_keyed_int' :method
    .param int key
    .local pmc capt
    $I0 = 0
    capt = getattribute self, '@!capt'
    if_null capt, end
    $I0 = defined capt[key]
  end:
    .return ($I0)
.end


=item C<get_hash()>

Returns the hash component of the match object.

=cut

.sub 'get_hash' :method
    .return (self)
.end

=item C<get_array()>

Returns the array component of the match object.

=cut

.sub 'get_array' :method
    .local pmc array
    array = getattribute self, '@!capt'
    .return (array)
.end

=back

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut
