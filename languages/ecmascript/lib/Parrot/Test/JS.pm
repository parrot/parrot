# $Id: JS.pm 34193 2008-12-21 11:50:25Z bernhard $

# Copyright (C) 2008, The Perl Foundation.

package Parrot::Test::JS;

# pragmata
use strict;
use warnings;

use Data::Dumper;
use File::Basename;
use File::Spec;

use Parrot::Test;
use Parrot::Test::JS::SpiderMonkey;
use Parrot::Test::JS::PJS;

=head1 NAME

Test/JS.pm - Testing routines specific to 'js'.

=head1 DESCRIPTION

Call 'js.pbc' and 'js'.

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::JS.

Use the executable B<js> in smoke testing.

=cut

sub new {
    my $test_module =  $ENV{PARROT_PIPP_TEST_MODULE} || 'Parrot::Test::JS::PJS';

    return bless {}, $test_module;
}

sub get_cd {
    my $self = shift;
    my ( $options ) = @_;

    return File::Spec->catdir( $self->{relpath}, 'languages', 'ecmascript' );
}

sub get_lang_fn {
    my $self = shift;
    my ( $count, $options ) = @_;

    return Parrot::Test::per_test( '.js', $count );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
