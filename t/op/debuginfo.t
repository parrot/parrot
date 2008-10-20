#!perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/op/debuginfo.t - Debugging Info

=head1 SYNOPSIS

        % prove t/op/debuginfo.t

=head1 DESCRIPTION

Tests the various set and get operations for line, package and file info,
as well as backtrace tests.

=cut

pasm_output_like( <<'CODE', <<'OUTPUT', "getline, getfile" );
.pcc_sub main:
    getfile S0
    getline I0
    print S0
    print "\n"
    print I0
    print "\n"
    end
CODE
/debuginfo_\d+\.pasm
\d/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - Null PMC access" );
.sub main
    print "ok 1\n"
    a()
    print "not ok 10\n"
.end
.sub a
    print "ok 2\n"
    b()
    print "not ok 9\n"
.end
.sub b
    print "ok 3\n"
    c()
    print "not ok 8\n"
.end
.sub c
    print "ok 4\n"
    d()
    print "not ok 7\n"
.end
.sub d
    print "ok 5\n"
    $P0 = null
    $P0()
    print "not ok 6\n"
.end
CODE
/^ok 1
ok 2
ok 3
ok 4
ok 5
Null PMC access in invoke\(\)
current instr\.: 'd' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'c' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'b' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'a' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'main' pc (\d+|-1) \(.*?:(\d+|-1)\)$/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - method not found" );
.namespace ["Test1"]
.sub main
    print "ok 1\n"
    foo()
    print "not ok 5\n"
.end
.sub foo
    print "ok 2\n"
    $P0 = new 'Integer'
    print "ok 3\n"
    $P0."nosuchmethod"()
    print "not ok 4\n"
.end
CODE
/^ok 1
ok 2
ok 3
Method 'nosuchmethod' not found for invocant of class 'Integer'
current instr.: 'parrot;Test1;foo' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'parrot;Test1;main' pc (\d+|-1) \(.*?:(\d+|-1)\)$/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - fetch of unknown lexical" );
.namespace ["Test2"]
.sub main
    print "ok 1\n"
    foo()
    print "not ok 3\n"
.end
.sub foo :lex
    print "ok 2\n"
    find_lex $P0, "nosuchlex"
    print "not ok 3\n"
.end
CODE
/^ok 1
ok 2
Lexical 'nosuchlex' not found
current instr.: 'parrot;Test2;foo' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'parrot;Test2;main' pc (\d+|-1) \(.*?:(\d+|-1)\)$/
OUTPUT

# RT #46895
# in plain functional run-loop result is 999
# other run-loops report 998
# investigate this after interpreter strtup is done
# see also todo item in src/embed.c
pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - recursion 1" );
.sub main
    main()
.end
CODE
/^maximum recursion depth exceeded
current instr\.: 'main' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'main' pc (\d+|-1) \(.*?:(\d+|-1)\)
\.\.\. call repeated \d+ times/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - recursion 2" );
.sub main
    rec(91)
.end
.sub rec
    .param int i
    if i == 0 goto END
    dec i
    rec(i)
    .return()
END:
    $P0 = null
    $P0()
.end
CODE
/^Null PMC access in invoke\(\)
current instr\.: 'rec' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'rec' pc (\d+|-1) \(.*?:(\d+|-1)\)
\.\.\. call repeated 90 times
called from Sub 'main' pc (\d+|-1) \(.*?:(\d+|-1)\)$/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "setfile and setline", todo => "#RT43269" );
.sub main :main
    setfile "xyz.pir"
    setline 123
    $S0 = 'hello'
    $I0 = 456
    'no_such_function'($S0, $I0)
.end
CODE
/\(xyz.foo:123\)/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "setfile and setline", todo => "#RT43269" );
.sub main :main
    setfile "foo.p6"
    setline 123
    $P0 = new 'Integer'
    assign $P0, 9876
    set_global '$a', $P0

    setline 124
    $P0 = get_global '$a'
    $P1 = clone $P0
    add $P1, 1
    'nsf'($P1)
.end
CODE
/\(foo.p6:124\)/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
