# $Id$

package Parrot::Test::Plumhead::PHP;

# pragmata
use strict;
use warnings;

use base 'Parrot::Test::Plumhead';

sub get_out_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '_php.out', $count );
}

# Use PHP on the command line
sub get_test_prog {
    my $self = shift;
    my ( $count, $options ) = @_;

    my $lang_fn = Parrot::Test::per_test( '.php', $count );
    $ENV{SCRIPT_FILENAME} = "languages/$lang_fn";
    return ('php-cgi -q ');
}

# never skip the reference implementation
sub skip_why {
    my $self = shift;
    my ($options) = @_;

    return;
}

1;
