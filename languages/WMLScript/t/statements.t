#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/statements.t - WMLScript Statements

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/statements.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 3;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'for');
extern function main()
{
    var sum = 0;
    for (var i = 1; i < 5; i++) {
        Console.println(i);
        sum += i;
    }
    Console.println("Sum: " + sum);
}
CODE
1
2
3
4
Sum: 10
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'for break');
extern function main()
{
    var sum = 0;
    for (var i = 1; i < 10; i++) {
        Console.println(i);
        sum += i;
        if (sum >= 10) break;
    }
    Console.println("Sum: " + sum);
}
CODE
1
2
3
4
Sum: 10
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'while', cflags => '-On');
extern function main()
{
    var sum = 0;
    var i = 5;
    while (--i) {
        Console.println(i);
        sum += i;
    }
    Console.println("Sum: " + sum);
}
CODE
4
3
2
1
Sum: 10
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

