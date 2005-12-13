#!./parrot

.sub _main @MAIN
	load_bytecode 'library/Test/Builder/Tester.pir'
	load_bytecode 'library/Test/More.pir'

	.local int tb_type
	find_type tb_type, 'Test::Builder'

	.local pmc tb_args
	tb_args = new .Hash

	.local pmc test
	test = new tb_type, tb_args

	.local pmc plan
	.local pmc test_pass
	.local pmc test_fail
	.local pmc test_diag
	.local pmc test_test
	.local pmc ok
	.local pmc is
	plan      = find_global 'Test::Builder::Tester', 'plan'
	test_pass = find_global 'Test::Builder::Tester', 'test_pass'
	test_fail = find_global 'Test::Builder::Tester', 'test_fail'
	test_diag = find_global 'Test::Builder::Tester', 'test_diag'
	test_test = find_global 'Test::Builder::Tester', 'test_test'
	ok        = find_global 'Test::More',            'ok'
	is        = find_global 'Test::More',            'is'

	plan( 20 )

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

	test.'finish'()
.end
