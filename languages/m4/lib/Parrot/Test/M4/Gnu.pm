# $Id$

# Copyright (C) 2005-2007, The Perl Foundation.

package Parrot::Test::M4::Gnu;

use strict;
use warnings;

use base 'Parrot::Test::M4';

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

sub get_out_fn {
    my $self = shift;
    my ($count) = @_;

    return Parrot::Test::per_test( '.gnu_out', $count );
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
              $ENV{PARROT_M4_TEST_PROG},
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
