#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_macports-02.t

use strict;
use warnings;
use Test::More;
plan( skip_all => 'Macports is Darwin only' ) unless $^O =~ /darwin/;
plan( tests => 12 );
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
$ENV{TEST_MACPORTS} = 'foobar';
use_ok('config::auto::macports');

use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my $pkg = q{auto::macports};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

# mock no Macports-default directories
ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), 'no', "Got expected result");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_macports-02.t - test auto::macports

=head1 SYNOPSIS

    % prove t/steps/auto_macports-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::macports.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::macports, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

