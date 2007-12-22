#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 112-auto_backtrace-02.t

use strict;
use warnings;
use Test::More tests => 15;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::backtrace');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::backtrace};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my $error = q{mock_error};
ok($step->_evaluate_backtrace($conf, $error),
    "_evaluate_backtrace returned true value");
is($step->result, 'no', "Got expected result");

$error = q{};
ok($step->_evaluate_backtrace($conf, $error),
    "_evaluate_backtrace returned true value");
is($step->result, 'yes', "Got expected result");
ok($conf->data->get('glibc_backtrace'),
    "glibc_backtrace set as expected");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

112-auto_backtrace-02.t - test config::auto::backtrace

=head1 SYNOPSIS

    % prove t/configure/112-auto_backtrace-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by
config::auto::backtrace.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::backtrace, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
