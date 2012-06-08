#! perl
# Copyright (C) 2008-2009, Parrot Foundation.

=head1 NAME

t/tools/dumb_pbc.t - test the script tools/dev/dump_pbc.pl

=head1 SYNOPSIS

    % prove t/tools/dump_pbc.t

=head1 DESCRIPTION

Sanity test of the C<dump_pbc> utility.

=cut

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Fatal qw{open close};
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;
use File::Spec   ();


sub dump_pbc_output_like {
    my ($pir_fn, $snippet, $desc)  = @_;

    my $pbc_fn = 'test_dump_pbc.pbc';

    my $PARROT   = ".$PConfig{slash}$PConfig{test_prog}";
    system( "$PARROT --output $pbc_fn $pir_fn" );
    my $cmd = File::Spec->catfile( qw{. tools dev dump_pbc.pl} );
    my $out = `$PConfig{perl} $cmd $pbc_fn`;

    like( $out, $snippet, $desc );

    unlink $pbc_fn;

    return;
}


dump_pbc_output_like(
    File::Spec->catfile( 'examples', 'tutorial', '01_temp_var.pir' ),
    qr!\Q=head1 SIMPLE VARIABLES\E!,
    '01_temp_var.pir'
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
