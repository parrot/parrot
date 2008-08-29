#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_env-01.t

use strict;
use warnings;
use Test::More tests =>  29;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::env');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########### regular ###########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my $pkg = q{auto::env};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "runstep() returned true value");

$conf->replenish($serialized);

########### _evaluate_env() ###########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
my ($setenv, $unsetenv);
$setenv = 1;
$unsetenv = 1;
$step->_evaluate_env($conf, $setenv, $unsetenv);
is($step->result(), q{both}, "Got expected result");
$setenv = 1;
$unsetenv = 0;
$step->_evaluate_env($conf, $setenv, $unsetenv);
is($step->result(), q{setenv}, "Got expected result");
$setenv = 0;
$unsetenv = 1;
$step->_evaluate_env($conf, $setenv, $unsetenv);
is($step->result(), q{unsetenv}, "Got expected result");
$setenv = 0;
$unsetenv = 0;
$step->_evaluate_env($conf, $setenv, $unsetenv);
is($step->result(), q{no}, "Got expected result");

$conf->replenish($serialized);

########### --verbose; _evaluate_env() ###########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    $setenv = 1;
    $unsetenv = 1;
    capture(
        sub { $step->_evaluate_env($conf, $setenv, $unsetenv) },
        \$stdout
    );
    like($stdout, qr/both/, "Got expected verbose output");
    is($step->result(), q{both}, "Got expected result");
}
{
    my $stdout;
    $setenv = 1;
    $unsetenv = 0;
    capture(
        sub { $step->_evaluate_env($conf, $setenv, $unsetenv) },
        \$stdout
    );
    like($stdout, qr/setenv/, "Got expected verbose output");
    is($step->result(), q{setenv}, "Got expected result");
}
{
    my $stdout;
    $setenv = 0;
    $unsetenv = 1;
    capture(
        sub { $step->_evaluate_env($conf, $setenv, $unsetenv) },
        \$stdout
    );
    like($stdout, qr/unsetenv/, "Got expected verbose output");
    is($step->result(), q{unsetenv}, "Got expected result");
}
{
    my $stdout;
    $setenv = 0;
    $unsetenv = 0;
    capture(
        sub { $step->_evaluate_env($conf, $setenv, $unsetenv) },
        \$stdout
    );
    like($stdout, qr/no/, "Got expected verbose output");
    is($step->result(), q{no}, "Got expected result");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_env-01.t - test auto::env

=head1 SYNOPSIS

    % prove t/steps/auto_env-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::env.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::env, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
