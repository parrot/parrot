#! perl -w
# urm.pl 
# 2003 (c) by Marcus Thiesen
# Maybe you can use it for debugging

use warnings;
use strict;
use Data::Dumper;

my @program;
my %register;
my $outreg;
open PROGRAM, $ARGV[0] or die "Couldn't get file";
foreach my $line (<PROGRAM>) {
    chomp $line;
    next if ($line =~ /^ *\#/);
    if ($line =~ /in *\(([r\d,]+)\)/) {
	print "Werte für $1: ";
	my $input = readline(STDIN);
	my @register = split (",", $1);
	chomp $input;
	my @input = split(",", $input);
	foreach my $reg (@register) {
	    $register{$reg} = shift @input;
	}
    }
    if ($line =~ /(r\d+)/) { $register{$1} = 0 unless defined $register{$1}}
    if ($line =~ /out\((r\d+)/) { $outreg = $1 }
    if ($line =~ /^\d+:(.+)/) { 
	my $code = $1;
	# Some beautification!
	$code =~ s/ +/ /g;
	$code =~ s/\#.*//g;
	next unless $code;
	push @program, $code ;
	}
}
close PROGRAM;

#print Dumper @program;

my $pos = 1;
while (1) {
    my $line = $program[$pos -1];
    if ($pos > @program) {last;}
    print "($pos";
    foreach my $reg (sort keys %register) {
	print ", " . $register{$reg} ;
    }
    print ") \t$line\n";
    if ($line =~ /if *(r\d) *= *(\d) *goto *(\d+)/) {
	$register{$1} = 0 unless defined $register{$1};
	if ($register{$1} == $2) {$pos = $3;} else {$pos++}
    }
    elsif ($line =~ /(r\d) *<- *(\d+)/) {
	$register{$1} = $2;
	$pos++;
    }
    elsif ($line =~ /(r\d) *<- *(r\d+) *([+-]) *1/) {
	if ($1 ne $2) {print "Syntax error: Registers don't match!\n"; exit 1;}
	$register{$1} = eval( "$register{$2} $3 1;");
	if ($register{$1} < 0) { $register{$1} = 0 }
	$pos++;
    }
    elsif ($line =~ / *goto *(\d+)/) {
	$pos=$1 ;
    }
    else {
	print "Syntax error\n"; exit;
    }
}  

print "Output: $register{$outreg}\n";
#print Dumper %register;
