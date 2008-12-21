# $Id$

# Copyright (C) 2006-2008, The Perl Foundation.

package Parrot::Test::Pipp;

# pragmata
use strict;
use warnings;

use Data::Dumper;
use File::Basename;
use File::Spec;

use Parrot::Test;
use Parrot::Test::Pipp::PHP;
use Parrot::Test::Pipp::PCT;

=head1 NAME

Test/Pipp.pm - Testing routines specific to 'php'.

=head1 DESCRIPTION

Call 'pipp.pbc' and 'php'.

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::Pipp.

Use the executable B<pipp> in smoke testing.

=cut

sub new {
    my $test_module =  $ENV{PARROT_PIPP_TEST_MODULE} || 'Parrot::Test::Pipp::PCT';

    return bless {}, $test_module;
}

sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return File::Spec->catdir( $self->{relpath}, 'languages', 'pipp' );
}

sub get_lang_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.php', $count );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
