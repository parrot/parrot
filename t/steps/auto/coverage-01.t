#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto/coverage-01.t

use strict;
use warnings;
use Test::More tests =>  7;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::coverage');
use Parrot::BuildUtil;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::coverage};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "runstep() completed successfully");
ok(defined($step->result), "Result was defined");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/coverage-01.t - test auto::coverage

=head1 SYNOPSIS

    % prove t/steps/auto/coverage-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::coverage.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::coverage, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
