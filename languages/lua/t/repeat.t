#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/repeat.t - Lua C<repeat> statement

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


