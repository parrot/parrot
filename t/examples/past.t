#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/examples/past.t - Test examples in F<examples/past>

=head1 SYNOPSIS

    % prove t/examples/past.t

=head1 DESCRIPTION

Test the examples in F<examples/past>.

=head1 SEE ALSO

F<t/examples/pir.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut


# Set up expected output for examples
my %expected = (
    '01-sub.pir'        =>  << 'END_EXPECTED',

.sub 'foo' 
    new $P10, .Integer
    assign $P10, 4
    clone $P10, $P10
    set_global "$a", $P10
    get_global $P11, "$a"
    new $P12, .Integer
    assign $P12, 1
    new $P13, .Undef
    add $P13, $P11, $P12
    clone $P13, $P13
    set_global "$b", $P13
    get_global $P14, "$b"
    $P15 = "say"($P14)
    .return ($P15)
.end
5
END_EXPECTED
    );

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/past/$example", $expected );
}
