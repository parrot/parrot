#!perl

=head1 TITLE

tools/dev/mk_manifests.pl - Generate MANIFEST.* files for building RPMs

=head1 DESCRIPTION

This file generates a set of MANIFEST.* files that give the final
locations in the file system for all the installable files listed in
MANIFEST and MANIFEST.generated. It does NOT generate the MANIFEST
file that Configure.pl checks and the manifest checks use.

=head1 SEE ALSO

install_files.pl

=cut

my %options = ( prefix => '/usr',
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

my %FILES; # { package => file }
@ARGV = ($manifest);
while(<>) {
    chomp;
    my ($file, $meta, $dest) = split(/\s+/, $_);
    $dest ||= $file;
    my $generated = $meta =~ s/^\*//;
    my ($package) = $meta =~ /^\[(.*?)\]/;
    $meta =~ s/^\[(.*?)\]//;
    next if $package eq "";
    my %meta;
    @meta{split(/,/, $meta)} = ();
    $meta{$_} = 1 for (keys %meta); # Laziness

    my $entry;

    if ($meta{doc}) {
        $entry = "%doc $dest";
    } elsif ($meta{lib}) {
        $entry = "$options{libdir}/$dest";
    } elsif ($meta{bin}) {
        $entry = "$options{bindir}/$dest";
    } elsif ($meta{include}) {
        $entry = "$options{includedir}/$dest";
    } else {
        $entry = "$options{prefix}/$dest";
    }

    push @{ $FILES{$package} }, $entry;
}

while (my ($package, $files) = each %FILES) {
    my $manifest = "MANIFEST.$package";
    open(MANIFEST, ">$manifest") or die "create $manifest: $!";
    print MANIFEST "$_\n" foreach (@$files);
    close MANIFEST;
    print "Wrote $manifest\n";
}
