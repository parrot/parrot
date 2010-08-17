#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# init/defaults-01.t

use strict;
use warnings;
use Test::More tests => 49;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw| tempdir |;
use lib qw( lib );
use_ok('config::init::defaults');
use Parrot::Configure;
use Parrot::Configure::Step;
use Parrot::Configure::Options qw( process_options );
use base qw(Parrot::Configure::Step);
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## no debugging; profile; m 32 ##########

my $pkg  = q{init::defaults};
my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--debugging=0}, q{--profile}, q{--m=32} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );

$conf->replenish($serialized);

########## mock absence of 'DEVELOPING' ##########

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    ok( copy( "$cwd/VERSION", "$tdir/VERSION" ),
        "Able to copy VERSION for testing" );

    my $pkg  = q{init::defaults};
    my ($args, $step_list_ref) = process_options(
        {
            argv => [],
            mode => q{configure},
        }
    );
    $conf->options->set( %{$args} );
    my $step = test_step_constructor_and_description($conf);

    my $ret = $step->runstep($conf);
    ok( defined $ret, "runstep() returned defined value" );

    unlink "$tdir/VERSION"
        or croak "Unable to unlink file from tempdir after testing";
    ok( chdir $cwd, "Able to change back to directory after testing" );
}

$conf->replenish($serialized);

########## m 32 ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--m=32} ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$conf->data->set( archname => 'x86_64' );
$conf->data->set( cc => 'cc' );
$conf->data->set( link => 'cc' );
$conf->data->set( ld => 'env cc' );
$conf->data->set( ld_load_flags => '-bundle -L/usr/local/lib64' );
$conf->data->set( ld_share_flags => '-bundle -L/usr/local/lib64' );
$conf->data->set( ldflags => '-bundle -L/usr/local/lib64' );
$conf->data->set( linkflags => '-bundle -L/usr/local/lib64' );
ok(init::defaults::_64_bit_adjustments($conf),
    "_64_bit_adjustments() returned true");
is($conf->data->get( 'archname' ), 'i386', "Got expected value for 'archname'");
is($conf->data->get( 'cc' ), 'cc -m32', "Got expected value for 'cc'");
is($conf->data->get( 'link' ), 'cc -m32', "Got expected value for 'link'");
is($conf->data->get( 'ld' ), 'env cc -m32', "Got expected value for 'ld'");
is($conf->data->get( 'ld_load_flags' ), '-bundle -L/usr/local/lib',
    "Got expected value for 'ld_load_flags'");
is($conf->data->get( 'ld_share_flags' ), '-bundle -L/usr/local/lib',
    "Got expected value for 'ld_share_flags");
is($conf->data->get( 'ldflags' ), '-bundle -L/usr/local/lib',
    "Got expected value for 'ldflags'");
is($conf->data->get( 'linkflags' ), '-bundle -L/usr/local/lib',
    "Got expected value for 'linkflags'");

$conf->replenish($serialized);

########## regular ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$conf->data->set( archname => 'x86_64' );
$conf->data->set( cc => 'cc' );
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

$conf->replenish($serialized);

##### with extra-nci-thunks #####
($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
ok($conf->data->get( 'has_extra_nci_thunks' ),
    "Got expected value for has_extra_nci_thunks" );
ok($conf->data->get( 'HAS_EXTRA_NCI_THUNKS' ),
    "Got expected value for HAS_EXTRA_NCI_THUNKS" );

$conf->replenish($serialized);

##### without extra-nci-thunks #####
($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-extra-nci-thunks} ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
ok(! $conf->data->get( 'has_extra_nci_thunks' ),
    "Got expected value for has_extra_nci_thunks" );
ok(! $conf->data->get( 'HAS_EXTRA_NCI_THUNKS' ),
    "Got expected value for HAS_EXTRA_NCI_THUNKS" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init/defaults-01.t - test init::defaults

=head1 SYNOPSIS

    % prove t/steps/init/defaults-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::defaults.

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
