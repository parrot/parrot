#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/warnings-01.t

use strict;
use warnings;
use Test::More tests =>  18;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::warnings');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::warnings};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();
my $step;

SKIP: {
    skip 'Tests not yet passing on Sun/Solaris',
    23
    if $^O =~ m/sun|solaris/i;

# Simulate the  case where C compiler is not gcc.
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set( gccversion => undef );
ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), q{skipped}, "Got expected result");

$step->set_result( undef );
$conf->replenish($serialized);

# Simulate the case where C compiler is not gcc:  verbose
$conf->options->set( verbose => 1 );
$step = test_step_constructor_and_description($conf);
$conf->data->set( gccversion => undef );
{
    my ($stdout, $stderr, $rv);
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok($rv, "runstep() returned true value");
    is($step->result(), q{skipped}, "Got expected result");
    like($stdout, qr/We do not \(yet\) probe for warnings for your compiler/s,
        "Got expected verbose output: compiler with warnings not yet supported" );
}

$step->set_result( undef );
$conf->replenish($serialized);

# Simulate case where --cage warnings are requested
$conf->options->set( verbose => undef );
$step = test_step_constructor_and_description($conf);
$conf->data->set( gccversion => 'defined' );
$conf->data->set( 'g++' => undef );
$conf->options->set( cage => 1 );
ok($step->runstep($conf), "runstep() returned true value");

# This test is fragile, as it depends on the current state of --cage,
# which changes over time, and on the compiler, which may not support
# this option.
like($conf->data->get( 'ccwarn' ),
    qr/-Wunreachable-code/,
    "'cage' warning set as expected"
);

} # End SKIP block for Sun/Solaris

$conf->cc_clean();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/warnings-01.t - test auto::warnings

=head1 SYNOPSIS

    % prove t/steps/auto/warnings-01.t

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
