#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 049-options_test.t

use strict;
use warnings;
use Carp;
use Cwd;
use File::Basename;
use File::Temp 0.13 qw| tempdir |;
use Test::More tests => 12;
use lib qw( lib );
use IO::CaptureOutput qw| capture |;
use Parrot::Configure::Options::Test::Prepare ();

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $good_test = q{001-sometest.t};
    my $bad_test  = q{someothertest.t};
    touch($good_test);
    touch($bad_test);
    my %tests_seen = map { basename($_), 1 }
        Parrot::Configure::Options::Test::Prepare::_get_framework_tests($tdir);
    ok($tests_seen{$good_test},
        "Correctly named test identified");
    ok(! $tests_seen{$bad_test},
        "Incorrectly named test excluded");

    ok( chdir $cwd, "Able to change back to starting directory");
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $init_test = q{init_sometest-01.t};
    my $inter_test = q{inter_sometest-01.t};
    my $auto_test = q{auto_sometest-01.t};
    my $gen_test = q{gen_sometest-01.t};
    my $bad_test  = q{bad_sometest-01.t};
    my $lack_number_test = q{init_test.t};
    touch($init_test);
    touch($inter_test);
    touch($auto_test);
    touch($gen_test);
    touch($bad_test);
    touch($lack_number_test);
    my $steps_tests_ref = {};
    {
        my ($stdout, $stderr);
        capture (
            sub { $steps_tests_ref =
                Parrot::Configure::Options::Test::Prepare::_get_steps_tests(
                    $tdir
                ) },
            \$stdout,
            \$stderr,
        );
        like($stderr, qr/Unable to match $bad_test/,
            "Warning about badly named test captured");
        like($stderr, qr/Unable to match $lack_number_test/,
            "Warning about badly named test captured");
    }

    my @tests_expected = qw(
        init::sometest
        inter::sometest
        auto::sometest
        gen::sometest
        gen::missing
    );
    my %tests_seen = ();
    {
        my ($stdout, $stderr);
        capture (
            sub { %tests_seen = map { basename($_), 1}
                Parrot::Configure::Options::Test::Prepare::_prepare_steps_tests_list(
                    $tdir,
                    $steps_tests_ref,
                    \@tests_expected,
                ) },
            \$stdout,
            \$stderr,
        );
        like($stderr, qr/No tests exist for configure step gen::missing/,
            "Warning about step class lacking test test captured");
    }
    foreach my $type ( qw| init inter auto gen | ) {
        my $t = $type . q(_sometest-01.t);
        ok($tests_seen{$t}, "Found needed test");
    }

    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");

sub touch {
    my $file = shift;
    open my $FH, '>', $file or croak "Unable to open $file for writing";
    print $FH "Hello, world\n";
    close $FH or croak "Unable to close $file after writing";
}

################### DOCUMENTATION ###################

=head1 NAME

049-options_test.t - test Parrot::Configure::Options::Test

=head1 SYNOPSIS

    % prove t/configure/049-options_test.t

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
