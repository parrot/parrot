#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$
# gen_crypto-01.t

use strict;
use warnings;
use Test::More tests =>  8;
use Carp;
use lib qw( lib );
use_ok('config::gen::crypto');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

my $pkg = q{gen::crypto};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

ok(-f $step->{digest_pmc_template}, "Able to locate source code file");

my $has_crypto_orig = $conf->data->get('has_crypto');
$conf->data->set( has_crypto => undef );
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{skipped}, "Got expected result");
# re-set for next test
$conf->data->set( has_crypto => $has_crypto_orig );
$step->set_result( q{} );

$conf->replenish($serialized);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  gen_crypto-01.t - test gen::crypto

=head1 SYNOPSIS

    % prove t/steps/gen_crypto-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::crypto.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::crypto, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
