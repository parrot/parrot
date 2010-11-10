#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# auto/timespec-01.t

use strict;
use warnings;
use Test::More tests =>  12;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::timespec');
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

my $pkg = q{auto::timespec};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "${pkg}::runstep() returned true value");

##### _handle_timespec #####

my ($fail_message, $exp);

$conf->data->set( HAS_TIMESPEC => undef );
$fail_message = 'There was a problem';
$exp = 'no';
$step->_handle_timespec($conf, $fail_message);
ok(defined $conf->data->get('HAS_TIMESPEC'),
    "HAS_TIMESPEC is defined" );
ok(! $conf->data->get('HAS_TIMESPEC'),
    "HAS_TIMESPEC is not true, as expected" );
is($step->result(), $exp, "Got expected result '$exp'");

$conf->data->set( HAS_TIMESPEC => undef );
$fail_message = '';
$exp = 'yes';
$step->_handle_timespec($conf, $fail_message);
ok(defined $conf->data->get('HAS_TIMESPEC'),
    "HAS_TIMESPEC is defined" );
ok($conf->data->get('HAS_TIMESPEC'),
    "HAS_TIMESPEC is true, as expected" );
is($step->result(), $exp, "Got expected result '$exp'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/timespec-01.t - tests Parrot::Configure step auto::timespec

=head1 SYNOPSIS

    prove t/steps/auto/timespec-01.t

=head1 DESCRIPTION

This file holds tests for auto::timespec.

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
