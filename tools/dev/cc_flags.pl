#!/usr/bin/perl -w

use strict;

my $cflags = shift;

open F, $cflags or die "open $cflags: $!\n";

my @options;

while (<F>) {
    chomp;
    s/#.*//;
    next unless /\S/;

    my $regex;
    if (s/^\{(.*?)\}\s*//) {
	next unless $1;
	$regex = qr/$1/;
    }
    elsif (s/^(\S+)\s*//) {
	$regex = qr/^\Q$1\E$/;
    }
    else {
	die "syntax error in $cflags: line $., $_\n";
    }

    for (;;) {
	if (s/^([-+])\{(.*?)\}\s*//) {
	    next unless $2;
	    my ($sign, $options) = ($1, $2);
	    foreach my $option (split ' ', $options) {
		push @options, [ $regex, $sign, $option ];
	    }
	}
	elsif (s{s(.)(.*?)\1(.*?)\1([imsx]*)\s*}{}) {
	    my $mod = "";
	    $mod = "(?$4)" if $4;

	    push @options, [ $regex, 's', "$mod$2", $3 ];
	}
	elsif (/\S/) {
	    die "syntax error in $cflags: line $., $_\n";
	}
	else {
	    last;
	}
    }
}

my ($cfile) = grep /\.c$/, @ARGV;

foreach my $option (@options) {
    if ($cfile =~ $option->[0]) {
	if ($option->[1] eq '+') {
	    splice @ARGV, 1, 0, $option->[2];
	}
	elsif ($option->[1] eq '-') {
	    @ARGV = grep { $_ ne $option->[2] } @ARGV;
	}
	else {
	    foreach my $arg (@ARGV) {
		$arg =~ s/$option->[2]/$option->[3]/;
	    }
	}
    }
}

#print "@ARGV\n";
print "$cfile\n";
exit system(@ARGV)/256;
