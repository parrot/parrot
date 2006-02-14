# $Id$

package Parrot::Test::M4::Gnu;

use strict;
use warnings;
use 5.008;

use base 'Parrot::Test::M4';

our $VERSION = 0.01;

sub get_out_fn {
    my $self = shift;
    my ( $count ) = @_;

    return Parrot::Test::per_test( '.gnu_out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count ) = @_;

    my $lang_fn        = Parrot::Test::per_test( '.m4', $count );
    my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};

    return ( "$ENV{PARROT_M4_TEST_PROG} $test_prog_args languages/${lang_fn}" );
}
 
 
1;
