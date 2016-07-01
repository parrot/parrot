#!perl
# Copyright (C) 2001-2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 12;
use Parrot::Config;

use Parrot::Test::Util 'create_tempfile';

=head1 NAME

t/op/debuginfo.t - Debugging Info

=head1 SYNOPSIS

        % prove t/op/debuginfo.t

=head1 DESCRIPTION

Tests the various set and get operations for line, package and file info,
as well as backtrace tests.

=cut

$ENV{TEST_PROG_ARGS} ||= '';
my $nolineno = $ENV{TEST_PROG_ARGS} =~ /--runcore=fast/
    ? "\\(unknown file\\)\n-1" : "debug_\\d+\\.pasm\n\\d";

#SKIP: {
#skip "disabled on fast-core",1 if $ENV{TEST_PROG_ARGS} =~ /--runcore=fast/;

pasm_output_like( <<'CODE', <<"OUTPUT", "getline, getfile" );
.loadlib 'debug_ops'
.pcc_sub :main main:
    getfile S0
    getline I0
    say S0
    say I0
end
CODE
/$nolineno/
OUTPUT

pir_output_like( <<'CODE', <<"OUTPUT", "debug_print" );
.loadlib 'debug_ops'
.sub main :main
    debug_init
    $I0 = 1
    $S0 = "foo"
    $N0 = 3.1
    $P0 = new ['String']
    $P0 = "bar"
    debug_print
.end
CODE
/
  I0 = 1

  N0 = 3.1

  S0 = foo

  P0 = String=PMC[(]0x[a-f0-9]+ Str:"bar"[)]
/
OUTPUT

open STDERR, ">>&STDOUT";
pir_output_like( <<'CODE', <<"OUTPUT", "debug_print without debugger" );
.loadlib 'debug_ops'
.sub main :main
    push_eh eh
    debug_print
    goto finally
eh:
    .get_results($P0)
    say $P0
finally:
    pop_eh
.end
CODE
/Initialize debugger with debug_init before using debug_print/
OUTPUT

pir_output_like( <<'CODE', <<"OUTPUT", "debug_backtrace" );
.loadlib 'debug_ops'
.sub main :main
    debug_init
    backtrace
    say "ok"
.end
CODE
/ok/
OUTPUT

SKIP: {
    skip("This test is failing for no apparent reason on windows", 1);
    pir_stdin_output_like( <<'INPUT', <<'CODE', qr/[(]pdb[)] (print I0\n)?1/, "debug_break" );
print I0
quit
INPUT
.loadlib 'debug_ops'
.sub main :main
    debug_init
    $I0 = 1
    debug_break
.end
CODE
}

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - Null PMC access" );
.sub main :main
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
.sub main :main
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

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - division by 0" );
.namespace ["Test2"]
.sub main :main
    print "ok 1\n"
    foo()
    print "not ok 3\n"
.end
.sub foo :lex
    print "ok 2\n"
    $I1 = 0
    div $I2, $I2, 0
    print "not ok 3\n"
.end
CODE
/^ok 1
ok 2
Divide by zero
current instr.: 'parrot;Test2;foo' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'parrot;Test2;main' pc (\d+|-1) \(.*?:(\d+|-1)\)$/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - recursion 1" );
.sub main :main
    main()
.end
CODE
/^maximum recursion depth exceeded
current instr\.: 'main' pc (\d+|-1) \(.*?:(\d+|-1)\)
called from Sub 'main' pc (\d+|-1) \(.*?:(\d+|-1)\)
\.\.\. call repeated \d+ times/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - recursion 2" );
.sub main :main
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

$nolineno = $ENV{TEST_PROG_ARGS} =~ /--runcore=fast/
    ? '\(\(unknown file\):-1\)' : '\(xyz.pir:126\)';

pir_error_output_like( <<'CODE', <<"OUTPUT", "setfile and setline" );
.sub main :main
    setfile "xyz.pir"
    setline 123
    $S0 = 'hello'
    $I0 = 456
    'no_such_function'($S0, $I0)
.end
CODE
/$nolineno/
OUTPUT

$nolineno = $ENV{TEST_PROG_ARGS} =~ /--runcore=fast/
    ? '\(\(unknown file\):-1\)' : '\(foo.p6:128\)';
pir_error_output_like( <<'CODE', <<"OUTPUT", "setfile and setline" );
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
/$nolineno/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
