#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$
# auto_neg_0-01.t

use strict;
use warnings;
use Test::More tests => 23;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::neg_0');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput 'capture';

########### regular ###########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => 'configure',
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = 'auto::neg_0';

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, 'runstep() returned true value' );
ok( defined $step->result(), 'A result has been defined');

$conf->replenish($serialized);

##### _evaluate_cc_run() #####

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => 'configure',
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my $d_neg_0;
my $orig_has_neg_0 = 0;

$d_neg_0 = '-0';

is( $step->_evaluate_cc_run($conf, $d_neg_0, $orig_has_neg_0),
    1,
    '_evaluate_cc_run() completed satisfactorily' );

is( $step->result(), 'yes', 'Got expected result');

$d_neg_0 = '0';

is( $step->_evaluate_cc_run($conf, $d_neg_0, $orig_has_neg_0),
    0,
    '_evaluate_cc_run() completed satisfactorily' );
is( $step->result(), 'no', 'Got expected result' );

$conf->replenish($serialized);

########## --verbose; _evaluate_cc_run() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my $has_neg_0;

$d_neg_0 = '-0';
{
    my ($stdout, $stderr);
    capture(
        sub {
            $has_neg_0 = $step->_evaluate_cc_run(
                $conf, $d_neg_0, $orig_has_neg_0
            ),
        },
        \$stdout,
    );
    is( $has_neg_0, 1,
        'Got expected return value from _evaluate_cc_run()' );
    is( $step->result(), 'yes', 'Got expected result: yes' );
    like( $stdout, qr/\(yes\)/, 'Got expected verbose output' );
}

$d_neg_0 = '0';
{
    my ($stdout, $stderr);
    capture(
        sub {
            $has_neg_0 = $step->_evaluate_cc_run(
                $conf, $d_neg_0, $orig_has_neg_0
            ),
        },
        \$stdout,
    );
    is( $has_neg_0, 0,
        'Got expected return value from _evaluate_cc_run()' );
    is( $step->result(), 'no', 'Got expected result: no' );
    like( $stdout, qr/\(no\)/, 'Got expected verbose output' );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_neg_0-01.t - test auto::neg_0

=head1 SYNOPSIS

    % prove t/steps/auto_neg_0-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::neg_0.

=head1 AUTHOR

Reini Urban

=head1 SEE ALSO

config::auto::neg_0, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
