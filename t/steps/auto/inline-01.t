#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/inline-01.t

use strict;
use warnings;
use Test::More tests =>  32;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::inline');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########### regular  ###########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::inline};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

$conf->replenish($serialized);

########### --inline ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--inline} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

$conf->replenish($serialized);

########### _evaluate_inline() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $test = 1;
ok($step->_evaluate_inline($conf, $test),
    "_evaluate_inline() returned true value");
is($step->result, q{yes}, "Got expected result");
is($conf->data->get( 'inline' ), 1,
    "'inline' attribute has expected value");

$conf->replenish($serialized);

########### _evaluate_inline() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$test = 0;
ok($step->_evaluate_inline($conf, $test),
    "_evaluate_inline() returned true value");
is($step->result, q{no}, "Got expected result");
is($conf->data->get( 'inline' ), q{},
    "'inline' attribute has expected value");

$conf->replenish($serialized);

########### _evaluate_inline(); --verbose ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $test = 1;
    my $stdout;
    my $ret = capture(
        sub { $step->_evaluate_inline($conf, $test) },
        \$stdout
    );
    ok($ret, "_evaluate_inline() returned true value");
    is($step->result, q{yes}, "Got expected result");
    is($conf->data->get( 'inline' ), 1,
        "'inline' attribute has expected value");
}

$conf->replenish($serialized);

########### _second_probe_for_inline(); _evaluate_inline() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$test = 0;
$test = $step->_second_probe_for_inline($conf, $test);
ok($step->_evaluate_inline($conf, $test),
    "_evaluate_inline() returned true value");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/inline-01.t - test auto::inline

=head1 SYNOPSIS

    % prove t/steps/auto/inline-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::inline.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::inline, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
