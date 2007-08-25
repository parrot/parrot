#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 101-init_manifest.02.t

use strict;
use warnings;
use Test::More tests =>  6;
use Carp;
use Cwd;
use Data::Dumper;
use File::Copy;
use File::Temp qw(tempdir);
use lib qw( . lib ../lib ../../lib );
use_ok('config::init::manifest');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;

=for hints_for_testing See if you can get the program to 'ack' when it
thinks there are files missing from those listed in the MANIFEST.

=cut

my $pkg = q{init::manifest};
my $args = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new;
$conf->add_steps($pkg);
$conf->options->set(%{$args});

my $task = $conf->steps->[0];
my $step_name   = $task->step;
my @step_params = @{ $task->params };

my $step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
# Lets see if we can trick ExtUtils::Manifest into thinking there are missing
# files.
my $cwd = cwd();
{
    my $tdir = tempdir();
    chdir $tdir or croak "Unable to change to tempdir";
    copy (qq{$cwd/MANIFEST}, qq{$tdir/MANIFEST}) or croak "Unable to copy MANIFEST";
    {
        my $tie_err = tie *STDERR, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        my $ret = $step->runstep($conf);
        my @lines = $tie_err->READLINE;
        my @more_lines = $tie_out->READLINE;
        is($ret, undef, "$step_name runstep returned undef");
    }
    chdir $cwd or croak "Unable to change back";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

101-init_manifest.02.t - test config::init::manifest

=head1 SYNOPSIS

    % prove t/configure/101-init_manifest.02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::manifest.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::manifest, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
