#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_jit-02.t

use strict;
use warnings;
use Test::More tests =>  14;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::jit');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::jit};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


ok(auto::jit::_handle_execcapable($conf, 1),
    "_handle_execcapable() returned true value");
is($conf->data->get('execcapable'), 1,
    "Got expected value for execcapable");
# prepare for next test
$conf->data->set('execcapable' => undef);

ok(auto::jit::_handle_execcapable($conf, 0),
    "_handle_execcapable() returned true value");
is($conf->data->get('execcapable'), 0,
    "Got expected value for execcapable");
$conf->data->set('execcapable' => undef);

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_jit-02.t - test config::auto::jit

=head1 SYNOPSIS

    % prove t/steps/auto_jit-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file tests config::auto::jit with the C<--miniparrot>
option.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::jit, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
