#!/usr/bin/perl -w
#
# genrpt.pl
#
# Generate simple OK/Not OK reports for parrot builds.  It was loosely
# inspired by perl5's perlbug utility.  If we want much more, we
# should perhaps just use perlbug.
#
# The user must still manually edit the Not OK report to explain what
# went wrong.

use strict;
use Getopt::Long;
my $USAGE =
"genrpt.pl [--help --ok --nok --File outputfile ]
Generate simple OK/Not OK reports for parrot builds.  Examples:
	genrpt.pl --ok --File parrot.ok    # Makes an 'OK' report
	genrpt.pl --nok -File parrot.nok  # Makes a 'Not OK' report
";

my %opts;
GetOptions(\%opts, qw(help ok nok File=s)) || die $USAGE;

if ($opts{help}) {
    print $USAGE;
    exit(0);
}

if ($opts{File}) {
    open(REPORT, ">$opts{File}") || 
	die "Unable to open report file $opts{File}: $!\n";
}
else {
    open(REPORT, ">-") ||
	die "Unable to open standard output: $!\n";
}


if ($opts{ok}) {
    print REPORT "OK: This is a success report for parrot.\n\n";
    print REPORT "Parrot reported to build OK on this system.\n\n";
}
elsif ($opts{nok}) {
    print REPORT "Not OK: This is a failure report for parrot.\n\n";
}

if (open(MYCONFIG, "<myconfig")) {
    while (<MYCONFIG>) {
	print REPORT $_;
    }
    close(MYCONFIG) || warn "Unable to close myconfig: $!\n";
}
else {
    warn "Unable to open myconfig for input: $!\n";
}

close(REPORT) || warn "Unable to close report file: $!\n";
