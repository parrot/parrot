#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use Test::More tests => 19;
use Carp;
use Cwd;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::crypto');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;

my $args = process_options(
    {
        argv => [ q{--without-crypto} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::crypto};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ($task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my ($libs, $ccflags, $linkflags, $verbose);

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

auto_crypto-04.t - test config::auto::crypto

=head1 SYNOPSIS

    % prove t/steps/auto_crypto-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::crypto.

=head1 HISTORY

Mostly taken from F<t/steps/auto_gdbm-04.t>.

=head1 AUTHOR

Francois Perrad

=head1 SEE ALSO

config::auto::crypto, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
