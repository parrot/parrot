#!./parrot
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/library/p6object.t -- P6object tests

=head1 SYNOPSIS

    % prove t/library/p6object.t

=head1 DESCRIPTION

=cut

.sub 'main' :main
    load_bytecode 'library/Test/More.pbc'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace ['Test';'More']
    exports        = split ' ', 'plan diag ok nok is isa_ok'

    test_namespace.'export_to'(curr_namespace, exports)

    ##  set our plan
    .local int plan_tests
    plan(106)

    ##  make sure we can load the P6object library
    push_eh load_failed
    load_bytecode 'P6object.pbc'
    pop_eh
    ok(1, 'load_bytecode')

    ##  test the P6metaclass protoobject itself
    .local pmc metaproto
    metaproto = get_hll_global 'P6metaclass'
    isa_ok(metaproto, 'P6metaclass', 'P6metaclass protoobject')
    isa_ok(metaproto, 'P6protoobject', 'P6metaclass protoobject')
    $P0 = metaproto.'WHAT'()
    $I0 = issame metaproto, $P0
    ok($I0, 'P6metaclass.WHAT identity')
    $S0 = metaproto
    is($S0, 'P6metaclass', 'P6metaclass.WHAT eq "P6metaclass"')
    $S0 = typeof metaproto
    is($S0, 'P6metaclass', 'typeof P6metaclass proto eq "P6metaclass"')
    $P0 = metaproto.'HOW'()
    isa_ok($P0, 'P6metaclass', 'P6metaclass.HOW()')
    $I0 = defined metaproto
    nok($I0, 'P6metaclass protoobject undefined')

    ##  register an existing PMCProxy-based class
    .local pmc hashproto
    $P0 = metaproto.register('Hash')
    hashproto = get_hll_global 'Hash'
    $I0 = issame hashproto, $P0
    ok($I0, 'Hash proto =:= return value from .register()')
    isa_ok(hashproto, 'Hash', 'Hash proto')
    isa_ok(hashproto, 'P6protoobject', 'Hash proto')
    $P0 = hashproto.'WHAT'()
    $I0 = issame hashproto, $P0
    ok($I0, 'Hash proto .WHAT identity')
    $S0 = hashproto
    is($S0, 'Hash', 'Hash.WHAT eq "Hash"')
    $S0 = typeof hashproto
    is($S0, 'Hash', 'typeof Hash proto eq "Hash"')
    $P0 = hashproto.'HOW'()
    isa_ok($P0, 'P6metaclass', 'Hash proto .HOW')
    $I0 = defined metaproto
    nok($I0, 'Hash proto undefined')

    ##  instantiate from the Hash protoobject
    .local pmc hash
    hash = hashproto.'new'()
    isa_ok(hash, 'Hash', 'return from Hash.new()')
    $I0 = isa hash, 'P6object'
    nok($I0, 'hash object not isa P6object')
    $I0 = isa hash, 'P6protoobject'
    nok($I0, 'hash object not isa P6protoobject')
    ##  verify that it really is a Hash (PMCProxy) and not some subclass
    $P0 = typeof hash
    $S0 = typeof $P0
    is($S0, 'PMCProxy', 'hash object class is PMCProxy')
    $S0 = typeof hash
    is($S0, 'Hash', 'typeof hash object eq "Hash"')
    $P0 = hash.'WHAT'()
    $I0 = issame hashproto, $P0
    ok($I0, 'hash object .WHAT =:= Hash proto')
    $P0 = hash.'HOW'()
    $P1 = hashproto.'HOW'()
    $I0 = issame $P0, $P1
    ok($I0, 'hash object .HOW =:= Hash proto .HOW')
    $I0 = defined hash
    ok($I0, 'hash object defined')
    $I0 = can hash, 'new'
    nok($I0, 'hash .new method undefined')

    ##  create a new standalone class (derived from P6object)
    .local pmc abcproto
    $P0 = metaproto.'new_class'('ABC')
    abcproto = get_hll_global 'ABC'
    $I0 = issame abcproto, $P0
    ok($I0, 'ABC proto =:= return value from .new_class()')
    isa_ok(abcproto, 'ABC', 'ABC proto')
    isa_ok(abcproto, 'P6object', 'ABC proto')
    isa_ok(abcproto, 'P6protoobject', 'ABC proto')
    $P0 = abcproto.'WHAT'()
    $I0 = issame abcproto, $P0
    ok($I0, 'ABC proto .WHAT identity')
    $S0 = abcproto
    is($S0, 'ABC', 'ABC.WHAT eq "ABC"')
    $S0 = typeof abcproto
    is($S0, 'ABC', 'typeof ABC proto eq "ABC"')
    $P0 = abcproto.'HOW'()
    isa_ok($P0, 'P6metaclass', 'ABC proto .HOW')
    $I0 = $P0.'can'('foo')
    ok($I0, "ABC.HOW.can('foo')")
    $I0 = $P0.'can'('bar')
    nok($I0, "ABC.HOW.can('bar')")
    $I0 = defined metaproto
    nok($I0, 'ABC proto undefined')

    ##  try the default .new method on ABC protoobject
    .local pmc abc
    abc = abcproto.'new'()
    isa_ok(abc, 'ABC', 'return from ABC.new()')
    isa_ok(abc, 'P6object', 'return from ABC.new()')
    $I0 = isa abc, 'P6protoobject'
    nok($I0, 'hash object not isa P6protoobject')
    $P0 = abc.'WHAT'()
    $I0 = issame abcproto, $P0
    ok($I0, 'abc object .WHAT =:= ABC proto')
    $S0 = typeof $P0
    is($S0, 'ABC', 'typeof ABC object eq "ABC"')
    $P0 = abc.'HOW'()
    $P1 = abcproto.'HOW'()
    $I0 = issame $P0, $P1
    ok($I0, 'abc.HOW =:= ABC.HOW')
    $I0 = defined abc
    ok($I0, 'abc defined')
    $I0 = can abc, 'new'
    nok($I0, 'abc .new method undefined')

    ##  use P6metaclass to create a subclass of ABC
    .local pmc defproto
    $P0 = metaproto.'new_class'('DEF', 'parent'=>'ABC')
    defproto = get_hll_global 'DEF'
    $I0 = issame defproto, $P0
    ok($I0, 'DEF proto =:= return value from .new_class()')
    isa_ok(defproto, 'DEF', 'DEF proto')
    isa_ok(defproto, 'ABC', 'DEF proto')
    isa_ok(defproto, 'P6object', 'DEF proto')
    isa_ok(defproto, 'P6protoobject', 'DEF proto')
    $P0 = defproto.'WHAT'()
    $I0 = issame defproto, $P0
    ok($I0, 'DEF proto .WHAT identity')
    $S0 = defproto
    is($S0, 'DEF', 'DEF.WHAT eq "DEF"')
    $P0 = defproto.'HOW'()
    isa_ok($P0, 'P6metaclass', 'DEF proto .HOW')
    $I0 = defined defproto
    nok($I0, 'DEF proto undefined')

    ##  create a DEF object
    .local pmc def
    def = defproto.'new'()
    isa_ok(def, 'DEF', 'return from DEF.new()')
    isa_ok(def, 'ABC', 'return from DEF.new()')
    isa_ok(def, 'P6object', 'return from DEF.new()')
    $I0 = isa def, 'P6protoobject'
    nok($I0, 'def object not isa P6protoobject')
    $P0 = def.'WHAT'()
    $I0 = issame defproto, $P0
    ok($I0, 'def object .WHAT =:= DEF proto')
    $P0 = def.'HOW'()
    $P1 = defproto.'HOW'()
    $I0 = issame $P0, $P1
    ok($I0, 'def.HOW =:= DEF.HOW')
    $I0 = defined def
    ok($I0, 'def defined')
    $I0 = can def, 'new'
    nok($I0, 'def .new method undefined')

    ##  check that 'new' method in class overrides P6protoobject::new
    .local pmc ghiproto
    ghiproto = metaproto.'new_class'('GHI')
    $P0 = ghiproto.'new'()
    is($P0, 'GHI::new', 'GHI::new overrides P6protoobject::new')

    ##  check that 'new' method in subclass overrides P6protoobject::new
    .local pmc ghi2proto
    ghi2proto = metaproto.'new_class'('GHI2', 'parent'=>ghiproto)
    $P0 = ghi2proto.'new'()
    is($P0, 'GHI::new', 'GHI::new overrides P6protoobject::new (in subclass)')

    ##  create MyInt subclass from Integer PMC class
    .local pmc myintproto
    $P0 = metaproto.'new_class'('MyInt', 'parent'=>'Integer')
    myintproto = get_hll_global 'MyInt'
    $I0 = issame myintproto, $P0
    ok($I0, 'MyInt proto =:= return value from .new_class()')
    isa_ok(myintproto, 'MyInt', 'MyInt proto')
    isa_ok(myintproto, 'Integer', 'MyInt proto')
    isa_ok(myintproto, 'P6object', 'MyInt proto')
    isa_ok(myintproto, 'P6protoobject', 'MyInt proto')

    ##  test MyInt objects
    .local pmc myint
    myint = myintproto.'new'()
    isa_ok(myint, 'MyInt', 'return from MyInt.new()')
    isa_ok(myint, 'Integer', 'return from MyInt.new()')
    isa_ok(myint, 'P6object', 'return from MyInt.new()')
    $I0 = isa myint, 'P6protoobject'
    nok($I0, 'myint object not isa P6protoobject')
    $P0 = myint.'WHAT'()
    $I0 = issame myintproto, $P0
    ok($I0, 'myint object .WHAT =:= MyInt proto')

    ##  map Integer objects to MyInt
    .local pmc integerproto
    metaproto.'register'('Integer', 'protoobject'=>myintproto)
    integerproto = get_hll_global 'Integer'
    $I0 = issame integerproto, myintproto
    ok($I0, 'Integer proto =:= MyInt proto')
    .local pmc integer
    integer = new 'Integer'
    $S0 = typeof integer
    is($S0, 'Integer', 'Integer object creation')
    $P0 = integer.'WHAT'()
    $I0 = issame $P0, myintproto
    ok($I0, 'integer object .WHAT =:= MyInt proto')
    $S0 = integer.'WHAT'()
    is($S0, 'MyInt', 'integer.WHAT() eq "MyInt"')
    $P0 = integer.'HOW'()
    $P1 = myintproto.'HOW'()
    $I0 = issame $P0, $P1
    ok($I0, 'integer.HOW() =:= MyInt.HOW()')

    ##  create a class with attributes
    .local pmc jklproto, jkl
    jklproto = metaproto.'new_class'('JKL', 'attr'=>'$a $b')
    jkl = jklproto.'new'()
    $P0 = new 'Integer'
    setattribute jkl, '$a', $P0
    setattribute jkl, '$b', $P0
    $P0 = 1
    $P1 = getattribute jkl, '$a'
    ok($P1, 'attribute $a creation')
    $P1 = getattribute jkl, '$b'
    ok($P1, 'attribute $b creation')

    ##  create a class with multiple parent classes
    .local pmc mnoproto, mno
    metaproto.'new_class'('MNO', 'parent'=>'Float ABC')
    mnoproto = get_hll_global 'MNO'
    isa_ok(mnoproto, 'Float', 'MNO proto')
    isa_ok(mnoproto, 'ABC', 'MNO proto')
    isa_ok(mnoproto, 'P6object', 'MNO proto')
    isa_ok(mnoproto, 'P6protoobject', 'MNO proto')
    mno = mnoproto.'new'()
    isa_ok(mno, 'Float', 'MNO object')
    isa_ok(mno, 'ABC', 'MNO object')
    isa_ok(mno, 'P6object', 'MNO object')
    $I0 = isa mno, 'P6protoobject'
    nok($I0, 'MNO object not isa P6protoobject')

    ##  create a subclass from a protoobject reference
    .local pmc pqrproto, pqr
    metaproto.'new_class'('PQR', 'parent'=>mnoproto)
    pqrproto = get_hll_global 'PQR'
    isa_ok(pqrproto, 'PQR', 'PQR proto')
    isa_ok(pqrproto, 'MNO', 'PQR proto')
    isa_ok(pqrproto, 'Float', 'PQR proto')

    ##  use the :name option to set a class name
    .local pmc p6objproto, p6obj
    metaproto.'new_class'('Perl6Object', 'name'=>'Object')
    p6objproto = get_hll_global 'Object'
    isa_ok(p6objproto, 'Perl6Object', 'Object proto')
    isa_ok(p6objproto, 'P6object', 'Object proto')
    isa_ok(p6objproto, 'P6protoobject', 'Object proto')
    $S0 = p6objproto
    is($S0, 'Object', 'Object.WHAT eq "Object"')
    $P0 = get_hll_global 'Perl6Object'
    $I0 = isa $P0, 'P6protoobject'
    nok($I0, "Didn't store proto into Perl6Object")
    p6obj = p6objproto.'new'()
    isa_ok(p6obj, 'Perl6Object', 'Object instance')
    $P0 = p6obj.'WHAT'()
    $I0 = issame $P0, p6objproto
    ok($I0, 'obj.WHAT =:= Object.WHAT')

    ## make sure it works for array-based names
    .local pmc stuproto
    $P0 = split '::', 'Foo::STU'
    $P0 = metaproto.'new_class'($P0)
    stuproto = get_hll_global ['Foo'], 'STU'
    $I0 = issame stuproto, $P0
    ok($I0, 'Foo::STU proto =:= return value from .new_class()')
    $P0 = get_class ['Foo';'STU']
    isa_ok(stuproto, $P0, 'Foo::STU proto')
    isa_ok(stuproto, 'P6object', 'Foo::STU proto')
    isa_ok(stuproto, 'P6protoobject', 'Foo::STU proto')
    $P0 = stuproto.'WHAT'()
    $I0 = issame stuproto, $P0
    ok($I0, 'Foo::STU proto .WHAT identity')
    $S0 = stuproto
    is($S0, 'STU', 'Foo::STU.WHAT eq "STU"')
    $P0 = stuproto.'HOW'()
    isa_ok($P0, 'P6metaclass', 'Foo::STU proto .HOW')
    $I0 = defined stuproto
    nok($I0, 'Foo::STU proto undefined')

    .return ()
  load_failed:
    ok(0, "load_bytecode 'P6object.pir' failed -- skipping tests")
    .return ()
.end


.namespace ['ABC']
.sub 'foo' :method
    .return ('ABC::foo')
.end


.namespace ['GHI']
.sub 'new' :method
    .return ('GHI::new')
.end
