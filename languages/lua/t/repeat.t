#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/repeat.t - Lua repeat statement

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/repeat.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.4 "Control Structures".

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 2;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'repeat' );
a = {"one", "two", "three"}
local i = 0
repeat
    i = i + 1
    print(a[i])
until not a[i]
CODE
one
two
three
nil
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'repeat (break)' );
a = {"one", "two", "stop", "more"}
local i = 0
repeat
    i = i + 1
    if a[i] == "stop" then break end
until not a[i]
print(a[i])
CODE
stop
OUT

