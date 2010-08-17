#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/msvc-01.t

use strict;
use warnings;
use Test::More tests => 38;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::msvc');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########## Win32 ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::msvc};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
SKIP: {
    skip 'MSVC is Windows only', 1 unless $^O =~ /Win32/i;
    ok($step->runstep($conf), "runstep() returned true value");
}

$conf->replenish($serialized);

########## _evaluate_msvc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
my $msvcref = { _MSC_VER => 1399 };
ok($step->_evaluate_msvc($conf, $msvcref),
    "_evaluate_msvc returned true value");
is($step->result, 'yes, 13.99', "Got expected result");
is($conf->data->get('msvcversion'), '13.99',
    "Got expected msvc version string");

$conf->replenish($serialized);

########## _evaluate_msvc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$msvcref = { _MSC_VER => 1400 };
ok($step->_evaluate_msvc($conf, $msvcref),
    "_evaluate_msvc returned true value");
is($step->result, 'yes, 14.0', "Got expected result");
is($conf->data->get('msvcversion'), '14.0',
    "Got expected msvc version string");
like(
    $conf->data->get('ccflags'),
    qr/\-D_CRT_SECURE_NO_DEPRECATE/,
    "ccflags appropriately adjusted given MSVC version"
);

$conf->replenish($serialized);

########## _handle_not_msvc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

my ($status, $major, $minor, $verbose);

$major = 13;
$minor = 99;
$status = $step->_handle_not_msvc($conf, $major, $minor);
ok(! defined $status, 'sub return value, as expected, not yet set');
ok(! $step->result(), 'result, as expected, not yet set');

$major = 13;
$minor = undef;
$status = $step->_handle_not_msvc($conf, $major, $minor);
ok($status, 'sub return value, as expected, set to true value');
is($step->result(), q{no}, 'Got expected result');
ok(! defined ($conf->data->get( 'msvcversion' )),
    'msvcversion is undef, as expected');

$major = undef;
$minor = 99;
$status = $step->_handle_not_msvc($conf, $major, $minor);
ok($status, 'sub return value, as expected, set to true value');
is($step->result(), q{no}, 'Got expected result');
ok(! defined ($conf->data->get( 'msvcversion' )),
    'msvcversion is undef, as expected');

$conf->replenish($serialized);

########## _handle_not_msvc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose=1} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
{
    my $stdout;
    $major = undef;
    $minor = undef;
    $verbose = 1;
    capture(
        sub { $status =
            $step->_handle_not_msvc($conf, $major, $minor); },
        \$stdout,
    );
    ok($status, 'sub return value, as expected, set to true value');
    is($step->result(), q{no}, 'Got expected result');
    ok(! defined ($conf->data->get( 'msvcversion' )),
        'msvcversion is undef, as expected');
    like($stdout, qr/\(no\)/, "Got expected verbose output");
    # Prepare for the next test.
    $step->set_result(undef);
}

########## _compose_msvcversion() ##########

my $msvcversion;

$major = 13;
$minor = 99;
$msvcversion = $step->_compose_msvcversion($major, $minor);
is($msvcversion, '13.99', "Got expected MSVC version");
is($step->result(), 'yes, 13.99', "Got expected result");
$step->set_result(undef);

{
    my $stdout;
    $major = 13;
    $minor = 99;
    capture(
        sub { $msvcversion =
            $step->_compose_msvcversion($major, $minor); },
        \$stdout,
    );
    is($msvcversion, '13.99', "Got expected MSVC version");
    is($step->result(), 'yes, 13.99', "Got expected result");
    $step->set_result(undef);
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/msvc-01.t - test auto::msvc

=head1 SYNOPSIS

    % prove t/steps/auto/msvc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::msvc.  Some tests run only if the system is
Win32.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::msvc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
