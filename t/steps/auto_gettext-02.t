#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gettext-02.t

use strict;
use warnings;
use Test::More tests => 25;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gettext');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;


my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::gettext};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );

# Mock values for OS and C-compiler
my ($osname, $cc, $initial_value);
$osname = 'mswin32';
$cc = 'gcc';
$initial_value = $conf->data->get( 'libs' );
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/-lintl/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'mswin32';
$cc = 'cc';
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/intl.lib/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'foobar';
$cc = 'cc';
$conf->data->set( glibc => 1 );
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
    "_add_to_libs() returned true value");
unlike($conf->data->get( 'libs' ), qr/-lintl/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'foobar';
$cc = 'cc';
$conf->data->set( glibc => undef );
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/-lintl/,
    "'libs' modified as expected");

my ($test, $verbose);
my $has_gettext;

$test = "Hello, world!\n";
$verbose = undef;
$has_gettext = $step->_evaluate_cc_run($test, $verbose);
is($has_gettext, 1, "Got expected value for has_gettext");
is($step->result(), 'yes', "Expected result was set");
# Prepare for next test
$step->set_result(undef);

{
    my $stdout;
    $test = "Hello, world!\n";
    $verbose = 1;
    capture(
        sub {
            $has_gettext = $step->_evaluate_cc_run($test, $verbose);
        },
        \$stdout,
    );
    is($has_gettext, 1, "Got expected value for has_gettext");
    is($step->result(), 'yes', "Expected result was set");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # Prepare for next test
    $step->set_result(undef);
}

$test = "Foobar\n";
$verbose = undef;
$has_gettext = $step->_evaluate_cc_run($test, $verbose);
is($has_gettext, 0, "Got expected value for has_gettext");
ok(! defined $step->result(), "As expected, result is not yet defined");

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gettext-02.t - test config::auto::gettext

=head1 SYNOPSIS

    % prove t/steps/auto_gettext-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test internal method
C<auto::gettext::_evaluate_cc_run()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gettext, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
