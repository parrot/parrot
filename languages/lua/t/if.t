#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: if.t  $

=head1 NAME

t/if.t - Lua if statement 

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/if.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.4.4 "Control Structures".

See "Programming in Lua", section 4.3 "Control Structures". 

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 5;

language_output_is( 'lua', <<'CODE', <<'OUT', 'if' );
a = -2
if a < 0 then a = 0 end
print(a)
CODE
0
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'if' );
a = 12
if a < 0 then a = 0 end
print(a)
CODE
12
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'if else' );
a = 12
b = 34
r = 0
if a < b then r = b else r = a end
print(r)
CODE
34
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'if else' );
a = 12
b = 34
r = 0
if a > b then r = b else r = a end
print(r)
CODE
12
OUT

language_output_is( 'lua', <<'CODE', <<'OUT', 'elseifs' );
a = 3
b = 7
op = "*"
r = 0
if op == "+" then
    r = a + b
elseif op == "-" then
    r = a - b
elseif op == "*" then
    r = a * b
elseif op == "/" then
    r = a / b
else    
    error("invalid operation")
end    
print(r)
CODE
21
OUT

