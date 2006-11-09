# $Id$

package Parrot::Test::Plumhead::Phc2Past;

# pragmata
use strict;
use warnings;

use base 'Parrot::Test::Plumhead';

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_php.out', $count );
}

# Use PHP on the command line
sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn        = Parrot::Test::per_test( '.php', $count );
    my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';

    return ( "./parrot languages/plumhead/plumhead.pir ${test_prog_args} languages/${lang_fn}" );
}
 
# never skip the reference implementation
sub skip_why {
    my $self = shift;
    my ( $options ) = @_;

    return;
}
 
1;
