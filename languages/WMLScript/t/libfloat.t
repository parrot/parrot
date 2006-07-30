#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/libfloat.t - WMLScript Float library

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/libfloat.t

=head1 DESCRIPTION

Tests WMLScript Float Library
(implemented in F<languages/WMLScript/runtime/wmlsfloat.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.int', cflags => '-On');  # fix me
extern function main()
{
    var a = 3.14;
    var b = Float.int(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.int(-2.8);
    Console.println(c);
    Console.println(typeof c);
}
CODE
3
0
-2
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.floor', cflags => '-On');    # fix me
extern function main()
{
    var a = 3.14;
    var b = Float.floor(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.floor(-2.8);
    Console.println(c);
    Console.println(typeof c);
}
CODE
3
0
-3
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.ceil', cflags => '-On'); # fix me
extern function main()
{
    var a = 3.14;
    var b = Float.ceil(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.ceil(-2.8);
    Console.println(c);
    Console.println(typeof c);
}
CODE
4
0
-2
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.pow', cflags => '-On');  # fix me
extern function main()
{
    var a = 3;
    var b = Float.pow(a,2);
    Console.println(b);
    Console.println(typeof b);
}
CODE
9
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.round', cflags => '-On');    # fix me
extern function main()
{
    var a = Float.round(3.5);
    Console.println(a);
    Console.println(typeof a);

    var b = Float.round(-3.5);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.round(0.5);
    Console.println(c);
    Console.println(typeof c);

    var d = Float.round(-0.5);
    Console.println(d);
    Console.println(typeof d);
}
CODE
4
0
-3
0
1
0
0
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.sqrt', cflags => '-On'); # fix me
extern function main()
{
    var a = 4;
    var b = Float.sqrt(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.sqrt(5);
    Console.println(c);
    Console.println(typeof c);

    var d = Float.sqrt(-1);
    Console.println(typeof d);
}
CODE
2
1
2.23607
1
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.maxFloat');
extern function main()
{
    var a = Float.maxFloat();
    Console.println(a);
    Console.println(typeof a);
}
CODE
3.40282e+38
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Float.minFloat');
extern function main()
{
    var a = Float.minFloat();
    Console.println(a);
    Console.println(typeof a);
}
CODE
1.17549e-38
1
OUT


