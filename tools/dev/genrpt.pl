#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/genrpt.pl - Generate reports for parrot builds

=head1 SYNOPSIS

To make an 'OK' report:

    % perl tools/dev/genrpt.pl --ok --File parrot.ok
    
To make an 'Not OK' report:

    % perl tools/dev/genrpt.pl --nok --File parrot.nok

=head1 DESCRIPTION

This script was loosely inspired by perl5's C<perlbug> utility.  If we
want much more, we should perhaps just use C<perlbug>.

The user must still manually edit the Not OK report to explain what went
wrong.

=cut

################################################################################

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
