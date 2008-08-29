#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gdbm-01.t

use strict;
use warnings;
use Test::More tests =>  62;
use Carp;
use Cwd;
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gdbm');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a short description of what
the 'gdbm' is.  Some branches are compiler- or OS-specific.  As noted in
a comment in the module, please consider the issues raised in
http://rt.perl.org/rt3/Ticket/Display.html?id=43134.

=cut

########## --without-gdbm  ##########

my ($args, $step_list_ref) = process_options( {
    argv => [ q{--without-gdbm} ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::gdbm};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('has_gdbm'), 0,
    "Got expected value for 'has_gdbm'");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

########## --without-gdbm; _handle_darwin_for_fink() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-gdbm} ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $osname;
my ($flagsbefore, $flagsafter);
$osname = 'foobar';
$flagsbefore = $conf->data->get( 'linkflags' );
ok($step->_handle_darwin_for_fink($conf, $osname, 'gdbm.h'),
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
    ok($step->_handle_darwin_for_fink($conf, $osname, 'gdbm.h'),
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
    my $foo = File::Spec->catfile( $includedir, 'gdbm.h' );
    open my $FH, ">", $foo or croak "Could not open for writing";
    print $FH "Hello world\n";
    close $FH or croak "Could not close after writing";

    $osname = 'darwin';
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'gdbm.h'),
        "handle_darwin_for_fink() returned true value");
    $flagsafter = $conf->data->get( 'linkflags' );
    isnt($flagsbefore, $flagsafter, "Change in linkflags, as expected");
    like($conf->data->get( 'linkflags' ), qr/-L\Q$libdir\E/,
        "'linkflags' modified as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

$conf->replenish($serialized);

########## --without-gdbm; _evaluate_cc_run() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-gdbm} ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my ($test, $has_gdbm, $verbose);
$test = qq{gdbm is working.\n};
$has_gdbm = 0;
$verbose = undef;
$has_gdbm = $step->_evaluate_cc_run($test, $has_gdbm, $verbose);
is($has_gdbm, 1, "'has_gdbm' set as expected");
is($step->result(), 'yes', "Expected result was set");
# Prepare for next test
$step->set_result(undef);
$test = qq{foobar};
$has_gdbm = 0;
$verbose = undef;
$has_gdbm = $step->_evaluate_cc_run($test, $has_gdbm, $verbose);
is($has_gdbm, 0, "'has_gdbm' set as expected");
ok(! defined $step->result(), "Result is undefined, as expected");
{
    my $stdout;
    $test = qq{gdbm is working.\n};
    $has_gdbm = 0;
    $verbose = 1;
    capture(
        sub { $has_gdbm =
            $step->_evaluate_cc_run($test, $has_gdbm, $verbose); },
        \$stdout,
    );
    is($has_gdbm, 1, "'has_gdbm' set as expected");
    is($step->result(), 'yes', "Expected result was set");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # Prepare for next test
    $step->set_result(undef);
}

$conf->replenish($serialized);

########## --without-gdbm; _recheck_settings() ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-gdbm} ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

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

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gdbm-01.t - test auto::gdbm

=head1 SYNOPSIS

    % prove t/steps/auto_gdbm-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::gdbm.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gdbm, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
