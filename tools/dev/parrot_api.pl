#!/usr/bin/perl -w
# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

tools/dev/parrot_api.pl - Display Parrot API (symbols)

=head1 SYNOPSIS

    % perl tools/dev/parrot_api.pl [libfile]

=head1 DESCRIPTION

Displays the API (the visible symbols, code or data) of the Parrot lib,
.

First finds out the Parrot public embedding API as described in the
F<include/parrot/embed.h>, then finds out the visible symbols in
the Parrot lib (by default F<blib/lib/libparrot.a>), and then
cross-references the dubious API symbols according to the following
categories:

=over 4

=item Missing Parrot API

API listed in F<include/parrot/embed.h> but not defined in the Parrot lib.

Why is the planned public API not implemented?

=item No Parrot Prefix

API has no C<Parrot_> prefix.

If code: if the API is really to be public, prefix it with <Parrot_>
(and not something else), if not, make it private (local).

If data, consider making the data either constant or heap.

=item No Parrot API

API defined in the lib but not in F<inlucde/parrot/embed.h>.

If code, consider making the API private.
If data, consider making the data constant and/or heap.

=item Uninitialized Modifiable Data

Data symbol that is not initialized with data.

Consider making the data constant and/or heap (and accessed through an API).

=item Initialized Modifiable Data

Data symbol that is initialized with data, but modifiable.

Consider making the data constant and/or heap (and accessed through an API).

=back

Uses F<tools/dev/nm.pl> to list the symbols.

=head1 HISTORY

Author: Jarkko Hietaniemi.

=cut

use strict;

my $Obj;

$Obj = shift(@ARGV) unless defined $Obj;
$Obj = 'blib/lib/libparrot.a' unless defined $Obj;
die "$0: '$Obj': No such file\n" unless -f $Obj;

my %ParrotAPI;

$| = 1;

my $H = "include/parrot/embed.h";
if (open(H, $H)) {
    while (<H>) {
	if (/^\w+\s+(Parrot_\w+)/) {
	    $ParrotAPI{$1}++;
	}
    }
    close(H);
} else {
    die "$0: Header '$H': $!\n";
}

die "$0: No API found in '$H'\n" unless keys %ParrotAPI;

printf "$H: %d interfaces\n", scalar keys %ParrotAPI;

my %Code;
my %DataB;
my %DataD;
my %DataR;
my %Undef;
my %API;

print "$Obj: ";
if (open(NM, "perl tools/dev/nm.pl -BDo '$Obj' |")) {
    while (<NM>) {
	my ($o, $s, $v) = split;
	$API{$s} = $o;
	if ($v eq 'T') {
	    $Code{$s} = $o;
	} elsif ($v =~ /[BDR]/) {
	    if ($v eq 'B') {
		$DataB{$s} = $o;
	    } elsif ($v eq 'D') {
		$DataD{$s} = $o;
	    } elsif ($v eq 'R') {
		$DataR{$s} = $o;
	    }
	} elsif ($v eq 'U') {
	    $Undef{$s} = $o;
	}
    }
    close(NM);
} else {
    die "$0: nm.pl -Bgo '$Obj': $!\n";
}
for my $api (keys %API) {
    delete $API{$api} unless exists $Code{$api}; # Not ours.
}
printf "%d interfaces\n", scalar keys %API;

my @API = sort keys %API;

my @NoParrotAPI = grep { !exists $API{$_} } sort keys %ParrotAPI;
my @NoParrotPrefix;
my @UnParrotAPI;

for my $api (@API) {
    unless ($api =~ /^Parrot_/) {
	push @NoParrotPrefix, $api;
    }
    unless (exists $ParrotAPI{$api}) {
	push @UnParrotAPI, $api;
    }
}

if (@NoParrotAPI) {
    printf "=== Missing Parrot API: %d ===\n", scalar @NoParrotAPI;
    for my $api (@NoParrotAPI) {
	printf "%s\n", $api;
    }
}

if (@NoParrotPrefix) {
    printf "=== No Parrot prefix: %d ===\n", scalar @NoParrotPrefix;
    for my $api (@NoParrotPrefix) {
	printf "%s\t%s\n", $api, $API{$api};
    }
}

if (@UnParrotAPI) {
    printf "=== No Parrot API: %d ===\n", scalar @UnParrotAPI;
    for my $api (@UnParrotAPI) {
	printf "%s\t%s\n", $api, $API{$api};
    }
}

if (keys %DataB) {
    printf "=== Uninitialized Modifiable Data: %d ===\n", scalar keys %DataB;
    for my $api (sort keys %DataB) {
	printf "%s\t%s\n", $api, $DataB{$api};
    }
}

if (keys %DataD) {
    printf "=== Initialized Modifiable Data: %d ===\n", scalar keys %DataD;
    for my $api (sort keys %DataD) {
	printf "%s\t%s\n", $api, $DataD{$api};
    }
}

exit(0);
