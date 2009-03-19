#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_pmc-01.t

use strict;
use warnings;
use Test::More tests =>  28;
use Carp;
use Cwd;
use File::Path qw| mkpath |;
use File::Temp qw| tempdir |;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::pmc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::pmc};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

$conf->replenish($serialized);

########## contains_pccmethod()  ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    my $pmc_with_PCCMETHOD = q{yes.pmc};
    open my $IN1, ">", $pmc_with_PCCMETHOD
        or croak "Unable to open file for writing: $!";
    print $IN1 "PCCMETHOD\n";
    close $IN1 or croak "Unable to close file after writing: $!";
    ok(auto::pmc::contains_pccmethod($pmc_with_PCCMETHOD),
        "Internal subroutine contains_pccmethod returns true as expected");

    my $pmc_sans_PCCMETHOD = q{no.pmc};
    open my $IN2, ">", $pmc_sans_PCCMETHOD
        or croak "Unable to open file for writing: $!";
    print $IN2 "Hello world\n";
    close $IN2 or croak "Unable to close file after writing: $!";
    ok( !  defined (
            auto::pmc::contains_pccmethod($pmc_sans_PCCMETHOD)
        ), "Internal subroutine contains_pccmethod returns true as expected"
    );

    my $file = 'foobar';
    eval { auto::pmc::contains_pccmethod($file); };
    like($@, qr/Can't read '$file'/, "Got expected 'die' message"); #'

    ok( chdir $cwd, 'changed back to original directory after testing' );
}

########## get_pmc_order()  ##########

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    my $pmcdir = qq{$tdir/src/pmc};
    ok(mkpath($pmcdir, 0, 0755), "Able to make directory for testing");
    my $num = qq{$pmcdir/pmc.num};
    open my $IN3, ">", $num or croak "Unable to open file for writing: $!";
    print $IN3 "# comment line\n";
    print $IN3 "\n";
    print $IN3 "default.pmc\t0\n";
    print $IN3 "null.pmc    1\n";
    print $IN3 "env.pmc 2\n";
    print $IN3 "notapmc 3\n";
    close $IN3 or croak "Unable to close file after writing: $!";
    my $order_ref = auto::pmc::get_pmc_order();
    is_deeply(
        $order_ref,
        {
            'default.pmc' => 0,
            'null.pmc' => 1,
            'env.pmc' => 2,
        },
        "Able to read src/pmc/pmc.num correctly"
    );

    my @pmcs = qw| env.pmc default.pmc null.pmc other.pmc |;
    my @sorted_pmcs = auto::pmc::sort_pmcs(@pmcs);
    is_deeply(
        \@sorted_pmcs,
        [ qw| default.pmc null.pmc env.pmc other.pmc | ],
        "PMCs sorted correctly"
    );

    ok( chdir $cwd, 'changed back to original directory after testing' );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    my $pmcdir = qq{$tdir/src/pmc};
    ok(mkpath($pmcdir, 0, 0755), "Able to make directory for testing");
    eval { my $order_ref = auto::pmc::get_pmc_order(); };
    like($@,
        qr/Can't read src\/pmc\/pmc\.num/, "Got expected 'die' message");
#'

    ok( chdir $cwd, 'changed back to original directory after testing' );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_pmc-01.t - test auto::pmc

=head1 SYNOPSIS

    % prove t/steps/auto_pmc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::pmc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pmc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
