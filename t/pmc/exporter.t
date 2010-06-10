#!perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 12;

=head1 NAME

t/pmc/exporter.t - test the Exporter PMC

=head1 SYNOPSIS

    % prove t/pmc/exporter.t

=head1 DESCRIPTION

Tests the Exporter PMC.

=cut

# L<PDD17/Exporter PMC>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    $P0 = new ['Exporter']
    say "ok 1 - $P0 = new ['Exporter']"

    $I0 = isa $P0, 'Exporter'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'Exporter'"
.end
CODE
ok 1 - $P0 = new ['Exporter']
ok 2 - isa $P0, 'Exporter'
OUT

pir_output_is( <<'CODE', <<'OUT', 'source' );
.sub 'test' :main
    $P0 = new ['Exporter']
    $P1 = $P0.'source'()
    if null $P1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - source() returns PMCNULL upon Exporter init'

    # get a NameSpace PMC for testing
    # TT #1233 replace with make_namespace, when implemented
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
    pop_eh

    print 'not '
  ok_3:
    say 'ok 3 - source() with too many args fails'

    push_eh ok_4
    $P0.'source'('foo')
    pop_eh
    print 'not '

  ok_4:
    say 'ok 4 - source() with non-namespace arg throws exception'
.end


# TT #1233 replace with make_namespace, when implemented
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
    $P0 = new ['Exporter']
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
    # TT #1233 replace with make_namespace, when implemented
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
    pop_eh

    print 'not '
  ok_4:
    say 'ok 4 - destination() with too many args fails'

    push_eh ok_5
    $P0.'destination'('foo')
    pop_eh
    print 'not '

  ok_5:
    say 'ok 5 - destination() with non-namespace arg throws exception'
.end


# TT #1233 replace with make_namespace, when implemented
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
    $P0 = new ['Exporter']

    $P1 = $P0.'globals'()
    $I0 = isnull $P1
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - globals() returns PMCNULL upon Exporter init'

    # create an array to store globals in
    $P99 = new ['ResizableStringArray']

    $P0.'globals'($P99)
    $P1 = $P0.'globals'()
    $I0 = isnull $P1
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - globals() with empty array arg sets PMCNULL'

    push $P99, 'Alex'
    push $P99, 'Prince'

    $P0.'globals'($P99)
    $P1 = $P0.'globals'()
    $I0 = does $P1, 'hash'
    $I99 = $P99
    $I1 = $P1
    unless $I0 == 1 goto nok_3
    unless $I1 == $I99 goto nok_3
    unless $I1 == 2 goto ok_3
    $I0 = exists $P1['Prince']
    unless $I0 goto nok_3
    $I0 = exists $P1['Alex']
    goto ok_3
  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - globals() with array arg sets globals hash (hash with two keys)'

    # create a hash to store globals in
    $P99 = new ['Hash']

    $P0.'globals'($P99)
    $P1 = $P0.'globals'()
    $I0 = isnull $P1
    if $I0 goto ok_4
    print 'not '
  ok_4:
    say 'ok 4 - globals() with empty hash arg sets PMCNULL'

    $P99['Prince'] = ''
    $P99['Alex'] = ''

    $P0.'globals'($P99)
    $P1 = $P0.'globals'()
    $I99 = $P99
    $I1 = $P1
    unless $I1 == $I99 goto nok_5
    unless $I1 == 2 goto nok_5
    $I0 = exists $P1['Prince']
    unless $I0 goto nok_5
    $I0 = exists $P1['Alex']
    unless $I0 goto nok_5
    goto ok_5
  nok_5:
    print 'not '
  ok_5:
    say 'ok 5 - globals() with hash arg sets globals hash (hash with two keys)'


    $P98 = clone $P99

    push_eh ok_6
    $P0.'globals'($P99, $P98)
    pop_eh

    print 'not '
  ok_6:
    say 'ok 6 - globals() with too many args fails'

.end
CODE
ok 1 - globals() returns PMCNULL upon Exporter init
ok 2 - globals() with empty array arg sets PMCNULL
ok 3 - globals() with array arg sets globals hash (hash with two keys)
ok 4 - globals() with empty hash arg sets PMCNULL
ok 5 - globals() with hash arg sets globals hash (hash with two keys)
ok 6 - globals() with too many args fails
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'import - no args' );
.sub 'test' :main
    $P0 = new ['Exporter']

    $P0.'import'()
    say 'ok 1 - import() with no args throws an exception'

.end
CODE
/^source namespace not set\n/
OUT

pir_output_is( <<'CODE', <<'OUT', 'import - same source and destination namespaces' );
.sub 'test' :main
    .local pmc exporter, src

    src      = get_namespace

    exporter = new ['Exporter']
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
    load_bytecode 'Test/More.pbc'
    .local pmc exporter, src

    src      = get_namespace [ 'Test'; 'More' ]

    exporter = new ['Exporter']
    exporter.'import'( src :named('source'), 'plan ok' :named('globals') )
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'import - globals with source passed separately' );
.sub 'test' :main
    load_bytecode 'Test/More.pbc'
    .local pmc exporter, src

    src      = get_namespace [ 'Test'; 'More' ]

    exporter = new ['Exporter']
    exporter.'source'( src )
    exporter.'import'( 'plan ok' :named('globals') )
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'import - globals as array' );
.sub 'test' :main
    load_bytecode 'Test/More.pbc'
    .local pmc exporter, src, globals

    src     = get_namespace [ 'Test'; 'More' ]
    globals = new ['ResizableStringArray']
    push globals, 'ok'
    push globals, 'plan'

    exporter = new ['Exporter']
    exporter.'import'( src :named('source'), globals :named('globals') )
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'import - globals as hash - null + empty string' );
.sub 'test' :main
    load_bytecode 'Test/More.pbc'
    .local pmc exporter, src, globals, nul

    nul     = new ['Null']
    src     = get_namespace [ 'Test'; 'More' ]
    globals = new ['Hash']
    globals['ok'] = nul
    globals['plan'] = ''

    exporter = new ['Exporter']
    exporter.'import'( src :named('source'), globals :named('globals') )
    plan(1)
    ok(1)
.end
CODE
1..1
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'import - globals as hash - with dest names (latin)' );
.sub 'test' :main
    load_bytecode 'Test/More.pbc'
    .local pmc exporter, src, globals

    src     = get_namespace [ 'Test'; 'More' ]
    globals = new ['Hash']
    globals['plan'] = 'consilium'
    globals['ok'] = 'rectus'

    exporter = new ['Exporter']
    exporter.'import'( src :named('source'), globals :named('globals') )
    consilium(1)
    rectus(1)
.end
CODE
1..1
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'import - globals with destination' );
.sub 'test' :main
    load_bytecode 'Test/More.pbc'
    .local pmc exporter, src, dest, globals

    src     = get_namespace [ 'Test'; 'More' ]
    dest    = get_namespace ['foo']
    globals = new ['ResizableStringArray']
    push globals, 'ok'
    push globals, 'plan'

    exporter = new ['Exporter']
    exporter.'import'( src :named('source'), dest :named('destination'), globals :named('globals') )

    $P0 = get_global ['foo'], 'bar'
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

# Test exporting mmd subs: TT #1205
# https://trac.parrot.org/parrot/ticket/1205

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
