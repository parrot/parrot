#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/gettext-01.t

use strict;
use warnings;
use Test::More tests =>  32;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::gettext');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## --without-gettext ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-gettext} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::gettext};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('has_gettext'), 0,
    "Got expected value for 'has_gettext'");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

########## _select_lib() ##########

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
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
   '-lintl',
   "_select_lib() returned expected value");

$osname = 'mswin32';
$cc = 'cc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
   'intl.lib',
   "_select_lib() returned expected value");

$osname = 'foobar';
$cc = 'cc';
$conf->data->set( glibc => 1 );
isnt($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
   '-lintl',
   "_select_lib() returned expected value");

$osname = 'foobar';
$cc = 'cc';
$conf->data->set( glibc => undef );
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lintl',
    win32_nongcc    => 'intl.lib',
    default         => defined $conf->data->get('glibc') ? '' : '-lintl',
} ),
   '-lintl',
   "_select_lib() returned expected value");

########## _evaluate_cc_run() ##########

my $test;
my $has_gettext;

$test = "Hello, world!\n";
$conf->options->set(verbose => undef);
$has_gettext = $step->_evaluate_cc_run($conf, $test);
is($has_gettext, 1, "Got expected value for has_gettext");
is($step->result(), 'yes', "Expected result was set");
# Prepare for next test
$step->set_result(undef);

{
    my $stdout;
    $test = "Hello, world!\n";
    $conf->options->set(verbose => 1);
    capture(
        sub {
            $has_gettext = $step->_evaluate_cc_run($conf, $test);
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
$conf->options->set(verbose => undef);
$has_gettext = $step->_evaluate_cc_run($conf, $test);
is($has_gettext, 0, "Got expected value for has_gettext");
ok(! defined $step->result(), "As expected, result is not yet defined");

$conf->replenish($serialized);

########## --without-gettext; _handle_gettext() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-gettext} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$conf->options->set(verbose => undef);
$conf->data->set( ccflags => q{} );
$conf->data->set( libs    => q{} );
my $libs = q{foo bar baz};
ok(auto::gettext::_handle_gettext($conf, $libs),
    "_handle_gettext() returned true value");
like($conf->data->get( 'ccflags' ), qr/-DHAS_GETTEXT/,
    "HAS_GETTEXT was added to 'ccflags'");
like($conf->data->get( 'libs' ), qr/$libs/,
    "Values added to 'libs' as expected");

$conf->data->set( ccflags => q{} );
$conf->data->set( libs    => q{} );
{
    my ($stdout, $rv);
    $conf->options->set(verbose => 1);
    capture(
        sub { $rv = auto::gettext::_handle_gettext($conf, $libs); },
        \$stdout,
    );
    ok($rv, "_handle_gettext() returned true value");
    like($conf->data->get( 'ccflags' ), qr/-DHAS_GETTEXT/,
        "HAS_GETTEXT was added to 'ccflags'");
    like($conf->data->get( 'libs' ), qr/$libs/,
        "Values added to 'libs' as expected");
    like($stdout,
        qr/ccflags:\s.*-DHAS_GETTEXT/,
        "Got expected verbose output"
    );
    $conf->options->set(verbose => undef);
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/gettext-01.t - test auto::gettext

=head1 SYNOPSIS

    % prove t/steps/auto/gettext-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::gettext.

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
