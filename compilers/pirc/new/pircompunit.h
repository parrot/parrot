/*
 * $Id$
 * Copyright (C) 2007-2009, The Perl Foundation.
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

    /* abuse this enum for these pir compiler internal flags; by adding them here, they can
     * be encoded in the same flag member variable of the target struct, preventing the need
     * for another structure field. As soon as there is a need for 32 target flags, these
     * flags must be encoded into a different flag member.
     */
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

/* selector for the value union */
typedef enum value_types {
    INT_VAL,
    NUM_VAL,
    PMC_VAL,
    STR_VAL,

} value_type;

/* for representing constant values */
typedef union value {
    char    *sval;
    double   nval;
    int      ival;
    char    *pval;

} value;

/* literal constants, possibly named */
typedef struct constant {
    char const      *name;     /* name of the constant, if declared as a constant */
    pir_type         type;     /* type of the constant */
    value            val;      /* value of the constant */
    struct constant *next;

} constant;

/* for representing a label operand */
typedef struct label {
    int         offset;
    char const *name;

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
    struct key_entry *next;      /* in ["x";"y"], there's 2 key nodes; 1 for "x", 1 for "y",
                                    linked by "next" */
} key_entry;

/* The key node represents a key as a whole; it's the "handle"
 * by which to pass the key.
 */
typedef struct key {
    key_entry *head;
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
    char         const *opname;       /* name of the instruction, such as "print" and "set" */
    expression         *operands;     /* operands like "$I0" and "42" in "set $I0, 42" */
    int                 oplabelbits;  /* bits indicating which operands are labels */
    struct op_info_t   *opinfo;       /* pointer to the op_info containing this op's meta data */
    int                 opcode;       /* the opcode of this instruction */

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
        struct symbol       *sym;
        struct local_label  *loc;
        struct global_label *glob;
        struct constant     *cons;
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

/* set the namespace that was just parsed */
void set_namespace(struct lexer_state * const lexer, key * const ns);

/* various set functions to set the value of a subroutine flag */
void set_sub_outer(struct lexer_state * const lexer, char const * const outersub);
void set_sub_vtable(struct lexer_state * const lexer, char const * vtablename);
void set_sub_subid(struct lexer_state * const lexer, char const * const subid);
void set_sub_instanceof(struct lexer_state * const lexer, char const * const classname);
void set_sub_nsentry(struct lexer_state * const lexer, char const * const nsentry);
void set_sub_methodname(struct lexer_state * const lexer, char const * const methodname);

void set_sub_multi_types(struct lexer_state * const lexer, expression * const multitype);

/* install a new subroutine node */
void new_subr(struct lexer_state * const lexer, char const * const subname);

void set_sub_name(struct lexer_state * const lexer, char const * const subname);

/* functions for setting argument flags or argument alias */
argument *set_arg_flag(argument * const arg, arg_flag flag);
argument *set_arg_alias(struct lexer_state * const lexer, char const * const alias);

/* constructors for constant nodes */
constant *new_named_const(struct lexer_state * const lexer, pir_type type,
                          char const * const name, ...);

constant *new_const(struct lexer_state * const lexer, pir_type type, ...);

constant *new_pmc_const(char const * const type, char const * const name, constant * const value);

/* conversion functions, each wrapping its argument in an expression node */
expression *expr_from_const(struct lexer_state * const lexer, constant * const c);
expression *expr_from_target(struct lexer_state * const lexer, target * const t);
expression *expr_from_ident(struct lexer_state * const lexer, char const * const name);
expression *expr_from_key(struct lexer_state * const lexer, key * const k);
expression *expr_from_string(struct lexer_state * const lexer, char const * const sval);
expression *expr_from_int(struct lexer_state * const lexer, int ival);

/* functions for argument node creation and storing */
argument *new_argument(struct lexer_state * const lexer, expression * const expr);
argument *add_arg(argument *arg1, argument * const arg2);

target *add_param(struct lexer_state * const lexer, pir_type type, char const * const name);
target *set_param_alias(struct lexer_state * const lexer, char const * const alias);
target *set_param_flag(struct lexer_state * const lexer, target * const t, target_flag flag);

target *set_curtarget(struct lexer_state * const lexer, target * const t);
argument *set_curarg(struct lexer_state * const lexer, argument * const arg);

/* target constructors */
target *add_target(struct lexer_state * const lexer, target *t1, target * const t);
target *new_reg(struct lexer_state * const lexer, pir_type type, int regno);
target *new_target(struct lexer_state * const lexer);

/* set a key on a target node */
void set_target_key(target * const t, key * const k);

/* functions for creating an invocation node and setting various fields */
invocation *invoke(struct lexer_state * const lexer, invoke_type, ...);
invocation *set_invocation_type(invocation * const inv, invoke_type type);
invocation *set_invocation_args(struct lexer_state * const lexer, invocation * const inv,
                                argument * const args);

invocation *set_invocation_results(struct lexer_state * const lexer, invocation * const inv,
                                   target * const results);

/* conversion functions that wrap their arguments into a target node */
target *target_from_symbol(struct lexer_state * const lexer, struct symbol * const sym);

/* management functions for key nodes */
key *new_key(struct lexer_state * const lexer, expression * const expr);
key *add_key(struct lexer_state * const lexer, key * const keylist, expression * const newkey);

void load_library(struct lexer_state * const lexer, char const * const library);
void set_hll(struct lexer_state * const lexer, char const * const hll);
void set_hll_map(struct lexer_state * const lexer, char const * const stdtype,
                 char const * const hlltype);

void set_sub_flag(struct lexer_state * const lexer, sub_flag flag);

/* constructor and functions for setting instruction fields */
void set_label(struct lexer_state * const lexer, char const * const label);
void set_instr(struct lexer_state * const lexer, char const * const opname);
void set_instrf(struct lexer_state * const lxr, char const * const op, char const * const fmt, ...);
void unshift_operand(struct lexer_state * const lexer, expression * const operand);
void push_operand(struct lexer_state * const lexer, expression * const operand);
void add_operands(struct lexer_state * const lexer, char const * const format, ...);

void get_operands(struct lexer_state * const lexer, int bitmask, ...);
expression *get_operand(struct lexer_state * const lexer, short n);
unsigned get_operand_count(struct lexer_state * const lexer);

void update_instr(struct lexer_state * const lexer, char const * const newop);
void update_op(struct lexer_state * const lexer, instruction * const instr, int newop);

void remove_operand(struct lexer_state * const lexer, unsigned index);
void remove_all_operands(struct lexer_state * const lexer);


void set_lex_flag(struct lexer_state * const lexer, target * const t, char const * const lexname);
char const *get_inverse(char const * const instr);
void invert_instr(struct lexer_state * const lexer);

/* local declaration functions */
struct symbol *add_local(struct symbol * const list, struct symbol * const local);
struct symbol *new_local(struct lexer_state * const lexer, char const * const name, int unique);

/* compare two target nodes */
int targets_equal(target const * const t1, target const * const t2);

/* funtion to reset the register allocator */
void reset_register_allocator(struct lexer_state * const lexer);

/* to check whether given name is a parrot opcode */
int is_parrot_op(struct lexer_state * const lexer, char const * const name);

void close_sub(struct lexer_state * const lexer);
void fixup_global_labels(struct lexer_state * const lexer);
void set_op_labelflag(struct lexer_state * const lexer, int flag);
void convert_inv_to_instr(struct lexer_state * const lexer, invocation * const inv);

void update_sub_register_usage(struct lexer_state * const lexer,
                               unsigned reg_usage[NUM_PARROT_TYPES]);

void new_sub_instr(struct lexer_state * const lexer, int opcode, char const * const opname,
              unsigned num_var_args);

#endif /* PARROT_PIR_PIRCOMPUNIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

