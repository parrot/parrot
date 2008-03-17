# $Id$
# Copyright (C) 2005-2007, The Perl Foundation.

=head1 NAME

Test/M4.pm - Testing routines specific to 'm4'.

=head1 DESCRIPTION

Call 'Parrot m4' and 'GNU m4'.

=cut

package Parrot::Test::M4;

use strict;
use warnings;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::M4::Gnu;
use Parrot::Test::M4::PIR;

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::M4.
XXX: Do not configure with environment variables.

=cut

sub new {
    return $ENV{PARROT_M4_TEST_PROG}
        ? ( bless {}, 'Parrot::Test::M4::Gnu' )
        : ( bless {}, 'Parrot::Test::M4::PIR' );
}

sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return $self->{relpath};
}

sub get_lang_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.m4', $count );
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
