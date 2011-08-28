#! perl
# Copyright (C) 2007-2011, Parrot Foundation.
# init/optimize-01.t
use strict;
use warnings;
use Test::More tests => 33;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::optimize');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

########## no optimization (default) ##########

my ($args, $step_list_ref) = process_options( {
    argv => [],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{init::optimize};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );

$conf->replenish($serialized);

########## --optimize  ##########

($args, $step_list_ref) = process_options( {
    argv => [q{--optimize}],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );

$conf->replenish($serialized);

########## --verbose  ##########

($args, $step_list_ref) = process_options( {
    argv => [q{--verbose}],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    capture ( sub {$rv = $step->runstep($conf) }, \$stdout);
    ok( defined $rv, "step_name runstep() returned defined value" );
    ok( $stdout, "verbose output captured" );
}

$conf->replenish($serialized);

########## --optimize  ##########

# 'bare' --optimize should mean: default to what Perl 5 uses (typically, -O2),
# but perhaps with some manipulation due to GCC variations
($args, $step_list_ref) = process_options( {
    argv => [q{--optimize}],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );

$conf->replenish($serialized);

########## --optimize=-O3  ##########

($args, $step_list_ref) = process_options( {
    argv => [q{--optimize=-O3}],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
is( $conf->data->get('optimize'), '-O3',
   "Got optimization level explicitly requested" );

$conf->replenish($serialized);

########## --optimize; gcc 3.3  ##########

($args, $step_list_ref) = process_options( {
    argv => [q{--optimize}],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('gccversion' => '3.3');
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );

$conf->replenish($serialized);

########## --optimize, --verbose; gcc 4.1 ##########

($args, $step_list_ref) = process_options( {
    argv => [q{--optimize}, q{--verbose}],
    mode => q{configure},
} );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('gccversion' => '4.1');
# need to capture the --verbose output,
# because the fact that it does not end
# in a newline confuses Test::Harness
{
      my $rv;
      my $stdout;
      capture ( sub {$rv = $step->runstep($conf) }, \$stdout);
      ok( defined $rv, "runstep() returned defined value" );
      ok( $stdout, "verbose output captured" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init/optimize-01.t - test init::optimize

=head1 SYNOPSIS

    % prove t/steps/init/optimize-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::optimize.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::optimize, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
