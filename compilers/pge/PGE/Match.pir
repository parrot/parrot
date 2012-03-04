# Copyright (C) 2005-2009, Parrot Foundation.

=head1 NAME

PGE::Match - implementation of PGE match objects

=head1 DESCRIPTION

This file implements match objects returned by the Parrot Grammar Engine.

=cut

.namespace [ 'PGE';'Match' ]

.sub '__load_bytecode' :anon
    .param string pbc_name
    .param string tag
    $P0 = load_bytecode pbc_name
    $I0 = $P0.'is_initialized'(tag)
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'(tag)
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'(tag)
  done_initialization:
.end

.sub '' :tag('load')
    '__load_bytecode'('PGE/Dumper.pbc', 'init')

    .local pmc p6meta
    p6meta = new 'P6metaclass'
    $P0 = p6meta.'new_class'('PGE::Match', 'parent'=>'Capture', 'attr'=>'$.target $.from $.pos &!corou $!ast')
    set_hll_global ['PGE'], '$!MATCH', $P0

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
    target = new 'String'
    assign target, src
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
    ne $S0, 'String', have_grammar
    $S0 = grammar
    $P0 = split '::', $S0
    grammar_class = get_class $P0
    goto with_grammar
  have_grammar:
    grammar_class = grammar
  grammar_namespace:
    grammar_class = get_class grammar
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


=item C<Str()>

Returns the portion of the target string matched by this object.

=cut

.sub 'Str' :method
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


=item C<orig()>

Return the original item being matched.

=cut

.sub 'orig' :method
    $P0 = getattribute self, '$.target'
    .return ($P0)
.end


=item C<!make(pmc obj)>

Sets the "ast object" for the Match invocant.

=cut

.sub '!make' :method
    .param pmc obj
    setattribute self, '$!ast', obj
    .return (obj)
.end


=item C<ast([pmc obj])>

Returns the "ast object" for the match object.  If no ast object
has been set, then it returns the string between C<.from> and C<.to>.

=cut

.sub 'ast' :method
    .local pmc obj
    obj = getattribute self, '$!ast'
    if null obj goto ret_null
    .return (obj)
  ret_null:
    .tailcall self.'Str'()
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
    setattribute self, '$!ast', $P0
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

.sub '' :vtable('get_integer') :method
    $I0 = self.'Str'()
    .return ($I0)
.end

=item C<get_number()>

Returns the numeric value of this match.

=cut

.sub '' :vtable('get_number') :method
    $N0 = self.'Str'()
    .return ($N0)
.end

=item C<get_string()>

Returns the portion of the target string matched by this object.

=cut

.sub '' :vtable('get_string') :method
    $S0 = self.'Str'()
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
