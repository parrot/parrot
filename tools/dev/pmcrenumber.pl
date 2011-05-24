#! perl
# Copyright (C) 2009, Parrot Foundation.

use strict;
use warnings;

my $pmc_num_file = $ARGV[0];

my $pmc_order = 0;
my $pmc_num_contents;

open my $pmc_num_fh, '<', $pmc_num_file;

for (<$pmc_num_fh>) {
    if (/^([\w]+)\.pmc\s+\d+$/) {
        $pmc_num_contents .= "$1.pmc    $pmc_order\n";
        $pmc_order++;
    }
    else {
        $pmc_num_contents .= $_;
    }
}

close $pmc_num_fh;
open  $pmc_num_fh, '>', $pmc_num_file;
print $pmc_num_fh $pmc_num_contents;
close $pmc_num_fh;


################### DOCUMENTATION ####################

=head1 NAME

tools/dev/pmcrenumber.pl - Renumber F<src/pmc/pmc.num>.

=head1 SYNOPSIS

    $ perl tools/dev/pmcrenumber.pl pmc.num

=head1 DESCRIPTION

This program should be used when adding PMCs. Note that it does not remove
numbers assigned to PMCs that have been removed; this happens very rarely.

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
