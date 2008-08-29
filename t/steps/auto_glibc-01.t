#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$
# auto_glibc-01.t

use strict;
use warnings;
use Test::More tests => 18;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::glibc');
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
my $pkg = q{auto::glibc};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "runstep() returned true value");

$conf->replenish($serialized);

########## _evaluate_glibc() ##########

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

my $test = {};
$test->{glibc} = 1;
$step->_evaluate_glibc($conf, $test);
is( $step->result(), q{yes}, "Got expected result" );
is( $conf->data->get( 'glibc' ), 1, "Got expected value for 'glibc'" );

$test->{glibc} = undef;
$step->_evaluate_glibc($conf, $test);
is( $step->result(), q{no}, "Got expected result" );
ok( ! defined $conf->data->get( 'glibc' ),
    "'glibc' undefined as expected" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_glibc-01.t - test auto::glibc

=head1 SYNOPSIS

    % prove t/steps/auto_glibc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::glibc.

=head1 AUTHOR

Jerry Gay

=head1 SEE ALSO

config::auto::glibc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
