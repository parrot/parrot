#! perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;
use Parrot::Config;


=head1 NAME

t/examples/pasm.t - Test examples in F<examples/pasm>

=head1 SYNOPSIS

	% prove t/examples/pasm.t

=head1 DESCRIPTION

Test the examples in F<examples/pasm>.

=head1 TODO

Put expected output into the example files.

=head1 SEE ALSO

F<t/examples/pir.t>

=cut


# Set up expected output for examples
my %expected
  = (

    'fact.pasm'        =>  << 'END_EXPECTED',
fact of 0 is: 1
fact of 1 is: 1
fact of 2 is: 2
fact of 3 is: 6
fact of 4 is: 24
fact of 5 is: 120
fact of 6 is: 720
END_EXPECTED

    'hello.pasm'        =>  << 'END_EXPECTED',
Hello World
END_EXPECTED

    'queens.pasm'        =>  << 'END_EXPECTED',
Making new board with 8 ranks and 8 files...
Board length is 64.
  +---+---+---+---+---+---+---+---+
8 |   | * | Q | * |   | * |   | * |
  +---+---+---+---+---+---+---+---+
7 | * |   | * |   | * | Q | * |   |
  +---+---+---+---+---+---+---+---+
6 |   | * |   | Q |   | * |   | * |
  +---+---+---+---+---+---+---+---+
5 | * | Q | * |   | * |   | * |   |
  +---+---+---+---+---+---+---+---+
4 |   | * |   | * |   | * |   | Q |
  +---+---+---+---+---+---+---+---+
3 | * |   | * |   | Q |   | * |   |
  +---+---+---+---+---+---+---+---+
2 |   | * |   | * |   | * | Q | * |
  +---+---+---+---+---+---+---+---+
1 | Q |   | * |   | * |   | * |   |
  +---+---+---+---+---+---+---+---+
    A   B   C   D   E   F   G   H  
END_EXPECTED

    'stack.pasm'        =>  << 'END_EXPECTED',
87654321098765432100123456789012345678998765432109876543210
END_EXPECTED

    'trace.pasm'        =>  << 'END_EXPECTED',
Howdy!
     4 print "There!\n"
There!
     6 trace 0
Partner!
END_EXPECTED

    'xml_parser.pasm'        =>  << 'END_EXPECTED',
Start xml version=1.0
Start top
Start inner foo=bar narf=poit
Start junk
Data Hello
Close junk
Start empty
Close empty
Close inner
Close top
END_EXPECTED

    );

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/pasm/$example", $expected );
}

TODO:
{
  local $TODO = 'nanoforth2.pasm not testable yet';
  fail( 'nanoforth2.pasm' );
};
