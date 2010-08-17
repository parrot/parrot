/*
 * $Id$
 * Copyright (C) 2007-2009, Parrot Foundation.
 */

/*
 * This file contains the interface to the PIR compiler's back-end.
 * It defines all AST nodes that are used to build an abstract
 * syntax tree from the input.
 *
 */

#ifndef PARROT_PIR_PIRCOMPUNIT_H_GUARD
#define PARROT_PIR_PIRCOMPUNIT_H_GUARD

#include "pirdefines.h"
#include "bcgen.h"

/* the 4 parrot types; use explicit values that match the values in
 * PDD03_calling_conventions.pod.
 */
typedef enum pir_types {
    INT_TYPE     = 0,
    STRING_TYPE  = 1,
    PMC_TYPE     = 2,
    NUM_TYPE     = 3,
    UNKNOWN_TYPE = 4  /* for uninitialized types, handy to detect missing initializations. */

} pir_type;



/* selector values for the expression value union */
typedef enum expr_types {
    EXPR_TARGET,
    EXPR_CONSTANT,
    EXPR_IDENT,
    EXPR_KEY,
    EXPR_LABEL

} expr_type;

/* target flags */
typedef enum target_flags {
    TARGET_FLAG_NAMED       = 1 << 0, /* named parameter or variable accepting return value */
    TARGET_FLAG_SLURPY      = 1 << 1, /* slurpy parameter or variable accepting return value */
    TARGET_FLAG_OPTIONAL    = 1 << 2, /* optional parameter */
    TARGET_FLAG_OPT_FLAG    = 1 << 3, /* parameter to check whether the previous (optional)
                                         parameter was passed */
    TARGET_FLAG_UNIQUE_REG  = 1 << 4, /* flag to tell register allocator to leave this poor target
                                         alone! */
    TARGET_FLAG_INVOCANT    = 1 << 5, /* XXX for MDD; to be implemented according to PDD27 */
    TARGET_FLAG_LOOKAHEAD   = 1 << 6, /* for :lookahead */

    /* abuse this enum for these pir compiler internal flags; by adding them here, they can
     * be encoded in the same flag member variable of the target struct, preventing the need
     * for another structure field. As soon as there is a need for 32 target flags, these
     * flags must be encoded into a different flag member.
     */
    TARGET_FLAG_IS_CONST       = 1 << 29,
    TARGET_FLAG_IS_INITIALIZED = 1 << 30, /* set if the target was written to */
    TARGET_FLAG_IS_REG         = 1 << 31  /* set if the target node represents a register;
                                             cleared if it's a .local/.param. */

} target_flag;

/* argument flags */
typedef enum arg_flags {
    ARG_FLAG_NAMED = 1 << 0, /* argument is passed by name */
    ARG_FLAG_FLAT  = 1 << 1  /* argument must be flattened */

} arg_flag;


/* sub flags */
typedef enum sub_flags {
    PIRC_SUB_FLAG_INIT       = SUB_COMP_FLAG_PF_INIT,  /*  run before :main when starting up */
    PIRC_SUB_FLAG_LOAD       = SUB_FLAG_PF_LOAD,  /* run when the bytecode is loaded */
    PIRC_SUB_FLAG_MAIN       = SUB_FLAG_PF_MAIN,  /* start at this sub */
    PIRC_SUB_FLAG_ANON       = SUB_FLAG_PF_ANON,  /* sub is not stored in the global namespace */
    PIRC_SUB_FLAG_POSTCOMP   = SUB_FLAG_PF_POSTCOMP,  /* executed after compilation */
    PIRC_SUB_FLAG_IMMEDIATE  = SUB_FLAG_PF_IMMEDIATE,  /* similar to POSTCOMP above; check PDD19 */

    PIRC_SUB_FLAG_METHOD     = 1 << 10, /* the sub is a method */
    PIRC_SUB_FLAG_HAS_OUTER  = 1 << 11, /* the sub is lexically nested */
    PIRC_SUB_FLAG_IS_OUTER   = 1 << 12, /* the sub contains lexically nested subs. */
    PIRC_SUB_FLAG_VTABLE     = 1 << 13, /* this sub overrides a vtable method */
    PIRC_SUB_FLAG_LEX        = 1 << 14, /* this sub needs a LexPad */
    PIRC_SUB_FLAG_MULTI      = 1 << 15, /* this sub is a multi method/sub */
    PIRC_SUB_FLAG_SUBID      = 1 << 16, /* this sub has a namespace-unaware identifier */
    PIRC_SUB_FLAG_INSTANCEOF = 1 << 17  /* this sub has an :instanceof flag */

} sub_flag;


/* types of uses for invocation structure, in some cases
 * the invocation structure contains just a set of return
 * values, no actual function invocation.
 */
typedef enum invoke_types {
    CALL_PCC,               /* a normal invocation */
    CALL_NCI,               /* an NCI invocation   */
    CALL_METHOD,            /* a method invocation */
    CALL_RETURN,            /* returning values    */
    CALL_YIELD,             /* yielding values     */
    CALL_TAILCALL,          /* a tail call         */
    CALL_METHOD_TAILCALL    /* a method tail call  */

} invoke_type;

/* use these macros for manipulating bits; don't do it yourself */
#define SET_FLAG(obj,flag)      obj |= flag
#define CLEAR_FLAG(obj,flag)    obj &= ~flag
#define TEST_FLAG(obj,flag)     (obj & flag)

/* macros to set the i-th bit */
#define BIT(i)          (1 << (i))
#define SET_BIT(M,B)    SET_FLAG((M),(B))
#define TEST_BIT(M,B)   TEST_FLAG((M),(B))
#define CLEAR_BIT(M,B)  CLEAR_FLAG((M),(B))

#define NOT(X)          !(X)

/* Selectors for the value union. Use explicit values to distinguish them
 * from the pir_type enumeration, this makes it easier to find bugs, where
 * a pir_type value is used where a value_type should be used. These
 * value_types continue where pir_type values end, as value_types are used
 * for indexing the same array containing signature characters (for
 * calculating full-signatured ops, such as set_i_ic).
 */
typedef enum value_types {
    INT_VAL     = 5,
    STRING_VAL  = 6,
    PMC_VAL     = 7,
    NUM_VAL     = 8,
    USTRING_VAL = 9

} value_type;

/* structure representing a "unicode" string;
 * it holds the name of the encoding, the character set
 * and the string itself.
 */
typedef struct ucstring {
    char const *contents; /* the actual string */
    char const *charset;
    char const *encoding;
} ucstring;

/* for representing constant values */
typedef union value {
    char     *sval;
    double    nval;
    int       ival;
    char     *pval;
    ucstring *ustr;
    STRING   *pstr; /* pstr stands for Parrot STRING */

} value;

/* represent a .const or .globalconst declaration */
typedef struct constdecl {
    char const   *name;         /* name of the .const/.globalconst */
    STRING       *name1;
    int           global;       /* flag to indicate whether it's a .globalconst or .const */
    value_type    type;         /* selector for the value union "val" */
    value         val;          /* the value of this .const/.globalconst */

} constdecl;


/* literal constants, possibly named */
typedef struct constant {
    value_type       type;     /* type of the constant; see enum value_types */
    value            val;      /* value of the constant */
    struct constant *next;

} constant;

/* for representing a label operand, as used in the following example:
  
  if x > y goto L1
  
  L1 is here the label operand, and the "goto L1" part of the above statement
  will be represented by some offset.

*/
typedef struct label {
    int         offset;        /* the offset that is used as the operand. */
    char const *name;          /* name of the label that is 
                                  (perhaps conditionally) being jumped to */
    STRING     *name1;                                  

} label;


#define CONST_INTVAL(c) (c)->val.ival
#define CONST_NUMVAL(c) (c)->val.nval
#define CONST_PMCVAL(c) (c)->val.pval
#define CONST_STRVAL(c) (c)->val.sval

/* The expression node is used as a wrapper to represent target nodes (like .param, .local
 * and registers), constant nodes (either named or anonymous), label identifiers,
 * or key nodes, such as ["x";42].
 */
typedef struct expression {
    union expression_union {
        struct target  *t;
        constant       *c;
        char const     *id;
        STRING         *id1;
        struct key     *k;
        struct label   *l;

    } expr;

    expr_type          type;  /* selector for expression_union */

    struct expression *next;

} expression;

#define EXPR_CONST_INTVAL(e)    CONST_INTVAL(e->expr.c)
#define EXPR_CONST_NUMVAL(e)    CONST_NUMVAL(e->expr.c)

/* The key_entry node is used to represent a key */
typedef struct key_entry {
    expression       *expr;      /* value of this key */
    struct key_entry *next;      /* in ["x";"y"], there's 2 key entries; 1 for "x", 1 for "y",
                                    linked by "next" */
} key_entry;

/* The key node represents a key as a whole; it's the "handle"
 * by which to pass the key.
 */
typedef struct key {
    key_entry *head;      /* pointer to the first key entry */
    int        keylength; /* number of entries */

} key;




/* The target node represents a .local, .param or register that can receive a value,
 * hence the name "target". When receiving arguments, it's a parameter, when receiving
 * return values, it's a local variable (or register).
 */
typedef struct target {
    struct syminfo *info;           /* pointer to symbol/pir_reg's information */
    target_flag     flags;          /* flags like :slurpy etc. */
    char const     *alias;          /* if this is a named parameter, this is the alias */
    STRING         *alias1;
    struct key     *key;            /* the key of this target, i.e. $P0[$P1], $P1 is key. */

    struct target  *next;

} target;


/* The argument node is used to represent arguments or return values.
 * the value field contains the actual value; furthermore it can have
 * flags, such as :flatten and :named; if :named is set, it can have
 * an alias, when the argument is passed (or returned) as a named
 * parameter (or return value).
 */
typedef struct argument {
    expression      *value; /* the value of this argument */
    int              flags; /* :flat or :named, if specified */
    char const      *alias; /* value of the :named flag */
    STRING          *alias1;

    struct argument *next;  /* points to the next argument */

} argument;

/* The invocation node represents an invocation statement, or a
 * return statement, but both have the same components; arguments
 * can be passed into a function (parameters) or out of a function,
 * which means they are return values.
 *
 * foo(1,2), (a,b) = foo(1,2), a = foo(1,2)
 *
 * .begin_call/.call PX/.end_call
 *
 * .return foo(), .return foo.bar(), .return x :flat
 */
typedef struct invocation {
    invoke_type         type;          /* type of invocation (PCC, NCI, return/yield) */
    expression         *method;        /* method */
    target             *sub;           /* invoked sub, or the object on which method is invoked */
    target             *retcc;         /* return continuation, if any */
    target             *results;       /* targets that will receive return values */
    argument           *arguments;     /* values passed into the sub, or return values */
    unsigned            num_results;   /* number of result target nodes */
    unsigned            num_arguments; /* number of argument nodes */

} invocation;

/* the instruction node represents a single parrot instruction */
typedef struct instruction {
    unsigned            offset;       /* sequence number of this instruction */
    char         const *label;        /* label of this instruction */
    STRING             *label1;
    char         const *opname;       /* name of the instruction, such as "print" and "set" */
    STRING             *opname1;
    expression         *operands;     /* operands like "$I0" and "42" in "set $I0, 42" */
    int                 oplabelbits;  /* bits indicating which operands are labels */
    struct op_info_t   *opinfo;       /* pointer to the op_info containing this op's meta data */
    int                 opcode;       /* the opcode of this instruction */
    int                 sourceline;   /* PIR source line */

    struct instruction *next;
} instruction;

/* initial size of a hashtable; note that this is a prime number.
 * XXX how to define next prime number, for when we want to resize the hashtable?
 * maybe implement a simple algorithm; shouldn't happen too often anyway.
 */
#define HASHTABLE_SIZE_INIT     113

/* a hashtable bucket for storing something */
typedef struct bucket {
    union bucket_union {
        char const          *str;
        STRING              *pstr;
        struct symbol       *sym;
        struct local_label  *loc;
        struct global_label *glob;
        struct constdecl    *cons;
    } u;

    struct bucket *next; /* link to next bucket, in case of hash clash */

} bucket;

/* accessors for the bucket union */
#define bucket_string(B)    (B)->u.str
#define bucket_symbol(B)    (B)->u.sym
#define bucket_local(B)     (B)->u.loc
#define bucket_global(B)    (B)->u.glob
#define bucket_constant(B)  (B)->u.cons

/* hashtable structure */
typedef struct hashtable {
    bucket   **contents;       /* array of bucket pointers */
    unsigned   size;           /* number of slots in contents array */
    unsigned   obj_count;

} hashtable;


/* struct to represent bytecode annotation */
typedef struct annotation {
    opcode_t     offset;
    char const  *key;      /* key of annotation */
    STRING      *key1;
    constant    *value;    /* value of annotation */

    struct annotation *next; /* next annotation; annotations are stored in a list */

} annotation;

/* forward declaration of structs */
struct symbol;
struct label;



/* a sub */
typedef struct subroutine {
    key                *name_space;    /* this sub's namespace */
    char const         *methodname;    /* name of this sub by which it's stored as a method */
    int                 flags;         /* this sub's flags */

    struct sub_info     info;          /* see bcgen.h */

    target             *parameters;    /* parameters of this sub */
    instruction        *statements;    /* statements of this sub */

    hashtable           symbols;
    hashtable           labels;        /* local labels */

    struct pir_reg     *registers[NUM_PARROT_TYPES];  /* used PIR registers in this sub */

    struct subroutine  *next;          /* pointer to next subroutine in the list */

} subroutine;

/* accessors for current sub and current instruction; makes code a bit more readable */
#define CURRENT_SUB(L)          (L)->subs
#define CURRENT_INSTRUCTION(L)  (L)->subs->statements

/* forward declaration */
struct lexer_state;

/* HEADERIZER BEGIN: compilers/pirc/src/pircompunit.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument * add_arg(ARGMOD(argument *last), ARGIN(argument * const newarg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*last);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
key * add_key(
    ARGIN(lexer_state * const lexer),
    ARGIN(key * const keylist),
    ARGIN(expression * const exprkey))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
symbol * add_local(ARGIN(symbol * const list), ARGIN(symbol * const local))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_operands(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const format),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target * add_param(
    ARGIN(lexer_state * const lexer),
    pir_type type,
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target * add_target(
    SHIM(lexer_state * const lexer),
    ARGMOD(target *last),
    ARGIN(target * const t))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*last);

void annotate(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const key),
    ARGIN(constant * const value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void close_sub(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * expr_from_const(
    ARGIN(lexer_state * const lexer),
    ARGIN(constant * const c))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * expr_from_ident(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const id))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * expr_from_int(ARGIN(lexer_state * const lexer), int ival)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
expression * expr_from_key(
    ARGIN(lexer_state * const lexer),
    ARGIN(key * const k))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * expr_from_num(ARGIN(lexer_state * const lexer), double nval)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * expr_from_string(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const sval))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * expr_from_target(
    ARGIN(lexer_state * const lexer),
    ARGIN(target * const t))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fixup_global_labels(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_CONST_FUNCTION
PARROT_CANNOT_RETURN_NULL
char const * get_inverse(ARGIN(char const * const instr))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression * get_operand(ARGIN(lexer_state * const lexer), short n)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
unsigned get_operand_count(ARGIN(lexer_state *lexer))
        __attribute__nonnull__(1);

void get_operands(ARGIN(lexer_state * const lexer), int bitmask, ...)
        __attribute__nonnull__(1);

void invert_instr(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
invocation * invoke(ARGIN(lexer_state * const lexer), invoke_type type, ...)
        __attribute__nonnull__(1);

int is_parrot_op(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void load_library(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const library))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
argument * new_argument(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const expr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
constant * new_const(ARGIN(lexer_state * const lexer), value_type type, ...)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
key * new_key(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const expr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
symbol * new_local(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name),
    int has_unique_reg)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
constdecl * new_named_const(
    ARGIN(lexer_state * const lexer),
    value_type type,
    ARGIN(char const * const name),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
constdecl * new_pmc_const(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const type),
    ARGIN(char const * const name),
    ARGIN(constant * const value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
target * new_reg(ARGIN(lexer_state * const lexer), pir_type type, int regno)
        __attribute__nonnull__(1);

void new_sub_instr(
    ARGIN(lexer_state * const lexer),
    int opcode,
    ARGIN(char const * const opname),
    unsigned num_var_args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

void new_subr(ARGIN(lexer_state * const lexer), ARGIN(STRING *subname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
target * new_target(ARGMOD(lexer_state *lexer))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*lexer);

void push_operand(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const operand))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void remove_all_operands(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

void reset_register_allocator(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument * set_arg_alias(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const alias))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument * set_arg_flag(ARGIN(argument * const arg), arg_flag flag)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument * set_curarg(
    ARGIN(lexer_state * const lexer),
    ARGIN(argument * const arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target * set_curtarget(
    ARGIN(lexer_state * const lexer),
    ARGIN(target * const t))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_hll(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const hll))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_instr(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const opname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_instrf(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const opname),
    ARGIN(char const * const format),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
invocation * set_invocation_args(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv),
    ARGIN(argument * const args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
invocation * set_invocation_results(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv),
    ARGIN(target * const results))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
invocation * set_invocation_type(
    ARGIN(invocation * const inv),
    invoke_type type)
        __attribute__nonnull__(1);

void set_label(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const labelname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_lex_flag(
    ARGIN(lexer_state * const lexer),
    ARGIN(target * const t),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void set_namespace(ARGIN(lexer_state * const lexer), ARGIN(key * const ns))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_op_labelflag(ARGIN(lexer_state * const lexer), int flag)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target * set_param_alias(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const alias))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target * set_param_flag(
    ARGIN(lexer_state * const lexer),
    ARGIN(target * const param),
    target_flag flag)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_flag(ARGIN(lexer_state * const lexer), sub_flag flag)
        __attribute__nonnull__(1);

void set_sub_instanceof(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const classname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_methodname(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const methodname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_multi_types(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const multitype))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_name(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const subname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_nsentry(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const nsentry))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_outer(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const outersub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_subid(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const subid))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_sub_vtable(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * vtablename))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_target_key(ARGMOD(target *t), ARGIN(key *k))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*t);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
target * target_from_symbol(ARGMOD(lexer_state * lexer), ARGIN(symbol *sym))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* lexer);

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
int targets_equal(
    ARGIN(target const * const left),
    ARGIN(target const * const right))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument * unshift_arg(
    ARGIN(invocation * const inv),
    ARGIN(argument * const newarg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void unshift_operand(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const operand))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void update_instr(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const newop))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void update_op(
    ARGIN(lexer_state * const lexer),
    ARGIN(instruction * const instr),
    int newop)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void update_sub_register_usage(
    ARGIN(lexer_state * const lexer),
    unsigned reg_usage[NUM_PARROT_TYPES])
        __attribute__nonnull__(1);

#define ASSERT_ARGS_add_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(last) \
    , PARROT_ASSERT_ARG(newarg))
#define ASSERT_ARGS_add_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(keylist) \
    , PARROT_ASSERT_ARG(exprkey))
#define ASSERT_ARGS_add_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(list) \
    , PARROT_ASSERT_ARG(local))
#define ASSERT_ARGS_add_operands __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_add_param __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_add_target __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(last) \
    , PARROT_ASSERT_ARG(t))
#define ASSERT_ARGS_annotate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(key) \
    , PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_close_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_expr_from_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(c))
#define ASSERT_ARGS_expr_from_ident __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(id))
#define ASSERT_ARGS_expr_from_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_expr_from_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(k))
#define ASSERT_ARGS_expr_from_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_expr_from_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(sval))
#define ASSERT_ARGS_expr_from_target __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(t))
#define ASSERT_ARGS_fixup_global_labels __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_get_inverse __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(instr))
#define ASSERT_ARGS_get_operand __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_get_operand_count __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_get_operands __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_invert_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_invoke __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_is_parrot_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_load_library __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(library))
#define ASSERT_ARGS_new_argument __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(expr))
#define ASSERT_ARGS_new_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_new_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(expr))
#define ASSERT_ARGS_new_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_new_named_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_new_pmc_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(type) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_new_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_new_sub_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(opname))
#define ASSERT_ARGS_new_subr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(subname))
#define ASSERT_ARGS_new_target __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_push_operand __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(operand))
#define ASSERT_ARGS_remove_all_operands __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_reset_register_allocator __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_set_arg_alias __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(alias))
#define ASSERT_ARGS_set_arg_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_set_curarg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_set_curtarget __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(t))
#define ASSERT_ARGS_set_hll __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(hll))
#define ASSERT_ARGS_set_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(opname))
#define ASSERT_ARGS_set_instrf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(opname) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_set_invocation_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_set_invocation_results __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv) \
    , PARROT_ASSERT_ARG(results))
#define ASSERT_ARGS_set_invocation_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_set_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(labelname))
#define ASSERT_ARGS_set_lex_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(t) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_set_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(ns))
#define ASSERT_ARGS_set_op_labelflag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_set_param_alias __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(alias))
#define ASSERT_ARGS_set_param_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(param))
#define ASSERT_ARGS_set_sub_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_set_sub_instanceof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(classname))
#define ASSERT_ARGS_set_sub_methodname __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(methodname))
#define ASSERT_ARGS_set_sub_multi_types __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(multitype))
#define ASSERT_ARGS_set_sub_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(subname))
#define ASSERT_ARGS_set_sub_nsentry __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(nsentry))
#define ASSERT_ARGS_set_sub_outer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(outersub))
#define ASSERT_ARGS_set_sub_subid __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(subid))
#define ASSERT_ARGS_set_sub_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(vtablename))
#define ASSERT_ARGS_set_target_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(t) \
    , PARROT_ASSERT_ARG(k))
#define ASSERT_ARGS_target_from_symbol __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(sym))
#define ASSERT_ARGS_targets_equal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(left) \
    , PARROT_ASSERT_ARG(right))
#define ASSERT_ARGS_unshift_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(inv) \
    , PARROT_ASSERT_ARG(newarg))
#define ASSERT_ARGS_unshift_operand __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(operand))
#define ASSERT_ARGS_update_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(newop))
#define ASSERT_ARGS_update_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(instr))
#define ASSERT_ARGS_update_sub_register_usage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pircompunit.c */

#endif /* PARROT_PIR_PIRCOMPUNIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

