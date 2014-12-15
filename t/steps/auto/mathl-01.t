#!perl
# Copyright (C) 2001-2014, Parrot Foundation.
# auto/mathl-01.t

use strict;
use warnings;
use Test::More tests =>  11;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::mathl');
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

my $pkg = q{auto::mathl};

$conf->add_steps($pkg);
my $serialized = $conf->pcfreeze();
my $old_result = $conf->data->get( 'HAS_LABS' );

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "${pkg}::runstep() returned true value");
like( $step->result(), qr/yes|no|most|some/,
      "Got appropriate value for step result" );
$conf->replenish($serialized);

###### test _check with yes or no probes #####
$step->_check($conf, 'no l a b s');
ok( $old_result ? 1 : !defined $conf->data->get( 'HAS_LABS' ),
    "HAS_LABS has expected value for no case" );
like( $step->result(), qr/no|most|some/,
    "Got expected result for no case" );
$conf->replenish($serialized);

$step->_check($conf, 'labs');
is( $conf->data->get( 'HAS_LABS' ), 1,
    "HAS_LABS has expected value for yes case" );
like( $step->result(), qr/yes|most|some/,
    "Got expected result for yes case" );
$conf->replenish($serialized);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/mathl-01.t - tests Parrot::Configure step auto::mathl

=head1 SYNOPSIS

    prove t/steps/auto/mathl-01.t

=head1 DESCRIPTION

This file holds tests for auto::mathl.

=head1 AUTHOR

Reini Urban

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
