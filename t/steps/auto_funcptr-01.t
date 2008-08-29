#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_funcptr-01.t

use strict;
use warnings;
use Test::More tests => 28;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::funcptr');
use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########### --jitcapable=0  ###########

my ($args, $step_list_ref) = process_options( {
    argv            => [ q{--jitcapable=0} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

my $serialized = $conf->pcfreeze();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my $pkg = q{auto::funcptr};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok($ret, "runstep() returned defined value" );

$conf->replenish($serialized);

########### _cast_void_pointers_msg() ###########

($args, $step_list_ref) = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    my $ret = capture(
        sub { auto::funcptr::_cast_void_pointers_msg(); },
        \$stdout,
    );
    like($stdout, qr/Although it is not required/s,
        "Got expected advisory message");
}

########### _set_positive_result() ###########

{
    my $stdout;
    my $ret = capture(
        sub { auto::funcptr::_set_positive_result($step, $conf); },
        \$stdout,
    );
    is($step->result, q{yes}, "Got expected result");
    ok(! $stdout, "Nothing printed to STDOUT, as expected");
}

$conf->replenish($serialized);

########### --verbose; _set_positive_result() ###########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $stdout;
    my $ret = capture(
        sub { auto::funcptr::_set_positive_result($step, $conf); },
        \$stdout,
    );
    is($step->result, q{yes}, "Got expected result");
    like($stdout, qr/yes/, "Got expected verbose output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_funcptr-01.t - test auto::funcptr

=head1 SYNOPSIS

    % prove t/steps/auto_funcptr-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test aspects of auto::funcptr.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::funcptr, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
