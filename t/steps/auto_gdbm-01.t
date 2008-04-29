#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gdbm-01.t

use strict;
use warnings;
use Test::More tests =>  13;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gdbm');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a short description of what
the 'gdbm' is.  Some branches are compiler- or OS-specific.  As noted in
a comment in the module, please consider the issues raised in
http://rt.perl.org/rt3/Ticket/Display.html?id=43134.

=cut

my $args = process_options(
    {
        argv => [ q{--without-gdbm} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::gdbm};

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
is($conf->data->get('has_gdbm'), 0,
    "Got expected value for 'has_gdbm'");
is($step->result(), q{no}, "Expected result was set");


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gdbm-01.t - test config::auto::gdbm

=head1 SYNOPSIS

    % prove t/steps/auto_gdbm-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::gdbm in the case where the
C<--without-gdbm> option is set.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gdbm, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
