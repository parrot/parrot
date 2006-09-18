#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: libstring.t 14550 2006-09-11 13:59:28Z fperrad $

=head1 NAME

t/libstring.t - WMLScript String library

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/libstring.t

=head1 DESCRIPTION

Tests WMLScript String Library
(implemented in F<languages/WMLScript/runtime/wmlsstring.pir>).

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 18;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.length');
extern function main()
{
    var a = "ABC";
    var b = String.length(a);
    Console.println(b);
    Console.println(typeof b);

    var c = String.length("");
    Console.println(c);
    Console.println(typeof c);

    var d = String.length(342);
    Console.println(d);
    Console.println(typeof d);
}
CODE
3
0
0
0
3
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.length');
extern function main()
{
    var b = String.length(3.14);
    Console.println(b);
    Console.println(typeof b);

    var c = String.length(false);
    Console.println(c);
    Console.println(typeof c);

    var d = String.length(invalid);
    Console.println(typeof d);
}
CODE
4
0
5
0
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.isEmpty');
extern function main()
{
    var a = "Hello";
    var b = "";
    var c = String.isEmpty(a);
    Console.println(c);
    Console.println(typeof c);

    var d = String.isEmpty(b);
    Console.println(d);
    Console.println(typeof d);

    var e = String.isEmpty(true);
    Console.println(e);
    Console.println(typeof e);
}
CODE
false
3
true
3
false
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.isEmpty');
extern function main()
{
    var b = String.isEmpty(0);
    Console.println(b);
    Console.println(typeof b);

    var c = String.isEmpty(3.14);
    Console.println(c);
    Console.println(typeof c);

    var d = String.isEmpty(invalid);
    Console.println(typeof d);
}
CODE
false
3
false
3
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.charAt');
extern function main()
{
    var a = "My name is Joe";
    var b = String.charAt(a, 0);
    Console.println(b);
    Console.println(typeof b);

    var c = String.charAt(a, 100);
    Console.println(c);
    Console.println(typeof c);

    var d = String.charAt(34, 0);
    Console.println(d);
    Console.println(typeof d);

    var e = String.charAt(a, "first");
    Console.println(typeof e);
}
CODE
M
2

2
3
2
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.charAt');
extern function main()
{
    var a = "string";
    var b = String.charAt(a, -2);
    Console.println(b);
    Console.println(typeof b);

    var c = String.charAt(a, 3.14);
    Console.println(c);
    Console.println(typeof c);

    var d = String.charAt(a, true);
    Console.println(typeof d);

    var e = String.charAt(a, invalid);
    Console.println(typeof e);
}
CODE

2
i
2
4
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.charAt');
extern function main()
{
    var b = String.charAt(true, 0);
    Console.println(b);
    Console.println(typeof b);

    var c = String.charAt(3.14, 1);
    Console.println(c);
    Console.println(typeof c);

    var f = String.charAt(invalid, 1);
    Console.println(typeof f);
}
CODE
t
2
.
2
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.subString');
extern function main()
{
    var a = "ABCD";
    var b = String.subString(a, 1, 2);
    Console.println(b);
    Console.println(typeof b);

    var c = String.subString(a, 2, 5);
    Console.println(c);
    Console.println(typeof c);

    var d = String.subString(1234, 0, 2);
    Console.println(d);
    Console.println(typeof d);
}
CODE
BC
2
CD
2
12
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.subString');
extern function main()
{
    var a = "ABCD";
    var b = String.subString(a, -1, 2);
    Console.println(b);
    Console.println(typeof b);

    var c = String.subString(a, 10, 2);
    Console.println(c);
    Console.println(typeof c);

    var d = String.subString(a, 0, 0);
    Console.println(d);
    Console.println(typeof d);

    var e = String.subString(a, 0, -2);
    Console.println(e);
    Console.println(typeof e);
}
CODE
AB
2

2

2

2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.find');
extern function main()
{
    var a = "abcde";
    var b = String.find(a, "cd");
    Console.println(b);
    Console.println(typeof b);

    var c = String.find(34.2, "de");
    Console.println(c);
    Console.println(typeof c);

    var d = String.find(a, "qz");
    Console.println(d);
    Console.println(typeof d);

    var e = String.find(34, "3");
    Console.println(e);
    Console.println(typeof e);

    var f = String.find(a, "");
    Console.println(typeof f);
}
CODE
2
0
-1
0
-1
0
0
0
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.replace');
extern function main()
{
    var a = "Hello Joe. What is up Joe?";
    var newName = "Don";
    var oldName = "Joe";
    var c = String.replace(a, oldName, newName);
    Console.println(c);
    Console.println(typeof c);

    var d = String.replace(a, newName, oldName);
    Console.println(d);
    Console.println(typeof d);
}
CODE
Hello Don. What is up Don?
2
Hello Joe. What is up Joe?
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.replace');
extern function main()
{
    var a = "Hello Joe. What is up Joe?";
    var newName = "Don";
    var c = String.replace(a, "", newName);
    Console.println(typeof c);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.elements');
extern function main()
{
    var a = "My name is Joe; Age 50;";
    var b = String.elements(a, " ");
    Console.println(b);
    Console.println(typeof b);

    var c = String.elements(a, ";");
    Console.println(c);
    Console.println(typeof c);

    var d = String.elements("", ";");
    Console.println(d);
    Console.println(typeof d);

    var e = String.elements("a", ";");
    Console.println(e);
    Console.println(typeof e);

    var f = String.elements(";", ";");
    Console.println(f);
    Console.println(typeof f);

    var g = String.elements(";;,;", ";,");
    Console.println(g);
    Console.println(typeof g);
}
CODE
6
0
3
0
1
0
1
0
2
0
4
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.elements');
extern function main()
{
    var a = "My name is Joe; Age 50;";
    var b = String.elements(a, "");
    Console.println(typeof b);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.elementAt');
extern function main()
{
    var a = "My name is Joe; Age 50;";
    var b = String.elementAt(a, 0, " ");
    Console.println(b);
    Console.println(typeof b);

    var c = String.elementAt(a, 14, ";");
    Console.println(c);
    Console.println(typeof c);

    var d = String.elementAt(a, 1, ";");
    Console.println(d);
    Console.println(typeof d);
}
CODE
My
2

2
 Age 50
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.compare');
extern function main()
{
    var a = "Hello";
    var b = "Hello";
    var c = String.compare(a, b);
    Console.println(c);
    Console.println(typeof c);

    var d = String.compare("Bye", "Jon");
    Console.println(d);
    Console.println(typeof d);

    var e = String.compare("Jon", "Bye");
    Console.println(e);
    Console.println(typeof e);
}
CODE
0
0
-1
0
1
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.toString');
extern function main()
{
    var a = String.toString(12);
    Console.println(a);
    Console.println(typeof a);

    var b = String.toString(true);
    Console.println(b);
    Console.println(typeof b);
}
CODE
12
2
true
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'String.toString');
extern function main()
{
    var a = String.toString("str");
    Console.println(a);
    Console.println(typeof a);

    var b = String.toString("");
    Console.println(b);
    Console.println(typeof b);

    var c = String.toString(3.14);
    Console.println(c);
    Console.println(typeof c);

    var d = String.toString(invalid);
    Console.println(d);
    Console.println(typeof d);
}
CODE
str
2

2
3.14
2
invalid
2
OUT

