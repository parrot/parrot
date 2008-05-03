#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# auto_pcre-02.t

use strict;
use warnings;
use Test::More tests => 21;
use Carp;
use lib qw( lib );
use_ok('config::init::defaults');
use_ok('config::auto::pcre');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::pcre};

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
    win32_nongcc    => 'pcre.lib',
    default         => '-lpcre',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/-lpcre/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'mswin32';
$cc = 'cc';
$initial_value = $conf->data->get( 'libs' );
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'pcre.lib',
    default         => '-lpcre',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/pcre\.lib/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'foobar';
$cc = 'gcc';
$initial_value = $conf->data->get( 'libs' );
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'pcre.lib',
    default         => '-lpcre',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/-lpcre/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

# Mock different outcomes of _evaluate_cc_run
my ($test, $has_pcre);
my $verbose = $conf->options->get('verbose');

$test = q{pcre foobar};
ok(! $step->_evaluate_cc_run($test, $verbose),
    "Got expected setting for has_pcre");

$test = q{pcre 4.1};
ok($step->_evaluate_cc_run($test, $verbose),
    "_evaluate_cc_run returned true value as expected");
is($step->result(), q{yes, 4.1}, "Got expected PCRE version");

# Mock different outcomes of _recheck_settings()
my ($libs, $ccflags, $linkflags);

$libs = q{-lalpha};
$ccflags = q{-Ibeta};
$linkflags = q{-Lgamma};
$verbose = undef;
$step->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
like($conf->data->get('libs'), qr/$libs/,
    "Got expected value for 'libs'");
like($conf->data->get('ccflags'), qr/$ccflags/,
    "Got expected value for 'ccflags'");
like($conf->data->get('linkflags'), qr/$linkflags/,
    "Got expected value for 'linkflags'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto_pcre-02.t - test config::auto::pcre

=head1 SYNOPSIS

    % prove t/steps/auto_pcre-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test internal subroutines of configuration step class
auto::pcre in the 'normal' case.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pcre, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
