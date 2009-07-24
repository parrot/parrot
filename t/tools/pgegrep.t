#! perl
# Copyright (C) 2009, Parrot Foundation.
=head1 NAME

t/tools/pgegrep.t - test the script tools/utils/pgegrep

=head1 SYNOPSIS

    % prove t/tools/pgegrep.t

=head1 DESCRIPTION

Tests the features of of the C<pgegrep> utility.

=cut

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Fatal qw{open close};
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;
use File::Spec   ();

sub pgegrep_output_like {
    my ($options, $snippet, $desc)  = @_;

    my $PARROT  = ".$PConfig{slash}$PConfig{test_prog}";
    my $pgegrep = File::Spec->catfile( qw{. tools util pgegrep} );
    my $out     = `$PARROT $pgegrep $options`;

    like( $out, $snippet, $desc );

    return;
}

pgegrep_output_like(
    '-V',
    qr!\Qpgegrep v0.0.1\E!,
    'pge reports correct version'
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
