#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gmp-04.t

use strict;
use warnings;
use Test::More tests => 22;
use Carp;
use Cwd;
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gmp');
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

my $pkg = q{auto::gmp};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

# Mock values for OS
my ($osname);
my ($flagsbefore, $flagsafter);

$osname = 'darwin';
$conf->data->set( 'linkflags'  => 'foobar' );
$flagsbefore = $conf->data->get( 'linkflags' );
$conf->data->set( fink_lib_dir  => undef );
$conf->data->set( fink_include_dir  => undef );
ok($step->_handle_darwin_for_fink($conf, $osname, 'gmp.h'),
    "handle_darwin_for_fink() returned true value");
$flagsafter = $conf->data->get( 'linkflags' );
is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

my $cwd;
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

auto_gmp-04.t - test config::auto::gmp

=head1 SYNOPSIS

    % prove t/steps/auto_gmp-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::gmp in the case where the
OS is Darwin but Fink is not installed.

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
