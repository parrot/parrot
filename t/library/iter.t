#!./parrot
# Copyright (C) 2006, The Perl Foundtation.
# $Id$

.const int TESTS = 47

.sub 'main' :main
    load_bytecode 'Test/More.pir'

    $P0 = new .Env
    $P0 = $P0['TEST_VERBOSE']
    unless null $P0 goto set_verbose
    $P0 = new .Integer
    $P0 = 0
  set_verbose:
    store_global 'TEST_VERBOSE', $P0

  import:
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exports = split " ", "plan ok is diag"
    test_namespace.export_to(curr_namespace, exports)

    'plan'( TESTS )

    'load'()
    'object_init'()
    'FixedPMCArray_empty'()
    'FixedPMCArray_3elem'()
    'ResizablePMCArray_empty'()
    'ResizablePMCArray_3elem'()
.end


.sub 'load'
    'diag'('test library loading')

  T1:
    push_eh err_load_bytecode
    $S0 = 'Iter.pir'
    load_bytecode $S0
    clear_eh
    $S1 = 'loaded '
    $S1 .= $S0
    'ok'(1, $S1)
    goto end
  err_load_bytecode:
    $S1 = "cannot load "
    $S1 .= $S0
    'ok'(0, $S1)
    end
  end:
.end


.sub 'object_init'
    'diag'('test object initialization')

  T1:
    $P99 = new .FixedPMCArray
    $P99 = 0

    .local pmc iter
               iter = new 'Iter'

    $I0 = 0
    if null iter goto test_iter_new
    $I0 = 1
  test_iter_new:
    'ok'($I0, 'created Iter')

  T2:
    push_eh err_start_noargs
    iter.'start'()
    clear_eh
    'ok'(0, 'start requires an aggregate')
    goto T3
  err_start_noargs:
    ok(1, 'start requires an aggregate')

  T3:
    iter.'start'($P99)
    'ok'(1, ".'start'() runs without exception")

  T4:
    iter.'start'($P99)
    'ok'(1, ".'start'() runs again without exception")
.end


.sub 'FixedPMCArray_empty'
    'diag'('test empty FixedPMCArray')

  T1:
    $P99 = new .FixedPMCArray
    $P99 = 0

    .local pmc iter
               iter = new 'Iter'

    iter.'start'($P99)

    .local int is_exhausted
    .local int index
               index = 0
    .local pmc value

    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T2:
    value = iter.'value'()
    $I0 = isnull value
    'ok'($I0, ".'value'() returns PMCNULL")

  T3:  # index = 0
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T4:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 1, ".'exhausted'() returns true")

  T5:
    value = iter.'value'()
    $I0 = isnull value
    'ok'($I0, ".'value'() returns PMCNULL")

  T6:
    iter.'next'()
    'ok'(1, ".'next'() runs without exception after iter exhaustion")
.end


.sub 'FixedPMCArray_3elem'
    'diag'('test FixedPMCArray with three elements')

  T1:
    $P99 = new .FixedPMCArray
    $P99 = 3
    $P99[0] = 'a'
    $P99[1] = 'b'
    $P99[2] = 'c'

    .local pmc iter
               iter = new 'Iter'

    iter.'start'($P99)

    .local int is_exhausted
    .local int index
               index = 0
    .local pmc value

    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T2:
    value = iter.'value'()
    $I0 = isnull value
    'ok'($I0, ".'value'() returns PMCNULL")

  T3:  # index = 0
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T4:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T5:
    value = iter.'value'()
    $P0 = $P99[index]
    'is'(value, $P0, ".'next'() and .'value'()")

    inc index

  T6:  # index = 1
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T7:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T8:
    value = iter.'value'()
    $P0 = $P99[index]
    'is'(value, $P0, ".'next'() and .'value'()")

    inc index

  T9:  # index = 2
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T10:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T11:
    value = iter.'value'()
    $P0 = $P99[index]
    'is'(value, $P0, ".'next'() and .'value'()")

    inc index

  T12:  # exhausted
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T13:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 1, ".'exhausted'() returns true")

  T14:
    $P0 = iter.'value'()
    $I0 = isnull $P0
    'is'($I0, 1, ".'value'() returns PMCNULL")

  T15:
    iter.'next'()
    'ok'(1, ".'next'() runs without exception after iter exhaustion")
.end


.sub 'ResizablePMCArray_empty'
    'diag'('test empty ResizablePMCArray')

  T1:
    $P99 = new .ResizablePMCArray
    $P99 = 0

    .local pmc iter
               iter = new 'Iter'

    iter.'start'($P99)

    .local int is_exhausted
    .local int index
               index = 0
    .local pmc value

    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T2:
    value = iter.'value'()
    $I0 = isnull value
    'ok'($I0, ".'value'() returns PMCNULL")

  T3:  # index = 0
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T4:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 1, ".'exhausted'() returns true")

  T5:
    value = iter.'value'()
    $I0 = isnull value
    'ok'($I0, ".'value'() returns PMCNULL")

  T6:
    iter.'next'()
    'ok'(1, ".'next'() runs without exception after iter exhaustion")
.end


.sub 'ResizablePMCArray_3elem'
    'diag'('test ResizablePMCArray with three elements')

  T1:
    $P99 = new .ResizablePMCArray
    $P99 = 3
    $P99[0] = 'a'
    $P99[1] = 'b'
    $P99[2] = 'c'

    .local pmc iter
               iter = new 'Iter'

    iter.'start'($P99)

    .local int is_exhausted
    .local int index
               index = 0
    .local pmc value

    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T2:
    value = iter.'value'()
    $I0 = isnull value
    'ok'($I0, ".'value'() returns PMCNULL")

  T3:  # index = 0
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T4:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T5:
    value = iter.'value'()
    $P0 = $P99[index]
    'is'(value, $P0, ".'next'() and .'value'()")

    inc index

  T6:  # index = 1
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T7:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T8:
    value = iter.'value'()
    $P0 = $P99[index]
    'is'(value, $P0, ".'next'() and .'value'()")

    inc index

  T9:  # index = 2
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T10:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 0, ".'exhausted'() returns false")

  T11:
    value = iter.'value'()
    $P0 = $P99[index]
    'is'(value, $P0, ".'next'() and .'value'()")

    inc index

  T12:  # exhausted
    iter.'next'()
    'ok'(1, ".'next'() runs without exception")

  T13:
    is_exhausted = iter.'exhausted'()
    'is'(is_exhausted, 1, ".'exhausted'() returns true")

  T14:
    $P0 = iter.'value'()
    $I0 = isnull $P0
    'is'($I0, 1, ".'value'() returns PMCNULL")

  T15:
    iter.'next'()
    'ok'(1, ".'next'() runs without exception after iter exhaustion")
.end
