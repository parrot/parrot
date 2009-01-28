#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gcc-01.t

use strict;
use warnings;
use Test::More tests => 123;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::progs');
use_ok('config::auto::gcc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

########## regular  ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

my $serialized = $conf->pcfreeze();

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep( $conf, q{inter::progs},  $args );

my $pkg = q{auto::gcc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

ok($step->runstep($conf), "runstep returned true value");

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
my $gnucref = {};
ok($step->_evaluate_gcc($conf, $gnucref),
    "_evaluate_gcc() returned true value");
ok(! defined $conf->data->get( 'gccversion' ),
    "gccversion undef as expected");

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$gnucref = {};
$gnucref->{__GNUC__} = 1;
$gnucref->{__INTEL_COMPILER} = 1;
ok($step->_evaluate_gcc($conf, $gnucref),
    "_evaluate_gcc() returned true value");
ok(! defined $conf->data->get( 'gccversion' ),
    "gccversion undef as expected");
is($step->result(), q{no}, "Got expected result");

$conf->replenish($serialized);

########## _evaluate_gcc(); --verbose ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    my $gnucref = {};
    $gnucref->{__GNUC__} = undef;
    capture ( sub {$rv = $step->_evaluate_gcc($conf, $gnucref) }, \$stdout);
    ok($rv, "_evaluate_gcc() returned true value");
    ok( $stdout, "verbose output captured" );
    ok(! defined $conf->data->get( 'gccversion' ),
        "gccversion undef as expected");
    is($step->result(), q{no}, "Got expected result");
}

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$gnucref = {};
$gnucref->{__GNUC__} = 1;
$gnucref->{__INTEL_COMPILER} = 1;
ok($step->_evaluate_gcc($conf, $gnucref),
    "_evaluate_gcc() returned true value");
ok(! defined $conf->data->get( 'gccversion' ),
    "gccversion undef as expected");
is($step->result(), q{no}, "Got expected result");

$conf->replenish($serialized);

########## _evaluate_gcc(); --verbose ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    my $gnucref = {};
    $gnucref->{__GNUC__} = q{abc123};
    capture ( sub {$rv = $step->_evaluate_gcc($conf, $gnucref) }, \$stdout);
    ok($rv, "_evaluate_gcc() returned true value");
    ok( $stdout, "verbose output captured" );
    ok(! defined $conf->data->get( 'gccversion' ),
        "gccversion undef as expected");
    is($step->result(), q{no}, "Got expected result");
}

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    my $gnucref = {};
    $gnucref->{__GNUC__} = q{123};
    $gnucref->{__GNUC_MINOR__} = q{abc};
    capture ( sub {$rv = $step->_evaluate_gcc($conf, $gnucref) }, \$stdout);
    ok($rv, "_evaluate_gcc() returned true value");
    ok( !$stdout, "verbose output captured" );
    ok(defined $conf->data->get( 'gccversion' ),
        "gccversion defined as expected");
    is($conf->data->get( 'gccversion' ), 123,
        "Got expected value for gccversion");
    like($step->result(), qr/^yes/, "Got expected result");
}

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    my $gnucref = {};
    $gnucref->{__GNUC__} = q{123};
    $gnucref->{__GNUC_MINOR__} = q{456};
    capture ( sub {$rv = $step->_evaluate_gcc($conf, $gnucref) }, \$stdout);
    ok($rv, "_evaluate_gcc() returned true value");
    ok(defined $conf->data->get( 'gccversion' ),
        "gccversion defined as expected");
    is($conf->data->get( 'gccversion' ), q{123.456},
        "Got expected value for gccversion");
    like($step->result(), qr/^yes/, "Got expected result");
}

$conf->replenish($serialized);

########## _evaluate_gcc(); --verbose ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    my $gnucref = {};
    $gnucref->{__GNUC__} = q{123};
    $gnucref->{__GNUC_MINOR__} = q{456};
    capture ( sub {$rv = $step->_evaluate_gcc($conf, $gnucref) }, \$stdout);
    ok($rv, "_evaluate_gcc() returned true value");
    ok( !$stdout, "verbose output captured" );
    ok(defined $conf->data->get( 'gccversion' ),
        "gccversion defined as expected");
    is($conf->data->get( 'gccversion' ), q{123.456},
        "Got expected value for gccversion");
    like($step->result(), qr/^yes/, "Got expected result");
}

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$gnucref = {};
$gnucref->{__GNUC__} = q{abc123};
ok($step->_evaluate_gcc($conf, $gnucref),
    "_evaluate_gcc() returned true value");
ok(! defined $conf->data->get( 'gccversion' ),
    "gccversion undef as expected");
is($step->result(), q{no}, "Got expected result");

$conf->replenish($serialized);

########## _evaluate_gcc(); maintaiiner; cage ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--maintainer}, q{--cage} ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$gnucref = {};
$gnucref->{__GNUC__} = q{3};
$gnucref->{__GNUC_MINOR__} = q{1};
$conf->data->set( ccwarn => q{-Wfoobar -Wnofoobaz} );
ok($step->_evaluate_gcc($conf, $gnucref),
    "_evaluate_gcc() returned true value");
ok(defined $conf->data->get( 'gccversion' ),
    "gccversion defined as expected");
like($step->result(), qr/^yes/, "Got expected result");

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

($args, $step_list_ref) = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$gnucref = {};
$gnucref->{__GNUC__} = q{3};
$gnucref->{__GNUC_MINOR__} = q{1};
{
    $conf->data->set_p5( OSNAME => 'hpux' );
    ok($step->_evaluate_gcc($conf, $gnucref),
        "_evaluate_gcc() returned true value");
    ok(defined $conf->data->get( 'gccversion' ),
        "gccversion defined as expected");
    is($conf->data->get( 'gccversion' ), q{3.1},
        "Got expected value for gccversion");
    is($conf->data->get( 'HAS_aligned_funcptr' ), 0,
        "Got expected value for HAS_aligned_funcptr");
    like($step->result(), qr/^yes/, "Got expected result");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gcc-01.t - test auto::gcc

=head1 SYNOPSIS

    % prove t/steps/auto_gcc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::gcc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gcc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
