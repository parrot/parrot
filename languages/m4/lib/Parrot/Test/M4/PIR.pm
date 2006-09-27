# $Id$

package Parrot::Test::M4::PIR;

use strict;
use warnings;
use 5.006;

use base 'Parrot::Test::M4';
use Data::Dumper;

our $VERSION = 0.01;

sub get_out_fn {
    my $self = shift;
    my ($count) = @_;

    return Parrot::Test::per_test( '.pir_out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $path_to_parrot, $path_to_language, $count ) = @_;

    my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};
    my $lang_fn = Parrot::Test::per_test( '.m4', $count );

    return (
        join( ' ',
            File::Spec->join( $path_to_parrot,   $self->{parrot} ),
            File::Spec->join( $path_to_language, 'm4.pbc' ),
            $test_prog_args,
            $lang_fn )
    );
}

1;
