# $Id$

package Parrot::Test::Plumhead::Partridge;

# pragmata
use strict;
use warnings;

use base 'Parrot::Test::Plumhead';

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_partridge.out', $count );
}

# Use PHP on the command line
sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn        = Parrot::Test::per_test( '.php', $count );

    return "./parrot languages/plumhead/plumhead.pbc --variant partridge languages/${lang_fn}";
}
 
# never skip the reference implementation
sub skip_why {
    my $self = shift;
    my ( $options ) = @_;

    return 'partridge variant not implemented yet';
}
 
1;
