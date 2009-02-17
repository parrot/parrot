#! perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use Test::More tests =>  24;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::crypto');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## --without-crypto ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-crypto} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::crypto};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('has_crypto'), 0,
    "Got expected value for 'has_crypto'");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

########## _select_lib() ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
# Mock different OS/compiler combinations.
my ($osname, $cc, $initial_libs);
$initial_libs = $conf->data->get('libs');
$osname = 'mswin32';
$cc = 'gcc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'libcrypto.lib',
    default         => '-lcrypto',
} ),
   '-lcrypto',
   "_select_lib() returned expected value");

$osname = 'mswin32';
$cc = 'cc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'libcrypto.lib',
    default         => '-lcrypto',
} ),
   'libcrypto.lib',
   "_select_lib() returned expected value");

$osname = 'foobar';
$cc = 'cc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'libcrypto.lib',
    default         => '-lcrypto',
} ),
   '-lcrypto',
   "_select_lib() returned expected value");

my $verbose = undef;

$conf->replenish($serialized);

########## --without-crypto; _evaluate_cc_run() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-crypto} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my ($test, $has_crypto);
$test = qq{OpenSSL 0.9.9z\n};
$has_crypto = 0;
$verbose = undef;
$has_crypto = $step->_evaluate_cc_run($conf, $test, $has_crypto, $verbose);
is($has_crypto, 1, "'has_crypto' set as expected");
is($step->result(), 'yes, 0.9.9z', "Expected result was set");
# Prepare for next test
$step->set_result(undef);

$test = qq{foobar};
$has_crypto = 0;
$verbose = undef;
$has_crypto = $step->_evaluate_cc_run($conf, $test, $has_crypto, $verbose);
is($has_crypto, 0, "'has_crypto' set as expected");
ok(! defined $step->result(), "Result is undefined, as expected");

{
    my $stdout;
    $test = qq{OpenSSL 0.9.9z\n};
    $has_crypto = 0;
    $verbose = 1;
    capture(
        sub { $has_crypto =
            $step->_evaluate_cc_run($conf, $test, $has_crypto, $verbose); },
        \$stdout,
    );
    is($has_crypto, 1, "'has_crypto' set as expected");
    is($step->result(), 'yes, 0.9.9z', "Expected result was set");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # Prepare for next test
    $step->set_result(undef);
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_crypto-01.t - test auto::crypto

=head1 SYNOPSIS

    % prove t/steps/auto_crypto-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::crypto.

=head1 HISTORY

Mostly taken from F<t/steps/auto_gdbm-01.t>.

=head1 AUTHOR

Francois Perrad

=head1 SEE ALSO

config::auto::crypto, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
