#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/pge/perl6regex/01-regex.t  -- Basic Perl6Regex tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>.
Individual tests are stored in the C<rx_*> files in the same directory;
There is one test per line: each test consists of the following
columns (separated by one *or more* tabs):

=over 4

=item pattern

The Perl 6 regex to test.

=item target

The string that will be matched against the pattern. Use '' to indicate
an empty string.

=item result

The expected result of the match. Either C<y> for a successful match, C<n>
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

.const string TESTS = 'no_plan'

.loadlib 'io_ops'

.sub main :main
    load_bytecode 'Test/Builder.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'String/Utils.pbc'
    .include "iglobals.pasm"

    # Variable declarations, initializations
    .local pmc test       # the test harness object.
               test = new [ 'Test'; 'Builder' ]

    .local string test_dir # the directory containing tests
                  test_dir = 't/compilers/pge/perl6regex/'

    .local pmc test_files # values are test file names to run.
               test_files = new 'ResizablePMCArray'

    # populate the list of test files
    push test_files, 'rx_metachars'
    push test_files, 'rx_quantifiers'
    push test_files, 'rx_backtrack'
    push test_files, 'rx_charclass'
    push test_files, 'rx_subrules'
    push test_files, 'rx_lookarounds'
    push test_files, 'rx_captures'
    push test_files, 'rx_modifiers'
    push test_files, 'rx_syntax'
    push test_files, 'rx_goal'

    .local pmc interp     # a handle to our interpreter object.
               interp = getinterp

    .local pmc config
               config = interp[.IGLOBALS_CONFIG_HASH]

    .local int has_icu    # flag indicating presense of icu
               has_icu = config['has_icu']

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
    .local int skiptest       # if the test is '# skip'
    .local int todotest       # if the test is '# todo'
    .local string reason      # reason for todo/skip
    .local pmc rule           # the rule
    .local pmc match          # the match
    .local string pattern     # the regexp
    .local string target      # this string to match against the regex
    .local string result      # expected result of this test. (y/n/...)
    .local string description # user-facing description of the test.

    # how many tests to run?
    # XXX: this should be summed automatically from test_files data
    #      until then, it's set to no plan
    test.'plan'(TESTS)


  outer_loop:
    unless file_iterator goto end_outer_loop
    .local string test_name
                  test_name = shift file_iterator
    # local test number in test file
    .local int local_test_number
               local_test_number = 0

    # local line number in test file
    .local int local_line_number
               local_line_number = 0

    # append the test directory and filename
    test_file = test_dir . test_name

    # Open the test file
    file_handle = open test_file, 'r'
    $S0 = typeof file_handle
    if $S0 == 'Undef' goto bad_file

  next_test:
    skiptest = 0
    todotest = 0
    trace 0

    # loop over the file, one at a time.
  loop:
    # read in the file one line at a time...
    $I0 = file_handle.'eof'()
    if $I0 goto end_loop

    test_line = readline file_handle
    inc local_line_number

    # if this line is not a comment, try a test
    $S0 = substr test_line, 0, 1
    if $S0 != '#' goto parse_test

  parse_comment:
    # line is a comment, if no :pge<...> then skip comment
    $I0 = index test_line, ':pge<'
    if $I0 == -1 goto loop

    # extract out the reason for skip or todo
    $I0 += 5
    $I1 = index test_line, '>', $I0
    $I1 -= $I0
    reason = substr test_line, $I0, $I1

    # determine skip/todo
    $P0 = split ' ', test_line
    $S0 = $P0[1]
    if $S0 == 'skip' goto comment_skip
    if $S0 == 'todo' goto comment_todo
    if $S0 == 'trace' goto comment_trace
    goto loop
  comment_skip:
    skiptest = 1
    goto loop
  comment_todo:
    todotest = 1
    goto loop
  comment_trace:
    $I0 = reason
    trace $I0
    goto loop

  parse_test:
    # skip lines without tabs
    $I0 = index test_line, "\t"
    if $I0 == -1 goto loop
    inc test_number
    inc local_test_number

  parse_data:
    push_eh eh_bad_line
    ( pattern, target, result, description ) = parse_data( test_line )
    pop_eh

    # prepend test filename and line number to description
    description = 'build_test_desc'( description, test_name, local_line_number )

    if target != "''" goto got_target
    target = ''

  got_target:
    target = 'backslash_escape'( target )
    result = 'backslash_escape'( result )

    # Should this test be skipped?
    unless skiptest goto not_skip
    test.'skip'(1, reason)
    goto next_test

  not_skip:
    push_eh thrown
    match = 'match_perl6regex'( pattern, target )
    pop_eh

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
    result = replace result, 0, 1, ''
    result = replace result, -1, 1, ''

    $I0 = index $S1, result
    if $I0 == -1 goto is_nok
    # goto is_ok

  is_ok:
    ok = 1
    goto emit_test
  is_nok:
    ok = 0

  emit_test:
    unless todotest goto not_todo
    test.'todo'(ok, description, reason)
    goto next_test
  not_todo:
    test.'ok'(ok, description)
    goto next_test

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
    print '# '
    say message
    # remove /'s
    $S0 = substr result, 0, 1
    if $S0 != "/" goto bad_error
    result = replace result, 0, 1, ''
    result = replace result, -1, 1, ''
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
  eh_bad_line:
    $S0 = "Test not formatted properly!"
    test.'ok'(0, $S0)
    goto loop
.end


.sub 'parse_data'
    .param string test_line   # the data record

    .local pmc rule           # the rule
    .local pmc match          # the match
    .local string pattern     # the regexp
    .local string target      # this string to match against the regex
    .local string result      # expected result of this test. (y/n/...)
    .local string description # user-facing description of the test.

    # NOTE: there can be multiple tabs between entries, so skip until
    # we have something.
    # remove the trailing newline from record
    test_line = chopn test_line, 1

    $P1 = split "\t", test_line
    $I0 = elements $P1 # length of array
    .local int tab_number
               tab_number = 0
  get_pattern:
    if tab_number >= $I0 goto bad_line
    pattern     = $P1[tab_number]
    inc tab_number
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

  return:
    .return ( pattern, target, result, description )

  bad_line:
      $P1 = new 'Exception'
      $P1 = 'invalid data format'
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

    desc = concat $S0, desc

    .return (desc)
.end


.sub 'match_perl6regex'
    .param string pattern
    .param string target

    .local pmc match

    .local pmc p6rule     # the perl6 regex compiler
               p6rule = compreg 'PGE::Perl6Regex'

    .local pmc rule
               rule = p6rule(pattern)

    unless_null rule, match_it
    $P1 = new 'Exception'
    $P1 = 'rule error'
    throw $P1
  match_it:
    match = rule(target)

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
  $P1 = 'invalid hex digit'
  throw $P1
.end


.sub backslash_escape
    .param string target

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

    $I0 = index target, '\x'
    if $I0 == -1 goto target7

    $I1 = $I0 + 2
    $P0 = get_hll_global ['String';'Utils'], 'convert_digits_to_string'
    ($S0, $I2) = $P0(target, 'x', $I1)
    $S3 = substr target, $I1, $I2
    $I2 += 2
    target = replace target, $I0, $I2, $S0
    goto target6
  target7:
    .return (target)
.end

=head1 BUGS AND LIMITATIONS

Note that while our job would be easier if we could use regular expressions
in here, but we want to avoid any dependency on the thing we're testing.

Need to add in test ids, to avoid the precarious line numbering.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
