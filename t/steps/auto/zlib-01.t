#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use Test::More tests =>  24;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::zlib');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## --without-zlib ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-zlib} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::zlib};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('has_zlib'), 0,
    "Got expected value for 'has_zlib'");
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
    win32_nongcc    => 'zlib.lib',
    default         => '-lz',
} ),
   '-lz',
   "_select_lib() returned expected value");

$osname = 'mswin32';
$cc = 'cc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'zlib.lib',
    default         => '-lz',
} ),
   'zlib.lib',
   "_select_lib() returned expected value");

$osname = 'foobar';
$cc = 'cc';
is($step->_select_lib( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'zlib.lib',
    default         => '-lz',
} ),
   '-lz',
   "_select_lib() returned expected value");

$conf->replenish($serialized);

########## --without-zlib; _evaluate_cc_run() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-zlib} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my ($test, $has_zlib);
$test = qq{1.2.3\n};
$has_zlib = 0;
$conf->options->set(verbose => undef);
$has_zlib = $step->_evaluate_cc_run($conf, $test, $has_zlib);
is($has_zlib, 1, "'has_zlib' set as expected");
is($step->result(), 'yes, 1.2.3', "Expected result was set");
# Prepare for next test
$step->set_result(undef);

$test = qq{foobar};
$has_zlib = 0;
$conf->options->set(verbose => undef);
$has_zlib = $step->_evaluate_cc_run($conf, $test, $has_zlib);
is($has_zlib, 0, "'has_zlib' set as expected");
ok(! defined $step->result(), "Result is undefined, as expected");

{
    my $stdout;
    $test = qq{1.2.3\n};
    $has_zlib = 0;
    $conf->options->set(verbose => 1);
    capture(
        sub { $has_zlib =
            $step->_evaluate_cc_run($conf, $test, $has_zlib); },
        \$stdout,
    );
    is($has_zlib, 1, "'has_zlib' set as expected");
    is($step->result(), 'yes, 1.2.3', "Expected result was set");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # Prepare for next test
    $step->set_result(undef);
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/zlib-01.t - test auto::zlib

=head1 SYNOPSIS

    % prove t/steps/auto/zlib-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::zlib.

=head1 HISTORY

Mostly taken from F<t/steps/auto/gdbm-01.t>.

=head1 AUTHOR

Francois Perrad

=head1 SEE ALSO

config::auto::zlib, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
