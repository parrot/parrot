#! parrot
# Copyright (C) 2009,-2010 Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/exception.t - Exception Handling

=head1 SYNOPSIS

    % prove t/pmc/exception.t

=head1 DESCRIPTION

Tests C<Exception> and C<ExceptionHandler> PMCs.

=cut

.sub main :main
    .include 'test_more.pir'
    plan( 19 )
    test_bool()
    test_int()
    test_attrs()
    test_attributes()
    test_push_pop_eh()
    test_push_pop_eh_long()
    test_push_eh_throw()
    test_die()
    test_throw_obj()
.end

.sub test_throw_obj
    new $P20, ['ExceptionHandler']
    set_addr $P20, _handler
    push_eh $P20
    new $P30, ['Exception']
    throw $P30
    say "not reached"
_handler:
    ok(1,'caught exception object thrown')
.end

.sub test_die
    push_eh handler
    die 3, 100
    say "not reached"
    .return()
  handler:
    ok(1,'die works')
.end

.sub test_push_pop_eh
    push_eh handler
    ok(1,'push_eh works')

    pop_eh
    ok(1,'pop_eh works')
    .return()

  handler:
    say "i am the decider"
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
    set_addr $P0, handler
    push_eh $P0
    ok(1,'push_eh works (long)')

    pop_eh
    ok(1,'pop_eh works (long)')
    .return()

  handler:
    say "i am the decider"
.end

.sub test_bool
    $P0 = new 'ExceptionHandler'
    set_addr $P0, _handler
    ok($P0,'ExceptionHandler objects return true')
    .return()
  _handler:
    say "howdy bool!"
.end

.sub test_int
    $P0 = new 'ExceptionHandler'
    set_addr $P0, _handler
    push_eh $P0
    $I0 = $P0
    ok(1,'get_integer on ExceptionHandler ')
    .return()
  _handler:
    say "howdy int!"
.end

.sub test_attrs
    $P0 = new 'ExceptionHandler'
    set_addr $P0, _handler
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

    push_eh done
    $I0 = 1
    getattribute $P5, $P0, 'foo'
    $I0 = 0
  done:
    ok($I0, "Can't fetch non-existent attribute")
.end

.sub test_attributes
    push_eh handler
    $P1 = new ['Exception']
    $P2 = new ['String']
    $P2 = "just pining"
    setattribute $P1, 'message', $P2
    $P3 = new ['Integer']
    $P3 = 5
    setattribute $P1, 'severity', $P3
    $P4 = new ['String']
    $P4 = "additional payload"
    setattribute $P1, 'payload', $P4
    $P5 = new ['ResizablePMCArray']
    $P5 = 2
    $P5[0] = 'backtrace line 1'
    $P5[1] = 'backtrace line 2'
    setattribute $P1, 'backtrace', $P5

    throw $P1
    is(0, "throwing exception failed")
    .return()
  handler:
    .get_results($P0)

    $P16 = getattribute $P0, 'message'
    is($P16, "just pining")

    $P17 = getattribute $P0, 'severity'
    is($P17, 5)

    $P18 = getattribute $P0, 'payload'
    is($P18, "additional payload")

    $P19 = getattribute $P0, 'backtrace'
    $P20 = $P19[0]
    is($P20, "backtrace line 1")

    $P20 = $P19[1]
    is($P20, "backtrace line 2")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
