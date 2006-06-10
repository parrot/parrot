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
Name & Done & Total & Percent \\\\
\\hline
HEADING
foreach (@results) {
	print "$_->{'name'} & $_->{'done'} & $_->{'total'} & $_->{'percent'}\\% \\\\ \n";
}

my $done = 0;
my $total = 0;
map { $done += $_->{'done'}; $total += $_->{'total'}; } @results;
my $percent = int(($done / $total) * 100);
print "\\hline\nSummary & $done & $total & $percent\\% \\\\\n";

