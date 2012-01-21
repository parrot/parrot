# perl
# Copyright (C) 2011, Parrot Foundation.
use strict;
use warnings;
use Digest;

my $t = shift(@ARGV);
my $d = Digest->new('SHA-256');
open my $f, '<:raw', $t or die "Cannot open file '$t' for reading: $t";
binmode $f;
$d->addfile($f);
close $f;
print $d->hexdigest, ' ', $t, "\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
