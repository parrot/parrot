#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/exception_handler.t - test ExceptionHandler PMC

=head1 SYNOPSIS

    % prove t/pmc/exception_handler.t

=head1 DESCRIPTION

Tests the ExceptionHandler PMC.

=cut

.include 'include/except_severity.pasm'
.include 'include/except_types.pasm'

.sub main :main
    .include 'include/test_more.pir'

    plan(5)

    .local pmc eh
    new eh, 'ExceptionHandler'
    ok(1, 'Instantiated ExceptionHandler')

    set_addr eh, nonfatal_handler_one
    eh.min_severity(.EXCEPT_NORMAL)
    eh.max_severity(.EXCEPT_WARNING)
    push_eh eh

    new eh, 'ExceptionHandler'
    set_addr eh, error_handler_one
    eh.min_severity(.EXCEPT_ERROR)
    eh.max_severity(.EXCEPT_FATAL)
    push_eh eh

    $P0 = new 'Exception'
    $P0['severity'] = .EXCEPT_NORMAL
    throw $P0

    $P0 = new 'Exception'
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
    .local pmc e, c
    .get_results (e)
    ok(1, 'Min and Max severity for exception handlers')
    c = e['resume']
    eh = 0
    c()

  more_tests:

    new eh, 'ExceptionHandler'
    set_addr eh, typed_handler_one
    eh.handle_types(.CONTROL_OK, .CONTROL_BREAK)
    push_eh eh

    new eh, 'ExceptionHandler'
    set_addr eh, typed_handler_two
    eh.handle_types(.EXCEPTION_SYNTAX_ERROR, .EXCEPTION_UNEXPECTED_NULL)
    push_eh eh

    $P0 = new 'Exception'
    $P0['type'] = .CONTROL_OK
    throw $P0

    $P0 = new 'Exception'
    $P0['type'] = .CONTROL_BREAK
    throw $P0

    pop_eh
    pop_eh

    exit 0

  typed_handler_one:
    .local pmc e, c
    .get_results (e)
    ok(1, 'Exception Handler type checks work')
    c = e['resume']
    eh = 0
    c()
  typed_handler_two:
    .local pmc e, c
    .get_results (e)
    ok(0, 'Exception Handler type checks work')
    c = e['resume']
    eh = 0
    c()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
