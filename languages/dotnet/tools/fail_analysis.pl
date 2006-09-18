#! perl
use warnings;
use strict;

my %res = ();
while (<>) {
    # Extract message
    chomp;
    s/^\s*\*\*FAILED\*\*\s*\(//;
    s/\)$//;
    
    # Remove instruction code
    s/ \(code \d+\)//;
    
    $res{$_}++;
}

print "$_ & $res{$_} \\\\\n" foreach keys %res;

# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

