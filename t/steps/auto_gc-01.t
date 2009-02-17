#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_gc-01.t

use strict;
use warnings;
use Test::More tests => 35;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::gc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########### --verbose ###########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::gc};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
{
    my ($ret, $stdout);
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
    );
    ok( $ret, "runstep() returned true value" );
    like( $stdout, qr/\(gc\)/, "Got expected verbose output");
    is($conf->data->get('gc_flag'), q{},
        "Got expected value for 'gc_flag'");
}

$conf->replenish($serialized);

########### --gc=gc ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--gc=gc} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('gc_flag'), q{},
    "Got expected value for 'gc_flag'");

$conf->replenish($serialized);

########### --gc=libc ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--gc=libc} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('i_malloc' => 1);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('gc_flag'), '-DGC_IS_MALLOC',
    "Got expected value for 'gc_flag'");
is($conf->data->get('malloc_header'), 'malloc.h',
    "Got expected value for 'malloc_header'");

$conf->replenish($serialized);

########### --gc=libc ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--gc=libc} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('i_malloc' => undef);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('gc_flag'), '-DGC_IS_MALLOC',
    "Got expected value for 'gc_flag'");
is($conf->data->get('malloc_header'), 'stdlib.h',
    "Got expected value for 'malloc_header'");

$conf->replenish($serialized);

########### --gc=malloc ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--gc=malloc} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('gc_flag'), '-DGC_IS_MALLOC',
    "Got expected value for 'gc_flag'");

$conf->replenish($serialized);

########### --gc=malloc-trace ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--gc=malloc-trace} ],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('gc_flag'), '-DGC_IS_MALLOC',
    "Got expected value for 'gc_flag'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gc-01.t - test auto::gc

=head1 SYNOPSIS

    % prove t/steps/auto_gc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::gc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
