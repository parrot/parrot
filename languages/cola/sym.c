/*
 * sym.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Symbol and Abstract Syntax Tree management utils.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"

Symbol          *main_method;
Symbol          *global_namespace;
SymbolTable     *global_symbol_table;
Symbol          *current_namespace;
SymbolTable     *current_symbol_table;
Symbol          *namespace_stack;
SymbolTable     *const_str;

/* For saving scope between namespaces.
 * each push_namespace should start with scope 0, and
 * pop_namespace should restore scope of last namespace.
 */
int		scope_stack[1024];
int             last_scope = 0;
int             scope = 0;
int             method_block = 0;
int             primary_block = 0;
AST             *primary_block_stack[256];

 
/* Routines for managing symbols, attributes and AST tree */

void assert(void * p) {
    if(p == NULL) {
        fprintf(stderr, "NULL pointer assertion.\n");
        abort();
    }
}

unsigned int hash_str(const char * str) {
    unsigned long key = 0;
    const char * s;
    for(s=str; *s; s++)
        key = key * 65599 + *s;
    return key;    
}

void init_symbol_tables() {
    /* The global namespace with no name */
    global_namespace = mk_namespace_symbol(new_symbol("__GLOBAL__"));
    current_namespace = global_namespace;
    current_namespace->table = global_symbol_table = new_symbol_table();
    current_symbol_table = global_symbol_table;
    push_namespace(global_namespace);
    const_str = new_symbol_table();
}

SymbolTable * new_symbol_table() {
    SymbolTable * tab = malloc(sizeof(SymbolTable));
    assert(tab);
    memset(tab, sizeof(SymbolTable), 0);
    tab->scope = 1;
    return tab;
}

Symbol * new_symbol(const char * name) {
    Symbol * s = malloc(sizeof(Symbol));
    assert(s);
    s->kind = 0;
    s->name = str_dup(name);
    s->scope = scope;
    s->typename = NULL;
    s->type = NULL;
    s->is_lval = 1;
#if 0
    s->init_expr = NULL;
#endif
    s->table = NULL;
    s->literal = s->next = s->tnext = NULL;
    return s;
}

Symbol * new_identifier_symbol(const char * name) {
    Symbol * s = new_symbol(name);
    s->kind = IDENTIFIER;
    return s;
}

Symbol * new_literal_symbol(const char * name) {
    Symbol * s = new_symbol(name);
    s->kind = LITERAL;
    return s;
}

Symbol * new_type_symbol(const char * name) {
    Symbol * s = new_symbol(name);
    s->kind = TYPE;
    return s;
}

Symbol * mk_namespace_symbol(Symbol * identifier) {
    Symbol * s = identifier;    
    s->kind = NAMESPACE;
    s->table = new_symbol_table();
    return s;
}

Symbol * mk_class_symbol(Symbol * identifier) {
    Type * t = store_type(identifier->name, 0);
#if 0
    printf("#new_class(%s)\n", identifier->name);
#endif
    t->kind = CLASS;
    t->sym->table = new_symbol_table();
    return t->sym;
}

Symbol * mk_method_symbol(Symbol * rettype, const char * name, const char * sig) {
    Symbol * s = new_symbol(name);
    s->kind = METHOD;
    return s;
}

Symbol * symbol_concat(Symbol * s1, Symbol * s2) {
    int len = strlen(s1->name) + strlen(s2->name) + 1;
    Symbol * s = new_symbol("");
    s->name = malloc(len);
    strcpy(s->name, s1->name);
    strcat(s->name, s2->name);
    return s;
}

Symbol * symbol_join3(Symbol * s1, Symbol * s2, Symbol * s3) {
    int len = strlen(s1->name) + strlen(s2->name) + strlen(s3->name) + 1;
    Symbol * s = new_symbol("");
    s->kind = s1->kind;
    s->name = malloc(len);
    strcpy(s->name, s1->name);
    strcat(s->name, s2->name);
    strcat(s->name, s3->name);
    return s;
}

Symbol * symbol_join4(Symbol * s1, Symbol * s2, Symbol * s3, Symbol * s4) {
    int len = strlen(s1->name) + strlen(s2->name) + strlen(s3->name) +
                strlen(s4->name) + 1;
    Symbol * s = new_symbol("");
    s->kind = s1->kind;
    s->name = malloc(len);
    strcpy(s->name, s1->name);
    strcat(s->name, s2->name);
    strcat(s->name, s3->name);
    strcat(s->name, s4->name);
    return s;
}

AST * new_ast(enum ASTKIND kind, int asttype, AST * arg1, AST * arg2) {
    AST * ast = malloc(sizeof(AST));
    assert(ast);
    ast->start_label = ast->end_label = NULL;
    ast->kind = kind;
    ast->asttype = asttype;
    ast->type = NULL;
    ast->typename = NULL;
    ast->op = 0;
    ast->arg1 = arg1;
    ast->arg2 = arg2;
    ast->sym = NULL;
    ast->targ = NULL;
    ast->vars = NULL;
    ast->up = NULL;
    ast->next = NULL;
    memset(&ast->Attr, 0, sizeof(ast->Attr));
    if(arg1)
        arg1->up = ast;
    if(arg2)
        arg2->up = ast;
    return ast;
}

void push(Node ** list, Node * p) {
    p->next = *list;
    *list = p;
}

void tpush(Node ** list, Node * p) {
    p->tnext = *list;
    *list = p;
}

/* "push" onto opposite end of temp stack */
void tunshift(Node ** list, Node * p) {
    Node * l = *list;
    if(l && l == p) {
        printf("Oops: Shifting node list onto itself!\n");
        abort();
    }
    if(l != NULL) {
        while(l->tnext)
            l = l->tnext;
        l->tnext = p;
    }
    else *list = p;
}

/* Return the top symbol on the stack. */
Node * pop(Node ** list) {
    Node * top;
    top = *list;
    if(*list)
        *list = (*list)->next;
    return top;
}

/* Return the top symbol on the tstack. */
Node * tpop(Node ** list) {
    Node * top;
    top = *list;
    if(*list)
        *list = (*list)->tnext;
    return top;
}



/* Easy fixme, rewrite below to call above generic Node versions */

void push_sym(Symbol ** list, Symbol * p) {
    p->next = *list;
    *list = p;
}

void tpush_sym(Symbol ** list, Symbol * p) {
    p->tnext = *list;
    *list = p;
}

/* "push" onto opposite end of temp stack */
void tunshift_sym(Symbol ** list, Symbol * p) {
    Symbol * l = *list;
    if(l && l == p) {
        printf("Oops: Shifting symbol list onto itself!\n");
        abort();
    }
    if(l != NULL) {
        while(l->tnext) {
            l = l->tnext;
        }
        l->tnext = p;
    }
    else {
        *list = p;
    }
}

/* Return the top symbol on the stack. */
Symbol * pop_sym(Symbol ** list) {
    Symbol * top;
    top = *list;
    if(*list)
        *list = (*list)->next;
    return top;
}

/* Return the top symbol on the tstack. */
Symbol * tpop_sym(Symbol ** list) {
    Symbol * top;
    top = *list;
    if(*list)
        *list = (*list)->tnext;
    return top;
}

/* Push namespace onto the stack and set active namespace to top of stack.
 */
void push_namespace(Symbol * ns) {
#if 1
    printf("#push_namespace(%s)\n", ns->name);
#endif
    scope_stack[last_scope++] = scope;
    scope = 0;
    current_namespace = ns;
    current_symbol_table = current_namespace->table;
    tpush_sym(&namespace_stack, ns);
}

/* Pop namespace off the stack and set active namespace to top of stack.
 * Leaves namespace symbol in symbol table.
 */
Symbol * pop_namespace() {
    Symbol * ns;
    ns = tpop_sym(&namespace_stack);
    scope = scope_stack[--last_scope];
    if(last_scope < 0) {
    	fprintf(stderr, "Internal error: scope unbalanced, popped scope 0\n");
	abort();
    }
    current_namespace = namespace_stack;
    current_symbol_table = current_namespace->table;
    return ns;    
}

/* "push" onto opposite end of stack */
void unshift_ast(AST ** list, AST * p) {
    AST * l = *list;
    if(l && l == p) {
        printf("Oops: Shifting ast list onto itself!\n");
        abort();
    }
    if(l != NULL) {
        while(l->next)
            l = l->next;
        l->next = p;
    }
    else *list = p;
}

AST * new_statement(int stmnttype, AST * left, AST * right) {
    AST * p = new_ast(KIND_STATEMENT, stmnttype, left, right);
    return p;    
}

AST * new_expr(int exprtype, AST * left, AST * right) {
    AST * p = new_ast(KIND_EXPR, exprtype, left, right);
    return p;    
}

/* Specific type of expression (A b C) where b is an operator */
AST * new_op_expr(AST * left, int op, AST * right) {
    AST * p = new_ast(KIND_EXPR, ASTT_OP, left, right);
    p->op = op;
    return p;    
}

AST * new_logical_expr(AST * left, int op, AST * right) {
    AST * p = new_ast(KIND_EXPR, ASTT_LOGICAL, left, right);
    p->op = op;
    return p;    
}

AST * new_if(AST * condition, AST * then_part, AST * else_part) {
    AST * p = new_statement(ASTT_IF, then_part, else_part);
    p->Attr.Conditional.condition = condition;
    return p;     
}

/*
 * Ternary conditionals
 */
AST * new_conditional(AST * condition, AST * then_part, AST * else_part) {
    AST * p = new_ast(KIND_EXPR, ASTT_CONDITIONAL_EXPR, then_part, else_part);
    p->Attr.Conditional.condition = condition;
    return p;     
}

AST * new_while(AST * condition, AST * block) {
    AST * p = new_statement(ASTT_WHILE, NULL, NULL);
    p->Attr.Loop.condition = condition;
    p->Attr.Loop.body = block;
    return p;     
}

AST * new_for(AST * init, AST * condition, AST * iteration, AST * block) {
    AST * p = new_statement(ASTT_FOR, NULL, NULL);
    p->Attr.Loop.init = init;
    p->Attr.Loop.condition = condition;
    p->Attr.Loop.iteration = iteration;
    p->Attr.Loop.body = block;
    return p;     
}

/*
 *  Only using first char of pattern for now.
 */
Symbol * split(const char * pattern, const char * s) {
    char c = pattern[0];
    Symbol * l = NULL;
    const char * p;
    int len;
    if(!strstr(s, pattern))
	return new_symbol(s);
    p = s;
AGAIN:
    for(len = 0; p[len] && p[len] != c; len++)
        ;
    if(len) {
        Symbol * n = new_symbol("");
	n->name = malloc(len+1);
	strncpy(n->name, p, len);
	n->name[len] = '\0';
        tunshift_sym(&l, n);
    }
    if(!len || !p[len])
        return l;
    else {
        len++;
	p += len;
	goto AGAIN;
    }
}

/*
 * Return first occurence of symbol in surrounding scopes.
 */
Symbol * lookup_symbol(const char * name) {
    Symbol * ns = current_namespace;
    Symbol * list = split(".", name);
    Symbol * s;
#if DEBUG
    fprintf(stderr, "lookup_symbol: %s split to (%s,...)\n", name, list->name); 
#endif
    for(ns = current_namespace; ns; ) {
#if DEBUG
        fprintf(stderr, "lookup_symbol: searching namespace[%s] for [%s]\n", ns->name, list->name);
#endif
        if((s = lookup_symbol_in_tab(ns->table, list->name))) {
#if DEBUG
            fprintf(stderr, "lookup_symbol: found [%s] in namespace[%s]\n", list->name, ns->name);
#endif
	    if(s->kind == IDENTIFIER) {
                ns = s->type->sym;
	    }
	    else {
	        ns = s;
	    }
	    list = list->tnext;
            if(!list || !s)
	        return s;
	}
	else {
            ns = ns->tnext;
	}
    }
    
    return NULL;
}

Symbol * lookup_symbol_in_tab(SymbolTable * tab, const char * name) {
    Symbol * sym_ptr;
    unsigned int index = hash_str(name) % HASH_SIZE;
    if(!tab) {
        fprintf(stderr, "Internal error: NULL symbol table\n");
        fprintf(stderr, "while resolving [%s]\n", name);
        abort();
    }
    for(sym_ptr = tab->table[ index ]; sym_ptr; sym_ptr = sym_ptr->next)    {
        if(!strcmp(name, sym_ptr->name))
            return sym_ptr;
    }

    return NULL;
}

Symbol * lookup_namespace(SymbolTable * tab, const char * name) {
    Symbol * sym_ptr;
    unsigned int index = hash_str(name) % HASH_SIZE;
    for(sym_ptr = tab->table[ index ]; sym_ptr; sym_ptr = sym_ptr->next)    {
        if(sym_ptr->kind == NAMESPACE && !strcmp(name, sym_ptr->name))
            return sym_ptr;
    }

    return NULL;
}

Symbol * lookup_class(SymbolTable * tab, const char * name) {
    Symbol * sym_ptr;
    unsigned int index = hash_str(name) % HASH_SIZE;
    for(sym_ptr = tab->table[ index ]; sym_ptr; sym_ptr = sym_ptr->next)    {
        if(sym_ptr->kind == CLASS && !strcmp(name, sym_ptr->name))
            return sym_ptr;
    }

    return NULL;
}

Symbol * lookup_symbol_scope(SymbolTable * tab, const char * name, int scope_level) {
    Symbol * sym_ptr;
    unsigned int index = hash_str(name) % HASH_SIZE;
    for(sym_ptr = tab->table[ index ]; sym_ptr; sym_ptr = sym_ptr->next) {
        if(sym_ptr->scope == scope_level
            && !strcmp(name, sym_ptr->name))
            return sym_ptr;
    }

    return 0;
}

Symbol * store_symbol(SymbolTable * tab, Symbol * sym) {
    unsigned int index = hash_str(sym->name) % HASH_SIZE;
#if 0
    fprintf(stderr, "#store_symbol(%s)\n", sym->name);
    if(sym->table && sym->table == tab) {
        fprintf(stderr, "Internal error, namespace->symbol table loop.\n");
        fprintf(stderr, "Symbol [%s] contains loopback namespace.\n", sym->name);
        abort();
    } else if(sym == global_namespace) {
        fprintf(stderr, "Internal error, can't store global namespace.\n");
        abort();
    }
#endif
    sym->scope = scope;
    sym->next = tab->table[index];
    sym->namespace = current_namespace;
    tab->table[index] = sym;
#ifdef DEBUG
    fprintf(stderr, "storing[%s] scope %d\n", sym->name, scope);
#endif
    return sym;
}

/*
Symbol * store_identifier(SymbolTable * tab, const char * name) {
    Symbol * s;
    s = new_symbol(name);
    s->kind = IDENTIFIER;
    s->type = lookup_type_symbol(s->typename);
    s->scope = scope;
    store_symbol(tab, s);
    return s;
}
*/

Symbol * store_method(SymbolTable * tab, const char * name, Type * type) {
    Symbol * s;
    s = new_symbol(name);
    s->kind = METHOD;
    s->type = type;
    s->typename = type->sym;
    s->scope = scope;
    store_symbol(tab, s);
    return s;
}

/*
 * Method locals
 */
void declare_local(Symbol * s) {
    fprintf(stderr, "declare_local[%s]\n", s->name);
    store_symbol(current_symbol_table, s);
    if(s->typename) {
        s->type = lookup_type_symbol(s->typename);
        if(!s->type) {
            fprintf(stderr, "declare_local: NULL type for ident [%s] typename [%s]\n",
                s->name, s->typename->name);
            abort();
        }
    }
    else {
        fprintf(stderr, "declare_local: NULL typename for ident [%s]\n",
                s->name);
        abort();
    }
}

/*
 * Class fields
 */
void declare_field(Symbol * s) {
    fprintf(stderr, "declare_field[%s]\n", s->name);
    if(!current_namespace->type || current_namespace->type->kind != CLASS) {
        fprintf(stderr, "Internal Error: field declarations only valid for classes.\n");
        fprintf(stderr, "Current namespace is [%s]\n", current_namespace->name);
        abort();
    }
    store_symbol(current_symbol_table, s);
    if(s->typename) {
        s->type = lookup_type_symbol(s->typename);
        if(!s->type) {
            fprintf(stderr, "declare_local: NULL type for ident [%s] typename [%s]\n",
                s->name, s->typename->name);
            abort();
        }
    }
    else {
        fprintf(stderr, "declare_local: NULL typename for ident [%s]\n",
                s->name);
        abort();
    }
}

void dump_namespace(Symbol * ns) {
    if(ns->kind == CLASS) {
        printf("#<class %s>\n", ns->name);
        if(ns->table)
            dump_symbol_table(ns->table);
        printf("#</class>\n");    
    } else if(ns->kind == NAMESPACE) {
        printf("#<namespace %s>\n", ns->name);
        dump_symbol_table(ns->table);
        printf("#</namespace>\n");    
    }
}

void dump_symbol_table(SymbolTable * tab) {
    Symbol * sym;
    int i;
    printf("#  <symbol table>\n");
    for(i = 0; i < HASH_SIZE; i++) {
        for(sym = tab->table[i]; sym; sym = sym->next) {
            switch(sym->kind) {
                case CLASS:
                case NAMESPACE:
                            if(sym->table) {
                                if(sym->table == tab) {
                                    printf("Internal error, namespace->symbol table loop.\n");
                                    printf("Symbol [%s] contains loopback namespace.\n", sym->name);
                                    abort();
                                }
                                dump_namespace(sym);
                            }
                    break;
                case METHOD:
                            printf("#\tmethod:  \"%s\"\n", sym->name);
                    break;
                case IDENTIFIER:
                            printf("#\tid:      \"%s\"\n", sym->name);
                    break;
                case LITERAL:
                            printf("#\tliteral: \"%s\"\n", sym->name);
                    break;
                case TYPE:  printf("#\ttype:    \"%s\"\n", sym->name);
                            if(sym->table) {
                                if(sym->table == tab) {
                                    printf("Internal error, namespace->symbol table loop.\n");
                                    printf("Symbol [%s] contains loopback namespace.\n", sym->name);
                                    abort();
                                }
                                dump_namespace(sym);
                            }
                    break;
                default:    printf("#\tunknown:   \"%s\"\n", sym->name);
                    break;
            }
        }
    }
    printf("#  </symbol table>\n");
}

Symbol * check_id_redecl(SymbolTable * table, const char * name) {
    Symbol * t;
    if((t = lookup_symbol_scope(table, name, scope)) != NULL) {
        printf("error (line %ld): identifier %s previously declared in this scope, line %d.\n", line, name, t->line);
        abort();
        exit(0);
    }
    return t;
}

Symbol * check_id_decl(SymbolTable * table, const char * name) {
    Symbol * t;
    if((t = lookup_symbol_in_tab(table, name)) == NULL)
        return NULL;
    return t;
}

int push_scope() {
    scope++;
    return scope;    
}

/*
 * Pop current scope level and return a list of
 * symbols if symbol table is passed.
 */
Symbol * pop_scope() {
    int i;
    SymbolTable * tab = current_symbol_table;
    Symbol * p = NULL;
    for(i = 0; i < HASH_SIZE; i++) {
        while(tab->table[i] && tab->table[i]->scope == scope) {
            Symbol * t;
#if DEBUG
            printf("popping symbol %s: level %d\n", tab->table[i]->name, scope);
#endif
            t = tab->table[i];
            tab->table[i] = tab->table[i]->next;
            t->tnext = p;    
            t->next = NULL;
            p = t;
        }
    }

    if(scope > 0)
        scope--;
    else {
        fprintf(stderr, "Internal error: can't pop scope 0.\n");
        abort();
    }

    return p;
}

/*
 * Same as pop_scope except no list is built and returned.
 * This is for cases where a list already existed, and each
 * node was inserted into the symbol table, and we want to
 * preserve that external list, so we can't scribble on the
 * ->tnext pointer as it may reorder the list or invalidate it.
 */
void discard_scope() {
    int i;
    SymbolTable * tab = current_symbol_table;
    for(i = 0; i < HASH_SIZE; i++) {
        while(tab->table[i] && tab->table[i]->scope == scope) {
            Symbol * t;
#ifdef DEBUG
            printf("discarding symbol %s: level %d\n", tab->table[i]->name, scope);
#endif
            t = tab->table[i];
            tab->table[i] = tab->table[i]->next;
            t->next = NULL;
        }
    }

    if(scope > 0)
        scope--;
    else {
        fprintf(stderr, "Internal error: can't discard scope 0.\n");
        abort();
    }
}


/* Don't laugh, this little array based stack is so I don't
 * have to add a 3rd ->next pointer to the AST struct.
 * It also means my design is wrong, will fix after adding
 * brain expansion pack.
 */
void push_primary_block(AST * p) {
    primary_block_stack[primary_block++] = p;    
}

AST * pop_primary_block() {
    if(primary_block > 0)
        return primary_block_stack[--primary_block];    
    return NULL;
}

AST * get_cur_primary_block() {
    if(primary_block > 0)
        return primary_block_stack[primary_block-1];    
    return NULL;
}

char * str_dup(const char * old) {
    char * copy = (char *)malloc(strlen(old) + 1);
    strcpy(copy, old);
    return copy;
}

char * str_cat(const char * s1, const char * s2) {
    int len = strlen(s1) + strlen(s2) + 1;
    char * s3 = malloc(len);
    strcpy(s3, s1);
    strcat(s3, s2);
    return s3;
}


