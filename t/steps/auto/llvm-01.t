#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$
# auto/llvm-01.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests =>  28;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::llvm');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $pkg = q{auto::llvm};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
ok(defined($step->result()), "Result was defined");
#ok($possible_llvm{$conf->data->get('llvm')},
#    "Acceptable value for 'llvm' attribute was set");
#
#$conf->replenish($serialized);
#
########### --verbose ##########
#
#($args, $step_list_ref) = process_options( {
#    argv => [ q{--verbose} ],
#    mode => q{configure},
#} );
#$conf->options->set( %{$args} );
#$step = test_step_constructor_and_description($conf);
#{
#    my $stdout;
#    my $ret = capture(
#        sub { $step->runstep($conf) },
#        \$stdout
#    );
#    ok( $ret, "runstep() returned true value" );
#    ok( defined $step->result(), "Result was defined");
#    ok($possible_llvm{$conf->data->get('llvm')},
#        "Acceptable value for 'llvm' attribute was set");
#}
#
#$conf->replenish($serialized);
#
########### _evaluate_llvm() ##########
#
#($args, $step_list_ref) = process_options( {
#    argv => [ ],
#    mode => q{configure},
#} );
#$conf->options->set( %{$args} );
#$step = test_step_constructor_and_description($conf);
#
#$conf->replenish($serialized);
#
#my $pseudo_llvm;
#$pseudo_llvm = q{alpha};
#$step->_evaluate_llvm($conf, $pseudo_llvm, 1);
#is($conf->data->get('llvm'), $pseudo_llvm,
#    "'llvm' attribute was set as expected");
#is($step->result(), q{yes}, "Got expected result");
#
#$pseudo_llvm = q{alpha};
#$step->_evaluate_llvm($conf, $pseudo_llvm, 0);
#is($conf->data->get('llvm'), 'llvm',
#    "'llvm' attribute was set as expected");
#is($step->result(), q{no}, "Got expected result");
#
#$conf->replenish($serialized);
#
########### _probe_for_llvm_output() ##########
#
#($args, $step_list_ref) = process_options( {
#    argv => [ ],
#    mode => q{configure},
#} );
#$conf->options->set( %{$args} );
#$step = test_step_constructor_and_description($conf);
#ok(auto::llvm::_probe_for_llvm_output('Exuberant Ctags', 0),
#    "Probe returned true when output matched");
#ok(! auto::llvm::_probe_for_llvm_output('alpha', 0),
#    "Probe returned false when output matched");
#{
#    my $stdout;
#    my $rv = capture(
#        sub { auto::llvm::_probe_for_llvm_output('Exuberant Ctags', 1) },
#        \$stdout
#    );
#    ok($rv, "Probe returned true when output matched");
#}
#{
#    my $stdout;
#    my $rv = capture(
#        sub { auto::llvm::_probe_for_llvm_output('alpha', 1) },
#        \$stdout
#    );
#    ok(! $rv, "Probe returned false when output matched");
#}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/llvm-01.t - tests Parrot::Configure step auto::llvm

=head1 SYNOPSIS

    prove t/steps/auto/llvm-01.t

=head1 DESCRIPTION

This file holds tests for auto::llvm.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
