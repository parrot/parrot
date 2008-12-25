# $Id: PJS.pm 34192 2008-12-21 11:41:29Z bernhard $

# Copyright (C) 2008, The Perl Foundation.

package Parrot::Test::JS::PJS;

# pragmata
use strict;
use warnings;

use base 'Parrot::Test::JS';

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_pjs.out', $count );
}

# Use JS on the command line
sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.js', $count );
    $lang_fn =~ s!^js/!!; # fix for unified languages testing

    return "$self->{relpath}/parrot $self->{relpath}/languages/ecmascript/js.pbc ${lang_fn}";
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
