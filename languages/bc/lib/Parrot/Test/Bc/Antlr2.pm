# $Id$

package Parrot::Test::Bc::Antlr2;

use strict;

use base 'Parrot::Test::Bc';

sub get_out_fn {
    my $self = shift;
    my ( $count ) = @_;

    return Parrot::Test::per_test( '.antlr2_out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $with_past ) = @_;

    my $lang_fn        = Parrot::Test::per_test( '.bc', $count );
    my $pir_fn         = $with_past ?
                             Parrot::Test::per_test( '_past.pir', $count )
                             :
                             Parrot::Test::per_test( '.pir', $count );

    return ( "python languages/bc/bc.py languages/${lang_fn}", 
             "$self->{parrot} languages/${pir_fn}" );
}
 
1;
