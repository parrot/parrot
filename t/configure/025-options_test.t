#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 025-options_test.t

use strict;
use warnings;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use Test::More tests =>  7;
use lib qw( lib );
use IO::CaptureOutput qw| capture |;
use Parrot::Configure::Options qw| process_options |;
use Parrot::Configure::Options::Test;

my ( $args, $step_list_ref ) = process_options(
    {
        argv => [q{--test}],
        mode => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when options were specified" );

my $opttest = Parrot::Configure::Options::Test->new($args);
ok( defined $opttest, "Constructor returned successfully" );

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
    my $tdir = tempdir( CLEANUP => 1 );
    ok( ( chdir $tdir ), "Changed to temporary directory for testing" );
    my $test = q{testfile};
    open my $T, ">", $test
        or die "Unable to open dummy test file for writing";
    print $T $teststring;
    close $T or die "Unable to close dummy test file after writing";

    no warnings 'once';

    my $reason = q{Devel::Cover gags on this test};

    {
        my ($rv, $stdout);
    SKIP: {
            skip $reason, 1 if $ENV{PERL5OPT};
            capture (
                sub { $rv = $opttest->run_configure_tests($test); },
                \$stdout
            );
            ok( $rv, "Configuration tests are runnable" );
        }
    }

    {
        my ($rv, $stdout);
    SKIP: {
            skip $reason, 1 if $ENV{PERL5OPT};
            capture (
                sub { $rv = $opttest->run_build_tests($test); },
                \$stdout
            );
            ok( $rv, "Build tests are runnable" );
        }
    }
    unlink $test or croak "Unable to delete $test";

    ok( ( chdir $cwd ), "Changed back to starting directory after testing" );
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
