#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 049-options_test_prepare.t

use strict;
use warnings;
use Carp;
use Cwd;
use File::Basename qw( basename fileparse );
use File::Path qw( mkpath );
use File::Temp 0.13 qw| tempdir |;
use Test::More tests => 10;
use lib qw( lib );
use IO::CaptureOutput qw| capture |;
use Parrot::Configure::Options::Test::Prepare ();

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $good_test = q{001-sometest.t};
    my $bad_test  = q{someothertest.t};
    touch_in_this_dir($good_test);
    touch_in_this_dir($bad_test);
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
    my $init_test = q{init/sometest-01.t};
    my $init_hints_test = q{init/hints/sometest-01.t};
    my $inter_test = q{inter/sometest-01.t};
    my $auto_test = q{auto/sometest-01.t};
    my $gen_test = q{gen/sometest-01.t};
    my $bad_test  = q{bad/sometest-01.t};
    my $lack_number_test = q{init/test.t};
    my $CamelCase_test = q{gen/CamelCase-01.t};
    touch($init_test);
    touch($init_hints_test);
    touch($inter_test);
    touch($auto_test);
    touch($gen_test);
    touch($bad_test);
    touch($lack_number_test);
    touch($CamelCase_test);

    my ( $steps_tests_simple_ref, $steps_tests_complex_ref )  =
        Parrot::Configure::Options::Test::Prepare::_find_steps_tests($tdir);
    my $full_bad_test = $tdir . '/' . $bad_test;
    ok( ! exists $steps_tests_simple_ref->{$full_bad_test},
        "File in incorrect directory correctly excluded from list of configuration step tests");
    my $full_lack_number_test = $tdir . '/' . $lack_number_test;
    ok( ! exists $steps_tests_simple_ref->{$full_lack_number_test},
        "File lacking 2-digit number correctly excluded from list of configuration step tests");
    my $full_init_hints_test = $tdir . '/'. $init_hints_test;
    ok( exists $steps_tests_simple_ref->{$full_init_hints_test},
        "File in second-level directory correctly included in list of configuration step tests");
    my $full_CamelCase_test = $tdir . '/' . $CamelCase_test;
    ok( ! exists $steps_tests_simple_ref->{$full_CamelCase_test},
        "File containing capital letters in name correctly excluded from list of configuration step tests");

    my @tests_expected = qw(
        init::sometest
        init::hints::sometest
        inter::sometest
        auto::sometest
        gen::sometest
    );
    my $not_expected = q{gen::missing};
    push @tests_expected, $not_expected;
    my %tests_seen = ();
    {
        my ($stdout, $stderr);
        capture (
            sub { %tests_seen = map { $_, 1}
                Parrot::Configure::Options::Test::Prepare::_prepare_steps_tests_list(
                    $tdir,
                    $steps_tests_complex_ref,
                    \@tests_expected,
                ) },
            \$stdout,
            \$stderr,
        );
        like($stderr, qr/No tests exist for configure step $not_expected/,
            "Warning about step class lacking test captured");
    }
    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");

sub touch {
    my $path = shift;
    my ($base, $dirs) = fileparse($path);
    my $cwd = cwd();
    unless ( -d $dirs ) {
        mkpath( [ $dirs ], 0, 0777 ) or croak "Unable to create dirs: $!";
    }
    chdir $dirs or croak "Unable to change dir: $!";
    touch_in_this_dir( $base );
    chdir $cwd or croak "Unable to change back dir: $!";
    ( -e $path ) or croak "Didn't create file: $!";
}

sub touch_in_this_dir {
    my $file = shift;
    open my $FH, '>', $file or croak "Unable to open $file for writing";
    print $FH "Hello, world\n";
    close $FH or croak "Unable to close $file after writing";
}

################### DOCUMENTATION ###################

=head1 NAME

049-options_test_prepare.t - test Parrot::Configure::Options::Test

=head1 SYNOPSIS

    % prove t/configure/049-options_test_prepare.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::Configure::Options::Test::Prepare
subroutines.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Options::Test, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

