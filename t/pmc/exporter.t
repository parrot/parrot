#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 10;

=head1 NAME

t/pmc/exporter.t - test the Exporter PMC

=head1 SYNOPSIS

    % prove t/pmc/exporter.t

=head1 DESCRIPTION

Tests the Exporter PMC.

=cut

# L<PDD17/Exporter PMC>
# TODO fix smartlinks once this is specced
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    $P0 = new .Exporter
    say 'ok 1 - $P0 = new .Exporter'

    $I0 = isa $P0, 'Exporter'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'Exporter'"
.end
CODE
ok 1 - $P0 = new .Exporter
ok 2 - isa $P0, 'Exporter'
OUT


pir_output_is( <<'CODE', <<'OUT', 'source' );
.sub 'test' :main
    new $P0, .Exporter
    $P1 = $P0.'source'()
    if null $P1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - source() returns PMCNULL upon Exporter init'

    # get a NameSpace PMC for testing
    # TODO replace with make_namespace, when implemented
    .local pmc ns
    ns = get_namespace ['Eponymous']

    $P0.'source'(ns)
    $P1 = $P0.'source'()
    if $P1 == 'Eponymous' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - source() with args sets source namespace'

    $P1 = clone ns

    push_eh ok_3
    $P0.'source'(ns, $P1)
    clear_eh

    print 'not '
  ok_3:
    say 'ok 3 - source() with too many args fails'

    push_eh ok_4
    $P0.'source'('foo')
    clear_eh
    print 'not '

  ok_4:
    say 'ok 4 - source() with non-namespace arg throws exception'
.end


# TODO replace with make_namespace, when implemented
.namespace ['Eponymous']
.sub 'Eponymous' :anon
.end
CODE
ok 1 - source() returns PMCNULL upon Exporter init
ok 2 - source() with args sets source namespace
ok 3 - source() with too many args fails
ok 4 - source() with non-namespace arg throws exception
OUT


pir_output_is( <<'CODE', <<'OUT', 'destination' );
.sub 'test' :main
    new $P0, .Exporter
    $P1 = $P0.'destination'()
    unless null $P1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - destination() with no args returns destination namespace'

    $P99 = get_namespace
    if $P1 == $P99 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - ...which is current namespace at first'

    # get a NameSpace PMC for testing
    # TODO replace with make_namespace, when implemented
    .local pmc ns
    ns = get_namespace ['Eponymous']

    $P0.'destination'(ns)
    $P1 = $P0.'destination'()
    if $P1 == 'Eponymous' goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - destination() with args sets destination namespace'

    $P1 = clone ns

    push_eh ok_4
    $P0.'destination'(ns, $P1)
    clear_eh

    print 'not '
  ok_4:
    say 'ok 4 - destination() with too many args fails'

    push_eh ok_5
    $P0.'destination'('foo')
    clear_eh
    print 'not '

  ok_5:
    say 'ok 5 - destination() with non-namespace arg throws exception'
.end


# TODO replace with make_namespace, when implemented
.namespace ['Eponymous']
.sub 'Eponymous' :anon
.end
CODE
ok 1 - destination() with no args returns destination namespace
ok 2 - ...which is current namespace at first
ok 3 - destination() with args sets destination namespace
ok 4 - destination() with too many args fails
ok 5 - destination() with non-namespace arg throws exception
OUT


pir_output_is( <<'CODE', <<'OUT', 'globals' );
.sub 'test' :main
    $P0 = new .Exporter

    $P1 = $P0.'globals'()
    $I0 = isnull $P1
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - globals() returns PMCNULL upon Exporter init'

    # create an array to store globals in
    $P99 = new .ResizableStringArray

    $P0.'globals'($P99)
    $P1 = $P0.'globals'()
    $I0 = does $P1, 'array'
    $I99 = $P99
    $I1 = $P1
    unless $I0 == 1 goto nok_2
    unless $I1 == $I99 goto nok_2
    unless $I1 == 0 goto ok_2
    goto ok_2
  nok_2:
    print 'not '
  ok_2:
    say 'ok 2 - globals() with args sets globals array (empty array)'

    $P99 = push 'Alex'
    $P99 = push 'Prince'

    $P0.'globals'($P99)
    $P1 = $P0.'globals'()
    $I99 = $P99
    $I1 = $P1
    unless $I1 == $I99 goto nok_3
    unless $I1 == 2 goto nok_3
    $S0 = pop $P1
    unless $S0 == 'Prince' goto nok_3
    $S0 = pop $P1
    unless $S0 == 'Alex' goto nok_3
    goto ok_3
  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - globals() with args sets globals array (array with two values)'


    $P98 = clone $P99

    push_eh ok_4
    $P0.'globals'($P99, $P98)
    clear_eh

    print 'not '
  ok_4:
    say 'ok 4 - globals() with too many args fails'

.end
CODE
ok 1 - globals() returns PMCNULL upon Exporter init
ok 2 - globals() with args sets globals array (empty array)
ok 3 - globals() with args sets globals array (array with two values)
ok 4 - globals() with too many args fails
OUT


pir_output_is( <<'CODE', <<'OUT', 'add_global' );
.sub 'test' :main
    $P0 = new .Exporter

    $P0.'add_global'()
    $P1 = $P0.'globals'()
    if null $P1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - add_global() with no args does nothing'

    $P0.'add_global'('foo')
    $P1 = $P0.'globals'()
    $I0 = $P1
    unless $I0 == 1 goto nok_2
    $S0 = $P1[0]
    unless $S0 == 'foo' goto nok_2
    goto ok_2
  nok_2:
    print 'not '
  ok_2:
    say 'ok 2 - add_global() with args adds string to globals array'

    $P0.'add_global'('bar')
    $P1 = $P0.'globals'()
    $I0 = $P1
    unless $I0 == 2 goto nok_3
    $S0 = $P1[0]
    unless $S0 == 'foo' goto nok_3
    $S0 = $P1[1]
    unless $S0 == 'bar' goto nok_3
    goto ok_3
  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - add_global() with args adds string to globals array (again)'

    push_eh ok_4
    $P0.'globals'($P99, $P98)
    clear_eh

    print 'not '
  ok_4:
    say 'ok 4 - add_global() with too many args fails'

.end
CODE
ok 1 - add_global() with no args does nothing
ok 2 - add_global() with args adds string to globals array
ok 3 - add_global() with args adds string to globals array (again)
ok 4 - add_global() with too many args fails
OUT


## TODO import
pir_output_like( <<'CODE', <<'OUT', 'import - no args' );
.sub 'test' :main
    $P0 = new .Exporter

    $P0.'import'()
    say 'ok 1 - import() with no args throws an exception'

.end
CODE
/^source namespace not set\n/
OUT


pir_output_is( <<'CODE', <<'OUT', 'import - same source and destination namespaces' );
.sub 'test' :main
    .local pmc exporter, src

    src     = get_namespace

    exporter = new .Exporter
    exporter.'import'( src :named('source'), src :named('destination'), 'plan ok' :named('globals') )
    plan(1)
    ok(1)
.end

.sub 'plan'
    .param int one
    say '1..1'
.end

.sub 'ok'
    .param int one
    say 'ok 1'
.end
CODE
1..1
ok 1
OUT


pir_output_is( <<'CODE', <<'OUT', 'import - globals as string' );
.sub 'test' :main
    load_bytecode 'Test/More.pir'
    .local pmc exporter, src

    src     = get_namespace ['Test::More']

    exporter = new .Exporter
    exporter.'import'( src :named('source'), 'plan ok' :named('globals') )
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT


pir_output_is( <<'CODE', <<'OUT', 'import - globals as array' );
.sub 'test' :main
    load_bytecode 'Test/More.pir'
    .local pmc exporter, src, globals

    src     = get_namespace ['Test::More']
    globals = new .ResizableStringArray
    globals = push 'ok'
    globals = push 'plan'

    exporter = new .Exporter
    exporter.'import'( src :named('source'), globals :named('globals') )
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT


pir_output_is( <<'CODE', <<'OUT', 'import - globals with destination' );
.sub 'test' :main
    load_bytecode 'Test/More.pir'
    .local pmc exporter, src, dest, globals

    src     = get_namespace ['Test::More']
    dest    = get_namespace ['foo']
    globals = new .ResizableStringArray
    globals = push 'ok'
    globals = push 'plan'

    exporter = new .Exporter
    exporter.'import'( src :named('source'), dest :named('destination'), globals :named('globals') )

    $P0 = find_global ['foo'], 'bar'
    $P0()
.end

.namespace ['foo']
.sub 'bar'
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
