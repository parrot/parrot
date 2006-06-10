use Time::HiRes qw(time);

close STDERR;

foreach $srm ('Stack', 'Register', 'OptRegister') {
	print "With SRM $srm\n";
	`nmake clean`;
	`perl Configure.pl --monolib=..\\..\\dlls --srm=$srm`;
	`nmake`;
	my @times = ();
	for (1..5) {
		my $start = time;
		`nmake class-library`;
		my $end = time;
		my $diff = $end - $start;
		push @times, $diff;
		print "$diff (S: $start E: $end)\n";
	}
	my $sum = 0;
	$sum += $_ foreach @times;
	my $av = $sum / 5;
	print "AVERAGE: $av\n\n";
}

