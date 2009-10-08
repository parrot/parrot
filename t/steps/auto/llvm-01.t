#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$
# auto/llvm-01.t

use strict;
use warnings;
use Test::More tests =>  27;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::progs');
use_ok('config::auto::llvm');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{inter::progs},   $args);

my $pkg = q{auto::llvm};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
like( $step->result(), qr/yes|no/,
  "Result was either 'yes' or 'no'" );

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
    my $stdout;
    my $ret = capture(
        sub { $step->runstep($conf) },
        \$stdout
    );
    ok( $ret, "runstep() returned true value" );
    like( $step->result(), qr/yes|no/,
        "Result was either 'yes' or 'no'" );
    SKIP: {
        skip 'No sense testing for verbose output if LLVM not present',
        2 unless ( $step->result() =~ /yes/ );
        like( $stdout, qr/llvm-gcc/s,
            "Got expected verbose output" );
        like( $stdout, qr/Low Level Virtual Machine/s,
            "Got expected verbose output" );
    }
}

$conf->replenish($serialized);

# This must be fine-tuned; leaving test file in topdir;
# generating uninitialized value warnings: +190
# lib/Parrot/Configure/Compiler.pm

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/llvm-01.t - tests Parrot::Configure step auto::llvm

=head1 SYNOPSIS

    prove t/steps/auto/llvm-01.t

=head1 DESCRIPTION

This file holds tests for auto::llvm.

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
