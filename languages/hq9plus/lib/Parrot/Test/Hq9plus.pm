# $Id$

# Copyright (C) 2005-2008, The Perl Foundation.

package Parrot::Test::Hq9plus;

use strict;
use warnings;

use Data::Dumper;
use File::Basename;

use Parrot::Test;

=head1 NAME

Parrot::Test::Hq9plus - Testing routines specific to 'HQ9plus'.

=head1 DESCRIPTION

Call hq9plus.pbc

=cut

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

=head1 METHODS

=head2 new

=cut
sub new {
    return bless {};
}

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.HQ9plus', $count );
    ( undef, undef, my $current_dir ) = File::Spec->splitpath( Cwd::getcwd() );
    if ( $current_dir eq 'languages' ) {
        $lang_fn = File::Spec->catdir( '..', $lang_fn );
    }

    my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};

    return
        join( ' ',
              "../../$self->{parrot}",
              'hq9plus.pbc',
              $test_prog_args,
              $lang_fn );
}

sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return "$self->{relpath}/languages/hq9plus";
}

sub get_lang_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.HQ9plus', $count );
}

# never skip
sub skip_why {
    my $self = shift;
    my ($options) = @_;

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
