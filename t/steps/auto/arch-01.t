#! perl
# Copyright (C) 2007-2011, Parrot Foundation.
# auto/arch-01.t

use strict;
use warnings;
use Test::More tests =>  89;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::arch');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::arch};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($ret, $stdout);
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
    );
    ok( $ret, "runstep() returned true value" );
    is($step->result(), q{}, "Result was empty string as expected");
    like($stdout,
        qr/determining operating system and cpu architecture/s,
        "Got expected verbose output"
    );
}

$conf->replenish($serialized);

########## mock architecture ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $pseudoarch = q{foobar};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), $pseudoarch,
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock darwin ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$step->{unamep} = 'powerpc';
$pseudoarch = q{darwin-thread-multi-2level};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{ppc},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{darwin},
    "'osname' was set as expected");

$conf->replenish($serialized);

######### mock darwin ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$step->{unamep} = 'i386';
$pseudoarch = q{darwin-thread-multi-2level};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{darwin},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock win32 ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{MSWin32-x64};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{amd64},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{MSWin32},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock win32 ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{MSWin32-i386};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{MSWin32},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock cygwin ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{cygwin};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{cygwin},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock msys ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{msys};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('osname'), q{msys},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock powerpc-linux ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{powerpc-linux};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{ppc},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{linux},
    "'osname' was set as expected");

$conf->replenish($serialized);

########## mock cygwin-i486 ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{cygwin-i486};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{i386},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{cygwin},
    "'osname' was set as expected");

########## mock solaris i86pc ##########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$pseudoarch = q{i86pc-solaris};
$conf->data->set('archname' => $pseudoarch);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value: $pseudoarch" );
is($step->result(), q{}, "Result was empty string as expected");
# Since on this architecture we call uname -p,
# we cannot test 'cpuarch' easily
#is($conf->data->get('cpuarch'), q{},
#    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{solaris},
    "'osname' was set as expected");

########## _get_platform() ##########

my $exp;

$conf->data->set( osname => 'msys' );
$conf->data->set( archname => 'foo' );
$exp = q{win32};
is( $step->_get_platform( $conf ), $exp,
    "Got expected platform for $exp");

$conf->data->set( osname => 'mingw' );
$conf->data->set( archname => 'foo' );
$exp = q{win32};
is( $step->_get_platform( $conf ), $exp,
    "Got expected platform for $exp");

$conf->data->set( osname => 'MSWin32' );
$conf->data->set( archname => 'foo' );
$exp = q{win32};
is( $step->_get_platform( $conf ), $exp,
    "Got expected platform for $exp");

$conf->data->set( archname => 'ia64-bar' );
$exp = q{ia64};
is( $step->_get_platform( $conf ), $exp,
    "Got expected platform for $exp");

$conf->data->set( archname => 'foo-bar' );
$conf->data->set( osname => 'bar' );
$exp = q{generic};
is( $step->_get_platform( $conf ), $exp,
    "Got expected platform for $exp");

########## _report_verbose() ##########

$conf->data->set( osname   => 'foo' );
$conf->data->set( cpuarch  => 'bar' );
$conf->data->set( platform => 'baz' );
$conf->options->set( verbose => 1 );
{
    my ($stdout, $stderr);
    capture(
        sub { auto::arch::_report_verbose($conf); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/osname:\s+?foo/s,
        "Got expected verbose output" );
    like( $stdout, qr/cpuarch:\s+?bar/s,
        "Got expected verbose output" );
    like( $stdout, qr/platform:\s+?baz/s,
        "Got expected verbose output" );
}
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/arch-01.t - test auto::arch

=head1 SYNOPSIS

    % prove t/steps/auto/arch-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::arch.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::arch, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
