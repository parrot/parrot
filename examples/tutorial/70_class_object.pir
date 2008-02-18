=head1 Classes

This example demstrates creating a class in PIR, adding attributes, defining
methods, calling methods, and setting attributes.

=cut

.sub main :main
    .local pmc myclass, myobj

    myclass = newclass 'Foo'
    addattribute myclass, 'bar'
    addattribute myclass, 'baz'

    myobj = new 'Foo'
    myobj.set_bar("Hello")
    myobj.set_baz(5)

    $S0 = myobj.get_bar()
    say $S0

    $I0 = myobj.get_baz()
    print $I0
    print "\n"

.end


.namespace ['Foo']

.sub get_bar :method
    $P0 = getattribute self, "bar"
    .return($P0)
.end

.sub set_bar :method
    .param string value

    $P0 = new 'String'
    $P0 = value
    setattribute self, "bar", $P0
.end

.sub get_baz :method
    $P0 = getattribute self, "baz"
    .return($P0)
.end

.sub set_baz :method
    .param int value

    $P0 = new 'Integer'
    $P0 = value
    setattribute self, "baz", $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

