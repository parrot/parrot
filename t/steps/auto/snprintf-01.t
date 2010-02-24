#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/snprintf-01.t

use strict;
use warnings;
use Test::More tests => 18;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::snprintf');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::snprintf};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

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

auto/snprintf-01.t - test auto::snprintf

=head1 SYNOPSIS

    % prove t/steps/auto/snprintf-01.t

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
