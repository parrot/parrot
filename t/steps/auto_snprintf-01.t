#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_snprintf-01.t

use strict;
use warnings;
use Test::More tests => 33;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::hints');
use_ok('config::auto::attributes');
use_ok('config::auto::snprintf');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{init::hints}, $args);
test_step_thru_runstep($conf, q{auto::attributes}, $args);

my $pkg = q{auto::snprintf};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

# The test of runstep() below will need to be TODO-ed until such time as
# we can test with all the data which the Parrot::Configure object would
# normally have during regular configuration at the onset of this step.
# That's because runstep() consists almost solely of calls to C
# programs.  We can't refactor runstep()'s guts out into internal
# subroutines and test them explicitly as we've been able to do for
# other configuration steps.  We won't lose any coverage by commenting
# out the TODO block for the time being, as the coverage analysis will,
# at the very least, pick up runstep() while running the step itself.
#
#TODO: {
#    # http://rt.perl.org/rt3/Ticket/Display.html?id=47391
#    local $TODO =
#        q<Reported failing where vendor-supplied Perl 5 Config.pm does not match true state of system available for Parrot configuration>;
#    ok($step->runstep($conf), "runstep() returned true value");
#} #'


$conf->replenish($serialized);

########## _evaluate_snprintf() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

my $res;
$res = q{old snprintf};
ok($step->_evaluate_snprintf($conf, $res),
    "_evaluate_snprintf returned true value");
ok($conf->data->get('HAS_OLD_SNPRINTF'),
    "Got expected value");

$res = q{C99 snprintf};
ok($step->_evaluate_snprintf($conf, $res),
    "_evaluate_snprintf returned true value");
ok($conf->data->get('HAS_C99_SNPRINTF'),
    "Got expected value");
ok($conf->data->get('HAS_SNPRINTF'),
    "Got expected value");

$conf->replenish($serialized);

########## --verbose; _evaluate_snprintf() ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

{
    my $stdout;
    my $res = q{snprintf};
    my $ret = capture(
        sub { $step->_evaluate_snprintf($conf, $res) },
        \$stdout
    );
    ok($ret, "_evaluate_snprintf returned true value");
    ok($conf->data->get('HAS_SNPRINTF'),
        "Got expected value");
}

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_snprintf-01.t - test auto::snprintf

=head1 SYNOPSIS

    % prove t/steps/auto_snprintf-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::snprintf.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::snprintf, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
