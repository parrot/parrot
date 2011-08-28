#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/pmc/exception.t - Exception Handling

=head1 SYNOPSIS

    % prove t/pmc/exception.t

=head1 DESCRIPTION

Tests C<Exception> and C<ExceptionHandler> PMCs.

=cut

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'
    plan(53)
    test_bool()
    test_int()
    test_new_int()
    test_integer_keyed()
    test_string_keyed()
    test_attrs()
    test_attributes()
    test_setattribute_wrong()
    test_birthtime()
    test_handler_ctx()
    test_push_pop_eh()
    test_push_pop_eh_long()
    test_push_eh_throw()
    test_die()
    test_throw_obj()
    test_clone()
    test_throw_clone()
    test_throw_serialized()
    test_backtrace()
    test_annotations()
    test_subclass_throw()
    test_subclass_finalize()
.end

.sub test_bool
    $P1 = new 'Exception'
    ok($P1,'Exception object return true')
.end

.sub test_int
    $P0 = new 'Exception'
    $P0 = 42
    $I0 = $P0
    is($I0, 42, 'set/get integer on Exception')
.end

.sub test_new_int
    .local pmc ex
    ex = new ['Exception'], .EXCEPTION_SYNTAX_ERROR
    .local int value
    value = ex['type']
    is(value, .EXCEPTION_SYNTAX_ERROR, 'new with int argument sets type')
.end

.sub test_integer_keyed
    .local pmc ex, eh
    .local int value
    ex = new ['Exception']

    value = ex['type']
    is(value, 0, 'get type default value')
    ex['type'] = .EXCEPTION_SYNTAX_ERROR
    value = ex['type']
    is(value, .EXCEPTION_SYNTAX_ERROR, 'get type value changed')

    value = ex['exit_code']
    is(value, 0, 'get exit_code default value')
    ex['exit_code'] = 127
    value = ex['exit_code']
    is(value, 127, 'get exit_code value changed')

    value = ex['handled']
    is(value, 0, 'get handled default is false')
    ex['handled'] = 1
    value = ex['handled']
    is(value, 1, 'get handled value changed')

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_ATTRIB_NOT_FOUND)
    set_label eh, catch
    push_eh eh
    value = 1
    ex['the droids you are looking for'] = 42
    value = 0
  catch:
    finalize eh
    is(value, 1, 'set invalid key throws')

    set_label eh, catch2
    value = 1
    value = ex['the droids you are looking for']
    value = 0
  catch2:
    finalize eh
    is(value, 1, 'get invalid key throws')
.end

.sub test_string_keyed
    .local pmc ex, eh
    .local string value
    .const string TEST_VALUE = 'fubar'
    ex = new ['Exception']
    ex['message'] = TEST_VALUE
    value = ex['message']
    is(value, TEST_VALUE, 'set/get string_keyed')
.end


.sub setattr_int
    .param pmc obj
    .param string attrname
    .param int value
    $P0 = new ['Integer'], value
    setattribute obj, attrname, $P0
.end

.sub setattr_string
    .param pmc obj
    .param string attrname
    .param string value
    $P0 = new ['String']
    $P0 = value
    setattribute obj, attrname, $P0
.end

.sub gotattr_int
    .param pmc obj
    .param string attrname
    .param int checkvalue

    $S0 = 'got ' . attrname
    $P1 = getattribute obj, attrname
    $I1 = $P1
    is($I1, checkvalue, $S0)
.end

.sub gotattr_string
    .param pmc obj
    .param string attrname
    .param string checkvalue

    $S0 = 'got ' . attrname
    $P1 = getattribute obj, attrname
    $S1 = $P1
    is($S1, checkvalue, $S0)
.end


.sub test_attrs
    $P0 = new 'ExceptionHandler'
    set_label $P0, _handler
    push_eh $P0
    throw $P0
  _handler:
    get_results "0", $P0
    getattribute $P1, $P0, 'type'
    ok(1,'got type')
    getattribute $P2, $P0, 'handled'
    is($P2,0,'got handled')
    getattribute $P3, $P0, 'exit_code'
    is($P2,0,'got exit_code')
    getattribute $P4, $P0, 'severity'
    ok(1,'got severity')

    push_eh catch
    $I0 = 1
    getattribute $P5, $P0, 'foo'
    $I0 = 0
    goto done
  catch:
    .get_results($P0)
    finalize $P0
  done:
    ok($I0, "Can't fetch non-existent attribute")
.end

.sub test_attributes
    $P1 = new ['Exception']

    setattr_int($P1,    'type',      5)
    setattr_int($P1,    'severity',  6)
    setattr_int($P1,    'exit_code', 7)
    setattr_int($P1,    'handled',   1)
    setattr_string($P1, 'message',   "just pining")
    setattr_string($P1, 'payload',   "additional payload")

    $P8 = new ['ResizablePMCArray']
    $P8 = 2
    $P8[0] = 'backtrace line 1'
    $P8[1] = 'backtrace line 2'
    setattribute $P1, 'backtrace', $P8

    push_eh handler
    throw $P1
    ok(0, "throwing exception failed")
    skip(7, "because of throwing exception failed")
    .return()
  handler:
    .get_results($P0)
    pop_eh

    gotattr_int($P0,    'type',      5)
    gotattr_int($P0,    'severity',  6)
    gotattr_int($P0,    'exit_code', 7)
    gotattr_int($P0,    'handled',   1)
    gotattr_string($P0, 'message',   "just pining")
    gotattr_string($P0, 'payload',   "additional payload")

    $P28 = getattribute $P0, 'backtrace'
    $P30 = $P28[0]
    is($P30, "backtrace line 1", 'got backtrace data')

    $P31 = $P28[1]
    is($P31, "backtrace line 2", 'more backtrace data')
.end

.sub test_setattribute_wrong
    .local pmc ex, eh
    .local int result
    ex = new ['Exception']
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_ATTRIB_NOT_FOUND)
    set_label eh, catch
    result = 0
    push_eh eh
    setattribute ex, 'wrong attribute', eh
    goto done
  catch:
    result = 1
    finalize eh
  done:
    is(result, 1, 'setting a wrong attribute throws')
.end

.sub test_birthtime
    .local pmc ex, bt
    ex = new ['Exception']
    .local num n, nbt
    n = 123.456
    ex = n
    bt = getattribute ex, 'birthtime'
    nbt = bt
    is(nbt, n, 'get and set birthtime')
.end

.sub test_handler_ctx
    .local pmc ex, eh, hc
    .local int result
    ex = new ['Exception']
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)

    result = 0
    set_label eh, catch_get
    push_eh eh
    hc = getattribute ex, 'handler_ctx'
    goto done_get
  catch_get:
    finalize eh
    result = 1
  done_get:
    is(result, 1, 'get handler_ctx invalid operation')

    result = 0
    set_label eh, catch_set
    setattribute ex, 'handler_ctx', ex
    goto done_set
  catch_set:
    finalize eh
    result = 1
  done_set:
    is(result, 1, 'set handler_ctx invalid operation')
.end

.sub test_push_pop_eh
    push_eh handler
    ok(1,'push_eh works')

    pop_eh
    ok(1,'pop_eh works')
    .return()

  handler:
    diag("i am the decider")
.end

.sub test_push_eh_throw
    push_eh handler
    $P0 = new ['Exception']
    throw $P0
    ok(0,'throw does not throw')

  handler:
    ok(1,'throw can throw')
.end

.sub test_push_pop_eh_long
    $P0 = new ['ExceptionHandler']
    set_label $P0, handler
    push_eh $P0
    ok(1,'push_eh works (long)')

    pop_eh
    ok(1,'pop_eh works (long)')
    .return()

  handler:
    diag("i am the decider")
.end

.sub test_die
    push_eh handler
    die 3, 100
    say "not reached"
    .return()
  handler:
    ok(1,'die works')
.end

.sub test_throw_obj
    new $P20, ['ExceptionHandler']
    set_label $P20, _handler
    push_eh $P20
    new $P30, ['Exception']
    throw $P30
    say "not reached"
_handler:
    ok(1,'caught exception object thrown')
.end

# Test clone vtable function

.sub test_clone
    .local pmc ex, exclone
    ex = new ['Exception']
    ex['type'] = .EXCEPTION_SYNTAX_ERROR
    exclone = clone ex
    .local int result
    result = iseq ex, exclone
    is(result, 1, 'cloned Exception is equal to original')
    exclone['type'] = .EXCEPTION_ERR_OVERFLOW
    result = iseq ex, exclone
    is(result, 0, 'cloned and modified Exception is not equal to original')
.end

.sub test_throw_clone
    .local pmc ex, exclone, eh, ehguard
    .local int result
    ex = new ['Exception']
    ex['type'] = .EXCEPTION_SYNTAX_ERROR
    exclone = clone ex

    ehguard = new ['ExceptionHandler']
    set_label ehguard, catchall
    push_eh ehguard
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_SYNTAX_ERROR)
    set_label eh, catch
    result = 0
    push_eh eh
    throw exclone
    goto catchall
  catch:
    result = 1
  catchall:
    finalize eh
    finalize ehguard
    is(result, 1, 'caught a cloned Exception')

    null exclone
    result = 0
    .local pmc pay, getpay, exc
    set_label ehguard, catchall2
    set_label eh, catch2

    pay = new ['Integer'], 9875
    ex['payload'] = pay
    exclone = clone ex
    result = iseq ex, exclone
    is(result, 1, 'cloned Exception with payload is equal to original')

    result = 0
    throw exclone
    goto catchall2
  catch2:
    .get_results(exc)
    getpay = exc['payload']
    $I0 = getpay
    if $I0 != 9875 goto catchall2
    result = 1
  catchall2:
    is(result, 1, 'caught a cloned Exception with payload')
.end

.sub test_throw_serialized
    .local pmc ex, exclone, eh, ehguard
    .local int result
    ex = new ['Exception']
    ex['type'] = .EXCEPTION_SYNTAX_ERROR
    $S0     = freeze ex
    exclone = thaw $S0

    ehguard = new ['ExceptionHandler']
    set_label ehguard, catchall
    push_eh ehguard
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_SYNTAX_ERROR)
    set_label eh, catch
    result = 0
    push_eh eh
    throw exclone
    goto catchall
  catch:
    result = 1
  catchall:
    finalize eh
    finalize ehguard
    is(result, 1, 'caught a cloned Exception')

    null exclone
    result = 0
    .local pmc pay, getpay, exc
    set_label ehguard, catchall2
    set_label eh, catch2

    pay = new ['Integer'], 9875
    ex['payload'] = pay
    $S0     = freeze ex
    exclone = thaw $S0
    result = iseq ex, exclone
    is(result, 1, 'cloned Exception with payload is equal to original')

    result = 0
    throw exclone
    goto catchall2
  catch2:
    .get_results(exc)
    getpay = exc['payload']
    $I0 = getpay
    if $I0 != 9875 goto catchall2
    result = 1
  catchall2:
    is(result, 1, 'caught a cloned Exception with payload')
.end

.sub test_backtrace
    .local pmc ex, bt
    ex = new ['Exception']
    bt = ex.'backtrace'()
    $I0 = isnull bt
    is($I0, 0, 'got backtrace from unthrow Exception')
.end

.sub test_annotations
    .local pmc ex, ann
    ex = new ['Exception']
    ann = ex.'annotations'()
    $I0 = isnull ann
    is($I0, 0, 'got annotations from unthrow Exception')
    $I0 = ann
    is($I0, 0, 'annotations from unthrow Exception are empty')
.end

.sub test_subclass_throw
    $P1 = get_class ["Exception"]
    $P2 = subclass $P1, "MyException"
    $P3 = new $P2
    $S0 = typeof $P3
    is ($S0, "MyException", "can create a subclass")
    $S0 = $P3
    is ($S0, "MyException", "really is a subclass, with :vtable override")

    push_eh my_handler
    throw $P3
    pop_eh
    ok(0, "Could not throw MyException")
    .return()
  my_handler:
    .get_results($P4)
    pop_eh
    $S0 = typeof $P4
    is ($S0, "MyException", "received a MyException object")
    $S0 = $P4
    is ($S0, "MyException", "really is a subclass, with :vtable override")
    .return()
.end

.sub test_subclass_finalize
    $P0 = newclass "MyBuggyObject"
    $P3 = new $P0
    push_eh my_handler
    $S0 = $P3
    pop_eh
    ok(0, "MyBuggyObject not as buggy as advertised")
    .return()
  my_handler:
    .get_results($P4)
    $S0 = typeof $P4
    is ($S0, "MyException", "received a MyException object")
    $S0 = $P4
    is ($S0, "MyException", "really is a subclass, with :vtable override")
    finalize $P4
    .return()
.end

.namespace ["MyException"]

.sub get_string :vtable("get_string") :method
    .return("MyException")
.end

.namespace ["MyBuggyObject"]

.sub get_string :vtable("get_string") :method
    $P0 = new ["MyException"]
    diag("throwing")
    throw $P0
    diag("this didn't work!")
    ok(0, "Oops! We shouldn't ever end up here unless finalize fails")
    exit 1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
