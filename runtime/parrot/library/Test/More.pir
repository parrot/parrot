# $Id$

=head1 NAME

Test::More - Parrot extension for testing modules

=head1 SYNOPSIS

    # load this library
    load_bytecode 'Test/More.pbc'

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Test'; 'More' ]
    exports        = split ' ', 'plan diag ok nok is is_deeply like isa_ok skip isnt todo throws_like lives_ok dies_ok'

    test_namespace.'export_to'(curr_namespace, exports)

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

    is_null( some_pmc, 'pmc was null' )

    diag( 'this may take a while' )
    is_deeply( some_deep_pmc, another_deep_pmc, 'deep structure comparison' )

    like( 'foo', 'f o**{2}', 'passing regex compare with diagnostic' )
    skip(1, 'reason for skipping')
    todo(0, 'this is a failed test', 'reason for todo')

    $P0 = get_class "Squirrel"
    $P0.new()

    isa_ok($P0, "Squirrel", "new Squirrel")

=head1 DESCRIPTION

C<Test::More> is a pure-Parrot library for testing modules.  It provides the
C<ok()>, C<is()>, C<isnt()>, C<is_deeply()>, and C<like()> comparison functions
for you.  It also provides the C<plan()> and C<diag()> helper functions. It
uses C<Test::Builder>, a simple, single backend for multiple test modules
to use within your tests.

=head1 FUNCTIONS

This class defines the following functions:

=over 4

=cut

.namespace [ 'Test'; 'More' ]

.sub _initialize :load
    load_bytecode 'Test/Builder.pbc'

    .local pmc test
    test = new [ 'Test'; 'Builder' ]

    set_hll_global [ 'Test'; 'More' ], '_test', test
.end

=item C<plan( number_or_no_plan )>

Declares the number of tests you plan to run, either an integer greater than
zero or the string C<no_plan>.  This will throw an exception if you have
already declared a plan or if you pass an invalid argument.

=cut

.sub plan
    .param string tests

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    test.'plan'( tests )
.end

=item C<done_testing( number_of_tests? )>

If you don't know how many tests you're going to run, you can issue
the plan when you're done running tests.

C<number_of_tests> is the same as plan(), it's the number of tests
you expected to run.  You can omit this, in which case the number
of tests you ran doesn't matter, just the fact that your tests ran
to conclusion.

This is safer than and replaces the "no_plan" plan.

=cut

.sub done_testing
    .param string tests     :optional
    .param int    has_tests :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    test.'done_testing'( tests )
.end

=item C<ok( passed, description )>

Records a test as pass or fail depending on the truth of the PMC C<passed>,
recording it with the optional test description in C<description>.

=cut

.sub ok
    .param pmc    passed
    .param string description     :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    $I0 = istrue passed
    test.'ok'( $I0, description )
.end

=item C<nok( passed, description )>

Records a test as pass or fail depending on the falsehood of the integer
C<passed>, recording it with the optional test description in C<description>.

=cut

.sub nok
    .param pmc passed
    .param string description :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int reverse_passed
    reverse_passed = isfalse passed

    test.'ok'( reverse_passed, description )
.end

=item C<is( left, right, description )>

Compares the parameters passed as C<left> and C<right>, passing if they are
equal and failing otherwise.  This will report the results with the optional
test description in C<description>.

This is a multi-method, with separate implementations for int-int, float-float,
string-string, and PMC-PMC comparisons.  The latter uses the C<eq> opcode for
comparison.

If there is a mismatch, the current implementation takes the type of C<left> as
the proper type for the comparison, converting any numeric arguments to floats.
Note that there is a hard-coded precision check to avoid certain rounding
errors.

=item C<is( left, right, description, precision )>

For C<Float> only, an optional 4th parameter is allowed, a numeric precision.
If specified, then the floats are only compared within the tolerance of the
precision: e.g.:

 is(123.456, 123.457, 'close enough?', 1e-2)

will pass.

=cut

.sub one_or_both_null
    .param pmc left
    .param pmc right

    .local int one
    .local int both

    $I0 = isnull left
    $I1 = isnull right
    or one, $I0, $I1
    and both, $I0, $I1
    .return (one, both)
.end

.sub is :multi(PMC, Integer)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass
    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    .local int l, r
    l    = left
    r    = right

    pass = iseq l, r

report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string    = 'null'
    if null left goto r_str
    l_string    = left

r_str:
    r_string    = 'null'
    if null right goto diag
    r_string    = right

diag:
    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

#.sub is :multi(_, Float)
#    .param num    left
#    .param num    right
.sub is :multi(PMC, Float)
    .param pmc left
    .param pmc right
    .param string description :optional
    .param int    have_desc   :opt_flag
    .param num    precision   :optional
    .param int    have_prec   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass

    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    .local num l, r
    l = left
    r = right

    if have_prec goto check_precision

    pass = iseq l, r
    goto report

  check_precision:
    .local num diff
    diff = l - r
    diff = abs diff
    pass = isle diff, precision

  report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string    = 'null'
    if null left goto r_str
    l_string    = left

r_str:
    r_string    = 'null'
    if null right goto diag
    r_string    = right

diag:
    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

.sub is :multi(PMC, String)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass
    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    .local string l, r
    l = left
    r = right
    pass = iseq l, r

report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string    = 'null'
    if null left goto r_str
    l_string    = left

r_str:
    r_string    = 'null'
    if null right goto diag
    r_string    = right

diag:
    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

.sub is :multi(PMC, PMC)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass

    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto result

    .local int does_type
    does_type = does right, 'String'
    if does_type goto check_string

    does_type = does right, 'Float'
    if does_type goto check_float

    does_type = does right, 'Integer'
    if does_type goto check_integer

  check_string:
    pass = iseq left, right
    goto result

  check_float:
    .local num ln, rn
    ln   = left
    rn   = right
    pass = iseq ln, rn
    goto result

  check_integer:
    .local int li, ri
    li   = left
    ri   = right
    pass = iseq li, ri
    goto result

  result:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string    = 'null'
    if null left goto r_str
    l_string    = left

r_str:
    r_string    = 'null'
    if null right goto diag
    r_string    = right

diag:
    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

=item C<isnt( left, right, description )>

Like C<is>, but succeeds if the arguments I<don't> match.

=cut

.sub isnt :multi(Integer, Integer)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass

    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    if left != right goto pass_it
    goto report

  pass_it:
    pass = 1

  report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string = left
    r_string = right
    r_string = 'not ' . r_string

    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

.sub isnt :multi(Float, Float)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass

    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    ne left, right, pass_it
    goto report

  pass_it:
    pass = 1

  report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string = left
    r_string = right
    r_string = 'not ' . r_string

    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

.sub isnt :multi(String, String)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass

    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    ne left, right, pass_it
    goto report

  pass_it:
    pass = 1

  report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string = left
    r_string = right
    r_string = 'not ' . r_string

    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

.sub isnt :multi(PMC, PMC)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int pass

    ($I0, pass) = one_or_both_null(left, right)
    if $I0 goto report

    # this comparison may not work in general, but it's worth trying
    pass = isne left, right

  report:
    test.'ok'( pass, description )
    if pass goto done

    .local string diagnostic
    .local string l_string
    .local string r_string

    l_string = left
    r_string = right
    r_string = 'not ' . r_string

    diagnostic = _make_diagnostic( l_string, r_string )
    test.'diag'( diagnostic )
  done:
.end

=item C<diag( diagnostic, ... )>

Prints C<diagnostic> to the screen, without affecting test comparisons.

=cut

.sub diag
    .param pmc args :slurpy

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    .tailcall test.'diag'( args :flat )
.end


=item C<is_deeply( left, right, description )>

Compares the data structures passed as C<left> and C<right>.  If data
structures are passed, C<is_deeply> does a deep comparison by walking each
structure.  It passes if they are equal and fails otherwise.  This will
report the results with the optional test description in C<description>.

This handles comparisons of array-like and hash-like structures.

=cut

.sub is_deeply :multi(PMC, PMC)
    .param pmc left
    .param pmc right
    .param pmc description :optional
    .param int have_desc   :opt_flag

    .local int    result
    .local pmc diagnosis
    diagnosis = new ['StringBuilder']

    .local pmc position
    position = new 'ResizablePMCArray'

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

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

    .local string left_value
    .local string right_value
    .local pmc left, right

    right = pop position
    left  = pop position

 check_right_null:
    .local int rnull
    rnull = isnull right
    unless rnull goto set_right
    right_value = 'nonexistent'
    goto check_left_null

 set_right:
    right_value = right

 check_left_null:
    .local int lnull
    lnull = isnull left
    unless lnull goto set_left
    left_value = 'undef'
    goto create_diag

 set_left:
    left_value = left

 create_diag:
    .local string nested_path
    nested_path = join '][', position

    diagnosis   = 'Mismatch'
    unless nested_path goto show_expected

    diagnosis  .= ' at ['
    diagnosis  .= nested_path
    diagnosis  .= ']'

  show_expected:
    diagnosis  .= ': expected '
    diagnosis  .= left_value
    diagnosis  .= ', received '
    diagnosis  .= right_value

  return_it:
    test.'diag'( diagnosis )
    .return( result )
.end

.sub compare_array
    .param pmc l_array
    .param pmc r_array
    .param pmc position

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int l_count
    .local int r_count
    l_count = l_array
    r_count = r_array
    if l_count == r_count goto compare_contents

    .local pmc l_count_string
    .local pmc r_count_string
    l_count_string  = new ['StringBuilder']
    r_count_string  = new ['StringBuilder']

    $S0 = l_count
    l_count_string  = $S0
    l_count_string .= ' element'

    if l_count == 1 goto pluralization_done
    l_count_string .= 's'

  pluralization_done:
    $S0 = r_count
    r_count_string  = $S0

    push position, l_count_string
    push position, r_count_string

    .return( 0 )

  compare_contents:
    .local pmc l_iter
    .local pmc r_iter
    .local int count

    l_iter = iter l_array
    r_iter = iter r_array
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

    # MMD can't handle Nulls. So replace elems with Undef.
    unless null l_elem goto check_right
    l_elem = new 'Undef'
  check_right:
    unless null r_elem goto compare
    r_elem = new 'Undef'

  compare:
    elems_equal = compare_elements( l_elem, r_elem, position )
    unless elems_equal goto elems_not_equal

  iter_next:
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
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int l_count
    .local int r_count
    l_count = l_hash
    r_count = r_hash
    if l_count == r_count goto compare_contents

    .local pmc l_count_string
    .local pmc r_count_string
    l_count_string  = new ['StringBuilder']
    r_count_string  = new ['StringBuilder']

    $S0 = l_count
    l_count_string  = $S0
    l_count_string .= ' element'

    if l_count == 1 goto pluralization_done
    l_count_string .= 's'

  pluralization_done:
    $S0 = r_count
    r_count_string  = $S0

    push position, l_count_string
    push position, r_count_string

    .return( 0 )

  compare_contents:
    .local pmc l_iter
    .local int count

    l_iter = iter l_hash
    l_iter = 0
    count  = 0

    .local pmc key
    .local pmc l_elem
    .local pmc r_elem
    .local int elems_equal

  iter_start:
    unless l_iter goto iter_end
    key  = shift l_iter
    l_elem = l_hash[ key ]
    r_elem = r_hash[ key ]

    elems_equal = compare_elements( l_elem, r_elem, position )
    unless elems_equal goto elems_not_equal

    inc count
    goto iter_start

  elems_not_equal:
    unshift position, key
    .return( 0 )

  iter_end:
    .return( 1 )
.end

.sub compare_elements :multi(String, String, PMC)
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

.sub compare_elements :multi(Integer, Integer, PMC)
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

.sub compare_elements :multi(String, String, PMC)
    .param pmc left
    .param pmc right
    .param pmc position

    eq left, right, are_equal

  are_not_equal:
    push position, left
    push position, right
    .return( 0 )

  are_equal:
    .return( 1 )
.end

.sub compare_elements :multi(Integer, Integer, PMC)
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

.sub compare_elements :multi(Array, Array, PMC)
    .param pmc left
    .param pmc right
    .param pmc position

    .local int equal
    equal = compare_array( left, right, position )
    .return( equal )
.end

.sub compare_elements :multi(Hash, Hash, PMC)
    .param pmc left
    .param pmc right
    .param pmc position

    .local int equal
    equal = compare_hash( left, right, position )
    .return( equal )
.end

.sub compare_elements :multi(Undef, Undef, PMC)
    .param pmc left
    .param pmc right
    .param pmc position

    .return( 1 )
.end

.sub compare_elements :multi(Undef, PMC, PMC)
    .param pmc left
    .param pmc right
    .param pmc position

    .local string l_undef
    l_undef = '(undef)'
    push position, l_undef
    push position, right
    .return( 0 )
.end

.sub compare_elements :multi(PMC, Undef, PMC)
    .param pmc left
    .param pmc right
    .param pmc position

    .local string r_undef
    r_undef = '(undef)'
    push position, left
    push position, r_undef
    .return( 0 )
.end

.sub compare_elements :multi(PMC, PMC, PMC)
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

=item C<is_null( pmc, description )>

Records a passing test if the PMC passed in is null, fails otherwise.

=cut

.sub is_null
    .param pmc victim
    .param string description :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local int passed
    passed = isnull victim

    test.'ok'( passed, description )
    if passed goto done

    .local string v_string
    v_string    = 'null'
    if null victim goto diag
    v_string    = victim

  diag:
    .local string diagnostic
    diagnostic = _make_diagnostic( v_string, 'null')
    test.'diag'( diagnostic )
  done:
.end

=item C<dies_ok( codestring, description )>

Takes PIR code in C<codestring> and an optional message in C<description>.
Passes a test if the PIR code throws any exception, fails a test otherwise.

=cut

.sub dies_ok
    .param string target
    .param string description :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local pmc comp
    .local pmc compfun
    .local pmc compiler
    compiler = compreg 'PIR'

    .local pmc eh
    eh = new 'ExceptionHandler'
    set_addr eh, handler            # set handler label for exceptions
    push_eh eh

    compfun = compiler(target)
    compfun()                       # eval the target code

    pop_eh

    # if it doesn't throw an exception fail
    test.'ok'( 0, description )
    test.'diag'('no error thrown')

    goto done

  handler:
    .local pmc ex
    .local string error_msg
    .local string diagnostic

    .get_results (ex)
    pop_eh
    error_msg = ex
    test.'ok'( 1, description )

  done:

.end

=item C<lives_ok( codestring, description )>

Takes PIR code in C<codestring> and an optional message in C<description>.
Passes a test if the PIR does not throw any exception, fails a test otherwise.

=cut

.sub lives_ok
    .param string target
    .param string description :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local pmc comp
    .local pmc compfun
    .local pmc compiler
    compiler = compreg 'PIR'

    .local pmc eh
    eh = new 'ExceptionHandler'
    set_addr eh, handler            # set handler label for exceptions
    push_eh eh

    compfun = compiler(target)
    compfun()                       # eval the target code

    pop_eh

    # if it doesn't throw an exception pass
    test.'ok'( 1, description )

    goto done

  handler:
    .local pmc ex
    .local string error_msg
    .local string diagnostic

    .get_results (ex)
    pop_eh
    error_msg = ex
    test.'ok'( 0, description )
    test.'diag'(error_msg)

  done:

.end

=item C<throws_like( codestring, pattern, description )>

Takes PIR code in C<codestring> and a PGE pattern to match in C<pattern>, as
well as an optional message in C<description>. Passes a test if the PIR throws
an exception that matches the pattern, fails the test otherwise.

=cut

.sub throws_like
    .param string target
    .param string pattern
    .param string description :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local pmc comp
    .local pmc compfun
    .local pmc compiler
    compiler = compreg 'PIR'

    .local pmc eh
    eh = new 'ExceptionHandler'
    set_addr eh, handler            # set handler label for exceptions
    push_eh eh

    compfun = compiler(target)
    compfun()                       # eval the target code

    pop_eh

    # if it doesn't throw an exception, fail
    test.'ok'( 0, description )
    test.'diag'( 'no error thrown' )

    goto done

  handler:
    .local pmc ex
    .local string error_msg
    .get_results (ex)
    pop_eh
    error_msg = ex
    like(error_msg, pattern, description)

  done:
.end

=item C<throws_substring( codestring, text, description )>

Takes PIR code in C<codestring> and a string to match in C<text>, as
well as an optional message in C<description>. Passes a test if the PIR throws
an exception that matches the pattern, fails the test otherwise.

=cut

.sub throws_substring
    .param string target
    .param string text
    .param string description :optional

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local pmc comp
    .local pmc compfun
    .local pmc compiler
    compiler = compreg 'PIR'

    .local pmc eh
    eh = new 'ExceptionHandler'
    set_addr eh, handler            # set handler label for exceptions
    push_eh eh

    compfun = compiler(target)
    compfun()                       # eval the target code

    pop_eh

    # if it doesn't throw an exception, fail
    test.'ok'( 0, description )
    test.'diag'( 'no error thrown' )

    goto done

  handler:
    .local pmc ex
    .local string error_msg
    .get_results (ex)
    pop_eh
    error_msg = ex
    substring(error_msg, text, description)

  done:
.end

=item C<substring( target, text, description )>

Similar to is, but using the index opcode to compare the string passed as
C<text> to the string passed as C<target>.  It passes if C<text> is a substring
of C<target> and fails otherwise.  This will report the results with the
optional test description in C<description>.

=cut

.sub substring
    .param string target
    .param string text
    .param string description :optional

    .local pmc test
    .local pmc diagnostic
    diagnostic = new ['StringBuilder']

    get_hll_global test, [ 'Test'; 'More' ], '_test'
    $I0 = index target, text
    $I0 = isne $I0, -1
    test.'ok'( $I0, description )
    if $I0 goto done
    diagnostic = "substring failed: '"
    diagnostic .= target
    diagnostic .= "' does not contain '"
    diagnostic .= text
    diagnostic .= "'"
    test.'diag'(diagnostic)
  done:
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
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local pmc p6rule_compile
    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Dumper.pbc"
    load_bytecode "PGE/Text.pbc"
    load_bytecode "PGE/Util.pbc"
    p6rule_compile = compreg "PGE::Perl6Regex"

    .local pmc diagnostic
    diagnostic = new ['StringBuilder']
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
    goto pass_it
  match_fail:
    diagnostic = "match failed: target '"
    diagnostic .= target
    diagnostic .= "' does not match pattern '"
    diagnostic .= pattern
    diagnostic .= "'"
    goto report
  rule_fail:
    diagnostic = "rule error"
    goto report

  pass_it:
    pass = 1

  report:
    test.'ok'( pass, description )
    if pass goto done

    test.'diag'( diagnostic )
  done:
.end

=item C<skip( how_many, why )>

Pass a number of tests, but with a comment that marks the test was
actually skipped.  Arguments are optional.

=cut

.sub skip :multi(Integer, String)
    .param int how_many
    .param string description

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    test.'skip'(how_many, description)
.end

.sub skip :multi(Integer)
    .param int how_many

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    test.'skip'(how_many)
.end

.sub skip :multi(String)
    .param string description

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    test.'skip'(1, description)
.end

.sub skip :multi()
    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'
    test.'skip'()
.end

=item C<todo( passed, description, reason )>

Records a test as pass or fail (like C<ok>, but marks it as TODO so it always
appears as a success. This also records the optional C<description> of the test
and the C<reason> you have marked it as TODO.

=cut

.sub todo
    .param pmc args :slurpy

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    test.'todo'( args :flat )
.end

=item C<isa_ok( object, class_name, object_name )>

Pass if the object C<isa> class of the given class name.  The object
name passed in is not a full description, but a name to be included in
the description. The description is presented as "<object_name> isa
<class>".

Good input: "C<new MyObject>", "C<return from bar()>"

Bad input: "C<test that the return from Foo is correct type>"

=cut

.sub isa_ok
    .param pmc thingy
    .param pmc class_name
    .param pmc object_name :optional
    .param int got_name :opt_flag

    .local pmc test
    get_hll_global test, [ 'Test'; 'More' ], '_test'

    .local pmc description
    .local pmc diagnostic
    description = new ['StringBuilder']
    diagnostic  = new ['StringBuilder']

    description = "The object"
    unless got_name goto keep_default
    description = object_name
  keep_default:
    $S0 = description
    diagnostic = $S0
    description .= " isa "
    $S0 = class_name
    description .= $S0

    $I0 = isa thingy, class_name
    test.'ok'($I0, description)
    if $I0 goto out
    diagnostic .= " isn't a "
    $S1 = class_name
    diagnostic .= $S1
    diagnostic .= " it's a "
    $S2 = typeof thingy
    diagnostic .= $S2
    test.'diag'(diagnostic)
  out:
.end

.sub _make_diagnostic
    .param string received
    .param string expected
    .local pmc diagnostic

    diagnostic  = new ['StringBuilder']
    diagnostic  = 'Have: '
    diagnostic .= received
    diagnostic .= "\nWant: "
    diagnostic .= expected

    $S0 = diagnostic
    .return( $S0 )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
the Perl 6 port he wrote, based on the original Perl 5 version he wrote with
ideas from Michael G. Schwern.  Please send patches, feedback, and suggestions
to the Perl 6 internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2005-2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
