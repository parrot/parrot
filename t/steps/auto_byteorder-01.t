#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_byteorder-01.t

use strict;
use warnings;
use Test::More tests => 24;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::byteorder');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## _evaluate_byteorder() ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::byteorder};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $byteorder = q{1234};
my $rv = $step->_evaluate_byteorder($conf, $byteorder);
ok( $rv, "_evaluate_byteorder() returned true value as expected");
is( $conf->data->get( 'byteorder'), $byteorder, "Got expected byteorder");
ok( ! $conf->data->get( 'bigendian' ), "Not big-endian");
is( $step->result, 'little-endian', "Rather, little-endian");

$conf->replenish($serialized);

########## _evaluate_byteorder() ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$byteorder = q{8765};
$rv = $step->_evaluate_byteorder($conf, $byteorder);
ok( $rv, "_evaluate_byteorder() returned true value as expected");
is( $conf->data->get( 'byteorder'), $byteorder, "Got expected byteorder");
ok( $conf->data->get( 'bigendian' ), "big-endian");
is( $step->result, 'big-endian', "Indeed, big-endian");

$byteorder = q{4321};
$rv = $step->_evaluate_byteorder($conf, $byteorder);
ok( $rv, "_evaluate_byteorder() returned true value as expected");
is( $conf->data->get( 'byteorder'), $byteorder, "Got expected byteorder");
ok( $conf->data->get( 'bigendian' ), "big-endian");
is( $step->result, 'big-endian', "Indeed, big-endian");

$conf->replenish($serialized);

########## _evaluate_byteorder(); phony byte order ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$byteorder = q{foobar};
eval {
    $rv = $step->_evaluate_byteorder($conf, $byteorder);
};
like($@,
    qr/Unsupported byte-order \[$byteorder\]!/,
    "Got error message expected with bad byte-order");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_byteorder-01.t - test auto::byteorder

=head1 SYNOPSIS

    % prove t/steps/auto_byteorder-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::byteorder.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::byteorder, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
