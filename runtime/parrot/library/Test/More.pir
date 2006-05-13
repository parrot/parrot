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
    .local pmc like

    plan      = find_global 'Test::More', 'plan'
    diag      = find_global 'Test::More', 'diag'
    ok        = find_global 'Test::More', 'ok'
    is        = find_global 'Test::More', 'is'
    is_deeply = find_global 'Test::More', 'is_deeply'
    like      = find_global 'Test::More', 'like'

    # set a test plan
    plan( 12 )

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

    like( 'foo', 'f o**{2}', 'passing regex compare with diagnostic' )

=head1 DESCRIPTION

C<Test::More> is a pure-Parrot library for testing modules.  It provides
the C<ok()>, C<is()>, C<is_deeply()>, and C<like()> comparison functions for
you.  It also provides the C<plan()> and C<diag()> helper functions. It uses
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
    .param pmc left
    .param pmc right
    .param string description :optional

    .local int    result
    .local string diagnosis

    .local pmc position
    position = new .ResizablePMCArray

    .local pmc test
    find_global test, 'Test::More', '_test'

    .local int does_flag
    does_flag = does left, 'array'
    if does_flag goto compare_array

    does_flag = does left, 'hash'
    if does_flag goto compare_hash

    diagnosis  = typeof left
    diagnosis .= ' is not a nested data structure'
    result     = 0
    goto report_result

  compare_array:
    ( result, diagnosis ) = compare_array( left, right, position )
    goto report_result

  compare_hash:
    (result, diagnosis ) = compare_hash( left, right, position )
    goto report_result

  report_result:
    test.'ok'( result, description )

    unless result goto report_diagnostic
    .return( result )

  report_diagnostic:
    ne diagnosis, '', return_it

    .local string left
    .local string right
    right = pop position
    left  = pop position

    .local string nested_path
    nested_path = join '][', position

    diagnosis   = 'Mismatch'
    unless nested_path goto show_expected

    diagnosis  .= ' at ['
    diagnosis  .= nested_path
    diagnosis  .= ']'

  show_expected:
    diagnosis  .= ': expected '
    diagnosis  .= left
    diagnosis  .= ', received '
    diagnosis  .= right

  return_it:
    test.'diag'( diagnosis )
    .return( result )
.end

.sub compare_array
    .param pmc l_array
    .param pmc r_array
    .param pmc position

    .local pmc test
    find_global test, 'Test::More', '_test'

    .local int l_count
    .local int r_count
    l_count = l_array
    r_count = r_array
    if l_count == r_count goto compare_contents

    .local string l_count_string
    .local string r_count_string
    l_count_string  = l_count
    l_count_string .= ' element'

    if l_count == 1 goto pluralization_done
    l_count_string .= 's'

  pluralization_done:
    r_count_string  = r_count

    push position, l_count_string
    push position, r_count_string

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
    .local int elems_equal

  iter_start:
    unless l_iter goto iter_end
    l_elem = shift l_iter
    r_elem = shift r_iter

    $S0 = typeof l_elem
    elems_equal = compare_elements( l_elem, r_elem, position )
    unless elems_equal goto elems_not_equal

    inc count
    goto iter_start

  elems_not_equal:
    unshift position, count
    .return( 0 )

  iter_end:
    .return( 1 )
.end

.sub compare_hash
    .param pmc l_hash
    .param pmc r_hash
    .param pmc position

    .local pmc test
    find_global test, 'Test::More', '_test'

    .local int l_count
    .local int r_count
    l_count = l_hash
    r_count = r_hash
    if l_count == r_count goto compare_contents

    .local string l_count_string
    .local string r_count_string
    l_count_string  = l_count
    l_count_string .= ' element'

    if l_count == 1 goto pluralization_done
    l_count_string .= 's'

  pluralization_done:
    r_count_string  = r_count

    push position, l_count_string
    push position, r_count_string

    .return( 0 )

  compare_contents:
    .local pmc l_iter
    .local pmc r_iter
    .local int count

    l_iter = new .Iterator, l_hash
    r_iter = new .Iterator, r_hash
    l_iter = 0
    r_iter = 0
    count  = 0

    .local pmc l_key
    .local pmc r_key
    .local pmc l_elem
    .local pmc r_elem
    .local int elems_equal

  iter_start:
    unless l_iter goto iter_end
    l_key  = shift l_iter
    r_key  = shift r_iter
    l_elem = l_hash[ l_key ]
    r_elem = r_hash[ r_key ]

    elems_equal = compare_elements( l_elem, r_elem, position )
    unless elems_equal goto elems_not_equal

    inc count
    goto iter_start

  elems_not_equal:
    unshift position, l_key
    .return( 0 )

  iter_end:
    .return( 1 )
.end

.sub compare_elements :multi( string, string, PMC )
    .param string left
    .param string right
    .param pmc position

    .local int equal

    eq left, right, are_equal

  are_not_equal:
    .return( 0 )

  are_equal:
    .return( 1 )
.end

.sub compare_elements :multi( int, int, PMC )
    .param int left
    .param int right
    .param pmc position

    .local int equal
    eq left, right, are_equal

  are_not_equal:
    push position, left
    push position, right
    .return( 0 )

  are_equal:
    .return( 1 )
.end

.sub compare_elements :multi( String, String, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local int equal
    eq left, right, are_equal

  are_not_equal:
    push position, left
    push position, right
    .return( 0 )

  are_equal:
    .return( 1 )
.end

.sub compare_elements :multi( Integer, Integer, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local int equal
    eq left, right, are_equal

  are_not_equal:
    push position, left
    push position, right
    .return( 0 )

  are_equal:
    .return( 1 )
.end

.sub compare_elements :multi( Array, Array, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local int equal
    equal = compare_array( left, right, position )
    .return( equal )
.end

.sub compare_elements :multi( Hash, Hash, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local int equal
    equal = compare_hash( left, right, position )
    .return( equal )
.end

.sub compare_elements :multi( Undef, Undef, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .return( 1 )
.end

.sub compare_elements :multi( Undef, PMC, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local string l_undef
    l_undef = '(undef)'
    push position, l_undef
    push position, right
    .return( 0 )
.end

.sub compare_elements :multi( PMC, Undef, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local string r_undef
    r_undef = '(undef)'
    push position, left
    push position, r_undef
    .return( 0 )
.end

.sub compare_elements :multi( PMC, PMC, PMC )
    .param pmc left
    .param pmc right
    .param pmc position

    .local int does_flag
    .local int equal

  check_array:
    does_flag = does left, 'array'
    unless does_flag goto check_hash
    equal = compare_array( left, right, position )
    .return( equal )

  check_hash:
    does_flag = does left, 'hash'
    if does_flag goto compare_hash
    .return( 0 )

  compare_hash:
    equal = compare_hash( left, right, position )
    .return( equal )
.end

=item C<like( target, pattern, description )>

Similar to is, but using the Parrot Grammar Engine to compare the string
passed as C<target> to the pattern passed as C<pattern>.  It passes if the
pattern matches and fails otherwise.  This will report the results with the
optional test description in C<description>.

=cut

.sub like
    .param string target
    .param string pattern
    .param string description :optional

    .local pmc test
    find_global test, 'Test::More', '_test'

    .local pmc p6rule_compile
    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"
    p6rule_compile = compreg "PGE::P6Regex"

    .local string diagnostic
    .local int pass
    pass = 0

  match_pattern:
    .local pmc rulesub
    .local pmc match
    .local pmc code
    .local pmc exp
    (rulesub, code, exp) = p6rule_compile(pattern)
    if_null rulesub, rule_fail
    match = rulesub(target)
    unless match goto match_fail
  match_success:
    goto PASS
  match_fail:
    diagnostic = "match failed"
    goto REPORT
  rule_fail:
    diagnostic = "rule error"
    goto REPORT

  PASS:
    pass = 1

  REPORT:
    test.ok( pass, description )
    if pass goto DONE

    test.diag( diagnostic )
  DONE:
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
