#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use Parrot::Test tests => 15;

pir_output_is( <<'CODE', <<'OUT', "if/unless" );
.sub test :main
    $I0 = 0
    if $I0 goto nok1
    print "ok 1\n"
nok1:
    unless $I0 goto ok1
    print "nok 1\n"
ok1:
    null $I0
    if $I0, nok2
    print "ok 2\n"
nok2:
    unless $I0 goto ok2
    print "nok 2\n"
ok2:
    end
.end
CODE
ok 1
ok 2
OUT

pir_output_is( <<'CODE', <<'OUT', "if/unless" );
.sub test :main
    $I0 = 0
    $I1 = 1
    if $I0 == $I1 goto nok1
    print "ok 1\n"
nok1:
    unless $I0 == $I1 goto ok1
    print "nok 1\n"
ok1:
    null $I0
    if $I0, nok2
    print "ok 2\n"
nok2:
    unless $I0 goto ok2
    print "nok 2\n"
ok2:
    unless $I0 > $I1 goto ok3
    print "not "
ok3:    print "ok 3\n"
    end
.end
CODE
ok 1
ok 2
ok 3
OUT

pir_output_is( <<'CODE', <<'OUT', "new" );
.sub test :main
    $P1 = new 'String'
    $P1 = "ok 1\n"
    new $P2, 'String'
    set $P2, "ok 2\n"
    print $P1
    print $P2
    end
.end
CODE
ok 1
ok 2
OUT

pir_output_is( <<'CODE', <<'OUT', "clone" );
.sub test :main
    $P1 = new 'String'
    $P1 = "ok 1\n"
    $P0 = clone $P1
    new $P1, 'String'
    set $P1, "ok 2\n"
    clone $P2, $P1
    print $P0
    print $P2
    end
.end
CODE
ok 1
ok 2
OUT

pir_output_is( <<'CODE', <<'OUT', "defined" );
.sub test :main
    $P1 = new 'Hash'
    $I0 = defined $P1
    new $P1, 'Hash'
    defined $I0, $P1
    print $I0
    print "\n"
    print $I0
    print "\n"
    end
.end
CODE
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', "defined keyed" );
.sub test :main
    $P1 = new 'Hash'
    $P1["a"] = "ok 1\n"
    $I0 = defined $P1["a"]
    new $P1, 'Hash'
    set $P1["a"], "ok 2\n"
    defined $I0, $P1["a"]
    defined $I1, $P1["b"]
    print $I0
    print "\n"
    print $I0
    print "\n"
    print $I1
    print "\n"
    end
.end
CODE
1
1
0
OUT

pir_output_is( <<'CODE', <<'OUT', "parrot op as identifier" );
.sub test :main
    .local int set
    set = 5
    print set
    print "\n"
    inc set
    print set
    print "\n"
    end
.end
CODE
5
6
OUT

pir_output_is( <<'CODE', <<'OUT', "parrot op as label" );
.sub test :main
    null $I0
    goto set
set:
    if $I0, err
    if $I0 goto err
    inc $I0
    unless $I0, err
    unless $I0 goto err
    print "ok\n"
    end
err:
    print "nok\n"
    end
.end

CODE
ok
OUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'new with a native type, no string constant', todo => 'TT #1323 not done yet' );
.sub test :main
        $P1 = new INTVAL
    print "never\n"
    end
.end
CODE
/error:imcc:syntax error, unexpected IDENTIFIER \('INTVAL'\)/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "new with an unknown class" );
.sub test :main
        $P1 = new 'INTVAL'
    print "never\n"
    end
.end
CODE
/Class 'INTVAL' not found/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "setline w comment" );
.sub test :main
    setline 1    # comment
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "setfile w comment" );
.sub test :main
    setfile "foo"    # comment
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_error_output_like( <<'CODE', <<'OUT', "undefined ident" );
.sub test :main
    print no_such
.end
CODE
/error.*undefined.*'no_such'/
OUT

pir_output_is( <<'CODE', <<'OUT', "label ident" );
.sub test :main
    branch no_such
    end
no_such:
    print "ok\n"
.end
CODE
ok
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'lexical redeclared in sub');
.sub 'main' :main
    .lex 'foo', $P0
    $P1 = box 'ok 1'
    store_lex 'foo', $P1

    $P2 = find_lex 'foo'
    say $P2

    .lex 'bar', $P3
    $P4 = box 'ok 2'
    store_lex 'bar', $P4

    $P5 = find_lex 'bar'
    say $P5

    .lex 'foo', $P6
    $P7 = box 'ok 3'
    store_lex 'foo', $P7
.end
CODE
/Multiple declarations of lexical 'foo'/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
