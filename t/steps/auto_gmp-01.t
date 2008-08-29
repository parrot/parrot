#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gmp-01.t

use strict;
use warnings;
use Test::More tests =>  73;
use Carp;
use Cwd;
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gmp');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
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

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

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

########### _add_to_libs() ###########

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
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'gmp.lib',
    default         => '-lgmp',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/-lgmp/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'mswin32';
$cc = 'cc';
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'gmp.lib',
    default         => '-lgmp',
} ),
    "_add_to_libs() returned true value");
like($conf->data->get( 'libs' ), qr/gmp\.lib/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

$osname = 'foobar';
$cc = undef;
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_nongcc    => 'gmp.lib',
    default         => '-lgmp',
} ),
    "_handle_mswin32() returned true value");
like($conf->data->get( 'libs' ), qr/-lgmp/,
    "'libs' modified as expected");
# Restore value for next test.
$conf->data->set( 'libs' => $initial_value );

########### _handle_darwin_for_fink() ###########

my ($flagsbefore, $flagsafter);
$osname = 'foobar';
$flagsbefore = $conf->data->get( 'linkflags' );
ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
    "handle_darwin_for_fink() returned true value");
$flagsafter = $conf->data->get( 'linkflags' );
is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok(chdir $tdir, "Able to change to temporary directory");
    ok( (mkdir 'lib'), "Able to make lib directory");
    ok( (mkdir 'include'), "Able to make include directory");
    my $libdir = File::Spec->catdir( $tdir, 'lib' );
    my $includedir = File::Spec->catdir( $tdir, 'include' );
    $conf->data->set('fink_lib_dir' => $libdir);
    $conf->data->set('fink_include_dir' => $includedir);
    $osname = 'darwin';
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
        "handle_darwin_for_fink() returned true value");
    $flagsafter = $conf->data->get( 'linkflags' );
    is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

{
    my $tdir2 = tempdir( CLEANUP => 1 );
    ok(chdir $tdir2, "Able to change to temporary directory");
    ok( (mkdir 'lib'), "Able to make lib directory");
    ok( (mkdir 'include'), "Able to make include directory");
    my $libdir = File::Spec->catdir( $tdir2, 'lib' );
    my $includedir = File::Spec->catdir( $tdir2, 'include' );
    $conf->data->set('fink_lib_dir' => $libdir);
    $conf->data->set('fink_include_dir' => $includedir);
    my $foo = File::Spec->catfile( $includedir, 'gmp.h' );
    open my $FH, ">", $foo or croak "Could not open for writing";
    print $FH "Hello world\n";
    close $FH or croak "Could not close after writing";

    $osname = 'darwin';
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
        "handle_darwin_for_fink() returned true value");
    $flagsafter = $conf->data->get( 'linkflags' );
    isnt($flagsbefore, $flagsafter, "Change in linkflags, as expected");
    like($conf->data->get( 'linkflags' ), qr/-L\Q$libdir\E/,
        "'linkflags' modified as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

$conf->replenish($serialized);

########### _evaluate_cc_run() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my ($test, $has_gmp, $verbose);

$test = $step->{cc_run_expected};
$has_gmp = 0;
$verbose = undef;
$has_gmp = $step->_evaluate_cc_run($conf, $test, $has_gmp, $verbose);
is($step->result, 'yes', "Got expected result");
is($conf->data->get('gmp'), 'define', "Expected value set for 'gmp'");
is($conf->data->get('HAS_GMP'), 1, "Expected value set for 'HAS_GMP'");
# prepare for next test
$conf->data->set('gmp' => undef);
$conf->data->set('HAS_GMP' => undef);
$step->set_result(undef);

$test = '12345';
$has_gmp = 0;
$verbose = undef;
$has_gmp = $step->_evaluate_cc_run($conf, $test, $has_gmp, $verbose);
ok(! defined($step->result), "Result undefined as expected");
is($has_gmp, 0, "gmp status unchanged");

{
    my $stdout;
    $test = $step->{cc_run_expected};
    $has_gmp = 0;
    $verbose = 1;
    capture(
        sub { $has_gmp =
            $step->_evaluate_cc_run($conf, $test, $has_gmp, $verbose); },
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

########### _recheck_settings() ###########

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
is($step->result, 'no', "Expected result was set");

{
    my $stdout;
    $libs = q{-lalpha};
    $ccflags = q{-Ibeta};
    $linkflags = q{-Lgamma};
    $verbose = 1;
    capture(
        sub { $step->_recheck_settings(
            $conf, $libs, $ccflags, $linkflags, $verbose); },
        \$stdout,
    );
    like($conf->data->get('libs'), qr/$libs/,
        "Got expected value for 'libs'");
    like($conf->data->get('ccflags'), qr/$ccflags/,
        "Got expected value for 'ccflags'");
    like($conf->data->get('linkflags'), qr/$linkflags/,
        "Got expected value for 'linkflags'");
    is($step->result, 'no', "Expected result was set");
    like($stdout, qr/\(no\)/, "Got expected verbose output");
}

$conf->replenish($serialized);

########### _handle_darwin_for_fink() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
# Mock values for OS
$osname = 'darwin';
$conf->data->set( 'linkflags'  => 'foobar' );
$flagsbefore = $conf->data->get( 'linkflags' );
$conf->data->set( fink_lib_dir  => undef );
$conf->data->set( fink_include_dir  => undef );
ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
    "handle_darwin_for_fink() returned true value");
$flagsafter = $conf->data->get( 'linkflags' );
is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

$cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok(chdir $tdir, "Able to change to temporary directory");
    ok( (mkdir 'lib'), "Able to make lib directory");
#    ok( (mkdir 'include'), "Able to make include directory");
    my $libdir = File::Spec->catdir( $tdir, 'lib' );
    my $includedir = File::Spec->catdir( $tdir, 'include' );
    $conf->data->set('fink_lib_dir' => $libdir);
    $conf->data->set('fink_include_dir' => $includedir);
    $osname = 'darwin';
    $conf->data->set( 'linkflags'  => 'foobar' );
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
        "handle_darwin_for_fink() returned true value");
    $flagsafter = $conf->data->get( 'linkflags' );
    is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

{
    my $tdir1 = tempdir( CLEANUP => 1 );
    ok(chdir $tdir1, "Able to change to temporary directory");
#    ok( (mkdir 'lib'), "Able to make lib directory");
    ok( (mkdir 'include'), "Able to make include directory");
    my $libdir = File::Spec->catdir( $tdir1, 'lib' );
    my $includedir = File::Spec->catdir( $tdir1, 'include' );
    $conf->data->set('fink_lib_dir' => $libdir);
    $conf->data->set('fink_include_dir' => $includedir);
    $osname = 'darwin';
    $conf->data->set( 'linkflags'  => 'foobar' );
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
        "handle_darwin_for_fink() returned true value");
    $flagsafter = $conf->data->get( 'linkflags' );
    is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gmp-01.t - test auto::gmp

=head1 SYNOPSIS

    % prove t/steps/auto_gmp-01.t

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
