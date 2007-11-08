#!perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$
# 150-auto_ctags-03.t

use strict;
use warnings;
use Test::More tests => 13;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::ctags');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::ctags};

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

my $pseudo_ctags = q{alpha};
$step->_evaluate_ctags($conf, $pseudo_ctags, 1);
is($conf->data->get('ctags'), $pseudo_ctags,
    "'ctags' attribute was set as expected");
is($step->result(), q{yes}, "Got expected result");

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/configure/150-auto_ctags-03.t - tests Parrot::Configure::Step::auto::ctags

=head1 SYNOPSIS

    prove t/configure/150-auto_ctags-03.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Step::auto::ctags> module.
This file holds tests for Parrot::Configure::Step::auto::ctags::runstep()
(a non-exported subroutine).

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
