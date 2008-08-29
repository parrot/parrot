#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_alignptrs-02.t

use strict;
use warnings;
use Test::More tests =>  18;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::alignptrs');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## mock hpux ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::alignptrs};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $serialized = $conf->pcfreeze();

{
    $conf->data->set_p5( OSNAME => 'hpux' );
    my $ret = $step->runstep($conf);
    ok( $ret, "runstep() returned true value" );
    if ( $conf->data->get_p5('ccflags') !~ /DD64/ ) {
        is($conf->data->get('ptr_alignment'), 4,
            "Got expected pointer alignment for HP Unix");
        is($step->result(), qq{for hpux:  4 bytes},
            "Expected result was set");
    } else {
        pass("Cannot mock \%Config");
        pass("Cannot mock \%Config");
    }
}

$conf->replenish($serialized);

########## _evaluate_ptr_alignment()  ##########

my $align = 2;
auto::alignptrs::_evaluate_ptr_alignment($conf, $align);
is($conf->data->get( 'ptr_alignment' ), 2,
    "Got expected pointer alignment");

$conf->replenish($serialized);

########## _evaluate_ptr_alignment()  ##########

$align = undef;
eval { auto::alignptrs::_evaluate_ptr_alignment($conf, $align); };
like($@, qr/Can't determine alignment!/, #'
    "Got expected 'die' message");

$conf->replenish($serialized);

########## _evaluate_results()  ##########

my ($results, $try_align);
is(auto::alignptrs::_evaluate_results(q{OK}, 2), 2,
    "Got expected alignment");
is(auto::alignptrs::_evaluate_results(q{OK align}, 2), undef,
    "Got undef as expected");
is(auto::alignptrs::_evaluate_results(q{foobar}, 2), undef,
    "Got undef as expected");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_alignptrs-02.t - test auto::alignptrs

=head1 SYNOPSIS

    % prove t/steps/auto_alignptrs-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::alignptrs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::alignptrs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
