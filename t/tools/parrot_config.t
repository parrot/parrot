#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/tools/parrot_config.t - test parrot_config

=head1 SYNOPSIS

    % prove t/tools/parrot_config.t - test parrot_config

=head1 DESCRIPTION

Tests the C<parrot_config> tool.

=cut

use strict;
use warnings;
use lib qw(lib);

use Test::More;
use IO::File ();
use Parrot::Config;
use Parrot::Test;
use File::Spec;

my ($path, $exefile);

BEGIN {
    $path = File::Spec->catfile( ".", "parrot_config" );
    $exefile = $path . $PConfig{exe};
    unless ( -f $exefile ) {
        plan skip_all => "$exefile hasn't been built yet.";
        exit(0);
    }
    plan tests => 3;
}

config_output_like(
    'pmc_names',
     qr/\bHash\b/,
     'parrot_config basic sanity'
);

config_output_like(
    'non_existant_key',
     qr/no such key: 'non_existant_key'/,
     'missing keys'
);

config_output_like(
    'slash has_icu',
    qr/slash \s+ => \s+ '.' \n has_icu \s+ => \s+ '.'/x,
    'multiple keys'
);

=head1 HELPER SUBROUTINES

=head2 dump_output_like

    config_output_like($keys, /regexp/, $description);

Runs parrot_config with $keys as the argument and verifies the output.

=cut

sub config_output_like {
    my ($options, $snippet, $desc)  = @_;

    my $out = `$exefile $options`;

    like( $out, $snippet, $desc );

    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
