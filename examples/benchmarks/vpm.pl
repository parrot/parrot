# perl program by Thomas Klausner posted on Vienna-PM list
#
# timings in seconds on Athlon 800
#
# perl         vpm.pl    19.8
# perl58-th    vpm.pl    30.8
#
# parrot -j    vpm.imc   20.7
# parrot -j    vpm1.imc  16.3
# parrot -j    vpm2.imc  15.6
# parrot -C    vpm2.imc  15.9
#
# perl is 5.8.0, parrot built optimized gcc 2.95.2
# Thomas did report that 50% slowdown with threaded perl 5.8.3 too.

# vpm.imc  ... split and join simulated in a loop
# vpm1.imc ... join opcode
# vpm2.imc ... join and split opcodes
#
# beginn
use strict;
use warnings;

my $big;
my $string="just another perl hacker";

for (0 .. 299999) {
    $big++;
    my @str=split(//,$string);
    my $f=shift(@str);
    push(@str,$f);
    $string=join('',@str);
}

print "$big;
$string
";
# ende



