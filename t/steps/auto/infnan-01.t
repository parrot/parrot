#!perl
# Copyright (C) 2001-2011, Parrot Foundation.
# auto/infnan-01.t

use strict;
use warnings;
use Test::More tests =>  12;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::infnan');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::infnan};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "${pkg}::runstep() returned true value");
ok( defined($conf->data->get( 'HAS_INF_NAN' )),
   "Value set for HAS_INF_NAN" );
like( $step->result(), qr/yes|no/,
   "Got appropriate value for step result" );

###### _handle_infnan #####
my $infnan = 0;
$step->_handle_infnan($conf, $infnan);
is( $conf->data->get( 'HAS_INF_NAN' ), 0,
    "HAS_INF_NAN has expected value for not-present case" );
is( $step->result(), 'no',
    "Got expected result for not-present case" );

$infnan = 1;
$step->_handle_infnan($conf, $infnan);
is( $conf->data->get( 'HAS_INF_NAN' ), 1,
    "HAS_INF_NAN has expected value for present case" );
is( $step->result(), 'yes',
    "Got expected result for present case" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/infnan-01.t - tests Parrot::Configure step auto::infnan

=head1 SYNOPSIS

    prove t/steps/auto/infnan-01.t

=head1 DESCRIPTION

This file holds tests for auto::infnan.

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
