# $Id$

package Parrot::Test::Bc::Antlr3;

use strict;

use base 'Parrot::Test::Bc';

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_antlr3.out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.bc', $count );
    my $pir_fn  = Parrot::Test::per_test( '_antlr3.pir', $count );

    return ( "java Bc languages/${lang_fn} languages/${pir_fn}",
             "$self->{parrot} languages/${pir_fn}" );
}
 

sub set_todo {
    my $self = shift;
    my ( $options ) = @_;

    if ( ! $options->{with_antlr3} ) {
        # XXX make this work
        # $self->{builder}->todo_skip( 'Not implemented with ANTLR3' );
    }

    return;
}
 

1;
