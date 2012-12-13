#!./parrot
# Copyright (C) 2006-2012, Parrot Foundation.

=head1 NAME

t/pmc/parrotinterpreter.t - test the ParrotInterpreter PMC


=head1 SYNOPSIS

    % prove t/pmc/parrotinterpreter.t

=head1 DESCRIPTION

Tests the ParrotInterpreter PMC.

=cut

.include 'except_types.pasm'

.sub main :main
.include 'test_more.pir'

    plan(18)
    test_new()      # 1 test
    test_hll_map()  # 3 tests
    test_hll_map_invalid()  # 1 tests

# Need for testing
.annotate 'foo', 'bar'
    test_inspect()  # 9 tests
.end

.sub test_new
    new $P0, ['ParrotInterpreter']
    ok(1,'new')
.end

.HLL 'Perl6'

.sub test_hll_map
.include 'test_more.pir'
    $P0 = get_class 'Integer'
    $P1 = subclass $P0, 'MyInt'

    $P2 = getinterp
    $P2.'hll_map'($P0, $P1)

    $P3 = 'foo'()
    is($P3, 3)
    $S0 = typeof $P3
    is($S0, "MyInt")
    bar(4)
.end

.sub foo
    .return (3)
.end

.sub bar
    .param pmc n
    $S0 = typeof n
    is($S0, 'MyInt')
.end

# Switch back to root namespace
.HLL 'parrot'

.sub test_hll_map_invalid
    .local pmc eh
    .local int result
    $P0 = get_class 'Integer'
    $P1 = subclass $P0, 'MyInt'
    $P2 = getinterp
    eh = new ['ExceptionHandler']
    set_label eh, catch
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    result = 0
    push_eh eh
    $P2.'hll_map'($P0, $P1)
    goto done
  catch:
    finalize eh
    result = 1
  done:
    is(result, 1, 'hll_map outside an HLL throws')
.end

# Test accessors to various Interp fields
.sub 'test_inspect'
    .local pmc interp
    interp = getinterp

    # Enforce creating of lexpad
    .lex 'foo', interp

    $P0 = interp['sub';0]
    is($P0, 'test_inspect', 'Got ParrotInterpreter.sub')

    $P0 = interp['lexpad';0]
    $I0 = isa $P0, 'LexPad'
    ok($I0, 'Got ParrotInterpreter.lexpad')

    $P0 = interp['namespace';0]
    $I0 = isa $P0, 'NameSpace'
    ok($I0, 'Got ParrotInterpreter.namespace')

    $P0 = interp['continuation';0]
    $I0 = isa $P0, 'Continuation'
    ok($I0, 'Got ParrotInterpreter.continuation')

    $P0 = interp['annotations';1]
    $S0 = $P0['foo']
    is($S0, 'bar', 'Got ParrotInterpreter.annotations')

    $P0 = interp['context';0]
    $I0 = isa $P0, 'CallContext'
    ok($I0, 'Got ParrotInterpreter.context')
    # Add more tests for Context. E.g. it is correct Context by inspecting it.

    $P0 = interp['packfile']
    $I0 = isa $P0, 'PackfileView'
    ok($I0, 'Got ParrotInterpreter.packfile')

    push_eh caught
    $I0 = 1
    $P0 = interp['some_field';0]
    $I0 = 0
  caught:
    pop_eh
    ok($I0, "Access to non-existent field throws exception")

    push_eh wrong_depth
    $I0 = 1
    $P0 = interp['sub';1000]
    $I0 = 0
  wrong_depth:
    pop_eh
    ok($I0, "Access to wrong depth throws exception")

    $I0 = interp.'recursion_limit'()
    ok($I0, "Got recursion_limit")

    $I0 = interp
    is($I0, 0, "Got parent tid==0")

    $P0 = get_global 'task1'
    $P1 = new 'Task', $P0
    $I0 = $P1
    $I1 = $I0 > 0
    ok($I1, "child task.id > 0")
    schedule $P1
    wait $P1
.end

.sub task1
    $P0 = getinterp
    $I0 = $P0
    if $I0 > 0 goto t1
    print "not "
t1:
    print "ok 18 #TODO Can not get the task interp yet, child.tid="
    say $I0
    exit 0
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
