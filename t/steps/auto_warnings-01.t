#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_warnings-01.t

use strict;
use warnings;
use Test::More tests =>  56;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::hints');
use_ok('config::inter::progs');
use_ok('config::auto::warnings');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );
test_step_thru_runstep( $conf, q{init::hints}, $args );
test_step_thru_runstep( $conf, q{inter::progs}, $args );

my $pkg = q{auto::warnings};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
SKIP: {
    skip 'Tests not yet passing on Sun/Solaris',
    39
    if $^O =~ m/sun|solaris/i;

my $step = test_step_constructor_and_description($conf);

my %potential_warnings_seen;
$conf->options->set(cage => 1);
$step->_add_cage_warnings($conf);
%potential_warnings_seen = map { $_, 1 } @{ $step->{potential_warnings} };
ok($potential_warnings_seen{'-std=c89'}, "Cage warning added");

$conf->replenish($serialized);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->options->set(maintainer => 1);
$step->_add_maintainer_warnings($conf);
%potential_warnings_seen = map { $_, 1 } @{ $step->{potential_warnings} };
ok($potential_warnings_seen{'-Wlarger-than-4096'}, "Maintainer warning added");

$conf->replenish($serialized);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $warning = q{-Wphony_warning};
auto::warnings::_set_warning($conf, $warning, 1, undef);
ok(! $conf->data->get($warning),
    "Got expected setting for warning");

$conf->replenish($serialized);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $warning = q{-Wphony_warning};
    my $stdout;
    capture(
        sub { auto::warnings::_set_warning($conf, $warning, 1, 1); },
        \$stdout,
    );
    ok(! $conf->data->get($warning),
        "Got expected setting for warning");
    like($stdout, qr/exit code:\s+1/, "Got expected verbose output");
}

$conf->replenish($serialized);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $output = q{some string};
my $tryflags = q{some flag};
my $rv = auto::warnings::_set_ccflags($conf, $output, $tryflags, undef);
is($rv, 1, "_set_ccflags() returned 1 as expected");
is($conf->data->get("ccflags"), $tryflags, "ccflags changed as expected");

$conf->replenish($serialized);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $output = q{some string};
    my $tryflags = q{some flag};
    my ($rv, $stdout);
    capture(
        sub { $rv = auto::warnings::_set_ccflags($conf, $output, $tryflags, 1); },
        \$stdout,
    );
    is($rv, 1, "_set_ccflags() returned 1 as expected");
    is($conf->data->get("ccflags"), $tryflags, "ccflags changed as expected");
    like($stdout, qr/ccflags:\s+$tryflags/, "Got expected verbose output");
}

$conf->replenish($serialized);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
# Mock case where C compiler is not gcc.
$conf->data->set( gccversion => undef );
ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), q{skipped}, "Got expected result");

$conf->replenish($serialized);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($stdout, $rv);
    # Mock case where C compiler is not gcc.
    $conf->data->set( gccversion => undef );
    $conf->options->set( verbose => 1 );
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
    );
    ok($rv, "runstep() returned true value");
    is($step->result(), q{skipped}, "Got expected result");
    like($stdout,
        qr/Currently we only set warnings/,
        "Got expected verbose output"
    );
}

} # End SKIP block for Sun/Solaris

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_warnings-01.t - test auto::warnings

=head1 SYNOPSIS

    % prove t/steps/auto_warnings-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test aspects of auto::warnings.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::warnings, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
