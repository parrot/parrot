#!/usr/bin/perl -w
# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

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
