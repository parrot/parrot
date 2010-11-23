#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# auto/stat-01.t

use strict;
use warnings;
use Test::More tests =>  10;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::stat');
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

my $pkg = q{auto::stat};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "${pkg}::runstep() returned true value");

##### _handle_bsd_stat #####

my ($bsd_stat, $exp);

$bsd_stat = 1;
$step->_handle_bsd_stat($conf, $bsd_stat);
is($conf->data->get('HAS_BSD_STAT_EXTN'), 1,
    "Got expected value for HAS_BSD_STAT_EXTN");
$exp = 'bsd';
is($step->result(), $exp,
    "Got expected result '$exp'");

$bsd_stat = 0;
$step->_handle_bsd_stat($conf, $bsd_stat);
is($conf->data->get('HAS_BSD_STAT_EXTN'), 0,
    "Got expected value for HAS_BSD_STAT_EXTN");
$exp = 'posix';
is($step->result(), $exp,
    "Got expected result '$exp'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/stat-01.t - tests Parrot::Configure step auto::stat

=head1 SYNOPSIS

    prove t/steps/auto/stat-01.t

=head1 DESCRIPTION

This file holds tests for auto::stat.

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
