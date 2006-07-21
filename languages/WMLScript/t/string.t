#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: strings.t 11446 2006-02-06 14:07:49Z fperrad $

=head1 NAME

t/string.t - WMLScript string & conversion

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/string.t

=head1 DESCRIPTION

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 20;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '! ""', cflags => '-On');
extern function main()
{
    var a = ! "";
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '! "text"', cflags => '-On');
extern function main()
{
    var a = ! "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
false
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '~ "text"', cflags => '-On');
extern function main()
{
    var a = ~ "text";
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '~ "2"', cflags => '-On');
extern function main()
{
    var a = ~ "2";
    Console.println(a);
    Console.println(typeof a);
}
CODE
-3
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '- "text"', cflags => '-On');
extern function main()
{
    var a = - "text";
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '- " 12 "', cflags => '-On');
extern function main()
{
    var a = - " 12 ";
    Console.println(a);
    Console.println(typeof a);
}
CODE
-12
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '- " 3.14 "', cflags => '-On');
extern function main()
{
    var a = - " 3.14 ";
    Console.println(a);
    Console.println(typeof a);
}
CODE
-3.14
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '++', cflags => '-On');
extern function main()
{
    var a = "text";
    a ++;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '--', cflags => '-On');
extern function main()
{
    var a = "text";
    a --;
    Console.println(typeof a);
}
CODE
4
OUT


language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"ABC" == "ABC"', cflags => '-On');
extern function main()
{
    var a = "ABC" == "ABC";
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"ABC" != "123"', cflags => '-On');
extern function main()
{
    var a = "ABC" != "123";
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"123" == 123', cflags => '-On');
extern function main()
{
    var a = "123" == 123;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"123" != 123.0', cflags => '-On');
extern function main()
{
    var a = "123" != 123.4;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"123" != true', cflags => '-On');
extern function main()
{
    var a = "123" != true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"text" == invalid', cflags => '-On');
extern function main()
{
    var a = "text" == invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"text" <= "TEXT"', cflags => '-On');
extern function main()
{
    var a = "text" <= "TEXT";
    Console.println(a);
    Console.println(typeof a);
}
CODE
false
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"text" < 123', cflags => '-On');
extern function main()
{
    var a = "text" < 123;
    Console.println(a);
    Console.println(typeof a);
}
CODE
false
3
OUT


language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"text" >= true', cflags => '-On');
extern function main()
{
    var a = "text" >= true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
false
3
OUT


language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"text" > -3.14', cflags => '-On');
extern function main()
{
    var a = "text" > -3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '"text" < invalid', cflags => '-On');
extern function main()
{
    var a = "text" < invalid;
    Console.println(typeof a);
}
CODE
4
OUT

