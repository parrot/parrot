#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/while.t - Lua C<while> statement

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/while.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.4 "Control Structures".

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 4;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'while (empty)' );
a = {}
local i = 1
while a[i] do
    print(a[i])
    i = i + 1
end
CODE
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'while' );
a = {"one", "two", "three"}
local i = 1
while a[i] do
    print(a[i])
    i = i + 1
end
CODE
one
two
three
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'while (with break)' );
a = {"one", "two", "stop", "more"}
local i = 1
while a[i] do
    if a[i] == "stop" then break end
    print(a[i])
    i = i + 1
end
CODE
one
two
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'while' );
x = 3
local i = 1
while i<=x do
    print(i*2)
    i = i + 1
end
CODE
2
4
6
OUT


