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

# A stub for future PAST-pm example
my %expected = ();

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/past/$example", $expected );
}

# 01-sub.pir prints PIR source code and the result 5
# Test with a regex, in order to avoid trailing whitespace
# and insignificant changes in generated PIR.
example_output_like( "examples/past/01-sub.pir", <<'OUTPUT' );
/ \A \s* \.sub .* foo.* 5 \s* \z/xms
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
