# $Id$

package Parrot::Test::Bc::Antlr2;

use strict;

use base 'Parrot::Test::Bc';

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return $options->{with_past} ?
               Parrot::Test::per_test( '_antlr2.out', $count )
               :
               Parrot::Test::per_test( '_antlr2_no_past.out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.bc', $count );
    my $pir_fn  = $options->{with_past} ?
                    Parrot::Test::per_test( '_antlr2.pir', $count )
                    :
                    Parrot::Test::per_test( '_antlr2_no_past.pir', $count );

    return ( "python languages/bc/bc.py languages/${lang_fn}", 
             "$self->{parrot} languages/${pir_fn}" );
}
 
 

sub set_todo {
    my $self = shift;
    my ( $options ) = @_;

    return;
}
 
1;
