#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

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
use Parrot::Test tests => 10;
use Parrot::Config;
use File::Spec   ();

my $testdata = File::Spec->catfile(qw{. t tools testdata });
my $testdata_escaped = $testdata;
$testdata_escaped =~ s!\\!\\\\!g;

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

pgegrep_output_like(
    "cat $testdata",
    qr!keyboardcat!,
    'basic sanity of matching a literal'
);

pgegrep_output_like(
    "-n cat $testdata",
    qr!1:keyboardcat!,
    'matching a literal with line number'
);

pgegrep_output_like(
    "--line-number cat $testdata",
    qr!1:keyboardcat!,
    'matching a literal with line number with long option'
);

pgegrep_output_like(
    "-H cat $testdata",
    qr!$testdata_escaped:keyboardcat!,
    'matching a literal with file name'
);

pgegrep_output_like(
    "--with-filename cat $testdata",
    qr!$testdata_escaped:keyboardcat!,
    'matching a literal with file name with long option'
);


pgegrep_output_like(
    "-v cat $testdata",
    qr!saxophonegiraffe!,
    'test inversion of match'
);

pgegrep_output_like(
    "--invert-match cat $testdata",
    qr!saxophonegiraffe!,
    'test inversion of match with long option'
);

pgegrep_output_like(
    "-l cat $testdata",
    qr!$testdata_escaped!,
    'find files that match'
);

pgegrep_output_like(
    "--files-with-matches cat $testdata",
    qr!$testdata_escaped!,
    'find files that match with long option'
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
