/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
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
    char const    *methodname;
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

struct lexer_state;
struct _IMC_Unit;

/* HEADERIZER BEGIN: compilers/pirc/src/bcgen.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void add_annotation(
    ARGIN(bytecode * const bc),
    opcode_t offset,
    opcode_t key,
    opcode_t type,
    opcode_t value)
        __attribute__nonnull__(1);

int add_key_const(ARGIN(bytecode * const bc), ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int add_num_const(ARGIN(bytecode * const bc), double f)
        __attribute__nonnull__(1);

int add_pmc_const(ARGIN(bytecode * const bc), ARGIN(PMC * pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int add_string_const(
    ARGIN(bytecode * const bc),
    ARGIN(char const * const str),
    ARGIN(char const * charset))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int add_sub_pmc(
    ARGIN(bytecode * const bc),
    ARGIN(sub_info * const info),
    int needlex,
    int subpragmas,
    ARGIN(struct lexer_state * const lexer))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

void create_annotations_segment(
    ARGIN(bytecode * const bc),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void create_codesegment(ARGIN(bytecode * const bc), int codesize)
        __attribute__nonnull__(1);

void create_debugsegment(
    ARGIN(bytecode * const bc),
    size_t size,
    ARGIN(char const * const file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

void destroy_bytecode(ARGMOD(bytecode * bc))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* bc);

void emit_debug_info(ARGIN(bytecode * const bc), int sourceline)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
opcode_t /*@alt void@*/
emit_int_arg(ARGIN(bytecode * const bc), int intval)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
opcode_t /*@alt void@*/
emit_opcode(ARGIN(bytecode * const bc), opcode_t op)
        __attribute__nonnull__(1);

FLOATVAL get_num_const(ARGIN(bytecode * const bc), unsigned index)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC * get_pmc_const(ARGIN(bytecode * const bc), unsigned index)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
STRING * get_string_const(ARGIN(bytecode * const bc), unsigned index)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * make_jit_info(PARROT_INTERP, ARGIN(const struct _IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
bytecode * new_bytecode(PARROT_INTERP, ARGIN(char const * const filename))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int store_key_bytecode(ARGIN(bytecode * const bc), ARGIN(opcode_t * key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void write_pbc_file(
    ARGIN(bytecode * const bc),
    ARGIN(char const * const filename))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_add_annotation __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_add_key_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(key)
#define ASSERT_ARGS_add_num_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_add_pmc_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_add_string_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(str) \
    || PARROT_ASSERT_ARG(charset)
#define ASSERT_ARGS_add_sub_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(info) \
    || PARROT_ASSERT_ARG(lexer)
#define ASSERT_ARGS_create_annotations_segment __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(name)
#define ASSERT_ARGS_create_codesegment __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_create_debugsegment __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(file)
#define ASSERT_ARGS_destroy_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_emit_debug_info __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_emit_int_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_emit_opcode __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_get_num_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_get_pmc_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_get_string_const __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc)
#define ASSERT_ARGS_make_jit_info __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(unit)
#define ASSERT_ARGS_new_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(filename)
#define ASSERT_ARGS_store_key_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(key)
#define ASSERT_ARGS_write_pbc_file __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(bc) \
    || PARROT_ASSERT_ARG(filename)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/bcgen.c */

bytecode *new_bytecode(Interp *interp, char const * const filename);

void destroy_bytecode(bytecode * bc);

void create_codesegment(bytecode * const bc, int codesize);
void create_debugsegment(bytecode * const bc, size_t size, char const * const file);
void emit_debug_info(bytecode * const bc, int sourceline);

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
