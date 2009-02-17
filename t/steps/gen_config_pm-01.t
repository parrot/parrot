#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# gen_config_pm-01.t

use strict;
use warnings;
use Test::More tests =>   8;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::gen::config_pm');
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
my $pkg = q{gen::config_pm};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok(-f $step->{templates}->{myconfig},
    "Able to locate template for myconfig");
ok(-f $step->{templates}->{Config_pm},
    "Able to locate template for Config_pm");
ok(-f $step->{templates}->{config_lib},
    "Able to locate template for config_lib");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen_config_pm-01.t - test gen::config_pm

=head1 SYNOPSIS

    % prove t/steps/gen_config_pm-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::config_pm.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::config_pm, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
