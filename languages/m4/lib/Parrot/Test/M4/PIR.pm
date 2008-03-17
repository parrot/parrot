# $Id$

# Copyright (C) 2005-2007, The Perl Foundation.

package Parrot::Test::M4::PIR;

use strict;
use warnings;

use base 'Parrot::Test::M4';
use Data::Dumper;

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

sub get_out_fn {
    my $self = shift;
    my ($count) = @_;

    return Parrot::Test::per_test( '.pir_out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.m4', $count );
    ( undef, undef, my $current_dir ) = File::Spec->splitpath( Cwd::getcwd() );
    if ( $current_dir eq 'm4' ) {
        $lang_fn = File::Spec->catdir( 'm4', $lang_fn );
    }

    my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};

    return
        join( ' ',
              $self->{parrot},
              File::Spec->join( qw( languages m4 m4.pbc ) ),
              $test_prog_args,
              File::Spec->join( 'languages', $lang_fn ) );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
