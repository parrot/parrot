#!./parrot -G
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/compilers/pge/p6regex/01-regex.t  -- Basic P6 Regex tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>.
Individual tests are stored in the C<rx_*> files in the same directory;
There is one test per line: each test consists of the following
columns (separated by one *or more* tabs):

=over 4

=item pattern

The Perl6 regex to test.

=item target

The string that will be matched against the pattern. Use '' to indicate
an empty string.

=item result

The expected result of the match. Either C<y> or for a successful match, C<n>
for a failed one. Otherwise the output is expected to begin and end with
C</>.

This result is used in one of two ways: If an exception is thrown by the
match, the result must be contained in the exception's message. If the match
succeeds, then the message must be contained in a dump of the match object.

=item test id

A unique test identifier. This allows us to track TODO/SKIP information in
*this* file instead of the associated test file, which lets us easily
share the tests across implementations of perl6's regex engine.

=item description

Description of the test.

=back

=head1 SYNOPSIS

    % prove t/compilers/pge/01-regex.t

=cut

.sub main :main
    load_bytecode 'Test/Builder.pir'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    .include "iglobals.pasm"

    # Variable declarations, initializations
    .local pmc test       # the test harness object.
               test = new 'Test::Builder'

    .local pmc todo_tests # keys indicate test file; values test number.
               todo_tests = new 'Hash'

    .local pmc skip_tests # keys indicate tests ID; values reasons.
               skip_tests = new 'Hash'

    .local string test_dir # the directory containing tests
                  test_dir = 't/compilers/pge/p6regex/'

    .local pmc test_files # values are test file names to run.
               test_files = new 'ResizablePMCArray'

    push test_files, 'rx_metachars'
    push test_files, 'rx_backtrack'
    push test_files, 'rx_charclass'
    push test_files, 'rx_subrules'
    push test_files, 'rx_lookarounds'
    push test_files, 'rx_captures'
    push test_files, 'rx_modifiers'

    .local pmc interp     # a handle to our interpreter object.
               interp = getinterp

    .local pmc config
               config = interp[.IGLOBALS_CONFIG_HASH]

    .local int has_icu    # flag indicating presense of icu
               has_icu = config['has_icu']

    .local pmc p6rule     # the perl6 regex compiler
               p6rule = compreg 'PGE::P6Regex'

    .local pmc file_iterator # iterate over list of files..
               file_iterator = new 'Iterator', test_files

    .local int test_number   # the number of the test we're running
               test_number = 0

    # these vars are in the loops below
    .local pmc file_handle   # currently open file.
    .local string test_file  # name of the current test file
    .local string test_line  # one line of one test file, a single test
    .local int ok            # is this a passing test?

    # for any given test:
    .local pmc rule           # the rule
    .local pmc match          # the match
    .local string pattern     # the regexp
    .local string target      # this string to match against the regex
    .local string result      # expected result of this test. (y/n/...)
    .local string description # user-facing description of the test.

    # how many tests to run?
    # XXX: this should be summed automatically from test_files data
    #      until then, it's set to no plan
    test.'plan'('no_plan')

    # set todo information
    .local pmc todo_info
    .local string test_file

    test_file = 'rx_metachars'
    bsr reset_todo_info
    todo_info[78]  = 1
    todo_info[79]  = 1
    todo_info[81]  = 1
    todo_info[91]  = 1
    todo_info[92]  = 1
    todo_info[94]  = 1
    todo_info[95]  = 1
    todo_info[96]  = 1
    todo_info[101] = 1
    todo_info[103] = 1
    todo_info[105] = 1
    todo_info[113] = 1
    todo_info[114] = 1
    todo_info[115] = 1
    todo_info[116] = 1
    todo_info[119] = 1
    todo_info[120] = 1
    todo_info[121] = 1
    todo_tests[test_file] = todo_info

    test_file = 'rx_charclass'
    bsr reset_todo_info
    todo_info[17] = 1
    todo_tests[test_file] = todo_info

    test_file = 'rx_subrules'
    bsr reset_todo_info
    todo_info[29] = 1
    todo_info[30] = 1
    todo_info[31] = 1
    todo_info[40] = 1
    todo_tests[test_file] = todo_info

    test_file = 'rx_lookarounds'
    bsr reset_todo_info
    todo_info[20] = 1
    todo_tests[test_file] = todo_info

    test_file = 'rx_captures'
    bsr reset_todo_info
    todo_info[14] = 1
    todo_info[15] = 1
    todo_info[16] = 1
    todo_info[38] = 1
    todo_info[39] = 1
    todo_info[40] = 1
    todo_tests[test_file] = todo_info

    test_file = 'rx_modifiers'
    bsr reset_todo_info
    todo_info[86] = 1
    todo_info[91] = 1
    todo_info[96] = 1
    todo_info[97] = 1
    todo_tests[test_file] = todo_info

    branch set_skip

  reset_todo_info:
    todo_info = new .Hash
    ret

  set_skip:
    # set skip information
    .local pmc skip_info

    if has_icu goto done_icu

    test_file = 'rx_metachars'
    bsr reset_skip_info
    # skip_info[121] = 'no ICU'
    # skip_tests[test_file] = skip_info
    branch done_icu

  reset_skip_info:
    skip_info = new .Hash
    ret

  done_icu:
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
    file_handle = open test_file, '<'
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

    # NOTE: there can be multiple tabs between entries, so skip until
    # we have something.
    $P1 = split "\t", test_line
    $I0 = elements $P1 # length of array
    .local int tab_number
    tab_number = 0
  get_pattern:
    if tab_number >= $I0 goto bad_line
    pattern     = $P1[tab_number]
    inc tab_number
    if pattern == '' goto get_pattern
  get_target:
    if tab_number >= $I0 goto bad_line
    target      = $P1[tab_number]
    inc tab_number
    if target == '' goto get_target
  get_result:
    if tab_number >= $I0 goto bad_line
    result      = $P1[tab_number]
    inc tab_number
    if result == '' goto get_result
  get_description:
    if tab_number >= $I0 goto bad_line
    description = $P1[tab_number]
    inc tab_number
    if description == '' goto get_description

    # chop (description)
    substr description, -1, 1, ''

    # prepend test filename and line number to description
    $S0  = '['
    $S0 .= test_name
    $S0 .= ':'
    $S1 = local_test_number
    $S0 .= $S1
    $S0 .= '] '
    description = concat $S0, description

    if target != "''" goto got_target
    target = ''

  got_target:
    target = backslash_escape (target)
    result = backslash_escape (result)

    # Should this test be skipped?
    $I0 = exists skip_tests[test_name]
    unless $I0 goto not_skip
    $P0 = skip_tests[test_name]
    $I0 = exists $P0[local_test_number]
    unless $I0 goto not_skip
    test.'skip'(1, description)
    goto loop

  not_skip:
    push_eh thrown
      rule =  p6rule(pattern)
      unless_null rule, match_it
      $P1 = new 'Exception'
      $P1[0] = 'rule error'
      throw $P1
    match_it:
      match = rule(target)
    clear_eh

    if match goto matched

    if result == 'n' goto is_ok
    if result == 'y' goto is_nok
    goto check_dump

  matched:
    if result == 'y' goto is_ok
    if result == 'n' goto is_nok
    # goto check_dump

  check_dump:
    $S1 = match.'dump_str'('mob', ' ', '')

    # remove /'s
    $S0 = substr result, 0, 1
    if $S0 != "/" goto bad_line
    substr result, 0, 1, ''
    substr result, -1, 1, ''

    $I0 = index $S1, result
    if $I0 == -1 goto is_nok
    # goto is_ok

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
    test.'todo'(ok,description)
    goto loop
  not_todo:
    test.'ok'(ok,description)

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
    .sym pmc exception
    .sym string message
    get_results '(0,0)', exception, message
    # remove /'s
    $S0 = substr result, 0, 1
    if $S0 != "/" goto bad_error
    substr result, 0, 1, ''
    substr result, -1, 1, ''
    $I0 = index message, result
    if $I0 == -1 goto bad_error
    ok = 1
    goto emit_test
  bad_error:
    ok = 0
    goto emit_test
  bad_line:
    $S0 = "Test not formatted properly!"
    test.'ok'(0, $S0)
    goto loop

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

# given a single digit hex value, return it's int value.
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
    substr target, $I0, 2, "\n"
    goto target1
  target2:
    $I0 = index target, '\r'
    if $I0 == -1 goto target3
    substr target, $I0, 2, "\r"
    goto target2
  target3:
    $I0 = index target, '\e'
    if $I0 == -1 goto target4
    substr target, $I0, 2, "\e"
    goto target3
  target4:
    $I0 = index target, '\t'
    if $I0 == -1 goto target5
    substr target, $I0, 2, "\t"
    goto target4
  target5:
    $I0 = index target, '\f'
    if $I0 == -1 goto target6
    substr target, $I0, 2, "\f"
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
    substr target, $I0, 4, $S1

    inc x_pos
    goto target6
  target7:
    .return (target)
.end

=head1 BUGS AND LIMITATIONS

Note that while our job would be easier if we could use regular expressions
in here, but we want to avoid any dependency on the thing we're testing.

Need to add in test ids, to avoid the precarious line numbering.

=cut

