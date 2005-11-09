#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/pir.t - Test examples in F<examples/past>

=head1 SYNOPSIS

    % perl -Ilib t/examples/past.t

    % perl t/harness t/examples/past.t

=head1 DESCRIPTION

Test the examples in F<examples/past>.

=head1 TODO

Perhaps use Parrot::Test::run_command().

=head1 SEE ALSO

F<t/examples/pasm.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use Parrot::Test tests => 1;

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
