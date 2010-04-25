#!./parrot
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

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
    plan(9)

    .local pmc eh
    eh = new ['ExceptionHandler']
    ok(1, 'Instantiated ExceptionHandler')

    set_addr eh, nonfatal_handler_one
    eh.'min_severity'(.EXCEPT_NORMAL)
    eh.'max_severity'(.EXCEPT_WARNING)
    push_eh eh

    eh = new ['ExceptionHandler']
    set_addr eh, error_handler_one
    eh.'min_severity'(.EXCEPT_ERROR)
    eh.'max_severity'(.EXCEPT_FATAL)
    push_eh eh

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
    set_addr eh, typed_handler_one
    eh.'handle_types'(.CONTROL_OK, .CONTROL_BREAK)
    push_eh eh

    eh = new ['ExceptionHandler']
    set_addr eh, typed_handler_two
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

    goto subclass_handler

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
    set_addr eh, subclassed_popped
    push_eh eh

    .local pmc myeh
    new myeh, myhandler
    set_addr myeh, subclassed_handler
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
    set_addr eh, subclassed_failed
    push_eh eh

    .local pmc myeh
    new myeh, myhandler
    set_addr myeh, subclassed_handler
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
    set_addr eh, subclassed_failed
    push_eh eh

    .local pmc myeh
    new myeh, myhandler
    set_addr myeh, subclassed_handler
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
