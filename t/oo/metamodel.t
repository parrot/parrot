#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

t/oo/metamodel.t - test the metamodel for Parrot OO

=head1 SYNOPSIS

    % prove t/oo/metamodel.t

=head1 DESCRIPTION

Tests the metamodel for the OO implementation.

=cut

.sub _main :main
    .include 'test_more.pir'

    plan( 12 )

    .local pmc class, init_args1
    init_args1 = new 'Hash'
    init_args1['name'] = 'Dog'

    class = new "Class", init_args1
    isa_ok(class, "Class", "created class isa Class")
    $P1 = class.'name'()
    is($P1, "Dog", "created a new class via Class")
    $P1 = class.'name'()
    is($P1, "Dog", "Class accessor doesn't destroy value")

    class.'add_attribute'('bark')
    class.'add_attribute'('ear')
    class.'add_attribute'('tail')
    .local pmc attributes
    attributes = class.'attributes'()
    $I0 = exists attributes['bark']
    ok($I0, "added attribute to the class")

    $I0 = exists attributes['tail']
    ok($I0, "added second attribute to the class")
    unless $I0 goto no_tail_attribute
    $P1 = attributes['tail']
    $S1 = $P1['type']
    $I0 = iseq $S1, 'Str'
    todo($I0, "tail attribute has a type", "not implemented: GH #410")
#    is($S1,'Str', "tail attribute has a type")
    goto end_tail_attrib_test
  no_tail_attribute:
    fail("tail attribute doesn't exist")
  end_tail_attrib_test:


    $P0 = get_class 'Dog'
    $I0 = issame $P0, class
    ok($I0, "get_class can find the class")

    $P0 = class.'new'( 'bark' => "Wooof", 'tail' => 'long' )
    $P1 = getattribute $P0, "tail"
    $I0 = defined $P1
    ok($I0, "got back a tail attribute object")
    unless $I0 goto FAILTAIL
    is($P1, "long", "tail attribute has expected value")
    goto NEXTTAIL
FAILTAIL:
    fail("no attribute")
NEXTTAIL:

    $P1 = getattribute $P0, "bark"
    $I0 = defined $P1
    ok($I0, "got back a bark attribute object")
    unless $I0 goto FAIL
    is($P1, "Wooof", "bark attribute has expected value")
    goto NEXT
FAIL:
    fail("no attribute")
NEXT:

    $P0 = new "Dog"
    $I0 = defined $P0
    isa_ok($P0, "Dog", "new opcode makes working objects")

.end

.sub fail
    .param string desc
    'ok'(0, desc)
.end

.namespace['Dog']

.sub _accessor :method
  .param string attrib
  .param pmc value :optional
  .param int got_value
  unless got_value goto get_attr
  setattribute self, attrib, value
get_attr:
  .local pmc rv
  rv = getattribute self, attrib
  .return(rv)
.end

.sub init_pmc :vtable :method
    .param pmc init_args
  # Iterate over the constructor arguments, calling the accessor for each
    .local pmc it
    it = iter init_args
  iter_loop:
    unless it goto iter_end
    $S1 = shift it
    $P1 = it[$S1]
    self.$S1($P1)
    goto iter_loop
  iter_end:
.end

.sub bark :method
  .param pmc bark :optional
  .param int got_bark :opt_flag
  .local pmc rv
  rv = self.'_accessor'( "bark", bark, got_bark )
  .return(rv)
.end

.sub tail :method
  .param pmc tail :optional
  .param int got_tail :opt_flag
  .local pmc rv
  rv = self.'_accessor'( "tail", tail, got_tail )
  .return(rv)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
