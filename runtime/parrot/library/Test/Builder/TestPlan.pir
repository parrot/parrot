
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

.namespace [ 'Test'; 'Builder'; 'TestPlan' ]

.sub '_initialize' :tag('load')
    .local pmc tbtp_class
    newclass     tbtp_class, [ 'Test'; 'Builder'; 'TestPlan' ]
    addattribute tbtp_class, 'plan'

    .local pmc tbap_class
    newclass     tbap_class, [ 'Test'; 'Builder'; 'ActivePlan' ]
    addattribute tbap_class, 'expect'

    .local pmc tbnp_class
    subclass tbnp_class, tbap_class, [ 'Test'; 'Builder'; 'NullPlan' ]
.end

.sub 'init' :vtable :method
    .local pmc plan
    plan = new [ 'Test'; 'Builder'; 'NullPlan' ]
    setattribute self, 'plan', plan
.end

.sub 'init_pmc' :vtable :method
    .param pmc args

    .local pmc plan
    plan = new [ 'Test'; 'Builder'; 'ActivePlan' ], args
    setattribute self, 'plan', plan
.end

.sub 'get_bool' :vtable :method
    .local pmc plan
    plan = getattribute self, 'plan'

    $I0 = isa plan, [ 'Test'; 'Builder'; 'NullPlan' ]
    $I0 = not $I0
    .return ($I0)
.end

.sub 'set_tests' :method
    .param int tests

    .local pmc plan
    plan = getattribute self, 'plan'

    $I0 = isa plan, [ 'Test'; 'Builder'; 'NullPlan' ]
    unless $I0 goto delegate_plan

    plan = new [ 'Test'; 'Builder'; 'ActivePlan' ]
    setattribute self, 'plan', plan

  delegate_plan:
    plan.'set_tests'( tests )
.end

.sub 'header' :method
    .local pmc plan
    plan = getattribute self, 'plan'
    .tailcall plan.'header'()
.end

.sub 'footer' :method
    .param int ran

    .local pmc plan
    plan = getattribute self, 'plan'
    .tailcall plan.'footer'( ran )
.end

.namespace [ 'Test'; 'Builder'; 'ActivePlan' ]

=item C<new( args_hash )>

Initializes a new object after you create it with C<new>.  If you're creating a
Test::Builder::TestPlan object, pass an C<args_hash> hash containing an
C<expect> key with the number of tests you plan to run.  If you're creating a
Test::Builder::NullPlan object, do not pass the hash.

=cut

.sub 'init' :vtable :method
    .local pmc expect
    expect = new 'Integer'
    setattribute self, 'expect', expect
.end

.sub 'init_pmc' :vtable :method
    .param pmc args

    .local int valid_args
    valid_args = isa args, 'Hash'
    if valid_args goto CHECK_ARGS
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
    plan_exception = new 'Exception'
    plan_exception = 'Invalid or missing plan!'
    throw plan_exception

  SET_ATTRIBUTES:
    .local pmc intvalue
    intvalue = new 'Integer'
    intvalue = expect
    setattribute self, 'expect', intvalue
.end

=item C<set_tests()>

Sets the number of expected tests; throws an exception if you've already done
this.

=cut

.sub 'set_tests' :method
    .param int tests

    .local pmc expect
    expect = getattribute self, 'expect'

    $I0 = expect
    if $I0 goto double_set_exception

    expect = tests
    .return()

  double_set_exception:
    .local pmc exception
    exception            = new 'Exception'
    exception['message'] = 'Tried to set the test plan when it already exists'
    throw exception
.end

=item C<header()>

Returns a string containing the appropriate TAP-compatible header for this test
plan.

=cut

.sub 'header' :method
    .local string expect
    .local string header

    .local pmc expect_int
    getattribute expect_int, self, "expect"
    expect = expect_int

    header = '1..'
    header = concat header, expect

    .return( header )
.end

=item C<footer()>

Returns a string containing the appropriate TAP-compatible footer for this test
plan.

=cut

.sub 'footer' :method
    .param int    ran

    .local int    expect
    .local string footer
    .local string expect_string
    .local string ran_string

    .local pmc expect_int
    getattribute expect_int, self, "expect"

    expect        = expect_int
    expect_string = expect_int
    ran_string    = ran
    footer        = ''

    if ran == expect goto PLAN_MATCHED
    footer = concat footer, 'Expected '
    footer = concat footer, expect_string
    footer = concat footer, ' but ran '
    footer = concat footer, ran_string

  PLAN_MATCHED:
    .return( footer )
.end

.namespace [ 'Test'; 'Builder'; 'NullPlan' ]

.sub 'header' :method
    .local string header
    header = ''
    .return( header )
.end

.sub 'footer' :method
    .param int tests_run

    .local string tests_run_string
    .local string footer

    footer           = "1.."
    tests_run_string = tests_run

    footer = concat footer, tests_run_string
    .return( footer )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
the Perl 6 port he wrote, based on the original Perl 5 version he wrote with
ideas from Michael G. Schwern.  Please send patches, feedback, and suggestions
to the Perl 6 internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2005-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
