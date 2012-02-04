#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/exception_handler.t - test ExceptionHandler PMC

=head1 SYNOPSIS

    % prove t/pmc/exceptionhandler.t

=head1 DESCRIPTION

Tests the ExceptionHandler PMC.

=cut

.include 'except_severity.pasm'
.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'

    # If test exited with "bad plan" MyHandlerCan.can_handle wasn't invoked.
    plan(25)

    test_bool()
    test_int()

    .local pmc eh, eh2
    eh = new ['ExceptionHandler']
    ok(1, 'Instantiated ExceptionHandler')

    set_label eh, nonfatal_handler_one
    eh.'min_severity'(.EXCEPT_NORMAL)
    eh.'max_severity'(.EXCEPT_WARNING)
    push_eh eh

    eh2 = new ['ExceptionHandler']
    set_label eh2, error_handler_one
    eh2.'min_severity'(.EXCEPT_ERROR)
    eh2.'max_severity'(.EXCEPT_FATAL)
    push_eh eh2

    .local int i
    i = eh.'min_severity'()
    is(i, .EXCEPT_NORMAL, 'get min_severity - 1')
    i = eh.'max_severity'()
    is(i, .EXCEPT_WARNING, 'get max_severity - 1')
    i = eh2.'min_severity'()
    is(i, .EXCEPT_ERROR, 'get min_severity - 2')
    i = eh2.'max_severity'()
    is(i, .EXCEPT_FATAL, 'get max_severity - 2')

    $P0 = new ['Exception']
    $P0['severity'] = .EXCEPT_NORMAL
    throw $P0

    $P0 = new ['Exception']
    $P0['severity'] = .EXCEPT_SEVERE
    throw $P0

    pop_eh
    pop_eh

    goto more_tests

  nonfatal_handler_one:
    .local pmc e, c
    .get_results (e)
    ok(1, 'Min and Max severity for exception handlers')
    c = e['resume']
    eh = 0
    c()
  error_handler_one:
    .get_results (e)
    ok(1, 'Min and Max severity for exception handlers')
    c = e['resume']
    eh = 0
    c()

  more_tests:

    eh = new ['ExceptionHandler']
    set_label eh, typed_handler_one
    eh.'handle_types'(.CONTROL_OK, .CONTROL_BREAK)
    push_eh eh

    eh = new ['ExceptionHandler']
    set_label eh, typed_handler_two
    eh.'handle_types'(.EXCEPTION_SYNTAX_ERROR, .EXCEPTION_UNEXPECTED_NULL)
    push_eh eh

    $P0 = new ['Exception']
    $P0['type'] = .CONTROL_OK
    throw $P0

    $P0 = new ['Exception']
    $P0['type'] = .CONTROL_BREAK
    throw $P0

    pop_eh
    pop_eh

    test_handle_types_except()
    test_init_pmc_with_key()
    test_all_types()

    goto init_int

  typed_handler_one:
    .get_results (e)
    ok(1, 'Exception Handler type checks work')
    c = e['resume']
    eh = 0
    c()
  typed_handler_two:
    .get_results (e)
    ok(0, 'Exception Handler type checks work')
    c = e['resume']
    eh = 0
    c()

  init_int:
    eh = new ['ExceptionHandler'], .CONTROL_BREAK
    set_label eh, init_int_eh
    push_eh eh
    $P0 = new ['Exception']
    $P0['type'] = .CONTROL_BREAK
    throw $P0
    $I0 = 0
    goto init_int_done
  init_int_eh:
    pop_eh
    $I0 = 1
  init_int_done:
    ok($I0, "init_int handler correctly caught exception")

  subclass_handler:
    .local pmc myhandler, myhandlercan
    myhandler = subclass_exception_handler()
    myhandlercan = subclass_exception_handler_can()
    $I0 = subclass_handler_pop(myhandler)
    ok($I0, 'Exception Handler subclass popped')
    $I0 = subclass_handler_catches_can(myhandlercan)
    ok($I0, 'Exception Handler subclass with can_handle method catch exception')

    # This test is not expected to die now.
    # Please report to TT #154 if it must be skipped again.
    #skip(1,'Exception Handler subclass causes segfault: TT #154')
    $I0 = 0
    push_eh outcatch
    $I0 = subclass_handler_catches(myhandler)
  outcatch:
    ok($I0, 'Exception Handler subclass catch exception')
.end

.sub test_bool
    $P0 = new 'ExceptionHandler'
    nok($P0,'ExceptionHandler without address is false')
    set_label $P0, _handler
    ok($P0,'ExceptionHandler with address is true')
  _handler:
.end

.sub test_int
    $P0 = new 'ExceptionHandler'
    set_label $P0, _handler
    push_eh $P0
    $I0 = $P0
    ok(1,'get_integer on ExceptionHandler ')
    .return()
  _handler:
    say "howdy int!"
.end


.sub subclass_exception_handler
    .local pmc myhandler
    myhandler = subclass 'ExceptionHandler', [ 'MyHandler' ]
    .return(myhandler)
.end

.sub subclass_exception_handler_can
    .local pmc myhandler
    myhandler = subclass 'ExceptionHandler', [ 'MyHandlerCan' ]
    .return(myhandler)
.end

.sub subclass_handler_pop
    .param pmc myhandler
    .local pmc eh
    eh = new ['ExceptionHandler']
    set_label eh, subclassed_popped
    push_eh eh

    .local pmc myeh
    new myeh, myhandler
    set_label myeh, subclassed_handler
    push_eh myeh

    pop_eh

    $P0 = new ['Exception']
    throw $P0

  subclassed_popped:
    .return(1)

  subclassed_handler:
    .return(0)
.end

.sub subclass_handler_catches_can
    .param pmc myhandler
    .local pmc eh
    eh = new ['ExceptionHandler']
    set_label eh, subclassed_failed
    push_eh eh

    .local pmc myeh
    new myeh, myhandler
    set_label myeh, subclassed_handler
    push_eh myeh

    $P0 = new ['Exception']
    throw $P0

  subclassed_failed:
    .get_results($P0)
    .return(0)

  subclassed_handler:
    .get_results($P0)
    .return(1)
.end

.sub subclass_handler_catches
    .param pmc myhandler
    .local pmc eh
    eh = new ['ExceptionHandler']
    set_label eh, subclassed_failed
    push_eh eh

    .local pmc myeh
    new myeh, myhandler
    set_label myeh, subclassed_handler
    push_eh myeh

    $P0 = new ['Exception']
    throw $P0

  subclassed_failed:
    .get_results($P0)
    .return(0)

  subclassed_handler:
    .get_results($P0)
    .return(1)
.end

.namespace [ 'MyHandler' ]

.namespace [ 'MyHandlerCan' ]

.sub can_handle :method
    .param pmc ex
    ok(1, 'MyHandlerCan.can_handle invoked')
    .return(1)
.end

.namespace [ ]

.sub 'test_handle_types_except'
    .local pmc badeh, eh, ex
    .local int i
    .const int TYPEUSED = .EXCEPTION_UNEXPECTED_NULL
    .const int TYPEOTHER = .EXCEPTION_SYNTAX_ERROR

    i = 0
    eh = new ['ExceptionHandler']
    badeh = new ['ExceptionHandler']
    eh.'handle_types_except'(TYPEUSED)
    set_label eh, catch
    set_label badeh, badcatch
    push_eh badeh
    push_eh eh
    ex = new ['Exception']
    ex['type'] = TYPEOTHER
    throw ex
    goto report1
  badcatch:
    finalize eh
    goto report1
  catch:
    finalize eh
    i = 1
  report1:
    ok(i, 'type not in except is list is caught')

    i = 0
    set_label badeh, catchall
    set_label eh, dontcatch
    ex = new ['Exception']
    ex['type'] = TYPEUSED
    throw ex
    goto report2
  catchall:
    finalize eh
    i = 1
    goto report2
  dontcatch:
    finalize eh
  report2:
    pop_eh
    pop_eh
    ok(i, 'type in except is list is not caught')
.end

.sub 'test_init_pmc_with_key'
    .const int TYPEUSED = .EXCEPTION_UNEXPECTED_NULL
    .const int TYPEOTHER = .EXCEPTION_SYNTAX_ERROR
    .local int i
    .local pmc eh, ex
    i = 0
    eh = new [ 'ExceptionHandler' ], [ TYPEUSED ]
    set_label eh, catch1
    push_eh eh
    ex = new ['Exception']
    ex['type'] = TYPEUSED
    throw ex
    goto report1
  catch1:
    finalize eh
    i = 1
  report1:
    ok(i, 'exception handler created with one key caught exception')
    pop_eh
    push_eh report2
    push_eh eh
    i = 1
    set_label eh, catch2
    ex = new ['Exception']
    ex['type'] = TYPEOTHER
    throw ex
    goto report2
  catch2:
    i = 0
  report2:
    ok(i, 'exception handler created with one key die not catch wrong exception')
    pop_eh
    pop_eh
    i = 0
    eh = new ['ExceptionHandler'], [ TYPEUSED ; TYPEOTHER ]
    set_label eh, catch3
    push_eh eh
    ex = new ['Exception']
    ex['type'] = TYPEUSED
    throw ex
    goto report3
  catch3:
    finalize eh
    i = 1
  report3:
    ok(i, 'exception handler created with two keys caught first exception')
    i = 0
    set_label eh, catch4
    ex = new ['Exception']
    ex['type'] = TYPEOTHER
    throw ex
    goto report4
  catch4:
    finalize eh
    i = 1
  report4:
    ok(i, 'exception handler created with two keys caught second exception')
    pop_eh
.end

.sub 'test_all_types'
    .const int TYPEUSED = .EXCEPTION_UNEXPECTED_NULL
    .const int CTRLTYPEUSED = .CONTROL_RETURN
    .local int i
    .local pmc eh, ex
    i = 0
    eh = new [ 'ExceptionHandler' ], [ .EXCEPTION_ALL]
    set_label eh, catch1
    push_eh eh
    ex = new ['Exception']
    ex['type'] = TYPEUSED
    throw ex
    goto report1
  catch1:
    finalize eh
    i = 1
  report1:
    ok(i, 'exception handler for EXCEPTION_ALL caught')
    pop_eh
    push_eh report2
    push_eh eh
    i = 1
    set_label eh, catch2
    ex = new ['Exception']
    ex['type'] = CTRLTYPEUSED
    throw ex
    goto report2
  catch2:
    i = 0
  report2:
    ok(i, 'exception handler for EXCEPTION_ALL did not catch control exception')
    pop_eh
    pop_eh
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
