#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_socklen_t-01.t

use strict;
use warnings;
use Test::More tests => 16;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::socklen_t');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########### regular ###########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::socklen_t};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
ok(defined($step->result()), "A result has been defiined");

$conf->replenish($serialized);

##### _evaluate_socklen_t() #####

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my $d_socklen_t;

$d_socklen_t = q{alpha};
ok($step->_evaluate_socklen_t($conf, $d_socklen_t),
    "_evaluate_socklen_t() completed satisfactorily");
is($step->result(), q{yes}, "Got expected result");
is($conf->data->get('has_socklen_t'), 1,
    "has_socklen_t set as expected");

$d_socklen_t = undef;
ok($step->_evaluate_socklen_t($conf, $d_socklen_t),
    "_evaluate_socklen_t() completed satisfactorily");
is($step->result(), q{no}, "Got expected result");
is($conf->data->get('has_socklen_t'), 0,
    "has_socklen_t set as expected");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_socklen_t-01.t - test auto::socklen_t

=head1 SYNOPSIS

    % prove t/steps/auto_socklen_t-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::socklen_t.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::socklen_t, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
