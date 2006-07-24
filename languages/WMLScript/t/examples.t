#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/examples.t - some WMLScript code examples

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/examples.t

=head1 DESCRIPTION

First tests in order to check infrastructure.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 4;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'hello world');
extern function main()
{
    Console.println("Hello World!");
}
CODE
Hello World!
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'another main', function => 'hello' );
extern function hello()
{
    Console.println("Hello World!");
}
CODE
Hello World!
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'with params', params => "abc def" );
extern function main(arg1, arg2)
{
    Console.println(arg1);
    Console.println(arg2);
}
CODE
abc
def
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'no optim', cflags => '-On');
extern function main()
{
    Console.println(1 + 2);
}
CODE
3
OUT

