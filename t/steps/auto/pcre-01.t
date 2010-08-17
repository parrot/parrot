#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# auto/pcre-01.t

use strict;
use warnings;
use Test::More tests => 23;
use Carp;
use lib qw( lib );
use_ok('config::auto::pcre');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########## --without-pcre ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-pcre} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::pcre};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok( $step->runstep($conf), "runstep() returned true value");
is( $step->result(), 'no', "Got expected result" );
is( $conf->data->get( 'HAS_PCRE' ), 0,
    "Got expected value for 'HAS_PCRE'");

$conf->replenish($serialized);

########## _select_lib() ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

# Mock values for OS and C-compiler
my ($osname, $cc, $initial_value);

$osname = 'mswin32';
$cc = 'gcc';
$initial_value = $conf->data->get( 'libs' );
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'pcre.lib',
    default         => '-lpcre',
} ),
   '-lpcre',
   "_select_lib() returned expected value");

$osname = 'mswin32';
$cc = 'cc';
$initial_value = $conf->data->get( 'libs' );
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'pcre.lib',
    default         => '-lpcre',
} ),
   'pcre.lib',
   "_select_lib() returned expected value");

$osname = 'foobar';
$cc = 'gcc';
$initial_value = $conf->data->get( 'libs' );
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'pcre.lib',
    default         => '-lpcre',
} ),
   '-lpcre',
   "_select_lib() returned expected value");

########## _evaluate_cc_run() ##########

# Mock different outcomes of _evaluate_cc_run
my ($test, $has_pcre);

$test = q{pcre foobar};
ok(! $step->_evaluate_cc_run($conf, $test),
    "Got expected setting for HAS_PCRE");

$test = q{pcre 4.1};
ok($step->_evaluate_cc_run($conf, $test),
    "_evaluate_cc_run returned true value as expected");
is($step->result(), q{yes, 4.1}, "Got expected PCRE version");

$conf->replenish($serialized);

########## --verbose; _evaluate_cc_run() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

# Mock different outcomes of _evaluate_cc_run

$test = q{pcre 4.0};
{
    my ($stdout, $stderr);
    capture(
        sub {
            $has_pcre = $step->_evaluate_cc_run($conf, $test);
        },
        \$stdout,
    );
    ok($has_pcre, "_evaluate_cc_run returned true value as expected");
    is($step->result(), q{yes, 4.0}, "Got expected PCRE version");
    like($stdout, qr/\(yes, 4\.0\)/, "Got expected verbose output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto/pcre-01.t - test auto::pcre

=head1 SYNOPSIS

    % prove t/steps/auto/pcre-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step class auto::pcre.

=head1 AUTHOR

Alberto Sim√es.

=head1 SEE ALSO

config::auto::pcre, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
