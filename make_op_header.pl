#! perl -w
# 
# rip through opcode_table and spit out a chunk of C header for the
# functions in it
use strict;
use Parrot::Opcode;
my %opcodes = Parrot::Opcode::read_ops();
for my $name (sort {$opcodes{$a}{CODE} <=> $opcodes{$b}{CODE}} keys %opcodes) {
    print "#define $name Parrot_op_$name\n";
    print "IV *$name(IV *, struct Parrot_Interp *);\n";
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
