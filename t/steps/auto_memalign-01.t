#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_memalign-01.t

use strict;
use warnings;
use Test::More tests => 69;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::memalign');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########### regular ###########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::memalign};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
$conf->data->set( memalign => 'memalign');
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{already set}, "Expected result was set");
is($conf->data->get('memalign'),
    q{memalign},
    "memalign set as expected"
);

$conf->replenish($serialized);

########### _set_malloc_header()  ###########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    $conf->data->set('i_malloc' => 1);
    ok(auto::memalign::_set_malloc_header($conf),
        "_set_malloc_header() returned true value");
    is($conf->data->get( 'malloc_header' ), 'malloc.h',
        "malloc_header has expected value");
    $conf->data->set('i_malloc' => undef); # reset for next test
}

{
    $conf->data->set('i_malloc' => 0);
    ok(auto::memalign::_set_malloc_header($conf),
        "_set_malloc_header() returned true value");
    is($conf->data->get( 'malloc_header' ), 'stdlib.h',
        "malloc_header has expected value");
    $conf->data->set('i_malloc' => undef); # reset for next test
}

########### _set_ptrcast()  ###########

{
    $conf->data->set('ptrsize' => 2);
    $conf->data->set('intsize' => 2);
    ok(auto::memalign::_set_ptrcast($conf),
        "_set_ptrcast() returned true value");
    is($conf->data->get( 'ptrcast' ), 'int',
        "ptrcast has expected value");
    # reset for next test
    $conf->data->set('ptrsize' => undef);
    $conf->data->set('intsize' => undef);
}

{
    $conf->data->set('ptrsize' => 2);
    $conf->data->set('intsize' => 4);
    ok(auto::memalign::_set_ptrcast($conf),
        "_set_ptrcast() returned true value");
    is($conf->data->get( 'ptrcast' ), 'long',
        "ptrcast has expected value");
    # reset for next test
    $conf->data->set('ptrsize' => undef);
    $conf->data->set('intsize' => undef);
}

########### _set_memalign()  ###########

{
    $conf->data->set( malloc_header => 'malloc.h' );
    ok($step->_set_memalign($conf, 1, 1),
        "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), 'posix_memalign',
        "Got expected value for memalign");
    is($step->result(), q{yes}, "Got expected result");
}

{
    $conf->data->set( malloc_header => 'malloc.h' );
    ok($step->_set_memalign($conf, 1, 0),
        "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), 'memalign',
        "Got expected value for memalign");
    is($step->result(), q{yes}, "Got expected result");
}

{
    $conf->data->set( malloc_header => 'malloc.h' );
    ok($step->_set_memalign($conf, 0, 1),
        "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), 'posix_memalign',
        "Got expected value for memalign");
    is($step->result(), q{no}, "Got expected result");
}

{
    $conf->data->set( malloc_header => 'malloc.h' );
    ok($step->_set_memalign($conf, 0, 0),
        "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), '',
        "Got expected value (empty string) for memalign");
    is($step->result(), q{no}, "Got expected result");
}

$conf->replenish($serialized);

########### --verbose; _set_memalign() ###########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    $conf->data->set( malloc_header => 'malloc.h' );
    my ($rv, $stdout, $expected);
    $expected = 'posix_memalign';
    capture(
        sub { $rv = $step->_set_memalign($conf, 1, 1); },
        \$stdout,
    );
    ok($rv, "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), $expected,
        "Got expected value for memalign");
    is($step->result(), q{yes}, "Got expected result");
    like($stdout, qr/Yep:$expected/,
        "Got expected verbose output");
}

{
    $conf->data->set( malloc_header => 'malloc.h' );
    my ($rv, $stdout, $expected);
    $expected = 'memalign';
    capture(
        sub { $rv = $step->_set_memalign($conf, 1, 0); },
        \$stdout,
    );
    ok($rv, "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), $expected,
        "Got expected value for memalign");
    is($step->result(), q{yes}, "Got expected result");
    like($stdout, qr/Yep:$expected/,
        "Got expected verbose output");
}

{
    $conf->data->set( malloc_header => 'malloc.h' );
    my ($rv, $stdout, $expected);
    $expected = 'posix_memalign';
    capture(
        sub { $rv = $step->_set_memalign($conf, 0, 1); },
        \$stdout,
    );
    ok($rv, "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), $expected,
        "Got expected value for memalign");
    is($step->result(), q{no}, "Got expected result");
    like($stdout, qr/no/,
        "Got expected verbose output");
}

{
    $conf->data->set( malloc_header => 'malloc.h' );
    my ($rv, $stdout, $expected);
    $expected = '';
    capture(
        sub { $rv = $step->_set_memalign($conf, 0, 0); },
        \$stdout,
    );
    ok($rv, "_set_memalign() returned true value");
    ok(! defined $conf->data->get( 'malloc_header' ),
        "malloc_header now undef as expected");
    is($conf->data->get( 'memalign' ), $expected,
        "Got expected value (empty string) for memalign");
    is($step->result(), q{no}, "Got expected result");
    like($stdout, qr/no/,
        "Got expected verbose output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_memalign-01.t - test auto::memalign

=head1 SYNOPSIS

    % prove t/steps/auto_memalign-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by
config::auto::memalign.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::memalign, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
