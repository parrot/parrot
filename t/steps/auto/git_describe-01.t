#! perl
# Copyright (C) 2010, Parrot Foundation.
# auto/git_describe-01.t

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
use_ok('config::auto::git_describe');
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

my $pkg = q{auto::git_describe};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
SKIP: {
    skip "No .git directory when working from tarball", 9 unless (-e '.git');
    {
        no warnings 'once';
        local $Parrot::Git::Describe::current = undef;
        my $ret = $step->runstep($conf);
        ok( $ret, "runstep() returned true value" );
        is($step->result(), q{done},
            "Got expected result for undefined \$Parrot::Git::Describe::current"
        );
        ok(! defined $conf->data->get( 'git_describe' ),
            "'git_describe' undefined as expected" );
        $conf->data->set( git_describe => undef ); # prepare for next test
    }

    $conf->replenish($serialized);

    {
        no warnings 'once';
        local $Parrot::Git::Describe::current = 'invalid git describe string';
        my $ret;
        eval { $ret = $step->runstep($conf); };
        like($@, qr/Invalid git describe string \(Git::Describe\)/,
            "Got expected 'die' message for invalid git describe string" );
        ok( ! defined $ret, "runstep() returned undefined as expected" );
    }

    $conf->replenish($serialized);

    {
        no warnings 'once';
        my $cur = 'REL_2004_09_07-678-ga83bdab';
        local $Parrot::Git::Describe::current = $cur;
        my $ret = $step->runstep($conf);
        ok( $ret, "runstep() returned true value" );
        is($step->result(), $cur,
            "Got expected result for valid \$Parrot::Git::Describe::current"
        );
        $conf->data->set( git_describe => undef ); # prepare for next test
    }

    $conf->replenish($serialized);

    {
        no warnings 'once';
        my $cur = 'RELEASE_2_10_0';
        local $Parrot::Git::Describe::current = $cur;
        my $ret = $step->runstep($conf);
        ok( $ret, "runstep() returned true value" );
        is($step->result(), $cur,
            "Got expected result for valid \$Parrot::Git::Describe::current"
        );
        $conf->data->set( git_describe => undef ); # prepare for next test
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
    my $from = qq{$cwd/config/auto/git_describe.pm};
    my $to   = qq{$temp_libdir/git_describe.pm};
    copy $from => $to
      or croak "Unable to copy git_describe.pm for testing";
    ok( -f $to, "File copied for testing" );
    unshift @INC, $tdir;

    my $conf = Parrot::Configure::Step::Test->new;
    $conf->include_config_results( $args );
    my $serialized = $conf->pcfreeze();

    my $pkg = q{auto::git_describe};

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

auto/git_describe-01.t - test auto::git_describe

=head1 SYNOPSIS

    % prove t/steps/auto/git_describe-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test execution paths in configuration step
C<auto::git_describe>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::git_describe, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
