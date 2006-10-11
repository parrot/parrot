#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/functions.t - WMLScript functions

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/functions.t

=head1 DESCRIPTION


=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'function call');
function f()
{
    Console.println("in");
}

extern function main()
{
    Console.println("out");
    f();
    Console.println("end");
}
CODE
out
in
end
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '1 arg');
function f(a)
{
    Console.println(a);
}

extern function main()
{
    f(20);
}
CODE
20
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '3 args');
function f(a, b, c)
{
    Console.println(a);
    Console.println(b);
    Console.println(c);
}

extern function main()
{
    f(10, 20, 30);
}
CODE
10
20
30
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'no return');
function f(a)
{
    Console.println(a);
}

extern function main()
{
    var ret;
    ret = f("text");
    Console.println(ret == "");
}
CODE
text
true
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'return');
function f(a)
{
    Console.println(a);
    return;
}

extern function main()
{
    var ret;
    ret = f("text");
    Console.println(ret == "");
}
CODE
text
true
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'return value');
function f(a)
{
    Console.println(a);
    return "ok";
}

extern function main()
{
    var ret;
    ret = f("text");
    Console.println(ret);
}
CODE
text
ok
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'passing by value');
function f(val)
{
    val += 20;
    Console.println(val);
}

extern function main()
{
    var a = 10;
    Console.println(a);
    f(a);
    Console.println(a);
}
CODE
10
30
10
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'recursive call');
function fact(n)
{
    if (n == 0) {
        return 1;
    }
    else {
        return n * fact(n - 1);
    }
}

extern function main()
{
    Console.println(fact(7));
}
CODE
5040
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


