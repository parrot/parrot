=head1 NAME

Test::More - Parrot extension for testing modules

=head1 SYNOPSIS

    # load this library
    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc plan
    .local pmc diag
    .local pmc ok
    .local pmc is
    .local pmc is_deeply

    plan      = find_global 'Test::More', 'plan'
    diag      = find_global 'Test::More', 'diag'
    ok        = find_global 'Test::More',   'ok'
    is        = find_global 'Test::More',   'is'
    is_deeply = find_global 'Test::More',   'is_deeply'

    # set a test plan
    plan( 11 )

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

    diag( 'this may take a while' )
    is_deeply( some_deep_pmc, another_deep_pmc, 'deep structure comparison' )

=head1 DESCRIPTION

C<Test::More> is a pure-Parrot library for testing modules.  It provides
the C<ok()>, C<is()>, and C<is_deeply()> comparison functions for you.  It
also provides the C<plan()> and C<diag()> helper functions. It uses
C<Test::Builder>, a simple, single backend for multiple test modules
to use within your tests.

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

    diagnostic = _make_diagnostic( l_string, r_string )
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

    diagnostic = _make_diagnostic( l_string, r_string )
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

    diagnostic = _make_diagnostic( l_string, r_string )
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

    diagnostic = _make_diagnostic( l_string, r_string )
    test.diag( diagnostic )
  DONE:
.end


=item C<diag( diagnostic )>

Prints C<diagnostic> to the screen, without affecting test comparisons.

=cut

.sub diag
    .param string diagnostic

    .local pmc test
    find_global test, 'Test::More', '_test'
    test.diag( diagnostic )
.end


=item C<is_deeply( left, right, description )>

Compares the data structures passed as C<left> and C<right>.  If data
structures are passed, C<is_deeply> does a deep comparison by walking each
structure.  It passes if they are equal and fails otherwise.  This will
report the results with the optional test description in C<description>.

This only handles comparisons of array-like structures.  It shouldn't be too
hard to extend it for hash-like structures, too.

=cut

.sub is_deeply
    .param pmc l_array
    .param pmc r_array
    .param string description :optional

    .local pmc test
    find_global test, 'Test::More', '_test'

    .local string diagnosis

    .local int l_count
    .local int r_count
    l_count = l_array
    r_count = r_array
    if l_count == r_count goto compare_contents
    test.'ok'( 0, description )

    .local string count_string
    diagnosis   = 'Received '
    count_string = l_count
    diagnosis .= count_string
    diagnosis .= ' elements in array, expected '
    count_string = r_count
    diagnosis .= count_string

    test.'diag'( diagnosis )
    .return( 0 )

  compare_contents:
    .local pmc l_iter
    .local pmc r_iter
    .local int count

    l_iter = new .Iterator, l_array
    r_iter = new .Iterator, r_array
    l_iter = 0
    r_iter = 0
    count  = 0

    .local pmc l_elem
    .local pmc r_elem

  iter_start:
    unless l_iter goto iter_end
    l_elem = shift l_iter
    r_elem = shift r_iter
    unless l_elem == r_elem goto elems_not_equal

    inc count
    goto iter_start

  elems_not_equal:
    .local string count_string
    .local string elem_string

    test.'ok'( 0, description )
    diagnosis    = "Mismatch at position "
    count_string = count
    diagnosis   .= count_string
    diagnosis   .= ": received "
    elem_string  = l_elem
    diagnosis   .= elem_string
    diagnosis   .= ", expected "
    elem_string  = r_elem
    diagnosis   .= elem_string
    test.'diag'( diagnosis )
    .return( 0 )

  iter_end:
    test.'ok'( 1, description )
    .return( 1 )
.end

.sub _make_diagnostic
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

# vim: expandtab sw=4
