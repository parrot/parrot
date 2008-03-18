# $Id$
# Copyright (C) 2001-2007, The Perl Foundation.

package Parrot::Test::Scheme;

# pragmata
use strict;
use warnings;
use 5.008;

use Parrot::Config;
use Parrot::Test;

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

sub new {
    my $class = shift;

    return bless {}, $class;
}


sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return $self->{relpath};
}

sub get_lang_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.scheme', $count );
}


sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.out', $count );
}

sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.scheme', $count );
    my $pir_fn  = Parrot::Test::per_test( '.pir', $count );

    #return "mzscheme -r languages/$lang_fn";
    return "$PConfig{perl} languages/scheme/schemec languages/$lang_fn > languages/$pir_fn && $self->{parrot} languages/$pir_fn";
}

# never skip the reference implementation
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
