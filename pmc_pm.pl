#!/usr/bin/perl

open (IN, "include/parrot/pmc.h") or die $!;
open (OUT, ">lib/Parrot/PMC.pm") or die $!;

print OUT <<'EOF';
package Parrot::PMC;
use vars qw(@ISA %pmc_types @EXPORT_OK);

@ISA = qw( Exporter );
@EXPORT_OK = qw( %pmc_types);

%pmc_types = (
EOF

$num = 0;
while (<IN>) { 
    if (/enum_class_(\S+)/) {
        my $name = $1;
        $name =~ s/,$//;
        last if $name eq "max";
        print OUT "\t\L$name => $num,\n";
        $num++;
    }
}
print OUT ");\n\n1;\n";

