#! perl -w
# 
# rip through opcode_table and spit out a chunk of C header for the
# functions in it
while (<>) {
    next if /^\s*#/;
    chomp;
    (undef, $name, undef) = split /\t/, $_;
    print "IV *$name(IV *, struct Perl_Interp *);\n";
}

