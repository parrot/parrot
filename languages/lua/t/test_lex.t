#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/test_lex.t - Lua lexicography test

=head1 SYNOPSIS

    % perl t/test_lex.t

=head1 DESCRIPTION

Tests Lua lexicograaphy
(implemented in F<languages/lua/test_lex.pir>).

See "Lua 5.1 Reference Manual", section 2.1 "Lexical Conventions",
L<http://www.lua.org/manual/5.1/manual.html#2.1>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
if ( $test_prog eq 'lua' || $test_prog eq 'luac.pl' ) {
    plan skip_all => "parrot only";
}
else {
    plan tests => 23;
}

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'hello' );
print("hello")
CODE
Name:	print
punct:	(
String:	hello
punct:	)
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'name' );
i       j       i10     _ij     _
aSomewhatLongName       _INPUT
CODE
Name:	i
Name:	j
Name:	i10
Name:	_ij
Name:	_
Name:	aSomewhatLongName
Name:	_INPUT
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
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'not keyword' );
format      -- not for
doit        -- not do
CODE
Name:	format
Name:	doit
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
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'unfinished string' );
print "unfinished string
CODE
/^[^:]+:1: unfinished string near '"?unfinished string'/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'string with escape sequence too large' );
print "escape\333sequence"
CODE
/^[^:]+:1: escape sequence too large near '"?escape/
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
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'invalid long string delimiter' );
print [===+ string ]===]
CODE
/^[^:]+:1: invalid long string delimiter near '\[==='/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'unfinished string' );
print [[unfinished long string

CODE
/^[^:]+:1: unfinished long string/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'nested long string' );
print [[ long string [[ nested ]] ]]

CODE
/^[^:]+:1: nesting of \[\[\.\.\.\]\] is deprecated near '\[\[ long string \[\['/
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
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'malformed number' );
0x1Bh
CODE
/^[^:]+:1: malformed number near '0x1Bh'/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'malformed number' );
1.2.34
CODE
/^[^:]+:1: malformed number near '1.2.34'/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'malformed number' );
.2A
CODE
/^[^:]+:1: malformed number near '.2A'/
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'comment' );
-- comment
1   -- comment
2
CODE
Number:	1
Number:	2
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
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'not long comment' );
--[[
    no action (comment)
--]]
1
---[[
    active
--]]
CODE
Number:	1
Name:	active
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'unfinished long comment' );
 --[[unfinished long comment

CODE
/^[^:]+:1: unfinished long comment/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'nested long comment' );
--[[ long comment [[ nested ]] ]]

CODE
/^[^:]+:1: nesting of \[\[\.\.\.\]\] is deprecated near '\[\[ long comment \[\['/
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'syntax error' );
!!
CODE
/^[^:]+:1: syntax error/
OUT

language_output_is( 'Lua_lex', <<'CODE', <<'OUT', 'shebang' );
#!/usr/bin/env lua
1
CODE
Number:	1
OUT

language_output_like( 'Lua_lex', <<'CODE', <<'OUT', 'shebang misplaced' );

#!/usr/bin/env lua
1
CODE
/^[^:]+:1: syntax error/
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

