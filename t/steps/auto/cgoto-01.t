#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/cgoto-01.t

use strict;
use warnings;
use Test::More tests =>  25;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::cgoto');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );


########### regular ###########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::cgoto};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
ok(defined($step->result()), "A result was defined");
ok(defined($conf->data->get('cg_flag')), "An attribute has been defined");

$conf->replenish($serialized);

########### _probe_for_cgoto() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

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
ok($conf->data->get('cg_flag'), "An attribute was set to true value");
is($step->result(), q{yes}, "Expected result was set");

$step->_evaluate_cgoto($conf, 0);
is($conf->data->get('cg_flag'), q{}, "An attribute was set to empty string");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    capture(
        sub { $step->_evaluate_cgoto($conf, 1) },
        \$stdout
    );
    ok($conf->data->get('cg_flag'), "An attribute was set to true value");
    is($step->result(), q{yes}, "Expected result was set");
}

{
    my $stdout;
    capture(
        sub { $step->_evaluate_cgoto($conf, 0) },
        \$stdout
    );
    is($conf->data->get('cg_flag'), q{},
        "An attribute was set to empty string");
    is($step->result(), q{no}, "Expected result was set");
}


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/cgoto-01.t - test auto::cgoto

=head1 SYNOPSIS

    % prove t/steps/auto/cgoto-01.t

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
