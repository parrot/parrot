#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# init_install-01.t
use strict;
use warnings;
use Test::More tests => 36;
use Carp;
use Cwd;
use File::Temp qw(tempdir);
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use_ok('config::init::install');
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

my $cwd = cwd();
{
    my $tdir  = tempdir( CLEANUP => 1 );
    my $tdir1 = tempdir( CLEANUP => 1 );
    my ($args, $step_list_ref) = process_options(
        {
            argv => [
                qq{--prefix=$tdir},         qq{--exec-prefix=$tdir},
                qq{--bindir=$tdir1},        qq{--sbindir=$tdir1},
                qq{--libexecdir=$tdir1},    qq{--datadir=$tdir1},
                qq{--sysconfdir=$tdir1},    qq{--sharedstatedir=$tdir1},
                qq{--localstatedir=$tdir1}, qq{--libdir=$tdir1},
                qq{--includedir=$tdir1},    qq{--oldincludedir=$tdir1},
                qq{--infodir=$tdir1},       qq{--mandir=$tdir1},
            ],
            mode => q{configure},
        }
    );

    my $conf = Parrot::Configure->new;

    my $serialized = $conf->pcfreeze();

    test_step_thru_runstep( $conf, q{init::install}, $args );

    is( $conf->data->get('prefix'),         $tdir,  "--prefix option confirmed" );
    is( $conf->data->get('exec_prefix'),    $tdir,  "--exec-prefix option confirmed" );
    is( $conf->data->get('bindir'),         $tdir1, "--bindir option confirmed" );
    is( $conf->data->get('sbindir'),        $tdir1, "--sbindir option confirmed" );
    is( $conf->data->get('libexecdir'),     $tdir1, "--libexecdir option confirmed" );
    is( $conf->data->get('datadir'),        $tdir1, "--datadir option confirmed" );
    is( $conf->data->get('sharedstatedir'), $tdir1, "--sharedstatedir option confirmed" );
    is( $conf->data->get('localstatedir'),  $tdir1, "--localstatedir option confirmed" );
    is( $conf->data->get('libdir'),         $tdir1, "--libdir option confirmed" );
    is( $conf->data->get('includedir'),     $tdir1, "--includedir option confirmed" );
    is( $conf->data->get('oldincludedir'),  $tdir1, "--oldincludedir option confirmed" );
    is( $conf->data->get('infodir'),        $tdir1, "--infodir option confirmed" );
    is( $conf->data->get('mandir'),         $tdir1, "--mandir option confirmed" );

    $conf->replenish($serialized);

    my $tdir2      = tempdir( CLEANUP => 1 );
    my $tdir_orig = $tdir2;
    $tdir2 .= q{/};
    my $tdir3 = tempdir( CLEANUP => 1 );
    ($args, $step_list_ref) = process_options(
        {
            argv => [
                qq{--prefix=$tdir2},         qq{--exec-prefix=$tdir2},
                qq{--bindir=$tdir3},        qq{--sbindir=$tdir3},
                qq{--libexecdir=$tdir3},    qq{--datadir=$tdir3},
                qq{--sysconfdir=$tdir3},    qq{--sharedstatedir=$tdir3},
                qq{--localstatedir=$tdir3}, qq{--libdir=$tdir3},
                qq{--includedir=$tdir3},    qq{--oldincludedir=$tdir3},
                qq{--infodir=$tdir3},       qq{--mandir=$tdir3},
            ],
            mode => q{configure},
        }
    );

    my $pkg = q{init::install};
    $conf->add_steps($pkg);
    $conf->options->set( %{$args} );
    my $step = test_step_constructor_and_description($conf);

    my $ret = $step->runstep($conf);
    ok( defined $ret, "runstep() returned defined value" );

    is( $conf->data->get('prefix'),
        $tdir_orig, "--prefix option confirmed; trailing slash stripped" );
    is( $conf->data->get('exec_prefix'),
        $tdir_orig, "--exec-prefix option confirmed; trailing slash stripped" );
    is( $conf->data->get('bindir'),         $tdir3, "--bindir option confirmed" );
    is( $conf->data->get('sbindir'),        $tdir3, "--sbindir option confirmed" );
    is( $conf->data->get('libexecdir'),     $tdir3, "--libexecdir option confirmed" );
    is( $conf->data->get('datadir'),        $tdir3, "--datadir option confirmed" );
    is( $conf->data->get('sharedstatedir'), $tdir3, "--sharedstatedir option confirmed" );
    is( $conf->data->get('localstatedir'),  $tdir3, "--localstatedir option confirmed" );
    is( $conf->data->get('libdir'),         $tdir3, "--libdir option confirmed" );
    is( $conf->data->get('includedir'),     $tdir3, "--includedir option confirmed" );
    is( $conf->data->get('oldincludedir'),  $tdir3, "--oldincludedir option confirmed" );
    is( $conf->data->get('infodir'),        $tdir3, "--infodir option confirmed" );
    is( $conf->data->get('mandir'),         $tdir3, "--mandir option confirmed" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init_install-01.t - test init::install

=head1 SYNOPSIS

    % prove t/steps/init_install-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::install.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::install, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
