#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 144-auto_readline-01.t

use strict;
use warnings;
use Test::More tests => 35;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib qw( lib );
use_ok('config::init::defaults');
use_ok('config::auto::readline');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a short description of what
the 'readline' function is.  Some branches are compiler- or OS-specific.
As noted in a comment in the module, please consider the issues raised
in http://rt.perl.org/rt3/Ticket/Display.html?id=43134.

=cut

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::readline};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

# Mock values for OS and C-compiler
my ($osname, $cc);
$osname = 'mswin32';
$cc = 'gcc';
ok(auto::readline::_handle_mswin32($conf, $osname, $cc),
    "_handle_mswin32() returned true value");
like($conf->data->get( 'libs' ), qr/-lreadline -lgw32c/,
    "'libs' modified as expected");

$osname = 'mswin32';
$cc = 'cc';
ok(auto::readline::_handle_mswin32($conf, $osname, $cc),
    "_handle_mswin32() returned true value");
like($conf->data->get( 'libs' ), qr/readline\.lib/,
    "'libs' modified as expected");

$osname = 'foobar';
$cc = undef;
ok(auto::readline::_handle_mswin32($conf, $osname, $cc),
    "_handle_mswin32() returned true value");
like($conf->data->get( 'libs' ), qr/-lreadline/,
    "'libs' modified as expected");

my ($flagsbefore, $flagsafter);

$osname = 'foobar';
$flagsbefore = $conf->data->get( 'linkflags' );
ok($step->_handle_darwin_for_fink($conf, $osname, 'readline/readline.h'),
    "handle_darwin_for_fink() returned true value");
$flagsafter = $conf->data->get( 'linkflags' );
is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok(chdir $tdir, "Able to change to temporary directory");
    ok( (mkdir 'lib'), "Able to make lib directory");
    ok( (mkdir 'include'), "Able to make include directory");
    $conf->data->set('fink_lib_dir' => qq{$tdir/lib});
    $conf->data->set('fink_include_dir' => qq{$tdir/include});
    $osname = 'darwin';
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'readline/readline.h'),
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
    ok( (mkdir 'include/readline'), "Able to make include/readline directory");
    my $libdir = qq{$tdir2/lib};
    my $includedir = qq{$tdir2/include};
    $conf->data->set('fink_lib_dir' => $libdir);
    $conf->data->set('fink_include_dir' => $includedir);
    my $foo = qq{$includedir/readline/readline.h};
    open my $FH, ">", $foo or croak "Could not open for writing";
    print $FH "Hello world\n";
    close $FH or croak "Could not close after writing";
    
    $osname = 'darwin';
    $flagsbefore = $conf->data->get( 'linkflags' );
    ok($step->_handle_darwin_for_fink($conf, $osname, 'readline/readline.h'),
        "handle_darwin_for_fink() returned true value");
    $flagsafter = $conf->data->get( 'linkflags' );
    isnt($flagsbefore, $flagsafter, "Change in linkflags, as expected");
    like($conf->data->get( 'linkflags' ), qr/-L$libdir/,
        "'linkflags' modified as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

$osname = 'foobar';
$flagsbefore = $conf->data->get( 'linkflags' );
ok(auto::readline::_handle_darwin_for_macports($conf, $osname, 'readline/readline.h'),
    "handle_darwin_for_macports() returned true value");
$flagsafter = $conf->data->get( 'linkflags' );
is($flagsbefore, $flagsafter, "No change in linkflags, as expected");

$osname = 'darwin';
ok(auto::readline::_handle_darwin_for_macports($conf, $osname, 'readline/readline.h'),
    "handle_darwin_for_macports() returned true value");
# Cannot yet do more specific tests for macports, because path to
# readline/readline.h in sub is an absolute path.

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

144-auto_readline-01.t - test config::auto::readline

=head1 SYNOPSIS

    % prove t/configure/144-auto_readline-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::readline.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::readline, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
