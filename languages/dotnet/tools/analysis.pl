#!/usr/bin/perl
use strict;

my @results = ();
while (<>) {
	if (/^Translated (\d+) types out of (\d+) from .+?([\.\w]+)\n$/) {
		push @results, {
			name	=> $3,
			total	=> $2,
			done	=> $1,
			percent	=> int(($1 / $2) * 100)
		};
	}
}

print <<HEADING;
NAME                                              DONE      TOTAL     PERCENT
HEADING
foreach (@results) {
	print $_->{'name'} . (' ' x (50 - length($_->{'name'})));
	print $_->{'done'} . (' ' x (10 - length($_->{'done'})));
	print $_->{'total'} . (' ' x (10 - length($_->{'total'})));
	print $_->{'percent'} . "%\n"
}

my $done = 0;
my $total = 0;
map { $done += $_->{'done'}; $total += $_->{'total'}; } @results;
my $percent = int(($done / $total) * 100);
print "SUMMARY                                           ";
print $done . (' ' x (10 - length($done)));
print $total . (' ' x (10 - length($total)));
print "$percent%\n"
