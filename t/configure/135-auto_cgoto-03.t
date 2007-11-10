#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 135-auto_cgoto-03.t

use strict;
use warnings;
use Test::More tests => 26;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::cgoto');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::cgoto};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, @step_params, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

$conf->options->set(cgoto => 1);
is(auto::cgoto::_probe_for_cgoto($conf->options->get('cgoto')), 1,
    "Got expected return value");
$conf->options->set(cgoto => 0);
is(auto::cgoto::_probe_for_cgoto($conf->options->get('cgoto')), 0,
    "Got expected return value");
$conf->options->set(cgoto => undef);
ok(defined(auto::cgoto::_probe_for_cgoto($conf->options->get('cgoto'))), 
    "Probe returned a defined value");

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

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

135-auto_cgoto-03.t - test config::auto::cgoto

=head1 SYNOPSIS

    % prove t/configure/135-auto_cgoto-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::cgoto.

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
