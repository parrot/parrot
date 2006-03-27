=head1 NAME

Test::More - Parrot extension for testing modules

=head1 SYNOPSIS

	# load this library
	load_bytecode 'library/Test/More.pir'

	# get the testing functions
	.local pmc plan
	.local pmc ok
	.local pmc is

	plan = find_global 'Test::More', 'plan'
	ok   = find_global 'Test::More',   'ok'
	is   = find_global 'Test::More',   'is'

	# set a test plan
	plan( 10 )

	# run your tests
	ok( 1 )
	ok( 0, 'failing test with diagnostic' )

	is( 100, 100 )
	is( 200, 100, 'failing integer compare with diagnostic' )

	is( 1.001, 1.001, 'passing float compare with diagnostic' )
	is( 8.008, 4.004 )

	is( 'foo', 'foo', 'passing string compare with diagnostic' )
	is( 'foo', 'bar', 'failing string compare with diagnostic' )

	is( some_pmc, another_pmc, 'pmc comparison uses "eq" op' )

=head1 DESCRIPTION

C<Test::More> is a pure-Parrot library for testing modules.  It provides the
C<ok()> and C<is()> functions for you.  It uses C<Test::Builder>, a simple,
single backend for multiple test modules to use within your tests.

=head1 FUNCTIONS

This class defines the following functions:

=over 4

=cut

.namespace [ 'Test::More' ]

.sub _initialize :load
	load_bytecode 'library/Test/Builder.pir'

	.local pmc test
	.local int test_type

	find_type test_type, 'Test::Builder'
	test = new test_type

	store_global 'Test::More', '_test', test
.end

=item C<plan( number_or_no_plan )>

Declares the number of tests you plan to run, either an integer greater than
zero or the string C<no_plan>.  This will throw an exception if you have
already declared a plan or if you pass an invalid argument.

=cut

.sub plan
	.param string tests

	.local pmc test
	find_global test, 'Test::More', '_test'
	test.plan( tests )
.end

=item C<ok( passed, description )>

Records a test as pass or fail depending on the truth of the integer C<passed>,
recording it with the optional test description in C<description>.

=cut

.sub ok
	.param int    passed
	.param string description     :optional

	.local pmc test
	find_global test, 'Test::More', '_test'

	test.ok( passed, description )
.end

=item C<is( left, right, description )>

Compares the parameters passed as C<left> and C<right>, passing if they are
equal and failing otherwise.  This will report the results with the optional
test description in C<description>.

This is a multi-method, with separate implementations for int-int, float-float,
string-string, and PMC-PMC comparisons.  The latter uses the C<eq> opcode for
comparison.

This probably doesn't handle all of the comparisons you want, but it's easy to
add more.

=cut

.sub is :multi( int, int )
	.param int    left
	.param int    right
	.param string description :optional

	.local pmc test
	find_global test, 'Test::More', '_test'

	.local int pass
	pass       = 0

	eq left, right, PASS
	goto REPORT

  PASS:
	pass = 1

  REPORT:
	test.ok( pass, description )
	if pass goto DONE

	.local string diagnostic
	.local string l_string
	.local string r_string

	l_string    = left
	r_string    = right

	diagnostic = make_diagnostic( l_string, r_string )
	test.diag( diagnostic )
  DONE:
.end

.sub is :multi( float, float )
	.param float  left
	.param float  right
	.param string description :optional

	.local pmc test
	find_global test, 'Test::More', '_test'

	.local int pass
	pass = 0

	eq left, right, PASS
	goto REPORT

  PASS:
	pass = 1

  REPORT:
	test.ok( pass, description )
	if pass goto DONE

	.local string diagnostic
	.local string l_string
	.local string r_string

	l_string    = left
	r_string    = right

	diagnostic = make_diagnostic( l_string, r_string )
	test.diag( diagnostic )
  DONE:
.end

.sub is :multi( string, string )
	.param string left
	.param string right
	.param string description :optional

	.local pmc test
	find_global test, 'Test::More', '_test'

	.local int pass
	pass = 0

	eq left, right, PASS
	goto REPORT

  PASS:
	pass = 1

  REPORT:
	test.ok( pass, description )
	if pass goto DONE

	.local string diagnostic
	.local string l_string
	.local string r_string

	l_string    = left
	r_string    = right

	diagnostic = make_diagnostic( l_string, r_string )
	test.diag( diagnostic )
  DONE:
.end

.sub is :multi()
	.param pmc    left
	.param pmc    right
	.param string description :optional

	.local pmc test
	find_global test, 'Test::More', '_test'

	.local int pass
	pass = 0

	eq left, right, PASS
	goto REPORT

  PASS:
	pass = 1

  REPORT:
	test.ok( pass, description )
	if pass goto DONE

	.local string diagnostic
	.local string l_string
	.local string r_string

	l_string    = left
	r_string    = right

	diagnostic = make_diagnostic( l_string, r_string )
	test.diag( diagnostic )
  DONE:
.end

.sub diag
	.param string diagnostic

	.local pmc test
	find_global test, 'Test::More', '_test'
	test.diag( diagnostic )
.end

.sub make_diagnostic
	.param string received
	.param string expected
	.local string diagnostic

	diagnostic  = 'Received: '
	diagnostic .= received
	diagnostic .= "\nExpected: "
	diagnostic .= expected

	.return( diagnostic )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
the Perl 6 port he wrote, based on the original Perl 5 version he wrote with
ideas from Michael G. Schwern.  Please send patches, feedback, and suggestions
to the Perl 6 internals mailing list.

=head1 COPYRIGHT

Copyright (c) 2005, the Perl Foundation.

=cut
