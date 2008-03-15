#!perl

# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

use Getopt::Long;

my $opt_verbose = 0;
GetOptions( 'verbose'  => \$opt_verbose );

die "usage: $0 path/to/embed.h path/to/Embed.xs\n"
    unless @ARGV == 2;

my ($embed_h, $embed_xs) = @ARGV;

my $embed_funcs_h_ref  = extract_parrot_funcs($embed_h);
print "$embed_h: @{[ sort keys %$embed_funcs_h_ref ]}\n" if $opt_verbose;

my $embed_funcs_xs_ref = extract_parrot_funcs($embed_xs);
print "$embed_xs: @{[ sort keys %$embed_funcs_xs_ref ]}\n" if $opt_verbose;

my %funcs_not_used = %{ $embed_funcs_h_ref };
delete @funcs_not_used{ keys %{ $embed_funcs_xs_ref } };

if (%funcs_not_used) {

    warn sprintf "%d out of %d Parrot_* functions in %s not used in %s:\n",
        scalar(keys %funcs_not_used), scalar keys %$embed_funcs_h_ref, $embed_h, $embed_xs;

    for my $func (sort keys %funcs_not_used) {
        printf "\t%s\n", $func;
    }

    exit 1;
}

exit 0;


sub extract_parrot_funcs {
    my ($filename) = @_;

    open my $fh, "<", $filename
        or die "Can't open $filename $!\n";

    my %names;
    while (<$fh>) {
        next unless m/ \b (Parrot_\w+) \s* \( /x;
        $names{ $1 }++;
    }

    return \%names;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
