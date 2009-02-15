#! perl
################################################################################
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$
################################################################################

=head1 TITLE

tools/dev/install_dev_files.pl - Copy development files to their correct locations

=head1 SYNOPSIS

    % perl tools/dev/install_dev_files.pl [options]

=head1 DESCRIPTION

Use a detailed MANIFEST to install a set of development files.

=head2 Options

=over 4

=item C<buildprefix>

The build prefix. Defaults to ''.

=item C<prefix>

The install prefix. Defaults to '/usr'.

=item C<exec_prefix>

The exec prefix. Defaults to '/usr'.

=item C<bindir>

The executables directory. Defaults to '/usr/bin'.

=item C<libdir>

The library directory. Defaults to '/usr/lib'.

=item C<includedir>

The header directory. Defaults to '/usr/include'.

=back

=head2 See Also

See F<tools/dev/install_files.pl> for a detailed description of the MANIFEST
format.

=cut

################################################################################

use strict;
use warnings;
use File::Basename qw(dirname basename);
use File::Copy;
use File::Spec;

# When run from the makefile, which is probably the only time this
# script will ever be used, all of these defaults will get overridden.
my %options = (
    buildprefix => '',
    prefix      => '/usr',
    destdir     => '',
    exec_prefix => '/usr',
    bindir      => '/usr/bin',
    libdir      => '/usr/lib',       # parrot/ subdir added below
    includedir  => '/usr/include',   # parrot/ subdir added below
    docdir      => '/usr/share/doc', # parrot/ subdir added below
    datadir     => '/usr/share/',    # parrot/ subdir added below
    'dry-run'   => 0,
);

my @manifests;
foreach (@ARGV) {
    if (/^--([^=]+)=(.*)/) {
        $options{$1} = $2;
    }
    else {
        push @manifests, $_;
    }
}

my $parrotdir = "parrot";
if ($options{version}) {
    $parrotdir = File::Spec->catdir( $parrotdir, $options{version} );
}

# We'll report multiple occurrences of the same file
my %seen;

my @files;
my @installable_exe;
my %directories;
@ARGV = @manifests;
while (<>) {
    chomp;

    s/\#.*//;    # Ignore comments
    next if /^\s*$/;    # Skip blank lines

    my ( $src, $meta, $dest ) = split( /\s+/, $_ );
    $dest ||= $src;

    if ( $seen{$src}++ ) {
        print STDERR "$ARGV:$.: Duplicate entry $src\n";
    }

    # Parse out metadata
    die "Malformed line in MANIFEST: $_" if not defined $meta;
    my $generated = $meta =~ s/^\*//;
    my ($package) = $meta =~ /^\[(.*?)\]/;
    $meta =~ s/^\[(.*?)\]//;
    next unless $package;    # Skip if this file belongs to no package

    next unless $package =~ /devel|pct|tge/;

    my %meta;
    @meta{ split( /,/, $meta ) } = ();
    $meta{$_} = 1 for ( keys %meta );          # Laziness

    if ( $meta{lib} ) {
        $dest = File::Spec->catdir( $options{libdir}, $parrotdir, "tools", $dest );
    }
    elsif ( $meta{share} ) {
        $dest = File::Spec->catdir( $options{datadir}, $parrotdir, basename($dest) );
    }
    elsif ( $meta{include} ) {
        $dest =~ s/^src//; # strip off leading src/ dir
        $dest =~ s/^include\/parrot//;
        $dest = File::Spec->catdir( $options{includedir}, $parrotdir, $dest );
    }
    elsif ( $meta{doc} ) {
        $dest =~ s/^docs/pod/; # docs dir are actually raw Pod
        $dest = File::Spec->catdir( $options{docdir}, $parrotdir, $dest );
    }
    elsif ( /^runtime/ ) {
        $dest =~ s/^runtime\/parrot\///;
        $dest = File::Spec->catdir( $options{libdir}, $parrotdir, $dest );
    }
    elsif ( /^tools/ ) {
        $dest = File::Spec->catdir( $options{libdir}, $parrotdir, $dest );
    }
    elsif ( /^VERSION/ ) {
        $dest = File::Spec->catdir( $options{libdir}, $parrotdir, $dest );
    }
    elsif ( /^compilers/ ) {
        $dest =~ s/^compilers/languages/;
        $dest = File::Spec->catdir( $options{libdir}, $parrotdir, $dest );
    }
    else {
        die "Unknown file type in MANIFEST: $_";
    }

    $dest = File::Spec->catdir( $options{buildprefix}, $dest )
        if $options{buildprefix};

    $directories{ dirname($dest) } = 1;
    push( @files, [ $src => $dest ] );
}
continue {
    close ARGV if eof;    # Reset line numbering for each input file
}

unless ( $options{'dry-run'} ) {
    for my $dir ( map { $options{destdir} . $_ } keys %directories ) {
        unless ( -d $dir ) {

            # Make full path to the directory $dir
            my @dirs;
            while ( !-d $dir ) {    # Scan up to nearest existing ancestor
                unshift @dirs, $dir;
                $dir = dirname($dir);
            }
            foreach (@dirs) {
                mkdir( $_, 0777 ) or die "mkdir $_: $!\n";
            }
        }
    }
}
print("Installing ...\n");
foreach ( @files, @installable_exe ) {
    my ( $src, $dest ) = @$_;
    $dest = $options{destdir} . $dest;
    if ( $options{'dry-run'} ) {
        print "$src -> $dest\n";
        next;
    }
    else {
        next unless -e $src;
        copy( $src, $dest ) or die "copy $src to $dest: $!\n";
        print "$dest\n";
    }
    my $mode = ( stat($src) )[2];
    chmod $mode, $dest;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
