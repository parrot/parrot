#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_jit-03.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests =>  19;
use Carp;
use Cwd;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use File::Spec;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::jit');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [ q{--jitcapable=0}, q{--verbose}  ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::jit};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

# Mock some values so that we can get to the point inside runstep() where the
# command-line option for jitcapable is relevant.

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'i386';
    my $osname = 'darwin';
    my $corejitdir = File::Spec->catdir ( $jitbase, $cpuarch );
    mkpath( $corejitdir, 0, 755 ) or croak "Unable to make testing directory";
    my $corejit = File::Spec->catfile( $jitbase, $cpuarch, q{core.jit} );
    open my $FH, '>', $corejit
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";
    my $orig = $step->{jit_is_working};
    $step->{jit_is_working} = { $cpuarch => 1 };
    $conf->data->set( cpuarch => $cpuarch );
    $conf->data->set( osname => $osname );
    {
        my ($stdout, $stderr, $ret);
        capture(
            sub { $ret = $step->runstep($conf); },
            \$stdout,
            \$stderr,
        );
        ok( $ret, "$step_name runstep() returned true value" );
        like($stdout, qr/yes|no/s, "Got expected verbose output");
    }
    $step->{jit_is_working} = $orig;
    $conf->data->set( cpuarch => undef );
    $conf->data->set( osname => undef );

    is( $conf->data->get( 'jitarchname' ), 'nojit',
        "Got expected value for jitarchname");
    is( $conf->data->get( 'jitcapable' ), 0,
        "Got expected value for jitcapable");
    is( $conf->data->get( 'execcapable' ), 0,
        "Got expected value for execcapable");
    is( $conf->data->get( 'cc_hasjit' ), '',
        "Got expected value for cc_hasjit");
    is( $conf->data->get( 'TEMP_jit_o' ), '',
        "Got expected value for TEMP_jit_o");
    is( $conf->data->get( 'TEMP_exec_h' ), '',
        "Got expected value for TEMP_exec_h");
    is( $conf->data->get( 'TEMP_exec_o' ), '',
        "Got expected value for TEMP_exec_o");
    is( $conf->data->get( 'TEMP_exec_dep' ), '',
        "Got expected value for TEMP_exec_dep");
    is( $step->result(), 'no', 
        "Got expected result for no JIT");

    chdir $cwd or croak "Unable to change back to starting directory";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_jit-03.t - test config::auto::jit

=head1 SYNOPSIS

    % prove t/steps/auto_jit-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file tests config::auto::jit with the C<--jitcapable>
option set to C<0>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::jit, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

