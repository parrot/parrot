#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$
# vi: ft=pir

=head1 NAME

t/compilers/pge/p5regex/p5rx.t - Perl 5 Regular Expression tests

=head1 DESCRIPTION

These tests are ripped from the Perl 5.9.2 distribution. The test harness
has been modified to feed them to PGE's P5Regex compiler. The tests are
in a separate file in the same directory, named 're_tests'.

This test harness honors a special environment variable called C<TEST_P5RX>.
If set to a number, that test will be run alone and unconditionally--even
if it's designated as SKIP or TODO by the harness. This is quite helpful
in debugging tests that cause parrot to spiral out of control. {{ XXX }}

B<NOTE:> Don't add new tests to C<re_tests>. That file is strictly for
Perl 5's tests.

The Perl 5 equivalent file provides the following description of the test
format. There are 5-6 columns, separated by tabs.

Column 1 contains the pattern, optionally enclosed in C<''>.
Modifiers can be put after the closing C<'>.

Column 2 contains the string to be matched.

Column 3 contains the expected result:
    y    expect a match
    n    expect no match
    c    expect an error
    B    test exposes a known bug in Perl, should be skipped
    b    test exposes a known bug in Perl, should be skipped if noamp

Columns 4 and 5 are used only if column 3 contains C<y> or C<c>.

Column 4 contains a string, usually C<$&>.

Column 5 contains the expected result of double-quote
interpolating that string after the match, or start of error message.

Column 6, if present, contains a description of what is being tested.

\n in the tests are interpolated, as are variables of the form ${\w+}.

=head1 SYNOPSIS

    % prove t/compilers/pge/p5regex/p5rx.t

=cut

.const int TESTS = 960

.loadlib 'io_ops'

.sub main :main
    load_bytecode 'Test/Builder.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    .include 'iglobals.pasm'

    # Variable declarations, initializations
    .local pmc test       # the test harness object.
               test = new [ 'Test'; 'Builder' ]

    .local pmc todo_tests # keys indicate test file; values test number.
               todo_tests = new 'Hash'

    .local pmc skip_tests # keys indicate tests ID; values reasons.
               skip_tests = new 'Hash'

    .local string test_dir # the directory containing tests
                  test_dir = 't/compilers/pge/p5regex/'

    .local pmc test_files # values are test file names to run.
               test_files = new 'ResizablePMCArray'

    # populate the list of test files
    push test_files, 're_tests'

    .local pmc file_iterator # iterate over list of files..
               file_iterator = iter test_files

    .local int test_number   # the number of the test we're running
               test_number = 0

    # these vars are in the loops below
    .local pmc file_handle   # currently open file.
    .local string test_file  # name of the current test file
    .local string test_line  # one line of one test file, a single test
    .local int ok            # is this a passing test?

    # for any given test:
    .local pmc regex          # the regex
    .local pmc match          # the match
    .local string pattern     # the regex
    .local string target      # this string to match against the regex
    .local string result      # expected result of this test. (y/n/...)
    .local string testvar     # the value to test against expected results
    .local string expected    # the expected result of the match, or the error
    .local string description # user-facing description of the test.

    todo_tests = 'set_todo_info'()
    skip_tests = 'set_skip_info'()

    # how many tests to run?
    # XXX: this should be summed automatically from test_files data
    #      until then, we use the constant above
    test.'plan'(TESTS)

  outer_loop:
    unless file_iterator goto end_outer_loop
    .local string test_name
                  test_name = shift file_iterator
    # local test number in test file
    .local int local_test_number
               local_test_number = 0

    # append the test directory and filename
    test_file = test_dir . test_name

    # Open the test file
    file_handle = open test_file, 'r'
    $S0 = typeof file_handle
    if $S0 == 'Undef' goto bad_file

    # loop over the file, one at a time.

  loop:
    # read in the file one line at a time...
    $I0 = file_handle.'eof'()
    if $I0 goto end_loop

    test_line = readline file_handle

    # skip lines without tabs
    $I0 = index test_line, "\t"
    if $I0 == -1 goto loop
    inc test_number
    inc local_test_number

  parse_data:
    push_eh eh_bad_line
     ( pattern, target, result, testvar, expected, description ) = 'parse_data'( test_line )
    pop_eh

    # build the test description
    #   start with the pattern
    $S0 = concat '/', pattern
    $S0 .= '/ '
    #  add the test description, if it exists
    $I0 = length description
    unless $I0 goto no_desc
    description = concat '-- ', description
  no_desc:
    description = concat $S0, description
    # prepend test filename and line number to description
    description = 'build_test_desc'( description, test_name, local_test_number )

    if target != "''" goto got_target
    target = ''

  got_target:
    target = 'backslash_escape'( target )
    result = 'backslash_escape'( result )

    # Should this test be skipped?
    $I0 = exists skip_tests[test_name]
    unless $I0 goto not_skip
    $P0 = skip_tests[test_name]
    $I0 = exists $P0[local_test_number]
    unless $I0 goto not_skip
    # extract reason from skip data
    $S0 = $P0[local_test_number]
    if $S0 == '1' goto set_skip
    description = 'build_test_desc'( $S0, test_name, local_test_number )
  set_skip:
    test.'skip'(1, description)
    goto loop

  not_skip:
    push_eh thrown
    match = 'match_p5regex'( pattern, target )
    pop_eh

    if match goto matched

    if result == 'n' goto is_ok
    if result == 'y' goto is_nok
    goto check_dump

  matched:
    if result == 'y' goto is_ok
    if result == 'n' goto is_nok

  check_dump:
    $S1 = match.'dump_str'('mob', ' ', '')

    $I0 = index $S1, result
    if $I0 == -1 goto is_nok

  is_ok:
    ok = 1
    goto emit_test
  is_nok:
    ok = 0

  emit_test:
    $I0 = exists todo_tests[test_name]
    unless $I0 goto not_todo
    $P0 = todo_tests[test_name]
    $I0 = exists $P0[local_test_number]
    unless $I0 goto not_todo
    # extract reason from todo data
    $S0 = $P0[local_test_number]
    if $S0 == '1' goto set_todo
    description = 'build_test_desc'( $S0, test_name, local_test_number )
  set_todo:
    test.'todo'(ok,description)
    goto loop
  not_todo:
    test.'ok'(ok,description)
    if ok goto loop
    $S0 = concat 'pattern: /', pattern
    $S1 = concat '/, target: "', target
    $S0 .= $S1
    $S1 = concat '", result: "', result
    $S0 .= $S1
    $S1 = concat '", testvar: "', testvar
    $S0 .= $S1
    $S1 = concat '", expected: "', expected
    $S0 .= $S1
    $S2 = match
    $S1 = concat '", got: "', $S2
    $S0 .= $S1
    $S0 .= '"'
    test.'diag'($S0)

    goto loop
  end_loop:
    close file_handle
    goto outer_loop
  end_outer_loop:

    test.'finish'()
    end

  bad_file:
    print "Unable to open '"
    print test_file
    print "'\n"

  thrown:
    .local pmc exception
    .local string message
    get_results '0', exception
    message = exception
    # remove /'s
    # $S0 = substr result, 0, 1
    # if $S0 != '/' goto bad_error
    # substr result, 0, 1, ''
    # substr result, -1, 1, ''
    $I0 = index message, expected
    if $I0 == -1 goto bad_error
    ok = 1
    goto emit_test
  bad_error:
    ok = 0
    goto emit_test
  bad_line:
    $S0 = 'Test not formatted properly!'
    test.'ok'(0, $S0)
    goto loop
  eh_bad_line:
    $S0 = 'Test not formatted properly!'
    test.'ok'(0, $S0)
    goto loop
.end


# set todo information
.sub 'set_todo_info'
    .local pmc todo_tests # keys indicate test file; values are just defined
               todo_tests = new 'Hash'

    .local pmc todo_info
               todo_info = new 'Hash'

    .local string test_file

    test_file = 're_tests'
    .local pmc jmpstack
               jmpstack = new 'ResizableIntegerArray'
    local_branch jmpstack,  reset_todo_info

    $S0 = 'character class in enumeration'
    todo_info[116] = $S0
    todo_info[119] = $S0
    todo_info[120] = $S0
    todo_info[123] = $S0
    todo_info[124] = $S0
    todo_info[127] = $S0

    $S0 = 'unknown reason'
#    todo_info[172] = $S0
#    todo_info[184] = $S0
#    todo_info[223] = $S0
#    todo_info[232] = $S0
#    todo_info[233] = $S0
    todo_info[234] = $S0
    todo_info[235] = $S0
    todo_info[236] = $S0
#    todo_info[241] = $S0
#    todo_info[243] = $S0
#    todo_info[244] = $S0
    todo_info[246] = $S0
    todo_info[247] = $S0
#    todo_info[253] = $S0
    todo_info[254] = $S0
    todo_info[256] = $S0
    todo_info[257] = $S0
#    todo_info[260] = $S0
#    todo_info[261] = $S0
    todo_info[381] = $S0
    todo_info[382] = $S0
    todo_info[396] = $S0
    todo_info[397] = $S0
    todo_info[398] = $S0
    todo_info[419] = $S0
    todo_info[422] = $S0
#    todo_info[428] = $S0
    todo_info[429] = $S0
    todo_info[432] = $S0
    todo_info[434] = $S0
    todo_info[435] = $S0
    todo_info[439] = $S0
#    todo_info[440] = $S0
#    todo_info[444] = $S0
#    todo_info[445] = $S0
    todo_info[446] = $S0
    todo_info[447] = $S0
    todo_info[448] = $S0
    todo_info[449] = $S0
    todo_info[452] = $S0
    todo_info[453] = $S0
    todo_info[454] = $S0
    todo_info[455] = $S0
    todo_info[495] = $S0
    todo_info[498] = $S0
    todo_info[500] = $S0
    todo_info[501] = $S0
    todo_info[503] = $S0
    todo_info[504] = $S0
    todo_info[505] = $S0
    todo_info[506] = $S0
    todo_info[507] = $S0
    todo_info[508] = $S0
    todo_info[509] = $S0
    todo_info[510] = $S0
    todo_info[511] = $S0
    todo_info[512] = $S0
    todo_info[515] = $S0
    todo_info[521] = $S0
    todo_info[522] = $S0
    todo_info[523] = $S0
    todo_info[524] = $S0
    todo_info[527] = $S0
    todo_info[528] = $S0
    todo_info[535] = $S0
    todo_info[536] = $S0
    todo_info[539] = $S0
    todo_info[540] = $S0
    todo_info[541] = $S0
    todo_info[544] = $S0
    todo_info[545] = $S0
    todo_info[559] = $S0
    todo_info[595] = $S0
    todo_info[596] = $S0
    todo_info[600] = $S0
    todo_info[601] = $S0
#    todo_info[602] = $S0
    todo_info[603] = $S0
    todo_info[604] = $S0
#    todo_info[605] = $S0
    todo_info[606] = $S0
    todo_info[607] = $S0
    todo_info[621] = $S0
    todo_info[623] = $S0
    todo_info[624] = $S0
    todo_info[625] = $S0
    todo_info[639] = $S0
    todo_info[641] = $S0
    todo_info[642] = $S0
    todo_info[643] = $S0
    todo_info[693] = $S0
    todo_info[695] = $S0
    todo_info[696] = $S0
    todo_info[697] = $S0
    todo_info[747] = $S0
    todo_info[749] = $S0
    todo_info[750] = $S0
    todo_info[751] = $S0
    todo_info[801] = $S0
#    todo_info[840] = $S0
    todo_info[858] = $S0
    todo_info[859] = $S0
#    todo_info[860] = $S0
#    todo_info[861] = $S0
    todo_info[862] = $S0
#    todo_info[863] = $S0
    todo_info[865] = $S0
    todo_info[866] = $S0
#    todo_info[874] = $S0
#    todo_info[875] = $S0
#    todo_info[876] = $S0
    todo_info[881] = $S0
#    todo_info[882] = $S0
    todo_info[887] = $S0
    todo_info[888] = $S0
    todo_info[890] = $S0
    todo_info[891] = $S0
    todo_info[893] = $S0
#    todo_info[894] = $S0
#    todo_info[895] = $S0
    todo_info[896] = $S0
    todo_info[897] = $S0
    todo_info[898] = $S0
    todo_info[899] = $S0
#    todo_info[900] = $S0

    $S0 = 'reuse captured group'
    todo_info[928] = $S0
    todo_info[929] = $S0
    todo_info[930] = $S0
    todo_info[931] = $S0
    todo_info[932] = $S0
    todo_info[933] = $S0
    todo_info[934] = $S0
    todo_info[935] = $S0
    todo_info[936] = $S0
    todo_info[937] = $S0
    todo_info[938] = $S0
    todo_info[939] = $S0
    todo_info[940] = $S0
    todo_info[941] = $S0
    todo_info[942] = $S0

    $S0 = 'non-greedy/lookbehind'
    todo_info[915] = $S0
    todo_info[916] = $S0
    todo_info[918] = $S0
#    todo_info[919] = $S0
#    todo_info[920] = $S0
    todo_info[921] = $S0
    todo_info[922] = $S0

    $S0 = 'greediness/lookbehind'
    todo_info[901] = $S0
#    todo_info[902] = $S0
#    todo_info[903] = $S0
    todo_info[904] = $S0
    todo_info[905] = $S0

    $S0 = 'non-greedy/zero-width assertion'
    todo_info[907] = $S0
    todo_info[908] = $S0
#    todo_info[909] = $S0
    todo_info[910] = $S0
#    todo_info[912] = $S0
    todo_info[913] = $S0
    todo_info[914] = $S0
    todo_info[960] = $S0

    $S0 = '\d in character class'
#    todo_info[825] = $S0
#    todo_info[826] = $S0
    todo_info[827] = $S0

    $S0 = '[ID 20010803.016]'
#    todo_info[884] = $S0

    $S0 = '[perl #34195]'
    todo_info[959] = $S0

    $S0 = 'undef [perl #16773]'
#    todo_info[925] = $S0

    $S0 = 'unmatched bracket'
    todo_info[923] = $S0

    $S0 = '16 tests for [perl #23171]'
    todo_info[927] = $S0

    todo_tests[test_file] = todo_info

    .return (todo_tests)

  reset_todo_info:
    todo_info = new 'Hash'
    local_return jmpstack

  set_todo_loop: # for developer testing. not used normally
    if $I0 > $I1 goto end_loop
    todo_info[$I0] = 1
    $I0 += 1
    goto set_todo_loop
  end_loop:
    local_return jmpstack
.end


# set skip information
.sub 'set_skip_info'
    .local pmc skip_tests # keys indicate test file; values are just defined
               skip_tests = new 'Hash'

    .local pmc skip_info
               skip_info = new 'Hash'

    .local string test_file

    test_file = 're_tests'
    .local pmc jmpstack
               jmpstack = new 'ResizableIntegerArray'
    local_branch jmpstack,  reset_skip_info

    $S0 = 'trailing modifiers'
    $I0 = 264
    $I1 = 395
    local_branch jmpstack,  set_range
    $I0 = 458
    $I1 = 480
    local_branch jmpstack,  set_range
    skip_info[483] = $S0
    skip_info[484] = $S0
    skip_info[496] = $S0
    $I0 = 609
    $I1 = 617
    local_branch jmpstack,  set_range
    $I0 = 627
    $I1 = 635
    local_branch jmpstack,  set_range
    $I0 = 645
    $I1 = 653
    local_branch jmpstack,  set_range
    $I0 = 663
    $I1 = 671
    local_branch jmpstack,  set_range
    $I0 = 681
    $I1 = 689
    local_branch jmpstack,  set_range
    $I0 = 699
    $I1 = 707
    local_branch jmpstack,  set_range
    $I0 = 717
    $I1 = 725
    local_branch jmpstack,  set_range
    $I0 = 735
    $I1 = 743
    local_branch jmpstack,  set_range
    $I0 = 753
    $I1 = 761
    local_branch jmpstack,  set_range
    $I0 = 771
    $I1 = 779
    local_branch jmpstack,  set_range
    $I0 = 789
    $I1 = 797
    local_branch jmpstack,  set_range
    skip_info[802] = $S0
    skip_info[803] = $S0
    skip_info[805] = $S0
    skip_info[834] = $S0
    skip_info[835] = $S0
    skip_info[836] = $S0
    skip_info[838] = $S0
    skip_info[859] = $S0
    skip_info[862] = $S0
    skip_info[877] = $S0
    skip_info[886] = $S0

    $S0 = 'bug or error'
    skip_info[143] = $S0
    skip_info[144] = $S0
    skip_info[148] = $S0
    skip_info[149] = $S0
    skip_info[155] = $S0
    skip_info[167] = $S0
    skip_info[248] = $S0
    skip_info[249] = $S0
    skip_info[252] = $S0
    skip_info[308] = $S0
    skip_info[309] = $S0
    skip_info[310] = $S0
    skip_info[322] = $S0
    skip_info[323] = $S0
    skip_info[325] = $S0
    skip_info[330] = $S0
    skip_info[331] = $S0
    skip_info[336] = $S0
    skip_info[347] = $S0
    skip_info[408] = $S0
    skip_info[436] = $S0
    skip_info[487] = $S0
    skip_info[488] = $S0
    skip_info[489] = $S0
    skip_info[490] = $S0
    skip_info[492] = $S0
    skip_info[531] = $S0
    skip_info[532] = $S0
    skip_info[563] = $S0
    skip_info[564] = $S0
    skip_info[566] = $S0
    skip_info[593] = $S0
    skip_info[594] = $S0
    skip_info[598] = $S0
    skip_info[599] = $S0
    skip_info[944] = $S0
    skip_info[945] = $S0

    $S0 = 'broken col 4?'
    skip_info[139] = $S0

    $S0 = 'kills a parrot'
    skip_info[491] = $S0
    skip_info[493] = $S0
    skip_info[556] = $S0
    skip_info[557] = $S0
    $I0 = 568
    $I1 = 592
    local_branch jmpstack,  set_range
    skip_info[800] = $S0
    skip_info[828] = $S0
    skip_info[829] = $S0
    skip_info[830] = $S0
    skip_info[957] = $S0
    skip_info[958] = $S0

    $S0 = 'hangs a parrot'
    $I0 = 806
    $I1 = 823
    local_branch jmpstack,  set_range
    skip_info[924] = $S0

    $S0 = 'unknown reason'
    skip_info[502] = $S0
    skip_info[597] = $S0
    skip_info[944] = $S0
    skip_info[945] = $S0

    $S0 = '[ID 20010811.006]'
    skip_info[879] = $S0

    $S0 = '[perl #18019]'
    skip_info[926] = $S0

    $S0 = 'parser bug'
    skip_info[138] = $S0

    skip_tests[test_file] = skip_info

    .return (skip_tests)

  reset_skip_info:
    skip_info = new 'Hash'
    local_return jmpstack

  set_range:                         # for setting a range of tests
    if $I0 > $I1 goto end_loop       # put range min in $I0, max in $I1
    if $S0 != '' goto set_skip_info  # put skip reason in $S0
    $S0 = 'unknown reason'
  set_skip_info:
    skip_info[$I0] = $S0
    $I0 += 1
    goto set_range
  end_loop:
    $S0 = ''
    local_return jmpstack
.end


.sub 'parse_data'
    .param string test_line   # the data record

    .local pmc regex          # the regex matching object
    .local pmc match          # the match
    .local string pattern     # the regex
    .local string target      # this string to match against the regex
    .local string result      # expected result of this test. (y/n/...)
    .local string testvar     # the value to test against expected results
    .local string expected    # the expected result of the match, or the error
    .local string description # user-facing description of the test.

    # NOTE: there can be multiple tabs between entries, so skip until
    # we have something.
    # remove the trailing newline from record
    test_line = chopn test_line, 1

    $P1 = split "\t", test_line

  get_pattern:
    unless $P1 goto bad_line
    pattern = shift $P1
    if pattern == '' goto get_pattern
  get_target:
    unless $P1 goto bad_line
    target = shift $P1
  get_result:
    unless $P1 goto bad_line
    result = shift $P1
    if result == '' goto get_result
  get_testvar:
    unless $P1 goto bad_line
    testvar = shift $P1
    if testvar == '' goto get_testvar
  get_expected:
    unless $P1 goto bad_line
    expected = shift $P1

  description = ''

  return:
    .return ( pattern, target, result, testvar, expected, description )

  bad_line:
     $P1 = new 'Exception'
     $P1[0] = 'invalid data format'
     throw $P1
.end


.sub 'build_test_desc'
    .param string desc
    .param string test_name
    .param string local_test_number

    $S0  = '['
    $S0 .= test_name
    $S0 .= ':'
    $S0 .= local_test_number
    $S0 .= '] '
    $S0 .= desc

    .return ($S0)
.end


.sub 'match_p5regex'
    .param string pattern
    .param string target

    .local pmc match

    .local pmc p5regex     # the perl5 regex compiler
               p5regex = compreg 'PGE::P5Regex'

    .local pmc regex
               regex = p5regex(pattern)

    unless_null regex, match_it
    $P1 = new 'Exception'
    $P1[0] = 'regex error'
    throw $P1
  match_it:
    match = regex(target)

    .return (match)
.end


# given a 2 digit string, convert to appropriate chr() value.
.sub hex_chr
    .param string hex

    $S0 = substr hex, 0, 1
    $S1 = substr hex, 1, 1

    $I0 = hex_val($S0)
    $I1 = hex_val($S1)

    $I0 *=16
    $I0 += $I1

    $S2 = chr $I0

    .return ($S2)
.end


# given a single digit hex value, return its int value.
.sub hex_val
    .param string digit

    $I0 = ord digit
    if $I0 < 48 goto bad_digit
    if $I0 > 57 goto non_numeric
    $I0 -=48
    .return ($I0)
  non_numeric:
    if $I0 < 65 goto bad_digit
    if $I0 > 70 goto not_capital
    $I0 -= 55 # A is ascii 65, so reset to zero, add 10 for hex..
    .return ($I0)
  not_capital:
    if $I0 < 97 goto  bad_digit
    if $I0 > 102 goto bad_digit
    $I0 -= 87 # a is ascii 97, so reset to zero, add 10 for hex..
    .return ($I0)

  bad_digit:
    $P1 = new 'Exception'
    $P1[0] = 'invalid hex digit'
    throw $P1
.end


.sub backslash_escape
    .param string target

    .local int x_pos         # position in string of last \x escape..
               x_pos = 0

  target1:
    $I0 = index target, '\n'
    if $I0 == -1 goto target2
    target = replace target, $I0, 2, "\n"
    goto target1
  target2:
    $I0 = index target, '\r'
    if $I0 == -1 goto target3
    target = replace target, $I0, 2, "\r"
    goto target2
  target3:
    $I0 = index target, '\e'
    if $I0 == -1 goto target4
    target = replace target, $I0, 2, "\e"
    goto target3
  target4:
    $I0 = index target, '\t'
    if $I0 == -1 goto target5
    target = replace target, $I0, 2, "\t"
    goto target4
  target5:
    $I0 = index target, '\f'
    if $I0 == -1 goto target6
    target = replace target, $I0, 2, "\f"
    goto target5
  target6:
    # handle \xHH, hex escape.

    $I0 = index target, '\x', x_pos
    if $I0 == -1 goto target7

    $I1 = length target
    $I2 = $I0 + 2

    if $I2 > $I1 goto target7
    $S0 = substr target, $I2, 2
    $S1 = hex_chr($S0)
    target = replace target, $I0, 4, $S1

    inc x_pos
    goto target6
  target7:
    .return (target)
.end

=head1 BUGS AND LIMITATIONS

Note that while our job would be easier if we could use regular expressions
in here, but we want to avoid any dependency on the thing we're testing.

Need to add in test IDs, to avoid the precarious line numbering.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
