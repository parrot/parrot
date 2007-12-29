#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 147-auto_perldoc-02.t

use strict;
use warnings;
use Test::More tests => 25;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::perldoc');
use Parrot::BuildUtil;
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
my $pkg = q{auto::perldoc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my $content = undef;
my $rv = $step->_initial_content_check($conf, $content);
ok(! defined $rv, "Got expected return value when content was undefined");
is($step->result(),
    q{no}, "Got expected result when content was undefined");

my $version;
$version = 0;
ok(auto::perldoc::_handle_version($conf, $version),
    "_handle_version() returned true value");
is($conf->data->get('has_perldoc'), 0,
    "Got expected value for 'has_perldoc'");
is($conf->data->get('new_perldoc'), 0,
    "Got expected value for 'new_perldoc'");

$version = 1;
ok(auto::perldoc::_handle_version($conf, $version),
    "_handle_version() returned true value");
is($conf->data->get('has_perldoc'), 1,
    "Got expected value for 'has_perldoc'");
is($conf->data->get('new_perldoc'), 0,
    "Got expected value for 'new_perldoc'");

$version = 2;
ok(auto::perldoc::_handle_version($conf, $version),
    "_handle_version() returned true value");
is($conf->data->get('has_perldoc'), 1,
    "Got expected value for 'has_perldoc'");
is($conf->data->get('new_perldoc'), 1,
    "Got expected value for 'new_perldoc'");

$version = $step->_handle_old_perldoc();
is($version, 1, "Got expected version setting for old perldoc");
is($step->result(), q{yes, old version}, "Got expected result when old perldoc");

$version = $step->_handle_no_perldoc();
is($version, 0, "Got expected version setting for no perldoc");
is($step->result(), q{failed}, "Got expected result when no perldoc");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

147-auto_perldoc-02.t - test config::auto::perldoc

=head1 SYNOPSIS

    % prove t/configure/147-auto_perldoc-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::perldoc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::perldoc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
