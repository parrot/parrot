#!./parrot

.macro IMPORT ( lib, subname, TEMP )
	.TEMP = find_global .lib, .subname
	store_global .subname, .TEMP
.endm

.sub _main :main
    load_bytecode 'library/Test/More.pir'
    load_bytecode 'compilers/smop/Class.pir'
    load_bytecode 'compilers/smop/Attribute.pir'

    .local pmc _
    .IMPORT( 'Test::More', 'plan', _ )
    .IMPORT( 'Test::More', 'ok',   _ )
    .IMPORT( 'Test::More', 'is',   _ )

    plan( 10 )

    .local pmc class, init_args, init_attribs
    init_args = new Hash
    init_attribs = new Hash
    init_attribs['ear'] = 'Str'
    init_attribs['tail'] = 'Str'
    init_args['name'] = 'Dog'
    init_args['attributes'] = init_attribs

    class = new 'Class', init_args # equiv to newclass 'Dog'

    $P1 = class.name()
    is($P1, "Dog", "created a new Class")
    $P1 = class.name()
    is($P1, "Dog", "Class accessor doesn't destroy value")

    class.add_attribute('bark')
    .local pmc attributes
    attributes = class.'attributes'()
    $I0 = exists attributes['bark']
    ok($I0, "added attribute to the class")

    $I0 = exists attributes['tail']
    ok($I0, "added second attribute to the class")
    unless $I0 goto no_tail_attribute
    $P1 = attributes['tail']
    $S1 = $P1.type()
    is($S1,'Str', "tail attribute has a value")
    goto end_tail_attrib_test
  no_tail_attribute:
    fail("tail attribute doesn't exist")
  end_tail_attrib_test:


    $P0 = find_class('Dog')
    $I0 = issame $P0, class
    ok($I0, "find_class can find the class")

    $P0 = class.'new'( 'bark' => "Wooof", 'tail' => 'long' )
    $P1 = getattribute $P0, "tail"
    $I0 = defined $P1
    ok($I0, "got back a tail attribute object")
    unless $I0 goto SKIPTAIL
    is($P1, "long", "tail attribute has expected value")
    goto NEXTTAIL
SKIPTAIL:	
    fail("SKIP - no attribute")
NEXTTAIL:	

    $P1 = getattribute $P0, "bark"
    $I0 = defined $P1
    ok($I0, "got back a bark attribute object")
    unless $I0 goto SKIP
    is($P1, "Wooof", "bark attribute has expected value")
    goto NEXT
SKIP:	
    fail("SKIP - no attribute")
NEXT:	

.end

.namespace['Dog']

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

.sub bark :method
  .param pmc bark :optional
  .param int got_bark :opt_flag
  .local pmc rv
  rv = self._accessor( "bark", bark, got_bark )
  .return(rv)
.end

.sub tail :method
  .param pmc tail :optional
  .param int got_tail :opt_flag
  .local pmc rv
  rv = self._accessor( "tail", tail, got_tail )
  .return(rv)
.end
