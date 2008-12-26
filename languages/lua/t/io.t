#! perl
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/io.t - Lua Input/Output Library

=head1 SYNOPSIS

    % perl t/io.t

=head1 DESCRIPTION

Tests Lua Input/Output Library
(implemented in F<languages/lua/src/lib/luaio.pir>).

See "Lua 5.1 Reference Manual", section 5.7 "Input and Output Facilities",
L<http://www.lua.org/manual/5.1/manual.html#5.7>.

See "Programming in Lua", section 21 "The I/O Library".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 41;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io environment' );
assert(getfenv(io.lines) == _G)
local env = debug.getfenv(io.lines)
print(type(env.__close))
assert(env[1] == io.stdin)
assert(env[2] == io.stdout)
CODE
function
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.stdin' );
print(io.stdin)
CODE
/^file \((0[Xx])?[0-9A-Fa-f]+\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.stdout' );
print(io.stdout)
CODE
/^file \((0[Xx])?[0-9A-Fa-f]+\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.stderr' );
print(io.stderr)
CODE
/^file \((0[Xx])?[0-9A-Fa-f]+\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.close (std)' );
print(io.close(io.stderr))
CODE
nil	cannot close standard file
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.flush' );
print(io.flush())
CODE
true
OUTPUT

unlink("$FindBin::Bin/../../../file.no") if ( -f "$FindBin::Bin/../../../file.no" );

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.open' );
f, msg = io.open("file.no")
print(f, msg)
CODE
nil	file.no: No such file or directory
OUTPUT

unlink("$FindBin::Bin/../../../file.txt") if ( -f "$FindBin::Bin/../../../file.txt" );
open my $X, '>', "$FindBin::Bin/../../../file.txt";
binmode $X, ':raw';
print {$X} "file with text\n";
close $X;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.open' );
f = io.open("file.txt")
print(f)
CODE
/^file \((0[Xx])?[0-9A-Fa-f]+\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.open / close' );
f = io.open("file.txt")
print(io.close(f))
CODE
true
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.close (closed)' );
f = io.open("file.txt")
io.close(f)
io.close(f)
CODE
/^[^:]+: [^:]+:\d+: attempt to use a closed file\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.flush (closed)' );
f = io.open("file.txt")
io.close(f)
f:flush()   -- io.flush(f)
CODE
/^[^:]+: [^:]+:\d+: attempt to use a closed file\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.type' );
print(io.type("not a file"))
f = io.open("file.txt")
print(io.type(f))
io.close(f)
print(io.type(f))
CODE
nil
file
closed file
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.input' );
assert(io.stdin == io.input())
assert(io.stdin == io.input(nil))
f = io.stdin
print(io.input("file.txt"))
assert(f == io.input(f))
CODE
/^file \((0[Xx])?[0-9A-Fa-f]+\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.output' );
assert(io.output() == io.stdout)
assert(io.output(nil) == io.stdout)
f = io.stdout
print(io.output("output.new"))
assert(f == io.output(f))
CODE
/^file \((0[Xx])?[0-9A-Fa-f]+\)/
OUTPUT
unlink("$FindBin::Bin/../../../output.new") if ( -f "$FindBin::Bin/../../../output.new" );

TODO: {
    local $TODO = 'pipe not yet implemented';

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.popen' );
f = io.popen("perl -e \"print 'standard output'\"")
print(io.type(f))
print(f:read())
io.close(f)
CODE
file
standard output
OUTPUT
}

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.read *l', params => '< file.txt' );
print(io.read("*l"))
print(io.read("*l"))
print(io.type(io.stdin))
CODE
file with text
nil
file
OUTPUT

unlink("$FindBin::Bin/../../../number.txt") if ( -f "$FindBin::Bin/../../../number.txt" );
open my $Y, '>', "$FindBin::Bin/../../../number.txt";
binmode $Y, ':raw';
print {$Y} << 'DATA';
6.0     -3.23   15e12
4.3     234     1000001
DATA
close $Y;

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io:read *number', params => '< number.txt' );
while true do
    local n1, n2, n3 = io.read("*number", "*number", "*number")
    if not n1 then break end
    print(math.max(n1, n2, n3))
end
CODE
15000000000000
1000001
OUTPUT
# clean up number.txt
unlink("$FindBin::Bin/../../../number.txt") if ( -f "$FindBin::Bin/../../../number.txt" );

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.lines filename' );
for line in io.lines("file.txt") do
    print(line)
end
CODE
file with text
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.lines', params => '< file.txt' );
for line in io.lines() do
    print(line)
end
CODE
file with text
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.tmpfile' );
f = io.tmpfile()
print(io.type(f))
f:write("some text")
f:close()
CODE
file
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.write' );
io.write()
io.write("text", 12, "\n")
CODE
text12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:close (std)' );
print(io.stderr:close())
CODE
nil	cannot close standard file
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:close' );
f = io.open("file.txt")
print(f:close())
CODE
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:flush' );
print(io.stderr:flush())
CODE
true
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:flush closed' );
f = io.open("file.txt")
f:close()
f:flush()
CODE
/^[^:]+: [^:]+:\d+: attempt to use a closed file\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:read closed' );
f = io.open("file.txt")
f:close()
print(f:read())
CODE
/^[^:]+: [^:]+:\d+: attempt to use a closed file\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:read' );
f = io.open("file.txt")
s = f:read()
print(s:len(), s)
s = f:read()
print(s)
f:close()
CODE
14	file with text
nil
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:read invalid' );
f = io.open("file.txt")
f:read("*z")
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'read' \(invalid (format|option)\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:read *l' );
f = io.open("file.txt")
s1, s2 = f:read("*l", "*l")
print(s1:len(), s1)
print(s2)
f:close()
CODE
14	file with text
nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:read *n' );
f = io.open("file.txt")
n1, n2 = f:read("*n", "*n")
print(n1, n1)
f:close()
CODE
nil	nil
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:read *a' );
f = io.open("file.txt")
s = f:read("*a")
print(s:len(), s)
f:close()
CODE
15	file with text

OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:read number' );
f = io.open("file.txt")
print(f:read(0))
print(f:read(5, 5, 15))
-- print(f:read(0))
f:close()
CODE

file 	with 	text

OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:lines' );
f = io.open("file.txt")
for line in f:lines() do
    print(line)
end
print(io.type(f))
f:close()
print(io.type(f))
CODE
file with text
file
closed file
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:seek closed' );
f = io.open("file.txt")
f:close()
print(f:seek("end", 0))
CODE
/^[^:]+: [^:]+:\d+: attempt to use a closed file\nstack traceback:\n/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:seek invalid' );
f = io.open("file.txt")
print(f:seek("bad", 0))
f:close()
CODE
/^[^:]+: [^:]+:\d+: bad argument #1 to 'seek' \(invalid option 'bad'\)\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:seek' );
f = io.open("file.txt")
print(f:seek("end", 0))
f:close()
CODE
15
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:setvbuf "no"' );
f = io.open("file.txt")
print(f:setvbuf("no"))
f:close()
CODE
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:setvbuf "full"' );
f = io.open("file.txt")
print(f:setvbuf("full", 4096))
f:close()
CODE
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:setvbuf "line"' );
f = io.open("file.txt")
print(f:setvbuf("line", 132))
f:close()
CODE
true
OUTPUT

# clean up file.txt
unlink("$FindBin::Bin/../../../file.txt") if ( -f "$FindBin::Bin/../../../file.txt" );

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:write closed' );
f = io.open("file.out", "w")
f:close()
f:write("end")
CODE
/^[^:]+: [^:]+:\d+: attempt to use a closed file\nstack traceback:\n/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:write' );
f = io.open("file.out", "w")
print(f:write("end"))
f:close()
CODE
true
OUTPUT

# clean up file.out
unlink("$FindBin::Bin/../../../file.out") if ( -f "$FindBin::Bin/../../../file.out" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

