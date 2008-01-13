#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gmp-03.t

use strict;
use warnings;
use Test::More tests => 28;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gmp');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::gmp};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my ($test, $has_gmp, $verbose);

$test = $step->{cc_run_expected};
$has_gmp = 0;
$verbose = undef;
$has_gmp = $step->_evaluate_cc_run($conf, $test, $has_gmp, $verbose);
is($step->result, 'yes', "Got expected result");
is($conf->data->get('gmp'), 'define', "Expected value set for 'gmp'");
is($conf->data->get('HAS_GMP'), 1, "Expected value set for 'HAS_GMP'");
# prepare for next test
$conf->data->set('gmp' => undef);
$conf->data->set('HAS_GMP' => undef);
$step->set_result(undef);

$test = '12345';
$has_gmp = 0;
$verbose = undef;
$has_gmp = $step->_evaluate_cc_run($conf, $test, $has_gmp, $verbose);
ok(! defined($step->result), "Result undefined as expected");
is($has_gmp, 0, "gmp status unchanged");

{
    my $stdout;
    $test = $step->{cc_run_expected};
    $has_gmp = 0;
    $verbose = 1;
    capture(
        sub { $has_gmp =
            $step->_evaluate_cc_run($conf, $test, $has_gmp, $verbose); },
        \$stdout,
    );
    is($step->result, 'yes', "Got expected result");
    is($conf->data->get('gmp'), 'define', "Expected value set for 'gmp'");
    is($conf->data->get('HAS_GMP'), 1, "Expected value set for 'HAS_GMP'");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # prepare for next test
    $conf->data->set('gmp' => undef);
    $conf->data->set('HAS_GMP' => undef);
    $step->set_result(undef);
}

my ($libs, $ccflags, $linkflags);

$libs = q{-lalpha};
$ccflags = q{-Ibeta};
$linkflags = q{-Lgamma};
$verbose = undef;
$step->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
like($conf->data->get('libs'), qr/$libs/,
    "Got expected value for 'libs'");
like($conf->data->get('ccflags'), qr/$ccflags/,
    "Got expected value for 'ccflags'");
like($conf->data->get('linkflags'), qr/$linkflags/,
    "Got expected value for 'linkflags'");
is($step->result, 'no', "Expected result was set");

{
    my $stdout;
    $libs = q{-lalpha};
    $ccflags = q{-Ibeta};
    $linkflags = q{-Lgamma};
    $verbose = 1;
    capture(
        sub { $step->_recheck_settings(
            $conf, $libs, $ccflags, $linkflags, $verbose); },
        \$stdout,
    );
    like($conf->data->get('libs'), qr/$libs/,
        "Got expected value for 'libs'");
    like($conf->data->get('ccflags'), qr/$ccflags/,
        "Got expected value for 'ccflags'");
    like($conf->data->get('linkflags'), qr/$linkflags/,
        "Got expected value for 'linkflags'");
    is($step->result, 'no', "Expected result was set");
    like($stdout, qr/\(no\)/, "Got expected verbose output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gmp-03.t - test config::auto::gmp

=head1 SYNOPSIS

    % prove t/steps/auto_gmp-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::gmp in the case where the
C<--without-gmp> option is set.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gmp, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
