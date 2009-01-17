/*
 * $Id$
 * Copyright (C) 2008-2009, The Perl Foundation.
 */

#ifndef PARROT_BCGEN_H_GUARD
#define PARROT_BCGEN_H_GUARD

#include "parrot/parrot.h"
#include "parrot/embed.h"


/* the type name is exported, but not its private bits */
struct bytecode;

/* typedef it here, so the shortname can be used in this header file as well. */
typedef struct bytecode bytecode;

/* selector values for multi_union */
typedef enum multi_entry {
    MULTI_TYPE_KEYED,       /* complex type, such as ['Foo';'Bar'] */
    MULTI_TYPE_IDENT        /* simple type, such as 'Integer' */

} multi_entry;

/* struct to represent a MULTI_TYPE_KEYED multi_type */
typedef struct multi_key_type {

    struct multi_key_type *next;
} multi_key_type;


/* for multi-method signature types */
typedef struct multi_type {

    union multi_union {
        char const     *ident;
        multi_key_type *key;

    } entry;

    multi_entry entry_type;

} multi_type;


/* structure to store lexicals per sub; for each lexical in a sub,
 * there is one instance of the lexical struct in a list of the
 * sub.
 */
typedef struct lexical {
    char const     *name;     /* name of this lexical */
    int            *color;    /* register assigned to the lexical */
    struct lexical *next;

} lexical;


/* sub info structure, containing all info about a sub that a bytecode
 * generator needs to know.
 */
typedef struct sub_info {
    char const    *subname;
    char const    *nsentry;
    char const    *subid;
    char const    *outersub;
    char const    *instanceof;
    int            vtable_index;
    unsigned       regs_used[4];
    int            startoffset;
    int            endoffset;
    unsigned       num_multi_types; /* number of multi types */
    multi_type    *multi_types;   /* array with :multi data types, if this is a multi sub */
    lexical       *lexicals;
    multi_type    *name_space; /* can be a string or key */
    int            iscoroutine;

} sub_info;

bytecode *new_bytecode(Interp *interp, char const * const filename);


void create_codesegment(bytecode * const bc, int codesize);

void create_annotations_segment(bytecode * const bc, char const * const name);

void add_annotation(bytecode * const bc, opcode_t offset, opcode_t key,
                                         opcode_t type, opcode_t value);

/* call this to write the PBC file */
void write_pbc_file(bytecode * const bc, char const * const filename) ;


/* emitting ops */
opcode_t emit_opcode(bytecode * const bc, opcode_t op);

/* emitting operands */
opcode_t emit_int_arg(bytecode * const bc, int argvalue);


/* storing constants in constant table */

int add_key_const(bytecode * const bc, PMC *key);

int store_key_bytecode(bytecode * const bc, opcode_t *keybytecode);

int add_num_const(bytecode * const bc, double f);

int add_string_const(bytecode * const bc, char const * const str, char const * charset);

int add_pmc_const(bytecode * const bc, PMC * pmc) ;

PMC *get_pmc_const(bytecode * const bc, unsigned index);

FLOATVAL get_num_const(bytecode * const bc, unsigned index);

STRING *get_string_const(bytecode * const bc, unsigned index);


/*

int add_string_const(bytecode * const bc, STRING *s);

int add_num_const(bytecode * const bc, FLOATVAL f);

*/

/* forward declaration of lexer_state struct. In the future, this parameter should
 * go, so that this forward declaration can go too.
 */
struct lexer_state;

int add_sub_pmc(bytecode * const bc, sub_info * const info, int needlex, int subpragmas,
                struct lexer_state * const lexer);


#endif /* PARROT_BCGEN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
