# $Id$

package Parrot::Test::Bc::Posix;

use strict;

use base 'Parrot::Test::Bc';

sub get_out_fn {
    my $self = shift;
    my ( $count ) = @_;

    return Parrot::Test::per_test( '.posix_out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count ) = @_;

    my $lang_fn        = Parrot::Test::per_test( '.bc', $count );
    my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';

    return ( "$ENV{PARROT_BC_TEST_PROG} ${test_prog_args} languages/${lang_fn}" );
}
 
1;
