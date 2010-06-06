# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

TAP/Parser

=head2 DESCRIPTION

Simplified port of TAP::Parser (version 3.21)

See L<http://search.cpan.org/~andya/Test-Harness/>

=head3 Class TAP;Parser;Result

Base class for TAP::Parser output objects

=over 4

=cut

.namespace ['TAP';'Parser';'Result']

.sub '' :init :load :anon
    $P0 = newclass ['TAP';'Parser';'Result']
    $P0.'add_attribute'('raw')
    $P0.'add_attribute'('directive')
    $P0.'add_attribute'('explanation')
.end

=item get_string

=cut

.sub 'get_string' :vtable :method
    $P0 = getattribute self, 'raw'
    $S0 = $P0
    .return ($S0)
.end

=item type

=cut

.sub 'type' :method
    $S0 = typeof self
    $P0 = split ';', $S0
    $S0 = pop $P0
    $S0 = downcase $S0
    .return ($S0)
.end

=item has_todo

=cut

.sub 'has_todo' :method
    $P0 = getattribute self, 'directive'
    unless null $P0 goto L1
    .return (0)
  L1:
    $S0 = $P0
    $I0 = $S0 == 'TODO'
    .return ($I0)
.end

=item has_skip

=cut

.sub 'has_skip' :method
    $P0 = getattribute self, 'directive'
    unless null $P0 goto L1
    .return (0)
  L1:
    $S0 = $P0
    $I0 = $S0 == 'SKIP'
    .return ($I0)
.end

=item has_directive

=cut

.sub 'has_directive' :method
    $I0 = self.'has_todo'()
    if $I0 goto L1
    $I0 = self.'has_skip'()
  L1:
    .return ($I0)
.end

=back

=head3 Class TAP;Parser;Result;Bailout

=over 4

=cut

.namespace ['TAP';'Parser';'Result';'Bailout']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Bailout']
.end

=item bailout

=cut

.sub 'bailout' :method
    $P0 = getattribute self, 'explanation'
    .return ($P0)
.end

=back

=head3 Class TAP;Parser;Result;Comment

=cut

.namespace ['TAP';'Parser';'Result';'Comment']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Comment']
    $P0.'add_attribute'('comment')
.end

=head3 Class TAP;Parser;Result;Plan

=cut

.namespace ['TAP';'Parser';'Result';'Plan']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Plan']
    $P0.'add_attribute'('plan')
    $P0.'add_attribute'('tests_planned')
.end

=head3 Class TAP;Parser;Result;Test

=over 4

=cut

.namespace ['TAP';'Parser';'Result';'Test']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Test']
    $P0.'add_attribute'('ok')
    $P0.'add_attribute'('test_num')
    $P0.'add_attribute'('description')
    $P0.'add_attribute'('unplanned')
.end

=item get_string

=cut

.sub 'get_string' :vtable :method
    $P0 = getattribute self, 'ok'
    $S0 = $P0
    $S0 .= ' '
    $P0 = getattribute self, 'test_num'
    $S1 = $P0
    $S0 .= $S1
    $P0 = getattribute self, 'description'
    if null $P0 goto L1
    $S1 = $P0
    if $S1 == '' goto L1
    $S0 .= ' '
    $S0 .= $S1
  L1:
    $P0 = getattribute self, 'directive'
    if null $P0 goto L2
    $S1 = $P0
    if $S1 == '' goto L2
    $S0 .= ' # '
    $S0 .= $S1
    $S0 .= ' '
    $P0 = getattribute self, 'explanation'
    if null $P0 goto L2
    $S1 = $P0
    $S0 .= $S1
  L2:
    .return ($S0)
.end

=item is_ok

=cut

.sub 'is_ok' :method
    $P0 = getattribute self, 'unplanned'
    if null $P0 goto L1
    unless $P0 goto L1
    .return (0)
  L1:
    $I0 = self.'has_todo'()
    if $I0 goto L2
    $I0 = self.'is_actual_ok'()
  L2:
    .return ($I0)
.end

=item is_actual_ok

=cut

.sub 'is_actual_ok' :method
    $P0 = getattribute self, 'ok'
    $S0 = $P0
    $I0 = index $S0, 'not'
    $I0 = $I0 != 0
    .return ($I0)
.end

=item todo_passed

=cut

.sub 'todo_passed' :method
    $I0 = self.'has_todo'()
    unless $I0 goto L1
    $I0 = self.'is_actual_ok'()
  L1:
    .return ($I0)
.end

=item is_unplanned

=cut

.sub 'is_unplanned' :method
    $I0 = 0
    $P0 = getattribute self, 'unplanned'
    if null $P0 goto L1
    $I0 = $P0
  L1:
    .return ($I0)
.end

=back

=head3 Class TAP;Parser;Result;Unknown

=cut

.namespace ['TAP';'Parser';'Result';'Unknown']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Unknown']
.end

=head3 Class TAP;Parser;Result;Version

=cut

.namespace ['TAP';'Parser';'Result';'Version']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Version']
    $P0.'add_attribute'('version')
.end

=head3 Class TAP;Parser;Grammar

C<TAP;Parser;Grammar> tokenizes lines and constructs C<TAP;Parser;Result>
subclasses to represent the tokens.

=over 4

=cut

.namespace ['TAP';'Parser';'Grammar']

.sub '' :init :load :anon
    $P0 = newclass ['TAP';'Parser';'Grammar']
.end

.include 'cclass.pasm'

.sub 'trim' :anon
    .param string str
    $I0 = length str
    $I0 = find_not_cclass .CCLASS_WHITESPACE, str, 0, $I0
    str = substr str, $I0
    $I0 = length str
  L1:
    dec $I0
    unless $I0 > 0 goto L2
    $I1 = is_cclass .CCLASS_WHITESPACE, str, $I0
    if $I1 != 0 goto L1
  L2:
    inc $I0
    str = substr str, 0, $I0
    .return (str)
.end

=item tokenize

=cut

.sub 'tokenize' :method
    .param string line
    .local pmc result
    .local int pos, lastpos
    .local string up, directive, explanation, ok
    lastpos = length line

    $I0 = index line, 'not ok'
    unless $I0 == 0 goto L1
    ok = 'not ok'
    pos = 6
    goto L2
  L1:
    $I0 = index line, 'ok'
    unless $I0 == 0 goto L3
    ok = 'ok'
    pos = 2
  L2:
    .local string description, test_num
    test_num = ''
    description = ''
    directive = ''
    explanation = ''
    if pos == lastpos goto L4
    $I0 = is_cclass .CCLASS_WHITESPACE, line, pos
    unless $I0 goto L3
    pos = find_not_cclass .CCLASS_WHITESPACE, line, pos, lastpos
    if pos == lastpos goto L4
    $I0 = is_cclass .CCLASS_NUMERIC, line, pos
    unless $I0 goto L5
    $I2 = find_not_cclass .CCLASS_NUMERIC, line, pos, lastpos
    if $I2 == lastpos goto L_5
    $I0 = is_cclass .CCLASS_WHITESPACE, line, $I2
    unless $I0 goto L5
  L_5:
    $I1 = $I2 - pos
    test_num = substr line, pos, $I1
    if $I2 == lastpos goto L4
    pos = find_not_cclass .CCLASS_WHITESPACE, line, $I2, lastpos
  L5:
    $S0 = substr line, pos
    description = trim($S0)
    up = upcase description
    lastpos = length description
    pos = -1
  L6:
    inc pos
    pos = index description, '#', pos
    if pos < 0 goto L4
    $I1 = pos - 1
    $S0 = substr description, $I1, 1
    inc pos
    if $S0 == "\\" goto L6
    if pos == lastpos goto L4
    $I0 = is_cclass .CCLASS_WHITESPACE, description, pos
    unless $I0 != 0 goto L7
    pos = find_not_cclass .CCLASS_WHITESPACE, description, pos, lastpos
    if pos == lastpos goto L4
  L7:
    $S0 = substr description, pos, 4
    $I0 = index up, 'SKIP', pos
    if $I0 == pos goto L8
    $I0 = index up, 'TODO', pos
    if $I0 == pos goto L8
    goto L6
  L8:
    directive = substr up, pos, 4
    $I1 = pos + 4
    $S0 = substr description, $I1
    explanation = trim($S0)
    pos -= 2
    $S0 = substr description, 0, pos
    description = trim($S0)
  L4:
    result = new ['TAP';'Parser';'Result';'Test']
    $P1 = box line
    setattribute result, 'raw', $P1
    $P1 = box ok
    setattribute result, 'ok', $P1
    unless test_num != '' goto L11
    $I0 = test_num
    $P1 = box test_num
    setattribute result, 'test_num', $P1
  L11:
    unless description != '' goto L12
    $P1 = box description
    setattribute result, 'description', $P1
  L12:
    unless directive != '' goto L13
    $P1 = box directive
    setattribute result, 'directive', $P1
  L13:
    unless explanation != '' goto L14
    $P1 = box explanation
    setattribute result, 'explanation', $P1
  L14:
    .return (result)
  L3:

    $I0 = index line, '#'
    unless $I0 == 0 goto L19
    result = new ['TAP';'Parser';'Result';'Comment']
    $P1 = box line
    setattribute result, 'raw', $P1
    $S0 = substr line, 1
    $S0 = trim($S0)
    $P1 = box $S0
    setattribute result, 'comment', $P1
    .return (result)
  L19:

    $I0 = index line, '1..'
    unless $I0 == 0 goto L21
    pos = 3
    $I0 = is_cclass .CCLASS_NUMERIC, line, pos
    unless $I0 goto L21
    pos = find_not_cclass .CCLASS_NUMERIC, line, pos, lastpos
    directive = ''
    explanation = ''
    .local string plan
    plan = substr line, 0, pos
    .local int tests_planned
    $I1 = pos - 3
    $S0 = substr line, 3, $I1
    tests_planned = $S0
    if pos == lastpos goto L22
    $I0 = is_cclass .CCLASS_WHITESPACE, line, pos
    unless $I0 goto L23
    pos = find_not_cclass .CCLASS_WHITESPACE, line, pos, lastpos
    if pos == lastpos goto L22
  L23:
    $S0 = substr line, pos, 1
    unless $S0 == '#' goto L21
    inc pos
    $I0 = is_cclass .CCLASS_WHITESPACE, line, pos
    unless $I0 goto L24
    pos = find_not_cclass .CCLASS_WHITESPACE, line, pos, lastpos
  L24:
    up = upcase line
    $I0 = index up, 'SKIP', pos
    unless $I0 == pos goto L21
    directive = 'SKIP'
    pos += 4
    $S0 = substr line, pos
    explanation = trim($S0)
  L22:
    result = new ['TAP';'Parser';'Result';'Plan']
    $P1 = box line
    setattribute result, 'raw', $P1
    $P1 = box plan
    setattribute result, 'plan', $P1
    $P1 = box tests_planned
    setattribute result, 'tests_planned', $P1
    unless tests_planned == 0 goto L25
    directive = 'SKIP'
  L25:
    unless directive != '' goto L26
    $P1 = box directive
    setattribute result, 'directive', $P1
  L26:
    unless explanation != '' goto L27
    $P1 = box explanation
    setattribute result, 'explanation', $P1
  L27:
    .return (result)
  L21:

    $I0 = index line, 'Bail out!'
    unless $I0 == 0 goto L31
    result = new ['TAP';'Parser';'Result';'Bailout']
    $P1 = box line
    setattribute result, 'raw', $P1
    $S0 = substr line, 9
    $S0 = trim($S0)
    $P1 = box $S0
    setattribute result, 'explanation', $P1
    .return (result)
  L31:

    $I0 = index line, 'TAP'
    unless $I0 == 0 goto L41
    pos = 3
    $I0 = is_cclass .CCLASS_WHITESPACE, line, pos
    unless $I0 goto L41
    pos = find_not_cclass .CCLASS_WHITESPACE, line, pos, lastpos
    $I0 = index line, 'version', pos
    unless $I0 == pos goto L41
    pos += 7
    $I0 = is_cclass .CCLASS_WHITESPACE, line, pos
    unless $I0 goto L41
    pos = find_not_cclass .CCLASS_WHITESPACE, line, pos, lastpos
    $I0 = is_cclass .CCLASS_NUMERIC, line, pos
    unless $I0 goto L41
    $I2 = find_not_cclass .CCLASS_NUMERIC, line, pos, lastpos
    $I1 = $I2 - pos
    $S0 = substr line, pos, $I1
    .local int version
    version = $S0
    if $I2 == lastpos goto L42
    $I0 = is_cclass .CCLASS_WHITESPACE, line, $I2
    unless $I0 goto L41
    $I0 = find_not_cclass .CCLASS_WHITESPACE, line, $I2, lastpos
    unless $I0 == lastpos goto L41
  L42:
    result = new ['TAP';'Parser';'Result';'Version']
    $P1 = box line
    setattribute result, 'raw', $P1
    $P1 = box version
    setattribute result, 'version', $P1
    .return (result)
  L41:

    result = new ['TAP';'Parser';'Result';'Unknown']
    $P1 = box line
    setattribute result, 'raw', $P1
    .return (result)
.end

=back

=head3 Class TAP;Base

Base class that provides common functionality to C<TAP;Parser>
and C<TAP;Harness> ie. callback support.

=over 4

=cut

.namespace ['TAP';'Base']

.sub '' :init :load :anon
    $P0 = newclass ['TAP';'Base']
    $P0.'add_attribute'('code_for')
    $P0.'add_attribute'('ok_callbacks')
.end

=item callback

=cut

.sub 'callback' :method
    .param string event
    .param pmc callback
    $P0 = getattribute self, 'ok_callbacks'
    if null $P0 goto L1
    $I0 = exists $P0[event]
    if $I0 goto L1
    $S0 = "Callback " . event
    $S0 .= " is not supported."
    die $S0
  L1:
    $P0 = getattribute self, 'code_for'
    unless null $P0 goto L2
    $P0 = new 'Hash'
    setattribute self, 'code_for', $P0
  L2:
    $P0[event] = callback
.end

=item _has_callback

=cut

.sub '_has_callback' :method
    $P0 = getattribute self, 'code_for'
    if null $P0 goto L1
    .return (1)
  L1:
    .return (0)
.end

=item _callback_for

=cut

.sub '_callback_for' :method
    .param string event
    null $P1
    $P0 = getattribute self, 'code_for'
    if null $P0 goto L1
    $I0 = exists $P0[event]
    unless $I0 goto L1
    $P1 = $P0[event]
  L1:
    .return ($P1)
.end

=item _make_callback

=cut

.sub '_make_callback' :method
    .param string event
    .param pmc args :slurpy
    $P0 = getattribute self, 'code_for'
    if null $P0 goto L1
    $I0 = exists $P0[event]
    unless $I0 goto L1
    $P0 = $P0[event]
    $P0 = $P0(args :flat)
    .return ($P0)
  L1:
    .return ()
.end

=back

=head3 Class TAP;Parser

C<TAP;Parser> is designed to produce a proper parse of TAP output.

=over 4

=cut

.namespace ['TAP';'Parser']

.sub '' :init :load :anon
    load_bytecode 'osutils.pbc'

    $P0 = subclass ['TAP';'Base'], ['TAP';'Parser']
    $P0.'add_attribute'('stream')
    $P0.'add_attribute'('skipped')
    $P0.'add_attribute'('todo')
    $P0.'add_attribute'('passed')
    $P0.'add_attribute'('failed')
    $P0.'add_attribute'('actual_failed')
    $P0.'add_attribute'('actual_passed')
    $P0.'add_attribute'('todo_passed')
    $P0.'add_attribute'('parse_errors')
    $P0.'add_attribute'('tests_run')
    $P0.'add_attribute'('tests_planned')
    $P0.'add_attribute'('plan')
    $P0.'add_attribute'('good_plan')
    $P0.'add_attribute'('skip_all')
    $P0.'add_attribute'('version')
    $P0.'add_attribute'('exit')
    $P0.'add_attribute'('ignore_exit')
    $P0.'add_attribute'('merge')
    $P0.'add_attribute'('spool')
    $P0.'add_attribute'('start_time')
    $P0.'add_attribute'('end_time')

    $P0 = _make_state_table()
    set_global ['TAP';'Parser'], 'STATES', $P0

    $P0 = new 'Hash'
    $P1 = split ' ', 'test version plan comment bailout unknown ALL ELSE EOF'
  L1:
    unless $P1 goto L2
    $S0 = shift $P1
    $P0[$S0] = 1
    goto L1
  L2:
    set_global ['TAP';'Parser'], 'LEGAL_CALLBACK', $P0
.end

.sub 'init' :vtable :method
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'skipped', $P0
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'todo', $P0
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'passed', $P0
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'failed', $P0
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'actual_failed', $P0
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'actual_passed', $P0
    $P0 = new 'ResizableIntegerArray'
    setattribute self, 'todo_passed', $P0
    $P0 = new 'ResizableStringArray'
    setattribute self, 'parse_errors', $P0
    $P0 = box 0
    setattribute self, 'tests_run', $P0
    $P0 = get_global ['TAP';'Parser'], 'LEGAL_CALLBACK'
    setattribute self, 'ok_callbacks', $P0
.end

=item start_time

=cut

.sub 'start_time' :method
    $P0 = getattribute self, 'start_time'
    .return ($P0)
.end

=item end_time

=cut

.sub 'end_time' :method
    $P0 = getattribute self, 'end_time'
    .return ($P0)
.end

=item skipped

=cut

.sub 'skipped' :method :nsentry
    $P0 = getattribute self, 'skipped'
    .return ($P0)
.end

=item todo

=cut

.sub 'todo' :method :nsentry
    $P0 = getattribute self, 'todo'
    .return ($P0)
.end

=item passed

=cut

.sub 'passed' :method :nsentry
    $P0 = getattribute self, 'passed'
    .return ($P0)
.end

=item failed

=cut

.sub 'failed' :method :nsentry
    $P0 = getattribute self, 'failed'
    .return ($P0)
.end

=item todo_passed

=cut

.sub 'todo_passed' :method :nsentry
    $P0 = getattribute self, 'todo_passed'
    .return ($P0)
.end

=item parse_errors

=cut

.sub 'parse_errors' :method :nsentry
    $P0 = getattribute self, 'parse_errors'
    .return ($P0)
.end

=item tests_run

=cut

.sub 'tests_run' :method :nsentry
    $P0 = getattribute self, 'tests_run'
    .return ($P0)
.end

=item tests_planned

=cut

.sub 'tests_planned' :method :nsentry
    $P0 = getattribute self, 'tests_planned'
    .return ($P0)
.end

=item merge

=cut

.sub 'merge' :method :nsentry
    .param int val
    $P0 = new 'Boolean'
    set $P0, val
    setattribute self, 'merge', $P0
.end

=item ignore_exit

=cut

.sub 'ignore_exit' :method :nsentry
    .param int val
    $P0 = new 'Boolean'
    set $P0, val
    setattribute self, 'ignore_exit', $P0
.end

=item exit

=cut

.sub 'exit' :method :nsentry
    $P0 = getattribute self, 'ignore_exit'
    if null $P0 goto L1
    unless $P0 goto L1
    .return (0)
  L1:
    $P0 = getattribute self, 'exit'
    $I0 = 0
    if null $P0 goto L2
    $I0 = $P0
  L2:
    .return ($I0)
.end

=item has_problems

=cut

.sub 'has_problems' :method
    $P0 = getattribute self, 'failed'
    $I0 = elements $P0
    if $I0 goto L1
    $P0 = getattribute self, 'parse_errors'
    $I0 = elements $P0
    if $I0 goto L1
    $P0 = getattribute self, 'ignore_exit'
    if null $P0 goto L2
    if $P0 goto L1
  L2:
    $P0 = getattribute self, 'exit'
    if null $P0 goto L1
    $I0 = $P0
    .return ($I0)
  L1:
    .return ($I0)
.end

=item _add_error

=cut

.sub '_add_error' :method
    .param pmc args :slurpy
    $P0 = getattribute self, 'parse_errors'
    $S0 = join '', args
    $P1 = box $S0
    push $P0, $P1
.end

=item is_good_plan

=cut

.sub 'is_good_plan' :method
    $P0 = getattribute self, 'good_plan'
    .return ($P0)
.end

=item spool

=cut

.sub 'spool' :method
    .param pmc spool
    setattribute self, 'spool', spool
.end

=item delete_spool

=cut

.sub 'delete_spool' :method
    $P0 = getattribute self, 'spool'
    null $P1
    setattribute self, 'spool', $P1
    .return ($P0)
.end

=item pragma

=cut

.sub 'pragma' :method
    .param string name
    .return (1)
.end

=item tap

=cut

.sub 'tap' :method
    .param string tap
    $P0 = new 'StringHandle'
    $P0.'open'('tap', 'w')
    print $P0, tap
    setattribute self, 'stream', $P0
.end

=item file

=cut

.sub 'file' :method
    .param string filename
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(filename, 'r')
    pop_eh
    $S0 = $P0.'readline'()
    $I0 = index $S0, '#!'
    unless $I0 == 0 goto L1
    $P0.'close'()
    $S0 = _get_exec($S0)
    .tailcall self.'exec'($S0, filename)
  L1:
    $P0.'seek'(0, 0)
    setattribute self, 'stream', $P0
    .return ()
  _handler:
    .local pmc ex
    .get_results (ex)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    ex = $S0
    rethrow ex
.end

.include 'iglobals.pasm'

.sub '_get_exec' :anon
    .param string line
    $S0 = chomp(line)
    $I0 = length $S0
    $I0 = find_not_cclass .CCLASS_WHITESPACE, $S0, 2, $I0
    $S0 = substr $S0, $I0
    .local string slash
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]
    slash = $P1['slash']
    $P0 = split "/", $S0
    $S0 = join slash, $P0
    .return ($S0)
.end

=item exec

=cut

.sub 'exec' :method
    .param pmc cmds :slurpy
    .local string cmd
    cmd = join ' ', cmds
    $P0 = getattribute self, 'merge'
    if null $P0 goto L1
    unless $P0 goto L1
    cmd .= ' 2>&1'
  L1:
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(cmd, 'pr')
    pop_eh
    setattribute self, 'stream', $P0
    .return ()
  _handler:
    .local pmc ex
    .get_results (ex)
    $S0 = "Can't open '"
    $S0 .= cmd
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    ex = $S0
    rethrow ex
.end

=item run

=cut

.sub 'run' :method
    .const 'Sub' $P0 = 'next'
    $P0 = newclosure $P0
  L1:
    $P1 = $P0(self)
    unless null $P1 goto L1
.end

=item next

=cut

.sub 'next' :method :nsentry :lex
    .local pmc stream, spool
    stream = getattribute self, 'stream'
    if null stream goto L1
    $N0 = time
    $P0 = box $N0
    setattribute self, 'start_time', $P0
    .local pmc grammar, st
    grammar = new ['TAP';'Parser';'Grammar']
    .const 'Sub' $P0 = 'next_state'
    capture_lex $P0
    st = box 'INIT'
    .lex 'state', st
  L2:
    $S0 = stream.'readline'()
    if $S0 == '' goto L3
    $S0 = chomp($S0)
    .local pmc token
    token = grammar.'tokenize'($S0)
    self.'next_state'(token)
    $S0 = token.'type'()
    $P0 = self.'_callback_for'($S0)
    if null $P0 goto L4
    $P0(token)
    goto L5
  L4:
    self.'_make_callback'('ELSE', token)
  L5:
    self.'_make_callback'('ALL', token)
    spool = getattribute self, 'spool'
    if null spool goto L6
    $S0 = token
    print spool, $S0
    print spool, "\n"
  L6:
    .yield (token)
    goto L2
  L3:
    stream.'close'()
    $I0 = can stream, 'exit_status'
    unless $I0 goto L7
    $I0 = stream.'exit_status'()
    unless $I0 goto L7
    $P0 = box $I0
    setattribute self, 'exit', $P0
  L7:
    self.'_finish'()
    $I0 = self.'_make_callback'('EOF', self)
    null $P0
    .return ($P0)
  L1:
    die "no stream"
.end

.sub 'next_state' :method :lex :outer('next')
    .param pmc token
    .local pmc STATES, st
    STATES = get_global ['TAP';'Parser'], 'STATES'
    st = find_lex 'state'
    .local string type
    type = token.'type'()
  REDO:
    $I0 = STATES[st]
    if $I0 goto L1
    $S0 = st
    $S0 = "Illegal state: " . $S0
    die $S0
  L1:
    $P0 = STATES[st]
    $I0 = exists $P0[type]
    unless $I0 goto L2
    $P1 = $P0[type]
    $I0 = exists $P1['act']
    unless $I0 goto L3
    $P2 = $P1['act']
    $P2(self, token)
  L3:
    $I0 = exists $P1['continue']
    unless $I0 goto L4
    $S0 = $P1['continue']
    set st, $S0
    goto REDO
  L4:
    $I0 = exists $P1['goto']
    unless $I0 goto L5
    $S0 = $P1['goto']
    set st, $S0
    goto L5
  L2:
    $P0 = getinterp
    .include 'stdio.pasm'
    $P1 = $P0.'stdhandle'(.PIO_STDERR_FILENO)
    $P1.'print'("Unhandled token type: ")
    $P1.'print'(type)
    $P1.'print'("\n")
  L5:
.end

.sub '_make_state_table'
    .local pmc states
    states = new 'Hash'
    $P0 = split ' ', 'INIT PLAN PLANNED PLANNED_AFTER_TEST GOT_PLAN UNPLANNED UNPLANNED_AFTER_TEST'
    $P1 = split ' ', 'bailout comment plan test unknown version'
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    .local pmc st
    st = new 'Hash'
    states[$S0] = st
    $P2 = iter $P1
  L3:
    unless $P2 goto L4
    $S0 = shift $P2
    $P3 = new 'Hash'
    st[$S0] = $P3
    goto L3
  L4:
    $P3 = st['version']
    $P4 = get_hll_global ['TAP';'Parser'], '_DEFAULT_version'
    $P3['act'] = $P4
    $P3 = st['unknown']
    $P4 = get_hll_global ['TAP';'Parser'], '_DEFAULT_unknown'
    $P3['act'] = $P4
    $P3 = st['plan']
    $P4 = get_hll_global ['TAP';'Parser'], '_DEFAULT_plan'
    $P3['act'] = $P4
    $P3 = st['test']
    $P4 = get_hll_global ['TAP';'Parser'], '_DEFAULT_test'
    $P3['act'] = $P4
    goto L1
  L2:

    st = states['INIT']
    $P0 = st['version']
    $P1 = get_hll_global ['TAP';'Parser'], '_INIT_version'
    $P0['act'] = $P1
    $P0['goto'] = 'PLAN'
    $P0 = st['plan']
    $P0['goto'] = 'PLANNED'
    $P0 = st['test']
    $P0['goto'] = 'UNPLANNED'

    st = states['PLAN']
    $P0 = st['plan']
    $P0['goto'] = 'PLANNED'
    $P0 = st['test']
    $P0['goto'] = 'UNPLANNED'

    st = states['PLANNED']
    $P0 = st['test']
    $P0['goto'] = 'PLANNED_AFTER_TEST'
    $P0 = st['plan']
    $P1 = get_hll_global ['TAP';'Parser'], '_PLANNED_plan'
    $P0['act'] = $P1

    st = states['PLANNED_AFTER_TEST']
    $P0 = st['test']
    $P0['goto'] = 'PLANNED_AFTER_TEST'
    $P0 = st['plan']
    $P1 = get_hll_global ['TAP';'Parser'], '_no_action'
    $P0['act'] = $P1
    $P0['continue'] = 'PLANNED'

    st = states['GOT_PLAN']
    $P0 = st['test']
    $P1 = get_hll_global ['TAP';'Parser'], '_GOT_PLAN_test'
    $P0['act'] = $P1
    $P0['continue'] = 'PLANNED'
    $P0 = st['plan']
    $P0['continue'] = 'PLANNED'

    st = states['UNPLANNED']
    $P0 = st['test']
    $P0['goto'] = 'UNPLANNED_AFTER_TEST'
    $P0 = st['plan']
    $P0['goto'] = 'GOT_PLAN'

    st = states['UNPLANNED_AFTER_TEST']
    $P0 = st['test']
    $P1 = get_hll_global ['TAP';'Parser'], '_no_action'
    $P0['act'] = $P1
    $P0['continue'] = 'UNPLANNED'
    $P0 = st['plan']
    $P1 = get_hll_global ['TAP';'Parser'], '_no_action'
    $P0['act'] = $P1
    $P0['continue'] = 'UNPLANNED'

    .return (states)
.end

.sub '_no_action' :method :nsentry
    .param pmc result
    # nothing
.end

.sub '_DEFAULT_version' :method :nsentry
    .param pmc result
    self.'_add_error'('If TAP version is present it must be the first line of output')
.end

.sub '_DEFAULT_unknown' :method :nsentry
    .param pmc result
    $I0 = self.'pragma'('strict')
    unless $I0 goto L1
    $P0 = getattribute result, 'raw'
    $S1 = $P0
    self.'_add_error'('Unknown TAP token: "', $S1, '"')
  L1:
.end

.sub '_DEFAULT_plan' :method :nsentry
    .param pmc result
    $P0 = getattribute result, 'tests_planned'
    setattribute self, 'tests_planned', $P0
    $P0 = getattribute result, 'plan'
    setattribute self, 'plan', $P0
    $I0 = result.'has_skip'()
    unless $I0 goto L1
    $S0 = '(no reason given)'
    $P0 = getattribute result, 'explanation'
    if null $P0 goto L2
    $S0 = $P0
  L2:
    $P0 = box $S0
    setattribute self, 'skip_all', $P0
  L1:
.end

.sub '_DEFAULT_test' :method :nsentry
    .param pmc result
    $P0 = getattribute self, 'tests_run'
    inc $P0
    .local int tests_run
    tests_run = $P0

    $P0 = getattribute self, 'tests_planned'
    if null $P0 goto L11
    .local int tests_planned
    tests_planned = $P0
    unless tests_run > tests_planned goto L11
    $P0 = new 'Boolean'
    set $P0, 1
    setattribute result, 'unplanned', $P0
  L11:

    $P0 = getattribute result, 'test_num'
    if null $P0 goto L21
    .local int number
    number = $P0
    unless number != tests_run goto L22
    $S1 = number
    $S2 = tests_run
    self.'_add_error'("Tests out of sequence.  Found (", $S1, ") but expected (", $S2, ")")
    goto L22
  L21:
    number = tests_run
    $P0 = box number
    setattribute result, 'test_num', $P0
  L22:

    $I0 = result.'has_todo'()
    unless $I0 goto L31
    $P0 = getattribute self, 'todo'
    push $P0, number
  L31:
    $I0 = result.'todo_passed'()
    unless $I0 goto L32
    $P0 = getattribute self, 'todo_passed'
    push $P0, number
  L32:
    $I0 = result.'has_skip'()
    unless $I0 goto L33
    $P0 = getattribute self, 'skipped'
    push $P0, number
  L33:
    $I0 = result.'is_ok'()
    unless $I0 goto L34
    $P0 = getattribute self, 'passed'
    push $P0, number
    goto L35
  L34:
    $P0 = getattribute self, 'failed'
    push $P0, number
  L35:
    $I0 = result.'is_actual_ok'()
    unless $I0 goto L36
    $P0 = getattribute self, 'actual_passed'
    push $P0, number
    goto L37
  L36:
    $P0 = getattribute self, 'actual_failed'
    push $P0, number
  L37:
.end

.sub '_INIT_version' :method :nsentry
    .param pmc result
    $P0 = getattribute result, 'version'
    setattribute self, 'version', $P0
.end

.sub '_PLANNED_plan' :method :nsentry
    .param pmc result
    self.'_add_error'('More than one plan found in TAP output')
.end

.sub '_GOT_PLAN_test' :method :nsentry
    .param pmc result
    $P0 = getattribute self, 'plan'
    $S1 = $P0
    self.'_add_error'("Plan (", $S1, ") must be at the beginning or end of the TAP output")
    self.'is_good_plan'(0)
.end

.sub '_finish' :method
    $N0 = time
    $P0 = box $N0
    setattribute self, 'end_time', $P0

    $P0 = getattribute self, 'plan'
    unless null $P0 goto L1
    self.'_add_error'('No plan found in TAP output')
    goto L2
  L1:
    $P0 = getattribute self, 'good_plan'
    unless null $P0 goto L2
    $P0 = box 1
    setattribute self, 'good_plan', $P0
  L2:

    .local int tests_run, tests_planned
    $P0 = getattribute self, 'tests_run'
    tests_run = $P0
    tests_planned = 0
    $P0 = getattribute self, 'tests_planned'
    if null $P0 goto L3
    tests_planned = $P0
  L3:
    unless tests_run != tests_planned goto L4
    $P0 = box 0
    setattribute self, 'good_plan', $P0
    if tests_planned == 0 goto L4
    $S1 = tests_planned
    $S2 = tests_run
    self.'_add_error'("Bad plan.  You planned ", $S1, " tests but ran ", $S2, ".")
  L4:

    $P0 = getattribute self, 'good_plan'
    unless null $P0 goto L5
    $P0 = box 0
    setattribute self, 'good_plan', $P0
  L5:
.end

=back

=head3 Class TAP;Parser;Aggregator

C<TAP;Parser;Aggregator> collects parser objects and allows
reporting/querying their aggregate results.

=over 4

=cut

.namespace ['TAP';'Parser';'Aggregator']

.sub '' :init :load :anon
    $P0 = newclass ['TAP';'Parser';'Aggregator']
    $P0.'add_attribute'('parser_for')
    $P0.'add_attribute'('parse_order')
    $P0.'add_attribute'('start_time')
    $P0.'add_attribute'('end_time')
    $P0.'add_attribute'('failed')
    $P0.'add_attribute'('parse_errors')
    $P0.'add_attribute'('passed')
    $P0.'add_attribute'('skipped')
    $P0.'add_attribute'('todo')
    $P0.'add_attribute'('todo_passed')
    $P0.'add_attribute'('total')
    $P0.'add_attribute'('planned')
    $P0.'add_attribute'('exit')
    $P0.'add_attribute'('description_for_failed')
    $P0.'add_attribute'('description_for_parse_errors')
    $P0.'add_attribute'('description_for_passed')
    $P0.'add_attribute'('description_for_skipped')
    $P0.'add_attribute'('description_for_todo')
    $P0.'add_attribute'('description_for_todo_passed')
    $P0.'add_attribute'('description_for_planned')
    $P0.'add_attribute'('description_for_exit')

    $P0 = new 'Hash'
    $P1 = get_hll_global ['TAP';'Parser'], 'failed'
    $P0['failed'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'parse_errors'
    $P0['parse_errors'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'passed'
    $P0['passed'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'skipped'
    $P0['skipped'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'todo'
    $P0['todo'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'todo_passed'
    $P0['todo_passed'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'tests_run'
    $P0['total'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'tests_planned'
    $P0['planned'] = $P1
    $P1 = get_hll_global ['TAP';'Parser'], 'exit'
    $P0['exit'] = $P1
    set_global ['TAP';'Parser';'Aggregator'], 'SUMMARY_METHOD_FOR', $P0
.end

.sub 'init' :vtable :method
    $P0 = new 'Hash'
    setattribute self, 'parser_for', $P0
    $P0 = new 'ResizableStringArray'
    setattribute self, 'parse_order', $P0
    .local pmc SUMMARY_METHOD_FOR
    SUMMARY_METHOD_FOR = get_global ['TAP';'Parser';'Aggregator'], 'SUMMARY_METHOD_FOR'
    $P0 = iter SUMMARY_METHOD_FOR
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $P1 = box 0
    setattribute self, $S0, $P1
    if $S0 == 'total' goto L1
    $S0 = 'description_for_' . $S0
    $P1 = new 'ResizableStringArray'
    setattribute self, $S0, $P1
    goto L1
  L2:
.end

=item add

=cut

.sub 'add' :method
    .param string description
    .param pmc parser
    .local pmc parser_for
    parser_for = getattribute self, 'parser_for'
    $I0 = exists parser_for[description]
    unless $I0 goto L1
    $S0 = "You already have a parser for (" . description
    $S0 .= "). Perhaps you have run the same test twice.\n"
    die $S0
  L1:
    parser_for[description] = parser
    .local pmc parse_order
    parse_order = getattribute self, 'parse_order'
    push parse_order, description
    .local pmc SUMMARY_METHOD_FOR
    SUMMARY_METHOD_FOR = get_global ['TAP';'Parser';'Aggregator'], 'SUMMARY_METHOD_FOR'
    $P0 = iter SUMMARY_METHOD_FOR
  L2:
    unless $P0 goto L3
    .local string summary
    summary = shift $P0
    .local pmc method
    method = SUMMARY_METHOD_FOR[summary]
    .local int count
    count = method(parser)
    unless count > 0 goto L2
    $P1 = getattribute self, summary
    $P1 += count
    if summary == 'total' goto L2
    $S0 = 'description_for_' . summary
    $P1 = getattribute self, $S0
    push $P1, description
    goto L2
  L3:
.end

=item parsers

=cut

.sub 'parsers' :method
    .param string desc
    $P0 = getattribute self, 'parser_for'
    $P1 = $P0[desc]
    .return ($P1)
.end

=item total

=cut

.sub 'total' :method
    $P0 = getattribute self, 'total'
    $I0 = $P0
    .return ($I0)
.end

=item passed

=cut

.sub 'passed' :method
    $P0 = getattribute self, 'passed'
    $I0 = $P0
    .return ($I0)
.end

=item descriptions

=cut

.sub 'descriptions' :method
    $P0 = getattribute self, 'parse_order'
    .return ($P0)
.end

=item start

=cut

.sub 'start' :method
    $N0 = time
    $P0 = box $N0
    setattribute self, 'start_time', $P0
.end

=item stop

=cut

.sub 'stop' :method
    $N0 = time
    $P0 = box $N0
    setattribute self, 'end_time', $P0
.end

=item start_time

=cut

.sub 'start_time' :method
    $P0= getattribute self, 'start_time'
    .return ($P0)
.end

=item en_time

=cut

.sub 'end_time' :method
    $P0= getattribute self, 'end_time'
    .return ($P0)
.end

=item elapsed

=cut

.sub 'elapsed' :method
    $P0 = getattribute self, 'end_time'
    if null $P0 goto L1
    $N2 = $P0
    $P0 = getattribute self, 'start_time'
    if null $P0 goto L1
    $N1 = $P0
    $N0 = $N2 - $N1
    .return ($N0)
  L1:
    die "Can't call elapsed without first calling start and then stop"
.end

=item elapsed_timestr

=cut

.sub 'elapsed_timestr' :method
    $N0 = self.'elapsed'()
    $P0 = new 'FixedPMCArray'
    $P0 = 1
    $P0[0] = $N0
    $S0 = sprintf "%.3f wallclock secs", $P0
    .return ($S0)
.end

=item has_problems

=cut

.sub 'has_problems' :method
    $P0 = getattribute self, 'todo_passed'
    $I0 = $P0
    if $I0 goto L1
    $I0 = self.'has_errors'()
  L1:
    .return ($I0)
.end

=item has_errors

=cut

.sub 'has_errors' :method
    $P0 = getattribute self, 'failed'
    $I0 = $P0
    if $I0 goto L1
    $P0 = getattribute self, 'parse_errors'
    $I0 = $P0
    if $I0 goto L1
    $P0 = getattribute self, 'exit'
    $I0 = $P0
  L1:
    .return ($I0)
.end

=item get_status

=cut

.sub 'get_status' :method
    .local int total, passed
    $P0 = getattribute self, 'total'
    total = $P0
    $P0 = getattribute self, 'passed'
    passed = $P0
    $I0 = self.'has_errors'()
    if $I0 goto L1
    if total == passed goto L2
  L1:
    .return ('FAIL')
  L2:
    unless total goto L3
    .return ('PASS')
  L3:
    .return ('NOTESTS')
.end

=item all_passed

=cut

.sub 'all_passed' :method
    .local int total
    $P0 = getattribute self, 'total'
    total = $P0
    unless total goto L1
    $P0 = getattribute self, 'passed'
    $I0 = $P0
    unless total == $I0 goto L1
    $I0 = self.'has_errors'()
    $I0 = not $I0
    .return ($I0)
  L1:
    .return (0)
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
