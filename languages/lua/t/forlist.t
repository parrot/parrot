#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/forlist.t - Lua for statement

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/forlist.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.4 "Control Structures".

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 3;
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

