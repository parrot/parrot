#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 01-default_tests.t

use strict;
use warnings;

use lib qw( lib );
use Test::More;
eval {
    use Parrot::Config qw( %PConfig );
};
plan( skip_all => 't/harness only runs once configuration has completed' ) if $@;
plan( tests => 30 );
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use Parrot::Harness::DefaultTests;

@Parrot::Harness::DefaultTests::runcore_tests = qw( alpha.t );
@Parrot::Harness::DefaultTests::core_tests = qw( beta.t );
@Parrot::Harness::DefaultTests::configure_tests = qw( gamma.t );
@Parrot::Harness::DefaultTests::standard_tests = qw( delta.t );
@Parrot::Harness::DefaultTests::developing_tests = qw( epsilon.t );

my ($core_tests_only, $runcore_tests_only);
my (@default_tests, $default_tests_ref);
my %default_tests_seen;

my $cwd = cwd();
{
    # Simulate non-existence of DEVELOPING
    my $tdir1 = tempdir( CLEANUP => 1 );
    ok( chdir $tdir1, "Able to change to tempdir for testing");

    ($core_tests_only, $runcore_tests_only) = (0,1);
    ok(@default_tests =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@default_tests), 1, "Got expected 1 test");
    is($default_tests[0], q{alpha.t}, "runcore_tests only as expected");

    @default_tests = ();
    ($core_tests_only, $runcore_tests_only) = (1,0);
    ok(@default_tests =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@default_tests), 2, "Got expected 2 tests");
    is($default_tests[1], q{beta.t}, "core_tests only as expected");

    @default_tests = ();
    ($core_tests_only, $runcore_tests_only) = (0,0);
    ok(@default_tests =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@default_tests), 3, "Got expected 3 tests");
    is($default_tests[0], q{gamma.t}, "Start with configure_tests as expected");
    is($default_tests[2], q{beta.t}, "End with core_tests as expected");

    @default_tests = ();
    ($core_tests_only, $runcore_tests_only) = (0,0);
    ok($default_tests_ref =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@{ $default_tests_ref }), 3, "Got expected 3 tests");

    ok(chdir $cwd, "Able to change back to starting directory after testing");
}

{
    # Simulate existence of DEVELOPING
    my $tdir2 = tempdir( CLEANUP => 1 );
    ok( chdir $tdir2, "Able to change to tempdir for testing");
    open my $FH, ">", q{DEVELOPING}
        or croak "Unable to open file for writing";
    print $FH qq{12345\n};
    close $FH or croak "Unable to close file after writing";

    ($core_tests_only, $runcore_tests_only) = (0,1);
    ok(@default_tests =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@default_tests), 1, "Got expected 1 test");
    is($default_tests[0], q{alpha.t}, "runcore_tests only as expected");
    # reset for subsequent tests
    @Parrot::Harness::DefaultTests::standard_tests = qw( delta.t );

    @default_tests = ();
    ($core_tests_only, $runcore_tests_only) = (1,0);
    ok(@default_tests =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@default_tests), 2, "Got expected 2 tests");
    is($default_tests[1], q{beta.t}, "core_tests only as expected");
    # reset for subsequent tests
    @Parrot::Harness::DefaultTests::standard_tests = qw( delta.t );

    @default_tests = ();
    ($core_tests_only, $runcore_tests_only) = (0,0);
    ok(@default_tests =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@default_tests), 3, "Got expected 3 tests");
    is($default_tests[0], q{gamma.t}, "Start with configure_tests as expected");
    is($default_tests[2], q{beta.t}, "End with core_tests as expected");
    is(scalar(@Parrot::Harness::DefaultTests::standard_tests),
        2, "Got expected 2 coding standards tests");
    # reset for subsequent tests
    @Parrot::Harness::DefaultTests::standard_tests = qw( delta.t );

    @default_tests = ();
    ($core_tests_only, $runcore_tests_only) = (0,0);
    ok($default_tests_ref =
        get_default_tests($core_tests_only, $runcore_tests_only),
        "get_default_tests() returned successfully");
    is(scalar(@{ $default_tests_ref }), 3, "Got expected 3 tests");
    # reset for subsequent tests
    @Parrot::Harness::DefaultTests::standard_tests = qw( delta.t );

    ok(chdir $cwd, "Able to change back to starting directory after testing");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-default_tests.t - test Parrot::Harness::DefaultTests

=head1 SYNOPSIS

    % prove t/pharness/01-default_tests.t

=head1 DESCRIPTION

This file holds tests for Parrot::Harness::DefaultTests::get_default_tests().

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Harness::DefaultTests, F<t/harness>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
