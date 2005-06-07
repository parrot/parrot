#! perl -w

my $cline = my $prefix = 'syn keyword imcOp';

my %seen;

while (<@ARGV>) {
    if (/\bop \s+ (\w+) \s* \(/x) {
        next if $seen{$1}++;
        if (length($1) + length($cline) > 72) {
            print "$cline\n";
            $cline = $prefix;
        }
        $cline .= " $1";
    } 
}
print "$cline\n";
