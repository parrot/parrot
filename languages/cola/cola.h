/*
 * cola.h
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * The giant, hulking header file.
 */

#ifndef _COLA_H
#define _COLA_H

#define COLA_VERSION "0.0.11.1"

#define DEBUG 0

void abort(void);
void exit(int status);


enum ASTKIND {
    KIND_DECL,
    KIND_STATEMENT,
    KIND_BLOCK,
    KIND_EXPR,
    KIND_PARAM
};

enum ASTTYPE {
    ASTT_LITERAL,
    ASTT_IDENTIFIER,
    ASTT_NAMESPACE_DECL,
    ASTT_CLASS_DECL,
    ASTT_CONSTANT_DECL,
    ASTT_FIELD_DECL,
    ASTT_METHOD_DECL,
    ASTT_FIXED_PARAM,
    ASTT_PARAM_ARRAY,
    ASTT_ASSIGN,
    ASTT_OP,
    ASTT_LOGICAL,
    ASTT_INDEX,
    ASTT_IF,
    ASTT_WHILE,
    ASTT_FOR,
    ASTT_BREAK,
    ASTT_CONTINUE,
    ASTT_RETURN,
    ASTT_GOTO,
    ASTT_METHOD_CALL,
    ASTT_BOOLEAN,
    ASTT_COMPARISON,
    ASTT_CONDITIONAL_EXPR,
    ASTT_PREINC,
    ASTT_POSTINC,
    ASTT_NEW_OBJECT
};

enum TYPES {
    TYPE_SCALAR,
    TYPE_REFERENCE,
    TYPE_ARRAY,
    TYPE_METHOD,
    TYPE_CLASS  
};

#define MOD_PUBLIC    (1)
#define MOD_PRIVATE   (1<<1)
#define MOD_PROTECTED (1<<2)
#define MOD_STATIC    (1<<3)
#define MOD_VIRTUAL   (1<<4)



/* Identifiers, etc. */
typedef struct _SymbolTable SymbolTable;
typedef struct _AST AST;
typedef struct _Type Type;

typedef struct _Node {
    struct _Node    *next,
                    *tnext;
} Node;

/* Symbol structure */
typedef struct _Symbol {
    /* ->tnext is for manipulation of Symbols outside
     * Symbol tables, etc. such as temporary lists.
     * ->next is used by the symbol table methods.
     * NOTE: next and tnext must be the first 2 members of the struct
     */
    struct _Symbol  *next,
                    *tnext;
                    
    char            *name;
    int             scope;
    int             flags;
    /* Symbol.class is initially IDENTIFIER if it is not resolved to
     * a type, variable, function, etc. Upon resolution it will be
     * one of TYPE, LITERAL, VARIABLE, METHOD, NAMESPACE
     */
    int             kind;
    struct _Symbol  *typename;
    Type            *type;
    int             is_lval;
    struct _Symbol  *namespace; /* What namespace or class owns me */
    SymbolTable     *table;     /* If I'm a namespace/class, this is my symbol table */
    struct _Symbol  *literal;
    int             line;
} Symbol;

/* Node for Abstract Syntax Tree */
struct _AST {
    /* next and tnext must be the first 2 members of the struct */
    struct _AST     *next,
                    *tnext;
    struct _AST     *up,
                    *arg1,
                    *arg2;
    /* start_label is 1st statement in construct
     * end_label is _after_ last statement so it can
     * be used to jump out, break, etc. from loops, switches.
     */
    char            *start_label,
                    *end_label;
    enum ASTKIND    kind;       /* General node class (STATEMENT) */
    enum ASTTYPE    asttype;    /* Specific node type (IF|ASSIGN|...)*/
    int             op;         /* Operation */
    Type            *type;      /* Unresolved until type-check pass */
    Symbol          *typename;
    Symbol          *sym;
    /* Expression generic nodes */
    Symbol          *targ;
    Symbol          *vars;
    /* Conditional specific nodes
     * Reuse above nodes for if_then_else
     * arg1 = _then_ branch
     * arg2 = _else_ branch
     */
    union {
	/*
	struct _EXPR {
	    struct _AST *arg1;
	    struct _AST *arg2;
	} Expr;
	*/
        struct _CLASS {
            struct _AST *body;
        } Class;
        struct _CONDITIONAL {
            struct _AST *condition, *end;
        } Conditional;
        struct _METHOD {
            struct _Symbol *params;
            struct _AST *body;
        } Method;
        struct _LOOP {
            struct _AST *init;
            struct _AST *iteration;
            struct _AST *condition;
            struct _AST *body;
        } Loop;
    } Attr;
};

#define HASH_SIZE 109

struct _SymbolTable {
    long            count;
    int             scope;
    Symbol          *table[HASH_SIZE];
};

/* Array stuff */
typedef struct _Rank {
    Node    *next,
            *tnext;
    int     dim;    
} Rank;

struct _Type {
    Node            *next,
                    *tnext;
    unsigned long   flags;
    enum TYPES      kind;       /* class, array, pointer/reference */
    int             size;
/*
    int             typeid;
    int             parentid;
*/
    Symbol          *sym;       /* symbol representing name of type */
    Type            *type;      /* Element or referenced type */
};

typedef struct _Array {
    Node    *next,
            *tnext;
    Type    *type;              /* The type of element */
    Rank    *rank;
    int     dim;                /* Total dim, can be derived from evaluating rank list */
    int     **bounds;           /* N x 2 dimensional array of bounds where N = dimensions */        
} __Array;


/*
 * Symbol tables, scope stacks, for handling
 * classes, namespaces, etc.
 */

/* This will be some static method, Main from a
 * single class in the assembly, if it is executable.
 */
extern Symbol       *main_method;

/* The static, global symbol table */
extern Symbol       *global_namespace;
extern SymbolTable  *global_symbol_table;
/* The current working symbol table */
extern SymbolTable  *current_symbol_table;
/*
 * The stack of symbols representing the current
 * nested scope (namespaces, classes, etc.)
 * Namespaces and classes are represented by a Symbol
 * and each hold a SymbolTable which holds any nested
 * types and members for the particular object.
 */
extern Symbol       *namespace_stack;
/* The current working namespace or class.
 * current_namespace->table == current_symbol_table
 */
extern Symbol       *current_namespace;
extern int          scope;
/* Pointers to the builtin type entries in the symbol table */
extern Type *t_object,
            *t_void,
            *t_string,
            *t_bool,
            *t_sbyte,
            *t_byte,
            *t_char,
            *t_int32,
            *t_uint32,
            *t_int64,
            *t_uint64,
            *t_short,
            *t_ushort,
            *t_float,
            *t_double,
            *t_decimal;

void                assert(void * p);

void                push(Node ** list, Node * p);
void                tpush(Node ** list, Node * p);
void                tunshift(Node ** list, Node * p);
Node                *pop(Node ** list);
Node                *tpop(Node ** list);


Symbol              *new_symbol(const char * name);
Symbol              *new_identifier_symbol(const char * name);
Symbol              *new_literal_symbol(const char * name);
Symbol              *new_type_symbol(const char * name);
Symbol              *mk_namespace_symbol(Symbol *);
Symbol              *mk_class_symbol(Symbol *);
Symbol              *mk_method_symbol(Symbol *, const char *, const char *);
Symbol              *symbol_concat(Symbol *, Symbol *);
Symbol              *symbol_join3(Symbol *, Symbol *, Symbol *);
Symbol              *symbol_join4(Symbol *, Symbol *, Symbol *, Symbol *);
SymbolTable         *new_symbol_table();
void                push_sym(Symbol ** list, Symbol * p);
void                tpush_sym(Symbol ** list, Symbol * p);
void                tunshift_sym(Symbol ** list, Symbol * p);
Symbol              *pop_sym(Symbol ** list);
Symbol              *tpop_sym(Symbol ** list);
void                push_namespace(Symbol * ns);
Symbol              *pop_namespace();
void                init_symbol_tables();
void                init_builtin_types();
Symbol              *split(const char *, const char *);
unsigned int         hash_str(const char * str);
Symbol              *lookup_symbol(const char *);
Symbol              *lookup_symbol_in_tab(SymbolTable *, const char *);
Symbol              *lookup_symbol_scope(SymbolTable *, const char *, int);
Symbol              *lookup_namespace(SymbolTable * tab, const char * name);
Symbol              *lookup_class(SymbolTable * tab, const char * name);
Symbol              *store_symbol(SymbolTable *, Symbol *);
Symbol              *store_identifier(SymbolTable *, Symbol *);
Symbol              *store_method(SymbolTable *, const char * name, Type *);
int                 push_scope();
Symbol              *pop_scope();
void                discard_scope();
void                declare_local(Symbol * id);

/*
 * Type related utilities
 */

extern Type         **type_table;
extern int          type_table_size;

Type                *store_type(const char * name, int size);
Type                *lookup_type(const char * name);
Type                *lookup_type_symbol(Symbol * id);
const char          *type_name(Type *);
void                coerce_operands(Type ** t1, Type ** t2);
Type                *new_array(Symbol * typename, Rank * rank);
Rank                *new_rank(int dim);
Symbol              *array_signature(Type * t);

/* Type checking and semantic phase */
void                build_ast(AST *);
void                build_class_decl(AST *);
void                build_class_body(AST *);
void                build_method_decl(AST *);
void                build_field_decl(AST *);
void                build_statement_list(AST *);
void                build_expr_list(AST *);
void                build_expr(AST *);
void                build_if(AST *);
void                build_conditional(AST *);
void                build_method_call(AST *);
void                build_new_expr(AST *);
void                build_loop(AST *);
void                build_return(AST *);
void                resolve_identifier(Symbol **);


char                *str_dup(const char *);
char                *str_cat(const char *, const char *);
void                dump_namespace(Symbol * );
void                dump_symbol_table(SymbolTable * );
Symbol              *check_id_redecl(SymbolTable * table, const char * name);
Symbol              *check_id_decl(SymbolTable * table, const char * name);
void                unshift_ast(AST ** list, AST * p);
AST                 *new_ast(enum ASTKIND kind, int type, AST * left, AST * right);
AST                 *new_statement(int type, AST * left, AST * right);
AST                 *new_expr(int type, AST * left, AST * right);
AST                 *new_op_expr(AST * left, int op, AST * right);
AST                 *new_logical_expr(AST * left, int op, AST * right);
AST                 *new_if(AST * condition, AST *, AST *);
AST                 *new_conditional(AST * condition, AST *, AST *);
AST                 *new_while(AST * condition, AST * block);
AST                 *new_for(AST * init, AST * condition, AST * increment, AST * block);
extern int          primary_block;
extern AST          *primary_block_stack[];
void                push_primary_block(AST *p);
AST                 *pop_primary_block();
AST                 *get_cur_primary_block();
AST                 *cur_method;

/* Code generation phase */
void                gen_ast(AST * ast);
void                gen_namespace_decl(AST *);
void                gen_class_decl(AST *);
void                gen_class_body(AST * ast);
void                gen_field_decl(AST * ast);
void                gen_constant_decl(AST * ast);
void                gen_method_decl(AST * ast);
void                gen_block(AST * ast);
void                gen_statement(AST * ast);
void                gen_var_decl(AST * ast);
void                gen_assign(AST * ast);
void                gen_expr(AST * ast, Symbol * lval, Type * t);
void                gen_method_call(AST *);
void                gen_if(AST *);
void                gen_while(AST *);
void                gen_for(AST *);
void                gen_boolean(AST *, const char * true_label, const char * false_label,
                                    int invert);

void                emit_op_expr(Symbol * res, Symbol * arg1, char * op, Symbol * arg2);
void                emit_unary_expr(Symbol * res, Symbol * arg1, char * op);

char                *new_itemp();
char                *new_ntemp();
char                *new_stemp();
char                *new_ptemp();
Symbol              *new_temp(Type * t);

void                reset_temps();
char                *get_label();
char                *make_label();
char                *op_name(int);
int                 op_inverse(int);

#define NAME(x) (x->literal == NULL ? x->name : x->literal->name)
#define IS_LVAL(x)  (x->is_lval)
#define IS_RVAL(x)  (!x->is_lval)
#define SWITCH_OR_LOOP() (primary_block > 0 ? 1 : 0)
#define eval_expr(x) ((x->asttype == ASTT_LITERAL || x->asttype == ASTT_IDENTIFIER) ? (x->targ = x->sym, 1) : 0)

extern long         line;

#endif
