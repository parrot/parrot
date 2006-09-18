#!perl
use strict;
use warnings;

=head1 NAME

tools/build/addopstags.pl - add src/ops/*.ops to tags

=head1 SYNOPSIS

	perl tools/build/addopstags.pl src/ops/*.ops

=head1 DESCRIPTION

Add src/ops/*.ops to tags file.

=cut


my %seen;
my @tags;

# Pull ops tags
while (<>) {
	if (/\bop \s+ (\w+) \s* \(/x) {
		next if $seen{$1}++;
	# tag file excmd xflags
	push @tags, join( "\t", $1, $ARGV, qq{$.;"}, "f" ) . "\n";
	}
} continue {
	close ARGV if eof;           # reset $.
}

# Pull existing tags
open T, '<', 'tags';
push @tags, <T>;
close T;

# Spit 'em out sorted
open T, '>', 'tags';
print T sort @tags;
close T;

# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
