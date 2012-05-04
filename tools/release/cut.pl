# perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use Archive::Tar;
use ExtUtils::Manifest qw(maniread);

=head1 Purpose

Generate a gzip'd and bzip2'd tar file for release.

Remove the DEVELOPING file (and its line from the MANIFEST).

=cut

my $VERSION = shift;

$VERSION or die "Usage: $0 <version>";

my $manifest = maniread();

my $tar = Archive::Tar -> new();

$tar->add_files( keys %$manifest );

# Remove DEVELOPING from the tarball
$tar->remove("DEVELOPING");

open my $mf, "<", "MANIFEST";
my $tarnifest = join "", grep { ! /^DEVELOPING /} <$mf>;

$tar->replace_content("MANIFEST", $tarnifest);

$tar->write("parrot-$VERSION.tar.gz",  COMPRESS_GZIP,  "parrot-$VERSION");
$tar->write("parrot-$VERSION.tar.bz2", COMPRESS_BZIP, "parrot-$VERSION");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
