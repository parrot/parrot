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

Example: if this line is in the MANIFEST.detailed file

  *[main]bin	languages/imcc/imcc     imcc

and the --bindir=/usr/parroty/bin, then the generated
parrot-<VERSION>-1.<arch>.rpm file will contain the file
/usr/parroty/bin/imcc.

=head1 SEE ALSO

F<tools/dev/mk_manifests.pl>

=cut

################################################################################

use File::Basename qw(dirname);
use strict;

my %options = ( buildprefix => '',
                prefix => '/usr',
                exec_prefix => '/usr',
                bindir => '/usr/bin',
                libdir => '/usr/lib',
                includedir => '/usr/include',
              );

my $manifest;
foreach (@ARGV) {
    if (/^--([^=]+)=(.*)/) {
        $options{$1} = $2;
    } else {
        $manifest = $_;
    }
}

my @files;
my %directories;
@ARGV = ($manifest);
while(<>) {
    chomp;
    my ($src, $meta, $dest) = split(/\s+/, $_);
    $dest ||= $src;

    # Parse out metadata
    my $generated = $meta =~ s/^\*//;
    my ($package) = $meta =~ /^\[(.*?)\]/;
    $meta =~ s/^\[(.*?)\]//;
    next if $package eq ""; # Skip if this file belongs to no package
    my %meta;
    @meta{split(/,/, $meta)} = ();
    $meta{$_} = 1 for (keys %meta); # Laziness

    if ($meta{lib}) {
        $dest = "$options{libdir}/$dest";
    } elsif ($meta{bin}) {
        $dest = "$options{bindir}/$dest";
    } elsif ($meta{include}) {
        $dest = "$options{includedir}/$dest";
    } else {
        $dest = "$options{prefix}/$dest";
    }

    $dest = "$options{buildprefix}/$dest" if $options{buildprefix};

    $directories{dirname($dest)} = 1;
    push(@files, [ $src => $dest ]);
}

foreach (sort keys %directories) {
    print "install -d $_\n";
}

foreach (@files) {
    my ($src, $dest) = @$_;
    print "install -c $src $dest\n";
}
