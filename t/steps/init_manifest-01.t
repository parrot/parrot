#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# init_manifest-01.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw(tempdir);
use lib qw( lib );
use_ok('config::init::manifest');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;

########## no manifest check ##########

my $pkg  = q{init::manifest};
my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--nomanicheck}],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );

my $task        = $conf->steps->[-1];
my $step_name   = $task->step;

my $step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

ok(defined ($step->result), "result defined");
ok(! ($step->result), "result not yet true");
my $ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
is( $step->result, q{skipped},
    "Because of --nomanicheck, result is 'skipped'." );

$conf->replenish($serialized);

########## mock missing files ##########

($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );

$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to tempdir";
    copy( qq{$cwd/MANIFEST}, qq{$tdir/MANIFEST} )
        or croak "Unable to copy MANIFEST";
    {
        my ($rv, $stdout, $stderr);
        capture(
            sub { $rv = $step->runstep($conf); },
            \$stdout,
            \$stderr,
        );
        is( $rv, undef, "runstep returned undef" );
    }
    unlink qq{$tdir/MANIFEST}
        or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init_manifest-01.t - test init::manifest

=head1 SYNOPSIS

    % prove t/steps/init_manifest-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test methods found in config::init::manifest.

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

