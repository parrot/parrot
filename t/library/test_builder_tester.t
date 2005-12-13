#!./parrot

.sub _main @MAIN
	load_bytecode 'library/Test/Builder/Tester.pir'

	.local int tb_type
	find_type tb_type, 'Test::Builder'

	.local pmc tb_args
	tb_args = new .Hash

	.local pmc test
	test = new tb_type, tb_args

	.local pmc plan
	.local pmc test_pass
	.local pmc test_fail
	.local pmc test_out
	.local pmc test_diag
	.local pmc test_test
	plan      = find_global 'Test::Builder::Tester', 'plan'
	test_pass = find_global 'Test::Builder::Tester', 'test_pass'
	test_fail = find_global 'Test::Builder::Tester', 'test_fail'
	test_out  = find_global 'Test::Builder::Tester', 'test_out'
	test_diag = find_global 'Test::Builder::Tester', 'test_diag'
	test_test = find_global 'Test::Builder::Tester', 'test_test'

	plan( 12 )

	test_out( 'ok 1 - hi' )
	test.'ok'( 1, 'hi' )
	test_test( 'passing test')

	test_out( 'not ok 2 - bye' )
	test.'ok'( 0, 'bye' )
	test_test( 'failing test')

	test_out( 'ok 3 - A message' )
	test_diag( "some\nlines" )
	test.ok( 1, 'A message' )
	test.diag( 'some' )
	test.diag( 'lines' )
	test_test( 'passing test with diagnostics' )

	test_out( 'not ok 4 - another message' )
	test.ok( 0, 'another message' )
	test.diag( "many\nmany\nlines" )
	test_diag( 'many' )
	test_diag( 'many' )
	test_diag( 'lines' )
	test_test( 'failing test with diagnostics' )

	test_out( 'not ok 5 #skip just one skip' )
	test.skip( 1, 'just one skip' )
	test_test( 'single skip' )

	test_out( 'not ok 6 #skip three skips' )
	test_out( 'not ok 7 #skip three skips' )
	test_out( 'not ok 8 #skip three skips' )
	test.skip( 3, 'three skips' )
	test_test( 'multiple skips' )

	test_out( 'not ok 9 # TODO some todo test' )
	test.todo( 0, 'some todo test' )
	test_test( 'failing todo test' )

	test_out( 'ok 10 # TODO another todo test' )
	test.todo( 1, 'another todo test' )
	test_test( 'passing todo test' )

	test_pass()
	test.ok( 1 )
	test_test( 'passing test with no description' )

	test_pass( 'my description' )
	test.ok( 1, 'my description' )
	test_test( 'passing test with a description' )

	test_fail()
	test.ok( 0 )
	test_test( 'failing test with no description' )

	test_fail( 'failing description' )
	test.ok( 0, 'failing description' )
	test_test( 'failing test with description' )

	test.'finish'()
.end
