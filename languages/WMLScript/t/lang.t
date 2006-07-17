#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: lang.t 11478 2006-02-09 08:26:19Z fperrad $

=head1 NAME

t/lang.t - WMLScript Lang library

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/lang.t

=head1 DESCRIPTION

Tests WMLScript Lang Library
(implemented in F<languages/WMLScript/runtime/wmlslang.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 10;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.abs', cflags => '-On');
extern function main()
{
    var a = -3;
    var b = Lang.abs(a);

    Console.println(b);
    Console.println(typeof b);
}
CODE
3
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.abs', cflags => '-On');
extern function main()
{
    var a = Lang.abs(-3.14);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.abs("text");
    Console.println(typeof a);

    a = Lang.abs(true);
    Console.println(typeof a);

    a = Lang.abs(invalid);
    Console.println(typeof a);
}
CODE
3.14
1
4
4
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.parseInt', cflags => '-On');
extern function main()
{
    var i = Lang.parseInt("1234");
    Console.println(i);
    Console.println(typeof i);

    var j = Lang.parseInt(" 100 m/s");
    Console.println(j);
    Console.println(typeof j);
}
CODE
1234
0
100
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.parseInt', cflags => '-On');
extern function main()
{
    var a = Lang.parseInt(12);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.parseInt(3.14);
    Console.println(typeof a);

    a = Lang.parseInt(true);
    Console.println(typeof a);

    a = Lang.parseInt(invalid);
    Console.println(typeof a);
}
CODE
12
0
4
4
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.parseFloat', cflags => '-On');
extern function main()
{
    var a = Lang.parseFloat("123.7");
    Console.println(a);
    Console.println(typeof a);

    var b = Lang.parseFloat("  +7.34e2 Hz");
    Console.println(b);
    Console.println(typeof b);

    var c = Lang.parseFloat(" 70e-2 F");
    Console.println(c);
    Console.println(typeof c);

    var d = Lang.parseFloat("-.1 C");
    Console.println(d);
    Console.println(typeof d);

    var e = Lang.parseFloat(" 100 ");
    Console.println(e);
    Console.println(typeof e);

    var f = Lang.parseFloat("Number: 5.5");
    Console.println(typeof f);

    var g = Lang.parseFloat("7.3e meters");
    Console.println(typeof g);

    var h = Lang.parseFloat("7.3e- ms");
    Console.println(typeof h);
}
CODE
123.7
1
734
1
0.7
1
-0.1
1
100
1
4
4
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.parseFloat', cflags => '-On');
extern function main()
{
    var a = Lang.parseFloat(12);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.parseFloat(3.14);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.parseFloat(true);
    Console.println(typeof a);

    a = Lang.parseFloat(invalid);
    Console.println(typeof a);
}
CODE
12
1
3.14
1
4
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.isInt', cflags => '-On');
extern function main()
{
    var a = Lang.isInt(" -123");
    Console.println(a);

    var b = Lang.isInt(" 123.33");  // true ???
    Console.println(b);

    var c = Lang.isInt("string");
    Console.println(c);

    var d = Lang.isInt("#123");
    Console.println(d);

    var e = Lang.isInt(invalid);
    Console.println(typeof e);
}
CODE
true
false
false
false
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.isInt', cflags => '-On');
extern function main()
{
    var a = Lang.isInt(12);
    Console.println(a);

    a = Lang.isInt(3.14);
    Console.println(a);

    a = Lang.isInt(true);          
    Console.println(a);

    a = Lang.isInt(invalid);
    Console.println(typeof a);
}
CODE
true
false
false
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.isFloat', cflags => '-On');
extern function main()
{
    var a = Lang.isFloat(" -123");
    Console.println(a);

    var b = Lang.isFloat(" 123.33");
    Console.println(b);

    var c = Lang.isFloat("string");
    Console.println(c);

    var d = Lang.isFloat("#123.33");
    Console.println(d);

    var e = Lang.isInt(invalid);
    Console.println(typeof e);
}
CODE
true
true
false
false
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'Lang.isFloat', cflags => '-On');
extern function main()
{
    var a = Lang.isFloat(12);
    Console.println(a);

    a = Lang.isFloat(3.14);
    Console.println(a);

    a = Lang.isFloat(true);
    Console.println(a);

    a = Lang.isFloat(invalid);
    Console.println(typeof a);
}
CODE
true
true
false
4
OUT

