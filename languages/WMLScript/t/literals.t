#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/literals.t - WMLScript literals

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/literals.t

=head1 DESCRIPTION

See "WMLScript Specification", section 6.1.5 "Literals".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 9;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'decimal integer', cflags => '-On');
extern function main()
{
    var a = 0;
    Console.println(a);
    Console.println(typeof a);
    a = -123;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0
0
-123
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'hexadecimal integer', cflags => '-On');
extern function main()
{
    var a = 0xFE;
    Console.println(a);
    Console.println(typeof a);
}
CODE
254
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'octal integer', cflags => '-On');
extern function main()
{
    var a = 033;
    Console.println(a);
    Console.println(typeof a);
}
CODE
27
0
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'floating-point', cflags => '-On');
extern function main()
{
    var a = 0.0;
    Console.println(a);
    Console.println(typeof a);
    a = 2.0;
    Console.println(a);
    Console.println(typeof a);
    a = -1.23;
    Console.println(a);
    Console.println(typeof a);
}
CODE
0
1
2
1
-1.23
1
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'string', cflags => '-On');
extern function main()
{
    var a = "Example";
    Console.println(a);
    Console.println(typeof a);
}
CODE
Example
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'string with escape sequence', cflags => '-On');
extern function main()
{
    var a = "Quote: \"";
    Console.println(a);
    Console.println(typeof a);
    a = 'Apos: \'';
    Console.println(a);
    Console.println(typeof a);
    a = "\tTab";
    Console.println(a);
    Console.println(typeof a);
}
CODE
Quote: "
2
Apos: '
2
	Tab
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'unicode string', cflags => '-On');
extern function main()
{
    var a = "Fran\u00e7ois";
    Console.println(a);
    Console.println(typeof a);
    a = "20 \u20AC";
    Console.println(a);
    Console.println(typeof a);
}
CODE
François
2
20 €
2
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'boolean', cflags => '-On');
extern function main()
{
    var a = true;
    Console.println(a);
    Console.println(typeof a);
    a = false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
true
3
false
3
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid', cflags => '-On');
extern function main()
{
    var a = invalid;
    Console.println(String.toString(a));
    Console.println(typeof a);
}
CODE
invalid
4
OUT

