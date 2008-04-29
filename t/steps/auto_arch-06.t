#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_arch-06.t

use strict;
use warnings;
use Test::More tests =>  13;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::arch');
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

my $pkg = q{auto::arch};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


my $pseudoarch = q{darwin-thread-multi-2level};
$conf->data->set('archname' => $pseudoarch);
my $pseudobyteorder = 4321;
$conf->data->set('byteorder' => $pseudobyteorder);
my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );
is($step->result(), q{}, "Result was empty string as expected");
is($conf->data->get('cpuarch'), q{ppc},
    "'cpuarch' was set as expected");
is($conf->data->get('osname'), q{darwin},
    "'osname' was set as expected");


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_arch-06.t - test config::auto::arch

=head1 SYNOPSIS

    % prove t/steps/auto_arch-06.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::arch in the case where
your OS is Darwin and you are using the vendor-supplied Perl and
byteorder is other than C<1234>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::arch, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
