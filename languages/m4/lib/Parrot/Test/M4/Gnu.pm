# $Id$

package Parrot::Test::M4::Gnu;

use strict;
use warnings;
use 5.006;

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
    my ( $path_to_parrot, $path_to_language, $count ) = @_;

    my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};
    my $lang_fn = Parrot::Test::per_test( '.m4', $count );

    return ("$ENV{PARROT_M4_TEST_PROG} $test_prog_args ${lang_fn}");
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
