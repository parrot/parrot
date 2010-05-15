#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# auto/extra_nci_thunks-01.t

=head1 NAME

auto/extra_nci_thunks-01.t - test auto::extra_nci_thunks

=head1 SYNOPSIS

    % prove t/steps/auto/extra_nci_thunks-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::extra_nci_thunks.

=head1 SEE ALSO

config::auto::libjit, F<Configure.pl>.

=cut

use strict;
use warnings;

use Test::More tests => 21;

use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options 'process_options';
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);

use_ok('config::init::defaults');
use_ok('config::auto::extra_nci_thunks');

my ($args, $step_list_ref) = process_options( {
    argv => [ q{--without-extra-nci-thunks} ],
    mode => 'configure',
} );

my $conf = Parrot::Configure->new;
my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, 'init::defaults', $args );

my $pkg = 'auto::extra_nci_thunks';
my ($step, $ret);

$conf->add_steps($pkg);
$conf->options->set(%$args);
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is( $step->result(), 'no', "Result is 'no', as expected" );
is( $conf->data->get( 'HAS_EXTRA_NCI_THUNKS' ), 0,
    "Got the expected result with '--without-extra-nci-thunks' option" );

$conf->replenish($serialized);

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => 'configure',
} );
rerun_defaults_for_testing($conf, $args);
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned a true value" );
is( $step->result(), 'yes', "Default result is 'yes' as expected" );
is( $conf->data->get( 'has_extra_nci_thunks' ), 1,
    "Get the expected result without '--without-extra-nci-thunks' option" );


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
