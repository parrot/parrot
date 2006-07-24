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


