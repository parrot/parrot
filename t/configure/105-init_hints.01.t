#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 105-init_hints.01.t

use strict;
use warnings;
use Test::More tests => 17;
use Carp;
use Data::Dumper;
use lib qw( . lib ../lib ../../lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::install');
use_ok('config::init::hints');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new;

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{init::install}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{init::hints};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[2];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
# need to capture the --verbose output, because the fact that it does not end
# in a newline confuses Test::Harness
{
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $ret = $step->runstep($conf);
    my @more_lines = $tie_out->READLINE;
    ok(@more_lines, "verbose output:  hints were captured");
    ok(defined $ret, "$step_name runstep() returned defined value");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

105-init_hints.01.t - test config::init::hints

=head1 SYNOPSIS

    % prove t/configure/105-init_hints.01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::hints.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
