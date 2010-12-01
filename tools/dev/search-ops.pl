# perl
# Copyright (C) 2008, Parrot Foundation.
use strict;
use warnings;
use Carp;
use Getopt::Long ();
use lib qw( ./lib );
use Parrot::SearchOps qw(
    search_all_ops_files
    usage
    help
);

my ($help, $all);
Getopt::Long::GetOptions(
    "help"    => \$help,
    "all"     => \$all,
) or exit 1;

if ($help) {
    help();
    exit 0;
}

croak "You may search for only 1 ops code at a time: $!"
    if @ARGV > 1;
unless ($all or $ARGV[0]) {
    usage();
    exit 0;
}

my $pattern = $all ? q{} : $ARGV[0];
my $wrap_width = 70;
my $opsdir = q{src/ops};

my $total_identified = search_all_ops_files(
    $pattern, $wrap_width, $opsdir
);

print "No matches were found\n" unless $total_identified;
exit 0;

=head1 NAME

tools/dev/search-ops.pl

=head1 DESCRIPTION

Command-line tool to get descriptions of ops codes.

=head1 USAGE

From the top-level Parrot directory,

    perl tools/dev/search-ops.pl ops_pattern

For help,

    perl tools/dev/search-ops.pl --help

To display all ops codes,

    perl tools/dev/search-ops.pl --all

=head1 AUTHOR

James E Keenan, adapting Python program written by Bernhard Schmalhofer.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
