/*
 * sym.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Symbol and Abstract Syntax Tree management utils.
 */

#include <malloc.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"

Symbol *        global_namespace;
SymbolTable *    global_symbol_table;
Symbol *        current_namespace;
SymbolTable *    current_symbol_table;
Symbol *        namespace_stack;
SymbolTable *    const_str;

int scope = 0;
int method_block = 0;
int primary_block = 0;
AST * primary_block_stack[256];

 
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
    global_namespace = new_symbol(NAMESPACE, "");
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

Symbol * new_symbol(int kind, const char * name) {
    Symbol * ret = malloc(sizeof(Symbol));
    assert(ret);
    ret->kind = kind;
    ret->name = str_dup(name);
    ret->scope = scope;
    ret->type = NULL;
    ret->is_lval = 1;
    ret->init_expr = NULL;
    ret->table = NULL;
    ret->literal = ret->next = ret->tnext = NULL;
    return ret;
}

Symbol * new_namespace(Symbol * identifier) {
    Symbol * ns = identifier;    
    ns->kind = NAMESPACE;
    ns->table = new_symbol_table();
    return ns;
}

Symbol * new_class(Symbol * identifier) {
    Symbol *t = store_type(identifier->name, 0);
    printf("#new_class(%s)\n", identifier->name);
    t->kind = CLASS;
    t->table = new_symbol_table();
    return t;
}

Symbol * new_method(Symbol * rettype, const char * name, const char * sig) {
    Symbol * ret = new_symbol(METHOD, name);
    return ret;
}

AST * new_ast(enum ASTKIND kind, int asttype, AST * arg1, AST * arg2) {
    AST * ast = malloc(sizeof(AST));
    assert(ast);
    ast->start_label = ast->end_label = NULL;
    ast->kind = kind;
    ast->asttype = asttype;
    ast->op = 0;
    ast->arg1 = arg1;
    ast->arg2 = arg2;
    ast->sym = NULL;
    ast->targ = NULL;
    ast->locals = NULL;
    ast->up = NULL;
    ast->next = NULL;
    memset(&ast->Attr, 0, sizeof(ast->Attr));
    if(arg1)
        arg1->up = ast;
    if(arg2)
        arg2->up = ast;
    return ast;
}

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
        while(l->tnext)
            l = l->tnext;
        l->tnext = p;
    }
    else *list = p;
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

AST * new_expression(int exprtype, AST * left, AST * right) {
    AST * p = new_ast(KIND_EXPRESSION, exprtype, left, right);
    return p;    
}

/* Specific type of expression (A b C) where b is an operator */
AST * new_op_expression(AST * left, int op, AST * right) {
    AST * p = new_ast(KIND_EXPRESSION, ASTT_OP, left, right);
    p->op = op;
    return p;    
}

AST * new_logical_expression(AST * left, int op, AST * right) {
    AST * p = new_ast(KIND_EXPRESSION, ASTT_LOGICAL, left, right);
    p->op = op;
    return p;    
}

AST * new_if(AST * condition, AST * then_part, AST * else_part) {
    AST * p = new_statement(ASTT_IF, then_part, else_part);
    p->Attr.Conditional.condition = condition;
    return p;     
}

AST * new_while(AST * condition, AST * block) {
    AST * p = new_statement(ASTT_WHILE, block, NULL);
    p->Attr.Loop.condition = condition;
    return p;     
}

AST * new_for(AST * init, AST * condition, AST * iteration, AST * block) {
    AST * p = new_statement(ASTT_FOR, block, NULL);
    p->Attr.Loop.init = init;
    p->Attr.Loop.condition = condition;
    p->Attr.Loop.iteration = iteration;
    return p;     
}


/*
 * Return first occurence of symbol in surrounding scopes.
 */
Symbol * lookup_symbol(SymbolTable * tab, const char * name) {
    Symbol * sym_ptr;
    unsigned int index = hash_str(name) % HASH_SIZE;
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

void store_symbol(SymbolTable * tab, Symbol * sym) {
    unsigned int index = hash_str(sym->name) % HASH_SIZE;
#if 1
    printf("#store_symbol(%s)\n", sym->name);
    if(sym->table && sym->table == tab) {
        printf("Internal error, namespace->symbol table loop.\n");
        printf("Symbol [%s] contains loopback namespace.\n", sym->name);
        abort();
    } else if(sym == global_namespace) {
        printf("Internal error, can't store global namespace.\n");
        abort();
    }
#endif
    sym->scope = scope;
    sym->next = tab->table[ index ];
    tab->table[ index ] = sym;
#ifdef DEBUG
    printf("storing[%s] scope %d\n", sym->name, scope);
#endif
}

Symbol * store_identifier(SymbolTable * tab, const char * name, int kind, Symbol * type) {
    Symbol * s;
    s = new_symbol(kind, name);
    s->type = type;
    s->scope = scope;
    store_symbol(tab, s);
    return s;
}

void dump_namespace(Symbol * ns) {
    if(ns->kind == CLASS) {
        printf("<class %s>\n", ns->name);
        if(ns->table)
            dump_symbol_table(ns->table);
        printf("</class>\n");    
    } else if(ns->kind == NAMESPACE) {
        printf("<namespace %s>\n", ns->name);
        dump_symbol_table(ns->table);
        printf("</namespace>\n");    
    }
}

void dump_symbol_table(SymbolTable * tab) {
    Symbol * sym;
    int i;
    printf(" <symbol table>\n");
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
                            printf("\tmethod:  \"%s\"\n", sym->name);
                    break;
                case IDENTIFIER:
                            printf("\tid:      \"%s\"\n", sym->name);
                    break;
                case LITERAL:
                            printf("\tliteral: \"%s\"\n", sym->name);
                    break;
                case TYPE:  printf("\ttype:    \"%s\"\n", sym->name);
                            if(sym->table) {
                                if(sym->table == tab) {
                                    printf("Internal error, namespace->symbol table loop.\n");
                                    printf("Symbol [%s] contains loopback namespace.\n", sym->name);
                                    abort();
                                }
                                dump_namespace(sym);
                            }
                    break;
                default:    printf("unknown:   \"%s\"\n", sym->name);
                    break;
            }
        }
    }
    printf(" </symbol table>\n");
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
    if((t = lookup_symbol(table, name)) == NULL)
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
Symbol * pop_scope(SymbolTable * tab) {
    int i;
    Symbol * p = NULL;
    if(tab != NULL) {
        for(i = 0; i < HASH_SIZE; i++) {
            while(tab->table[i] && tab->table[i]->scope == scope) {
                Symbol * t;
#ifdef DEBUG
                printf("popping symbol %s: level %d\n", tab->table[i]->name, scope);
#endif
                t = tab->table[i];
                tab->table[i] = tab->table[i]->next;    
                t->next = p;
                p = t;
            }
        }
    }
    if(scope > 0)
        scope--;

    return p;
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

/* Take a list of identifiers and convert to a C string.
 * Examples:    System.Types.Foo
 */
char * symbol_to_str(Symbol * t) {
    int len;
    char buf[1024 * 2];
    len = sprintf(buf, "%s", t->name);
    for(t = t->tnext; t; t = t->tnext)
        len += sprintf(buf + len, ".%s", t->name);       
    return str_dup(buf);
}

