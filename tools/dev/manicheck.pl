#! perl -w
################################################################################
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/manicheck.pl - Check the MANIFEST file

=head1 SYNOPSIS

    % perl tools/dev/manicheck.pl

=head1 DESCRIPTION

Check the contents of the F<MANIFEST> file against the files present in
this directory tree, accounting for .svn dirs. Prints out the
number of I<missing>, I<expected>, I<ignored> and I<extra> files, and
then any extra files are listed.

=cut

################################################################################

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Data::Dumper;
use ExtUtils::Manifest;

my $manifest  = ExtUtils::Manifest::maniread();
my $file_list = ExtUtils::Manifest::manifind();
my @missing   = ExtUtils::Manifest::manicheck();
my @extra     = ExtUtils::Manifest::filecheck();
my @ignored   = ExtUtils::Manifest::skipcheck();

printf "Found %d distinct files among MANIFEST and directory contents.\n\n",
  scalar( keys %{$file_list} );

printf "  %5d missing\n",  scalar @missing;
printf "  %5d ignored\n",  scalar @ignored;
printf "  %5d extra\n",    scalar @extra;

# TODO: Use Data::Dumper
if (@missing) {
    print "\n";
    print "Missing files:\n";
    foreach (@missing) {
        print "  $_\n";
    }
}

if (@extra) {
    print "\n";
    print "Extra files:\n";
    foreach (@extra) {
        print "  $_\n";
    }
}

exit scalar(@missing) or scalar(@extra) ? 1 : 0;
