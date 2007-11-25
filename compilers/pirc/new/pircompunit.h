/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*
 * This file contains the interface to the PIR compiler's back-end.
 * It defines all AST nodes that are used to build an abstract
 * syntax tree from the input.
 *
 */

#ifndef PARROT_PIR_PIRCOMPUNIT_H_GUARD
#define PARROT_PIR_PIRCOMPUNIT_H_GUARD

/* the 4 parrot types */
typedef enum pir_types {
    INT_TYPE,
    NUM_TYPE,
    PMC_TYPE,
    STRING_TYPE,
    UNKNOWN_TYPE

} pir_type;

/* different types of rhs expressions */
typedef enum rhs_types {
    RHS_AUGMENT,
    RHS_SETKEYED,
    RHS_UNOP,
    RHS_SIMPLE,
    RHS_BINOP,
    RHS_GETKEYED

} rhs_type;

typedef enum expr_types {
    EXPR_TARGET,
    EXPR_CONSTANT,
    EXPR_IDENT

} expr_type;

/* parameter flags */
typedef enum param_flags {
    PARAM_FLAG_NAMED      = 0x001,
    PARAM_FLAG_SLURPY     = 0x002,
    PARAM_FLAG_OPTIONAL   = 0x004,
    PARAM_FLAG_OPT_FLAG   = 0x008,
    PARAM_FLAG_UNIQUE_REG = 0x010

} param_flag;

/* argument flags */
typedef enum arg_flags {
    ARG_FLAG_NAMED = 0x001,
    ARG_FLAG_FLAT  = 0x002

} arg_flag;


/* sub flags */
typedef enum sub_flags {
    SUB_FLAG_METHOD    = 0x001,
    SUB_FLAG_INIT      = 0x002,
    SUB_FLAG_LOAD      = 0x004,
    SUB_FLAG_OUTER     = 0x008,
    SUB_FLAG_MAIN      = 0x010,
    SUB_FLAG_ANON      = 0x020,
    SUB_FLAG_POSTCOMP  = 0x040,
    SUB_FLAG_IMMEDIATE = 0x080,
    SUB_FLAG_VTABLE    = 0x100,
    SUB_FLAG_LEX       = 0x200,
    SUB_FLAG_MULTI     = 0x400

} sub_flag;


/* types of uses for invocation structure. */
typedef enum invoke_type {
    CALL_PCC   = 0x001,     /* a normal invocation */
    CALL_NCI   = 0x002,     /* an NCI invocation   */
    CALL_METH  = 0x004,     /* a method invocation */
    CALL_RET   = 0x008,     /* returning values    */
    CALL_YIELD = 0x010,     /* yielding values     */
    CALL_TAIL  = 0x020      /* a tail call         */

} invoke_type;

/* use these macros for manipulating bits; don't do it yourself */
#define SET_FLAG(obj,flag)      obj |= flag
#define CLEAR_FLAG(obj,flag)    obj &= ~flag
#define TEST_FLAG(obj,flag)     obj & flag




/* for representing constant values */
typedef union value {
        char  *sval;
        double nval;
        int    ival;
        char  *pval;

} value;

/* constant definitions */
typedef struct constant {
    char    *name;
    pir_type type;
    value    val;

} constant;



/* expression wrapper node. */
typedef struct expression {
    union __expression {
        struct target *t;
        constant      *c;
        char          *id;
    } expr;

    expr_type type;

    struct expression *next;

} expression;




/* function parameter or function result, as in (x,y) = foo().
 * A result is just a parameter from the viewpoint of invoking a
 * return continuation.
 */
typedef struct target {
    pir_type type; /* not used in function calls */
    char    *name;
    int      regno;

    int      flags;
    char    *named_flag_arg;

    struct target *next;

} target;



/* function arguments or return values, but a return value is just
 * an argument when invoking the return continuation.
 */
typedef struct argument {
    expression *value;
    int         flags;
    char       *named_flag_arg;

    struct argument *next;

} argument;

/* represents an invocation statement,or a return statement.
 *
 * foo(1,2), (a,b) = foo(1,2), a = foo(1,2)
 *
 * .begin_call/.call PX/.end_call
 *
 * .return foo(), .return foo.bar(), .return x :flat
 */
typedef struct invocation {
    invoke_type type;
    char *object;
    char *sub;
    char *retcc;

    target   *results;
    argument *arguments;

} invocation;

/* a parrot instruction */
typedef struct instruction {
    char       *opname;
    expression *operands;

} instruction;


/* a statement can be either a parrot instruction or function call */

typedef enum statement_types {
    STAT_TYPE_INSTRUCTION,
    STAT_TYPE_INVOCATION

} statement_type;


typedef struct statement {
    char      *label;
    statement_type type;  /* indicates which field of the union is used */

    union __statement {
        instruction *ins;
        invocation  *inv;
    }
    instr;

    struct statement *next;

} statement;


/*
#define DECLARE(type,itemtype)  typedef struct type##_block {    \
                                    itemtype[type##_BLOCK_SIZE]; \
                                    int count;                   \
                                    struct type##_block *next;   \
                                } type##_block

#define LIST(type, name)    type##_block *name


DECLARE(param, sub_param);

*/

/* a sub */
typedef struct subroutine {
    char  *sub_name;
    char  *outer_sub;
    char  *vtable_method;
    int    flags;
    char **multi_types;


    target      *parameters;
    statement   *statements;
/*
    LIST(param, parameters);
    LIST(instr, instructions);

    */
    struct subroutine *next;

} subroutine;

/*

#define ADD_ITEM(type,block,newitem) if (block->count == type##_BLOCK_SIZE) { \
                                   type##_block *newblock = (type##_block *)malloc(sizeof (type##_block));

                               }                                        \
                               else {                                   \
                                   block->type##_items[block->count++] = newitem; \
                               }


ADD_ITEM(param,x);

*/


/* forward declaration */
struct lexer_state;

void set_sub_outer(struct lexer_state *lexer, char *outersub);
void set_sub_vtable(struct lexer_state *lexer, char *vtablename);
void new_sub(struct lexer_state *lexer, char *subname);

void set_param_named(target *t, char *alias);
void add_instr(struct lexer_state *lexer, char *label, instruction *instr);

constant *new_iconst(char *name, int val);
constant *new_sconst(char *name, char *val);
constant *new_pconst(char *name, char *val);
constant *new_nconst(char *name, double val);

expression *expr_from_constant(constant *c);
expression *expr_from_target(target *t);
expression *expr_from_ident(char *name);

argument *new_argument(expression *expr);
argument *add_arg(argument *arg1, argument *arg2);

target *add_param(struct lexer_state *lexer, pir_type type, char *name);
target *add_target(struct lexer_state *lexer, target *t, target *newt);

target *new_target(pir_type type, char *name);
target *reg(int type, int regno);


invocation *invoke(invoke_type, char *invokable1, char *invokable2);
void set_invocation_flag(invocation *inv, invoke_type flag);

#endif /* PARROT_PIR_PIRCOMPUNIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

