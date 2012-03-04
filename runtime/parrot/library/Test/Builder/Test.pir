
=head1 NAME

Test::Builder::Test - base class for all Test::Builder test objects

=head1 SYNOPSIS

See L<Test::Builder>.  You probably don't need to use this directly.

=head1 METHODS

This class provides the following methods:

=over 4

=cut

.namespace [ 'Test'; 'Builder'; 'Test' ]

.sub _initialize :tag('load')
    .local pmc tbtb_class

    newclass     tbtb_class, [ 'Test'; 'Builder'; 'Test'; 'Base' ]
    addattribute tbtb_class, 'passed'
    addattribute tbtb_class, 'number'
    addattribute tbtb_class, 'diagnostic'
    addattribute tbtb_class, 'description'
    addattribute tbtb_class, 'skip'
    addattribute tbtb_class, 'todo'

    .local pmc tbtp_class
    subclass tbtp_class, tbtb_class, ['Test'; 'Builder'; 'Test'; 'Pass']

    .local pmc tbtf_class
    subclass tbtf_class, tbtb_class, ['Test'; 'Builder'; 'Test'; 'Fail']

    .local pmc tbtwr_class
    subclass tbtwr_class, tbtb_class, ['Test'; 'Builder'; 'Test'; 'WithReason']
    addattribute tbtwr_class, 'reason'

    .local pmc tbts_class
    subclass tbts_class, tbtwr_class, ['Test'; 'Builder'; 'Test'; 'Skip']

    .local pmc tbtt_class
    subclass tbtt_class, tbtwr_class, ['Test'; 'Builder'; 'Test'; 'TODO']
.end

=item C<create( args_hash )>

Creates and returns a new test object, based on the arguments in the
C<args_hash> hash.  Yes, this is a facade factory.  The arguments are:

=over 4

=item C<number>

The number of the test.  This is important.

=item C<passed>

An integer representing whether the test passed or failed.

=item C<skip>

An integer representing whether the test is a skip test.

=item C<reason>

The string reason why this is a skip or TODO test.

=item C<todo>

An integer representing whether the test is a TODO test.

=item C<description>

The string description of this test.

=back

The returned object is a subclass of Test::Builder::Test.

=cut

.sub create
    .param pmc args

    .local pmc test
    .local int type_flag

  CHECK_TODO:
    type_flag = args['todo']
    unless type_flag goto CHECK_SKIP

    test = new ['Test'; 'Builder'; 'Test'; 'TODO'], args
    .return( test )

  CHECK_SKIP:
    type_flag = args['skip']
    unless type_flag goto CHECK_PASS

    test = new ['Test'; 'Builder'; 'Test'; 'Skip'], args
    .return( test )

  CHECK_PASS:
    type_flag = args['passed']
    unless type_flag goto CHECK_FAIL

    test = new ['Test'; 'Builder'; 'Test'; 'Pass'], args
    .return( test )

  CHECK_FAIL:
    test = new ['Test'; 'Builder'; 'Test'; 'Fail'], args
    .return( test )
.end

=item C<status()>

Returns a C<Hash> containing information about this test -- mostly the
information you pass to C<create()>.

=item C<report()>

Returns the TAP-compatible string representation of this test.

=cut

.namespace [ 'Test'; 'Builder'; 'Test'; 'Base' ]

.sub init_pmc :vtable :method
    .param pmc args

    .local pmc passed
    .local pmc number
    .local pmc diagnostic
    .local pmc description

    passed = args['passed']
    setattribute self, "passed", passed

    number = args['number']
    unless null number goto SET_NUMBER
    number = new 'Integer'
    number = 0

  SET_NUMBER:
    setattribute self, "number", number

    diagnostic = args['diagnostic']
    unless null diagnostic goto SET_DIAGNOSTIC
    diagnostic = new 'String'
    set diagnostic, '???'

  SET_DIAGNOSTIC:
    setattribute self, "diagnostic", diagnostic

    description = args['description']
    unless null description goto SET_DESCRIPTION
    description = new 'String'
    set description, ''

  SET_DESCRIPTION:
    setattribute self, "description", description
.end

.sub passed :method
    .local pmc passed

    getattribute passed, self, "passed"

    .return( passed )
.end

.sub number :method
    .local pmc number

    getattribute number, self, "number"

    .return( number )
.end

.sub diagnostic :method
    .local pmc diagnostic

    getattribute diagnostic, self, "diagnostic"

    .return( diagnostic )
.end

.sub description :method
    .local pmc description

    getattribute description, self, "description"

    .return( description )
.end

.sub status :method
    .local pmc passed
    .local pmc description
    .local pmc status

    passed      = self.'passed'()
    description = self.'description'()

    status = new 'Hash'
    set status['passed'],      passed
    set status['description'], description
.end

.sub report :method
    .local pmc    passed
    .local pmc    number
    .local pmc    description
    .local string report
    .local string number_string
    .local string desc_string

    passed        = self.'passed'()
    number        = self.'number'()
    description   = self.'description'()
    report        = ''
    number_string = number
    desc_string   = description

    if passed goto PASSED
    set report, 'not '

  PASSED:
    report = concat report, 'ok '
    report = concat report, number_string

    unless desc_string goto REPORT

    report = concat report, ' - '
    report = concat report, desc_string

  REPORT:
    .return( report )
.end

# no code here
.namespace [ 'Test'; 'Builder'; 'Test'; 'Pass' ]

# no code here either
.namespace [ 'Test'; 'Builder'; 'Test'; 'Fail' ]

.namespace [ 'Test'; 'Builder'; 'Test'; 'WithReason' ]

.sub init_pmc :vtable :method
    .param pmc args

    .local pmc reason
    reason = new 'String'
    set reason, ''

    .local int is_defined
    is_defined = exists args['reason']
    unless is_defined goto SET_ATTRIBUTE
    reason = args['reason']

  SET_ATTRIBUTE:
    setattribute self, "reason", reason
.end

.sub reason :method
    .local pmc reason

    getattribute reason, self, "reason"

    .return( reason )
.end

.sub status :method
    .local pmc reason
    .local pmc status
    .local pmc parent_status

    parent_status = get_hll_global ['Test'; 'Builder'; 'Test'; 'WithReason'], 'status'
    status        = parent_status()
    reason        = self.'reason'()

    set status['reason'], reason

    .return( status )
.end

.namespace [ 'Test'; 'Builder'; 'Test'; 'Skip' ]

.sub report :method
    .local pmc    reason
    .local pmc    number
    .local string report
    .local string number_string
    .local string reason_string

    number        = self.'number'()
    reason        = self.'reason'()
    report        = 'ok '
    number_string = number
    reason_string = reason

    report = concat report, number_string
    report = concat report, ' #skip '
    report = concat report, reason_string

    .return( report )
.end

.sub status :method
    .local pmc status
    .local pmc parent_status

    parent_status = get_hll_global ['Test'; 'Builder'; 'Test'; 'WithReason'], 'status'
    status        = parent_status()

    set status['skip'], 1
    .return( status )
.end

.namespace [ 'Test'; 'Builder'; 'Test'; 'TODO' ]

.sub report :method
    .local pmc    passed
    .local pmc    reason
    .local pmc    number
    .local string report

    passed        = self.'passed'()
    number        = self.'number'()
    report        = ''

    if passed goto PASSED
    report      = 'not '

  PASSED:
    report = concat report, 'ok '
    $S0 = number
    report = concat report, $S0
    report = concat report, ' # TODO '

    $S0 = self.'reason'()
    report = concat report, $S0

    if passed goto REPORT
    # Build long explanation why
    report .= "\n\tFailed (TODO) test '"
    $S0     = self.'description'()
    report .= $S0
    report .= "'"

  REPORT:
    .return( report )
.end

.sub status :method
    .local pmc passed
    .local pmc status
    .local pmc parent_status

    parent_status = get_hll_global ['Test'; 'Builder'; 'Test'; 'WithReason'], 'status'
    status        = parent_status()
    passed        = self.'passed'()

    set status['TODO'],          1
    set status['passed'],        1
    set status['really_passed'], 1

    .return( status )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
the Perl 6 port he wrote, based on the original Perl 5 version he wrote with
ideas from Michael G. Schwern.  Please send patches, feedback, and suggestions
to the Perl 6 internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2005-2010, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
