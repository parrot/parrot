#! perl
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/fornum.t - Lua for statement

=head1 SYNOPSIS

    % perl t/fornum.t

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 2.4.5 "For Statement",
L<http://www.lua.org/manual/5.1/manual.html#2.4.5>.

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 14;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 1, 10, 2' );
for i = 1, 10, 2 do
    print(i)
end
CODE
1
3
5
7
9
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 1, 10, 2 lex' );
for i = 1, 10, 2 do
    function f ()
        print(i)
    end
    f()
end
CODE
1
3
5
7
9
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 1, 10, 2 !lex' );
function f ()
    print(i)
end
for i = 1, 10, 2 do
    f()
end
CODE
nil
nil
nil
nil
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 3, 5' );
for i = 3, 5 do
    print(i)
    i = i + 1
end
CODE
3
4
5
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 1, -1' );
for i = 5, 1, -1 do
    print(i)
end
CODE
5
4
3
2
1
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 5' );
for i = 5, 5 do
    print(i)
end
CODE
5
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 5, -1' );
for i = 5, 5, -1 do
    print(i)
end
CODE
5
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 3' );
for i = 5, 3 do
    print(i)
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 7, -1' );
for i = 5, 7, -1 do
    print(i)
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for 5, 7, 0' );
for i = 5, 7, 0 do
    print(i)
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for break' );
for i = 1, 10, 2 do
    if i > 4 then break end
    print(i)
end
CODE
1
3
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for tonumber' );
local function first() print("first",1); return 1 end
local function limit() print("limit",8); return 8 end
local function step()  print("step",2);  return 2 end

for i = first(), limit(), step() do
    print(i)
end
CODE
first	1
limit	8
step	2
1
3
5
7
OUT

language_output_like( 'lua', <<'CODE', <<'OUT', 'for tonumber' );
local function first() return 1 end
local function limit() return end
local function step()  return 2 end

for i = first(), limit(), step() do
    print(i)
end
CODE
/^[^:]+: [^:]+:\d+: 'for' limit must be a number\nstack traceback:\n/
OUT

TODO: {
    local $TODO = 'upvalues';

language_output_is( 'lua', <<'CODE', <<'OUT', 'for & upval' );
local a = {}
for i = 1, 10 do
    a[i] = function () return i end
end
print(a[5]())
CODE
5
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

