#! perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;


=head1 NAME

t/examples/pir.t - Test examples in F<examples/past>

=head1 SYNOPSIS

	% prove t/examples/past.t

=head1 DESCRIPTION

Test the examples in F<examples/past>.

=head1 SEE ALSO

F<t/examples/pasm.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut


# Set up expected output for examples
my %expected
  = (
    'hello.past'        =>  << 'END_EXPECTED',
Hello PAST
END_EXPECTED
    );

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/past/$example", $expected );
}
