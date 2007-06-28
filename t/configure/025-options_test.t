#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: 025-options_test.t 19028 2007-06-16 00:24:34Z jkeenan $
# 025-options_test.t

use strict;
use warnings;
use Carp;
use Cwd;
use Data::Dumper;
use File::Temp qw( tempdir );
use Test::More tests => 10;
use lib qw( . lib ../lib ../../lib );
use_ok('Parrot::IO::Capture::Mini');
use_ok(
    'Parrot::Configure::Options', qw|
        process_options
    |
);
use_ok("Parrot::Configure::Options::Test");

my ($args, $opttest);

my $parrot_version = '0.4.10';
my $svnid          = '$Id: 025-options_test.t 19028 2007-06-16 00:24:34Z jkeenan $';
$args = process_options(
    {
        argv            => [ q{--test} ],
        script           => $0,
        parrot_version  => $parrot_version,
        svnid           => $svnid,
    }
);
ok( defined $args, "process_options() returned successfully when options were specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok(defined $opttest, "Constructor returned successfully");

# Running the actual pre- and post-configuration tests would be too
# time-consuming.  So instead, we want to redefine the lists of tests to be
# run to include only dummy test files found in temporary directories.

my $cwd = cwd();

my $teststring = <<"TEST";
use Test::More tests => 1;
{
    pass("Dummy test passed");
}
TEST

{
    my $tdir = tempdir(CLEANUP => 1);
    ok( (chdir $tdir), "Changed to temporary directory for testing");
    my $test = q{testfile};
    open my $T, ">", $test
        or die "Unable to open dummy test file for writing";
    print $T $teststring;
    close $T or die "Unable to close dummy test file after writing";

    my ($tie, $errtie, @lines);
    no warnings 'once';

    my $reason = q{Devel::Cover gags on this test};

    @Parrot::Configure::Options::Test::preconfiguration_tests =
        ( $test );
    {
        $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        SKIP: {
            skip $reason, 1 if $ENV{PERL5OPT};
            ok($opttest->run_configure_tests(),
                "Configuration tests are runnable");
        }
    }

    @Parrot::Configure::Options::Test::postconfiguration_tests =
        ( $test );
    {
        $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        SKIP: {
            skip $reason, 1 if $ENV{PERL5OPT};
            ok($opttest->run_build_tests(),
                "Build tests are runnable");
        }
    }

    ok( (chdir $cwd), "Changed back to starting directory after testing");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

025-options_test.t - test Parrot::Configure::Options::Test

=head1 SYNOPSIS

    % prove t/configure/025-options_test.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::Configure::Options::Test methods.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Options, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
