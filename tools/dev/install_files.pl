#! perl
################################################################################
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$
################################################################################

=head1 TITLE

tools/dev/install_files.pl - Copy files to their correct locations

=head1 SYNOPSIS

    % perl tools/dev/install_files.pl [options]

=head1 DESCRIPTION

Use a detailed MANIFEST to install a set of files.

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

=head2 MANIFEST Format

The format of the MANIFEST (currently MANIFEST and MANIFEST.generated
are used) is:

    source_path <whitespace> [package]meta1,meta2,...

or you may optionally specify a different destination path:

    source_path <whitespace> [package]meta1,meta2,... <whitespace> destination

Additionally, there may be a * in front of the whole line to designate
a generated file:

    source_path <whitespace> *[package]meta1,meta2,... <whitespace> destination

The square brackets around C<package> are literal. C<package> gives
the name of the RPM that the given file will be installed for, and is
only used by this script to skip files that are not members of any
package.

The various meta flags recognized are:

=over 4

=item C<doc>

Tag this file with %doc in the RPM, and omit the leading path (because
rpm will put it into a directory of its choosing)

=item C<include>

Write this file to the location given by the C<--includedir> option

=item C<lib>

Write this file to the location given by the C<--libdir> option

=item C<bin>

Write this file to the location given by the C<--bindir> option

=back

The optional C<destination> field provides a general way to change
where a file will be written to. It will be applied before any
metadata tags.

Example: if this line is in the MANIFEST.generated file

  languages/snorkfest/snork-compile        [main]bin

and the --bindir=/usr/parroty/bin, then the generated
parrot-<VERSION>-1.<arch>.rpm file will contain the file
/usr/parroty/bin/snork-compile.

=head1 SEE ALSO

F<tools/dev/mk_manifests.pl>

=cut

################################################################################

use strict;
use warnings;
use File::Basename qw(basename);
use lib qw( lib );
use Parrot::Install qw(
    install_files
    create_directories
    lines_to_files
);

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
    versiondir  => '',
    'dry-run'   => 0,
    packages    => 'main|library|pge',
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

my $parrotdir = $options{versiondir};

# Set up transforms on filenames
my(@transformorder) = qw(lib bin include doc pkgconfig ^compilers);
my(%metatransforms) = (
    lib => {
        ismeta => 1,
        optiondir => 'lib',
        transform => sub {
            my($filehash) = @_;
            local($_) = $filehash->{Dest};
            if ( /^install_/ ) {
                s/^install_//;     # parrot with different config
                $filehash->{DestDirs} = [$parrotdir, 'include'];
                $filehash->{Dest} = $_;
            }
            else {
                # don't allow libraries to be installed into subdirs of libdir
                $filehash->{Dest} = basename($_);
            }
            return($filehash);
        },
    },
    bin => {
        ismeta => 1,
        optiondir => 'bin',
        transform => sub {
            my($filehash) = @_;
            # parrot with different config
            $filehash->{Installable} = $filehash->{Dest} =~ s/^installable_//;
            return($filehash);
        },
        isbin => 1,
    },
    include => {
        ismeta => 1,
        optiondir => 'include',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} =~ s/^include//;
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    doc => {
        ismeta => 1,
        optiondir => 'doc',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} =~ s#^docs/resources#resources#; # resources go in the top level of docs
            $filehash->{Dest} =~ s/^docs/pod/; # other docs are actually raw Pod
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    pkgconfig => {
        ismeta => 1,
        optiondir => 'lib',
        transform => sub {
            my($filehash) = @_;
            # For the time being this is hardcoded as being installed under
            # libdir as it is typically done with automake installed packages.
            # If there is a use case to make this configurable we'll add a
            # seperate --pkgconfigdir option.
            $filehash->{DestDirs} = ['pkgconfig', $parrotdir];
            return($filehash);
        },
    },
    '^compilers' => {
        optiondir => 'lib',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} =~ s/^compilers/languages/;
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
);

my($filehashes, $directories) = lines_to_files(
    \%metatransforms, \@transformorder, \@manifests, \%options, $parrotdir
);

unless ( $options{'dry-run'} ) {
    create_directories($options{destdir}, $directories);
}

# TT #347
# 1. skip build_dir-only binaries for files marked Installable
my($filehash, @removes, $removes);
foreach $filehash (grep { $_->{Installable} } @$filehashes) {
    my( $src, $dest ) = map { $filehash->{$_} } qw(Source Dest);
    my ($file) = $src =~ /installable_(.+)$/;
    next unless $file;
    if((grep { $_->{Source} =~ /^$file$/ } @$filehashes) and -e $file) {
        print "skipping $file, using installable_$file instead\n";
        push @removes, $file;
    }
}
$removes = join '|', @removes;
@$filehashes = grep { $_->{Source} !~ /^($removes)$/ } @$filehashes;

# 2. for every .exe check if there's an installable. Fail if not
my $i;
foreach $filehash (grep { ! $_->{Installable} } @$filehashes ) {
    my( $src, $dest ) = map { $filehash->{$_} } qw(Source Dest);
    next unless $src =~ /\.exe$/;
    # This logic will fail on non-win32 if the generated files are really
    # generated as with rt #40817. We don't have [main]bin here.
    $i = "installable_$src";
    unless (map {$_->{Source} =~ /^$i$/} grep { $_->{Installable} } @$filehashes) {
        die "$i is missing in MANIFEST or MANIFEST.generated\n";
    }
}

install_files($options{destdir}, $options{'dry-run'}, $filehashes);

print "Finished install_files.pl\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
