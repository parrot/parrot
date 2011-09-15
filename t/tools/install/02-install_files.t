#! perl
# Copyright (C) 2007, Parrot Foundation.
# 02-install_files.t

use strict;
use warnings;

use Test::More tests => 18;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Install qw(
    install_files
    create_directories
);
use IO::CaptureOutput qw( capture );

my $cwd = cwd();
my $testsourcedir = qq{$cwd/t/tools/install/testlib};

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });

    {
        my ( $stdout, $stderr, $rv );

        eval {
            capture(
                sub { $rv = install_files($tdir, 1); },
                \$stdout,
                \$stderr,
            );
        };
        like($@, qr/Error: parameter \$files must be an array/s, "Catches non-ARRAY \$files");
    }
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });

    # Case where element in @files is not a hash ref
    my $files_ref = [ q[] ];

    {
        my ( $stdout, $stderr, $rv );
        capture(
            sub { $rv = install_files($tdir, 0, $files_ref); },
            \$stdout,
            \$stderr,
        );
        like($stderr, qr/Bad reference passed in \$files/, "Catches non-HASH files");

        like( $stdout, qr/Installing \.\.\./,
            'Got expected installation message' );
    }
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });

    my $files_ref = [ {
        Source => "$testsourcedir/README",
        Dest => "$dirs[0]/README",
    } ];

    {
        my ( $stdout, $stderr, $rv );

        capture(
            sub { $rv = install_files($tdir, 1, $files_ref); },
            \$stdout,
            \$stderr,
        );
        ok( $rv, 'install_files() completed successfully in dry-run case' );

        my $files_created = 0;
        foreach my $el (@$files_ref) {
            $files_created++ if -f $tdir . $el->{Dest};
        }
        is( $files_created, 0, 'Dry run, so no files created' );

        like( $stdout, qr/Installing.*README.*README/s,
            'Got expected installation message' );
        $stdout =~ qr/Installing.*README.*README/s or print "Warning was: $stderr";
    }

    {
        my ( $stdout, $stderr, $rv );
        capture(
            sub { $rv = install_files($tdir, 0, $files_ref); },
            \$stdout,
            \$stderr,
        );
        ok( $rv, 'install_files() completed successfully in production case' );

        my $files_created = 0;
        foreach my $el (@$files_ref) {
            $files_created++ if -f "$tdir$el->{Dest}";
        }
        is( $files_created, 1, 'Production, so 1 file created' );

        like( $stdout, qr/Installing.*README/s,
            'Got expected installation message' );
    }
}

{
    local $^O = 'cygwin';
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to testing directory: $!";
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });

    my @testingfiles = qw( README phony );
    foreach my $f ( @testingfiles ) {
        copy "$testsourcedir/$f", "$tdir/$f"
            or die "Unable to copy $f prior to testing: $!";
    }
    my $files_ref = [
        {
            Source => "$tdir/README",
            Dest => "$dirs[0]/README",
        },
        {
            Source => "$tdir/phony",
            Dest => "$dirs[0]/phony",
        },
    ];

    {
        my ( $stdout, $stderr, $rv );
        capture(
            sub { $rv = install_files($tdir, 0, $files_ref); },
            \$stdout,
            \$stderr,
        );
        ok( $rv, 'install_files() completed successfully in mock-Cygwin case' );

        my $files_created = 0;
        foreach my $el (@$files_ref) {
            $files_created++ if -f "$tdir$el->{Dest}";
        }
        is( $files_created, 2, 'Production, so 2 files created' );

        like( $stdout, qr/Installing.*README.*phony/s,
            'Got expected installation message' );
    }
    chdir $cwd or die "Unable to change back to starting directory: $!";
}

{
    local $^O = 'cygwin';
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to testing directory: $!";
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });

    my @testingfiles = qw( README phony phony.exe );
    foreach my $f ( @testingfiles ) {
        copy "$testsourcedir/$f", "$tdir/$f"
            or die "Unable to copy $f prior to testing: $!";
    }
    my $files_ref = [
        {
            Source => "$tdir/README",
            Dest => "$dirs[0]/README"
        },
        {
            Source => "$tdir/phony",
            Dest => "$dirs[0]/phony"
        },
        {
            Source => "$tdir/phony.exe",
            Dest => "$dirs[0]/phony.exe"
        },
    ];

    {
        my ( $stdout, $stderr, $rv );
        capture(
            sub { $rv = install_files($tdir, 0, $files_ref); },
            \$stdout,
            \$stderr,
        );
        ok( $rv, 'install_files() completed successfully in mock-Cygwin case' );

        my $files_created = 0;
        foreach my $el (@$files_ref) {
            $files_created++ if -f "$tdir$el->{Dest}";
        }
        is( $files_created, 2,
            'Production, so 2 files created; 1 file passed over' );

        like( $stdout, qr/Installing.*README.*phony/s,
            'Got expected installation message' );
    }
    chdir $cwd or die "Unable to change back to starting directory: $!";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });

    # Case where element in @files does not hold existent file
    my $nonexistent = q{ajdpfadksjfjvjkvds} . $$;
    my $files_ref = [
        {
            Source => $nonexistent,
            Dest => "$dirs[0]/$nonexistent",
        }
    ];

    {
        my ( $stdout, $stderr, $rv );
        capture(
            sub { $rv = install_files($tdir, 0, $files_ref); },
            \$stdout,
            \$stderr,
        );
        ok( $rv, 'install_files() handled non-existent file as expected' );

        like( $stdout, qr/Installing \.\.\./,
            'Got expected installation message' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-install_files.t - test subroutines exported by C<Parrot::Install>

=head1 SYNOPSIS

    % prove t/tools/install/02-install_files.t

=head1 DESCRIPTION

The files in this directory test functionality used by the scripts
F<tools/dev/install_files.pl>, F<tools/dev/install_doc_files.pl> and F<tools/dev/install_dev_files.pl>
and are exported by F<lib/Parrot/Install.pm>.

=head1 AUTHOR

James E Keenan and Timothy S Nelson

=head1 SEE ALSO

Parrot::Install, F<tools/dev/install_files.pl>, F<tools/dev/install_doc_files.pl>, F<tools/dev/install_dev_files.pl>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
