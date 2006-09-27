#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/invalid.t - WMLScript invalid & conversion

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/invalid.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 23;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '! invalid', cflags => '-On');
extern function main()
{
    var a = ! invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '~ invalid', cflags => '-On');
extern function main()
{
    var a = ~ invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '- invalid', cflags => '-On');
extern function main()
{
    var a = - invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '++', cflags => '-On');
extern function main()
{
    var a = invalid;
    a ++;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '--', cflags => '-On');
extern function main()
{
    var a = invalid;
    a --;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid << 2', cflags => '-On');
extern function main()
{
    var a = invalid << 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid >> 3', cflags => '-On');
extern function main()
{
    var a = invalid >> 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid >>> 4', cflags => '-On');
extern function main()
{
    var a = invalid >>> 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid & 2', cflags => '-On');
extern function main()
{
    var a = invalid & 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid ^ 3', cflags => '-On');
extern function main()
{
    var a = invalid ^ 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid | 4', cflags => '-On');
extern function main()
{
    var a = invalid | 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid % 5', cflags => '-On');
extern function main()
{
    var a = invalid % 5;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid div 6', cflags => '-On');
extern function main()
{
    var a = invalid div 6;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid * 2', cflags => '-On');
extern function main()
{
    var a = invalid * 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid / 3', cflags => '-On');
extern function main()
{
    var a = invalid / 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid - 4', cflags => '-On');
extern function main()
{
    var a = invalid - 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid + 5', cflags => '-On');
extern function main()
{
    var a = invalid + 5;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid == 1', cflags => '-On');
extern function main()
{
    var a = invalid == 1;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid != 2', cflags => '-On');
extern function main()
{
    var a = invalid != 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid <= 3', cflags => '-On');
extern function main()
{
    var a = invalid <= 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid < 4', cflags => '-On');
extern function main()
{
    var a = invalid < 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid >= 5', cflags => '-On');
extern function main()
{
    var a = invalid >= 5;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid > 6', cflags => '-On');
extern function main()
{
    var a = invalid > 6;
    Console.println(typeof a);
}
CODE
4
OUT

