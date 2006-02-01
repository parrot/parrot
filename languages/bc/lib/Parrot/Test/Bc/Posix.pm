# $Id$

package Parrot::Test::Bc::Posix;

use strict;

use base 'Parrot::Test::Bc';

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_posix.out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn        = Parrot::Test::per_test( '.bc', $count );
    my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';

    my $posix_bc = ($^O =~ /MSWin32/) ? 
                     'bc'
                     :
                     'bc --standard --quiet';

    return ( "$posix_bc ${test_prog_args} languages/${lang_fn}" );
}
 
 

sub skip_why {
    my $self = shift;
    my ( $options ) = @_;

    return;
}
 
1;
