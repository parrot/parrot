#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_backtrace-01.t

use strict;
use warnings;
use Test::More tests => 19;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::backtrace');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::backtrace};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

$conf->replenish($serialized);

########## _evaluate_backtrace()  ##########

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
my $error = q{mock_error};
ok($step->_evaluate_backtrace($conf, $error),
    "_evaluate_backtrace returned true value");
is($step->result, 'no', "Got expected result");

$error = q{};
ok($step->_evaluate_backtrace($conf, $error),
    "_evaluate_backtrace returned true value");
is($step->result, 'yes', "Got expected result");
ok($conf->data->get('backtrace'),
    "backtrace set as expected");

ok($step->runstep($conf), "runstep() returned true value");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_backtrace-01.t - test auto::backtrace

=head1 SYNOPSIS

    % prove t/steps/auto_backtrace-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::backtrace.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::backtrace, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
