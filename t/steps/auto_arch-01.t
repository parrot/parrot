#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_arch-01.t

use strict;
use warnings;
use Test::More tests => 102;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::arch');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########## Darwin special case ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::arch};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $errstr;
{
    # As the t/configure/ test suite is currently (Dec 25 2007) constructed,
    # an uninitialized value warning is generated when this test is run on
    # Darwin because of a hack in config/auto/arch.pm.  We capture the warning
    # and verify that we did so if on Darwin.  In the future, we will be able
    # to eliminate this use of the signal handler because the
    # Parrot::Configure object will have the same information available to it
    # as it does during regular configuration.
    local $SIG{__WARN__} = \&_capture;
    my $ret = $step->runstep($conf);
    ok( $ret, "runstep() returned true value" );
    is($step->result(), q{}, "Result was empty string as expected");
    if ($^O eq 'darwin') {
        like(
            $errstr,
            qr/Uninitialized value/i,
            "Caught uninitialized value warning as expected"
        );
    } else {
        pass("Test not needed except on Darwin");
    }
}

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($ret, $stdout);
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
    );
    ok( $ret, "runstep() returned true value" );
    is($step->result(), q{}, "Result was empty string as expected");
    like($stdout,
        qr/determining operating system and cpu architecture/s,
        "Got expected verbose output"
    );
}

$conf->replenish($serialized);

########## mock architecture ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $pseudoarch = q{foobar};
$conf->data->set('archname' => $pseudoarch);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), $pseudoarch,
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock darwin ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{darwin-thread-multi-2level};
$conf->data->set('archname' => $pseudoarch);
my $pseudobyteorder = 1234;
$conf->data->set('byteorder' => $pseudobyteorder);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{darwin},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock darwin ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{darwin-thread-multi-2level};
$conf->data->set('archname' => $pseudoarch);
$pseudobyteorder = 4321;
$conf->data->set('byteorder' => $pseudobyteorder);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{ppc},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{darwin},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock win32 ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{MSWin32-x64};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{amd64},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{MSWin32},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock win32 ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{MSWin32-i386};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{MSWin32},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock cygwin ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{cygwin};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{cygwin},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock powerpc-linux ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{powerpc-linux};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{ppc},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{linux},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock cygwin-i486 ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{cygwin-i486};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{cygwin},
    "'osname' was set as expected");

pass("Completed all tests in $0");

sub _capture { $errstr = $_[0]; }

################### DOCUMENTATION ###################

=head1 NAME

auto_arch-01.t - test auto::arch

=head1 SYNOPSIS

    % prove t/steps/auto_arch-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::arch.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::arch, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
