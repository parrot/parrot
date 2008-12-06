=head1 NAME

PGE::Match - implementation of PGE match objects

=head1 DESCRIPTION

This file implements match objects returned by the Parrot Grammar Engine.

=cut

.namespace [ 'PGE';'Match' ]

.sub '' :load
    load_bytecode 'P6object.pbc'
    load_bytecode 'PGE/Dumper.pir'                 # FIXME, XXX, etc.
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PGE::Match', 'parent'=>'Capture', 'attr'=>'$.target $.from $.pos &!corou $!item')
    .return ()
.end

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
    .local pmc grammar
    .local pmc target, grammar_class
    issrcmatch = isa src, ['PGE';'Match']
    if issrcmatch goto target_from_src
    .local pmc target
    target = new 'String'
    target = src
    pos = 0
    iscont = 1
    $P0 = self.'HOW'()
    grammar_class = getattribute $P0, 'parrotclass'
    goto adverb_pos
  target_from_src:
    target = getattribute src, '$.target'
    $P0 = getattribute src, '$.pos'
    pos = $P0
    iscont = 0
    grammar_class = typeof src
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
    $S0 = typeof grammar
    eq $S0, 'NameSpace', grammar_namespace
    $S0 = grammar
    $P0 = split '::', $S0
    grammar_class = get_class $P0
    goto with_grammar
  grammar_namespace:
    grammar_class = grammar
  with_grammar:
  with_adverbs:

    ##   create the new match object
    .local pmc mob, mfrom, mpos
    mob = new grammar_class
    setattribute mob, '$.target', target
    mfrom = box pos
    setattribute mob, '$.from', mfrom
    mpos = box -1
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


=item C<chars()>

Returns C<.to()> - C<.from()>.

=cut

.sub 'chars' :method
    $I0 = self.'to'()
    $I1 = self.'from'()
    $I2 = $I0 - $I1
    unless $I2 < 0 goto done
    $I2 = 0
  done:
    .return ($I2)
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


=item C<item()>

Returns the scalar value of this match -- the "result object"
if there is one, otherwise the substring matched by this match
object.

=cut

.sub 'item' :method
    .tailcall self.'result_object'()
.end


=item C<result_object([pmc obj])>

Returns or sets the "result object" for the match object.

=cut

.sub 'result_object' :method
    .param pmc obj             :optional
    .param int has_obj         :opt_flag
    if has_obj == 0 goto get_obj
    setattribute self, '$!item', obj
    goto ret_obj
  get_obj:
    obj = getattribute self, '$!item'
  ret_obj:
    if null obj goto ret_null
    .return (obj)
  ret_null:
    .tailcall self.'text'()
.end


=item C<find_key([ key1, key2, ... ])>

Find the first of C<key1>, C<key2>, etc. in the current
Match object, and return it.  Returns '' if none of
the specified keys are found.  If no keys are specified,
then simply return the first key found.

=cut

.sub 'find_key' :method
    .param pmc keys            :slurpy
    if null keys goto first_key
    unless keys goto first_key
  loop:
    unless keys goto not_found
    $S0 = shift keys
    $I0 = exists self[$S0]
    unless $I0 goto loop
    .return ($S0)
  first_key:
    $P0 = self.'hash'()
    $P1 = new 'Iterator', $P0
    unless $P1 goto not_found
    $S0 = shift $P1
    .return ($S0)
  not_found:
    .return ('')
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
    setattribute self, '$!item', $P0
    setref self, $P0
    .return ()
.end


=item C<get_bool()>

Returns 1 if this object successfully matched the target string,
0 otherwise.

=cut

.sub 'get_bool' :vtable :method
    $P1 = getattribute self, '$.pos'
    $I0 = $P1
    $I1 = isge $I0, 0
    .return ($I1)
.end

=item C<get_integer()>

Returns the integer value of this match.

=cut

.sub 'get_integer' :vtable :method
    $I0 = self.'result_object'()
    .return ($I0)
.end

=item C<get_number()>

Returns the numeric value of this match.

=cut

.sub 'get_number' :vtable :method
    $N0 = self.'result_object'()
    .return ($N0)
.end

=item C<get_string()>

Returns the portion of the target string matched by this object.

=cut

.sub 'get_string' :vtable :method
    $S0 = self.'result_object'()
    .return ($S0)
.end

=back

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
