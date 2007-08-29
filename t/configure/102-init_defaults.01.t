#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 102-init_defaults.01.t

use strict;
use warnings;
use Test::More tests =>  6;
use Carp;
use Data::Dumper;
use lib qw( lib );
use_ok('config::init::defaults');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );

my $pkg = q{init::defaults};
my $args = process_options( {
    argv            => [q{--debugging=0}, q{--profile}, q{--m=32}],
                        # These 3 options are non-default and inside
                        # init::defaults::runsteps() they create what, from a
                        # testing coverage perspective, create branches or
                        # conditions.  The regular run of Configure.pl during
                        # coverage analysis will cover the default
                        # branches/conditions.  Hence, we supply the
                        # non-default options here to increase coverage.
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new;
$conf->add_steps($pkg);
$conf->options->set(%{$args});

my $task = $conf->steps->[0];
my $step_name   = $task->step;
my @step_params = @{ $task->params };

my $step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
my $ret = $step->runstep($conf);
ok(defined $ret, "$step_name runstep() returned defined value");

# RT#44451:  Write a SKIP block which will test the one OS-specific branch in
# init::defaults.

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

102-init_defaults.01.t - test config::init::defaults

=head1 SYNOPSIS

    % prove t/configure/102-init_defaults.01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::defaults.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::defaults, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
