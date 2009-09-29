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
    plan( 7 )
    test_bool()
    test_int()
    test_attrs()
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
    ok($I0, "Can't fetch non-existing aattribute")
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
