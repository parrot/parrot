#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/luad.t - Lua Disassembler test

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/luad.t

=head1 DESCRIPTION

Tests Lua Disassembler
(implemented in F<languages/lua/luad.pir>).

See : A No-Frills Introduction to Lua 5.1 VM Instructions
by Kein-Hong Man

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;

if (`luac -v` =~ /^Lua 5.1/) {
    plan tests => 58;
}
else {
    plan skip_all => "luac no available";
}

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loading constants' );
local a,b = 10;
b = a
CODE
; source chunk: luad_1.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.local  "b"  ; 1
.const  10  ; 0
[1] loadk      0   0
[2] loadnil    1   1
[3] move       1   0
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loading constants' );
local a,b,c,d,e = nil, nil, 0
CODE
; source chunk: luad_2.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 2 5
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
.local  "d"  ; 3
.local  "e"  ; 4
.const  0  ; 0
[1] loadk      2   0
[2] loadnil    3   4
[3] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loading constants' );
local a,b,d,e 
local c=0
CODE
; source chunk: luad_3.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 2 5
.local  "a"  ; 0
.local  "b"  ; 1
.local  "d"  ; 2
.local  "e"  ; 3
.local  "c"  ; 4
.const  0  ; 0
[1] loadk      4   0
[2] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loading constants' );
local a,b,c,d = 3, "foo", 3, "foo"
CODE
; source chunk: luad_4.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 2 4
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
.local  "d"  ; 3
.const  3  ; 0
.const  "foo"  ; 1
[1] loadk      0   0
[2] loadk      1   1
[3] loadk      2   0
[4] loadk      3   1
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loading constants' );
local a,b = true, false
CODE
; source chunk: luad_5.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.local  "b"  ; 1
[1] loadbool   0   1   0
[2] loadbool   1   0   0
[3] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loading constants' );
local a = 5 > 2
CODE
; source chunk: luad_6.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  5  ; 0
.const  2  ; 1
[1] lt         1   257 256
[2] jmp        1
[3] loadbool   0   0   1
[4] loadbool   0   1   0
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'upvalues and globals' );
a = 40;
local b = a
CODE
; source chunk: luad_7.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "b"  ; 0
.const  "a"  ; 0
.const  40  ; 1
[1] loadk      0   1
[2] setglobal  0   0
[3] getglobal  0   0
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'upvalues and globals' );
local a;
function b()
  a = 1 
  return a
end
CODE
; source chunk: luad_8.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  "b"  ; 0

; function [0] definition (level 2)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "a"  ; 0
.const  1  ; 0
[1] loadk      0   0
[2] setupval   0   0
[3] getupval   0   0
[4] return     0   2
[5] return     0   1
; end of function

[1] closure    1   0
[2] move       0   0
[3] setglobal  1   0
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table instructions' );
local p = {};
p[1] = "foo";
return p["bar"]
CODE
; source chunk: luad_9.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "p"  ; 0
.const  1  ; 0
.const  "foo"  ; 1
.const  "bar"  ; 2
[1] newtable   0   0   0
[2] settable   0   256 257
[3] gettable   1   0   258
[4] return     1   2
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a,b = 2,4;
a = a + 4 * b - a / 2 ^ b % 3
CODE
; source chunk: luad_10.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 2 4
.local  "a"  ; 0
.local  "b"  ; 1
.const  2  ; 0
.const  4  ; 1
.const  3  ; 2
[1] loadk      0   0
[2] loadk      1   1
[3] mul        2   257 1
[4] add        2   0   2
[5] pow        3   256 1
[6] div        3   0   3
[7] mod        3   3   258
[8] sub        0   2   3
[9] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a = 4 + 7 + b;
a = b + 4 * 7;
a = b + 4 + 7
CODE
; source chunk: luad_11.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  "b"  ; 0
.const  11  ; 1
.const  28  ; 2
.const  4  ; 3
.const  7  ; 4
[1] getglobal  0   0
[2] add        0   257 0
[3] getglobal  1   0
[4] add        0   1   258
[5] getglobal  1   0
[6] add        1   1   259
[7] add        0   1   260
[8] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a = b + (4 + 7)
CODE
; source chunk: luad_12.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  "b"  ; 0
.const  11  ; 1
[1] getglobal  0   0
[2] add        0   0   257
[3] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a = 1 / 0;
local b = 1 + "1"
CODE
; source chunk: luad_13.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.local  "b"  ; 1
.const  0  ; 0
.const  1  ; 1
.const  "1"  ; 2
[1] div        0   257 256
[2] add        1   257 258
[3] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local p,q = 10,false;
q,p = -p,not q
CODE
; source chunk: luad_14.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "p"  ; 0
.local  "q"  ; 1
.const  10  ; 0
[1] loadk      0   0
[2] loadbool   1   0   0
[3] unm        2   0
[4] not        0   1
[5] move       1   2
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a = - (7 / 4)
CODE
; source chunk: luad_15.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  -1.75  ; 0
[1] loadk      0   0
[2] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a,b;
a = #b;
a= #"foo"
CODE
; source chunk: luad_16.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.local  "b"  ; 1
.const  "foo"  ; 0
[1] len        0   1
[2] loadk      2   0
[3] len        0   2
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local x,y = "foo","bar";
return x..y..x..y
CODE
; source chunk: luad_17.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 6 stacks
.function  0 0 2 6
.local  "x"  ; 0
.local  "y"  ; 1
.const  "foo"  ; 0
.const  "bar"  ; 1
[1] loadk      0   0
[2] loadk      1   1
[3] move       2   0
[4] move       3   1
[5] move       4   0
[6] move       5   1
[7] concat     2   2   5
[8] return     2   2
[9] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'arithmetic and string instructions' );
local a = "foo".."bar".."baz"
CODE
; source chunk: luad_18.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.const  "foo"  ; 0
.const  "bar"  ; 1
.const  "baz"  ; 2
[1] loadk      0   0
[2] loadk      1   1
[3] loadk      2   2
[4] concat     0   0   2
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local m, n;
return m >= n
CODE
; source chunk: luad_19.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "m"  ; 0
.local  "n"  ; 1
[1] le         1   1   0
[2] jmp        1
[3] loadbool   2   0   1
[4] loadbool   2   1   0
[5] return     2   2
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
z()
CODE
; source chunk: luad_20.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.const  "z"  ; 0
[1] getglobal  0   0
[2] call       0   1   1
[3] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
z(1,2,3)
CODE
; source chunk: luad_21.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 2 4
.const  "z"  ; 0
.const  1  ; 1
.const  2  ; 2
.const  3  ; 3
[1] getglobal  0   0
[2] loadk      1   1
[3] loadk      2   2
[4] loadk      3   3
[5] call       0   4   1
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local p,q,r,s = z(y())
CODE
; source chunk: luad_22.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 2 4
.local  "p"  ; 0
.local  "q"  ; 1
.local  "r"  ; 2
.local  "s"  ; 3
.const  "z"  ; 0
.const  "y"  ; 1
[1] getglobal  0   0
[2] getglobal  1   1
[3] call       1   1   0
[4] call       0   0   5
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
print(string.char(64))
CODE
; source chunk: luad_23.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.const  "print"  ; 0
.const  "string"  ; 1
.const  "char"  ; 2
.const  64  ; 3
[1] getglobal  0   0
[2] getglobal  1   1
[3] gettable   1   1   258
[4] loadk      2   3
[5] call       1   2   0
[6] call       0   0   1
[7] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local e,f,g;
return f,g
CODE
; source chunk: luad_24.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 2 5
.local  "e"  ; 0
.local  "f"  ; 1
.local  "g"  ; 2
[1] move       3   1
[2] move       4   2
[3] return     3   3
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
return x("foo", "bar")
CODE
; source chunk: luad_25.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.const  "x"  ; 0
.const  "foo"  ; 1
.const  "bar"  ; 2
[1] getglobal  0   0
[2] loadk      1   1
[3] loadk      2   2
[4] tailcall   0   3   0
[5] return     0   0
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local a,b,c = ...
CODE
; source chunk: luad_26.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
[1] vararg     0   4
[2] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local a = function(...) 
  local a,b,c = ...
end
CODE
; source chunk: luad_27.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0

; function [0] definition (level 2)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 3 4
.local  "arg"  ; 0
.local  "a"  ; 1
.local  "b"  ; 2
.local  "c"  ; 3
[1] vararg     1   4
[2] return     0   1
; end of function

[1] closure    0   0
[2] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local a;
a(...)
CODE
; source chunk: luad_28.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
[1] move       1   0
[2] vararg     2   0
[3] call       1   0   1
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
local a = {...}
CODE
; source chunk: luad_29.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
[1] newtable   0   0   0
[2] vararg     1   0
[3] setlist    0   0   1
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
return ...
CODE
; source chunk: luad_30.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
[1] vararg     0   0
[2] return     0   0
[3] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
foo:bar("baz")
CODE
; source chunk: luad_31.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.const  "foo"  ; 0
.const  "bar"  ; 1
.const  "baz"  ; 2
[1] getglobal  0   0
[2] self       0   0   257
[3] loadk      2   2
[4] call       0   3   1
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'jumps and calls' );
foo.bar(foo, "baz")
CODE
; source chunk: luad_32.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.const  "foo"  ; 0
.const  "bar"  ; 1
.const  "baz"  ; 2
[1] getglobal  0   0
[2] gettable   0   0   257
[3] getglobal  1   0
[4] loadk      2   2
[5] call       0   3   1
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local x,y;
return x ~= y
CODE
; source chunk: luad_33.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "x"  ; 0
.local  "y"  ; 1
[1] eq         0   0   1
[2] jmp        1
[3] loadbool   2   0   1
[4] loadbool   2   1   0
[5] return     2   2
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local x,y;
if x ~= y then
  return "foo"
else
  return "bar"
end
CODE
; source chunk: luad_34.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "x"  ; 0
.local  "y"  ; 1
.const  "foo"  ; 0
.const  "bar"  ; 1
[1] eq         1   0   1
[2] jmp        3
[3] loadk      2   0
[4] return     2   2
[5] jmp        2
[6] loadk      2   1
[7] return     2   2
[8] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
if 8 > 9 then
  return 8
elseif 5 >= 4 then
  return 5
else
  return 9
end
CODE
; source chunk: luad_35.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.const  8  ; 0
.const  9  ; 1
.const  5  ; 2
.const  4  ; 3
[01] lt         0   257 256
[02] jmp        3
[03] loadk      0   0
[04] return     0   2
[05] jmp        7
[06] le         0   259 258
[07] jmp        3
[08] loadk      0   2
[09] return     0   2
[10] jmp        2
[11] loadk      0   1
[12] return     0   2
[13] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local a,b,c;
c = a and b
CODE
; source chunk: luad_36.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
[1] testset    2   0   0
[2] jmp        1
[3] move       2   1
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local a,b;
a = a and b
CODE
; source chunk: luad_37.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.local  "b"  ; 1
[1] test       0       0
[2] jmp        1
[3] move       0   1
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local a,b,c;
c = a or b
CODE
; source chunk: luad_38.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
[1] testset    2   0   1
[2] jmp        1
[3] move       2   1
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local a,b;
a = a or b
CODE
; source chunk: luad_39.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.local  "b"  ; 1
[1] test       0       1
[2] jmp        1
[3] move       0   1
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local a,b,c;
if a > b and a > c then
  return a
end
CODE
; source chunk: luad_40.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
[1] lt         0   1   0
[2] jmp        3
[3] lt         0   2   0
[4] jmp        1
[5] return     0   2
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
if Done then return end
CODE
; source chunk: luad_41.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.const  "Done"  ; 0
[1] getglobal  0   0
[2] test       0       0
[3] jmp        1
[4] return     0   1
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
if Found and match then return end
CODE
; source chunk: luad_42.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.const  "Found"  ; 0
.const  "match"  ; 1
[1] getglobal  0   0
[2] test       0       0
[3] jmp        4
[4] getglobal  0   1
[5] test       0       0
[6] jmp        1
[7] return     0   1
[8] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'relational and logic instructions' );
local a,b,c;
a = a and b or c
CODE
; source chunk: luad_43.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "a"  ; 0
.local  "b"  ; 1
.local  "c"  ; 2
[1] test       0       0
[2] jmp        2
[3] testset    0   1   1
[4] jmp        1
[5] move       0   2
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loop instructions' );
local a = 0;
for i = 1,100,5 do
  a = a + i
end
CODE
; source chunk: luad_44.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 2 5
.local  "a"  ; 0
.local  "(for index)"  ; 1
.local  "(for limit)"  ; 2
.local  "(for step)"  ; 3
.local  "i"  ; 4
.const  0  ; 0
.const  1  ; 1
.const  100  ; 2
.const  5  ; 3
[1] loadk      0   0
[2] loadk      1   1
[3] loadk      2   2
[4] loadk      3   3
[5] forprep    1   1
[6] add        0   0   4
[7] forloop    1   -2
[8] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loop instructions' );
for i = 10,1,-1 do
  if i == 5 then break end
end
CODE
; source chunk: luad_45.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 4 stacks
.function  0 0 2 4
.local  "(for index)"  ; 0
.local  "(for limit)"  ; 1
.local  "(for step)"  ; 2
.local  "i"  ; 3
.const  10  ; 0
.const  1  ; 1
.const  -1  ; 2
.const  5  ; 3
[1] loadk      0   0
[2] loadk      1   1
[3] loadk      2   2
[4] forprep    0   3
[5] eq         0   3   259
[6] jmp        1
[7] jmp        1
[8] forloop    0   -4
[9] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loop instructions' );
for i,v in pairs(t) do
  print(i,v)
end
CODE
; source chunk: luad_46.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 8 stacks
.function  0 0 2 8
.local  "(for generator)"  ; 0
.local  "(for state)"  ; 1
.local  "(for control)"  ; 2
.local  "i"  ; 3
.local  "v"  ; 4
.const  "pairs"  ; 0
.const  "t"  ; 1
.const  "print"  ; 2
[01] getglobal  0   0
[02] getglobal  1   1
[03] call       0   2   4
[04] jmp        4
[05] getglobal  5   2
[06] move       6   3
[07] move       7   4
[08] call       5   3   1
[09] tforloop   0       2
[10] jmp        -6
[11] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loop instructions' );
local a = 0;
repeat a = a + 1 until a == 10
CODE
; source chunk: luad_47.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  0  ; 0
.const  1  ; 1
.const  10  ; 2
[1] loadk      0   0
[2] add        0   0   257
[3] eq         0   0   258
[4] jmp        -3
[5] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'loop instructions' );
local a = 1;
while a < 10 do
  a = a + 1
end
CODE
; source chunk: luad_48.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "a"  ; 0
.const  1  ; 0
.const  10  ; 1
[1] loadk      0   0
[2] lt         0   0   257
[3] jmp        2
[4] add        0   0   256
[5] jmp        -4
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table creation' );
local q = {}
CODE
; source chunk: luad_49.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "q"  ; 0
[1] newtable   0   0   0
[2] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table creation' );
local q = {1,2,3,4,5,}
CODE
; source chunk: luad_50.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 6 stacks
.function  0 0 2 6
.local  "q"  ; 0
.const  1  ; 0
.const  2  ; 1
.const  3  ; 2
.const  4  ; 3
.const  5  ; 4
[1] newtable   0   5   0
[2] loadk      1   0
[3] loadk      2   1
[4] loadk      3   2
[5] loadk      4   3
[6] loadk      5   4
[7] setlist    0   5   1
[8] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table creation' );
local q = {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,
  1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,
  1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,}
CODE
; source chunk: luad_51.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 51 stacks
.function  0 0 2 51
.local  "q"  ; 0
.const  1  ; 0
.const  2  ; 1
.const  3  ; 2
.const  4  ; 3
.const  5  ; 4
.const  6  ; 5
.const  7  ; 6
.const  8  ; 7
.const  9  ; 8
.const  0  ; 9
[01] newtable   0   30  0
[02] loadk      1   0
[03] loadk      2   1
[04] loadk      3   2
[05] loadk      4   3
[06] loadk      5   4
[07] loadk      6   5
[08] loadk      7   6
[09] loadk      8   7
[10] loadk      9   8
[11] loadk      10  9
[12] loadk      11  0
[13] loadk      12  1
[14] loadk      13  2
[15] loadk      14  3
[16] loadk      15  4
[17] loadk      16  5
[18] loadk      17  6
[19] loadk      18  7
[20] loadk      19  8
[21] loadk      20  9
[22] loadk      21  0
[23] loadk      22  1
[24] loadk      23  2
[25] loadk      24  3
[26] loadk      25  4
[27] loadk      26  5
[28] loadk      27  6
[29] loadk      28  7
[30] loadk      29  8
[31] loadk      30  9
[32] loadk      31  0
[33] loadk      32  1
[34] loadk      33  2
[35] loadk      34  3
[36] loadk      35  4
[37] loadk      36  5
[38] loadk      37  6
[39] loadk      38  7
[40] loadk      39  8
[41] loadk      40  9
[42] loadk      41  0
[43] loadk      42  1
[44] loadk      43  2
[45] loadk      44  3
[46] loadk      45  4
[47] loadk      46  5
[48] loadk      47  6
[49] loadk      48  7
[50] loadk      49  8
[51] loadk      50  9
[52] setlist    0   50  1
[53] loadk      1   0
[54] loadk      2   1
[55] loadk      3   2
[56] loadk      4   3
[57] loadk      5   4
[58] setlist    0   5   2
[59] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table creation' );
local q = {a=1,b=2,c=3,d=4,e=5,f=6,g=7,h=8,}
CODE
; source chunk: luad_52.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "q"  ; 0
.const  "a"  ; 0
.const  1  ; 1
.const  "b"  ; 2
.const  2  ; 3
.const  "c"  ; 4
.const  3  ; 5
.const  "d"  ; 6
.const  4  ; 7
.const  "e"  ; 8
.const  5  ; 9
.const  "f"  ; 10
.const  6  ; 11
.const  "g"  ; 12
.const  7  ; 13
.const  "h"  ; 14
.const  8  ; 15
[01] newtable   0   0   8
[02] settable   0   256 257
[03] settable   0   258 259
[04] settable   0   260 261
[05] settable   0   262 263
[06] settable   0   264 265
[07] settable   0   266 267
[08] settable   0   268 269
[09] settable   0   270 271
[10] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table creation' );
return {1,2,3,a=1,b=2,c=3,foo()}
CODE
; source chunk: luad_53.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 2 5
.const  1  ; 0
.const  2  ; 1
.const  3  ; 2
.const  "a"  ; 3
.const  "b"  ; 4
.const  "c"  ; 5
.const  "foo"  ; 6
[01] newtable   0   3   3
[02] loadk      1   0
[03] loadk      2   1
[04] loadk      3   2
[05] settable   0   259 256
[06] settable   0   260 257
[07] settable   0   261 258
[08] getglobal  4   6
[09] call       4   1   0
[10] setlist    0   0   1
[11] return     0   2
[12] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'table creation' );
local a;
return {a(), a(), a()}
CODE
; source chunk: luad_54.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 5 stacks
.function  0 0 2 5
.local  "a"  ; 0
[01] newtable   1   2   0
[02] move       2   0
[03] call       2   1   2
[04] move       3   0
[05] call       3   1   2
[06] move       4   0
[07] call       4   1   0
[08] setlist    1   0   1
[09] return     1   2
[10] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'closures and closing' );
local u;
function p() return u end
CODE
; source chunk: luad_55.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "u"  ; 0
.const  "p"  ; 0

; function [0] definition (level 2)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "u"  ; 0
[1] getupval   0   0
[2] return     0   2
[3] return     0   1
; end of function

[1] closure    1   0
[2] move       0   0
[3] setglobal  1   0
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'closures and closing' );
local m
function p()
  local n
  function q() return m,n end
end
CODE
; source chunk: luad_56.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "m"  ; 0
.const  "p"  ; 0

; function [0] definition (level 2)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.local  "n"  ; 0
.upvalue  "m"  ; 0
.const  "q"  ; 0

; function [0] definition (level 3)
; 2 upvalues, 0 params, 2 stacks
.function  2 0 0 2
.upvalue  "m"  ; 0
.upvalue  "n"  ; 1
[1] getupval   0   0
[2] getupval   1   1
[3] return     0   3
[4] return     0   1
; end of function

[1] closure    1   0
[2] getupval   0   0
[3] move       0   0
[4] setglobal  1   0
[5] return     0   1
; end of function

[1] closure    1   0
[2] move       0   0
[3] setglobal  1   0
[4] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'closures and closing' );
do
  local p,q
  r = function() return p,q end
end
CODE
; source chunk: luad_57.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 3 stacks
.function  0 0 2 3
.local  "p"  ; 0
.local  "q"  ; 1
.const  "r"  ; 0

; function [0] definition (level 2)
; 2 upvalues, 0 params, 2 stacks
.function  2 0 0 2
.upvalue  "p"  ; 0
.upvalue  "q"  ; 1
[1] getupval   0   0
[2] getupval   1   1
[3] return     0   3
[4] return     0   1
; end of function

[1] closure    2   0
[2] move       0   0
[3] move       0   1
[4] setglobal  2   0
[5] close      0
[6] return     0   1
; end of function

OUT

language_output_is( 'Luad', <<'CODE', <<'OUT', 'closures and closing' );
do
  local p
  while true do
    q = function() return p end
    break
  end
end
CODE
; source chunk: luad_58.luac

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 2 2
.local  "p"  ; 0
.const  "q"  ; 0

; function [0] definition (level 2)
; 1 upvalues, 0 params, 2 stacks
.function  1 0 0 2
.upvalue  "p"  ; 0
[1] getupval   0   0
[2] return     0   2
[3] return     0   1
; end of function

[1] closure    1   0
[2] move       0   0
[3] setglobal  1   0
[4] jmp        1
[5] jmp        -5
[6] close      0
[7] return     0   1
; end of function

OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
