#!./parrot
# Copyright (C) 2005-2008, Parrot Foundation.
# $Id$

.sub _main :main
    load_bytecode 'Test/Builder/Tester.pbc'
    load_bytecode 'Test/More.pbc'

    .local pmc tb_args
    tb_args = new 'Hash'

    .local pmc test
    test = new [ 'Test'; 'Builder' ], tb_args

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Test'; 'More' ]
    exports = split " ", "ok is diag like skip todo is_deeply isa_ok isnt"
    test_namespace.'export_to'(curr_namespace, exports)

    test_namespace = get_namespace [ 'Test'; 'Builder'; 'Tester' ]
    exports = split " ", "plan test_out test_diag test_fail test_pass test_test"
    test_namespace.'export_to'(curr_namespace, exports)

    plan( 74 )

    test_skip()
    test_todo()
    test_ok()
    test_is()
    test_isnt()
    test_like()
    test_is_deeply()
    test_diagnostics()
    test_isa_ok()

    test.'finish'()
.end

.sub test_ok
    test_pass()
    ok( 1 )
    test_test( 'passing test ok()')

    test_fail()
    ok( 0 )
    test_test( 'failing test ok()')

    test_pass( 'with description' )
    ok( 1, 'with description' )
    test_test( 'passing test ok() with description')

    test_fail( 'with description' )
    ok( 0, 'with description' )
    test_test( 'failing test ok() with description')
.end

.sub test_is
    test_pass()
    is( 100, 100 )
    test_test( 'passing test is() for ints')

    test_fail()
    test_diag( 'Have: -100' )
    test_diag( 'Want: 200' )
    is( -100, 200 )
    test_test( 'failing test is() for ints')

    test_pass( 'comparing two integers' )
    is( 512, 512, 'comparing two integers' )
    test_test( 'passing test is() for ints with description')

    test_fail( 'comparing two integers' )
    is( -512, 5120, 'comparing two integers' )
    test_diag( 'Have: -512' )
    test_diag( 'Want: 5120' )
    test_test( 'failing test is() for ints with description')

    test_pass()
    is( 6.5, 6.5 )
    test_test( 'passing test is() for floats')

    test_fail()
    is( 1.235, 5.321 )
    test_diag( 'Have: 1.235' )
    test_diag( 'Want: 5.321' )
    test_test( 'failing test is() for floats')

    test_pass( 'comparing two floats' )
    is( 80.80, 80.80, 'comparing two floats' )
    test_test( 'passing test is() for floats with description')

    test_fail( 'comparing two floats' )
    is( 777.1, 888.8, 'comparing two floats' )
    test_diag( 'Have: 777.1' )
    test_diag( 'Want: 888.8' )
    test_test( 'failing test is() for floats with description')

    test_pass()
    is( 'bob', 'bob' )
    test_test( 'passing test is() for strings')

    test_fail()
    is( 'larry', 'bob' )
    test_diag( 'Have: larry' )
    test_diag( 'Want: bob' )
    test_test( 'failing test is() for strings')

    test_pass( 'comparing two strings' )
    is( 'larry', 'larry', 'comparing two strings' )
    test_test( 'passing test is() for strings with description')

    test_fail( 'comparing two strings' )
    is( 'zeke', 'zelda', 'comparing two strings' )
    test_diag( 'Have: zeke' )
    test_diag( 'Want: zelda' )
    test_test( 'failing test is() for strings with description')

    .local pmc left
    .local pmc right
    left  = new 'String'
    right = new 'String'
    left  = 'zero'
    right = 'zero'

    test_pass()
    is( left, right )
    test_test( 'passing test is() for pmcs')

    right = new 'Integer'
    right = 1
    test_fail( 'zero versus 1' )
    test_diag( 'Have: zero' )
    test_diag( 'Want: 1' )
    is( left, right, 'zero versus 1' )
    test_test( 'failing test is() for pmcs')

    left = '1'
    test_pass( 'comparing two pmcs' )
    is( left, right, 'comparing two pmcs' )
    test_test( 'passing test is() for pmcs with description')

    right = new 'Hash'

    .local string expected
    .local string hash_string
    expected     = 'Want: '
    hash_string  = right
    expected    .= hash_string

    test_fail( 'comparing two pmcs' )
    test_diag( 'Have: 1' )
    test_diag( expected )
    is( left, right, 'comparing two pmcs' )
    test_test( 'failing test is() for pmcs with description')
.end

.sub test_isnt
    test_pass()
    isnt( 100, 200 )
    test_test( 'passing test isnt() for ints')

    test_fail()
    test_diag( 'Have: -100' )
    test_diag( 'Want: not -100' )
    isnt( -100, -100 )
    test_test( 'failing test isnt() for ints')

    test_pass( 'comparing two unidentical integers' )
    isnt( 512, 215, 'comparing two unidentical integers' )
    test_test( 'passing test isnt() for ints with description')

    test_fail( 'comparing two integers' )
    isnt( -512, -512, 'comparing two integers' )
    test_diag( 'Have: -512' )
    test_diag( 'Want: not -512' )
    test_test( 'failing test isnt() for ints with description')

    test_pass()
    isnt( -6.5, 6.5 )
    test_test( 'passing test isnt() for floats')

    test_fail()
    isnt( 1.235, 1.235 )
    test_diag( 'Have: 1.235' )
    test_diag( 'Want: not 1.235' )
    test_test( 'failing test isnt() for floats')

    test_pass( 'comparing two floats' )
    isnt( 777.1, 888.8, 'comparing two floats' )
    test_test( 'passing test isnt() for floats with description')

    test_fail( 'comparing two floats' )
    isnt( 80.8, 80.8, 'comparing two floats' )
    test_diag( 'Have: 80.8' )
    test_diag( 'Want: not 80.8' )
    test_test( 'failing test isnt() for floats with description')

    test_pass()
    isnt( 'bob', 'BoB' )
    test_test( 'passing test isnt() for strings')

    test_fail()
    isnt( 'larry', 'larry' )
    test_diag( 'Have: larry' )
    test_diag( 'Want: not larry' )
    test_test( 'failing test isnt() for strings')

    test_pass( 'comparing two strings' )
    isnt( 'zeke', 'zelda', 'comparing two strings' )
    test_test( 'passing test isnt() for strings with description')

    test_fail( 'comparing two strings' )
    isnt( 'larry', 'larry', 'comparing two strings' )
    test_diag( 'Have: larry' )
    test_diag( 'Want: not larry' )
    test_test( 'failing test isnt() for strings with description')

    .local pmc left
    .local pmc right
    left  = new 'String'
    right = new 'String'
    left  = 'zero'
    right = '0'

    test_pass()
    isnt( left, right )
    test_test( 'passing test isnt() for pmcs')

    right = new 'String'
    right = 'zero'
    test_fail()
    test_diag( 'Have: zero' )
    test_diag( 'Want: not zero' )
    isnt( left, right )
    test_test( 'failing test isnt() for pmcs')

    left = '0'
    test_pass( 'comparing two pmcs' )
    isnt( left, right, 'comparing two pmcs' )
    test_test( 'passing test isnt() for pmcs with description')

    right = new 'Hash'

    .local string expected
    .local string hash_string
    expected     = 'Want: '
    hash_string  = right
    expected    .= hash_string

    test_pass( 'comparing two pmcs' )
    isnt( left, right, 'comparing two pmcs' )
    test_test( 'failing test isnt() for pmcs with description')
.end

.sub test_like
    test_pass()
    like( 'abcdef', '<[c]>' )
    test_test( 'passing test like()' )

    test_pass( 'testing like()' )
    like( 'abcdef', '<[c]>', 'testing like()' )
    test_test( 'passing test like() with description' )

    test_fail()
    test_diag( 'match failed' )
    like( 'abcdef', '<[g]>' )
    test_test( 'failing test like()' )

    test_fail( 'testing like()' )
    test_diag( 'match failed' )
    like( 'abcdef', '<[g]>', 'testing like()' )
    test_test( 'failing test like() with description' )
.end

.sub test_is_deeply
    test_is_deeply_array()
    test_is_deeply_hash()
    test_is_deeply_mismatch()
    test_is_deeply_nested()
.end

.sub test_is_deeply_array
    .local pmc left
    .local pmc right
    left  = new 'ResizablePMCArray'
    right = new 'ResizablePMCArray'

    push left,  7
    push right, 7
    push left,  'seven'
    push right, 'seven'

    test_pass()
    is_deeply( left, right )
    test_test( 'passing test is_deeply() for pmc arrays' )

    test_pass( 'comparing two pmc arrays' )
    is_deeply( left, right, 'comparing two pmc arrays' )
    test_test( 'passing test is_deeply() for pmc arrays with description' )

    push left,  '9 - 2'

    test_fail()
    test_diag( 'Mismatch: expected 3 elements, received 2' )
    is_deeply( left, right )
    test_test( 'failing test is_deeply() for pmc arrays' )

    test_fail( 'comparing two pmc arrays' )
    test_diag( 'Mismatch: expected 3 elements, received 2' )
    is_deeply( left, right, 'comparing two pmc arrays' )
    test_test( 'failing test is_deeply() for pmc arrays with description' )

    push right, '9 - 3'
    test_fail()
    test_diag( 'Mismatch at [2]: expected 9 - 2, received 9 - 3' )
    is_deeply( left, right )
    test_test( 'failing test is_deeply() for item mismatch at position' )

    test_fail( 'comparing mismatch of elements' )
    test_diag( 'Mismatch at [2]: expected 9 - 2, received 9 - 3' )
    is_deeply( left, right, 'comparing mismatch of elements' )
    test_test( 'failing test is_deeply() for item mismatch at position' )
.end

.sub test_is_deeply_hash
    .local pmc left
    .local pmc right

    left  = new 'Hash'
    right = new 'Hash'

    test_pass()
    is_deeply( left, right )
    test_test( 'passing test is_deeply() for empty pmc hashes' )

    test_pass( 'empty hashes match' )
    is_deeply( left, right, 'empty hashes match' )
    test_test( 'passing test is_deeply() for empty pmc hashes with diagnostic' )

    left['foo'] = 1

    test_fail()
    is_deeply( left, right )
    test_diag( 'Mismatch: expected 1 element, received 0' )
    test_test( 'failing is_deeply() for hashes with different numbers of keys' )

    left['bar']  = 1
    right['foo'] = 1

    test_fail( 'more diag' )
    is_deeply( left, right, 'more diag' )
    test_diag( 'Mismatch: expected 2 elements, received 1' )
    test_test( '... with description and proper pluralization' )

    right['bar'] = 2

    test_fail()
    is_deeply( left, right )
    test_diag( 'Mismatch at [bar]: expected 1, received 2' )
    test_test( 'failing is_deeply() for hash with value mismatch' )

    test_fail( '2 is not 1' )
    is_deeply( left, right, '2 is not 1' )
    test_diag( 'Mismatch at [bar]: expected 1, received 2' )
    test_test( '... with description' )
.end

.sub test_is_deeply_mismatch
.end

.sub test_is_deeply_nested
    .local pmc left
    .local pmc right

    left  = new 'Hash'
    right = new 'Hash'

    .local pmc left_array
    .local pmc right_array
    left_array  = new 'Array'
    left_array  = 3
    right_array = new 'Array'
    right_array = 3

    left[  'array' ] = left_array
    right[ 'array' ] = right_array

    left_array[0]  = 1
    right_array[0] = 1

    test_pass()
    is_deeply( left, right )
    test_test( 'Nested data structure equality' )

    test_pass( '... are they equal?' )
    is_deeply( left, right, '... are they equal?' )
    test_test( '... with description' )

    right_array[2] = 2

    test_fail()
    is_deeply( left, right )
    test_diag( 'Mismatch at [array][2]: expected (undef), received 2' )
    test_test( 'Nested data structure inequality' )

    test_fail( '... are they inequal?' )
    is_deeply( left, right, '... are they inequal?' )
    test_diag( 'Mismatch at [array][2]: expected (undef), received 2' )
    test_test( '... with description' )
.end

.sub test_diagnostics
    test_pass()
    ok( 1 )
    diag( 'foo bar baz' )
    test_diag( 'foo bar baz' )
    test_test( 'single line diagnostics' )

    test_pass()
    ok( 1 )
    diag( 'foo bar baz' )
    diag( 'rum tum tugger')
    test_diag( "foo bar baz\nrum tum tugger" )
    test_test( 'multi line diagnostics' )
.end

.sub test_skip

    .local pmc test
    test = new [ 'Test'; 'Builder' ]

    test_out( 'ok 1 #skip skipping' )
    test_out( 'ok 2 #skip skipping' )
    test.'skip'( 2, 'skipping' )
    test_test( 'skip test should pass' )

    test_out( 'ok 3 #skip skipped' )
    skip( 1 )
    test_test( 'skip(int)' )

    test_out( 'ok 4 #skip jumping' )
    skip( "jumping" )
    test_test( 'skip(string)' )

    test_out( 'ok 5 #skip lunch' )
    test_out( 'ok 6 #skip lunch' )
    skip( 2, "lunch" )
    test_test( 'skip(int, string)' )

    test_out( 'ok 7 #skip skipped' )
    skip()
    test_test( 'skip()' )
.end

.sub test_todo

    .local pmc test
    test = new [ 'Test'; 'Builder' ]

    test_out( 'ok 8 # TODO passing test' )
    test.'todo'( 1, 'passing test', 'todo reason' )
    test_test( 'todo test should pass, marked as TODO' )

    test_out( 'not ok 9 # TODO failing test' )
    test.'todo'( 0, 'failing test', 'todo reason' )
    test_test( 'todo test should fail, marked as TODO' )

    test_out( 'ok 10 # TODO passing test' )
    todo( 1, 'passing test', 'todo reason' )
    test_test( 'todo test should pass, marked as TODO' )

    test_out( 'not ok 11 # TODO failing test' )
    todo( 0, 'failing test', 'todo reason' )
    test_test( 'todo test should fail, marked as TODO' )

    test_out( 'not ok 12 # TODO' )
    todo( 0 )
    test_test( 'todo test with no description or reason' )

.end

.sub test_isa_ok
    .local pmc dog, terrier, daschund, Spot, Sossy

    dog = newclass "dog"
    terrier = subclass dog, "terrier"
    daschund = subclass dog, "daschund"

    Spot = new "terrier"
    Sossy = new "daschund"

    test_pass( 'Spot isa terrier' )
    isa_ok(Spot, "terrier", "Spot")
    test_test( 'passing isa_ok for PMC/string (class =)' )

    test_pass( 'Spot isa dog' )
    isa_ok(Spot, "dog", "Spot")
    test_test( 'passing isa_ok for PMC/string (super)')

    test_pass( 'Sossy isa daschund' )
    $P1 = new 'String'
        $P1 = "daschund"
    isa_ok(Sossy, $P1, "Sossy")
    test_test( 'passing isa_ok for PMC/PMC (class =)' )

    test_pass( 'Sossy isa dog' )
    $P2 = new 'String'
        $P2 = "dog"
    isa_ok(Sossy, $P2, "Sossy")
    test_test( 'passing isa_ok for PMC/PMC (super)')

    test_pass( 'The object isa terrier' )
    isa_ok(Spot, "terrier")
    test_test( 'passing isa_ok with no object description (class =)' )

    test_fail( 'Spot isa daschund' )
    test_diag( "Spot isn't a daschund it's a terrier" )
    isa_ok(Spot, 'daschund', "Spot")
    test_test( 'failing test isnt() for PMC/string')

.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
