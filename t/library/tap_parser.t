#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/library/tap_parser.t

=head1 DESCRIPTION

Test the TAP/Parser library

=head1 SYNOPSIS

    % prove t/library/tap_parser.t

=cut

.include 'load_bytecode.pir'

.sub 'main' :main
    .include 'test_more.pir'

    '__load_bytecode'('TAP/Parser.pbc')

    plan(203)
    test_grammar_plan()
    test_grammar_bailout()
    test_grammar_comment()
    test_grammar_tests()
    test_grammar_version()
    test_tap()
    test_tap_with_blank_lines()
    test_tap_has_problem()
    test_tap_version_wrong_place()
    test_tap_trailing_plan()
    test_aggregator()
.end

.sub 'test_grammar_plan'
    .local pmc grammar, token
    grammar = new ['TAP';'Parser';'Grammar']
    token = grammar.'tokenize'("1..42")
    $P0 = get_class ['TAP';'Parser';'Result';'Plan']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "1..42")
    $P0 = getattribute token, 'plan'
    is($P0, "1..42")
    $P0 = getattribute token, 'tests_planned'
    is($P0, 42, "tests_planned")

    token = grammar.'tokenize'("1..0 # SKIP why not?")
    $P0 = get_class ['TAP';'Parser';'Result';'Plan']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "1..0 # SKIP why not?")
    $P0 = getattribute token, 'plan'
    is($P0, "1..0")
    $P0 = getattribute token, 'tests_planned'
    is($P0, 0, "tests_planned")
    $P0 = getattribute token, 'directive'
    is($P0, 'SKIP', "directive")
    $P0 = getattribute token, 'explanation'
    is($P0, 'why not?', "explanation")

    token = grammar.'tokenize'("1..0")
    $P0 = get_class ['TAP';'Parser';'Result';'Plan']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "1..0")
    $P0 = getattribute token, 'plan'
    is($P0, "1..0")
    $P0 = getattribute token, 'tests_planned'
    is($P0, 0, "tests_planned")
    $P0 = getattribute token, 'directive'
    is($P0, 'SKIP', "directive")
.end

.sub 'test_grammar_bailout'
    .local pmc grammar, token
    grammar = new ['TAP';'Parser';'Grammar']
    token = grammar.'tokenize'("Bail out!")
    $P0 = get_class ['TAP';'Parser';'Result';'Bailout']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "Bail out!")
    $P0 = getattribute token, 'explanation'
    is($P0, '', "no explanation")

    token = grammar.'tokenize'("Bail out! some explanation")
    $P0 = get_class ['TAP';'Parser';'Result';'Bailout']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "Bail out! some explanation")
    $P0 = getattribute token, 'explanation'
    is($P0, "some explanation", "explanation")
.end

.sub 'test_grammar_comment'
    .local pmc grammar, token
    grammar = new ['TAP';'Parser';'Grammar']
    token = grammar.'tokenize'("# this is a comment")
    $P0 = get_class ['TAP';'Parser';'Result';'Comment']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "# this is a comment")
    $P0 = getattribute token, 'comment'
    is($P0, 'this is a comment', "comment")
.end

.sub 'test_grammar_tests'
    .local pmc grammar, token
    grammar = new ['TAP';'Parser';'Grammar']
    token = grammar.'tokenize'("ok 1 this is a test")
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "ok 1 this is a test")
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 1, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, 'this is a test', "description")

    token = grammar.'tokenize'("not ok 2 this is a test # TODO whee!")
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "not ok 2 this is a test # TODO whee!")
    $P0 = getattribute token, 'ok'
    is($P0, 'not ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 2, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, 'this is a test', "description")
    $P0 = getattribute token, 'directive'
    is($P0, 'TODO', "directive")
    $P0 = getattribute token, 'explanation'
    is($P0, 'whee!', "explanation")

    token = grammar.'tokenize'("ok 22 this is a test \\# TODO whee!")
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "ok 22 this is a test \\# TODO whee!")
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 22, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, 'this is a test \# TODO whee!', "description")

    token = grammar.'tokenize'("not ok")
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "not ok")
    $P0 = getattribute token, 'ok'
    is($P0, 'not ok', "ok")
    $P0 = getattribute token, 'test_num'
    null $P1
    is($P0, $P1, "test_num")
    $P0 = getattribute token, 'description'
    null $P1
    is($P0, $P1, "description")

    token = grammar.'tokenize'("ok 42")
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "ok 42")
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 42, "test_num")
    $P0 = getattribute token, 'description'
    null $P1
    is($P0, $P1, "description")
.end

.sub 'test_grammar_version'
    .local pmc grammar, token
    grammar = new ['TAP';'Parser';'Grammar']
    token = grammar.'tokenize'("TAP version 12")
    $P0 = get_class ['TAP';'Parser';'Result';'Version']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, "TAP version 12")
    $P0 = getattribute token, 'version'
    is($P0, 12, "version")
.end

.sub '_get_results'
    .param pmc parser
    .local pmc result
    result = new 'ResizablePMCArray'
    $P0 = get_hll_global ['TAP';'Parser'], 'next'
    .local pmc coro
    coro = newclosure $P0
  L1:
    $P0 = coro(parser)
    if null $P0 goto L2
    push result, $P0
    goto L1
  L2:
    .return (result)
.end

.sub 'test_tap'
    .local pmc parser, result, token
    parser = new ['TAP';'Parser']
    parser.'tap'(<<'END_TAP')
TAP version 13
1..7
ok 1 - input file opened
... this is junk
not ok first line of the input valid # todo some data
# this is a comment
ok 3 - read the rest of the file
not ok 4 - this is a real failure
ok 5 # skip we have no description
ok 6 - you shall not pass! # TODO should have failed
not ok 7 - Gandalf wins.  Game over.  # TODO 'bout time!
END_TAP
    result = _get_results(parser)
    $I0 = elements result
    is($I0, 11, "elements")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Version']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'version'
    is($P0, 13, "version")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Plan']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'plan'
    is($P0, "1..7", "plan")
    $P0 = getattribute token, 'tests_planned'
    is($P0, 7, "tests_planned")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 1, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- input file opened', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'has_todo'()
    nok($I0)
    $I0 = token.'has_skip'()
    nok($I0)

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Unknown']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, '... this is junk', "raw")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'not ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 2, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, 'first line of the input valid', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    nok($I0)
    $I0 = token.'has_todo'()
    ok($I0)
    $I0 = token.'has_skip'()
    nok($I0)
    $P0 = getattribute token, 'explanation'
    is($P0, 'some data', "explanation")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Comment']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'comment'
    is($P0, 'this is a comment', "comment")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 3, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- read the rest of the file', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'has_todo'()
    nok($I0)
    $I0 = token.'has_skip'()
    nok($I0)

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'not ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 4, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- this is a real failure', "description")
    $I0 = token.'is_ok'()
    nok($I0)
    $I0 = token.'is_actual_ok'()
    nok($I0)
    $I0 = token.'has_todo'()
    nok($I0)
    $I0 = token.'has_skip'()
    nok($I0)

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 5, "test_num")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'has_todo'()
    nok($I0)
    $I0 = token.'has_skip'()
    ok($I0)
    $P0 = getattribute token, 'explanation'
    is($P0, 'we have no description', "explanation")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 6, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- you shall not pass!', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'has_todo'()
    ok($I0)
    $I0 = token.'has_skip'()
    nok($I0)
    $P0 = getattribute token, 'explanation'
    is($P0, 'should have failed', "explanation")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'not ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 7, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- Gandalf wins.  Game over.', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    nok($I0)
    $I0 = token.'has_todo'()
    ok($I0)
    $I0 = token.'has_skip'()
    nok($I0)
    $P0 = getattribute token, 'explanation'
    is($P0, "'bout time!", "explanation")

    $P0 = getattribute parser, 'passed'
    $S0 = join ', ', $P0
    is($S0, "1, 2, 3, 5, 6, 7", "passed")
    $P0 = getattribute parser, 'failed'
    $S0 = join ', ', $P0
    is($S0, "4", "failed")
    $P0 = getattribute parser, 'actual_passed'
    $S0 = join ', ', $P0
    is($S0, "1, 3, 5, 6", "actual_passed")
    $P0 = getattribute parser, 'actual_failed'
    $S0 = join ', ', $P0
    is($S0, "2, 4, 7", "actual_failed")
    $P0 = getattribute parser, 'todo'
    $S0 = join ', ', $P0
    is($S0, "2, 6, 7", "todo")
    $P0 = getattribute parser, 'skipped'
    $S0 = join ', ', $P0
    is($S0, "5", "skipped")
    $P0 = getattribute parser, 'todo_passed'
    $S0 = join ', ', $P0
    is($S0, "6", "todo_passed")

    $P0 = getattribute parser, 'plan'
    is($P0, "1..7", "plan")
    $P0 = getattribute parser, 'tests_planned'
    is($P0, 7, "tests_planned")
.end

.sub 'test_tap_with_blank_lines'
    .local pmc parser, result, token
    parser = new ['TAP';'Parser']
    parser.'tap'(<<'END_TAP')
1..2
ok 1 - input file opened


ok 2 - read the rest of the file
END_TAP
    result = _get_results(parser)
    $I0 = elements result
    is($I0, 5, "elements")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Plan']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'plan'
    is($P0, "1..2", "plan")
    $P0 = getattribute token, 'tests_planned'
    is($P0, 2, "tests_planned")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 1, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- input file opened', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'has_todo'()
    nok($I0)
    $I0 = token.'has_skip'()
    nok($I0)

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Unknown']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, '', "raw")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Unknown']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'raw'
    is($P0, '', "raw")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 2, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- read the rest of the file', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'has_todo'()
    nok($I0)
    $I0 = token.'has_skip'()
    nok($I0)
.end

.sub 'test_tap_has_problem'
    .local pmc parser
    parser = new ['TAP';'Parser']
    parser.'tap'(<<'END_TAP')
TAP version 13
1..2
ok 1 - input file opened
ok 2 - Gandalf wins.  Game over.  # TODO 'bout time!
END_TAP
    parser.'run'()
    $I0 = parser.'failed'()
    is($I0, 0, "not failed")
    $I0 = parser.'todo_passed'()
    is($I0, 1, "todo_passed")
    $I0 = parser.'has_problems'()
    nok($I0, "has not problem")

    parser = new ['TAP';'Parser']
    parser.'tap'(<<'END_TAP')
TAP version 13
1..2
SMACK
END_TAP
    parser.'run'()
    $I0 = parser.'failed'()
    is($I0, 0, "not failed")
    $I0 = parser.'todo_passed'()
    is($I0, 0, "todo_passed")
    $I0 = parser.'parse_errors'()
    is($I0, 2, "parse_errors")
    $I0 = parser.'has_problems'()
    ok($I0, "has_problems")
.end

.sub 'test_tap_version_wrong_place'
    .local pmc parser
    parser = new ['TAP';'Parser']
    parser.'tap'(<<'END_TAP')
1..2
ok 1 - input file opened
TAP version 12
ok 2 - Gandalf wins
END_TAP
    parser.'run'()
    $I0 = parser.'failed'()
    is($I0, 0, "not failed")
    $I0 = parser.'parse_errors'()
    is($I0, 1, "parse_errors")
    $P0 = getattribute parser, 'parse_errors'
    $S0 = shift $P0
    is($S0, "If TAP version is present it must be the first line of output")
.end

.sub 'test_tap_trailing_plan'
    .local pmc parser, result, token
    parser = new ['TAP';'Parser']
    parser.'tap'(<<'END_TAP')
ok 1 - input file opened
ok 2 - Gandalf wins
1..2
END_TAP
    result = _get_results(parser)
    $I0 = elements result
    is($I0, 3, "elements")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 1, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- input file opened', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'is_unplanned'()
    nok($I0, "unplanned")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Test']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'ok'
    is($P0, 'ok', "ok")
    $P0 = getattribute token, 'test_num'
    is($P0, 2, "test_num")
    $P0 = getattribute token, 'description'
    is($P0, '- Gandalf wins', "description")
    $I0 = token.'is_ok'()
    ok($I0)
    $I0 = token.'is_actual_ok'()
    ok($I0)
    $I0 = token.'is_unplanned'()
    nok($I0, "unplanned")

    token = shift result
    $P0 = get_class ['TAP';'Parser';'Result';'Plan']
    isa_ok(token, $P0)
    $P0 = getattribute token, 'plan'
    is($P0, "1..2", "plan")
    $P0 = getattribute token, 'tests_planned'
    is($P0, 2, "tests_planned")

    $I0 = parser.'passed'()
    is($I0, 2, "passed")
    $I0 = parser.'failed'()
    is($I0, 0, "failed")
    $I0 = parser.'parse_errors'()
    is($I0, 0, "parse_errors")
    $I0 = parser.'has_problems'()
    is($I0, 0, "has_problems")

    $P0 = getattribute parser, 'plan'
    is($P0, "1..2", "plan")
    $P0 = getattribute parser, 'tests_planned'
    is($P0, 2, "tests_planned")
.end

.sub 'test_aggregator'
    .local pmc parser1, parser2, agg
    parser1 = new ['TAP';'Parser']
    parser1.'tap'(<<'END_TAP')
1..5
ok 1 - input file opened
... this is junk
not ok first line of the input valid # todo some data
# this is a comment
ok 3 - read the rest of the file
not ok 4 - this is a real failure
ok 5 # skip we have no description
END_TAP
    parser1.'run'()

    parser2 = new ['TAP';'Parser']
    parser2.'tap'(<<'END_TAP')
1..7
ok 1 - gentlemen, start your engines
not ok first line of the input valid # todo some data
# this is a comment
ok 3 - read the rest of the file
not ok 4 - this is a real failure
ok 5
ok 6 - you shall not pass! # TODO should have failed
not ok 7 - Gandalf wins.  Game over.  # TODO 'bout time!
END_TAP
    parser2.'run'()

    agg = new ['TAP';'Parser';'Aggregator']
    agg.'add'('tap1', parser1)
    agg.'add'('tap2', parser2)

    $P0 = agg.'descriptions'()
    $I0 = elements $P0
    is($I0, 2, "descriptions")

    $P0 = getattribute agg, 'passed'
    is($P0, 10, "passed")
    $P0 = getattribute agg, 'failed'
    is($P0, 2, "failed")
    $P0 = getattribute agg, 'todo'
    is($P0, 4, "todo")
    $P0 = getattribute agg, 'skipped'
    is($P0, 1, "skipped")
    $P0 = getattribute agg, 'parse_errors'
    is($P0, 1, "parse_errors")
    $P0 = getattribute agg, 'todo_passed'
    is($P0, 1, "todo_passed")
    $P0 = getattribute agg, 'total'
    is($P0, 12, "total")
    $P0 = getattribute agg, 'planned'
    is($P0, 12, "planned")

    $I0 = agg.'has_problems'()
    ok($I0, "has_problems")
    $I0 = agg.'has_errors'()
    ok($I0, "has_errors")
    $S0 = agg.'get_status'()
    is($S0, 'FAIL', "status")
    $I0 = agg.'all_passed'()
    nok($I0, "all_passed")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
