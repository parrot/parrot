#! parrot
# Copyright (C) 2009, Parrot Foundation.
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
    plan( 14 )
    test_bool()
    test_int()
    test_attrs()
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
