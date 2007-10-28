#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 132-auto_jit-01.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::jit');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  You will have to determine a way to test a user
response to a prompt. In the course of writing tests, you should try
to resolve RT 43146.

=cut

my $args = process_options(
    {
        argv => [ q{--miniparrot} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::jit};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, @step_params, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );
is($step->result(), q{skipped}, "Expected result was set");


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

132-auto_jit-01.t - test config::auto::jit

=head1 SYNOPSIS

    % prove t/configure/132-auto_jit-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::jit.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::jit, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
