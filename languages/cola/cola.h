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

#define COLA_VERSION "0.0.2"


void abort(void);
void exit(int status);

/* Identifiers, etc. */
typedef struct _SymbolTable SymbolTable;
typedef struct _AST AST;

/* Symbol structure */

typedef struct _Symbol {
	/* ->tnext is for manipulation of Symbols outside
	 * Symbol tables, etc. such as temporary lists.
	 * ->next is used by the symbol table methods.
	 * next and tnext must be the first 2 members of the struct
	 */
	struct _Symbol	*next,
					*tnext;
	char *		name;
	int			scope;
	unsigned int flags;
	/* Symbol.class is initially IDENTIFIER if it is not resolved to
	 * a type, variable, function, etc. Upon resolution it will be
	 * one of TYPE, LITERAL, VARIABLE, METHOD, NAMESPACE
	 */
	int			class;
	struct _Symbol	*type;
	int			size;
	AST *		init_expr;
	int			is_lval;
	SymbolTable	*table;   /* For functions/procs */
	struct _Symbol *members; /* Classes/Namespaces */
	struct _Symbol *literal;
	int 		line;
} Symbol;

/* Node for Abstract Syntax Tree */
struct _AST {
	/* next and tnext must be the first 2 members of the struct */
	struct _AST		*next,
					*tnext;

	struct _AST *up, *arg1, *arg2;
	/* start_label is 1st statement in construct
	 * end_label is _after_ last statement so it can
	 * be used to jump out, break, etc. from loops, switches.
	 */
	char		*start_label, *end_label;
	int			class;		/* General node class (STATEMENT) */
	int			asttype;	/* Specific node type (IF|ASSIGN|...)*/
	int			op;			/* Operation */
	Symbol		*sym;
	/* Expression generic nodes */
	Symbol		*targ;
	Symbol		*locals;
	/* Conditional specific nodes
	 * Reuse above nodes for if_then_else
	 * arg1 = _then_ branch
	 * arg2 = _else_ branch
	 */
	union {
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
	long count;
	int scope;
	Symbol * table[ HASH_SIZE ];
};

typedef struct _Type {
	int kind;			/* scalar, array, class, pointer/reference */
    int typeid;
    int parentid;
    Symbol * sym;   /* Pointer to symbol table representing name of type */
} Type;


/*
 * Symbol tables, scope stacks, for handling
 * classes, namespaces, etc.
 */

/* The static, global symbol table */
extern Symbol * global_namespace;
extern SymbolTable * global_symbol_table;
/* The current working symbol table */
extern SymbolTable * current_symbol_table;
/*
 * The stack of symbols representing the current
 * nested scope (namespaces, classes, etc.)
 * Namespaces and classes are represented by a Symbol
 * and each hold a SymbolTable which holds any nested
 * types and members for the particular object.
 */
extern Symbol * namespace_stack;
/* The current working namespace or class.
 * current_namespace->table == current_symbol_table
 */
extern Symbol * current_namespace;
extern int scope;
/* Pointers to the builtin type entries in the symbol table */
extern Symbol * t_void, * t_string, * t_int, * t_float;

void        assert(void * p);

Symbol *	new_symbol(int class, const char * name);
void		push_sym(Symbol ** list, Symbol * p);
void		tpush_sym(Symbol ** list, Symbol * p);
void		tunshift_sym(Symbol ** list, Symbol * p);
Symbol *	pop_sym(Symbol ** list);
Symbol *	tpop_sym(Symbol ** list);
void		push_namespace(Symbol * ns);
Symbol *	pop_namespace();
void		init_symbol_tables();
void        init_builtin_types();
Symbol *	new_namespace(Symbol *);
Symbol *	new_class(Symbol *);
SymbolTable *	new_symbol_table();
Symbol *	lookup_symbol(SymbolTable *, const char *);
Symbol *	lookup_symbol_scope(SymbolTable *, const char *, int);
void		store_symbol(SymbolTable *, Symbol *);
Symbol *	store_identifier(SymbolTable *, const char * name, int class, Symbol * type);
Symbol *	store_type(const char * name, int size);
Symbol *	lookup_type(const char * name);
const char *	type_name(Symbol *);
int		push_scope();
Symbol *	pop_scope(SymbolTable *);
void		coerce_operands(Symbol ** t1, Symbol ** t2);

/*
 * Type related utilities
 */
extern Type **  type_table;
extern int      type_table_size;
extern Type *   new_type(int kind, const char * name, const char * parent_name);


char *	str_dup( const char * );
void	dump_namespace(Symbol * );
void	dump_symbol_table(SymbolTable * );
Symbol *check_id_redecl(SymbolTable * table, const char * name);
Symbol *check_id_decl(SymbolTable * table, const char * name);
void	unshift_ast(AST ** list, AST * p);
AST *	new_ast(int class, int type, AST * left, AST * right);
AST *	new_statement(int type, AST * left, AST * right);
AST *	new_expression(int type, AST * left, AST * right);
AST *	new_if(AST * condition, AST * then_part, AST * else_part);
AST *	new_while(AST * condition, AST * block);
AST *	new_for(AST * init, AST * condition, AST * increment, AST * block);
extern int primary_block;
extern AST * primary_block_stack[];
void push_primary_block(AST *p);
AST * pop_primary_block();
AST * get_cur_primary_block();
AST * cur_method;
#define SWITCH_OR_LOOP()	(primary_block > 0 ? 1 : 0)


void gen_bootstrap();
void gen_ast(AST * ast);
void gen_class_decl(AST *);
void gen_class_body(AST * ast);
void gen_local_decl(AST * ast);
void gen_constant_decl(AST * ast);
void gen_method_decl(AST * ast);
void gen_block(AST * ast);
void gen_statement(AST * ast);
void gen_assign(AST * ast);
void gen_expr(AST * ast, Symbol * lval);
void gen_unary_expr(AST *);
void gen_call(AST *);
void gen_if(AST *);
void gen_while(AST *);
void gen_for(AST *);
void gen_boolean(AST *);
void gen_comparison(AST *);

void emit_op_expr(Symbol * res, Symbol * arg1, char * op, Symbol * arg2);
void emit_unary_expr(Symbol * res, Symbol * arg1, char * op);

char * new_rval();
Symbol * make_rval(Symbol * type);

void reset_temps();
char * get_label();
char * make_label();
char * op_name(int);
int op_inverse(int);

#define EVAL_SYM(x)	(x->literal == NULL ? x->name : x->literal->name)
#define IS_LVAL(x) (x->is_lval)
#define IS_RVAL(x) (!x->is_lval)
extern long line;

enum ASTCLASS {
    AST_STATEMENT,
    AST_BLOCK,
    AST_EXPRESSION,
    AST_PARAM
};

enum ASTTYPE {
	ASTT_CONSTANT_DECL,
	ASTT_FIELD_DECL,
	ASTT_METHOD_DECL,
	ASTT_CLASS_DECL,
	ASTT_LITERAL,
	ASTT_IDENTIFIER,
	ASTT_FIXED_PARAM,
	ASTT_PARAM_ARRAY,
	ASTT_ASSIGN,
	ASTT_ADD,
	ASTT_MUL,
	ASTT_INDEX,
	ASTT_IF,
	ASTT_WHILE,
	ASTT_FOR,
	ASTT_BREAK,
	ASTT_CONTINUE,
	ASTT_RETURN,
	ASTT_GOTO,
	ASTT_CALL,
	ASTT_BOOLEAN,
	ASTT_COMPARISON,
	ASTT_PREINC,
	ASTT_POSTINC,
	ASTT_NEW_OBJECT
};




#endif
