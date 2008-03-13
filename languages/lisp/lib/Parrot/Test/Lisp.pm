# $Id$

package Parrot::Test::Lisp;

# Copyright (C) 2007, The Perl Foundation.

use strict;
use warnings;

use File::Basename;

=head1 NAME

Parrot::Test::Lisp -- testing routines for languages/lisp

This is largely a copy of Parrot::Test::Punie.

=cut

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

sub new {
    return bless {};
}


sub get_lang_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return File::Spec->rel2abs(Parrot::Test::per_test( '.l',  $count ));
}

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return File::Spec->rel2abs(Parrot::Test::per_test( '.out', $count ));
}

sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return "$self->{relpath}/languages/lisp";
}

# never skip
sub skip_why {
    my $self = shift;
    my ($options) = @_;

    return;
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.l', $count );
    ( undef, undef, my $current_dir ) = File::Spec->splitpath( Cwd::getcwd() );
    if ( $current_dir eq 'languages' ) {
        $lang_fn = File::Spec->catdir( '..', $lang_fn );
    }

    my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};

    return
        join( ' ',
              "../../$self->{parrot}",
              'lisp.pbc',
              $test_prog_args,
              $lang_fn );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
