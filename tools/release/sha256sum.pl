# perl
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
