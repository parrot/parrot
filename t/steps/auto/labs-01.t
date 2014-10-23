#! perl
# Copyright (C) 2007,2014, Parrot Foundation.
# auto/labs-01.t

use strict;
use warnings;
use Test::More tests => 17;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::labs');
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

my $pkg = q{auto::labs};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

$conf->replenish($serialized);

########## _check() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$conf->data->set('HAS_LABS', 0);

my $res;
$res = q{labs};
ok($step->_check($conf, $res),
    "_check returned true value");
ok($conf->data->get('HAS_LABS'),
    "Got HAS_LABS");

$conf->data->set('HAS_LABS', 0);

$res = q{broken};
ok(!$step->_check($conf, $res),
    "_check returned false value");
ok(!$conf->data->get('HAS_LABS'),
    "Got !HAS_LABS");

$conf->replenish($serialized);
$conf->data->set('HAS_LABS', 0);

########## --verbose; _check() ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

{
    my $stdout;
    my $res = q{labs};
    my $ret = capture(
        sub { $step->_check($conf, $res) },
        \$stdout
    );
    ok($ret, "_check returned true value");
    ok($conf->data->get('HAS_LABS'),
        "Got --verbose HAS_LABS");
}

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/labs-01.t - test auto::labs

=head1 SYNOPSIS

    % prove t/steps/auto/labs-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::labs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::labs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
