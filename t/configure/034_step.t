#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 15;
use Carp;
use Cwd;
use File::Temp 0.13 qw/ tempdir /;
use lib qw( lib t/configure/testlib );
use Parrot::IO::Capture::Mini;

BEGIN { use_ok('Parrot::Configure::Step'); }

Parrot::Configure::Step->import(@Parrot::Configure::Step::EXPORT_OK);

can_ok( __PACKAGE__, @Parrot::Configure::Step::EXPORT_OK );

# RT#44455 add verbose tests with some Test::Warn like mechanism

my $cwd = cwd();

my $nonexistent = 'config/gen/makefiles/foobar';
eval {
    genfile(
        $nonexistent    => 'CFLAGS',
        comment_type    => '#',
    );
};
like($@, qr/Can't open $nonexistent/, #'
    "Got expected error message when non-existent file provided as argument to genfile().");

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{Hello world\n};
    close $IN or croak "Unable to close temp file";
    ok( genfile(
        $dummy            => 'CFLAGS',
        makefile          => 1,
    ), "genfile() returned true value with 'makefile' option");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{Hello world\n};
    close $IN or croak "Unable to close temp file";
    eval {
        genfile(
            $dummy            => 'CFLAGS',
            makefile          => 1,
            comment_type      => q{<!--},
        );
    };
    like($@, qr/^Unknown comment type/,
        "genfile() failed due to unrecognized comment type with expected message");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{#perl Hello world\n};
    close $IN or croak "Unable to close temp file";
    ok( genfile(
        $dummy          => 'CFLAGS',
        makefile        => 1,
        feature_file    => 0,
    ), "genfile() returned true value with false value for 'feature_file' option");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN q{#perl\nuse strict;\n$something = 'something';\n};
    print $IN <<'END_DUMMY';
#perl
if (@miniparrot@) { sprint "Hello world\n"; }
END_DUMMY
    close $IN or croak "Unable to close temp file";
    my $tie_err = tie *STDERR, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    eval {
        genfile(
            $dummy          => 'CFLAGS',
            feature_file    => 1,
        );
    };
    my @lines = $tie_err->READLINE;
    ok(@lines, "Error message caught");
    ok($@, "Bad Perl code caught by genfile()");

    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}
untie *STDERR;

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN q{@foobar@\n};
    close $IN or croak "Unable to close temp file";
    my $tie_err = tie *STDERR, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    ok(genfile( $dummy => 'CFLAGS' ),
        "genfile() returned true when warning expected");
    my $line = $tie_err->READLINE;
    like($line, qr/value for 'foobar'/,
        "got expected warning");

    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}
untie *STDERR;

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN q{This line ends in a slash/}, qq{\n};
    close $IN or croak "Unable to close temp file";
    eval {
        genfile(
            $dummy          => 'CFLAGS',
            replace_slashes => 1,
        );
    };
    like($@, qr//,
        "genfile() died as expected with replace_slashes option and line ending in trailing slash");

    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(basename   morgan/lefay/abra.ca.dabra src/foo.c              hacks)};
    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok( genfile(
        $dummy            => 'CFLAGS',
        expand_gmake_syntax => 1,
    ), "genfile() did transformation of 'make' 'basename' as expected");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(notdir morgan/lefay/abra.ca.dabra src/foo.c          hacks)};

    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok( genfile(
        $dummy            => 'CFLAGS',
        expand_gmake_syntax => 1,
    ), "genfile() did transformation of 'make' 'notdir' as expected");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(addprefix src/,morgan/lefay/abra.ca.dabra foo                bar)};

    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok( genfile(
        $dummy            => 'CFLAGS',
        expand_gmake_syntax => 1,
    ), "genfile() did transformation of 'make' 'addprefix' as expected");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(wildcard *.c         *.o)};

    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok( genfile(
        $dummy            => 'CFLAGS',
        expand_gmake_syntax => 1,
    ), "genfile() did transformation of 'make' 'wildcard' as expected");
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd or croak "Unable to change back to starting directory";
}

################### DOCUMENTATION ###################

=head1 NAME

t/configure/034_step.t - tests Parrot::Configure::Step

=head1 SYNOPSIS

    prove t/configure/034_step.t

=head1 DESCRIPTION

Regression tests for the L<Parrote::Configure::Step> module.  This file holds
tests for Parrot::Configure::Step::genfile().

Thanks to http://start.it.uts.edu.au/w/doc/solaris/gmake/make_8.html for
instruction in using F<gmake> functions.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
