#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 104-init_miniparrot.t

use strict;
use warnings;
use Test::More tests => 22;
use Carp;
use lib qw( . lib ../lib ../../lib );
use_ok('config::init::defaults');
use_ok('config::init::miniparrot');
use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );

=for hints_for_testing This file ought to test what happens when you
first create a Parrot::Configure object, populate it with default
settings as in init::defaults, then override those settings per
init::miniparrot.

=cut

my $parrot_version = Parrot::BuildUtil::parrot_version();
my $args = process_options( {
    argv            => [ q{--miniparrot} ],
    script          => $0,
    parrot_version  => $parrot_version,
    svnid           => '$Id$',
} );

my $conf = Parrot::Configure->new;

my ($pkg, $task, $step_name, @step_params, $step, $ret);

$pkg = q{init::defaults};
$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[0];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
$ret = $step->runstep($conf);
ok(defined $ret, "$step_name runstep() returned defined value");

is($conf->data->get('miniparrot'), undef, 
    "miniparrot is not yet enabled");
is($conf->data->get('jitarchname'), undef,
    "jitarchname undef as expected");
is($conf->data->get('jitcpuarch'), undef,
    "jitcpuarch undef as expected");
is($conf->data->get('jitcpu'), undef,
    "jitcpu undef as expected");
is($conf->data->get('jitosname'), undef,
    "jitosname undef as expected");


$pkg = q{init::miniparrot};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
$ret = $step->runstep($conf);
ok(defined $ret, "$step_name runstep() returned defined value");

ok($conf->data->get('miniparrot'), 
    "miniparrot is enabled");
is($conf->data->get('jitarchname'), 'nojit',
    "jitarchname as expected");
is($conf->data->get('jitcpuarch'), 'i386',
    "jitcpuarch as expected");
is($conf->data->get('jitcpu'), 'I386',
    "jitcpu as expected");
is($conf->data->get('jitosname'), 'nojit',
    "jitosname as expected");
ok(! $conf->data->get('jitcapable'), 
    "jitcapable as expected");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

104-init_miniparrot.t - test config::init::miniparrot

=head1 SYNOPSIS

    % prove t/configure/104-init_miniparrot.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::miniparrot.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::miniparrot, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
