#! perl
# Copyright (C) 2009, Parrot Foundation.

use strict;
use warnings;
use Test::More tests => 20;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::thread');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## --without-threads ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-threads} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::thread};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('HAS_THREADS'), 0,
    "Got expected value for 'HAS_THREADS'");
is($step->result(), q{no}, "Expected result was set");

$conf->replenish($serialized);

($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );
$conf->options->set('without-threads' => undef);

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$conf->data->set(osname => 'MSWin32');
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('HAS_THREADS'), 1,
    "Got expected value for 'HAS_THREADS' on MSWin32");
is($step->result(), q{yes}, "Expected result was set");

$conf->data->set(osname => 'linux');
$conf->data->set(i_pthread => 'define');
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('HAS_THREADS'), 1,
    "Got expected value for 'HAS_THREADS' on non-MSWin32");
is($step->result(), q{yes}, "Expected result was set");

$conf->data->set(osname => 'linux');
$conf->data->set(i_pthread => 'not defined');
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($conf->data->get('HAS_THREADS'), 0,
    "Got expected value for 'HAS_THREADS' on non-MSWin32 non-define i_pthread");
is($step->result(), q{no}, "Expected result was set");


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/thread-01.t - test auto::thread

=head1 SYNOPSIS

    % prove t/steps/auto/thread-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::thread.

=head1 HISTORY

Mostly taken from F<t/steps/auto_gdbm-01.t>.

=head1 AUTHOR

Francois Perrad

=head1 SEE ALSO

config::auto::thread, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
