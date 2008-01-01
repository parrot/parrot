#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 102-init_defaults-03.t

use strict;
use warnings;
use Test::More tests => 15;
use Carp;
use lib qw( lib );
use_ok('config::init::defaults');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );

my $pkg  = q{init::defaults};
my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my $task        = $conf->steps->[-1];
my $step_name   = $task->step;

my $step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

$conf->data->set( archname => 'x86_64' );
$conf->data->set( cc => 'cc' );
$conf->data->set( cxx => 'c++' );
$conf->data->set( link => 'cc' );
$conf->data->set( ld => 'env cc' );
$conf->data->set( ld_load_flags => '-bundle -L/usr/local/lib64' );
$conf->data->set( ld_share_flags => '-bundle -L/usr/local/lib64' );
$conf->data->set( ldflags => '-bundle -L/usr/local/lib64' );
$conf->data->set( linkflags => '-bundle -L/usr/local/lib64' );
ok(init::defaults::_64_bit_adjustments($conf),
    "_64_bit_adjustments() returned true");
is($conf->data->get( 'archname' ), 'x86_64', "Got expected value for 'archname'");
is($conf->data->get( 'cc' ), 'cc', "Got expected value for 'cc'");
is($conf->data->get( 'cxx' ), 'c++', "Got expected value for 'cxx'");
is($conf->data->get( 'link' ), 'cc', "Got expected value for 'link'");
is($conf->data->get( 'ld' ), 'env cc', "Got expected value for 'ld'");
is($conf->data->get( 'ld_load_flags' ), '-bundle -L/usr/local/lib64',
    "Got expected value for 'ld_load_flags'");
is($conf->data->get( 'ld_share_flags' ), '-bundle -L/usr/local/lib64',
    "Got expected value for 'ld_share_flags");
is($conf->data->get( 'ldflags' ), '-bundle -L/usr/local/lib64',
    "Got expected value for 'ldflags'");
is($conf->data->get( 'linkflags' ), '-bundle -L/usr/local/lib64',
    "Got expected value for 'linkflags'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

102-init_defaults-03.t - test config::init::defaults

=head1 SYNOPSIS

    % prove t/configure/102-init_defaults-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test internal subroutine
config::init::defaults::_64_bit_adjustments().

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
