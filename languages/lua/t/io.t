#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/io.t - Lua Input/Output Library

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/io.t

=head1 DESCRIPTION

Tests Lua Input/Output Library
(implemented in F<languages/lua/lib/luaio.pir>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 28;
use Test::More;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.stdin' );
print(io.stdin)
CODE
/^file \([0-9A-Fa-f]{8}\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.stdout' );
print(io.stdout)
CODE
/^file \([0-9A-Fa-f]{8}\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.stderr' );
print(io.stderr)
CODE
/^file \([0-9A-Fa-f]{8}\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.close' );
print(io.close(io.stderr))
CODE
true
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.flush' );
print(io.flush())
CODE
true
OUTPUT

unlink('../file.no') if ( -f '../file.no' );

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.open' );
f, msg = io.open("file.no")
print(f, msg)
CODE
nil	file.no: No such file or directory
OUTPUT

unlink('../file.txt') if ( -f '../file.txt' );
open my $X, '>', '../file.txt';
binmode $X, ':raw';
print {$X} "file with text\n";
close $X;

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.open' );
f = io.open("file.txt")
print(f)
CODE
/^file \([0-9A-Fa-f]{8}\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.open / close' );
f = io.open("file.txt")
print(f:close())
CODE
true
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.close (closed)' );
f = io.open("file.txt")
f:close()
f:close()
CODE
/attempt to use a closed file/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.flush (closed)' );
f = io.open("file.txt")
f:close()
f:flush()
CODE
/attempt to use a closed file/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.type' );
print(io.type("not a file"))
f = io.open("file.txt")
print(io.type(f))
f:close()
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
/^file \([0-9A-Fa-f]{8}\)/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'io.output' );
assert(io.output() == io.stdout)
assert(io.output(nil) == io.stdout)
f = io.stdout
print(io.output("output.new"))
assert(f == io.output(f))
CODE
/^file \([0-9A-Fa-f]{8}\)/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'io.write' );
io.write()
io.write("text", 12, "\n")
CODE
text12
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:close' );
print(io.stderr:close())
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
/attempt to use a closed file/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:read closed' );
f = io.open("file.txt")
f:close()
print(f:read())
CODE
/attempt to use a closed file/
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
/invalid (format|option)/
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

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:seek closed' );
f = io.open("file.txt")
f:close()
print(f:seek("end", 0))
CODE
/attempt to use a closed file/
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:seek invalid' );
f = io.open("file.txt")
print(f:seek("bad", 0))
f:close()
CODE
/invalid option 'bad'/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:seek' );
f = io.open("file.txt")
print(f:seek("end", 0))
f:close()
CODE
15
OUTPUT

language_output_like( 'lua', << 'CODE', << 'OUTPUT', 'file:write closed' );
f = io.open("file.out", "w")
f:close()
f:write("end")
CODE
/attempt to use a closed file/
OUTPUT

language_output_is( 'lua', << 'CODE', << 'OUTPUT', 'file:write' );
f = io.open("file.out", "w")
print(f:write("end"))
f:close()
CODE
true
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

