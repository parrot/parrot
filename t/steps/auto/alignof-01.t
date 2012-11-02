#!perl
# Copyright (C) 2001-2012, Parrot Foundation.
# auto/alignof-01.t

use strict;
use warnings;
use Test::More tests =>   7;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::alignof');
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

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::alignof};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
like( $step->result(), qr/(?:skipped|done)/,
  "auto::alignof::runstep() returned either 'skipped' or 'done'");

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto/alignof-01.t - tests Parrot::Configure step auto::alignof

=head1 SYNOPSIS

    prove t/steps/auto/alignof-01.t

=head1 DESCRIPTION

This file holds tests for auto::alignof.

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
