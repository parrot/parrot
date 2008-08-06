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
    INT_TYPE     = 0,
    NUM_TYPE     = 1,
    STRING_TYPE  = 2,
    PMC_TYPE     = 3,
    UNKNOWN_TYPE = 4  /* for uninitialized types */

} pir_type;

/* pir pragmas; currently, PIR only has one. This is an
 * enum so future extensions are easy to add.
 */
typedef enum pir_pragmas {
    PRAGMA_N_OPERATORS,

} pir_pragma;


/* selector values for the expression value union */
typedef enum expr_types {
    EXPR_TARGET,
    EXPR_CONSTANT,
    EXPR_IDENT,
    EXPR_INT

} expr_type;

/* parameter flags */
typedef enum target_flags {
    TARGET_FLAG_NAMED       = 0x0001,
    TARGET_FLAG_SLURPY      = 0x0002,
    TARGET_FLAG_OPTIONAL    = 0x0004,
    TARGET_FLAG_OPT_FLAG    = 0x0008,
    TARGET_FLAG_UNIQUE_REG  = 0x0010,
    TARGET_FLAG_INVOCANT    = 0x0020

} target_flag;

/* argument flags */
typedef enum arg_flags {
    ARG_FLAG_NAMED = 0x001,
    ARG_FLAG_FLAT  = 0x002

} arg_flag;


/* sub flags */
typedef enum sub_flags {
    SUB_FLAG_METHOD    = 0x0001,
    SUB_FLAG_INIT      = 0x0002,
    SUB_FLAG_LOAD      = 0x0004,
    SUB_FLAG_OUTER     = 0x0008,
    SUB_FLAG_MAIN      = 0x0010,
    SUB_FLAG_ANON      = 0x0020,
    SUB_FLAG_POSTCOMP  = 0x0040,
    SUB_FLAG_IMMEDIATE = 0x0080,
    SUB_FLAG_VTABLE    = 0x0100,
    SUB_FLAG_LEX       = 0x0200,
    SUB_FLAG_MULTI     = 0x0400,
    SUB_FLAG_LEXID     = 0x0800

} sub_flag;


/* types of uses for invocation structure, in some cases
 * the invocation structure contains just a set of return
 * values, no actual function invocation.
 */
typedef enum invoke_type {
    CALL_PCC       = 0x001,     /* a normal invocation */
    CALL_NCI       = 0x002,     /* an NCI invocation   */
    CALL_METH      = 0x004,     /* a method invocation */
    CALL_RET       = 0x008,     /* returning values    */
    CALL_YIELD     = 0x010,     /* yielding values     */
    CALL_TAIL      = 0x020,     /* a tail call         */
    CALL_METH_TAIL = 0x040      /* a method tail call  */

} invoke_type;

/* use these macros for manipulating bits; don't do it yourself */
#define SET_FLAG(obj,flag)      obj |= flag
#define CLEAR_FLAG(obj,flag)    obj &= ~flag
#define TEST_FLAG(obj,flag)     (obj & flag)


typedef enum value_types {
    INT_VAL,
    NUM_VAL,
    PMC_VAL,
    STR_VAL,
    REG_VAL

} value_type;

/* for representing constant values */
typedef union value {
        char  *sval;
        double nval;
        int    ival;
        char  *pval;
        int    rval;

} value;

/* constant definitions */
typedef struct constant {
    char    *name;
    pir_type type;
    value    val;

} constant;



/* expressions are operands for parrot instructions.

Maybe rename.

 */
typedef struct expression {
    union __expression {
        struct target  *t;
        constant       *c;
        char           *id;
        int            *i;
    } expr;

    expr_type type;

    struct expression *next;

} expression;




/* function parameter or function result, as in (x,y) = foo().
 * A result is just a parameter from the viewpoint of invoking a
 * return continuation.
 */
typedef struct target {
    pir_type    type;
    char       *name;  /* if this is a symbolic variable */
    int         regno; /* if this is a symbolic register */
    int         color; /* for register allocation */
    target_flag flags;
    char       *named_flag_arg;

    struct target *next;

} target;

void *panic(char *msg);

/* maybe this is handy? */
#define type(obj)   obj->type
#define name(obj)   obj->name
#define flags(obj)  obj->flags
#define color(obj)  obj->color
#define next(obj)   obj->next

/* I think it's best to unify target, argument, constant and expression into 1 node type */
typedef struct object {
    pir_type    type;  /* type of this object */
    char       *name;  /* name of this object */
    value_type  vtype; /* selector for val union */
    value       val;
    int         flags;
    int         color; /* this is the PASM register allocated to this object */

    struct object *next;

} object;


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
    target     *object;
    target     *sub;
    target     *retcc;
    target     *results;
    argument   *arguments;

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


/* a sub */
typedef struct subroutine {
    char      *sub_name;
    char      *outer_sub;
    char      *lex_id;
    char      *vtable_method;
    int        flags;
    char     **multi_types;

    target    *parameters;
    statement *statements;


    struct subroutine *next;

} subroutine;


/* forward declaration */
struct lexer_state;

void set_sub_outer(struct lexer_state *lexer, char *outersub);
void set_sub_vtable(struct lexer_state *lexer, char *vtablename);
void set_sub_lexid(struct lexer_state *lexer, char *lexid);

void new_subr(struct lexer_state *lexer, char *subname);

void set_param_named(target *t, char *alias);
void add_instr(struct lexer_state *lexer, char *label, instruction *instr);

void set_arg_flag(argument *arg, arg_flag flag);

constant *new_const(pir_type type, char *name, ...);


expression *expr_from_const(constant *c);
expression *expr_from_target(target *t);
expression *expr_from_ident(char *name);

argument *new_argument(expression *expr);
argument *add_arg(argument *arg1, argument *arg2);

target *add_param(struct lexer_state *lexer, pir_type type, char *name);
target *add_param_named(struct lexer_state *lexer, pir_type type, char *name, char *alias);

target *add_target(struct lexer_state *lexer, target *t1, target *t);
target *find_target(struct lexer_state *lexer, char *name);

target *new_target(pir_type type, char *name);
target *reg(int type, int regno);


invocation *invoke(struct lexer_state *lexer, invoke_type, ...);
void set_invocation_type(invocation *inv, invoke_type type);

target *target_from_string(char *str);
target *target_from_ident(pir_type type, char *id);



void set_pragma(int which_one, int value);
void load_library(struct lexer_state *lexer, char *library);
void set_hll(char *hll);
void set_hll_map(char *stdtype, char *hlltype);
void set_sub_flag(struct lexer_state *lexer, sub_flag flag);

void set_param_flag(target *t, target_flag flag);
void set_arg_named(argument *arg, char *alias);

void new_instr(struct lexer_state *lexer);
void set_label(struct lexer_state *lexer, char *label);
void set_instr(struct lexer_state *lexer, char *opname, ...);

void define_const(struct lexer_state *lexer, constant *var, int is_globalconst);

void set_invocation_args(invocation *inv, argument *args);
void set_invocation_results(invocation *inv, target *results);

void set_lex_flag(target *t, char *lexname);
char *get_inverse(char *instr);
void invert_instr(struct lexer_state *lexer);


void unshift_operand(struct lexer_state *lexer, expression *operand);
void push_operand(struct lexer_state *lexer, expression *operand);
void add_operands(struct lexer_state *state, int count, ...);

expression *add_key(expression *k1, expression *k2);

target *add_local(target *list, target *local);
target *new_local(char *name, int unique);


void print_subs(struct lexer_state *lexer);

#endif /* PARROT_PIR_PIRCOMPUNIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

