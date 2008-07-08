#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_icu-04.t

use strict;
use warnings;
use Test::More tests => 17;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use_ok('config::init::defaults');
use_ok('config::auto::icu');
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::icu};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $phony = q{phony};
$step->{icuconfig_default} = $phony;

{
    my ($stdout, $stderr);
    my $ret;
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok( $ret, "$step_name runstep() returned true value" );
    my $expected = q{no icu-config};
    is($step->result(), $expected,
        "Got expected return value: $expected");
    like($stdout,
        qr/Discovered $step->{icuconfig_default} --exists returns/s,
        "Got expected verbose output re return value",
    );
    like($stdout,
        qr/Could not locate an icu-config program/s,
        "Got expected verbose output re inability to locate icu-config program",
    );
}
$step->set_result( q{} );

$conf->options->set( verbose => undef );
{
    my ($stdout, $stderr);
    my $ret;
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok( $ret, "$step_name runstep() returned true value" );
    my $expected = q{no icu-config};
    is($step->result(), $expected,
        "Got expected return value: $expected");
    ok(! $stdout, "No verbose output captured, as expected");
}

    
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_icu-04.t - test config::auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto_icu-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::icu in the case where an alternate
ICU configuration program is utilized.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::icu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
