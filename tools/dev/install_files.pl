#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

use File::Basename qw(dirname);
use File::Copy;
use File::Spec;
use strict;

# When run from the makefile, which is probably the only time this
# script will ever be used, all of these defaults will get overridden.
my %options = ( buildprefix => '',
                prefix => '/usr',
                exec_prefix => '/usr',
                bindir => '/usr/bin',
                libdir => '/usr/lib',
                includedir => '/usr/include',
              );

my @manifests;
foreach (@ARGV) {
    if (/^--([^=]+)=(.*)/) {
        $options{$1} = $2;
    } else {
        push @manifests, $_;
    }
}

my @files;
my %directories;
@ARGV = @manifests;
while(<>) {
    chomp;
    my ($src, $meta, $dest) = split(/\s+/, $_);
    $dest ||= $src;

    # Parse out metadata
    my $generated = $meta =~ s/^\*//;
    my ($package) = $meta =~ /^\[(.*?)\]/;
    $meta =~ s/^\[(.*?)\]//;
    next unless $package; # Skip if this file belongs to no package
    my %meta;
    @meta{split(/,/, $meta)} = ();
    $meta{$_} = 1 for (keys %meta); # Laziness

    if ($meta{lib}) {
        $dest = File::Spec->catdir($options{libdir}, $dest);
    } elsif ($meta{bin}) {
        $dest = File::Spec->catdir($options{bindir}, $dest);
    } elsif ($meta{include}) {
        $dest = File::Spec->catdir($options{includedir}, $dest);
    } else {
        $dest = File::Spec->catdir($options{prefix}, $dest);
    }

    $dest = File::Spec->catdir($options{buildprefix}, $dest)
      if $options{buildprefix};

    $directories{dirname($dest)} = 1;
    push(@files, [ $src => $dest ]);
}

for my $dir (keys %directories) {
    unless (-d $dir) {
        # Make full path to the directory $dir
        my @dirs;
        while (! -d $dir) { # Scan up to nearest existing ancestor
            unshift @dirs, $dir;
            $dir = dirname($dir);
        }
        foreach (@dirs) {
            mkdir($_, 0777) or die "mkdir $_: $!";
        }
    }
}

foreach (@files) {
    my ($src, $dest) = @$_;
    copy($src, $dest) or die "copy $src to $dest: $!";
}
