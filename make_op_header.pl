#! perl -w
# 
# rip through opcode_table and spit out a chunk of C header for the
# functions in it
while (<>) {
    next if /^\s*#/ or /^\s*$/;
    chomp;
    ($name, undef) = split /\t/, $_;
    print "IV *$name(IV *, struct Perl_Interp *);\n";
}

BEGIN {
    print q{/* op.h
 *
 * Opcode header
 *
 */

#if !defined(PARROT_OP_H_GUARD)
#define PARROT_OP_H_GUARD

typedef IV OP;

#define DEFAULT_OPCODE_TABLE NULL
}
}

END { print "\n#endif\n"; }
