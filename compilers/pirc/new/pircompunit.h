/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*
 * This file contains the interface to the PIR compiler's back-end.
 * It defines all AST nodes that are used to build an abstract
 * syntax tree from the input.
 *
 */

#ifndef PARROT_PIR_PIRCOMPUNIT_H_GUARD
#define PARROT_PIR_PIRCOMPUNIT_H_GUARD

/* the 4 parrot types; use explicit values, they are used to index an array,
 * so this way we can be sure that works properly.
 */
typedef enum pir_types {
    INT_TYPE     = 0,
    NUM_TYPE     = 1,
    STRING_TYPE  = 2,
    PMC_TYPE     = 3,
    UNKNOWN_TYPE = 4  /* for uninitialized types */

} pir_type;



/* selector values for the expression value union */
typedef enum expr_types {
    EXPR_TARGET,
    EXPR_CONSTANT,
    EXPR_IDENT,
    EXPR_KEY

} expr_type;

/* parameter flags */
typedef enum target_flags {
    TARGET_FLAG_NAMED       = 0x01, /* named parameter or variable accepting return value */
    TARGET_FLAG_SLURPY      = 0x02, /* slurpy parameter or variable accepting return value */
    TARGET_FLAG_OPTIONAL    = 0x04, /* optional parameter */
    TARGET_FLAG_OPT_FLAG    = 0x08, /* parameter to check whether the previous (optional) parameter was passed */
    TARGET_FLAG_UNIQUE_REG  = 0x10, /* flag to tell register allocator to leave this poor target alone! */
    TARGET_FLAG_INVOCANT    = 0x20  /* XXX for MDD; to be implemented according to PDD27 */

} target_flag;

/* argument flags */
typedef enum arg_flags {
    ARG_FLAG_NAMED = 0x001, /* argument is passed by name */
    ARG_FLAG_FLAT  = 0x002  /* argument must be flattened */

} arg_flag;


/* sub flags */
typedef enum sub_flags {
    SUB_FLAG_METHOD    = 0x001, /* the sub is a method */
    SUB_FLAG_INIT      = 0x002, /* the sub is run before :main when starting up */
    SUB_FLAG_LOAD      = 0x004, /* the sub is run when the bytecode is loaded */
    SUB_FLAG_OUTER     = 0x008, /* the sub is lexically nested */
    SUB_FLAG_MAIN      = 0x010, /* execution of the program will start at this sub */
    SUB_FLAG_ANON      = 0x020, /* this sub is shy and will not be stored in the global namespace */
    SUB_FLAG_POSTCOMP  = 0x040, /* this sub will be executed after compilation */
    SUB_FLAG_IMMEDIATE = 0x080, /* similar to POSTCOMP above; check out PDD19 for difference */
    SUB_FLAG_VTABLE    = 0x100, /* this sub overrides a vtable method */
    SUB_FLAG_LEX       = 0x200, /* this sub needs a LexPad */
    SUB_FLAG_MULTI     = 0x400, /* this sub is a multi method/sub */
    SUB_FLAG_LEXID     = 0x800  /* this sub has a namespace-unaware identifier */

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
    char    *sval;
    double   nval;
    int      ival;
    char    *pval;
    int      rval;

} value;

/* constant definitions */
typedef struct constant {
    char    *name;     /* name of the constant, if declared as a constant */
    pir_type type;     /* type of the constant */
    value    val;      /* value of the constant */

} constant;



/* The expression node is used as a wrapper to represent target nodes (like .param, .local
 * and registers), constant nodes (either named or anonymous), XXX identifiers?? XXX,
 * or key nodes, such as ["x";42].
 */
typedef struct expression {
    union __expression {
        struct target  *t;
        constant       *c;
        char           *id;
        struct key     *k;

    } expr;

    expr_type type;        /* selector for __expression */

    struct expression *next;

} expression;

typedef struct key {
    expression *expr;      /* value of this key */

    struct key *next;      /* in ["x";"y"], there's 2 key nodes; 1 for "x", 1 for "y", linked by "next" */

} key;


/* The target node represents a .local, .param or register that can receive a value,
 * hence the name "target". When receiving arguments, it's a parameter, when receiving
 * return values, it's a local variable (or register).
 */
typedef struct target {
    pir_type       type;           /* type of this target. */
    char          *name;           /* if this is a declared local */
    int            regno;          /* if this is a register */
    int            color;          /* for register allocation */
    target_flag    flags;          /* flags like :slurpy etc. */
    char          *named_flag_arg; /* if this is a named parameter, this is the alias */
    char          *lex_name;       /* if this is a lexical, this field contains the name */
    struct key    *key;            /* the key of this target, i.e. $P0[$P1], $P1 is key. */

    struct target *next;

} target;



void *panic(char *msg);



/* The argument node is used to represent arguments or return values.
 * the value field contains the actual value; furthermore it can have
 * flags, such as :flatten and :named; if :named is set, it can have
 * an alias, when the argument is passed (or returned) as a named
 * parameter (or return value).
 */
typedef struct argument {
    expression *value;
    int         flags;
    char       *alias;

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
    invoke_type type;
    target     *object;        /* invocant object, if any */
    target     *sub;           /* invoked sub */
    target     *retcc;         /* return continuation, if any */
    target     *results;       /* targets that will receive return values */
    argument   *arguments;     /* values passed into the sub, or return values */

} invocation;

/* the instruction node represents a single parrot instruction */
typedef struct instruction {
    char const  *opname;       /* name of the instruction, such as "print" and "set" */
    expression  *operands;     /* operands like "$I0" and "42" in "set $I0, 42" */

} instruction;


/* a statement can be either a parrot instruction or function call */
typedef enum statement_types {
    STAT_TYPE_INSTRUCTION,
    STAT_TYPE_INVOCATION

} statement_type;


typedef struct statement {
    char          *label;    /* label for this statement, if any */
    statement_type type;     /* union field selector for __statement */

    union __statement {
        instruction *ins;    /* this statement is an instruction ... */
        invocation  *inv;    /* ... or an invocation. */
    }
    instr;

    struct statement *next;  /* points to next statement */

} statement;


/* forward declaration of struct symbol */
struct symbol;

/* a sub */
typedef struct subroutine {
    key               *name_space;    /* this sub's namespace */
    char              *sub_name;      /* this sub's name */
    char              *outer_sub;     /* this sub's outer subroutine, if any */
    char              *lex_id;        /* this sub's lex_id, if any */
    char              *vtable_method; /* name of vtable method that this sub's overriding, if any */
    int                flags;         /* this sub's flags */
    char             **multi_types;

    target            *parameters;    /* parameters of this sub */
    statement         *statements;    /* statements of this sub */

    struct symbol     *symbols;       /* symbol table for this subroutine */
    struct pir_reg    *registers[4];  /* used PIR registers in this sub */

    struct subroutine *next;

} subroutine;


/* forward declaration */
struct lexer_state;

void set_namespace(struct lexer_state *lexer, key * const ns);

void set_sub_outer(struct lexer_state *lexer, char * const outersub);
void set_sub_vtable(struct lexer_state *lexer, char * const vtablename);
void set_sub_lexid(struct lexer_state *lexer, char * const lexid);

void new_subr(struct lexer_state *lexer, char * const subname);

void set_param_named(target *t, char *alias);
void add_instr(struct lexer_state *lexer, char *label, instruction *instr);

void set_arg_flag(argument *arg, arg_flag flag);

constant *new_named_const(pir_type type, char * const name, ...);
constant *new_const(pir_type type, ...);

expression *expr_from_const(constant *c);
expression *expr_from_target(target *t);
expression *expr_from_ident(char *name);
expression *expr_from_key(key * const k);

argument *new_argument(expression *expr);
argument *add_arg(argument *arg1, argument *arg2);

target *add_param(struct lexer_state *lexer, pir_type type, char * const name);
target *add_param_named(struct lexer_state *lexer, pir_type type, char *name, char *alias);
void set_alias(struct lexer_state *lexer, char *alias);
void set_curtarget(struct lexer_state *lexer, target *t);

target *add_target(struct lexer_state *lexer, target *t1, target *t);

target *new_target(pir_type type, char * const name);
target *reg(struct lexer_state *lexer, pir_type type, int regno);


invocation *invoke(struct lexer_state *lexer, invoke_type, ...);
void set_invocation_type(invocation *inv, invoke_type type);

target *target_from_string(char * const str);
target *target_from_ident(pir_type type, char * const id);
target *target_from_symbol(struct symbol * const sym);

key *new_key(expression * const expr);
key *add_key(key *keylist, expression * const newkey);

void set_pragma(int which_one, int value);
void load_library(struct lexer_state *lexer, char *library);
void set_hll(char *hll);
void set_hll_map(char *stdtype, char *hlltype);
void set_sub_flag(struct lexer_state *lexer, sub_flag flag);

void set_param_flag(target *t, target_flag flag);
void set_arg_named(argument *arg, char *alias);

void new_instr(struct lexer_state *lexer);
void set_label(struct lexer_state *lexer, char * const label);

void set_instr(struct lexer_state *lexer, char const * const opname);
void set_instrf(struct lexer_state *lexer, char const * const opname, char const * const format, ...);

void define_const(struct lexer_state *lexer, constant *var, int is_globalconst);

void set_invocation_args(invocation *inv, argument *args);
void set_invocation_results(invocation *inv, target * const results);

void set_lex_flag(target *t, char *lexname);
char const *get_inverse(char const * const instr);
void invert_instr(struct lexer_state *lexer);


void unshift_operand(struct lexer_state *lexer, expression *operand);
void push_operand(struct lexer_state *lexer, expression *operand);

struct symbol *add_local(struct symbol * const list, struct symbol * const local);
struct symbol *new_local(char *name, int unique);

int targets_equal(target const * const t1, target const * const t2);

void print_subs(struct lexer_state *lexer);

#endif /* PARROT_PIR_PIRCOMPUNIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

