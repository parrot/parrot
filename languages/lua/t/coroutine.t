#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: coroutine.t  $

=head1 NAME

t/coroutine.t - Lua coroutines 

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/coroutine.t

=head1 DESCRIPTION

See "Lua 5.0 Reference Manual", section 2.10 "Coroutines".

See "Programming in Lua", section 9 "Coroutines". 

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

TODO: {
local $TODO = 'coroutine';

language_output_is( 'lua', <<'CODE', <<'OUT', 'foo1' );
function foo1 (a)
    print("foo", a)
    return coroutine.yield(2*a)
end

co = coroutine.create(function (a,b)
        print("co-body", a, b)
        local r = foo1(a+1)
        print("co-body", r)
        local r, s = coroutine.yield(a+b, a-b)
        print("co-body", r, s)
        return b, "end"
    end)

a, b = coroutine.resume(co, 1, 10)
print("main", a, b)
a, b, c = coroutine.resume(co, "r")
print("main", a, b, c)
a, b, c = coroutine.resume(co, "x", "y")
print("main", a, b, c)
a, b = coroutine.resume(co, "x", "y")
print("main", a, b)
CODE
co-body	1	10
foo	2
main	true	4
co-body	r
main	true	11	-9
co-body	x	y
main	true	10	end
main	false	cannot resume dead coroutine
OUT
}

language_output_like( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function ()
        print("hi")
    end)
    
print(co)    
CODE
/(thread: [0-9A-Fa-f]{8}|\s*)/
OUT


TODO: {
local $TODO = 'coroutine';

language_output_is( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function ()
        print("hi")
    end)
    
print(coroutine.status(co))
coroutine.resume(co)    
print(coroutine.status(co))
CODE
suspended
hi
dead
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function ()
        for i=1,10 do
            print("co", i)
            coroutine.yield()
        end
    end)
    
coroutine.resume(co)    
print(coroutine.status(co))
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
coroutine.resume(co)    
print(coroutine.resume(co))
CODE
co	1
suspended
co	2
co	3
co	4
co	5
co	6
co	7
co	8
co	9
co	10
false	cannot resume dead coroutine
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function (a,b,c)
        print("co", a,b,c)
    end)
    
coroutine.resume(co, 1,2,3)    
CODE
co	1	2	3
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function (a,b)
        coroutine.yield(a + b, a - b)
    end)
    
print(coroutine.resume(co, 20, 10))    
CODE
true	30	10
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function ()
        print("co", coroutine.yield())
    end)
    
coroutine.resume(co)    
coroutine.resume(co, 4, 5)    
CODE
co	4	5
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'basics' );
co = coroutine.create(function ()
        return 6, 7
    end)
    
print(coroutine.resume(co))    
CODE
true	6	7
OUT
}

