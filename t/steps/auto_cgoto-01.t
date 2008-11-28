#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_cgoto-01.t

use strict;
use warnings;
use Test::More tests =>  56;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::cgoto');
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
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::cgoto};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
ok(defined($step->result()), "A result was defined");
ok(defined($conf->data->get('TEMP_cg_h')), "An attribute has been defined");
ok(defined($conf->data->get('TEMP_cg_c')), "An attribute has been defined");
ok(defined($conf->data->get('TEMP_cg_o')), "An attribute has been defined");
ok(defined($conf->data->get('TEMP_cg_r')), "An attribute has been defined");
ok(defined($conf->data->get('cg_flag')), "An attribute has been defined");

$conf->replenish($serialized);

########### _probe_for_cgoto() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->options->set(cgoto => 1);
is(auto::cgoto::_probe_for_cgoto($conf), 1,
    "Got expected return value");
$conf->options->set(cgoto => 0);
is(auto::cgoto::_probe_for_cgoto($conf), 0,
    "Got expected return value");
$conf->options->set(cgoto => undef);
ok(defined(auto::cgoto::_probe_for_cgoto($conf)),
    "Probe returned a defined value");

########### _evaluate_cgoto() ###########

$step->_evaluate_cgoto($conf, 1);
ok($conf->data->get('TEMP_cg_h'), "An attribute was set to true value");
ok($conf->data->get('TEMP_cg_c'), "An attribute was set to true value");
ok($conf->data->get('TEMP_cg_o'), "An attribute was set to true value");
ok($conf->data->get('TEMP_cg_r'), "An attribute was set to true value");
ok($conf->data->get('cg_flag'), "An attribute was set to true value");
is($step->result(), q{yes}, "Expected result was set");

$step->_evaluate_cgoto($conf, 0);
is($conf->data->get('TEMP_cg_h'), q{}, "An attribute was set to empty string");
is($conf->data->get('TEMP_cg_c'), q{}, "An attribute was set to empty string");
is($conf->data->get('TEMP_cg_o'), q{}, "An attribute was set to empty string");
is($conf->data->get('TEMP_cg_r'), q{}, "An attribute was set to empty string");
is($conf->data->get('cg_flag'), q{}, "An attribute was set to empty string");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    capture(
        sub { $step->_evaluate_cgoto($conf, 1) },
        \$stdout
    );
    ok($conf->data->get('TEMP_cg_h'), "An attribute was set to true value");
    ok($conf->data->get('TEMP_cg_c'), "An attribute was set to true value");
    ok($conf->data->get('TEMP_cg_o'), "An attribute was set to true value");
    ok($conf->data->get('TEMP_cg_r'), "An attribute was set to true value");
    ok($conf->data->get('cg_flag'), "An attribute was set to true value");
    is($step->result(), q{yes}, "Expected result was set");
}

{
    my $stdout;
    capture(
        sub { $step->_evaluate_cgoto($conf, 0) },
        \$stdout
    );
    is($conf->data->get('TEMP_cg_h'), q{},
        "An attribute was set to empty string");
    is($conf->data->get('TEMP_cg_c'), q{},
        "An attribute was set to empty string");
    is($conf->data->get('TEMP_cg_o'), q{},
        "An attribute was set to empty string");
    is($conf->data->get('TEMP_cg_r'), q{},
        "An attribute was set to empty string");
    is($conf->data->get('cg_flag'), q{},
        "An attribute was set to empty string");
    is($step->result(), q{no}, "Expected result was set");
}


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_cgoto-01.t - test auto::cgoto

=head1 SYNOPSIS

    % prove t/steps/auto_cgoto-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::cgoto.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::cgoto, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
