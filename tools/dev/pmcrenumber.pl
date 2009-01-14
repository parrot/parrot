#! perl
# Copyright (C) 2001-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;

my $pmc_num_file = $ARGV[0];

my $pmc_order = 0;
my $pmc_num_contents;

open (PMC_NUM, "<$pmc_num_file");

for (<PMC_NUM>) {
    if (/^([\w]+)\.pmc\s+\d+$/) {
        $pmc_num_contents .= "$1.pmc    $pmc_order\n";
        $pmc_order++;
    }
    else {
        $pmc_num_contents .= $_;
    }
}

close PMC_NUM;
open (PMC_NUM, ">$pmc_num_file");
print PMC_NUM $pmc_num_contents;
close PMC_NUM;


################### DOCUMENTATION ####################

=head1 NAME

tools/dev/pmcrenumber.pl - Renumber F<src/pmc/pmc.num>.

=head1 SYNOPSIS

    $ perl tools/dev/pmcrenumber.pl pmc.num

=head1 DESCRIPTION

This program should be used when adding or removing PMCs.

=head1 SEE ALSO

=over 4

=item F<lib/Parrot/OpsRenumber.pm>.

=back

=head1 AUTHOR

Christoph Otto 

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
