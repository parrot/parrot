#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_jit-01.t

use strict;
use warnings;
use Test::More tests =>  50;
use Carp;
use Cwd;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use File::Spec;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::jit');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );


my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::jit};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

########### _check_jitcapability() ###########

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'bar';
    my $osname = 'baz';
    my $corejitdir = File::Spec->catdir ( $jitbase, $cpuarch );
    mkpath( $corejitdir, 0, 755 ) or croak "Unable to make testing directory";
    my $corejit = File::Spec->catfile( $jitbase, $cpuarch, q{core.jit} );
    is( $step->_check_jitcapability($corejit, $cpuarch, $osname), 0,
        "Got expected value for _check_jitcapability(): no core.jit case");

    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'bar';
    my $osname = 'baz';
    my $corejitdir = File::Spec->catdir ( $jitbase, $cpuarch );
    mkpath( $corejitdir, 0, 755 ) or croak "Unable to make testing directory";
    my $corejit = File::Spec->catfile( $jitbase, $cpuarch, q{core.jit} );
    open my $FH, '>', $corejit
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";
    is( $step->_check_jitcapability($corejit, $cpuarch, $osname), 0,
        "Got expected value for _check_jitcapability(): no JIT on this architecture case");

    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'bar';
    my $osname = 'baz';
    my $corejitdir = File::Spec->catdir ( $jitbase, $cpuarch );
    mkpath( $corejitdir, 0, 755 ) or croak "Unable to make testing directory";
    my $corejit = File::Spec->catfile( $jitbase, $cpuarch, q{core.jit} );
    open my $FH, '>', $corejit
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";
    my $orig = $step->{jit_is_working};
    $step->{jit_is_working} = { $cpuarch => 1 };
    is( $step->_check_jitcapability($corejit, $cpuarch, $osname), 1,
        "Got expected value for _check_jitcapability(): mock JIT case");
    $step->{jit_is_working} = $orig;

    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'i386';
    my $osname = 'darwin';
    my $corejitdir = File::Spec->catdir ( $jitbase, $cpuarch );
    mkpath( $corejitdir, 0, 755 ) or croak "Unable to make testing directory";
    my $corejit = File::Spec->catfile( $jitbase, $cpuarch, q{core.jit} );
    open my $FH, '>', $corejit
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";
    my $orig = $step->{jit_is_working};
    $step->{jit_is_working} = { $cpuarch => 1 };
    is( $step->_check_jitcapability($corejit, $cpuarch, $osname), 0,
        "Got expected value for _check_jitcapability(): mock darwin-i386 case");
    $step->{jit_is_working} = $orig;

    chdir $cwd or croak "Unable to change back to starting directory";
}

########### _handle_asm() ###########

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'bar';
    my $jitarchname = "${cpuarch}-baz";
    my $asmdir = File::Spec->catdir( $jitbase, $cpuarch );
    mkpath( $asmdir, 0, 755 ) or croak "Unable to make testing directory";
    mkpath( q{src}, 0, 755 ) or croak "Unable to make testing directory";

    ok(auto::jit::_handle_asm( {
        conf        => $conf,
        jitbase     => $jitbase,
        cpuarch     => $cpuarch,
        jitarchname => $jitarchname,
    } ), "_handle_asm() returned successfully");
    is( $conf->data->get( 'asmfun_o' ), q{},
        "Got expected value for asmfun_o: no asm case");
    $conf->data->set( asmfun_o => undef ); # reset for next test

    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'bar';
    my $jitarchname = "${cpuarch}-baz";
    my $asmdir = File::Spec->catdir( $jitbase, $cpuarch );
    mkpath( $asmdir, 0, 755 ) or croak "Unable to make testing directory";
    mkpath( q{src}, 0, 755 ) or croak "Unable to make testing directory";

    my $sjit =
        File::Spec->catfile( $jitbase, $cpuarch, qq{${jitarchname}.s} );
    open my $FH, '>', $sjit
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";

    ok(auto::jit::_handle_asm( {
        conf        => $conf,
        jitbase     => $jitbase,
        cpuarch     => $cpuarch,
        jitarchname => $jitarchname,
    } ), "_handle_asm() returned successfully");
    is( $conf->data->get( 'asmfun_o' ), q{src/asmfun$(O)},
        "Got expected value for asmfun_o: sjit case");
    $conf->data->set( asmfun_o => undef ); # reset for next test

    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'bar';
    my $jitarchname = "${cpuarch}-baz";
    my $asmdir = File::Spec->catdir( $jitbase, $cpuarch );
    mkpath( $asmdir, 0, 755 ) or croak "Unable to make testing directory";
    mkpath( q{src}, 0, 755 ) or croak "Unable to make testing directory";
    my $asm = File::Spec->catfile( $jitbase, $cpuarch, q{asm.s} );
    open my $FH, '>', $asm
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";

    ok(auto::jit::_handle_asm( {
        conf        => $conf,
        jitbase     => $jitbase,
        cpuarch     => $cpuarch,
        jitarchname => $jitarchname,
    } ), "_handle_asm() returned successfully");
    is( $conf->data->get( 'asmfun_o' ), q{src/asmfun$(O)},
        "Got expected value for asmfun_o: asm case");
    $conf->data->set( asmfun_o => undef ); # reset for next test

    chdir $cwd or croak "Unable to change back to starting directory";
}

########### _first_probe_for_exec() ###########

is(  $step->_first_probe_for_exec( 'i386', 'foobar' ), 0,
    "Got expected value for _first_probe_for_exec");
is(  $step->_first_probe_for_exec( 'i386', 'openbsd' ), 1,
    "Got expected value for _first_probe_for_exec");
is(  $step->_first_probe_for_exec( 'foobar', 'openbsd' ), 0,
    "Got expected value for _first_probe_for_exec");

########### _handle_execcapable() ###########

if (! defined $conf->data->get('cpuarch') ) {
    $conf->data->set('cpuarch' => 1)
}

ok(auto::jit::_handle_execcapable($conf, 1),
    "_handle_execcapable() returned true value");
is($conf->data->get('execcapable'), 1,
    "Got expected value for execcapable");
# prepare for next test
$conf->data->set('execcapable' => undef);

ok(auto::jit::_handle_execcapable($conf, 0),
    "_handle_execcapable() returned true value");
is($conf->data->get('execcapable'), 0,
    "Got expected value for execcapable");
$conf->data->set('execcapable' => undef);

########### _handle_exec_protect() ###########

$conf->data->set( has_exec_protect => undef );
auto::jit::_handle_exec_protect($conf, 0, 0);
ok( ! defined $conf->data->get( 'has_exec_protect'),
    "'has_exec_protect' undefined, as expected");

auto::jit::_handle_exec_protect($conf, 1, 0);
is( $conf->data->get( 'has_exec_protect'), 1,
    "Got expected value for 'has_exec_protect'");
$conf->data->set( has_exec_protect => undef );

{
    my ($stdout, $stderr);
    capture(
        sub { auto::jit::_handle_exec_protect($conf, 0, 1); },
        \$stdout,
        \$stderr,
    );
    ok( ! defined $conf->data->get( 'has_exec_protect'),
        "'has_exec_protect' undefined, as expected");
    like($stdout, qr/no\)/, "Got expected verbose output");
    $conf->data->set( has_exec_protect => undef );
}

{
    my ($stdout, $stderr);
    capture(
        sub { auto::jit::_handle_exec_protect($conf, 1, 1); },
        \$stdout,
        \$stderr,
    );
    is( $conf->data->get( 'has_exec_protect'), 1,
        "Got expected value for 'has_exec_protect'");
    like($stdout, qr/yes\)/, "Got expected verbose output");
    $conf->data->set( has_exec_protect => undef );
}

$conf->replenish($serialized);

($args, $step_list_ref) = process_options( {
    argv => [ q{--jitcapable=0}, q{--verbose}  ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

# Mock some values so that we can get to the point inside runstep() where the
# command-line option for jitcapable is relevant.

$cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $jitbase = 'foo';
    my $cpuarch = 'i386';
    my $osname = 'darwin';
    my $corejitdir = File::Spec->catdir ( $jitbase, $cpuarch );
    mkpath( $corejitdir, 0, 755 ) or croak "Unable to make testing directory";
    my $corejit = File::Spec->catfile( $jitbase, $cpuarch, q{core.jit} );
    open my $FH, '>', $corejit
        or croak "Unable to open handle to file for testing";
    print $FH qq{Hello, JIT\n};
    close $FH or croak "Unable to close handle to file for testing";
    my $orig = $step->{jit_is_working};
    $step->{jit_is_working} = { $cpuarch => 1 };
    $conf->data->set( cpuarch => $cpuarch );
    $conf->data->set( osname => $osname );
    {
        my ($stdout, $stderr, $ret);
        capture(
            sub { $ret = $step->runstep($conf); },
            \$stdout,
            \$stderr,
        );
        ok( $ret, "runstep() returned true value" );
        like($stdout, qr/yes|no/s, "Got expected verbose output");
    }
    $step->{jit_is_working} = $orig;
    $conf->data->set( cpuarch => undef );
    $conf->data->set( osname => undef );

    is( $conf->data->get( 'jitarchname' ), 'nojit',
        "Got expected value for jitarchname");
    is( $conf->data->get( 'jitcapable' ), 0,
        "Got expected value for jitcapable");
    is( $conf->data->get( 'execcapable' ), 0,
        "Got expected value for execcapable");
    is( $conf->data->get( 'cc_hasjit' ), '',
        "Got expected value for cc_hasjit");
    is( $conf->data->get( 'TEMP_jit_o' ), '',
        "Got expected value for TEMP_jit_o");
    is( $conf->data->get( 'TEMP_exec_h' ), '',
        "Got expected value for TEMP_exec_h");
    is( $conf->data->get( 'TEMP_exec_o' ), '',
        "Got expected value for TEMP_exec_o");
    is( $conf->data->get( 'TEMP_exec_dep' ), '',
        "Got expected value for TEMP_exec_dep");
    is( $step->result(), 'no',
        "Got expected result for no JIT");

    chdir $cwd or croak "Unable to change back to starting directory";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_jit-01.t - test auto::jit

=head1 SYNOPSIS

    % prove t/steps/auto_jit-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::jit.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::jit, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
