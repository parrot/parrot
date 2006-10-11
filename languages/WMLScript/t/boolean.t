#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/boolean.t - WMLScript boolean & conversion

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/boolean.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 40;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '! false', cflags => '-On');
extern function main()
{
    var a = ! false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '~ false', cflags => '-On');
extern function main()
{
    var a = ~ false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
-1
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '- true', cflags => '-On');
extern function main()
{
    var a = - true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
-1
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '++', cflags => '-On');
extern function main()
{
    var a = true;
    a ++;
    Console.println(a);
    Console.println(typeof a);
}
CODE
2
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '--', cflags => '-On');
extern function main()
{
    var a = false;
    a --;
    Console.println(a);
    Console.println(typeof a);
}
CODE
-1
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true << 2', cflags => '-On');
extern function main()
{
    var a = true << 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
4
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true << true', cflags => '-On');
extern function main()
{
    var a = true << true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
2
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true >> 1', cflags => '-On');
extern function main()
{
    var a = true >> 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true >> "text"', cflags => '-On');
extern function main()
{
    var a = true >> "text";
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true >>> 2', cflags => '-On');
extern function main()
{
    var a =  true >>> 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true >>> "2"', cflags => '-On');
extern function main()
{
    var a =  true >>> "2";
    Console.println(a);
    Console.println(typeof a);
}
CODE
0
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true & 1', cflags => '-On');
extern function main()
{
    var a = true & 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
1
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true & 2.0', cflags => '-On');
extern function main()
{
    var a = true & 2.0;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true ^ 2', cflags => '-On');
extern function main()
{
    var a = true ^ 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
3
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true ^ invalid', cflags => '-On');
extern function main()
{
    var a = true ^ invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true | 6', cflags => '-On');
extern function main()
{
    var a = true | 6;
    Console.println(a);
    Console.println(typeof a);
}
CODE
7
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true div 2', cflags => '-On');
extern function main()
{
    var a = true div 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true div 0', cflags => '-On');
extern function main()
{
    var a = true div 0;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true % 2', cflags => '-On');
extern function main()
{
    var a =  true % 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
1
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true div 0', cflags => '-On');
extern function main()
{
    var a = true % 0;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true * 3', cflags => '-On');
extern function main()
{
    var a = true * 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
3
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true * 3.14', cflags => '-On');
extern function main()
{
    var a = true * 3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
3.14
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true * "text"', cflags => '-On');
extern function main()
{
    var a = true * "text";
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true / 2', cflags => '-On');
extern function main()
{
    var a = true / 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0.5
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true / 2.0', cflags => '-On');
extern function main()
{
    var a = true / 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0.5
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true - 3', cflags => '-On');
extern function main()
{
    var a = true - 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
-2
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true - 1.5', cflags => '-On');
extern function main()
{
    var a = true - 1.5;
    Console.println(a);
    Console.println(typeof a);
}
CODE
-0.5
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'false - invalid', cflags => '-On');
extern function main()
{
    var a = false - invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true + 3', cflags => '-On');
extern function main()
{
    var a = true + 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
4
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true + "text"', cflags => '-On');
extern function main()
{
    var a = true + "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
truetext
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true == true', cflags => '-On');
extern function main()
{
    var a = true == true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true != false', cflags => '-On');
extern function main()
{
    var a = true != false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true == 1', cflags => '-On');
extern function main()
{
    var a = true == 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'false == 0.0', cflags => '-On');
extern function main()
{
    var a = false == 0.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true == "true"', cflags => '-On');
extern function main()
{
    var a = true == "true";
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true != invalid', cflags => '-On');
extern function main()
{
    var a = true != invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true <= false', cflags => '-On');
extern function main()
{
    var a = true <= false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
false
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true < -3', cflags => '-On');
extern function main()
{
    var a = true <= -3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
false
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true >= "text"', cflags => '-On');
extern function main()
{
    var a = true >= "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'true < invalid', cflags => '-On');
extern function main()
{
    var a = true <= invalid;
    Console.println(typeof a);
}
CODE
4
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

