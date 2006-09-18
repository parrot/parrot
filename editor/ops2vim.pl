#! perl
use strict;
use warnings;

use File::Basename qw/basename/;


my $cline = my $prefix = 'syn keyword pirOp';

my %seen;

## make sure files have been globbed on non-globbing OSes
## and make sure at least one command-line parameter has been passed
@ARGV = @ARGV
    ? map {glob $_} @ARGV
    : die "usage: " . basename($0) . " FILE [ FILE [ ... ] ]\n";

while (<>) {
    if (/\bop \s+ (\w+) \s* \(/x) {
        next if $seen{$1}++;
        if (length($1) + length($cline) > 72) {
            print "$cline\n";
            $cline = $prefix;
        }
        $cline .= " $1";
    }
}

###
print "$cline\n";

# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
