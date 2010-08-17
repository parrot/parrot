#! perl
# Copyright (C) 2001-2004, Parrot Foundation.
# $Id$

=head1 NAME

t/run/exit.t - test parrot exit codes

=head1 SYNOPSIS

    % prove t/run/exit.t

=head1 DESCRIPTION

Tests C<Parrot> exit codes. Tests variations of normal and abnormal exit
with combinations of STDERR and STDOUT open and closed.  Also tests behavior
under error conditions, whether output files are created and whether the error
is returned properly.

=cut

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 10;
use Parrot::Config;
use File::Spec;
use File::Temp qw(tempdir);
use IO::File;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";
my $redir  = File::Spec->devnull;

# copy file descriptors
open *OLDOUT, ">&STDOUT" or die qq|Cannot dup STDOUT: $!|;    ## no critic
open *OLDERR, ">&STDERR" or die qq|Cannot dup STDERR: $!|;    ## no critic

sub exits {
    my $pre = shift;
    $pre ||= '';

    is( system(qq|$PARROT --version $redir > $redir 2> $redir|) >> 8, 0, "$pre: normal exit" );
    isnt( system(qq|$PARROT --foo $redir > $redir 2> $redir|) >> 8, 0, "$pre: abnormal exit" );
}

# all open
exits('STDERR & STDOUT open');

# close stderr
close *STDERR or die qq|Cannot close STDERR: $!|;
exits('STDERR closed');

# close stdout too
close *STDOUT or die qq|Cannot close STDOUT: $!|;
exits('STDERR & STDOUT closed');

# restore stderr
open *STDERR, ">&OLDERR" or die qq|Cannot restore stderr: $!|;    ## no critic
exits('STDOUT closed');

# restore stdout
open *STDOUT, ">&OLDOUT" or die qq|Cannot restore stdout: $!|;    ## no critic

# close copies
close *OLDOUT or die qq|Cannot close OLDOUT: $!|;
close *OLDERR or die qq|Cannot close OLDERR: $!|;

# exits nonzero on a parse error
my $tempdir = tempdir(CLEANUP => 1);
my $pirfn = File::Spec->catfile($tempdir, "test.pir");
my $pbcfn = File::Spec->catfile($tempdir, "test.pbc");
my $pirfile = IO::File->new(">$pirfn");
$pirfile->print("Parse error.\n");
$pirfile->close();
my $rv = system(qq|$PARROT -o $pbcfn $pirfn $redir > $redir 2> $redir|) >> 8;
isnt($rv, 0, "parrot returns error on parse failure\n");
ok(! -e $pbcfn, "parrot doesn't create outfile on parse failure\n");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
