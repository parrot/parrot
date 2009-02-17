#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_headers-01.t

use strict;
use warnings;
use Test::More tests =>  30;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::headers');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );
my $pkg = q{auto::headers};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result is empty string as expected");

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

rerun_defaults_for_testing($conf, $args );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    capture ( sub {$rv = $step->runstep($conf) }, \$stdout);
    ok( $stdout, "verbose output captured" );
    ok( $rv, "runstep() returned true value" );
    is($step->result(), q{}, "Result is empty string as expected");
}

$conf->replenish($serialized);

########## _set_from_Config(); _list_extra_headers() ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

rerun_defaults_for_testing($conf, $args );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

auto::headers::_set_from_Config($conf);
ok(! $conf->data->get('i_niin'), "Mapping made correctly");

{
    $conf->data->set_p5( OSNAME => "msys" );
    my %extra_headers =
        map {$_, 1} auto::headers::_list_extra_headers($conf);
    ok($extra_headers{'sysmman.h'}, "Special header set for msys");
    ok($extra_headers{'netdb.h'}, "Special header set for msys");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_headers-01.t - test auto::headers

=head1 SYNOPSIS

    % prove t/steps/auto_headers-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::headers.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::headers, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
