#! perl
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/forlist.t - Lua for statement

=head1 SYNOPSIS

    % perl t/forlist.t

=head1 DESCRIPTION

See "Lua 5.1 Reference Manual", section 2.4.5 "For Statement",
L<http://www.lua.org/manual/5.1/manual.html#2.4.5>.

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 6;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'for ipairs' );
a = {"Sunday", "Monday", "Tuesday"}

for i, v in ipairs(a) do
    print(i, v)
end
CODE
1	Sunday
2	Monday
3	Tuesday
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for ipairs (hash)' );
t = {a=10, b=100}

for i, v in ipairs(t) do
    print(i, v)
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for pairs' );
a = {"Sunday", "Monday", "Tuesday"}

for k in pairs(a) do
    print(k)
end
CODE
1
2
3
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for pairs (hash)' );
t = {a=10, b=100}

for k in pairs(t) do
    print(k)
end
CODE
a
b
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'for break' );
a = {"Sunday", "Monday", "Tuesday"}

for i, v in ipairs(a) do
    print(i, v)
    if v == "Monday" then break end
end
CODE
1	Sunday
2	Monday
OUT

TODO: {
    local $TODO = 'upvalues';

language_output_is( 'lua', <<'CODE', <<'OUT', 'for & upval' );
local a = {[1]=2, [2]=4, [3]=8}
local b = {}
for i, v in pairs(a) do
    b[i] = function () return v end
end
print(b[1](), b[2](), b[3]())
CODE
2	4	8
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

