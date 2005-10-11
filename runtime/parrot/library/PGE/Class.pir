=head1 NAME

PGE::Class - implementation of character class vtables

=head1 DESCRIPTION

This file implements objects that represent character class atoms.  The design
is a simple vtable design, so that we can add unicode trait classes and such
when we find out how.

Yes, it is all in PIR.  And yes, this is a speed-critical part of PGE.  Don't
complain; it's designed so that you can drop in a faster implementation any
time.  Just replace these classes with PMCs.

There's also something to be said for adding an optimizer at some point.  The
number of tests could get expensive for complex classes, so an optimizer would
walk the logic tree and replace it with a direct lookup or something.

=cut

.sub __onload :load
    .local pmc base
    newclass base, "PGE::Class"

    subclass $P0, base, "PGE::Class::Discrete"
    addattribute $P0, ".chars"   # str; attr 0

    subclass $P0, base, "PGE::Class::Invert"
    addattribute $P0, ".child"   # pmc; attr 0

    .return()
.end


.namespace [ "PGE::Class" ]

=head2 PGE::Class

This is an abstract base class for the atomic classes defined later in
the file.  It provides the following methods to all other classes
defined here:

=over

=item * (int) matches(str char)

Returns 1 if I<char> is in the character class, 0 if not.  The behavior is
undefined if I<char> is more than one character long.  This is just a named
proxy to the get_integer_keyed vtable slot.

=cut

.sub matches method
    .param string key
    # Hmm, we should be able to just say self[$S0], but we can't
    # for some reason
    $P0 = new Key
    $P0 = key
    $I0 = self[$P0]
    .return($I0)
.end

=item * (int) find_forward(str source [, int offset])

Finds the first character in I<source> that matches the character class
and returns its offset.  The optional I<offset> argument tells the method
where to start looking.

=cut

.sub find_forward method
    .param string source
    .param int offset           :optional
    .param int has_offset       :opt_flag

    if has_offset goto dontzero
    offset = 0
dontzero:

    .local int len
    .local int i
    len = length source

    i = offset
again:
    unless i < len goto fail

    substr $S0, source, i, 1
    $I0 = self.matches($S0)
    unless $I0 goto continue
    .return(i)
continue:
    inc i
    goto again

fail:
    .return(-1)
.end

.sub find_forward_inverted method
    .param string source
    .param int offset
    .param int offset           :optional
    .param int has_offset       :opt_flag

    if has_offset goto dontzero
    offset = 0
dontzero:

    .local pmc parent
    find_type $I0, "PGE::Class::Invert"
    new parent, $I0

    assign parent, self
    $I1 = parent.find_forward(source, offset)

    .return($I1)
.end

=back

=cut

.namespace [ "PGE::Class::Discrete" ]

=head2 PGE::Class::Discrete

This class represents a discrete set of characters, such as [aeiou] (or
<[aeiou]> in Perl 6-land).  To use this class:

    # create the character class
    .local pmc new_sub
    .local pmc class
    find_global new_sub, "PGE::Class::Discrete", "new"
    class = new_sub("aeiou")

    # decide whether it matches a character
    .local int matches
    matches = class["x"]
    # or
    matches = class.matches("x")

Ranges ("a-m") are not supported.  That means the three characters "a", "-",
and "m".

=cut

.sub "new"
    .param string chars
    .local pmc me

    find_type $I0, "PGE::Class::Discrete"
    new me, $I0

    .local int offset
    classoffset offset, me, "PGE::Class::Discrete"

    $P0 = new String
    $P0 = chars
    setattribute me, offset, $P0
    .return(me)
.end

.sub __get_integer_keyed method
    .param pmc key

    .local int offset
    classoffset offset, self, "PGE::Class::Discrete"
    getattribute $P0, self, offset

    $S0 = $P0
    $S1 = key
    index $I0, $S0, $S1

    if $I0 < 1 goto fail
    .return(1)
fail:
    .return(0)
.end


.namespace [ "PGE::Class::Invert" ]

=head2 PGE::Class::Invert

This class represents the logical inversion of another class.  That is,
it matches exactly when its child doesn't.  To create this class:

    # create the character class
    .local pmc class
    .local pmc new_sub
    find_global new_sub, "PGE::Class::Invert", "new"
    class = new_sub(some_other_pge_class)

=cut

.sub "new"
    .param pmc child
    .local pmc me

    find_type $I0, "PGE::Class::Invert"
    new me, $I0

    .local int offset
    classoffset offset, me, "PGE::Class::Invert"
    setattribute me, offset, child
    .return(me)
.end

.sub __get_integer_keyed method
    .param pmc key

    .local int offset
    classoffset offset, self, "PGE::Class::Invert"
    getattribute $P0, self, offset

    $I0 = $P0[key]
    $I1 = !$I0
    .return($I1)
.end

=head1 AUTHORS

Luke Palmer (luke@luqui.org) wrote this module.  Patrick Michaud
(pmichaud@pobox.com) engineered PGE as a whole.  Questions about PGE should be
directed to perl6-compiler@perl.org.

=cut

# vim: ft=imc :
