#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: fornum.t 11357 2006-01-27 07:56:36Z fperrad $

=head1 NAME

t/fornum.t - Lua for statement

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/fornum.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.4 "Control Structures".

See "Programming in Lua", section 4.3 "Control Structures".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
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


language_output_is( 'lua', <<'CODE', <<'OUT', 'for 3, 5' );
for i = 3, 5 do
    print(i)
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


language_output_is( 'lua', <<'CODE', <<'OUT', 'for break' );
for i = 1, 10, 2 do
    if i > 4 then break end
    print(i)
end
CODE
1
3
OUT

