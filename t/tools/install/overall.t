#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# overall.t

use strict;
use warnings;
use Test::More tests =>  4;
use Carp;
use Cwd;
use File::Basename;
use File::Copy;
use File::Path qw( mkpath );
use File::Spec ();
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Config qw( %PConfig );
use Parrot::Install qw(
    install_files
    create_directories
    lines_to_files
);
use IO::CaptureOutput qw( capture );

my $DEBUG = 0;

my $cwd = cwd();
my $installer = File::Spec->catfile( 'tools', 'dev', 'install_files.pl' );
my $full_installer = File::Spec->catfile( $cwd, $installer );
ok(-f $full_installer, "Able to locate $installer");

my $testlibdir = File::Spec->catdir( qw| t tools install testlib | );
my $man_pseudo = File::Spec->catfile( $testlibdir, q|manifest_pseudo| );
my $full_man_pseudo = File::Spec->catfile( $cwd, $man_pseudo );
my $gen_pseudo = File::Spec->catfile( $testlibdir, q|generated_pseudo| );
my $full_gen_pseudo = File::Spec->catfile( $cwd, $gen_pseudo );

{
    my $builddir    = tempdir( CLEANUP => 1 );
    my $prefixdir   = tempdir( CLEANUP => 1 );
    if ($DEBUG) {
        print STDERR "$builddir\n$prefixdir\n";
    }

    my $includedir = File::Spec->catdir( $prefixdir, 'include' );
    my $libdir = File::Spec->catdir( $prefixdir, 'lib' );
    my $docdir = File::Spec->catdir( $prefixdir, 'share', 'doc' );
    my $versiondir = $PConfig{versiondir};

    my %testfiles = (
        'LICENSE'                 => {
            start   => File::Spec->catfile( qw| . LICENSE | ),
            end     => File::Spec->catfile(
                        $docdir, $versiondir, 'LICENSE' )
        },
        'docs/gettingstarted.pod' => {
            start   => File::Spec->catfile( qw| . docs gettingstarted.pod | ),
            end     => File::Spec->catfile(
                        $docdir,  $versiondir, 'pod', 'gettingstarted.pod' ),
        },
        'docs/resources/phony_resource' => {
            start   => File::Spec->catfile( qw| . docs resources phony_resource | ),
            end     => File::Spec->catfile(
                        $docdir,  $versiondir, 'resources', 'phony_resource' ),
        },
        'include/parrot/charset.h' => {
            start   => File::Spec->catfile( qw| . include parrot charset.h | ),
            end     => File::Spec->catfile(
                        $includedir, $versiondir, 'parrot', 'charset.h' ),
        },
        'install_config.fpmc'                 => {
            start   => File::Spec->catfile( qw| . install_config.fpmc | ),
            end     => File::Spec->catfile(
                        $libdir, $versiondir, 'include', 'config.fpmc' ),
        },
        'parrot.pc'                 => {
            start   => File::Spec->catfile( qw| . | ),
            end     => File::Spec->catfile(
                        $libdir, 'pkgconfig', $versiondir, 'parrot.pc' ),
        },
        'compilers/pge/PGE.pir'                 => {
            start   => File::Spec->catfile( qw| . compilers pge PGE.pir | ),
            end     => File::Spec->catfile(
                        $libdir, $versiondir, 'languages', 'pge', 'PGE.pir' ),
        },

    );
    chdir $builddir or croak "Unable to change to tempdir for testing: $!";
    my $man_quasi = File::Spec->catfile( $builddir, 'MANIFEST' );
    my $gen_quasi = File::Spec->catfile( $builddir, 'MANIFEST.generated' );
    copy $full_man_pseudo => $man_quasi
        or croak "Unable to copy $man_pseudo for testing:  $!";
    copy $full_gen_pseudo => $gen_quasi
        or croak "Unable to copy $gen_pseudo for testing: $!";

    my @dirs_needed = qw(
        src
        docs/resources
        include/parrot
        runtime/parrot/include
        compilers/pge
    );
    my @created =
        mkpath( ( map { File::Spec->catdir( $builddir, $_ ) } @dirs_needed ),
            { mode => 0777 } );
    print STDERR "dirs created:  @created\n" if $DEBUG;
    foreach my $f ( keys %testfiles ) {
        my $src = File::Spec->catfile( $cwd, $testlibdir, $f );
        my $des = File::Spec->catfile( $builddir, $testfiles{$f}{start} );
        copy $src, $des or croak "Unable to copy $f for testing: $!";
    }
    my $addlib = qq{$cwd/lib};
    my $cmd = qq{$^X -I$addlib $full_installer --prefix=$prefixdir};
    $cmd .= qq{ --includedir=$includedir};
    $cmd .= qq{ --libdir=$libdir};
    $cmd .= qq{ --versiondir=$versiondir};
    $cmd .= qq{ --docdir=$docdir};
#    $cmd .= qq{ --dry-run=1} if $DEBUG;
    $cmd .= qq{ MANIFEST MANIFEST.generated};
    print "cmd: $cmd\n" if $DEBUG;
    my ($stdout, $stderr);
    capture(
        sub {
            system( $cmd ) and croak "Unable to execute $installer: $!";
        },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/^Installing/, "Got expected standard output" );
    print STDERR "out:  $stdout\n" if $DEBUG;
    print STDERR "err:  $stderr\n" if $DEBUG;
    my $seen = 0;
    my $expected = scalar keys %testfiles;
    foreach my $f ( keys %testfiles ) {
        my $des = $testfiles{$f}{end};
        $seen++ if -f $des;
    }
    is( $seen, $expected,
        "Got all $expected expected files in installation" );

    chdir $cwd
        or croak "Unable to return to top-level directory after testing: $!";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

overall.t - test tools/dev/install_files.pl

=head1 SYNOPSIS

    % prove t/tools/install/overall.t

=head1 DESCRIPTION

This file simulates the operation of F<tools/dev/install_files.pl> and
sanity-checks the results.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

F<tools/dev/install_files.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
