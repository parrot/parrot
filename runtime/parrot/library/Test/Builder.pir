=head1 NAME

Test::Builder - Parrot extension for building test modules

=head1 SYNOPSIS

	# load this library
	load_bytecode 'library/Test/Builder.pir'

	# create a new Test::Builder object
	.local pmc test
	.local int test_type

	find_type test_type, 'Test::Builder'
	test = new test_type

	# plan to run ten tests
	test.'plan'( 10 )

	test.'ok'( 1, 'some test description' )
	test.'ok'( 0, 'some test description' )
	test.'diag'( 'the last test failed on purpose!' )

	test.'skip'( 3, 'do not run these three tests' )
	test.'todo'( 1, 'this is a todo test that passes', 'i am not sure' )
	test.'todo'( 0, 'this is a todo test that fails', ' i am still not sure' )

	test.'skip'( 4, 'cannot think of four more tests' )

	# you must call this when you have finished!
	test.'finish'()

=head1 DESCRIPTION

Test::Builder is a pure-Parrot library for building test modules.  It manages
test plans, formats and reports test results correctly, and has methods to
manage passing, failing, skip, and TODO tests.  It provides a simple, single
backend for multiple test modules to use within your tests.

=head1 METHODS

This class defines the following methods:

=over 4

=cut

.namespace [ 'Test::Builder' ]

.sub _initialize @LOAD
	load_bytecode 'library/Test/Builder/Test.pir'
	load_bytecode 'library/Test/Builder/Output.pir'
	load_bytecode 'library/Test/Builder/TestPlan.pir'

	.local pmc tb_class

	newclass     tb_class, 'Test::Builder'
	addattribute tb_class, 'output'
	addattribute tb_class, 'testplan'
	addattribute tb_class, 'results'

	.local pmc single
	single = new .Undef

	store_global 'Test::Builder::_singleton', 'singleton', single
.end

=item C<new( args_hash )>

Given an optional C<Hash> of arguments, initializes the new object with the
provided arguments.  By default, you should rarely need to pass any arguments.
If you do, you know why.  The two allowed arguments are:

=over 4

=item C<testplan>

An object that C<does> C<Test::Builder::TestPlan> to manage the plan for this
test run.

=item C<output>

An object that does C<Test::Builder::Output> to manage the output for this test
run.

=back

C<new()> will not always return the I<same> object, but every object will share
the same state.

=cut

.sub __fake_init method
.end

.sub __init method
	.param pmc args
	.local pmc output
	.local pmc testplan
	.local pmc results

	(output, testplan, results) = self.'_assign_default_args'( args )
	self.'_assign_args'( output, testplan, results )
.end

.sub _assign_args method
	.param pmc output
	.param pmc testplan
	.param pmc results

	.local int offset
	classoffset offset, self, 'Test::Builder'
	setattribute self, offset, output
	inc offset
	setattribute self, offset, testplan
	inc offset
	setattribute self, offset, results
.end

=item C<create( args_hash )>

Creates and returns a new Test::Builder object with different backend objects.
This probably doesn't work correctly yet, but you will probably never use it.

=cut

.sub create
	.param pmc args

	.local pmc output
	.local pmc testplan
	.local pmc results

	.local int is_defined
	output     = args['output']
	is_defined = defined output
	if is_defined goto OUTPUT_DEFINED

	.local int output_class
	find_type output_class, 'Test::Builder::Output'
	output = new output_class

  OUTPUT_DEFINED:
	is_defined = exists args['testplan']
	unless is_defined goto DEFAULT_TESTPLAN

  	testplan   = args['testplan']
	goto TESTPLAN_DEFINED

  DEFAULT_TESTPLAN:
	testplan   = new .String
	set testplan, ''

  TESTPLAN_DEFINED:

    results    = new .ResizablePMCArray
	.local int test_builder_type

	find_type test_builder_type, 'Test::Builder'
	.local pmc real_init
	.local pmc blank_init
	real_init = find_global 'Test::Builder', '__init'
	blank_init = find_global 'Test::Builder', '__fake_init'
	store_global 'Test::Builder', '__init', blank_init

	.local pmc test
	test       = new test_builder_type
	store_global 'Test::Builder', '__init', real_init

	test.'_assign_args'( output, testplan, results )
	.return( test )
.end

.sub _assign_default_args method
	.param pmc args

	.local pmc single
	single = find_global 'Test::Builder::_singleton', 'singleton'

	.local pmc output
	.local pmc testplan
	.local pmc results
	.local int is_defined

	# try for the global first
	is_defined = isa single, 'Test::Builder'
	unless is_defined goto CREATE_ATTRIBUTES

	output   = single.'output'()
	testplan = single.'testplan'()
	results  = single.'results'()

	goto RESULTS_DEFINED

  CREATE_ATTRIBUTES:
	# now look in the args hash
	is_defined = exists args['output']
	unless is_defined goto CREATE_OUTPUT
	output     = args['output']
	goto OUTPUT_DEFINED

  CREATE_OUTPUT:
	# create a Test::Builder::Output object
	.local int output_type
	find_type  output_type, 'Test::Builder::Output'

	.local pmc args_hash
	args_hash  = new Hash
	output     = new output_type, args_hash

  OUTPUT_DEFINED:
	# now try in the args hash
	is_defined = exists args['testplan']
	unless is_defined goto CREATE_TESTPLAN
	testplan = args['testplan']
	goto TESTPLAN_DEFINED

  CREATE_TESTPLAN:
	testplan   = new .String
	set testplan, 'global_testplan'

  TESTPLAN_DEFINED:
  	is_defined = defined results
	if is_defined goto RESULTS_DEFINED
	results    = new .ResizablePMCArray

	# store this as the singleton
	store_global 'Test::Builder::_singleton', 'singleton', self

  RESULTS_DEFINED:
	.return( output, testplan, results )
.end

.sub output method
	.local pmc output
	.local int offset

	classoffset offset, self, 'Test::Builder'
	getattribute output, self, offset

	.return( output )
.end

.sub testplan method
	.local pmc testplan
	.local int offset

	classoffset offset, self, 'Test::Builder'
	inc offset
	getattribute testplan, self, offset

	.return( testplan )
.end

.sub results method
	.local pmc output
	.local int offset
	.local pmc results

	classoffset offset, self, 'Test::Builder'
	add offset, 2
	getattribute results, self, offset

	.return( results )
.end

=item C<finish()>

Finishes this test run.  You should call this when you have finished running
all of the tests.  I know this is awful, but this has to be here until object
finalization works reliably.

This is probably not idempotent now, so try not to call it too many times,
where "too many" means "more than one".

=cut

.sub finish method
	.local pmc output
	.local pmc testplan
	.local pmc results

	output   = self.'output'()
	testplan = self.'testplan'()
	results  = self.'results'()

	.local int elements
	elements = results

	.local string footer
	footer   = testplan.'footer'( elements )

	.local int is_defined
	is_defined = length footer
	unless is_defined goto DONE_PRINTING
	output.'write'( footer )

  DONE_PRINTING:

  # XXX - delete globals
.end

=item C<plan( number_or_no_plan )>

Tells the object how many tests to run, either an integer greater than zero or
the string C<no_plan>.  This will throw an exception if you have already
declared a plan or if you pass an invalid argument.

=cut

.sub plan method
	.param string explanation
	.param int    tests

	.local pmc testplan
	testplan = self.'testplan'()

	.local int vivify_global_testplan
	.local int is_defined

	.local int is_equal
	.local int is_plan

	is_plan = isa testplan, 'Test::Builder::TestPlan'
	eq is_plan, 1, CHECK_REPLAN
	eq_str testplan, 'global_testplan', SET_GLOBAL_TESTPLAN
	goto CHECK_REPLAN

  SET_GLOBAL_TESTPLAN:
	vivify_global_testplan = 1
	goto CHECK_TESTNUM

  CHECK_REPLAN:
  	.local int valid_tp
	valid_tp = does testplan, 'Test::Builder::TestPlan'

	unless valid_tp goto CHECK_TESTNUM

	.local pmc plan_exception
	plan_exception = new .Exception
	set   plan_exception['_message'], 'Plan already set!'
	throw plan_exception

  CHECK_TESTNUM:
	unless tests goto CHECK_EXPLANATION

	.local int plan_type
	.local pmc args

	args = new .Hash
	set args['expect'], tests

	find_type plan_type, 'Test::Builder::TestPlan'
	testplan = new plan_type, args
	goto FINISH_PLAN

  CHECK_EXPLANATION:
	eq_str explanation, 'no_plan', PLAN_NULL
	goto PLAN_FAILURE

  PLAN_NULL:
	.local int null_type
	find_type null_type, 'Test::Builder::NullPlan'
	testplan = new null_type
	goto FINISH_PLAN

  PLAN_FAILURE:
	.local pmc plan_exception
	plan_exception = new .Exception
	set   plan_exception['_message'], 'Unknown test plan!'
	throw plan_exception

  FINISH_PLAN:
	unless vivify_global_testplan goto WRITE_HEADER 
	store_global 'Test::Builder::_singleton', 'testplan', testplan

  WRITE_HEADER:
  	.local pmc output
	output = self.'output'()

	.local string header
	header = testplan.'header'()

	.local int offset
	classoffset offset, self, 'Test::Builder'
	inc offset
	setattribute self, offset, testplan
	output.write( header )
.end

=item C<diag( diagnostic_message )>

Records a diagnostic message for output.

=cut

.sub diag method
	.param string diagnostic

	if diagnostic goto DIAGNOSTIC_SET
	.return()

  DIAGNOSTIC_SET:
  	.local pmc output
	output = self.'output'()
	output.'diag'( diagnostic )
.end

=item C<ok( passed, description )>

Records a test as pass or fail depending on the truth of the integer C<passed>,
recording it with the optional test description in C<description>.

=cut

.sub ok method
	.param int    passed
	.param string description

	.local pmc results
	results = self.'results'()

	.local int results_count
	results_count = results
	inc results_count

	.local pmc test_args
	test_args = new .Hash
	set test_args['number'],      results_count
	set test_args['passed'],      passed
	set test_args['description'], description

	self.'report_test'( test_args )

	.return( passed )
.end

=item C<todo( passed, description, reason )>

Records a test as pass or fail based on the truth of the integer C<passed>, but
marks it as TODO so it always appears as a success.  This also records the
optional C<description> of the test and the C<reason> you have marked it as
TODO.

=cut

.sub todo method
	.param int    passed
	.param string description
	.param string reason

	.local pmc results
	results = self.'results'()

	.local int results_count
	results_count = results
	inc results_count

	.local pmc test_args
	test_args = new .Hash
	set test_args['todo'],        1
	set test_args['number'],      results_count
	set test_args['passed'],      passed
	set test_args['reason'],      reason
	set test_args['description'], description

	self.'report_test'( test_args )

	.return( passed )
.end

=item C<skip( number reason )>

Records C<number> of tests as skip tests, using the optional C<reason> to mark
why you've skipped them.

=cut

.sub skip method
	.param int    number
	.param string reason

	if number goto CHECK_REASON
	number = 1

  CHECK_REASON:
    if reason goto SKIP_LOOP
	set reason, 'skipped'

  SKIP_LOOP:
	.local pmc results
	results = self.'results'()

	.local int results_count
	results_count = results

	.local int loop_count
	loop_count = 1

  LOOP:
	inc results_count

	.local pmc test_args
	test_args = new .Hash
	set test_args['number'], results_count
	set test_args['skip'],   1
	set test_args['reason'], reason

	self.'report_test'( test_args )
	inc loop_count
	if loop_count <= number goto LOOP

.end

=item C<skip_all()>

Skips all of the tests in a test file.  You cannot call this if you have a
plan.  This calls C<exit>; there's little point in continuing.

=cut

.sub skip_all method
	.local pmc testplan
	testplan = self.'testplan'()

	unless testplan goto SKIP_ALL

	.local pmc plan_exception
	plan_exception = new .Exception
	set   plan_exception['_message'], 'Cannot skip_all() with a plan!'
	throw plan_exception

  SKIP_ALL:
  	.local pmc output
	output = self.'output'()
	output.'write'( "1..0" )
	exit 0
.end

=item C<BAILOUT( reason )>

Ends the test immediately, giving the string C<reason> as explanation.  This
also calls C<exit>.

=cut

.sub BAILOUT method
	.param string reason

  	.local pmc output
	output  = self.'output'()

	.local string bail_out
	bail_out = 'Bail out!'

	unless reason goto WRITE_REASON
	concat bail_out, '  '
	concat bail_out, reason

  WRITE_REASON:
	output.'write'( bail_out )

	exit 0
.end

.sub report_test method
	.param pmc test_args

	.local pmc testplan
	testplan = self.'testplan'()

	.local int plan_ok
	plan_ok = isa testplan, 'Test::Builder::TestPlan'
	if plan_ok goto CREATE_TEST

	.local pmc plan_exception
	plan_exception = new .Exception
	set   plan_exception['_message'], 'No plan set!'
	throw plan_exception

  CREATE_TEST:
	.local pmc results
	results = self.'results'()

	.local pmc test

	.local pmc number
	number = new Integer
	
	.local int count
	count  = results
	number = count
	inc number

	set test_args['number'], number

	push results, test

	.local pmc tbt_create
	find_global tbt_create, 'Test::Builder::Test', 'create'
	test = tbt_create( test_args )

	.local pmc output
	output = self.'output'()

	.local string report
	report = test.'report'()

	output.'write'( report )
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
