#!./parrot

.macro IMPORT ( lib, subname )
	import_sub = find_global .lib, .subname
	store_global .subname, import_sub
.endm

.sub _main :main
	load_bytecode 'library/Test/Builder/Tester.pir'
	load_bytecode 'library/Test/More.pir'

	.local int tb_type
	find_type tb_type, 'Test::Builder'

	.local pmc tb_args
	tb_args = new .Hash

	.local pmc test
	test = new tb_type, tb_args

	.local pmc import_sub
	.IMPORT( 'Test::More', 'ok' )
	.IMPORT( 'Test::More', 'is' )
	.IMPORT( 'Test::More', 'diag' )
	.IMPORT( 'Test::More', 'like' )
	.IMPORT( 'Test::More', 'is_deeply' )
	.IMPORT( 'Test::Builder::Tester', 'plan' )
	.IMPORT( 'Test::Builder::Tester', 'test_diag' )
	.IMPORT( 'Test::Builder::Tester', 'test_fail' )
	.IMPORT( 'Test::Builder::Tester', 'test_pass' )
	.IMPORT( 'Test::Builder::Tester', 'test_test' )

	plan( 42 )
	test_ok()
	test_is()
	test_like()
	test_is_deeply()
	test_diagnostics()

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
	test_diag( 'Received: -100' )
	test_diag( 'Expected: 200' )
	is( -100, 200 )
	test_test( 'failing test is() for ints')

	test_pass( 'comparing two integers' )
	is( 512, 512, 'comparing two integers' )
	test_test( 'passing test is() for ints with description')

	test_fail( 'comparing two integers' )
	is( -512, 5120, 'comparing two integers' )
	test_diag( 'Received: -512' )
	test_diag( 'Expected: 5120' )
	test_test( 'failing test is() for ints with description')

	test_pass()
	is( 6.5, 6.5 )
	test_test( 'passing test is() for floats')

	test_fail()
	is( 1.235, 5.321 )
	test_diag( 'Received: 1.235' )
	test_diag( 'Expected: 5.321' )
	test_test( 'failing test is() for floats')

	test_pass( 'comparing two floats' )
	is( 80.80, 80.80, 'comparing two floats' )
	test_test( 'passing test is() for floats with description')

	test_fail( 'comparing two floats' )
	is( 777.1, 888.8, 'comparing two floats' )
	test_diag( 'Received: 777.1' )
	test_diag( 'Expected: 888.8' )
	test_test( 'failing test is() for floats with description')

	test_pass()
	is( 'bob', 'bob' )
	test_test( 'passing test is() for strings')

	test_fail()
	is( 'larry', 'bob' )
	test_diag( 'Received: larry' )
	test_diag( 'Expected: bob' )
	test_test( 'failing test is() for strings')

	test_pass( 'comparing two strings' )
	is( 'larry', 'larry', 'comparing two strings' )
	test_test( 'passing test is() for strings with description')

	test_fail( 'comparing two strings' )
	is( 'zeke', 'zelda', 'comparing two strings' )
	test_diag( 'Received: zeke' )
	test_diag( 'Expected: zelda' )
	test_test( 'failing test is() for strings with description')

	.local pmc left
	.local pmc right
	left  = new .String
	right = new .String
	left  = 'zero'
	right = 'zero'

	test_pass()
	is( left, right )
	test_test( 'passing test is() for pmcs')

	right = new .Integer
	right = 0
	test_fail()
	test_diag( 'Received: zero' )
	test_diag( 'Expected: 0' )
	is( left, right )
	test_test( 'failing test is() for pmcs')

	left = '0'
	test_pass( 'comparing two pmcs' )
	is( left, right, 'comparing two pmcs' )
	test_test( 'passing test is() for pmcs with description')

	right = new .Hash

	.local string expected
	.local string hash_string
	expected     = 'Expected: '
	hash_string  = right
	expected    .= hash_string

	test_fail( 'comparing two pmcs' )
	test_diag( 'Received: 0' )
	test_diag( expected )
	is( left, right, 'comparing two pmcs' )
	test_test( 'failing test is() for pmcs with description')
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
	left  = new .ResizablePMCArray
	right = new .ResizablePMCArray

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

	left  = new .Hash
	right = new .Hash

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

	left  = new .Hash
	right = new .Hash

	.local pmc left_array
	.local pmc right_array
	left_array  = new .Array
	left_array  = 3
	right_array = new .Array
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
