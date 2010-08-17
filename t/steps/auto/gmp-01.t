#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/gmp-01.t

use strict;
use warnings;
use Test::More tests =>  26;
use Carp;
use Cwd;
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::auto::gmp');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a link to an introduction
to the GNU MP library.

=cut

########### --without-gmp ###########

my ($args, $step_list_ref) = process_options( {
    argv => [ q{--without-gmp} ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::gmp};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('has_gmp'), 0,
    "Got expected value for 'has_gmp'");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

########### _select_lib() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
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
    win32_nongcc    => 'gmp.lib',
    default         => '-lgmp',
} ),
   '-lgmp',
   "_select_lib() returned expected value");

$osname = 'mswin32';
$cc = 'cc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'gmp.lib',
    default         => '-lgmp',
} ),
   'gmp.lib',
   "_select_lib() returned expected value");

$osname = 'foobar';
$cc = undef;
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'gmp.lib',
    default         => '-lgmp',
} ),
   '-lgmp',
   "_select_lib() returned expected value");

my ($flagsbefore, $flagsafter);
my $cwd = cwd();

########### _evaluate_cc_run() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my ($test, $has_gmp);

$test = $step->{cc_run_expected};
$has_gmp = 0;
$conf->options->set(verbose => undef);
$has_gmp = $step->_evaluate_cc_run($conf, $test, $has_gmp);
is($step->result, 'yes', "Got expected result");
is($conf->data->get('gmp'), 'define', "Expected value set for 'gmp'");
is($conf->data->get('HAS_GMP'), 1, "Expected value set for 'HAS_GMP'");
# prepare for next test
$conf->data->set('gmp' => undef);
$conf->data->set('HAS_GMP' => undef);
$step->set_result(undef);

$test = '12345';
$has_gmp = 0;
$conf->options->set(verbose => undef);
$has_gmp = $step->_evaluate_cc_run($conf, $test, $has_gmp);
ok(! defined($step->result), "Result undefined as expected");
is($has_gmp, 0, "gmp status unchanged");

{
    my $stdout;
    $test = $step->{cc_run_expected};
    $has_gmp = 0;
    $conf->options->set(verbose => 1);
    capture(
        sub { $has_gmp =
            $step->_evaluate_cc_run($conf, $test, $has_gmp); },
        \$stdout,
    );
    is($step->result, 'yes', "Got expected result");
    is($conf->data->get('gmp'), 'define', "Expected value set for 'gmp'");
    is($conf->data->get('HAS_GMP'), 1, "Expected value set for 'HAS_GMP'");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # prepare for next test
    $conf->data->set('gmp' => undef);
    $conf->data->set('HAS_GMP' => undef);
    $step->set_result(undef);
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/gmp-01.t - test auto::gmp

=head1 SYNOPSIS

    % prove t/steps/auto/gmp-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::gmp.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gmp, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
