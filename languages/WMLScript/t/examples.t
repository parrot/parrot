#! perl
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
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 5;
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

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'sieve', function => 'sieve');
/*
 *  Eratosthenes Sieve prime number calculation
 */
extern function sieve ()
{
    var MAX_PRIME = 17;
    var i;
    var count = 0;
    var flag = 0;
    for (i = 0; i < MAX_PRIME; i++) {
        flag |= (1 << i);   // set
    }
    for (i = 0; i < MAX_PRIME; i++) {
        if (flag & (1 << i)) {  // test
            var prime = i + i + 3;
            var k = i + prime;
            while (k < MAX_PRIME) {
                flag &= ~(1 << k);  // clear
                k += prime;
            }
            count++;
            Console.println(" prime " + count + " = " + prime);
        }
    }
    Console.println("");
    Console.println(count + " primes.");
}
CODE
 prime 1 = 3
 prime 2 = 5
 prime 3 = 7
 prime 4 = 11
 prime 5 = 13
 prime 6 = 17
 prime 7 = 19
 prime 8 = 23
 prime 9 = 29
 prime 10 = 31

10 primes.
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

