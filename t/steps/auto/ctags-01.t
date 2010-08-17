#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$
# auto/ctags-01.t

use strict;
use warnings;
use Test::More tests =>  28;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::ctags');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::ctags};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my %possible_ctags = map {$_,1}
    qw( ctags exuberant-ctags ctags-exuberant exctags );
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
ok(defined($step->result()), "Result was defined");
ok($possible_ctags{$conf->data->get('ctags')},
    "Acceptable value for 'ctags' attribute was set");

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    my $ret = capture(
        sub { $step->runstep($conf) },
        \$stdout
    );
    ok( $ret, "runstep() returned true value" );
    ok( defined $step->result(), "Result was defined");
    ok($possible_ctags{$conf->data->get('ctags')},
        "Acceptable value for 'ctags' attribute was set");
}

$conf->replenish($serialized);

########## _evaluate_ctags() ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$conf->replenish($serialized);

my $pseudo_ctags;
$pseudo_ctags = q{alpha};
$step->_evaluate_ctags($conf, $pseudo_ctags, 1);
is($conf->data->get('ctags'), $pseudo_ctags,
    "'ctags' attribute was set as expected");
is($step->result(), q{yes}, "Got expected result");

$pseudo_ctags = q{alpha};
$step->_evaluate_ctags($conf, $pseudo_ctags, 0);
is($conf->data->get('ctags'), 'ctags',
    "'ctags' attribute was set as expected");
is($step->result(), q{no}, "Got expected result");

$conf->replenish($serialized);

########## _probe_for_ctags_output() ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
ok(auto::ctags::_probe_for_ctags_output($conf, 'Exuberant Ctags'),
    "Probe returned true when output matched");
ok(! auto::ctags::_probe_for_ctags_output($conf, 'alpha'),
    "Probe returned false when output matched");
{
    my $stdout;
    my $rv = capture(
        sub { auto::ctags::_probe_for_ctags_output($conf, 'Exuberant Ctags') },
        \$stdout
    );
    ok($rv, "Probe returned true when output matched");
}
{
    my $stdout;
    my $rv = capture(
        sub { auto::ctags::_probe_for_ctags_output($conf, 'alpha') },
        \$stdout
    );
    ok(! $rv, "Probe returned false when output matched");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/ctags-01.t - tests Parrot::Configure step auto::ctags

=head1 SYNOPSIS

    prove t/steps/auto/ctags-01.t

=head1 DESCRIPTION

This file holds tests for auto::ctags.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
