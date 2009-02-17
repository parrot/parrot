#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_cpu-01.t

use strict;
use warnings;
use Test::More tests =>  22;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::cpu');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########### --verbose ###########

my ($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::cpu};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
{
    $conf->data->set('cpuarch' => 'foobar');
    my ($ret, $stdout);
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
    );
    ok($ret, "runstep() returned true value" );
    ok(! $step->result(), "Got (default) false result as expected");
    like($stdout, qr/cpu hints = 'auto::cpu::foobar::auto'/s,
        "Got expected verbose output");
    like($stdout, qr/no cpu specific hints/s,
        "Got expected verbose output");
}

$conf->replenish($serialized);

########### mock cpuarch ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('cpuarch' => 'foobar');
my $ret = $step->runstep($conf);
ok($ret, "runstep() returned true value" );
ok(! $step->result(), "Got (default) false result as expected");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_cpu-01.t - test auto::cpu

=head1 SYNOPSIS

    % prove t/steps/auto_cpu-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::cpu.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::cpu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
