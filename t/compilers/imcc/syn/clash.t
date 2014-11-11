#!perl
# Copyright (C) 2001-2009,2014, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use Parrot::Test tests => 17;

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

# [GH #335]
pir_error_output_like( <<'CODE', <<'OUTPUT', 'new with unknown sub_label_op, no string constant');
.sub test :main
    $P1 = new INTVAL
    print "never\n"
    end
.end
CODE
/error:imcc:The opcode 'new_p_ic' \(new<2>\) was not found/
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

# GH #1095
pir_output_is( <<'CODE', <<'OUT', 'legal quoted .lex names');
.sub 'main' :main
    .lex 'bar\o', $P0        # ok, parsed as "bar\\o"
    $P1 = box 'ok 1'
    store_lex 'bar\o', $P1   # ok, parsed as "bar\\o"
    $P2 = find_lex 'bar\o'
    say $P2

    .lex "foo\\o", $P3       # did parse as 'foo\\o'
    $P1 = box 'ok 2'
    store_lex "foo\\o", $P1  # was Error: Lexical 'foo\o' not found
    $P2 = find_lex "foo\\o"
    say $P2
.end
CODE
ok 1
ok 2
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'illegal quoted .lex names');
.sub 'main' :main
    .lex "foo\o", $P4        # ok, parsed as "foo\o" (set_lexical)
    $P1 = box 'ok 3'
    store_lex "foo\o", $P1   # old imcc compressed that to "fooo", now error
    $P2 = find_lex "foo\o"   # ditto
    say $P2
.end
CODE
/Illegal escape sequence \\o in 'foo\\o'/
OUT

pir_output_is( <<'CODE', <<'OUT', 'legal quote with global names');
.sub 'main' :main
    $S0 = 'bar\o'
    $P1 = box 'ok 1'
    set_global $S0, $P1
    $P2 = get_global 'bar\o'
    say $P2

    $S1 = "foo\\o"
    $P1 = box 'ok 2'
    set_global "foo\\o", $P1   # ok, parsed as 'foo\o'
    $P2 = get_global "foo\\o"
    say $P2
.end
CODE
ok 1
ok 2
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'illegal quoted global names');
.sub 'main' :main
    $S0 = 'bar\o'
    $P1 = box 'ok 1'
    set_global $S0, $P1
    $P2 = get_global 'bar\o'
    say $P2

    $S1 = "foo\\o"
    $P1 = box 'ok 2'
    set_global "foo\\o", $P1   # ok, parsed as "foo\\o"
    $P2 = get_global "foo\\o"
    say $P2

    $S2 = "foo\o"
    $P1 = box 'ok 3'
    $S3 = "fooo"
    $P2 = box 'ok 4'
    set_global "foo\o", $P1    # now illegal, before "fooo"
    set_global "fooo",  $P2
    $P3 = get_global "foo\o"
    say $P3

    $P3 = get_global "fooo"
    say $P3
.end
CODE
/Illegal escape sequence \\o in 'foo\\o'/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
