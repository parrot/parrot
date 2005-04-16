#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/debuginfo.t - Debugging Info

=head1 SYNOPSIS

	% perl -Ilib t/op/debuginfo.t

=head1 DESCRIPTION

Tests the various set and get operations for line, package and file info,
as well as backtrace tests.

=cut

use Parrot::Test tests => 6;

SKIP:
{
  skip("getline/setline changes not finished", 3);
output_is( <<'CODE', <<OUTPUT, "set/getline" );
	setline 1
	setline 2
	getline I0
	print I0
	print "\n"
	setline 1
	getline I0
	print I0
	print "\n"
	end
CODE
2
1
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getpackage" );
	setpackage "foo"
	setpackage "bar"
	getpackage S0
	print S0
	print "\n"
	setpackage "foo"
	getpackage S0
	print S0
	print "\n"
	end
CODE
bar
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getfile" );
	setfile "foo"
	setfile "bar"
	getfile S0
	print S0
	print "\n"
	setfile "foo"
	getfile S0
	print S0
	print "\n"
	end
CODE
bar
foo
OUTPUT

}

pir_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - Null PMC access" );
.sub main
    print "ok 1\n"
    debug 1
    print "ok 2\n"
    a()
    print "not ok 11\n"
.end
.sub a
    print "ok 3\n"
    b()
    print "not ok 10\n"
.end
.sub b
    print "ok 4\n"
    c()
    print "not ok 9\n"
.end
.sub c
    print "ok 5\n"
    d()
    print "not ok 8\n"
.end
.sub d
    print "ok 6\n"
    $P0 = null
    $P0()
    print "not ok 7\n"
.end
CODE
/^ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
Null PMC access in invoke\(\)
current instr\.: 'd' pc \d+
called from Sub 'c' pc \d+
called from Sub 'b' pc \d+
called from Sub 'a' pc \d+
called from Sub 'main' pc \d+
\*\*\* Parrot VM: Dumping GC info \*\*\*/
OUTPUT

pir_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - method not found" );
.sub main
    print "ok 1\n"
    debug 1
    foo()
    print "not ok 5\n"
.end
.sub foo
    print "ok 2\n"
    $P0 = new Integer
    print "ok 3\n"
    $P0."nosuchmethod"()
    print "not ok 4\n"
.end
CODE
/^ok 1
ok 2
ok 3
real_exception \(severity:2 error:81\): Method 'nosuchmethod' not found
current instr.: 'foo' pc \d+
called from Sub 'main' pc \d+
Method 'nosuchmethod' not found
\s+in file '.*?' near line 11
\*\*\* Parrot VM: Dumping GC info \*\*\*/
OUTPUT

pir_output_like( <<'CODE', <<'OUTPUT', "debug backtrace - fetch of unknown lexical" );
.sub main
    new_pad 0
    print "ok 1\n"
    debug 1
    foo()
    print "not ok 3\n"
.end
.sub foo
    print "ok 2\n"
    find_lex $P0, "nosuchlex"
    print "not ok 3\n"
.end
CODE
/^ok 1
ok 2
real_exception \(severity:2 error:77\): Lexical 'nosuchlex' not found
current instr.: 'foo' pc \d+
called from Sub 'main' pc \d+
Lexical 'nosuchlex' not found
\s+in file '.*?' near line 10
\*\*\* Parrot VM: Dumping GC info \*\*\*/
OUTPUT
