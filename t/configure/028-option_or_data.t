#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 028-option_or_data.t

use strict;
use warnings;

use Test::More tests => 25;
use Carp;
use lib qw( . lib ../lib ../../lib );
use_ok('config::init::defaults');
use_ok('config::init::install');
use_ok('config::init::hints');
use_ok('config::inter::progs');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use_ok('Parrot::Configure::Step::List', qw|
    get_steps_list
| );

$| = 1;
is($|, 1, "output autoflush is set");

my $localargv = [ ];
my $args = process_options( {
    mode            => q{configure},
    argv            => $localargv,
} );
ok(defined $args, "process_options returned successfully");

my $conf = Parrot::Configure->new;

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{init::install}, $args);
test_step_thru_runstep($conf, q{init::hints}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{inter::progs};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[3];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
$ret = $step->runstep($conf);
ok(defined $ret, "$step_name runstep() returned defined value");

my $arg = q{cc};
my $val = $conf->option_or_data( $arg );
is($val, $conf->data->get( $arg ),
    'option_or_data() returned expected value when no option provided');

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

028-option_or_data.t - test C<Parrot::Configure::option_or_data()>

=head1 SYNOPSIS

    % prove t/configure/028-option_or_data.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

This file tests C<Parrot::Configure::option_or_data()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
