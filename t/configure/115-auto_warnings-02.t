#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 115-auto_warnings-02.t

use strict;
use warnings;
use Test::More tests => 22;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::hints');
use_ok('config::inter::progs');
use_ok('config::auto::warnings');
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
test_step_thru_runstep( $conf, q{init::hints}, $args );
test_step_thru_runstep( $conf, q{inter::progs}, $args );

my $pkg = q{auto::warnings};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my %potential_warnings_seen;
$conf->options->set(cage => 1);
$step->_add_cage_warnings($conf);
%potential_warnings_seen = map { $_, 1 } @{ $step->{potential_warnings} };
ok($potential_warnings_seen{'-std=c89'}, "Cage warning added");

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

115-auto_warnings-02.t - test config::auto::warnings

=head1 SYNOPSIS

    % prove t/configure/115-auto_warnings-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test aspects of config::auto::warnings.

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
