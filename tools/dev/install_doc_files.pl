#! perl
################################################################################
# Copyright (C) 2001-2009, Parrot Foundation.
################################################################################

=head1 TITLE

tools/dev/install_doc_files.pl - Copy documentation files to their correct locations

=head1 SYNOPSIS

    % perl tools/dev/install_doc_files.pl [options]

=head1 DESCRIPTION

Use a detailed MANIFEST to install a set of documentation files.

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
    srcdir      => '/usr/src/',      # parrot/ subdir added below
    versiondir  => '',
    'dry-run'   => 0,
    packages    => 'doc|examples',
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
my(@transformorder) = (qw(doc examples));
my(%metatransforms) = (
    doc => {
        optiondir => 'doc',
        transform => sub {
            my($filehash) = @_;
            $filehash->{Dest} =~ s#^docs/resources#resources#; # resources go in the top level of docs
            $filehash->{Dest} =~ s/^docs/pod/; # other docs are actually raw Pod
            $filehash->{DestDirs} = [$parrotdir];
            return($filehash);
        },
    },
    examples => {
        optiondir => 'doc',
        transform => sub {
            my($filehash) = @_;
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

print "Finished install_doc_files.pl\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
