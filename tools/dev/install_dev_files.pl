#! perl
################################################################################
# Copyright (C) 2001-2009, Parrot Foundation.
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

=head1 SEE ALSO

See F<lib/Parrot/Manifest.pm> for a detailed description of the MANIFEST
format.

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

# When run from the makefile, or from a test script, which are probably the only times
# this script will ever be used, all of these defaults will get overridden.
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
    srcdir      => '/usr/src/',      # parrot/ subdir added below
    versiondir  => '',
    'dry-run'   => 0,
    packages    => 'devel|pct|tge|nqp|data_json',
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
my(@transformorder) = (qw(lib share include src doc), '^(tools|VERSION)', '^compilers');
my(%metatransforms) = (
    lib => {
        ismeta => 1,
        optiondir => 'lib',
        transform => sub {
            my($filehash) = @_;
            $filehash->{DestDirs} = [$parrotdir, "tools"];
            return($filehash);
        },
    },
    share => {
        ismeta => 1,
        optiondir => 'data',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} = basename($filehash->{Dest});
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    include => {
        ismeta => 1,
        optiondir => 'include',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} =~ s/^src//; # strip off leading src/ dir
            $filehash->{Dest} =~ s/^include//;
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    src => {
        ismeta => 1,
        optiondir => 'src',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} =~ s/^src//; # strip off leading src/ dir
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    doc => {
        ismeta => 1,
        optiondir => 'doc',
        transform => sub {
            my($filehash) = @_;
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    '^(tools|VERSION)' => {
        optiondir => 'lib',
        transform => sub {
            my($filehash) = @_;
            $filehash->{DestDirs} = [$parrotdir];
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
install_files($options{destdir}, $options{'dry-run'}, $filehashes);

print "Finished install_dev_files.pl\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
