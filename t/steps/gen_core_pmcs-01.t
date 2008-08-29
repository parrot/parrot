#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# gen_core_pmcs-01.t

use strict;
use warnings;
use Test::More tests => 16;
use Carp;
use lib qw( lib );
use_ok('init::defaults');
use_ok('auto::pmc');
use_ok('config::gen::core_pmcs');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
test_step_thru_runstep( $conf, q{init::defaults}, $args );
test_step_thru_runstep( $conf, q{auto::pmc}, $args );
my $pkg = q{gen::core_pmcs};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my @pmc_names = split / /, $conf->data->get('pmc_names');
ok( scalar( @pmc_names ),
    "Got nonzero number of pmc names, which is prerequisite for gen:core_pmcs");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen_core_pmcs-01.t - test gen::core_pmcs

=head1 SYNOPSIS

    % prove t/steps/gen_core_pmcs-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step gen::core_pmcs.  Since the step
is primarily concerned with printing files based on reading of a list of
C<pmc>s found within the Parrot::Configure object's data structure, we content
ourselves with ensuring that that list has nonzero size.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::core_pmcs, config::auto::pmc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
