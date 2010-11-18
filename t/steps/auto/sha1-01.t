#! perl
# Copyright (C) 2010, Parrot Foundation.
# auto/sha1-01.t

use strict;
use warnings;
use Test::More tests => 21;
use Carp;
use Cwd;
use File::Copy;
use File::Path qw( mkpath );
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::auto::sha1');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );
my $serialized = $conf->pcfreeze();

my $pkg = q{auto::sha1};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
SKIP: {
    skip "No .git directory when working from tarball", 9 unless (-e '.git');
    {
        no warnings 'once';
        local $Parrot::SHA1::current = undef;
        my $ret = $step->runstep($conf);
        ok( $ret, "runstep() returned true value" );
        is($step->result(), q{done},
            "Got expected result for undefined \$Parrot::SHA1::current"
        );
        ok(! defined $conf->data->get( 'sha1' ),
            "'sha1' undefined as expected" );
        $conf->data->set( sha1 => undef ); # prepare for next test
    }

    $conf->replenish($serialized);

    {
        no warnings 'once';
        local $Parrot::SHA1::current = 'invalid SHA1 string';
        my $ret;
        eval { $ret = $step->runstep($conf); };
        like($@, qr/Invalid Parrot sha1 \(SHA1\)/,
            "Got expected result for invalid SHA1 string" );
        ok( ! defined $ret, "runstep() returned undefined as expected" );
    }

    $conf->replenish($serialized);

    {
        no warnings 'once';
        my $cur = 'abcdefABCDEF0123456789012345678901234567';
        my $abbrev_cur = substr($cur,0,7);
        local $Parrot::SHA1::current = $cur;
        my $ret = $step->runstep($conf);
        ok( $ret, "runstep() returned true value" );
        is($step->result(), $abbrev_cur,
            "Got expected result for valid \$Parrot::SHA1::current"
        );
        is($conf->data->get('sha1'), $cur,
            "Got expected value for sha1" );
        is($conf->data->get('abbrev_sha1'), $abbrev_cur,
            "Got expected value for abbrev_sha1" );
        $conf->data->set( sha1 => undef ); # prepare for next test
        $conf->data->set( abbrev_sha1 => undef ); # prepare for next test
    }

    $conf->replenish($serialized);
}

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir for testing";

    my $temp_libdir = File::Spec->catdir( $tdir, 'config', 'auto' );
    mkpath($temp_libdir, { mode => 0777 })
        or croak "Unable to make path $temp_libdir";
    ok( -d $temp_libdir, "temp directory $temp_libdir created" );
    my $from = qq{$cwd/config/auto/sha1.pm};
    my $to   = qq{$temp_libdir/sha1.pm};
    copy $from => $to
      or croak "Unable to copy sha1.pm for testing";
    ok( -f $to, "File copied for testing" );
    unshift @INC, $tdir;

    my $conf = Parrot::Configure::Step::Test->new;
    $conf->include_config_results( $args );
    my $serialized = $conf->pcfreeze();

    my $pkg = q{auto::sha1};

    $conf->add_steps($pkg);
    $conf->options->set( %{$args} );
    my $step = test_step_constructor_and_description($conf);
    my $ret = $step->runstep($conf);
    ok( $ret, "runstep() returned true value" );
    is($step->result(), q{skipped},
        "Got expected result for no .git directory" );

    chdir $cwd or croak "Could not change back dir after testing";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/sha1-01.t - test auto::sha1

=head1 SYNOPSIS

    % prove t/steps/auto/sha1-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test execution paths in configuration step
C<auto::sha1>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::sha1, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
