#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto/gcc-01.t

use strict;
use warnings;
use Test::More tests =>  79;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::gcc');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

########## regular  ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::gcc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

ok($step->runstep($conf), "runstep returned true value");

$conf->replenish($serialized);

########## _evaluate_gcc() ##########

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
$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$gnucref = {};
$gnucref->{__GNUC__} = q{3};
$gnucref->{__GNUC_MINOR__} = q{1};
{
    $conf->data->set( OSNAME_provisional => 'hpux' );
    ok($step->_evaluate_gcc($conf, $gnucref),
        "_evaluate_gcc() returned true value");
    ok(defined $conf->data->get( 'gccversion' ),
        "gccversion defined as expected");
    is($conf->data->get( 'gccversion' ), q{3.1},
        "Got expected value for gccversion");
    like($step->result(), qr/^yes/, "Got expected result");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/gcc-01.t - test auto::gcc

=head1 SYNOPSIS

    % prove t/steps/auto/gcc-01.t

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
