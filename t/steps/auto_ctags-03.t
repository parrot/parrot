#!perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$
# auto_ctags-03.t

use strict;
use warnings;
use Test::More tests =>  12;
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

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


my $pseudo_ctags = q{alpha};
$step->_evaluate_ctags($conf, $pseudo_ctags, 1);
is($conf->data->get('ctags'), $pseudo_ctags,
    "'ctags' attribute was set as expected");
is($step->result(), q{yes}, "Got expected result");

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/steps/auto_ctags-03.t - tests Parrot::Configure step auto::ctags

=head1 SYNOPSIS

    prove t/steps/auto_ctags-03.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure step auto::ctags> module.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
