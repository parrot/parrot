/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#ifndef PARROT_BCGEN_H_GUARD
#define PARROT_BCGEN_H_GUARD

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "pirdefines.h"

/* the type name is exported, but not its private bits */
struct bytecode;

typedef struct bytecode bytecode;

/* sub info structure, containing all info about a sub that a bytecode
 * generator needs to know.
 */
typedef struct sub_info {
    char const * subname;
    char const * nsentry;
    char const * subid;
    int          vtable_index;
    unsigned     regs_used[NUM_PARROT_TYPES];
    int          startoffset;
    int          endoffset;

} sub_info;

bytecode *new_bytecode(Interp *interp, char const * const filename);


void create_codesegment(bytecode * const bc, int codesize);

/* call this to write the PBC file */
void write_pbc_file(bytecode * const bc, char const * const filename) ;


/* emitting ops */
void emit_opcode(bytecode * const bc, opcode_t op);


/* does a look-up of the op by name, then emit that bytecode */
void emit_op_by_name(bytecode * const bc, char const * const name);


/* emitting operands */

void emit_int_arg(bytecode * const bc, int argvalue);

/* storing constants in constant table */

int add_key_const(bytecode * const bc, PMC *key);

int add_num_const(bytecode * const bc, double f);

int add_string_const(bytecode * const bc, char const * const str);

int add_pmc_const(bytecode * const bc, PMC * pmc) ;

PMC *get_pmc_const(bytecode * const bc, unsigned index);

FLOATVAL get_num_const(bytecode * const bc, unsigned index);

STRING *get_string_const(bytecode * const bc, unsigned index);


/*

int add_string_const(bytecode * const bc, STRING *s);

int add_num_const(bytecode * const bc, FLOATVAL f);

*/


int add_sub_pmc(bytecode * const bc, sub_info * const info);


#endif /* PARROT_BCGEN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
