#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto/sizes-01.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 43;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::sizes');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;


########## _handle_intval_ptrsize_discrepancy() ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::sizes};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/sizes-01.t - test auto::sizes

=head1 SYNOPSIS

    % prove t/steps/auto/sizes-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::sizes.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::sizes, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
