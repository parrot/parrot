#! perl
################################################################################
# Copyright (C) 2001-2007, Parrot Foundation.
################################################################################

=head1 TITLE

tools/dev/mk_rpm_manifests.pl - Generate MANIFEST.* files for building RPMs

=head1 SYNOPSIS

    % perl tools/dev/mk_rpm_manifests.pl [options]

=head1 DESCRIPTION

This file generates a set of F<MANIFEST.*> files that give the final
locations in the file system for all the installable files listed in
F<MANIFEST> and F<MANIFEST.generated>.

It does NOT generate the F<MANIFEST> file that F<Configure.pl> checks
and the manifest checks use.

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

F<install_files.pl>

=cut

################################################################################

use strict;
use warnings;

my %options = (
    prefix      => '/usr',
    exec_prefix => '/usr',
    bindir      => '/usr/bin',
    libdir      => '/usr/lib',
    includedir  => '/usr/include',
);

my $manifest;
foreach (@ARGV) {
    if (/^--([^=]+)=(.*)/) {
        $options{$1} = $2;
    }
    else {
        $manifest = $_;
    }
}

my %FILES;    # { package => file }
@ARGV = ($manifest);
while (<>) {
    chomp;
    my ( $file, $meta, $dest ) = split( /\s+/, $_ );
    $dest ||= $file;
    my $generated = $meta =~ s/^\*//;
    my ($package) = $meta =~ /^\[(.*?)\]/;
    $meta =~ s/^\[(.*?)\]//;
    next if $package eq "";
    my %meta;
    @meta{ split( /,/, $meta ) } = ();
    $meta{$_} = 1 for ( keys %meta );    # Laziness

    my $entry;

    if ( $meta{doc} ) {
        $entry = "%doc $dest";
    }
    elsif ( $meta{lib} ) {
        $entry = "$options{libdir}/$dest";
    }
    elsif ( $meta{bin} ) {
        $entry = "$options{bindir}/$dest";
    }
    elsif ( $meta{include} ) {
        $entry = "$options{includedir}/$dest";
    }
    else {
        $entry = "$options{prefix}/$dest";
    }

    push @{ $FILES{$package} }, $entry;
}

while ( my ( $package, $files ) = each %FILES ) {
    my $manifest = "MANIFEST.$package";
    open( my $MANIFEST, ">", "$manifest" ) or die "create $manifest: $!";
    print $MANIFEST "$_\n" foreach (@$files);
    close $MANIFEST;
    print "Wrote $manifest\n";
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
