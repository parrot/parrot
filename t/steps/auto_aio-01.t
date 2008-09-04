#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_aio-01.t

use strict;
use warnings;
use Test::More tests => 31;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::aio');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########### regular ###########

my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::aio};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

#SKIP: {
#    skip 'Config step auto::aio under revision',
#    21;

my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
like(
    $step->result(),
    qr/^(yes|no)$/i,
    "One of two possible valid results was set"
);

$conf->replenish($serialized);

########### --verbose  ###########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($stdout, $stderr);
    my $ret = capture sub { $step->runstep($conf) }, \$stdout, \$stderr;
    ok( $ret, "runstep() returned true value" );
    like(
        $step->result(),
        qr/^(yes|no)$/i,
        "One of two possible valid results was set"
    );
    like(
        $stdout,
        qr/\s+\((yes|no)\)\s+/,
        "Got expected verbose output"
    );
}

$conf->replenish($serialized);

########### _handle_error_case() ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my ($libs, $verbose);
$libs = q{foobar};
$verbose = q{};
ok($step->_handle_error_case($conf, $libs, $verbose),
    "_handle_error_case() returned true value");
is($conf->data->get('libs'), $libs, "'libs' set as expected");
is($step->result, q{no}, "Got expected 'no' result");

$conf->replenish($serialized);

########### _handle_error_case(); --verbose ###########

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$libs = q{foobar};
$verbose = 1;
{
    my ($rv, $stdout);
    capture(
        sub { $rv = $step->_handle_error_case($conf, $libs, $verbose); },
        \$stdout,
    );
    ok($rv, "_handle_error_case() returned true value");
    is($conf->data->get('libs'), $libs, "'libs' set as expected");
    is($step->result, q{no}, "Got expected 'no' result");
    like($stdout, qr/no/, "Got expected verbose output");
}

#} # END SKIP BLOCK

# Problem:  With no usage of config::init::defaults and with next line test_*
# files created by probe are correctly cleaned up -- but at same time
# uninitialized value warnings are generated pointing to line 184 of
# lib/Parrot/Configure/Compiler.pm.  Problem does not occur if init::defaults
# is used.

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_aio-01.t - test auto::aio

=head1 SYNOPSIS

    % prove t/steps/auto_aio-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test methods found in configuration step class
auto::aio.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::aio, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
