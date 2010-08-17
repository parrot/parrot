#!perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Parrot::Test tests => 2;

=head1 NAME

t/examples/past.t - Test examples in F<examples/past>

=head1 SYNOPSIS

    % prove t/examples/past.t
    % prove -v t/examples/past.t

=head1 DESCRIPTION

Test the examples in F<examples/past>.

=head1 SEE ALSO

F<t/examples/pir.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut

# Set up expected output for examples

# A stub for future PAST examples
my %expected = (
    '01-sub.pir'        => "5\n",
    'four_plus_one.pir' => "5\n",
);

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/past/$example", $expected );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
