#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: test_lex.t $

=head1 NAME

t/test_lex.t - Lua lexicography test

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/test_lex.t

=head1 DESCRIPTION

Tests Lua lexicograaphy
(implemented in F<languages/lua/test_lex.pir>).

See "Lua 5.1 Reference Manual", section 2.1 "Lexical Conventions",
L<http://www.lua.org/manual/5.1/manual.html#2.1>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'hello' );
print("hello")
CODE
Name:	print
punct:	(
String:	hello
punct:	)
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'keyword' );
and
break
do
else
elseif
end
false
for
function
if
in
local
nil
not
or
repeat
return
then
true
until
while
CODE
keyword:	and
keyword:	break
keyword:	do
keyword:	else
keyword:	elseif
keyword:	end
keyword:	false
keyword:	for
keyword:	function
keyword:	if
keyword:	in
keyword:	local
keyword:	nil
keyword:	not
keyword:	or
keyword:	repeat
keyword:	return
keyword:	then
keyword:	true
keyword:	until
keyword:	while
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'not keyword' );
format      -- not for
doit        -- not do
CODE
Name:	format
Name:	doit
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'string' );
'alo\n123"'
"alo\n123\""
'\97lo\10\04923"'
CODE
String:	alo
123"
String:	alo
123"
String:	alo
123"
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'long string' );
[[alo
123"]]
[==[
alo
123"]==]
CODE
LongString:	alo
123"
LongString:	alo
123"
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'number' );
3
3.0
3.1416
314.16e-2
0.31416E1
.31416E+1
0xff
0x56
CODE
Number:	3
Number:	3.0
Number:	3.1416
Number:	314.16e-2
Number:	0.31416E1
Number:	.31416E+1
Number:	0xff
Number:	0x56
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'comment' );
-- comment
1   -- comment
2
CODE
Number:	1
Number:	2
"past" => PMC 'Lua::TestLex' { ... }
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'long comment' );
--[[
long comment
]]
1
--[===[
long comment
]===]
CODE
Number:	1
"past" => PMC 'Lua::TestLex' { ... }
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

