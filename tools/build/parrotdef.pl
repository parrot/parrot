#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.

=head1 NAME

tools/build/parrotdef.pl - Create a DEF file from Parrot headers

=head1 SYNOPSIS

	% perl tools/build/parrotdef.pl

=head1 DESCRIPTION

This script creates a DEF file for use with the Microsoft Linker that
names all functions to export from parrot.exe that may be called from
dynamic PMCs. It looks at header files to build its list.

=cut

use strict;

# This is a list of symbols we'll export 
my @funcnames;
push @funcnames, "yyin";
push @funcnames, "PMCNULL	DATA";
push @funcnames, "Parrot_base_vtables	DATA";

# Emit a .def file.
open FILE, "> parrot.def";
print FILE "EXPORTS\n";
print FILE "\t$_\n" foreach @funcnames;
close FILE;

