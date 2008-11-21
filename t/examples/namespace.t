#!perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Parrot::Test tests => 1;

=head1 NAME

t/examples/namespace.t - Test examples in F<examples/namespace>

=head1 SYNOPSIS

    % prove t/examples/namespace.t

=head1 DESCRIPTION

Test the examples in F<examples/namespace>.

=head1 SEE ALSO

F<t/examples/pir.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut

# Set up expected output for examples

# cannot test the exact result, just adding one method somewhere
# changes all. Also namespaces are hashes. While we preserve
# insert order, we do not gurantee any specific order.
# test the name of the 2 toplevel names,  parrot is using
my %expected = (
    'namespace_dump.pir' => << 'END_EXPECTED',
/^parrot.*
^MULTI\s=>\sMULTI/sm
END_EXPECTED
);

while ( my ( $example, $expected ) = each %expected ) {
    example_output_like( "examples/namespace/$example", $expected );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
