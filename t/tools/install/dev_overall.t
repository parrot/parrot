#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# dev_overall.t

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
use IO::CaptureOutput qw( capture );

my $DEBUG = 0;

my $cwd = cwd();
my $installer = File::Spec->catfile( 'tools', 'dev', 'install_dev_files.pl' );
my $full_installer = File::Spec->catfile( $cwd, $installer );
ok(-f $full_installer, "Able to locate $installer");

my $testlibdir = File::Spec->catdir( qw| t tools install testlib | );
my $man_pseudo = File::Spec->catfile( $testlibdir, q|dev_manifest_pseudo| );
my $full_man_pseudo = File::Spec->catfile( $cwd, $man_pseudo );
my $gen_pseudo = File::Spec->catfile( $testlibdir, q|dev_generated_pseudo| );
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
    my $srcdir = File::Spec->catdir( $prefixdir, 'src' );
    my $versiondir = $PConfig{versiondir};

    my %testfiles = (
        'compilers/nqp/bootstrap/actions.pm'                 => {
            start   => File::Spec->catfile(
                        qw| .  compilers nqp bootstrap actions.pm | ),
            end     => File::Spec->catfile(
                        $libdir, $versiondir, 'languages', 'nqp', 'bootstrap', 'actions.pm' ),
        },
        'docs/compiler_faq.pod' => {
            start   => File::Spec->catfile( qw| . docs compiler_faq.pod | ),
            end     => File::Spec->catfile(
                        $docdir,  $versiondir, 'pod', 'compiler_faq.pod' ),
        },
        'docs/pct/past_building_blocks.pod' => {
            start   => File::Spec->catfile(
                        qw| . docs pct past_building_blocks.pod | ),
            end     => File::Spec->catfile(
                        $docdir,  $versiondir, 'pod', 'pct', 'past_building_blocks.pod' ),
        },
        'lib/Parrot/Configure.pm' => {
            start   => File::Spec->catfile(
                        qw| . lib Parrot Configure.pm | ),
            end     => File::Spec->catfile(
                        $libdir, $versiondir, 'tools', 'lib', 'Parrot', 'Configure.pm' ),
        },
        'src/ops/ops.num' => {
            start   => File::Spec->catfile(
                        qw| . src ops ops.num | ),
            end     => File::Spec->catfile(
                        $srcdir, $versiondir, 'ops', 'ops.num' ),
        },
        'tools/build/ops2c.pl' => {
            start   => File::Spec->catfile(
                        qw| . tools build ops2c.pl | ),
            end     => File::Spec->catfile(
                        $libdir, $versiondir, 'tools', 'build', 'ops2c.pl' ),
        },
        'runtime/parrot/library/TGE.pbc' => {
            start   => File::Spec->catfile(
                        qw| . runtime parrot library TGE.pbc | ),
            end     => File::Spec->catfile(
                        $libdir, $versiondir, 'library', 'TGE.pbc' ),
        },
        'src/pmc/pmc_object.h' => {
            start   => File::Spec->catfile(
                        qw| . src pmc pmc_object.h | ),
            end     => File::Spec->catfile(
                        $includedir, $versiondir, 'pmc', 'pmc_object.h' ),
        },
        'vtable.dump' => {
            start   => File::Spec->catfile(
                        qw| . vtable.dump | ),
            end     => File::Spec->catfile(
                        $srcdir, $versiondir, 'vtable.dump' ),
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
        compilers/nqp/bootstrap
        docs/pct
        lib/Parrot
        src/ops
        tools/build
        runtime/parrot/library
        src/pmc
    );
    my @created =
        mkpath( map { File::Spec->catdir( $builddir, $_ ) } @dirs_needed );
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
    $cmd .= qq{ --srcdir=$srcdir};
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
        print STDERR "wanted:  $des\n" if $DEBUG;
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

dev_overall.t - test tools/dev/install_dev_files.pl

=head1 SYNOPSIS

    % prove t/tools/install/dev_overall.t

=head1 DESCRIPTION

This file simulates the operation of F<tools/dev/install_dev_files.pl> and
sanity-checks the results.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

F<tools/dev/install_dev_files.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
