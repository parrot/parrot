# $Id$

# Copyright (C) 2008, The Perl Foundation.

package Parrot::Test::JS::SpiderMonkey;

# pragmata
use strict;
use warnings;

use base 'Parrot::Test::JS';

# Generate output_is(), output_isnt() and output_like() in current package.
Parrot::Test::generate_languages_functions();

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_js.out', $count );
}

# Use SpiderMonkey on the command line
sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.js', $count );

    return "js $lang_fn";
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
