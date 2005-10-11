=head1 NAME

Test::Builder::TestPlan - class representing the current Test::Builder test plan

=head1 SYNOPSIS

See L<Test::Builder>.

=head1 DESCRIPTION

This class contains the details of the test plan for a test run controlled by
Test::Builder.  You probably will never use this directly.

There are two actually classes here.  Test::Builder::TestPlan represents a plan
with a number -- a plan where you know how many tests you plan to run.
Test::Builder::NullPlan represents a test where you do not know this.

=head1 METHODS

Both classes support the following methods.

=over 4

=cut

.namespace [ 'Test::Builder::TestPlan' ]

.sub _initialize :load
	.local pmc tbtp_class
	newclass     tbtp_class, 'Test::Builder::TestPlan'
	addattribute tbtp_class, 'expect'

	# XXX - can't seem to do this within its own class
	.local pmc tbnp_class
	subclass tbnp_class, tbtp_class, 'Test::Builder::NullPlan'
.end

=item C<new( args_hash )>

Initializes a new object after you create it with C<new>.  If you're creating a
Test::Builder::TestPlan object, pass an C<args_hash> hash containing an
C<expect> key with the number of tests you plan to run.  If you're creating a
Test::Builder::NullPlan object, do not pass the hash.

=cut

.sub __init method
	.param pmc args

	.local int valid_args
	valid_args = isa args, 'Hash'
	if valid_args goto CHECK_ARGS

	# hope this is for Test::Builder::NullPlan
	.return()

  CHECK_ARGS:
	.local int expect
	.local int expect_exists
	expect_exists = exists args['expect']
	unless expect_exists goto NO_EXPECTATION
	expect = args['expect']
	goto SET_ATTRIBUTES

  NO_EXPECTATION:
	.local pmc plan_exception
	plan_exception = new .Exception
	set   plan_exception['_message'], 'Invalid or missing plan!'
	throw plan_exception

  SET_ATTRIBUTES:
	.local int offset
	classoffset offset, self, 'Test::Builder::TestPlan'

	.local pmc intvalue
	intvalue = new .Integer
	intvalue = expect
	setattribute self, offset, intvalue
.end

=item C<header()>

Returns a string containing the appropriate TAP-compatible header for this test
plan.

=cut

.sub header method
	.local string expect
	.local int    offset
	.local string header

	classoffset offset, self, 'Test::Builder::TestPlan'

	.local pmc expect_int
	getattribute expect_int, self, offset
	expect = expect_int

	header = '1..'
	concat header, expect

	.return( header )
.end

=item C<footer()>

Returns a string containing the appropriate TAP-compatible footer for this test
plan.

=cut

.sub footer method
	.param int    ran

	.local int    expect
	.local int    offset
	.local string footer
	.local string expect_string
	.local string ran_string

	classoffset offset, self, 'Test::Builder::TestPlan'

	.local pmc expect_int
	getattribute expect_int, self, offset

	expect        = expect_int
	expect_string = expect_int
	ran_string    = ran
	footer        = ''

	if ran == expect goto PLAN_MATCHED
	concat footer, 'Expected '
	concat footer, expect_string
	concat footer, ' but ran '
	concat footer, ran_string

  PLAN_MATCHED:
  	.return( footer )
.end

.namespace [ 'Test::Builder::NullPlan' ]

.sub header method
	.local string header
	header = ''
	.return( header )
.end

.sub footer method
	.param int tests_run

	.local string tests_run_string
	.local string footer

	footer           = "1.."
	tests_run_string = tests_run

	concat footer, tests_run_string
	.return( footer )
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
