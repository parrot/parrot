#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 137-auto_gc-02.t

use strict;
use warnings;
use Test::More tests =>  7;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::gc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ q{--gc=gc} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::gc};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );
is($conf->data->get('gc_flag'), q{},
    "Got expected value for 'gc_flag'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

137-auto_gc-02.t - test config::auto::gc

=head1 SYNOPSIS

    % prove t/configure/137-auto_gc-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::gc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
