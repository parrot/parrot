=head1 NAME

p6ge_charclass.pir - implementation of character class vtables

=head1 DESCRIPTION

This file implements objects that represent character class atoms.  The design
is a simple vtable design, so that we can add unicode trait classes and such
when we find out how.

Yes, it is all in PIR.  And yes, this is a speed-critical part of P6GE.  Don't
complain; it's designed so that you can drop in a faster implementation any
time.  Just replace these classes with PMCs.

There's also something to be said for adding an optimizer at some point.  The
number of tests could get expensive for complex classes, so an optimizer would
walk the logic tree and replace it with a direct lookup or something.

=cut

.sub __onload @LOAD
    .local pmc base
    newclass base, "P6GE::Class"

    subclass $P0, base, "P6GE::Class::Discrete"
    addattribute $P0, ".chars"   # str; attr 0

    subclass $P0, base, "P6GE::Class::Invert"
    addattribute $P0, ".child"   # pmc; attr 0

    .return()
.end


.namespace [ "P6GE::Class" ]

=head2 P6GE::Class

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
    .param int offset

    # XXX is it zeroed automatically?
    if argcI > 0 goto dontzero
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

    if argcI > 0 goto dontzero
    offset = 0
dontzero:

    .local pmc parent
    find_type $I0, "P6GE::Class::Invert"
    new parent, $I0

    assign parent, self
    $I1 = parent.find_forward(source, offset)
    
    .return($I1)
.end

=back

=cut

.namespace [ "P6GE::Class::Discrete" ]

=head2 P6GE::Class::Discrete

This class represents a discrete set of characters, such as [aeiou] (or
<[aeiou]> in Perl 6-land).  To use this class:

    # create the character class
    .local pmc class
    find_type $I0, "P6GE::Class::Discrete"
    new class, $I0

    # assign the characters it will match
    class = "aeiou"
    # or
    class.set_chars("aeiou")

    # decide whether it matches a character
    .local int matches
    matches = class["x"]
    # or
    matches = class.matches("x")

Ranges ("a-m") are not supported.  That means the three characters "a", "-",
and "m".  

Also keep in mind that you can't (yet) do:

    matches = class[$S0]

Because of how parrot creates keys.  Use the method form or make a Key object
in that case.

=cut

.sub __init method
    .local int offset
    classoffset offset, self, "P6GE::Class::Discrete"

    $P0 = new String
    setattribute self, offset, $P0
    .return()
.end

.sub __set_string_native method
    .param string list
    .local int offset
    classoffset offset, self, "P6GE::Class::Discrete"
    getattribute $P0, self, offset

    $P0 = list
    .return()
.end

.sub set_chars method
    .param string list
    self = list
    .return()
.end

.sub __get_integer_keyed method
    .param pmc key

    .local int offset
    classoffset offset, self, "P6GE::Class::Discrete"
    getattribute $P0, self, offset

    $S0 = $P0
    $S1 = key
    index $I0, $S0, $S1
    
    if $I0 < 1 goto fail
    .return(1)
fail:
    .return(0)
.end


.namespace [ "P6GE::Class::Invert" ]

=head2 P6GE::Class::Invert

This class represents the logical inversion of another class.  That is,
it matches exactly when its child doesn't.  To create this class:

    # create the character class
    .local pmc class
    find_type $I0, "P6GE::Class::Invert"
    new class, $I0

    # assign a child object
    assign class, some_other_p6ge_class
    # or
    class.set_child(some_other_p6ge_class)

=cut

.sub __set_pmc method
    .param pmc child

    .local int offset
    classoffset offset, self, "P6GE::Class::Invert"
    setattribute self, offset, child
    .return()
.end

.sub set_child method
    .param pmc child

    assign self, child
    .return()
.end

.sub __get_integer_keyed method
    .param pmc key

    .local int offset
    classoffset offset, self, "P6GE::Class::Invert"
    getattribute $P0, self, offset

    $I0 = $P0[key]
    $I1 = !$I0
    .return($I1)
.end

# vim: ft=imc :
