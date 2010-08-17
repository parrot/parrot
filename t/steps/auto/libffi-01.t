#!perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$
# auto/ctags-01.t

use strict;
use warnings;
use Test::More tests => 9;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::libffi');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
    );

use IO::CaptureOutput qw| capture |;

################### --without-libffi ###################

my ($args, $step_list_ref) = process_options( {
        argv            => [],
        mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::libffi};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

$step->runstep($conf);
is( $step->result(), q{yes}, "Got expected result" );
is( $conf->data->get( 'HAS_LIBFFI' ), 1, "Got expected value for 'libffi'" );

($args, $step_list_ref) = process_options( {
        argv            => [ q{--without-libffi} ],
        mode            => q{configure},
} );

$conf->options->set(%{$args});
$step->runstep($conf);
is( $step->result(), q{no}, "Got expected result" );
is( $conf->data->get( 'HAS_LIBFFI' ), 0,
    "'libffi' undefined as expected" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto/libffi-01.t - test auto::libffi

=head1 SYNOPSIS

    % prove t/steps/auto/libffi-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step class auto::libffi

=head1 AUTHOR

John Harrison

=head1 SEE ALSO

config::auto::libff, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

