#! perl -w
# 
# rip through opcode_table and spit out a chunk of C header for the
# functions in it
while (<>) {
    next if /^\s*#/;
    chomp;
    next unless $_;
    ($num, $name, undef) = split /\s+/, $_;
    print "\tfoo[$num] = $name;\n";
}

