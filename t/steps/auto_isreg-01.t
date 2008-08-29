#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_isreg-01.t

use strict;
use warnings;
use Test::More tests => 23;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::isreg');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my $pkg = q{auto::isreg};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "runstep() returned true value");

$conf->replenish($serialized);

########## _evaluate_isreg() ##########

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $anyerror;
    my $stdout;
    my $ret = capture(
        sub { $step->_evaluate_isreg($conf, $anyerror) },
        \$stdout
    );
    ok($ret, "_evaluate_isreg returned true value");
    is($conf->data->get('isreg'), 1, "'isreg' set to true value as expected");
    is($step->result, 'yes', "Got expected result");
}

$conf->replenish($serialized);

########## _evaluate_isreg(); --verbose ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $anyerror = 1;
    my $stdout;
    my $ret = capture(
        sub { $step->_evaluate_isreg($conf, $anyerror) },
        \$stdout
    );
    ok($ret, "_evaluate_isreg returned true value");
    is($conf->data->get('isreg'), 0, "'isreg' set to false value as expected");
    is($step->result, 'no', "Got expected result");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_isreg-01.t - test auto::isreg

=head1 SYNOPSIS

    % prove t/steps/auto_isreg-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::isreg.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::isreg, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
