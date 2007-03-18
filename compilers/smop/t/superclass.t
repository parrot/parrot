#!./parrot

.sub _main :main
    load_bytecode 'library/Test/More.pir'
    load_bytecode 'compilers/smop/Class.pir'
    load_bytecode 'compilers/smop/Attribute.pir'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exports = split " ", "plan ok is"
    test_namespace.export_to(curr_namespace, exports)

    plan( 12 )

    .local pmc dog_c, mammal_c, class_class, init_attribs, init_supers

    init_attribs = new Hash
    init_attribs['ear'] = 'Str'
    init_attribs['tail'] = 'Str'
  
    class_class = find_class("Class")
    mammal_c = class_class.'new'( 'name' => "Mammal", 'attributes' => init_attribs )
    init_supers = new ResizableStringArray
    push init_supers, "Mammal"
    dog_c = class_class.'new'( 'name' => "Dog", 'superclasses' => init_supers )

    $P1 = mammal_c.name()
    is($P1, "Mammal", "[sanity] Created a Class object")
    $P1 = dog_c.name()
    is($P1, "Dog", "Created a sub-class")

    #$I0 = isa 

    dog_c.add_attribute('bark')
    .local pmc attributes
    attributes = dog_c.'attributes'()
    $I0 = exists attributes['bark']
    ok($I0, "added attribute to the class")

    $I0 = exists attributes['tail']
    not $I0
    ok($I0, "superclass attributes not available")

    $P0 = find_class('Dog')
    $I0 = issame $P0, dog_c
    ok($I0, "find_class can find the class")

    $P0 = find_class('Mammal')
    $I0 = issame $P0, mammal_c
    ok($I0, "find_class can find the superclass, too")

    .local pmc spot
    spot = dog_c.'new'( 'bark' => "Wooof", 'tail' => 'long' )
    $P1 = getattribute spot, "tail"
    $I0 = defined $P1
    ok($I0, "got back a tail attribute object")
    unless $I0 goto SKIPTAIL
    is($P1, "long", "tail attribute has expected value")
    goto NEXTTAIL
SKIPTAIL:	
    fail("SKIP - no attribute")
NEXTTAIL:	

    $P1 = getattribute spot, "bark"
    $I0 = defined $P1
    ok($I0, "got back a bark attribute object")
    unless $I0 goto SKIP
    is($P1, "Wooof", "bark attribute has expected value")
    goto NEXT
SKIP:	
    fail("SKIP - no attribute")
NEXT:

    .local pmc mouse
    mouse = mammal_c.'new'( 'tail' => 'thin' )

    $S0 = mouse.eat("Cheese")
    is($S0, "Munch Cheese", "[sanity] can dispatch to new instance")

    $S1 = spot.eat("Leftovers")
    $S2 = "Gobble Leftovers, Munch Leftovers"
    ne $S1, $S2, SKIPIT
    pass("can call superclass methods")
    goto ATEIT
SKIPIT:
    #ok(0, "SKIP - bug in addparent")
    say "not ok 12 # SKIP - bug in addparent"
    end
ATEIT:

.end

.namespace['Mammal']

.include 'compilers/smop/_accessor.pir'

.sub init_pmc :vtable :method
    .param pmc init_args
  # Iterate over the constructor arguments, calling the accessor for each
    .local pmc iter
    iter = new Iterator, init_args
    iter = 0
  iter_loop:
    unless iter goto iter_end
    $S1 = shift iter
    $P1 = iter[$S1]
    self.$S1($P1)
    goto iter_loop
  iter_end:
.end

.sub tail :method
  .param pmc tail :optional
  .param int got_tail :opt_flag
  .local pmc rv
  rv = self._accessor( "tail", tail, got_tail )
  .return(rv)
.end

.sub eat :method
  .param pmc food
  $S0 = food
  $S1 = 'Munch '
  $S2 = concat $S1, $S0
  .return($S2)
.end

.namespace ['Dog']

.include 'compilers/smop/_accessor.pir'

.sub bark :method
  .param pmc bark :optional
  .param int got_bark :opt_flag
  .local pmc rv
  rv = self._accessor( "bark", bark, got_bark )
  .return(rv)
.end

.sub gobble :method
  .param pmc anything
  $S0 = anything
  $S0 = concat "Gobble ", $S0
  .return($S0)
.end

.sub eat :method
  .param pmc food
  $S0 = self.gobble(food)
  # FIXME - uncomment when failing tests in t/pmc/object-meths.t
  #$P1 = new .Super, self
  #$S1 = $P1.eat(food)
  #$S0 = concat $S0, ", "
  #$S0 = concat $S0, $S1
  .return($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
