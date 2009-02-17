#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_signal-01.t

use strict;
use warnings;
use Test::More tests =>  35;
use Carp;
use Cwd;
use File::Temp qw(tempdir);
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::signal');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########### _handle__sighandler_t() ###########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::signal};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

ok(auto::signal::_handle__sighandler_t($conf),
    "_handle__sighandler_t() returned true value");
is($conf->data->get( 'has___sighandler_t'), 'define',
    "Got expected value for has__sighandler_t");

########### _handle_sigaction() ###########

ok(auto::signal::_handle_sigaction($conf),
    "_handle_sigaction() returned true value");
is($conf->data->get( 'has_sigaction'), 'define',
    "Got expected value for has_sigaction");

########### _handle_setitimer() ###########

ok(auto::signal::_handle_setitimer($conf),
    "_handle_setitimer() returned true value");
is($conf->data->get( 'has_setitimer'), 'define',
    "Got expected value for has_setitimer");
is($conf->data->get( 'has_sig_atomic_t'), 'define',
    "Got expected value for has_sig_atomic_t");

########### _print_signalpasm() ###########

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1);
    chdir $tdir or croak "Unable to change to $tdir";
    my $signalpasm = q{signal.pasm};
    ok(auto::signal::_print_signalpasm($conf, $signalpasm),
        "_print_signalpasm returned true value");
    ok(-s $signalpasm, "File with nonzero size created");
    unlink $signalpasm or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to $cwd";
}

$conf->replenish($serialized);

########### --verbose; _handle__sighandler_t() ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my $verbose = 1;
{
    my ($rv, $stdout);
    capture(
        sub { $rv = auto::signal::_handle__sighandler_t($conf, $verbose); },
        \$stdout,
    );
    ok($rv, "_handle__sighandler_t() returned true value");
    is($conf->data->get( 'has___sighandler_t'), 'define',
        "Got expected value for has__sighandler_t");
    like($stdout, qr/__sighandler_t/, "Got expected verbose output");
}

########### --verbose; _handle_sigaction() ###########

{
    my ($rv, $stdout);
    capture(
        sub { $rv = auto::signal::_handle_sigaction($conf, $verbose); },
        \$stdout,
    );
    ok($rv, "_handle_sigaction() returned true value");
    is($conf->data->get( 'has_sigaction'), 'define',
        "Got expected value for has_sigaction");
    like($stdout, qr/sigaction/, "Got expected verbose output");
}

########### --verbose; _handle_setitimer() ###########

{
    my ($rv, $stdout);
    capture(
        sub { $rv = auto::signal::_handle_setitimer($conf, $verbose); },
        \$stdout,
    );
    ok($rv, "_handle_setitimer() returned true value");
    is($conf->data->get( 'has_setitimer'), 'define',
        "Got expected value for has_setitimer");
    is($conf->data->get( 'has_sig_atomic_t'), 'define',
        "Got expected value for has_sig_atomic_t");
    like($stdout, qr/setitimer/s, "Got expected verbose output");
}

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_signal-01.t - test auto::signal

=head1 SYNOPSIS

    % prove t/steps/auto_signal-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::signal.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::signal, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
