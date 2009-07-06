#! perl
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$
# gen_config_h-01.t

use strict;
use warnings;
use Test::More tests => 11;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib qw( lib );
use_ok('config::gen::config_h');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use Parrot::Configure::Utils qw( _slurp );

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

my $pkg = q{gen::config_h};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
ok(-f $step->{templates}->{config_h}, "Template for config_h located");
ok(-f $step->{templates}->{feature_h}, "Template for feature_h located");
ok(-f $step->{templates}->{has_header_h}, "Template for has_header_h located");

$conf->replenish($serialized);

($args, $step_list_ref) = process_options( {
    argv => [ q{--define=inet_aton} ],
    mode => q{configure},
} );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen_config_h-01.t - test gen::config_h

=head1 SYNOPSIS

    % prove t/steps/gen_config_h-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step gen::config_h.  Since this step
is primarily concerned with printing to files based on reading certain source
files and reading data stored in the Parrot::Configure object over the course
of configuration, no complete simulation by a test file is feasible.  We
therefore content ourselves with seeing whether the source files needed by the
step can be located.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::config_h, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
