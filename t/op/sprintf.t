#!./parrot -G
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/op/sprintf.t  -- sprintf tests

=head1 DESCRIPTION

These tests are based on sprintf tests from perl 5.9.4.

Tests sprintf, excluding handling of 64-bit integers or long
doubles (if supported), of machine-specific short and long
integers, machine-specific floating point exceptions (infinity,
not-a-number ...), of the effects of locale, and of features
specific to multi-byte characters (under the utf8 pragma and such).

Individual tests are stored in the C<sprintf_tests> file in the same
directory; There is one test per line. In each test, there are three
required fields:

=over 4

=item printf template

=item data to be formatted (as a parrot expression)

=item expected result of formatting

=back

Optional fields contain

=over 4

=item a comment

=back

Each field is separated by one or more tabs.  If formatting requires more than
one data item (for example, if variable field widths are used), the Parrot
data expression should return a reference to an array having the requisite
number of elements.  Even so, subterfuge is sometimes required:
see tests for %n and %p.

XXX: FIXME: TODO:
Tests that are expected to fail on a certain OS can be marked as such
by trailing the comment with a skip: section. Skips are tags separated
by space consisting of a $^O optionally trailed with :osvers. In the
latter case, all os-levels below that are expected to fail. A special
tag 'all' is allowed for todo tests that should fail on any system

>%G<   >1234567e96<  >1.23457E+102<   >exponent too big skip: os390<
>%.0g< >-0.0<        >-0<             >No minus skip: MSWin32 VMS hpux:10.20<
>%d<   >4<           >1<              >4 != 1 skip: all<

=head1 SYNOPSIS

    % prove t/op/sprintf.t

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
                  test_dir = 't/op/'

    .local pmc test_files # values are test file names to run.
               test_files = new 'ResizablePMCArray'

    # populate the list of test files
    push test_files, 'sprintf_tests'


    .local pmc file_iterator # iterate over list of files..
               file_iterator = new 'Iterator', test_files

    .local int test_number   # the number of the test we're running
               test_number = 0

    # these vars are in the loops below
    .local string test_line  # one line of one test file, a single test
    .local int ok            # is this a passing test?

    # for any given test:
    .local string template    # the sprintf template
    .local string data        # the data to format with the template
    .local string expected    # expected result of this test
    .local string description # user-facing description of the test
    .local string actual      # actual result of the test

    todo_tests = 'set_todo_info'()
    skip_tests = 'set_skip_info'()

    # how many tests to run?
    # XXX: this should be summed automatically from test_files data
    #      until then, it's set to no plan
    test.'plan'(308)

  outer_loop:
    unless file_iterator goto end_outer_loop
    .local string test_name       # file name of the current test file
                  test_name = shift file_iterator

    .local string test_file       # full name of the current test file
                  test_file = test_dir . test_name

    .local int local_test_number  # local test number in test file
               local_test_number = 0

    # Open the test file
    .local pmc file_handle   # currently open file
               file_handle = open test_file, '<'

    unless file_handle goto bad_file

    # loop over the file, one at a time.

  loop:
    # read in the file one line at a time...
    $I0 = file_handle.'eof'()
    if $I0 goto end_loop

    test_line = readline file_handle

    # skip lines without tabs, and comment lines
    $I0 = index test_line, "\t"
    if $I0 == -1 goto loop
    $I0 = index test_line, '#'
    if $I0 == 0 goto loop
    inc test_number
    inc local_test_number

  parse_data:
    push_eh eh_bad_line
    ( template, data, expected, description ) = parse_data( test_line )
    clear_eh

    # prepend test filename and line number to description
    description = 'build_test_desc'( description, template )

    if data != "''" goto got_data
    data = ''

  got_data:
#    data     = backslash_escape (data)
#    expected = backslash_escape (expected)

    # Should this test be skipped?
    $I0 = exists skip_tests[test_name]
    unless $I0 goto not_skip
    $P0 = skip_tests[test_name]
    $I0 = exists $P0[local_test_number]
    unless $I0 goto not_skip
    $S0 = $P0[local_test_number]
    test.'skip'(1, $S0)
    goto loop

  not_skip:
    push_eh eh_sprintf
    actual = 'sprintf'(template, data)
    clear_eh
    unless_null actual, sprintf_ok
    $P1 = new 'Exception'
    $P1[0] = 'sprintf error'
    throw $P1
  sprintf_ok:
    clear_eh

    if expected == actual goto is_ok
    goto is_nok

    # remove /'s
    $S0 = substr expected, 0, 1
    if $S0 != "/" goto eh_bad_line
    substr expected, 0, 1, ''
    substr expected, -1, 1, ''

    $I0 = index $S1, expected
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

  eh_sprintf:
    .sym pmc exception
    .sym string message
    get_results '(0,0)', exception, message
    $I0 = index message, 'is not a valid sprintf format'
    if $I0 == -1 goto other_error
    $I0 = index expected, ' INVALID'
    if $I0 == -1 goto bad_error
    ok = 1
    goto emit_test
  other_error:
  bad_error:
    ok = 0
    goto emit_test
  eh_bad_line:
    $S0 = "Test not formatted properly!"
    test.'ok'(0, $S0)
    goto loop

.end


.sub 'sprintf'
    .param pmc args :slurpy

    $S0 = shift args
    $S1 = sprintf $S0, args

    .return ($S1)
.end


# set todo information
.sub 'set_todo_info'
    .local pmc todo_tests # keys indicate test file; values test number
               todo_tests = new 'Hash'

    .local pmc todo_info
               todo_info = new 'Hash'

    .local string test_file

    bsr reset_todo_info
    test_file = 'sprintf_tests'
    todo_tests[test_file] = todo_info

    .return (todo_tests)

  reset_todo_info:
    todo_info = new .Hash
    ret

  set_todo_loop:
    if $I0 > $I1 goto end_loop
    todo_info[$I0] = 1
    $I0 += 1
    goto set_todo_loop
  end_loop:
    ret
.end


# set skip information
.sub 'set_skip_info'
    .local pmc skip_tests # keys indicate test file; values test number
               skip_tests = new 'Hash'

    .local pmc skip_info
               skip_info = new 'Hash'

    .local string test_file

    bsr reset_skip_info
    test_file = 'sprintf_tests'
    skip_info[14] = 'unknown reason'
    skip_info[15] = 'unknown reason'

    $I0 = 45
    $I1 = 235
    bsr set_skip_loop

    $I0 = 259
    $I1 = 264
    bsr set_skip_loop

    $I0 = 252
    $I1 = 297
    $S0 = '%v unsupported'
    bsr set_skip_loop

    skip_tests[test_file] = skip_info

    .return (skip_tests)

  reset_skip_info:
    skip_info = new .Hash
    ret

  set_skip_loop:
    if $I0 > $I1 goto end_loop
    if $S0 != '' goto set_skip_info
    $S0 = 'unknown reason'
  set_skip_info:
    skip_info[$I0] = $S0
    $I0 += 1
    goto set_skip_loop
  end_loop:
    $S0 = ''
    ret
.end


.sub 'parse_data'
    .param string record      # the data record

    .local string template    # the sprintf template
    .local string data        # the data to format with the template
    .local string expected    # expected result of this test
    .local string description # user-facing description of the test

    # NOTE: there can be multiple tabs between entries, so skip until
    # we have something.
    $P1 = split "\t", record
    $I0 = elements $P1 # length of array
    .local int tab_number
               tab_number = 0
  get_template:
    if tab_number >= $I0 goto bad_line
    template       = $P1[tab_number]
    inc tab_number
    if template == '' goto get_template
  get_data:
    if tab_number >= $I0 goto bad_line
    data           = $P1[tab_number]
    inc tab_number
    if data == '' goto get_data
  get_expected:
    if tab_number >= $I0 goto bad_line
    expected       = $P1[tab_number]
    inc tab_number
    if expected == '' goto get_expected
    ## FIXME: description handling
  get_description:
    if tab_number >= $I0 goto no_desc
    description    = $P1[tab_number]
    inc tab_number
    if description == '' goto get_description

    # chop (description)
    substr description, -1, 1, ''

  return:
    .return ( template, data, expected, description )

  no_desc:
    description = ''
    goto return

  bad_line:
      $P1 = new 'Exception'
      $P1[0] = 'invalid data format'
      throw $P1
.end


.sub 'build_test_desc'
    .param string desc
    .param string testname

    $S0  = '['
    $S0 .= testname
    $S0 .= '] '

    desc = concat $S0, desc

    .return (desc)
.end


# The following tests are not currently run, for the reasons stated:

=pod

=begin problematic

>%.0f<      >1.5<         >2<   >Standard vague: no rounding rules<
>%.0f<      >2.5<         >2<   >Standard vague: no rounding rules<

=end problematic

=cut

# vim: sw=4 expandtab
