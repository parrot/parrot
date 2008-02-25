# $Id$

# Copyright (C) 2006-2007, The Perl Foundation.

package Parrot::Test::Plumhead;

# pragmata
use strict;
use warnings;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::Plumhead::PHP;
use Parrot::Test::Plumhead::Phc;
use Parrot::Test::Plumhead::Antlr3;
use Parrot::Test::Plumhead::PCT;

=head1 NAME

Test/Plumhead.pm - Testing routines specific to 'php'.

=head1 DESCRIPTION

Call 'plumhead.pl' and 'php'.

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::Plumhead.
XXX: Do not configure with environment variables.
Use plumhead.pl in smoke testing.

=cut

sub new {
    my $test_module =    $ENV{PARROT_PLUMHEAD_TEST_MODULE}
                      || 'Parrot::Test::Plumhead::PCT';
    return bless {}, $test_module;
}

sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return $self->{relpath};
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
