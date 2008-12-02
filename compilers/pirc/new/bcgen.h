/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#ifndef PARROT_BCGEN_H_GUARD
#define PARROT_BCGEN_H_GUARD



/* the type name is exported, but not its private bits */
struct bytecode;

typedef struct bytecode bytecode;



bytecode *new_bytecode(void);

/* call this to write the PBC file */
void write_pbc_file(bytecode * const bc);


/* emitting ops */

void emit_opcode(bytecode * const bc, int opcode);

/* does a look-up of the op by name, then emit that bytecode */
void emit_op_by_name(bytecode * const bc, char const * const name);


/* emitting operands */

void emit_int_arg(bytecode * const bc, int argvalue);

void emit_pmc_arg(bytecode * const bc, int pmc_const_index);

void emit_num_arg(bytecode * const bc, int num_const_index);

void emit_string_arg(bytecode * const bc, int string_const_index);


/* for adding constants */

/* returns the id in the constant table */
int add_pmc_const(bytecode * const bc);

int add_string_const(bytecode * const bc, STRING *s);

int add_num_const(bytecode * const bc, NUMVAL f);

int add_int_const(bytecode * const bc, INTVAL i);


/* some functions to update constants */

void update_pmc_const(bytecode * const bc, int pmc_const_index
/* what kind of value arg? */);

void update_string_const(bytecode * const bc, int str_const_index, STRING *s);
/* XXX and other types... */

/* XXX todo: define some API functions for finding values, etc. like this: */
int get_string_const_index(bytecode * const bc, STRING *s);
/* retrieves the index of s in the constant table */

/* for sake of completeness.. */
void remove_const(bytecode * const bc, int const_index);
/* removes constant in slot C<const_index> from constant table */

#endif /* PARROT_BCGEN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
