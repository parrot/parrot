# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

TAP/Parser

=head2 DESCRIPTION

Simplified port of TAP::Parser (version 3.21)

See L<http://search.cpan.org/~andya/Test-Harness/>

=cut

.namespace ['TAP';'Parser';'Result']

.sub '' :init :load :anon
    $P0 = newclass ['TAP';'Parser';'Result']
    $P0.'add_attribute'('raw')
    $P0.'add_attribute'('directive')
    $P0.'add_attribute'('explanation')
.end

.sub 'get_string' :vtable :method
    $P0 = getattribute self, 'raw'
    $S0 = $P0
    .return ($S0)
.end

.sub 'type' :method
    $S0 = typeof self
    $P0 = split ';', $S0
    $S0 = pop $P0
    $S0 = downcase $S0
    .return ($S0)
.end

.sub 'has_todo' :method
    $P0 = getattribute self, 'directive'
    unless null $P0 goto L1
    .return (0)
  L1:
    $S0 = $P0
    $I0 = $S0 == 'TODO'
    .return ($I0)
.end

.sub 'has_skip' :method
    $P0 = getattribute self, 'directive'
    unless null $P0 goto L1
    .return (0)
  L1:
    $S0 = $P0
    $I0 = $S0 == 'SKIP'
    .return ($I0)
.end

.sub 'has_directive' :method
    $I0 = self.'has_todo'()
    if $I0 goto L1
    $I0 = self.'has_skip'()
  L1:
    .return ($I0)
.end


.namespace ['TAP';'Parser';'Result';'Bailout']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Bailout']
.end

.sub 'bailout' :method
    $P0 = getattribute self, 'explanation'
    .return ($P0)
.end


.namespace ['TAP';'Parser';'Result';'Comment']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Comment']
    $P0.'add_attribute'('comment')
.end


.namespace ['TAP';'Parser';'Result';'Plan']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Plan']
    $P0.'add_attribute'('plan')
    $P0.'add_attribute'('tests_planned')
.end


.namespace ['TAP';'Parser';'Result';'Test']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Test']
    $P0.'add_attribute'('ok')
    $P0.'add_attribute'('test_num')
    $P0.'add_attribute'('description')
    $P0.'add_attribute'('unplanned')
.end

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
    $P0 = getattribute self, 'explanation'
    $S1 = $P0
    $S0 .= $S1
  L2:
    .return ($S0)
.end

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

.sub 'is_actual_ok' :method
    $P0 = getattribute self, 'ok'
    $S0 = $P0
    $I0 = index $S0, 'not'
    $I0 = $I0 != 0
    .return ($I0)
.end

.sub 'todo_passed' :method
    $I0 = self.'has_todo'()
    unless $I0 goto L1
    $I0 = self.'is_actual_ok'()
  L1:
    .return ($I0)
.end


.namespace ['TAP';'Parser';'Result';'Unknown']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Unknown']
.end


.namespace ['TAP';'Parser';'Result';'Version']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Parser';'Result'], ['TAP';'Parser';'Result';'Version']
    $P0.'add_attribute'('version')
.end


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
    $I0 = is_cclass .CCLASS_WHITESPACE, line, $I2
    unless $I0 goto L5
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


.namespace ['TAP';'Base']

.sub '' :init :load :anon
    $P0 = newclass ['TAP';'Base']
    $P0.'add_attribute'('code_for')
    $P0.'add_attribute'('ok_callbacks')
.end

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

.sub '_has_callback' :method
    $P0 = getattribute self, 'code_for'
    if null $P0 goto L1
    .return (1)
  L1:
    .return (0)
.end

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


.namespace ['TAP';'Parser']

.sub '' :init :load :anon
    $P0 = subclass ['TAP';'Base'], ['TAP';'Parser']
    $P0.'add_attribute'('stream')
    $P0.'add_attribute'('results')
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

.sub 'init' :vtable :init
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'results', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'skipped', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'todo', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'passed', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'failed', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'actual_failed', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'actual_passed', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'todo_passed', $P0
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'parse_errors', $P0
    $P0 = box 0
    setattribute self, 'tests_run', $P0
    $P0 = box 0
    setattribute self, 'tests_planned', $P0
    $P0 = get_global ['TAP';'Parser'], 'LEGAL_CALLBACK'
    setattribute self, 'ok_callbacks', $P0
.end

.sub 'skipped' :method :nsentry
    $P0 = getattribute self, 'skipped'
    $I0 = elements $P0
    .return ($I0)
.end

.sub 'todo' :method :nsentry
    $P0 = getattribute self, 'todo'
    $I0 = elements $P0
    .return ($I0)
.end

.sub 'passed' :method :nsentry
    $P0 = getattribute self, 'passed'
    $I0 = elements $P0
    .return ($I0)
.end

.sub 'failed' :method :nsentry
    $P0 = getattribute self, 'failed'
    $I0 = elements $P0
    .return ($I0)
.end

.sub 'todo_passed' :method :nsentry
    $P0 = getattribute self, 'todo_passed'
    $I0 = elements $P0
    .return ($I0)
.end

.sub 'parse_errors' :method :nsentry
    $P0 = getattribute self, 'parse_errors'
    $I0 = elements $P0
    .return ($I0)
.end

.sub 'tests_run' :method :nsentry
    $P0 = getattribute self, 'tests_run'
    .return ($P0)
.end

.sub 'tests_planned' :method :nsentry
    $P0 = getattribute self, 'tests_planned'
    .return ($P0)
.end

.sub 'ignore_exit' :method :nsentry
    .param int ign
    $P0 = new 'Boolean'
    set $P0, ign
    setattribute self, 'ignore_exit', $P0
.end

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

.sub 'has_problems' :method
    $I0 = self.'failed'()
    if $I0 goto L1
    $I0 = self.'parse_errors'()
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

.sub '_add_error' :method
    .param pmc args :slurpy
    $P0 = getattribute self, 'parse_errors'
    $S0 = join '', args
    $P1 = box $S0
    push $P0, $P1
.end

.sub 'is_good_plan' :method
    $P0 = getattribute self, 'good_plan'
    .return ($P0)
.end

.sub 'spool' :method
    .param pmc spool
    setattribute self, 'spool', spool
.end

.sub 'delete_spool' :method
    $P0 = getattribute self, 'spool'
    null $P1
    setattribute self, 'spool', $P1
    .return ($P0)
.end

.sub 'pragma' :method
    .param string name
    .return (1)
.end

.sub 'tap' :method
    .param string tap
    $P0 = new 'StringHandle'
    $P0.'open'('tap', 'w')
    print $P0, tap
    setattribute self, 'stream', $P0
.end

.sub 'file' :method
    .param string filename
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(filename, 'r')
    pop_eh
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

.sub 'exec' :method
    .param pmc cmds :slurpy
    .local string cmd
    cmd = join ' ', cmds
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

.sub 'chomp' :anon
    .param string str
    $I0 = index str, "\r"
    if $I0 < 0 goto L1
    str = substr str, 0, $I0
  L1:
    $I1 = index str, "\n"
    if $I1 < 0 goto L2
    str = substr str, 0, $I1
  L2:
    .return (str)
.end

.sub 'run' :method
    .const 'Sub' next = 'next'
    $P0 = clone next
  L1:
    $P1 = $P0(self)
    unless null $P1 goto L1
.end

.sub 'next' :method :nsentry
    .local pmc stream, spool
    stream = getattribute self, 'stream'
    if null stream goto L1
    $N0 = time
    $P0 = box $N0
    setattribute self, 'start_time', $P0
    .local pmc grammar
    grammar = new ['TAP';'Parser';'Grammar']
    .local string st
    st = 'INIT'
  L2:
    $S0 = readline stream
    if $S0 == '' goto L3
    $S0 = chomp($S0)
    .local pmc token
    token = grammar.'tokenize'($S0)
    st = self.'next_state'(token, st)
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
  L6:
    .yield (token)
    goto L2
  L3:
    close stream
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

.sub 'next_state' :method
    .param pmc token
    .param string st
    .local pmc STATES
    STATES = get_global ['TAP';'Parser'], 'STATES'
    .local string type
    type = token.'type'()
  REDO:
    $I0 = STATES[st]
    if $I0 goto L1
    $S0 = "Illegal state: " . st
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
    st = $S0
    goto REDO
  L4:
    $I0 = exists $P1['goto']
    unless $I0 goto L5
    $S0 = $P1['goto']
    st = $S0
    goto L5
  L2:
    printerr "Unhandled token type: "
    printerr type
    printerr "\n"
  L5:
    .return (st)
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
    $P0['goto'] = 'PLANNED_AFTER_TEST'
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
    $P0 = box 1
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
    $P1 = box number
    push $P0, $P1
  L31:
    $I0 = result.'todo_passed'()
    unless $I0 goto L32
    $P0 = getattribute self, 'todo_passed'
    $P1 = box number
    push $P0, $P1
  L32:
    $I0 = result.'has_skip'()
    unless $I0 goto L33
    $P0 = getattribute self, 'skipped'
    $P1 = box number
    push $P0, $P1
  L33:
    $I0 = result.'is_ok'()
    unless $I0 goto L34
    $P0 = getattribute self, 'passed'
    $P1 = box number
    push $P0, $P1
    goto L35
  L34:
    $P0 = getattribute self, 'failed'
    $P1 = box number
    push $P0, $P1
  L35:
    $I0 = result.'is_actual_ok'()
    unless $I0 goto L36
    $P0 = getattribute self, 'actual_passed'
    $P1 = box number
    push $P0, $P1
    goto L37
  L36:
    $P0 = getattribute self, 'actual_failed'
    $P1 = box number
    push $P0, $P1
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

.sub 'total' :method
    $P0 = getattribute self, 'total'
    $I0 = $P0
    .return ($I0)
.end

.sub 'passed' :method
    $P0 = getattribute self, 'passed'
    $I0 = $P0
    .return ($I0)
.end

.sub 'descriptions' :method
    $P0 = getattribute self, 'parse_order'
    .return ($P0)
.end

.sub 'start' :method
    $N0 = time
    $P0 = box $N0
    setattribute self, 'start_time', $P0
.end

.sub 'stop' :method
    $N0 = time
    $P0 = box $N0
    setattribute self, 'end_time', $P0
.end

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

.sub 'elapsed_timestr' :method
    $N0 = self.'elapsed'()
    $P0 = new 'FixedPMCArray'
    $P0 = 1
    $P0[0] = $N0
    $S0 = sprintf "%.3f wallclock secs", $P0
    .return ($S0)
.end

.sub 'has_problems' :method
    $P0 = getattribute self, 'todo_passed'
    $I0 = $P0
    if $I0 goto L1
    $I0 = self.'has_errors'()
  L1:
    .return ($I0)
.end

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

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
