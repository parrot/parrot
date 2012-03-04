# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

TAP/Formatter

=head2 DESCRIPTION

Simplified port of TAP::Harness (version 3.21)

See L<http://search.cpan.org/~andya/Test-Harness/>

=head3 Class TAP;Formatter;Base

Base class for harness output delegates

=over 4

=cut

.namespace ['TAP';'Formatter';'Base']

.sub '' :tag('init') :tag('load') :anon
    $P0 = newclass ['TAP';'Formatter';'Base']
    $P0.'add_attribute'('verbosity')
    $P0.'add_attribute'('normalize')
    $P0.'add_attribute'('failures')
    $P0.'add_attribute'('comments')
    $P0.'add_attribute'('directives')
    $P0.'add_attribute'('_longest')
    $P0.'add_attribute'('_printed_summary_header')
.end

.sub 'init' :vtable :method
    $P0 = box 0
    setattribute self, 'verbosity', $P0
.end

=item process_args

=cut

.sub 'process_args' :method
    .param pmc opts
    $I0 = exists opts['verbose']
    unless $I0 goto L1
    $P0 = box 1
    setattribute self, 'verbosity', $P0
  L1:
    $I0 = exists opts['quiet']
    unless $I0 goto L2
    $P0 = box -1
    setattribute self, 'verbosity', $P0
  L2:
    $I0 = exists opts['QUIET']
    unless $I0 goto L3
    $P0 = box -2
    setattribute self, 'verbosity', $P0
  L3:
    $I0 = exists opts['normalize']
    unless $I0 goto L4
    $P0 = new 'Boolean'
    set $P0, 1
    setattribute self, 'normalize', $P0
  L4:
    $I0 = exists opts['failures']
    unless $I0 goto L5
    $P0 = new 'Boolean'
    set $P0, 1
    setattribute self, 'failures', $P0
  L5:
    $I0 = exists opts['comments']
    unless $I0 goto L6
    $P0 = new 'Boolean'
    set $P0, 1
    setattribute self, 'comments', $P0
  L6:
    $I0 = exists opts['directives']
    unless $I0 goto L7
    $P0 = new 'Boolean'
    set $P0, 1
    setattribute self, 'directives', $P0
  L7:
.end

=item verbose

=cut

.sub 'verbose' :method
    $P0 = getattribute self, 'verbosity'
    $I0 = $P0
    $I0 = $I0 >= 1
    .return ($I0)
.end

=item quiet

=cut

.sub 'quiet' :method
    $P0 = getattribute self, 'verbosity'
    $I0 = $P0
    $I0 = $I0 <= -1
    .return ($I0)
.end

=item really_quiet

=cut

.sub 'really_quiet' :method
    $P0 = getattribute self, 'verbosity'
    $I0 = $P0
    $I0 = $I0 <= -2
    .return ($I0)
.end

=item silent

=cut

.sub 'silent' :method
    $P0 = getattribute self, 'verbosity'
    $I0 = $P0
    $I0 = $I0 <= -3
    .return ($I0)
.end

=item prepare

=cut

.sub 'prepare' :method
    .param pmc tests
    .local int longest
    longest = 0
    $P0 = iter tests
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $I0 = length $S0
    unless $I0 > longest goto L1
    longest = $I0
    goto L1
  L2:
    $P0 = box longest
    setattribute self, '_longest', $P0
.end

=item _format_name

=cut

.sub '_format_name' :method
    .param string name
    $P0 = new 'StringBuilder'
    push $P0, name
    push $P0, ' '
    $P1 = getattribute self, '_longest'
    $I0 = $P1
    $I0 += 2
    $I1 = length name
    $I0 -= $I1
    $S0 = repeat '.', $I0
    push $P0, $S0
    push $P0, ' '
    .return ($P0)
.end

.sub 'open_test' :method
    die "Unimplemented."
.end

=item summary

=cut

.sub 'summary' :method
    .param pmc aggregate
    $I0 = self.'silent'()
    if $I0 goto L1
    .local pmc tests
    tests = aggregate.'descriptions'()
    .local string runtime
    runtime = aggregate.'elapsed_timestr'()
    .local int total, passed
    total = aggregate.'total'()
    passed = aggregate.'passed'()

    $I0 = aggregate.'all_passed'()
    unless $I0 goto L2
    self.'_output_success'("All tests successful.\n")
  L2:

    if total != passed goto L3
    $I0 = aggregate.'has_problems'()
    unless $I0 goto L4
  L3:
    self.'_output'("\nTest Summary Report")
    self.'_output'("\n-------------------\n")
    $P0 = iter tests
  L5:
    unless $P0 goto L4
    .local string test
    test = shift $P0
    $P1 = box 0
    setattribute self, '_printed_summary_header', $P1
    .local pmc parser
    parser = aggregate.'parsers'(test)
    $P2 = parser.'failed'()
    self.'_output_summary_failure'($P2, '  Failed test:  ', '  Failed tests:  ', test, parser)
    $P2 = parser.'todo_passed'()
    self.'_output_summary_failure'($P2, "  TODO passed:   ", "  TODO passed:   ", test, parser)

    .local int _exit
    _exit = parser.'exit'()
    unless _exit goto L6
    self.'_summary_test_header'(test, parser)
    $S1 = _exit
    self.'_failure_output'("  Non-zero exit status: ", $S1, "\n")
  L6:

    .local pmc errors
    errors = parser.'parse_errors'()
    $I0 = elements errors
    unless $I0 goto L5
    self.'_summary_test_header'(test, parser)
    $P2 = iter errors
    $S1 = shift $P2
    self.'_failure_output'("  Parse errors: ", $S1, "\n")
  L8:
    unless $P2 goto L5
    $S1 = repeat ' ', 16
    $S2 = shift $P2
    self.'_failure_output'($S1, $S2, "\n")
    goto L8

  L4:
    $I0 = elements tests
    $S1 = $I0
    $S2 = total
    self.'_output'("Files=", $S1, ", Tests=", $S2, ",  ", runtime, "\n")
    $S1 = aggregate.'get_status'()
    self.'_output'("Result: ", $S1, "\n")
  L1:
.end

.sub '_output_summary_failure' :method
    .param pmc r
    .param string singular
    .param string plural
    .param string test
    .param pmc parser
    $I0 = elements r
    unless $I0 goto L1
    self.'_summary_test_header'(test, parser)
    unless $I0 == 1 goto L2
    self.'_output'(singular)
    goto L3
  L2:
    self.'_output'(plural)
  L3:
    .local pmc results
    results = self.'_balanced_range'(40, r)
    $S1 = shift results
    self.'_output'($S1, "\n")
  L4:
    unless results goto L1
    $S1 = repeat ' ', 16
    $S2 = shift results
    self.'_output'($S1, $S2, "\n")
    goto L4
  L1:
.end

.sub '_summary_test_header' :method
    .param string test
    .param pmc parser
    .local pmc _printed_summary_header
    _printed_summary_header = getattribute self, '_printed_summary_header'
    if _printed_summary_header goto L1
    .local string spaces, tests_run, failed
    $P0 = getattribute self, '_longest'
    $I0 = $P0
    $I1 = length test
    $I0 -= $I1
    inc $I0
    spaces = repeat ' ', $I0
    tests_run = parser.'tests_run'()
    $P0 = parser.'failed'()
    $I0 = elements $P0
    failed = $I0
    self.'_output'(test, spaces, "(Tests: ", tests_run, " Failed: ", failed, ")\n")
    set _printed_summary_header, 1
  L1:
.end

=item _output

=cut

.sub '_output' :method
    .param pmc args :slurpy
    $S0 = join '', args
    print $S0
.end

=item _failure_output

=cut

.sub '_failure_output' :method
    .param pmc args :slurpy
    self.'_output'(args :flat)
.end

.sub '_output_success' :method
    .param pmc args :slurpy
    self.'_output'(args :flat)
.end

.sub '_balanced_range' :method
    .param int limit
    .param pmc range
    range = self.'_range'(range)
    .local string line
    line = ''
    .local pmc lines
    lines = new 'ResizableStringArray'
    .local int curr
    curr = 0
  L1:
    unless range goto L2
    unless curr < limit goto L3
    $S0 = shift range
    $S0 .= ", "
    line .= $S0
    $I0 = length $S0
    curr += $I0
    goto L1
  L3:
    unless range goto L1
    $I0 = length line
    $I0 -= 2
    line = substr line, 0, $I0
    push lines, line
    line = ''
    curr = 0
    goto L1
  L2:
    if line == '' goto L9
    $I0 = length line
    $I0 -= 2
    line = substr line, 0, $I0
    push lines, line
  L9:
    .return (lines)
.end

.sub '_range' :method
    .param pmc numbers
    .local int min, i, _num, next
    .local pmc range
    range = new 'ResizableStringArray'
    push numbers, -1
    min = -1
  L1:
    _num = shift numbers
    if _num == -1 goto L2
    next = shift numbers
    unshift numbers, next
    $I0 = _num + 1
    unless next == $I0 goto L3
    unless min == -1 goto L1
    min = _num
    goto L1
  L3:
    unless min != -1 goto L4
    $S0 = min
    $S0 .= '-'
    $S1 = _num
    $S0 .= $S1
    push range, $S0
    min = -1
    goto L1
  L4:
    $S0 = _num
    push range, $S0
    goto L1
  L2:
    .return (range)
.end

=back

=head3 Class TAP;Formatter;Session

Abstract base class for harness output delegate

=over 4

=cut

.namespace ['TAP';'Formatter';'Session']

.sub '' :tag('init') :tag('load') :anon
    $P0 = newclass ['TAP';'Formatter';'Session']
    $P0.'add_attribute'('name')
    $P0.'add_attribute'('formatter')
    $P0.'add_attribute'('parser')
    $P0.'add_attribute'('show_count')
.end

.sub 'init' :vtable :nsentry
    $P0 = getattribute self, 'show_count'
    unless null $P0 goto L1
    $P0 = new 'Boolean'
    set $P0, 1
    setattribute self, 'show_count', $P0
  L1:
.end

=item header

=cut

.sub 'header' :method
    # nothing
.end

=item result

=cut

.sub 'result' :method
    .param pmc result
    # nothing
.end

=item close_test

=cut

.sub 'close_test' :method
    # nothing
.end

=item clear_for_close

=cut

.sub 'clear_for_close' :method
    # nothing
.end

.sub '_should_show_count' :method
    $P0 = getattribute self, 'formatter'
    $I0 = $P0.'verbose'()
    unless $I0 goto L1
    .return (0)
  L1:
    # work in progress
    .return (1)
.end

.sub '_format_for_output' :method
    .param pmc result
    $P0 = getattribute self, 'formatter'
    $P0 = getattribute $P0, 'normalize'
    if null $P0 goto L1
    unless $P0 goto L1
    $S0 = result
    .return ($S0)
  L1:
    $P0 = getattribute result, 'raw'
    .return ($P0)
.end

.sub '_output_test_failure' :method
    .param pmc parser
    .local pmc formatter
    formatter = getattribute self, 'formatter'
    $I0 = formatter.'really_quiet'()
    if $I0 goto L1

    .local pmc tests_run, tests_planned
    tests_run = parser.'tests_run'()
    tests_planned = parser.'tests_planned'()
    .local int total
    if null tests_planned goto L2
    total = tests_planned
    goto L3
  L2:
    total = tests_run
  L3:

    .local int passed, failed, exit
    $P0 = parser.'passed'()
    passed = elements $P0
    $P0 = parser.'failed'()
    failed = elements $P0
    failed += total
    $I0 = tests_run
    failed -= $I0
    exit = parser.'exit'()

    unless exit goto L4
    $S1 = exit
    formatter.'_failure_output'("Dubious, test returned ", $S1, "\n")
  L4:

    unless failed == 0 goto L5
    unless total goto L6
    $S1 = total
    formatter.'_failure_output'("All ", $S1, " subtests passed ")
    goto L7
  L6:
    formatter.'_failure_output'("No subtests run ")
    goto L7
  L5:
    $S1 = failed
    $S2 = total
    formatter.'_failure_output'("Failed ", $S1, "/", $S2, " subtests ")
    if total goto L7
    formatter.'_failure_output'("\nNo tests run!")
  L7:

    .local int skipped
    $P0 = parser.'skipped'()
    skipped = elements $P0
    unless skipped goto L8
    passed -= skipped
    $S1 = skipped
    $S2 = ''
    if skipped == 1 goto L9
    $S2 = 's'
  L9:
    $S3 = passed
    formatter.'_output'("\n\t(less ", $S1, " skipped subtest", $S2, ": ", $S3, " okay)")
  L8:

    $P0 = parser.'todo_passed'()
    failed = elements $P0
    unless failed goto L10
    $S1 = failed
    $S2 = ''
    if failed == 1 goto L11
    $S2 = 's'
  L11:
    formatter.'_output'("\n\t(", $S1, " TODO test", $S2, " unexpectedly succeeded)")
  L10:

    formatter.'_output'("\n")
  L1:
.end

=back

=head3 Class TAP;Formatter;Console

Harness output delegate for default console output

=over 4

=cut

.namespace ['TAP';'Formatter';'Console']

.sub '' :tag('init') :tag('load') :anon
    $P0 = subclass ['TAP';'Formatter';'Base'], ['TAP';'Formatter';'Console']
.end

=item open_test

=cut

.sub 'open_test' :method
    .param string test
    .param pmc parser
    $P0 = new ['TAP';'Formatter';'Console';'Session']
    $P1 = box test
    setattribute $P0, 'name', $P1
    setattribute $P0, 'formatter', self
    setattribute $P0, 'parser', parser
    $P1 = getattribute $P0, 'show_count'
    unless $P1 goto L1
    $I0 = $P0.'_should_show_count'()
    set $P1, $I0
  L1:
    $P0.'header'()
    .return ($P0)
.end

=item _set_colors

=cut

.sub '_set_colors' :method
    .param pmc colors :slurpy
.end

=item _output_success

=cut

.sub '_output_success' :method
    .param string msg
    self.'_set_colors'('green')
    self.'_output'(msg)
    self.'_set_colors'('reset')
.end

=item _failure_output

=cut

.sub '_failure_output' :method
    .param pmc args :slurpy
    self.'_set_colors'('red')
    $S0 = join '', args
    self.'_output'($S0)
    self.'_set_colors'('reset')
.end

=back

=head3 Class TAP;Formatter;Console;Session

Harness output delegate for default console output

=over 4

=cut

.namespace ['TAP';'Formatter';'Console';'Session']

.sub '' :tag('init') :tag('load') :anon
    $P0 = subclass ['TAP';'Formatter';'Session'], ['TAP';'Formatter';'Console';'Session']
    $P0.'add_attribute'('plan')
    $P0.'add_attribute'('newline_printed')
    $P0.'add_attribute'('last_status_printed')
.end

.sub 'init' :vtable :method
    $P0 = box ''
    setattribute self, 'plan', $P0
    $P0 = new 'Boolean'
    set $P0, 0
    setattribute self, 'newline_printed', $P0
    $P0 = box 0
    setattribute self, 'last_status_printed', $P0
    $P0 = get_hll_global ['TAP';'Formatter';'Session'], 'init'
    $P0(self)
.end

=item _get_output_result

=cut

.sub '_get_output_result' :method
    .param pmc result
    .local pmc formatter
    formatter = getattribute self, 'formatter'
    $S0 = self.'_format_for_output'(result)
    formatter.'_output'($S0)
.end

=item header

=cut

.sub 'header' :method
    .local pmc formatter
    formatter = getattribute self, 'formatter'
    $I0 = formatter.'really_quiet'()
    if $I0 goto L1
    .local pmc name
    name = getattribute self, 'name'
    .local string pretty
    pretty = formatter.'_format_name'(name)
    formatter.'_output'(pretty)
  L1:
.end

=item result

=cut

.sub 'result' :method
    .param pmc result
    .local pmc formatter
    formatter = getattribute self, 'formatter'
    $I0 = isa result, ['TAP';'Parser';'Result';'Bailout']
    unless $I0 goto L1
    $S1 = result.'bailout'()
    formatter.'_failure_output'("Bailout called.  Further testing stopped:  ", $S1, "\n")
  L1:

    $I0 = formatter.'really_quiet'()
    if $I0 goto L2

    .local pmc plan
    plan = getattribute self, 'plan'
    unless null plan goto L3
    $S0 = '?'
    .local pmc parser, tests_planned
    parser = getattribute self, 'parser'
    tests_planned = getattribute parser, 'tests_planned'
    unless null tests_planned goto L4
    $S0 = tests_planned
  L4:
    $S0 = '/' . $S0
    plan = box $S0
    setattribute self, 'plan', $P0
  L3:

    .local int is_test
    is_test = isa result, ['TAP';'Parser';'Result';'Test']
    unless is_test goto L5
    .local pmc show_count
    show_count = getattribute self, 'show_count'
    unless show_count goto L5
    .local int now
    now = time
    .local pmc last_status_printed
    last_status_printed = getattribute self, 'last_status_printed'
    $I0 = last_status_printed
    if now == $I0 goto L5
    .local pmc name
    name = getattribute self, 'name'
    .local string pretty
    pretty = formatter.'_format_name'(name)
    .local pmc number
    number = getattribute result, 'test_num'
    $S1 = number
    $S2 = plan
    formatter.'_output'("\r", pretty, $S1, $S2)
    set last_status_printed, now
  L5:

    $I0 = formatter.'quiet'()
    if $I0 goto L2
    $I0 = formatter.'verbose'()
    if $I0 goto L6
    unless is_test goto L7
    $P0 = getattribute formatter, 'failures'
    if null $P0 goto L7
    unless $P0 goto L7
    $I0 = result.'is_ok'()
    unless $I0 goto L6
  L7:
    $P0 = getattribute formatter, 'comments'
    if null $P0 goto L8
    $I0 = isa result, ['TAP';'Parser';'Result';'Comment']
    if $I0 goto L6
  L8:
    $P0 = getattribute formatter, 'directives'
    if null $P0 goto L2
    $I0 = result.'has_directive'()
    unless $I0 goto L2
  L6:
    $P0 = getattribute self, 'newline_printed'
    if $P0 goto L9
    formatter.'_output'("\n")
    set $P0, 1
  L9:
    self.'_get_output_result'(result)
    formatter.'_output'("\n")
  L2:
.end

=item close_test

=cut

.sub 'close_test' :method
    .local pmc formatter
    formatter = getattribute self, 'formatter'
    $I0 = formatter.'really_quiet'()
    if $I0 goto L1

    .local pmc show_count
    show_count = getattribute self, 'show_count'
    unless show_count goto L2
    self.'clear_for_close'()
    .local pmc name
    name = getattribute self, 'name'
    .local string pretty
    pretty = formatter.'_format_name'(name)
    formatter.'_output'("\r", pretty)
  L2:

    .local pmc parser, skip_all
    parser = getattribute self, 'parser'
    skip_all = getattribute parser, 'skip_all'
    if null skip_all goto L3
    unless skip_all goto L3
    $S1 = skip_all
    formatter.'_output'("skipped: ", $S1, "\n")
    goto L1
  L3:
    $I0 = parser.'has_problems'()
    unless $I0 goto L4
    self.'_output_test_failure'(parser)
    goto L1
  L4:
    .local string time_report
    time_report = ''
    # work in progress
    formatter.'_output'("ok", time_report, "\n")
  L1:
.end

=item clear_for_close

=cut

.sub 'clear_for_close' :method
    .local pmc parser, formatter, name, plan, output
    .local string tests_run, pretty
    $I0 = 1
    parser = getattribute self, 'parser'
    tests_run = parser.'tests_run'()
    $I1 = length tests_run
    $I0 += $I1
    formatter = getattribute self, 'formatter'
    name = getattribute self, 'name'
    pretty = formatter.'_format_name'(name)
    $I1 = length pretty
    $I0 += $I1
    plan = getattribute self, 'plan'
    $S0 = plan
    $I1 = length $S0
    $I0 += $I1
    $S0 = repeat ' ', $I0
    formatter.'_output'("\r", $S0)
.end

=back

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
